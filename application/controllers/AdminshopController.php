<?php

namespace application\controllers;


use application\core\View;
use application\core\Controller;
// use application\lib\Db;


class AdminShopController extends Controller
{
    function __construct($route)
    {
        parent::__construct($route);
        $this->view->layout = 'admin';
        // dd(123);
    }
    public function mainpageAction()
    {
        $this->view->render('Админка');
    }
    /***************************************Свойства*******************************************/
    public function propertiesAction()
    {
        $vars = [
            'properties' => $this->model->properties->getPointers(),
        ];
        $this->view->render("Свойства", $vars);
    }
    public function propertiesAddAction()
    {
        $this->view->render('Добавить свойства');
    }
    public function propertiesAddFormAction()
    {
        //debug($_POST);
        //dd($_POST);
        if (empty($this->model->properties_form_to_new())) {
            View::redirect('/admin/properties');
        }
    }
    public function propertiesDeleteAction()
    {
        if (!empty($_GET)) {
            if (!empty($_POST['Delete'])) {
                $this->model->properties_delete($_GET['id']);
                View::redirect('/admin/properties');
            } else {
                if (!empty($_GET['id']))
                    $vars = [
                        'id' => $_GET['id'],
                        'property' => $this->model->properties->getPointers($_GET['id']),
                    ];
                $this->view->render('Подтверждение', $vars);
            }
        }
    }
    public function propertiesChangeAction()
    {
        debug($_GET);
    }
    public function propertiesChangeFormAction()
    {
    }
    /***************************************Категории*******************************************/
    public function categoriesAction()
    {
        $vars = [
            "categories" => $this->model->categories->getDb(),
            "properties" => $this->model->properties->getPointers(),
        ];
        $this->view->render('Категории', $vars);
    }
    public function categoriesAddAction()
    {
        $vars = [
            "categories" => $this->model->categories->getDb(),
            "properties" => $this->model->properties->getPointers(),
        ];
        $this->view->render('Добавить категории', $vars);
    }
    public function categoriesAddFormAction()
    {
        if (!empty($_POST)) {
            //dd($this->model->addCategory());
            if ($this->model->addCategory()) {
                View::redirect('/admin/categories');
            } else {
                echo "Ошибка!";
            }
        }
    }
    public function categoriesDeleteAction()
    {
        if (!empty($_GET)) {
            if (!empty($_POST['Delete'])) {
                $this->model->categories_delete($_GET['id']);
                View::redirect('/admin/categories');
            } else {
                if (!empty($_GET['id']))
                    $vars = [
                        'id' => $_GET['id'],
                        'category' => $this->model->categories->getDb()[$_GET['id']],
                    ];
                $this->view->render('Подтверждение', $vars);
            }
        }
    }
    /***************************************Товары*******************************************/
    public function productsAction()
    {
        $vars = [
            "products" => $this->model->products->getAll(),
            "categories" => $this->model->categories->getDb(),
            //"properties" => $this->model->properties->getPointers(),
        ];
        $this->view->render('Товары', $vars);
    }
    public function productsAddAction()
    {
        $vars = [
            "categories" => $this->model->categories->getDb(),
            "properties" => $this->model->properties->getPointers(),
        ];
        $this->view->render('Добавить товар', $vars);
    }
    public function productsAddFormAction()
    {
        if (!empty($_POST)) {
            if (empty($this->model->addProduct())) {
                View::redirect('/admin/products');
            }
        }
    }
    public function productsDeleteAction()
    {
        if (!empty($_GET)) {
            if (!empty($_POST['Delete'])) {
                $this->model->product_delete($_GET['id']);
                View::redirect('/admin/products');
            } else {
                if (!empty($_GET['id']))
                    $vars = [
                        'id' => $_GET['id'],
                        'product' => $this->model->products->getAllByField('id', $_GET['id'])[$_GET['id']],
                    ];
                $this->view->render('Подтверждение', $vars);
            }
        }
    }
    public function productsChangeAction()
    {
        if (!empty($_GET['id'])) {

            $product = $this->model->products->getAllByField('id', $_GET['id'])[$_GET['id']];
            $category = $this->model->categories->getDb($product['category_id']);
            $properties_pointer = $this->model->properties->getPointers($category['properties_id']);
            $properties = $this->model->properties->getPropertiesByField($properties_pointer['name'], 'product_id', $_GET['id']);

            $vars = [
                'product_id' => $_GET['id'],
                'product' => $product,
                'properties_pointer' => $properties_pointer,
                'properties' => $properties,
                'category' => $category,
            ];
            $this->view->render('Редактирование товара', $vars);
        } else {
            View::redirect('/admin/products');
        }
    }
    public function productsChangePropertyAction()
    {
        if (!empty($_GET['product_id'])) {
            $product = $this->model->products->getAllByField('id', $_GET['product_id'])[$_GET['product_id']];
            $category = $this->model->categories->getDb($product['category_id']);
            $properties_pointer = $this->model->properties->getPointers($category['properties_id']);
            //$properties = $this->model->properties->getPropertiesByField($properties_pointer['name'], 'product_id', $_GET['product_id']);
            $add = 1;
            $property = [];
            if (!empty($_GET['property_id'])) {
                $property = $this->model->properties->getPropertiesByField($properties_pointer['name'], 'id', $_GET['property_id']);
                $add = 0;
                //debug($property);
            } else {
                $product = $this->model->shop->AllAboutProduct($_GET['product_id']);
                if ($product) {
                    $property = $product['samples'];
                } else $property = '';
                //debug($property);
            }
            $vars = [
                'add' => $add,
                'product' => $product,
                'category' => $category,
                'properties_pointer' => $properties_pointer,
                'property' => $property,
            ];
            $this->view->render('Добавление свойства', $vars);
        }
    }
    public function productsChangePropertyFormAction()
    {
        if (!empty($_POST)) {
            //debug($_POST);
            $this->model->addProductProperty();
            View::redirect('/admin/products/change?id=' . $_POST['fields']['product_id']);
        } else
            View::redirect('/admin/products');
    }
    public function productsChangePropertyDeleteAction()
    {
        // dd($_GET);
        $this->model->properties->deleteProperty($_GET['tname'], $_GET['id']);
        View::redirect(isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : '/admin');
    }
    ///////////////////////////////////////////Заказы///////////////////////////////////////////
    public function ordersAction()
    {
        $vars = [
            'shop' => $this->model->shop,
            'orders' => $this->model->getOrders()
        ];

        $this->view->render("Заказы", $vars);
    }
    public function orderviewAction()
    {
        if (!empty($_GET['id'])) {
            if (!empty($_POST['state'])) {
                // debug($_POST);
                $order = $this->model->shop->orders->getOrderById($_POST['order_id']);
                //debug($order);
                if (($order['state'] === 'Новый' or $order['state'] === 'Вопрос магазину' or $order['state'] === 'Вопрос клиенту') and ($_POST['state']['state'] !== 'Новый' and $_POST['state']['state'] !== 'Вопрос магазину' and $_POST['state']['state'] !== 'Вопрос клиенту')) {

                    foreach ($order['cart'] as $cart_node) {
                        $this->model->shop->changeProductQuantity($cart_node['product_id'], $cart_node['property_id'], -$cart_node['quantity']);
                    }
                }
                if (($order['state'] !== 'Новый' and $order['state'] !== 'Вопрос магазину' and $order['state'] !== 'Вопрос клиенту') and ($_POST['state']['state'] === 'Новый' or $_POST['state']['state'] === 'Вопрос магазину' or $_POST['state']['state'] === 'Вопрос клиенту')) {

                    foreach ($order['cart'] as $cart_node) {
                        $this->model->shop->changeProductQuantity($cart_node['product_id'], $cart_node['property_id'], $cart_node['quantity']);
                    }
                }

                if (empty($_POST['state']['cancel'])) {
                    $_POST['state']['cancel'] = 0;
                    $order = $this->model->shop->orders->getOrderById($_GET['id']);
                    if ($order['canceled'] and $order['state'] !== 'Новый' and $order['state'] !== 'Вопрос магазину' and $order['state'] !== 'Вопрос клиенту') {
                        foreach ($order['cart'] as $cart_node) {
                            $this->model->shop->changeProductQuantity($cart_node['product_id'], $cart_node['property_id'], -$cart_node['quantity']);
                        }
                    }
                } else {
                    $_POST['state']['cancel'] = 1;
                    $order = $this->model->shop->orders->getOrderById($_GET['id']);
                    if (!$order['canceled'] and $order['state'] !== 'Новый' and $order['state'] !== 'Вопрос магазину' and $order['state'] !== 'Вопрос клиенту') {
                        foreach ($order['cart'] as $cart_node) {
                            $this->model->shop->changeProductQuantity($cart_node['product_id'], $cart_node['property_id'], $cart_node['quantity']);
                        }
                    }
                }

                if (empty($_POST['state']['payment_state']))
                    $_POST['state']['payment_state'] = 0;
                else $_POST['state']['payment_state'] = 1;



                $this->model->shop->orders->changeState($_POST['order_id'], $_POST['state']['state'], $_POST['state']['payment_state'], $_POST['state']['cancel']);
            }
            if (!empty($_POST['user'])) {
                // debug($_POST);
                $this->model->shop->orders->change($_POST['order_id'], $_POST['user']);
            }
            if (!empty($_POST['cart'])) {
                if (!empty($_POST['submit'])) {
                    $cost = 0;
                    $cart = $this->model->shop->orders->orderCartUpdate($_POST['order_id'], $_POST['submit'], $_POST['cart'][$_POST['submit']]);
                    // debug($_POST['cart']);
                    foreach ($cart as $cart_node) {
                        $price = $this->model->shop->AllAboutProduct($cart_node['product_id'])['samples'][$cart_node['property_id']]['цена'];
                        $quantity = $cart_node['quantity'];
                        //debug($quantity);
                        $cost += $price * $quantity;
                    }
                    //debug($cart);
                    $cost = number_format($cost, '2', '.', '');
                    //debug($cost);
                    $this->model->shop->orders->change($_POST['order_id'], ['cost' => $cost]);
                } else {
                    //debug($_POST);
                    $cost = 0;
                    $cart = $this->model->shop->orders->orderCartDelete($_POST['order_id'], $_POST['delete']);

                    foreach ($cart as $cart_node) {
                        $price = $this->model->shop->AllAboutProduct($cart_node['product_id'])['samples'][$cart_node['property_id']]['цена'];
                        $quantity = $cart_node['quantity'];
                        //debug($quantity);
                        $cost += $price * $quantity;
                    }
                    $cost = number_format($cost, '2', '.', '');
                    $this->model->shop->orders->change($_POST['order_id'], ['cost' => $cost]);
                }
            }

            $vars = [
                'shop' => $this->model->shop,
                'order' => $this->model->shop->orders->getOrderById($_GET['id'])
            ];
            $this->view->render('Заказ', $vars);
        } else View::redirect('/admin/orders');
    }
    ///////////////////////////////////////////\Заказы\///////////////////////////////////////////

    ///////////////////////////////////////////Клиенты///////////////////////////////////////////
    public function clientsAction()
    {
        $order = 'id';
        $direct = 'ASC';
        if (!empty($_GET)) {
            //debug($_GET);
            $order = $_GET['order'];
            $direct = $_GET['direct'];
        }
        $vars = [
            'clients' => $this->model->shop->getClients(false, $order, $direct)
        ];
        $this->view->render('Пользователи', $vars);
    }
    ///////////////////////////////////////////\Клиенты\///////////////////////////////////////////
    ///////////////////////////////////////////Учет продаж///////////////////////////////////////////
    public function sales_accAction()
    {
        $vars = [];
        if (!empty($_POST['start']) and !empty($_POST['end'])) {
            //debug($_POST);
            $vars = ['megacart' => $this->model->shop->periodCart($_POST['start'], $_POST['end'])];
        }

        $this->view->render('Учёт продаж', $vars);
    }
    ///////////////////////////////////////////\Учет продаж\///////////////////////////////////////////


}
