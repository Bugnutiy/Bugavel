<?php

namespace application\lib\Shop;

use application\lib\Db;
use application\lib\Shop\General;

use function PHPSTORM_META\type;

class Orders extends General
{
    public $status;
    //= [
    //     0 => [
    //         'RU' => 'Отменен',
    //         'EN' => 'Canceled'
    //     ],
    //     1 => [
    //         'RU' => 'Новый',
    //         'EN' => 'New'
    //     ],
    //     2 => [
    //         'RU' => 'Обработан',
    //         'EN' => 'Processed'
    //     ],
    //     3 => [
    //         'RU' => 'Отправлен',
    //         'EN' => 'Sent'
    //     ],
    //     4 => [
    //         'RU' => 'Доставлен',
    //         'EN' => 'Delivered'
    //     ],
    // ];

    /**
     * Class constructor.
     */
    public function __construct(&$db)
    {
        parent::__construct($db, strtolower(getClassName(self::class)));
        $this->status=$this->db->fetAllLite('orders_status');
    }
    /**
     * Place an order. Нужна корзина в orders в виде строки
     *
     * @param array $user
     * @param array $order
     * @return array
     */
    public function MakeOrder($user, $order = [])
    {
        $cart = $this->db->fetAllLite('cart', '`user_id` = :user_id', ['user_id' => key($user)]);
        $properties = $this->db->fetAllLite('products_properties');
        $products = $this->db->fetAllLite('products');
        if (empty($cart)) {
            $err[] = [
                'type' => 'warning',
                'RU' => 'Корзина пуста! Добавьте товары в корзину, затем повторите попытку.',
                'EN' => 'The cart is empty! Add the items to the cart, then try again.'
            ];
            return $err;
        }
        $order['cart'] = json_encode($cart);
        $order['user_id'] = key($user);
        $order['lang'] = current($user)['lang'];
        // dd($properties);
        $cost = 0;
        $cost_en = 0;
        foreach ($cart as $cart_id => $cart_node) {
            if ($properties[$cart_node['property_id']]['quantity'] >= $cart_node['quantity']) {
                $cost += $properties[$cart_node['property_id']]['price'] * $cart_node['quantity'];
                $cost_en += $properties[$cart_node['property_id']]['price_en'] * $cart_node['quantity'];
            } else {
                $product = $products[$cart_node['product_id']]['name'];
                $product_en = $products[$cart_node['product_id']]['name_en'];
                $property = $properties[$cart_node['property_id']]['name'];
                $property_en = $properties[$cart_node['property_id']]['name_en'];

                $err[] = [
                    'type' => 'danger',
                    'RU' => "На складе недостаточно товара \"$product\" - $property",
                    'EN' => "There is not enough product in stock \"$product_en\" - $property_en"
                ];
                // dd(1);
                return $err;
            }
        }
        // dd($cost_en);
        $order['cost'] = json_encode([
            'RUB' => $cost,
            'USD' => $cost_en
        ]);
        // dd($user);
        $order['ip_country']=current($user)['country'];
        // dd($order);
        if (empty($this->Update($order))) {
            // dd($this->db->LastInsertId());
            $dbid=$this->db->LastInsertId();
            $err[] = [
                'type' => 'success',
                'EN' => 'The order has been placed successfully! Expect a response to your email',
                'RU' => 'Заказ успешно размещен! Ожидайте ответа на вашу электронную почту',
                'ID' => $dbid
            ];
            foreach ($cart as $id => $value) {
                $properties[$value['property_id']]['quantity'] -= $value['quantity'];
                $this->db->update('products_properties', $properties[$value['property_id']], '`id` = :id', ['id' => $value['property_id']]);
                $this->db->Delete('cart', '`id` = :id', ['id' => $id]); 
            }
        } else {
            $err[] = [
                'type' => 'danger',
                'EN' => 'An error has occurred! Please try again!',
                'RU' => 'Произошла ошибка! Пожалуйста, попробуйте ещё раз!'
            ];
        }
        return $err;
    }
    public function CancelOrder($id)
    {
        $exist = $this->db->fetAllLite('orders', '`id` = :id', ['id' => $id]);
        $properties = $this->db->fetAllLite('products_properties');
        if (!empty($exist)) {
            $exist = current($exist);
            $cart = json_decode($exist['cart'], 1);
            foreach ($cart as $id => $node) {
                if (isset($properties[$node['property_id']])) {
                    $property['quantity'] = $properties[$node['property_id']]['quantity'];
                    $property += $node['quantity'];
                    $this->db->update('products_properties', $property, '`id` = :id', ['id' => $node['property_id']]);
                }
            }
            if (!$this->db->Delete('orders', '`id` = :id', ['id' => $id])) {
                $err[] = [
                    'type' => 'success',
                    'EN' => 'Success',
                    'RU' => 'Успешно'
                ];
                return $err;
            }
            $err[] = [
                'type' => 'success',
                'EN' => 'Error',
                'RU' => 'Ошибка'
            ];
            return $err;
        } else {
            $err[] = [
                'type' => 'danger',
                'EN' => 'Order not found',
                'RU' => 'Заказ не найден'
            ];
            return $err;
        }
    }
}
