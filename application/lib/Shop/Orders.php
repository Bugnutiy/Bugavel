<?php

namespace application\lib\Shop;

use PDO;

/**
 * Класс для управления заказами
 */
class Orders
{
    /**
     * @see PDO
     */
    protected $pdo;
    protected $user_id;

    /**
     * Class constructor.
     */
    function __construct(&$pdo, $user_id)
    {
        $this->pdo = &$pdo;
        $this->user_id = $user_id;
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

        // $log = $this->pdo->prepare("INSERT INTO `history` ( `user_id`, `query` ) VALUES ( '', '' )");
        // $log->execute();
        $stmt = $this->pdo->prepare($sql);

        if (!empty($params)) {
            foreach ($params as $key => $val) {
                $stmt->bindValue(':' . $key, $val);
            }
        }
        $stmt->execute();
        return $stmt;
    }
    public function newOrder($user_id, $state, $info_method, $delivery_method, $delivery_time, $user_name, $phone, $email, $address, $apartment, $additions, $comment, $cart, $cost)
    {
        $user_id = $this->pdo->quote($user_id);
        $state = $this->pdo->quote($state);
        $info_method = $this->pdo->quote($info_method);
        $delivery_method = $this->pdo->quote($delivery_method);
        $delivery_time = $this->pdo->quote($delivery_time);
        $user_name = $this->pdo->quote($user_name);
        $phone = $this->pdo->quote($phone);
        $email = $this->pdo->quote($email);
        $address = $this->pdo->quote($address);
        $apartment = $this->pdo->quote($apartment);
        $additions = $this->pdo->quote($additions);
        $comment = $this->pdo->quote($comment);
        $cart = $this->pdo->quote($cart);
        $cost = $this->pdo->quote($cost);

        return $this->query("INSERT INTO `orders` ( `user_id`, `state`, `info_method`, `delivery_method`, `delivery_time`, `user_name`, `phone`, `email`, `address`, `apartment`, `additions`, `comment`, `cart`, `cost` ) VALUES ( $user_id, $state, $info_method, $delivery_method, $delivery_time, $user_name, $phone, $email, $address, $apartment, $additions, $comment, $cart, $cost )");
    }
    public function getOrders($additions = '')
    {
        if (empty($additions)) {
            $arr = $this->query("SELECT * FROM `orders` ORDER BY `changed_at` DESC")->fetchAll(PDO::FETCH_ASSOC | PDO::FETCH_UNIQUE);
            foreach ($arr as $key => $node) {
                $arr[$key]['cart'] = json_decode($node['cart'], true);
            }
            return $arr;
        } else {
            $arr = $this->query("SELECT * FROM `orders` $additions ORDER BY `changed_at` DESC")->fetchAll(PDO::FETCH_ASSOC | PDO::FETCH_UNIQUE);
            foreach ($arr as $key => $node) {
                $arr[$key]['cart'] = json_decode($node['cart'], true);
            }
            return $arr;
        }
    }
    public function getOrderById($id)
    {
        $id = $this->pdo->quote($id);
        $arr = current($this->query("SELECT * FROM `orders` WHERE `id` = $id")->fetchAll(PDO::FETCH_ASSOC | PDO::FETCH_UNIQUE));
        $arr['cart'] = json_decode($arr['cart'], true);
        return $arr;
    }
    public function changeState($order_id, $state, $payment = 0, $canceled = 0)
    {
        $order_id = $this->pdo->quote($order_id);
        $state = $this->pdo->quote($state);
        $payment = $this->pdo->quote($payment);
        $canceled = $this->pdo->quote($canceled);

        $this->query("UPDATE `orders` SET `state` = $state, `payment_state` = $payment, `canceled` = $canceled WHERE `id` = $order_id");
    }
    public function change($id, $array = [])
    {
        $set = '';
        $id = $this->pdo->quote($id);
        foreach ($array as $field => $value) {
            $set .= "`$field` = " . $this->pdo->quote($value) . ', ';
        }
        $set = rtrim($set, ', ');

        return $this->query("UPDATE `orders` SET $set WHERE `id` = $id");
    }
    public function orderCartUpdate($order_id, $cart_id, $arr = [])
    {
        $order = $this->getOrderById($order_id);
        foreach ($arr as $field => $value) {
            $order['cart'][$cart_id][$field] = $value;
        }
        //$order['cart'][$cart_id] = $arr;
        $cart = $order['cart'];
        $cart_str = $this->pdo->quote(json_encode($cart, JSON_UNESCAPED_UNICODE));
        $order_id = $this->pdo->quote($order_id);
        $this->query("UPDATE `orders` SET `cart` = $cart_str WHERE `id` = $order_id");
        //debug($cart);
        return $cart;
    }
    public function orderCartDelete($order_id, $cart_id)
    {
        $order = $this->getOrderById($order_id);
        unset($order['cart'][$cart_id]);

        $cart = $this->pdo->quote(json_encode($order['cart'], JSON_UNESCAPED_UNICODE));
        $order_id = $this->pdo->quote($order_id);
        $this->query("UPDATE `orders` SET `cart` = $cart WHERE `id` = $order_id");

        return $order['cart'];
    }
}
