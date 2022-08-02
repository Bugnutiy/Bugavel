<?php

namespace application\lib\Shop\Users;

use PDO;

class Cart
{
    protected $pdo;
    protected $user_id;
    //protected $quantity;
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
        $stmt = $this->pdo->prepare($sql);

        if (!empty($params)) {
            foreach ($params as $key => $val) {
                $stmt->bindValue(':' . $key, $val);
            }
        }
        $stmt->execute();
        return $stmt;
        //return $query;
    }
    public function getCartByUserId($user_id = "")
    {
        if (empty($user_id))
            $user_id = $this->user_id;
        $user_id = $this->pdo->quote($user_id);

        return $this->query("SELECT * FROM `cart` WHERE `user_id` = $user_id")->fetchAll(PDO::FETCH_ASSOC | PDO::FETCH_UNIQUE);
    }
    public function deleteCartByUserId($user_id = "")
    {
        if (empty($user_id))
            $user_id = $this->user_id;
        $user_id = $this->pdo->quote($user_id);

        return $this->query("DELETE FROM `cart` WHERE `user_id` = $user_id");
    }
    /**
     * @property Функция долавления товара в корзину
     * 
     * @param int $user_id ид пользователя
     * @param int $product_id ид товара
     * @param int $property_id ид свойства (экземпляра)
     * @param float $quantity Количество
     * 
     * @return true|false
     */
    public function add($product_id, $property_id, $quantity)
    {
        $user_id = $this->pdo->quote($this->user_id);
        $product_id = $this->pdo->quote($product_id);
        $property_id = $this->pdo->quote($property_id);

        $exists = $this->query("SELECT `quantity` FROM `cart` WHERE (`user_id` = $user_id AND `product_id` = $product_id AND `property_id` = $property_id)")->fetchColumn();
        //debug($exists);
        if (!empty($exists)) {
            //debug($exists);
            $quantity += $exists;
            $quantity = $this->pdo->quote($quantity);
            //debug($quantity);
            return $this->query("UPDATE `cart` SET `quantity` = $quantity WHERE (`user_id` = $user_id AND `product_id` = $product_id AND `property_id` = $property_id)") ? true : false;
        }
        $quantity = $this->pdo->quote($quantity);
        return $this->query("INSERT INTO `cart` (`user_id` , `product_id` , `property_id`, `quantity`) VALUES ($user_id , $product_id , $property_id, $quantity)") ? true : false;
    }
    public function changeQuantity($cart_id, $quantity)
    {
        $user_id = $this->pdo->quote($this->user_id);
        $cart_id = $this->pdo->quote($cart_id);
        $quantity = $this->pdo->quote($quantity);

        $this->query("UPDATE `cart` SET `quantity` = $quantity WHERE `id` = $cart_id AND `user_id` = $user_id");
    }
    public function getQuantity()
    {
        $user_id = $this->pdo->quote($this->user_id);
        //debug($user_id);
        $arr = $this->query("SELECT * FROM `cart` WHERE `user_id` = $user_id")->fetchAll(PDO::FETCH_ASSOC | PDO::FETCH_UNIQUE);
        //debug($arr);
        $q = 0;
        foreach ($arr as $value) {
            $q += $value['quantity'];
        }
        // debug($arr);
        return $q;
    }
    /**
     * Получение записей из таблицы cart
     * @return array
     */
    public function getCart()
    {
        $user_id = $this->pdo->quote($this->user_id);
        return $this->query("SELECT * FROM `cart` WHERE `user_id` = $user_id")->fetchAll(PDO::FETCH_ASSOC | PDO::FETCH_UNIQUE);
    }
    /**
     * @param int $id - идентификатор записи в таблице cart
     */
    public function remove($id)
    {
        // debug($id);
        $user_id = $this->pdo->quote($this->user_id);
        $id = $this->pdo->quote($id);
        return $this->query("DELETE FROM `cart` WHERE `user_id`= $user_id AND `id` = $id");
    }
}
