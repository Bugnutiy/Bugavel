<?php

namespace application\controllers;


use application\core\View;
use application\core\Controller;
use application\core\Model;

// use application\lib\Db;


class ShopController extends Controller
{
    function __construct($route)
    {
        parent::__construct($route);
        $default_vars = [
            'categories' => $this->model->categories,
            'products' => $this->model->products,
            'properties' => $this->model->properties,
            'shop' => $this->model->shop
        ];

        $this->view = new View($route, $default_vars);
    }
    public function mainPageAction()
    {
        $this->view->render('Главная страница');
    }
    public function catalogAction()
    {
        $vars = [];
        if (!empty($_GET['category_id'])) {
            $products = $this->model->catalog();
            //debug($products);
            $vars = ['products' => $products];
            $this->view->render('Каталог', $vars);
        } else View::redirect("/");
    }
    public function productAction()
    {
        $cart_answer = [];
        if (!empty($_POST)) {
            $cart_answer = $this->model->addCart();
        }
        if (!empty($_GET['id'])) {
            $product_id = $_GET['id'];
            $product = $this->model->shop->AllAboutProduct($product_id);
            //debug($product);
            //$breadcrumbs = $this->model->shop->categories->breadcrumbs_array($product['product']['category_id']);
            //debug($breadcrumbs);
            $vars = [
                'product' => $product,
                'category_id' => $product['product']['category_id'],
                'cart_answer' => $cart_answer,
            ];
            $this->view->render($product['product']['name'], $vars);
        } else {
            View::redirect(isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : '/');
        }
    }
    public function cartAction()
    {
        if (!empty($_GET['del'])) {
            $this->model->shop->user->cart->remove($_GET['del']);
        }
        $vars = [
            'cart' => $this->model->shop->getCart(),
        ];
        $this->view->render("Корзина", $vars);
    }
    // public $pdo;
    public function cartChangeQuantityAction()
    {
        if (!empty($_POST)) {
            // $this->pdo = $this->model->db->getPDO();
            // $str = ddstr($_POST);
            // $str = $this->pdo->quote($str);
            // $this->model->db->quer("INSERT INTO `test` ( `text` ) VALUES ( $str )");

            if (!empty($_POST['cart_id']) and !empty($_POST['quantity'])) {
                $this->model->shop->user->cart->changeQuantity($_POST['cart_id'], $_POST['quantity']);
            }
        }
    }
    public function newOrderAction()
    {
        if (!empty($_POST)) {

            $this->view->render('Заказ', ['order' => $this->model->newOrderForm()]);
        }
    }
}
