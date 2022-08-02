<?php

namespace application\lib\Shop;

use application\lib\Db;
use application\lib\Shop\Categories;
use application\lib\Shop\Products;

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
    function __construct(&$db)
    {
        $this->db = &$db;
        $this->categories = new Categories($this->db);
        $this->products = new Products($this->db);
    }
}
