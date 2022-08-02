<?php

namespace application\lib\Shop\Users;

use application\lib\Shop\Users\Cart;

use PDO;

const SESSION_DEATH_TIME = (2 * 24 * 60 * 60); //2 дня

//const SESSION_DEATH_TIME = (1 * 60); //1 минута
const USERS_FIELDS = [
    //'id' => [],
    'session_id' => [],

    'firstname' => [],
    'secondname' => [],
    'phone' => [],
    'mail' => [],
    'address' => [],
    'password' => [],

    'role' => [],

    'temp',
];
class User
{
    /**
     *@see PDO
     */
    protected $pdo;
    /**
     * @var array Содержит в себе информацию о пользователе
     */
    protected $session;

    /**
     * @see Cart
     */
    public $cart;

    /**
     * 
     */
    public $orders;
    protected $user_id;

    function __Construct(&$pdo)
    {
        $this->pdo = &$pdo;
        $this->session = $this->Session();
        $this->user_id = key($this->session);
        // dd(SESSION_DEATH_TIME);
        $this->cart = new Cart($this->pdo, $this->user_id);

        $this->RemoveOld();
    }
    protected function query($sql, $params = [])
    {
        if (!stristr($sql, 'SELECT')) {
            $user_id = '';
            if (!empty($this->user_id))
                $user_id = $this->user_id;
            $user_id = $this->pdo->quote($user_id);
            $query = $this->pdo->quote($sql);

            $log = $this->pdo->prepare("INSERT INTO `log` ( `user_id`, `query` ) VALUES ( $user_id, $query )");
            $log->execute();
        }

        $stmt = $this->pdo->prepare($sql);
        //if($sql!="SET NAMES 'utf8'")
        //$this->query("SET NAMES 'utf8'");
        //$query = $this->db->query($sql); //prepare заменил query
        if (!empty($params)) {
            foreach ($params as $key => $val) {
                $stmt->bindValue(':' . $key, $val);
            }
        }
        $stmt->execute();
        return $stmt;
        //return $query;
    }
    protected function Session()
    {
        $session_id = $this->pdo->quote(session_id());
        $exist = $this->query("SELECT * FROM `users` WHERE `session_id`= $session_id")->fetchAll(PDO::FETCH_ASSOC | PDO::FETCH_UNIQUE);

        if (empty($exist)) {
            $this->query("INSERT INTO `users` (`session_id`) VALUES ($session_id)");
            $exist = $this->query("SELECT * FROM `users` WHERE `session_id`= $session_id")->fetchAll(PDO::FETCH_ASSOC | PDO::FETCH_UNIQUE);
        } else {
            $id = $this->pdo->quote(key($exist));
            $this->query("UPDATE `users` SET `changed_at`= CURRENT_TIMESTAMP WHERE `id`=$id");
            $exist[key($exist)]['changed_at'] = date('Y-m-d H:i:s');
        }
        //debug($exist);
        return $exist;
    }
    protected function RemoveOld()
    {
        $death_line = $this->pdo->quote(date('Y-m-d H:i:s', time() - SESSION_DEATH_TIME));
        //debug($death_line);
        $dead = $this->query("SELECT * FROM `users` WHERE `changed_at` <= $death_line AND `temp`")->fetchAll(PDO::FETCH_ASSOC | PDO::FETCH_UNIQUE);
        //debug($dead);
        foreach ($dead as $user_id => $value) {
            // debug($id);
            //dd($id);
            //dd($user_id);
            $this->cart->deleteCartByUserId($user_id);
            $this->query("DELETE FROM `users` WHERE `id` = '$user_id'");
        }
    }
    public function Login($phone, $email, $password)
    {
        $phone = $this->pdo->quote($phone);
        $email = $this->pdo->quote($email);
        $password = md5($password);
        $password = $this->pdo->quote($password);

        $exist = $this->query("SELECT * FROM `users` WHERE (`phone` = $phone OR `email` = $email) AND `password` = $password")->fetchAll(PDO::FETCH_ASSOC | PDO::FETCH_UNIQUE);
        //debug($exist);
        if (!empty($exist)) {
            $session_id = $this->pdo->quote(session_id());
            $user_id = $this->pdo->quote($this->getUserId());

            $id = key($exist);
            //debug($user_id);
            $this->query("DELETE FROM `users` WHERE `session_id` = $session_id AND `temp` = 1");
            $this->query("UPDATE `users` SET `session_id` = $session_id WHERE `id` = $id");
            $_SESSION['authorize']['id'] = $id;
            return true;
        } else
            return false;
    }
    public function Register($user_name, $phone, $email, $password, $address, $apartment, $additions)
    {

        $user_id = $this->pdo->quote($this->getUserId());

        $user_name = $this->pdo->quote($user_name);
        $phone = $this->pdo->quote($phone);
        $email = $this->pdo->quote($email);

        $password = md5($password);
        //debug($password);
        $password = $this->pdo->quote($password);
        $address = $this->pdo->quote($address);
        $apartment = $this->pdo->quote($apartment);
        $additions = $this->pdo->quote($additions);

        $exist = $this->query("SELECT * FROM `users` WHERE ( `phone` = $phone OR `email` = $email ) AND `password` IS NOT NULL")->fetchAll(PDO::FETCH_ASSOC | PDO::FETCH_UNIQUE);
        //debug($exist);
        if (!empty($exist)) {
            return false;
        }

        $_SESSION['authorize']['id'] = $user_id;

        return $this->query("UPDATE `users` SET `user_name` = $user_name, `phone` = $phone, `email` = $email, `address` = $address, `apartment` = $apartment, `additions` = $additions, `password` = $password, `temp` = '0' WHERE `id` = $user_id");
    }
    public function Logout()
    {
        # code...
    }

    /**
     * @property Текущая сессия
     * @return array $this->session
     */
    public function getUser($id = '')
    {
        if (empty($id))
            return $this->session;
        if ($id !== $this->user_id) {
            $id = $this->pdo->quote($id);
            return $this->query("SELECT * FROM `users` WHERE `id`= $id")->fetchAll(PDO::FETCH_ASSOC | PDO::FETCH_UNIQUE);
        }
        return $this->session;
    }

    /**
     * @property Идентификатор пользователя
     * @return int $id
     */
    public function getUserId()
    {
        return $this->user_id;
    }
    /**
     * @param int $user_id
     * @param array $fields = ['field_name'=>'val']
     */
    public function update($user_id, $fields = [])
    {
        //debug($fields);
        $user_id = $this->pdo->quote($user_id);
        $set = '';
        foreach ($fields as $field_name => $field_val) {
            $field_val = $this->pdo->quote($field_val);
            $set .= "`$field_name` = $field_val, ";
        }
        $set = rtrim($set, ', ');
        //debug($set);
        return $this->query("UPDATE `users` SET $set WHERE `id` = $user_id");
    }
    public function findLogin($login)
    {

        $login = $this->pdo->quote($login);
        return $this->query("SELECT * FROM `users` WHERE `phone` = $login OR `email` = $login")->fetchAll(PDO::FETCH_ASSOC | PDO::FETCH_UNIQUE);
    }
    public function getAllUsers(bool $temp = false, $order = 'id', $ASC = 'ASC')
    {
        $where = $temp ? 'WHERE `temp`' : 'WHERE NOT `temp`';
        $q = "SELECT * FROM `users` $where ORDER BY `$order` $ASC";
        // debug($q);
        return $this->query($q)->fetchAll(PDO::FETCH_ASSOC | PDO::FETCH_UNIQUE);
    }
}
