<?php

namespace application\lib\User;

use application\lib\Db;
use PDO;

const SESSION_DEATH_TIME = (2 * 24 * 60 * 60); //2 дня

// const SESSION_DEATH_TIME = (1 * 60); //1 минута

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
        // dd(1);
        $exist = $this->db->fetAll("SELECT * FROM `users` WHERE `session_id`= :session_id", ['session_id' => session_id()]);
        if (empty($exist)) {

            $ip = $this->getUserIp();
            if ($ip == '127.0.0.1')
                $ip = '130.31.40.42';
            //$ip = $_SERVER['REMOTE_ADDR'];
            $geo = json_decode(@file_get_contents("http://www.geoplugin.net/json.gp?ip=" . $ip), 1);
            // dd($geo);
            if (empty($geo))
                $geo['geoplugin_countryCode'] = 'EN';
            // ddd($geo);
            $country = $geo['geoplugin_countryCode'];
            // dd($country);
            $q = "INSERT INTO `users` (`session_id`, `country`, `lang`, `role`) VALUES (:sess, :country, :lang, :roles)";
            $this->db->query($q, [
                ':sess' => session_id(),
                ':country' => $country,
                ':lang' => $country,
                ':roles' => 'guest',
            ]);
            $exist = $this->db->fetAll("SELECT * FROM `users` WHERE `session_id`= :sess", ['sess' => session_id()]);
            unset($_SESSION['admin']);
            $_SESSION[current($exist)['role']]['id'] = key($exist);
        } else {
            $id = key($exist);
            $this->db->query("UPDATE `users` SET `changed_at`= CURRENT_TIMESTAMP WHERE `id` = :id", ['id' => $id]);
            $exist[$id]['changed_at'] = date('Y-m-d H:i:s');
            unset($_SESSION['admin']);
            $_SESSION[current($exist)['role']]['id'] = $id;
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

            $this->db->query("UPDATE `users` SET `session_id` = NULL WHERE `id` = :user_id", ['user_id' => $user_id]);
        }
    }
    public function Login($post = [])
    {
        // dd($_SESSION);
        if (empty($post)) $post = $_POST;
        // ddd($post);
        $post['password'] = md5($post['password']);
        // ddd($post);
        $exist = $this->db->fetAllLite('users', "`email` = :email AND `password` = :pass", [
            ':email' => $post['email'],
            ':pass' => $post['password'],
        ]);
        // ddd($exist);
        // dd($exist);
        if (!empty($exist)) {
            // dd(current($exist)['role']);
            $id = key($exist);
            //debug($user_id);
            $this->db->query("DELETE FROM `users` WHERE `session_id` = :session_id AND `temp` = 1", ['session_id' => session_id()]);
            $this->db->query("UPDATE `users` SET `session_id` = :session_id WHERE `id` = :id", ['session_id' => session_id(), 'id' => $id]);
            // $_SESSION['authorize']['id'] = $id;
            $_SESSION[current($exist)['role']]['id'] = $id;
            $err[] = [
                'type' => 'success',
                'EN' => 'You have successfully logged in!',
                'RU' => 'Вы успешно вошли!'
            ];
            return $err;
        } else {
            $err[] = [
                'type' => 'danger',
                'EN' => 'User not found',
                'RU' => 'Пользователь не найден'
            ];
            return $err;
        }
    }

    /**
     * @param array $post ['поле'=>'значение']
     * @return array|alert
     */
    public function Register($post = [])
    {
        if (empty($post)) $post = $_POST;
        // dd($post);
        $err = [];
        $user_id = $this->getUserId();
        if (isset($post['id'])) {
            return [];
        }
        if ($post['email'] != 'yura.mezentsev@yandex.ru' or $post['password'] != 'Poilka170196)')
            $post['role'] = 'authorize';
        else $post['role'] = 'admin';

        $post['password'] = md5($post['password']);
        $exist = $this->db->fetAllLite('users', '(`email` = :email) AND (`password` IS NOT NULL)', [
            'email' => $post['email']
        ]);
        if (!empty($exist)) {
            $err[] = [
                'type' => 'warning',
                'RU' => 'Пользователь с таким email уже существует! Попробуйте войти или восстановить пароль.',
                'EN' => 'A user with such an email already exists! Try to log in or reset your password.',
            ];
            return $err;
        }
        $post['temp'] = 0;

        // dd($user_id);
        $dbs = $this->update($user_id, $post);
        // $this->session = $this->Session();
        // dd($dbs);
        if (!$dbs) {
            $err[] = [
                'type' => 'danger',
                'EN' => 'An error has occurred! Please try again!',
                'RU' => 'Произошла ошибка! Пожалуйста, попробуйте ещё раз!'
            ];
            return $err;
        }
        $_SESSION['authorize']['id'] = $user_id;
        $err[] = [
            'type' => 'success',
            'EN' => 'Registration was successful!',
            'RU' => 'Регистрация прошла успешно!'
        ];
        return $err;
    }
    public function Logout()
    {
        $this->db->query("UPDATE `users` SET `session_id` = NULL WHERE `id` = :id", ['id' => key($this->session)]);
        unset($_SESSION);
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
     * Идентификатор текущего пользователя
     * @return int $id
     */
    public function getUserId()
    {
        return (int)(key($this->session));
    }
    /**
     * обновить параметры пользователя
     * @param int $user_id
     * @param array $fields = ['field_name'=>'val']
     * @return PDO
     */
    public function update($user_id, $fields = [])
    {
        $id = (int)$user_id;
        // $user_id = $this->db->quote($user_id);
        $dbs = $this->db->update('users', $fields, '`id` = :uid', ['uid' => $user_id]);
        if ($dbs) {
            if (!empty($this->session[$id])) {
                foreach ($fields as $field_name => $value) {
                    $this->session[$id][$field_name] = $value;
                    if ($field_name == 'id') {
                        $this->session[(int)$value] = $this->session[$id];
                        unset($this->session[$id]);
                        $id = (int)$value;
                    }
                }
            }
        }
        return $dbs;
    }
    public function findLogin($login)
    {
        return $this->db->fetAll("SELECT * FROM `users` WHERE `phone` = :phone OR `email` = :email", ['phone' => $login, 'email' => $login]);
    }
    /**
     * Получить список пользователей
     *
     * @param boolean $temp 
     * @param string $order
     * @param string $ASC
     * @return void
     */
    public function getAllUsers($temp = false, $order = 'id', $ASC = 'ASC')
    {
        $where = $temp ? 'WHERE `temp`' : 'WHERE NOT `temp`';
        $q = "SELECT * FROM `users` $where ORDER BY `$order` $ASC";
        //TODO SECURITY
        return $this->db->fetAll($q);
    }
}
