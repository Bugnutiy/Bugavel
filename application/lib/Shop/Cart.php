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
     * @return int 
     */
    public function addToCart($property_id, $user_id, $quantity = 0)
    {
        $err = [];
        $property = $this->products->getById($property_id);
        if (empty($property)) {
            $err['EN'][] = "Product not found";
            $err['RU'][] = "Товар не найден";
            return $err;
        }
        dd($property);
        if ($quantity > current($property)['quantity']) {
            $err['EN'][] = "The required quantity of goods is missing from the warehouse";
            $err['RU'][] = "На складе отсутствует необходимое количество товара";
            return $err;
        }
    }
}
