<?php

namespace application\lib\Shop;

use application\lib\Db;
use application\lib\Shop\Categories;
use application\lib\Shop\Products;
use application\lib\Shop\Products_properties;

class Shop
{
    /**
     * @var Db
     */
    private $db;
    /**
     * @var Categories
     */
    public $categories;
    /**
     * @var Products
     */
    public $products;
    /**
     * @var Products_properties
     */
    public $products_properties;
    function __construct(&$db)
    {
        $this->db = &$db;
        $this->categories = new Categories($this->db);
        $this->products_properties = new Products_properties($this->db);
        $this->products = new Products($this->db, $this->products_properties);
        $this->products_properties->ProductsReg($this->products);
        // dd(memory_get_usage());
    }
}
