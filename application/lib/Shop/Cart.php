<?php

namespace application\lib\Shop;

use application\lib\Shop\General;
use application\lib\Shop\Products;

class Cart extends General
{
    /**
     * @var Products
     */
    public $products;

    /**
     * Class constructor
     */
    function __construct(&$db, &$products)
    {
        parent::__construct($db, strtolower(getClassName(self::class)));
        // $this->db = &$db;
        $this->products = &$products;
    }
    /**
     * Добавить товар в корзину
     *
     * @param string|int $property_id
     * @param string|int $user_id
     * @param string|int $quantity
     * @return array Errors[EN|RU][] 
     */
    public function addToCart($property_id, $user_id, $quantity = 1)
    {
        $err = [];
        $property = $this->products->properties->getById($property_id);
        if (empty($property)) {
            $err['EN'][] = "Product not found";
            $err['RU'][] = "Товар не найден";
            return $err;
        }
        // dd($property);
        if ($quantity > current($property)['quantity']) {
            $err['EN'][] = "The required quantity of goods is missing from the warehouse";
            $err['RU'][] = "На складе отсутствует необходимое количество товара";
            return $err;
        }
        $dbansw = $this->Update([
            'user_id' => $user_id,
            'property_id' => $property_id,
            'product_id' => current($property)['product_id'],
            'quantity' => $quantity,
        ]);
        // dd($dbansw);
        if (!empty($dbansw)) {
            $err['EN'][] = "An error occurred while writing to the database";
            $err['RU'][] = "Во время записи в базу данных произошла ошибка";
        }
        return $err;
    }

    public function Update($arr)
    {
        $err = [];
        if (empty($arr)) {
            $err[] = 'Запрос оказался пуст';
            return $err;
        }

        if (!empty($arr['id'])) {
            $id = intval($arr['id']);
            unset($arr['id']);
            $exist = current($this->getById($id));
            $matcher = [];
            foreach ($arr as $key => $value) {
                if (isset($exist[$key]))
                    $matcher[$key] = $exist[$key];
                else {
                    $err[] = 'В таблице ' . $this->table . ' не настроены поля под запрос';
                    return $err;
                }
            }

            if (!$this->db->update($this->table, $arr, "`id` = $id")) {
                $err[] = 'Обновить1 запись в таблице ' . $this->table . ' не удалось';
            }
        } else {
            if (!empty($arr['user_id']) and !empty($arr['property_id'])) {
                $exist = $this->db->fetAllLite($this->table, '`user_id` = :user_id AND `property_id` = :property_id', ['user_id' => $arr['user_id'], 'property_id' => $arr['property_id']]);

                if (empty($exist)) {
                    if (!$this->db->insert($this->table, $arr)) {
                        $err[] = 'Создать запись в таблице ' . $this->table . ' не удалось';
                    }
                } else {
                    $id = key($exist);
                    $arr['quantity'] += current($exist)['quantity'];

                    if (!$this->db->update($this->table, $arr, "`id` = $id")) {
                        $err[] = 'Обновить запись в таблице ' . $this->table . ' не удалось';
                    }
                }
            } else {
                $err[] = "Cart: user_id или property_id пустой";
            }
        }
        // dd($this->db->LastInsertId());

        return $err;
    }
}
