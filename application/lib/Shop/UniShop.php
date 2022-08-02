<?php

namespace application\lib\Shop;

use application\lib\Shop\Users\User;

use PDO;

/**
 * Класс магазина
 */
class UniShop
{
    public const ORDER_STATES = [
        'Новый',
        'Вопрос магазину',
        'Вопрос клиенту',
        'Согласован',
        'Комплектуется',
        'Скомплектован',
        'Передан на доставку',
        'Передан на выдачу',
        'Выполнен',
        'Возврат'
    ];
    /**
     * @property Объект PDO для подключения к БД
     */
    protected $pdo;

    /**
     * @see Categories
     */
    public $categories;

    /**
     * @see Properties
     */
    public $properties;

    /**
     * @see Products
     */
    public $products;

    /**
     * @see User
     */
    public $user;
    /**
     * @see Orders
     */
    public $orders;

    /**
     * @property Конструктор класса
     * @param PDO $pdo принимает объект подклюения PDO
     */


    function __construct(&$pdo)
    {
        $this->pdo = &$pdo;
        $this->user = new User($pdo);
        $user_id = $this->user->getUserId();
        $this->properties = new Properties($pdo, $user_id);
        $this->categories = new Categories($pdo, $user_id);
        $this->products = new Products($pdo, $user_id);
        $this->orders = new Orders($pdo, $user_id);
    }
    /**
     * @property Полная информация о товаре
     * @param int $id идентификатор товара
     * @return array|false Ассоциатиный массив с информацией о товаре | fasle в случае ошибочного id
     */
    public function AllAboutProduct($id)
    {
        $product = [];
        if ((int)$id) {
            $prod = $this->products->getAll($id);
            if ($prod) {
                $product['product'] = $prod;
            } else return false;
            $category = $this->categories->getDb($product['product']['category_id']);
            if ($category) {
                $product['category'] = $category;
            } else return false;
            $property_pointer = $this->properties->getPointers($category['properties_id']);
            if ($property_pointer) {
                $product['data_struct'] = json_decode($property_pointer['data_struct'], true);
                if ($samples = $this->properties->getPropertiesByField($property_pointer['name'], 'product_id', $id)) {
                    $product['samples'] = $samples;
                    return $product;
                }
            }
        }
        return false;
    }
    public function getCart()
    {
        $infos = [];
        $cart = $this->user->cart->getCart();
        //dd($cart);
        foreach ($cart as $cart_id => $cart_node) {
            $info = $this->AllAboutProduct($cart_node['product_id']);
            $info['product']['id'] = $cart_node['product_id'];
            $info['quantity'] = $cart_node['quantity'];

            unset($info['product']['description']);
            unset($info['data_struct']);

            $info['samples'] = [$cart_node['property_id'] => $info['samples'][$cart_node['property_id']]];
            $infos[$cart_id] = $info;
        }
        return $infos;
    }
    public function newOrder($user_id, $state, $info_method, $delivery_method, $delivery_time, $user_name, $phone, $email, $address, $apartment, $additions, $comment, $cart, $cost)
    {
        $fields = [];
        $exist = $this->user->findLogin($phone);
        if (empty($exist)) {
            $fields = [
                'user_name' => $user_name,
                'phone' => $phone,
                'email' => $email,
                'address' => $address,

                'apartment' => $apartment,
                'additions' => $additions,
                'temp' => 0,
                'orders' => 1,
            ];
        } else {
            $user_id = key($exist);
            $fields = [
                'orders' => current($exist)['orders'] + 1,
            ];
        }
        $this->user->update($user_id, $fields);
        //debug($exist);
        //$this->user->update($user_id);
        return $this->orders->newOrder($user_id, $state, $info_method, $delivery_method, $delivery_time, $user_name, $phone, $email, $address, $apartment, $additions, $comment, $cart, $cost);
    }
    public function getClients(bool $temp = false, $order = 'id', $ASC = 'ASC')
    {
        return $this->user->getAllUsers($temp, $order, $ASC);
    }
    public function changeProductQuantity($product_id, $property_id, $quantity, $set = 'ADD')
    {
        $product = $this->AllAboutProduct($product_id);
        $exquantity = $product['samples'][$property_id]['количество'];

        if ($set === 'ADD') {
            $quantity += $exquantity;
        }

        $this->properties->updateProperty($product['data_struct']['tname'], $property_id, ['количество' => $quantity]);
    }
    public function periodCart($start, $end)
    {
        $start = $this->pdo->quote($start);
        $end = $this->pdo->quote($end);

        $orders = $this->orders->getOrders("WHERE `state` = 'Выполнен' AND NOT `canceled` AND `changed_at` BETWEEN $start AND $end");
        $megacart = [];
        foreach ($orders as $order) {

            $cart = $order['cart'];

            foreach ($cart as $cart_node) {
                $product = $this->AllAboutProduct($cart_node['product_id']);
                $megacart[$cart_node['product_id']]['name'] = $product['product']['name'];
                // debug($product['data_struct']);
                $megacart[$cart_node['product_id']]['properties'][$cart_node['property_id']]['количество'] = $product['samples'][$cart_node['property_id']]['количество'];

                $megacart[$cart_node['product_id']]['properties'][$cart_node['property_id']]['quantity']
                    = isset($megacart[$cart_node['product_id']]['properties'][$cart_node['property_id']]['quantity']) ?
                    $megacart[$cart_node['product_id']]['properties'][$cart_node['property_id']]['quantity'] + $cart_node['quantity'] :
                    (float)$cart_node['quantity'];

                $megacart[$cart_node['product_id']]['properties'][$cart_node['property_id']]['type']
                    = $product['data_struct']['different'] === 'Вес' ? 'Вес ' .
                    $product['samples'][$cart_node['property_id']][$product['data_struct']['different']] . ' кг.' : $product['samples'][$cart_node['property_id']][$product['data_struct']['different']];

                $megacart[$cart_node['product_id']]['properties'][$cart_node['property_id']]['закупочная цена'] = $product['samples'][$cart_node['property_id']]['закупочная цена'];

                $megacart[$cart_node['product_id']]['properties'][$cart_node['property_id']]['цена'] = $product['samples'][$cart_node['property_id']]['цена'];
            }
        }
        return $megacart;
        // debug($orders);
    }

    public function newProductProperty($tname, $fields)
    {
        $ret = $this->properties->newProductProperty($tname, $fields);

        $product_id = $fields['product_id'];
        $product = $this->AllAboutProduct($product_id);

        $k = 0;
        $summ = 0;
        foreach ($product['samples'] as $sample) {
            $summ += $sample['цена'];
            $k++;
        }
        $average_price = $summ / $k;
        $this->products->update($product_id, ['average_price' => $average_price]);
        return $ret;
    }
    public function updateProperty($tname, $property_id, $fields)
    {
        $ret = $this->properties->updateProperty($tname, $property_id, $fields);
        $product_id = $fields['product_id'];
        $product = $this->AllAboutProduct($product_id);

        $k = 0;
        $summ = 0;
        foreach ($product['samples'] as $sample) {
            $summ += $sample['цена'];
            $k++;
        }
        $average_price = $summ / $k;
        $this->products->update($product_id, ['average_price' => $average_price]);
        return $ret;
    }
}
