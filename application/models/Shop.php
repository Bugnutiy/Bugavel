<?php

namespace application\models;

use application\core\Model;
use application\lib\Shop\UniShop;

class Shop extends Model
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
        $this->properties = $this->shop->properties;
        $this->categories = $this->shop->categories;
        $this->products = $this->shop->products;
    }
    /**
     * @property добавлям товар в корзину
     * @return true|false 
     */
    public function addCart()
    {
        //debug($_POST);
        if (!empty($_POST)) {
            if (isset($_POST['product_id']))
                $product_id = $_POST['product_id'];
            else return false;
            if (isset($_POST['property_id']))
                $property_id = $_POST['property_id'];
            else return false;
            if (isset($_POST['quantity'][$property_id]))
                $quantity = $_POST['quantity'][$property_id];
            else return false;
            return $this->shop->user->cart->add($product_id, $property_id, $quantity);
        }
        return false;
    }
    public function newOrderForm()
    {
        //debug($_POST);

        $cart = $this->shop->user->cart->getCart();
        if (!empty($cart)) {
            $cost = 0;
            $allCart = $this->shop->getCart();
            foreach ($allCart as $cart_id => $cart_node) {
                $price = current($cart_node['samples'])['цена'];
                $quant = $cart_node['quantity'];
                $cost += $quant * $price;
            }
            $cart = json_encode($cart, JSON_UNESCAPED_UNICODE);
            $cost = number_format($cost, '2', '.', '');
            //debug($cost);
            $this->shop->user->cart->deleteCartByUserId();
            return $this->shop->newOrder($this->shop->user->getUserId(), 'Новый', $_POST['info_method'], $_POST['delivery_method'], $_POST['delivery_time'], $_POST['user_name'], $_POST['phone'], $_POST['email'], $_POST['address'], $_POST['apartment'], $_POST['additions'], $_POST['comment'], $cart, $cost);
        }
        return false;
    }
    public function catalog()
    {
        $products = [];
        if (empty($_GET['sort'])) {
            $products = $this->shop->products->getAllByField('category_id', $_GET['category_id']);
        } else {
            $sort = $_GET['sort'];
            $asc = $_GET['ASC'];
            $products = $this->shop->products->getAllByField('category_id', $_GET['category_id'], "ORDER BY `$sort` $asc");
        }
        return $products;
    }
}
