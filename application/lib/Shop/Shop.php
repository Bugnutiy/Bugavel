<?php

namespace application\lib\Shop;

use application\lib\Db;
use application\lib\Shop\Categories;
use application\lib\Shop\Products;
use application\lib\Shop\Products_properties;
use application\lib\Shop\Cart;
use application\lib\Shop\Orders;

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

  /**
   * @var Cart
   */
  public $cart;

  /**
   * @var Orders
   */
  public $orders;

  /**
   * Constructor
   */
  function __construct(&$db)
  {
    $this->db = &$db;
    // $this->user=&$user;
    $this->categories = new Categories($this->db);
    $this->products_properties = new Products_properties($this->db);
    $this->products = new Products($this->db, $this->products_properties);
    $this->products_properties->ProductsReg($this->products);
    $this->cart = new Cart($this->db, $this->products);
    $this->orders = new Orders($this->db);
    // dd(memory_get_usage());
  }
}
