<?php

namespace application\models;

use application\core\Model;
use application\lib\Shop\UniShop;

class Auth extends Model
{
    /**
     * @see UniShop
     */
    public $shop;

    /**
     * @see UniShop::$categories
     */
    public $categories;

    /**
     * @see UniShop::$properties
     */
    public $properties;

    /**
     * @see UniShop::$products
     */
    public $products;

    function __construct()
    {
        parent::__construct();
        $pdo = $this->db->getPDO();
        $this->shop = new UniShop($pdo);
    }
    public function registerUser()
    {
        return $this->shop->user->Register($_POST['user_name'], $_POST['phone'], $_POST['email'], $_POST['password'], $_POST['address'], $_POST['apartment'], $_POST['additions']);
    }
    public function Login()
    {
        //debug($_POST);
        return $this->shop->user->Login($_POST['login'][0], $_POST['login'][1], $_POST['password']);
    }
}
