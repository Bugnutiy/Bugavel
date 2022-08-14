<?php

namespace application\lib\Shop;

use application\lib\Shop\General;
use application\lib\Shop\Products;

class Products_properties extends General
{
  /**
   * @var Products
   */
  public $products;
  /**
   * Class constructor.
   */
  public function __construct(&$db)
  {
    parent::__construct($db, strtolower(getClassName(self::class)));
  }
  /**
   * Добавление связи с товарами
   *
   * @param Products $products
   * @return void
   */
  public function ProductsReg(&$products)
  {
    $this->products = &$products;
  }
  /**
   * Получить вариации товара
   *
   * @param int|string $product_id - id товара
   * @return array
   */
  public function getByProductId($product_id, $avaliable = false)
  {
    if ($avaliable) {
      return $this->db->fetAllLite($this->table, '`product_id` = :product_id AND `quantity`', ['product_id' => $product_id]);
    } else
      return $this->db->fetAllLite($this->table, '`product_id` = :product_id', ['product_id' => $product_id]);
  }
}
