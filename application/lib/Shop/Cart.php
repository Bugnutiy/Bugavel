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
   * @return array Errors[][EN|RU] 
   */
  public function addToCart($property_id, $user_id, $quantity = 1)
  {
    // dd(2);
    $err = [];
    $property = $this->products->properties->getById($property_id);
    // dd($property);
    $product = $this->products->getById(current($property)['product_id']);
    // dd($product);
    if (empty($property)) {
      $err[] = [
        'EN' => "Product not found",
        'RU' => "Товар не найден"
      ];
      return $err;
    }
    // dd($property);
    if ($quantity > current($property)['quantity'] and !current($property)['preorder']) {
      $err[] = [
        'EN' => "The required quantity of goods is missing from the warehouse",
        'RU' => "На складе отсутствует необходимое количество товара"
      ];
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
      $err = array_merge($err, $dbansw);
      // dd($err)
    }
    return $err;
  }

  public function Update($arr)
  {
    $err = [];
    if (empty($arr)) {
      $err[] = [
        'EN' => "Empty request",
        'RU' => "Запрос оказался пуст",
        'code' => 'U1'
      ];

      return $err;
    }

    if (!empty($arr['id'])) {
      $id = intval($arr['id']);
      unset($arr['id']);
      $exist = current($this->getById($id));
      if (empty($exist)) {
        $err[] = [
          'EN' => "Entry not found",
          'RU' => "Запись не найдена",
          'code' => 'U2'
        ];
        return $err;
      }
      $matcher = [];
      foreach ($arr as $key => $value) {
        if (isset($exist[$key]))
          $matcher[$key] = $exist[$key];
        else {
          // $err[] = 'В таблице ' . $this->table . ' не настроены поля под запрос';
          $err[] = [
            'EN' => "Error occured!",
            'RU' => "Произошла ошибка!",
            'code' => 'U3'
          ];
          return $err;
        }
      }

      if (!$this->db->update($this->table, $arr, '`id` = :id', ['id' => $id])) {
        // $err[] = 'Обновить1 запись в таблице ' . $this->table . ' не удалось';
        $err[] = [
          'EN' => "Error occured!",
          'RU' => "Произошла ошибка!",
          'code' => 'U4'
        ];
      }
    } else {
      if (!empty($arr['user_id']) and !empty($arr['property_id'])) {
        $exist = $this->db->fetAllLite($this->table, '`user_id` = :user_id AND `property_id` = :property_id', ['user_id' => $arr['user_id'], 'property_id' => $arr['property_id']]);

        if (empty($exist)) {
          if (!$this->db->insert($this->table, $arr)) {
            // $err[] = 'Создать запись в таблице ' . $this->table . ' не удалось';
            $err[] = [
              'EN' => "Error occured!",
              'RU' => "Произошла ошибка!",
              'code' => 'U5'
            ];
          }
        } else {
          $id = key($exist);
          $exist = current($exist);
          $matcher = [];
          foreach ($arr as $key => $value) {
            if (isset($exist[$key]))
              $matcher[$key] = $exist[$key];
            else {
              // ddd($arr);
              // dd($exist);
              // $err[] = 'В таблице ' . $this->table . ' не настроены поля под запрос';
              $err[] = [
                'EN' => "Error occured!",
                'RU' => "Произошла ошибка!",
                'code' => 'U6'
              ];
              return $err;
            }
          }
          if ($matcher == $arr) {
            $err[] = [
              'EN' => "This product is already <a href='/cart' class='alert-link'>in the cart</a>",
              'RU' => "Этот товар уже есть <a href='/cart' class=\"alert-link\">в корзине</a>",
              'code' => 'U7',
            ];
            return $err;
          }
          // $arr['quantity'] += current($exist)['quantity'];

          if (!$this->db->update($this->table, $arr, '`id` = :id', ['id' => $id])) {
            // $err[] = 'Обновить запись в таблице ' . $this->table . ' не удалось';
            $err[] = [
              'EN' => "Error occured!",
              'RU' => "Произошла ошибка!",
              'code' => 'U8'
            ];
          }
        }
      } else {
        // $err[] = "Cart: user_id или property_id пустой";
        $err[] = [
          'EN' => "Error occured!",
          'RU' => "Произошла ошибка!",
          'code' => 'U9'
        ];
      }
    }

    return $err;
  }
  public function getTotal($user_id)
  {
    // dd(1);
    $cart = $this->db->fetAllLite($this->table, "`user_id` = :user_id", ['user_id' => $user_id]);
    if (empty($cart)) {
      // dd($cart);

      return $cart;
    } else {
      $cart_by_product_id = [];
      foreach ($cart as $id => $node) {
        $cart_by_product_id[$node['product_id']][$id] = $node;
      }
      // ddd("__________________cart_by_product________________________");
      // ddd($cart_by_product_id);

      $total_quantity = 0;
      $total_price = 0;
      $total_price_en = 0;
      foreach ($cart_by_product_id as $product_id => $cart_nodes) {
        $properties = $this->products->properties->getByProductId($product_id);
        foreach ($cart_nodes as $cart_id => $cart_node) {
          if (empty($properties[$cart_node['property_id']])) {
            $this->Delete($cart_id);
            continue;
          }
          $property = $properties[$cart_node['property_id']];
          // ddd("__________________property________________________");
          // ddd($property);
          $total_quantity += $cart_node['quantity'];
          $total_price += $property['price'] * $cart_node['quantity'];
          $total_price_en += $property['price_en'] * $cart_node['quantity'];
        }
      }
      $total = [
        'total_quantity' => $total_quantity,
        'total_price' => $total_price,
        'total_price_en' => $total_price_en,
      ];
      // dd($total);
      return $total;
    }
  }
  /**
   * Получить объект корзины пользователя
   *
   * @param int|string $userid
   * @return array
   */
  public function getByUser($user_id)
  {
    return $this->db->fetAllLite($this->table, '`user_id` = :user_id', [':user_id' => $user_id]);
  }
  /**
   * Удалить запись из корзины
   *
   * @param int|string $id
   * @param int|string $user_id
   * @return void
   */
  public function Delete($id, $user_id = '')
  {
    if (empty($user_id)) {
      return $this->db->delete($this->table, '`id` = :id', ['id' => $id])->rowCount();
    } else {
      return $this->db->delete($this->table, '`id` = :id AND `user_id` = :user_id', [
        'id' => $id,
        'user_id' => $user_id
      ])->rowCount();
    }
  }
}
