<?php

namespace application\lib\User;

use application\lib\Db;
use PDO;

//const SESSION_DEATH_TIME = (2 * 24 * 60 * 60); //2 дня

const SESSION_DEATH_TIME = (1 * 60); //1 минута

class User
{
    /**
     * @var array Содержит в себе информацию о пользователе
     */
    protected $session;
    /**
     * @var Db
     */
    protected $db;

    function __Construct(&$db)
    {
        $this->db = &$db;
        $this->session = $this->Session();
        $this->RemoveOld();
        $_COOKIE['user'] = $this->session;
    }
    protected function getUserIp()
    {
        $keys = [
            'HTTP_CLIENT_IP',
            'HTTP_X_FORWARDED_FOR',
            'REMOTE_ADDR'
        ];
        foreach ($keys as $key) {
            if (!empty($_SERVER[$key])) {
                // ddd($key);
                // dd($_SERVER[$key]);
                $addr = explode(',', $_SERVER[$key]);
                $ip = trim(end($addr));
                if (filter_var($ip, FILTER_VALIDATE_IP)) {
                    return $ip;
                }
            }
        }
    }
    protected function Session()
    {

        $exist = $this->db->fetAll("SELECT * FROM `users` WHERE `session_id`= :session_id", ['session_id' => session_id()]);

        if (empty($exist)) {
            $ip = $this->getUserIp();
            if ($ip == '127.0.0.1')
                $ip = '176.101.14.187'; //todo
            //$ip = $_SERVER['REMOTE_ADDR'];
            $geo = json_decode(file_get_contents("http://www.geoplugin.net/json.gp?ip=" . $ip), 1);
            // ddd($geo);
            $country = $geo['geoplugin_countryCode'];
            $q = "INSERT INTO `users` (`session_id`, `country`, `lang`) VALUES (:sess, :country, :lang)";
            $this->db->query($q, [':sess' => session_id(), ':country' => $country, 'lang' => $country]);
            $exist = $this->db->fetAll("SELECT * FROM `users` WHERE `session_id`= :sess", ['sess' => session_id()]);
        } else {
            $id = key($exist);
            $this->db->query("UPDATE `users` SET `changed_at`= CURRENT_TIMESTAMP WHERE `id`=:id", ['id' => $id]);
            $exist[$id]['changed_at'] = date('Y-m-d H:i:s');
        }
        //debug($exist);
        return $exist;
    }
    /**
     * Очищает давно не заходивших временных пользователей делает Logout всем остальным
     */
    protected function RemoveOld()
    {
        $death_line = date('Y-m-d H:i:s', time() - SESSION_DEATH_TIME);
        //debug($death_line);
        $dead = $this->db->fetAll("SELECT * FROM `users` WHERE `changed_at` <= :deathline AND `temp`", ['deathline' => $death_line]);
        //dd($dead);
        foreach ($dead as $user_id => $value) {
            // debug($id);
            //dd($id);
            //dd($user_id);
            $this->db->query("DELETE FROM `cart` WHERE `user_id` = :user_id", ['user_id' => $user_id]);
            $this->db->query("DELETE FROM `users` WHERE `id` = :user_id", ['user_id' => $user_id]);
        }

        $logout = $this->db->fetAll("SELECT * FROM `users` WHERE `changed_at` <= :deathline AND `temp` = 0", ['deathline' => $death_line]);
        foreach ($logout as $user_id => $value) {
            // debug($id);
            //dd($id);
            //dd($user_id);
            // $this->db->query("DELETE FROM `cart` WHERE `user_id` = :user_id", ['user_id' => $user_id]);
            $this->db->query("UPDATE `users` SET `session_id` = NULL WHERE `id` = :user_id", ['user_id' => $user_id]);
        }
    }
    public function Login($phone, $email, $password)
    {
        $password = md5($password);

        $exist = $this->db->fetAll("SELECT * FROM `users` WHERE (`phone` = :phone OR `email` = :email) AND `password` = :pass", [
            ':phone' => $phone,
            ':email' => $email,
            ':pass' => $password,
        ]);
        //debug($exist);
        if (!empty($exist)) {
            $id = key($exist);
            //debug($user_id);
            $this->db->query("DELETE FROM `users` WHERE `session_id` = :session_id AND `temp` = 1", ['session_id' => session_id()]);
            $this->db->query("UPDATE `users` SET `session_id` = :session_id WHERE `id` = :id", ['session_id' => session_id(), 'id' => $id]);
            $_SESSION['authorize']['id'] = $id;
            return true;
        } else
            return false;
    }

    /**
     * @return false|1|0
     */
    public function Register($user_name, $phone, $email, $password, $address, $apartment, $additions)
    {
        $user_id = $this->getUserId();
        $password = md5($password);
        $exist = $this->db->fetAll("SELECT * FROM `users` WHERE ( `phone` = :phone OR `email` = :email ) AND `password` IS NOT NULL", [
            'phone' => $phone,
            'email' => $email
        ]);
        //debug($exist);
        if (!empty($exist)) {
            return false;
        }

        $_SESSION['authorize']['id'] = $user_id;

        return $this->db->query("UPDATE `users` SET `user_name` = :user_name, `phone` = :phone, `email` = :email, `address` = :address, `apartment` = :apartment, `additions` = :additions, `password` = :password, `temp` = '0' WHERE `id` = :user_id", [
            'user_name' => $user_name,
            'phone' => $phone,
            'email' => $email,
            'address' => $address,
            'apartment' => $apartment,
            'additions' => $additions,
            'password' => $password,
            'user_id' => $user_id
        ])->rowCount();
    }
    public function Logout()
    {
        $this->db->query("UPDATE `users` SET `session_id` = NULL WHERE `id` = :id", ['id' => key($this->session)]);
    }

    /**
     * Текущая сессия
     * @param NULL|int $id Идентификатор пользователя
     * @return array $this->session
     */
    public function getUser($id = '')
    {
        if (empty($id)) {
            return $this->session;
        }
        if ($id !== key($this->session)) {
            return $this->db->fetAll("SELECT * FROM `users` WHERE `id`= :id", ['id' => $id]);
        }
        return $this->session;
    }

    /**
     * @method Идентификатор пользователя
     * @return int $id
     */
    public function getUserId()
    {
        return (int)(key($this->session));
    }
    /**
     * @param int $user_id
     * @param array $fields = ['field_name'=>'val']
     */
    public function update($user_id, $fields = [])
    {
        $id=(int)$user_id;
        $user_id = $this->db->quote($user_id);
        $dbs = $this->db->update('users', $fields, '`id` = ' . $user_id);
        if ($dbs) {
            foreach ($fields as $key => $value) {
                // dd($this->session[$id]);
                if (!empty($this->session[$id])) {
                    // dd($this->session);
                    $this->session[$id][$key] = $value;
                }
            }
        }
        return $dbs;
    }
    public function findLogin($login)
    {
        return $this->db->fetAll("SELECT * FROM `users` WHERE `phone` = :phone OR `email` = :email", ['phone' => $login, 'email' => $login]);
    }
    public function getAllUsers(bool $temp = false, $order = 'id', $ASC = 'ASC')
    {
        $where = $temp ? 'WHERE `temp`' : 'WHERE NOT `temp`';
        $q = "SELECT * FROM `users` $where ORDER BY `$order` $ASC";
        return $this->db->fetAll($q);
    }
}
