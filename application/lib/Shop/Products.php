<?php

namespace application\lib\Shop;

use application\lib\Shop\General;
use application\lib\Shop\Products_properties;

class Products extends General
{
    /**
     * Ссылка на класс вариаций товара
     *
     * @var Products_properties
     */
    public $properties;

    /**
     * Class constructor.
     */
    public function __construct(&$db, &$properties)
    {
        parent::__construct($db, strtolower(getClassName(self::class)));
        $this->properties = &$properties;
    }

    public function Update($arr)
    {
        // dd($arr);
        /*
        product
            id
            category_id
            name
            name_en
            description
            description_en
            images
            average_price
            average_price_en
        property
            id
            product_id
            name
            price
            price_en
            quantity

        arr
            name            t
            name_en         t
            category_id     t
            description     t
            description_en  t
            price           yt  average_price
            price_en        yt  average_price_en
            quantity        y
            images          t
        */
        $err = [];
        // dd($arr);
        if (empty($arr)) return $err[] = 'Запрос оказался пуст';
        if (isset($arr['images'])) {
            $arr['images'] = json_encode($arr['images']);
        }

        if (!empty($arr['id'])) {
            $id = $arr['id'];
            if (isset($arr['images'])) {
                $exists_images = json_decode(current($this->getById($id))['images'], 1);
                //dd($images);
                if (!empty($exists_images)) {
                    foreach ($exists_images as $image) {
                        if (file_exists($image)) {
                            unlink($image);
                        }
                    }
                }
            }
            unset($arr['id']);
            if (!$this->db->update($this->table, $arr, "`id` = $id")) {
                $err[] = 'Обновить запись в БД не удалось';
            }
        } else {
            // dd($arr);
            //  arr
            //      name            t
            //      name_en         t
            //      category_id     t
            //      description     t
            //      description_en  t
            //      price           yt  average_price           ///
            //      price_en        yt  average_price_en        ///
            //      quantity        y                           ///
            //      images          t
            //  property
            //      id
            //      product_id                                  ///
            //      name                                        ///
            //      price                                       /// 
            //      price_en                                    ///
            //      quantity                                    ///
            //  product
            //      id
            //      category_id
            //      name
            //      name_en
            //      description
            //      description_en
            //      images
            //      min_price
            //      min_price_en
            //      max_price
            //      max_price_en
            //      average_price
            //      average_price_en
            $property = [
                'product_id' => "0",
                'name' => $arr['name'],
                'price' => $arr['price'],
                'price_en' => $arr['price_en'],
                'quantity' => $arr['quantity']
            ];
            unset($arr['quantity']);
            $arr['average_price'] = $arr['price'];
            $arr['average_price_en'] = $arr['price_en'];
            $arr['min_price'] = $arr['price'];
            $arr['min_price_en'] = $arr['price_en'];
            $arr['max_price'] = $arr['price'];
            $arr['max_price_en'] = $arr['price_en'];
            unset($arr['price']);
            unset($arr['price_en']);

            // dd($arr);

            if (!$this->db->insert($this->table, $arr)) {
                $err[] = 'Создать запись в таблице "товары" не удалось';
            }
            // dd($this->db->LastInsertId());
            $property['product_id'] = $this->db->LastInsertId();
            // dd($property);
            // dd($this->db->insert($this->table.'_properties', $property));
            $err = array_merge($err, $this->properties->Update($property));
        }

        return $err;
    }

    /**
     * Delete
     *
     * @param int|string $id
     * 
     * @return PDOStatement
     */
    public function Delete($id)
    {
        $exist = current($this->getById($id));
        if (isset($exist['images'])) {
            $images = json_decode($exist['images'], 1);
            // dd($images);
            foreach ($images as $image) {
                if (file_exists($image)) {
                    unlink($image);
                }
            }
        }
        $properties = $this->properties->getByProductId($id);
        // dd($properties);
        foreach ($properties as $id => $node) {
            $this->properties->Delete($id);
        }

        return $this->db->delete($this->table, '`id` = :id', ['id' => $id]);
    }
    /**
     * Функция для обновления минимальной и максимальной цены
     *
     * @param int|string|null $id
     * @return err[] массив ошибок
     */
    public function UpdatePrice($id = NULL)
    {
        $err = [];
        $all_exists_properties = [];
        if (!empty($id)) {
            $id = intval($id);
            $all_exists_properties = $this->properties->getByProductId($id);
        } else {
            $all_exists_properties = $this->properties->getAll();
        }
        // dd($all_exists_properties);

        $product_id_properties = [];
        foreach ($all_exists_properties as $property_id => $property_node) {
            $product_id_properties[$property_node['product_id']][$property_id]  = $property_node;
        }
        // dd($product_id_properties);
        // if (!empty($id)) {
        // $exist_product = $this->getById($id);
        // dd($exist_product);
        // $exists_properties = $this->properties->getByProductId($id);
        // dd($exists_properties);
        foreach ($product_id_properties as $product_id => $exists_properties) {
            // dd($exists_properties);
            $sum_price = 0;
            $sum_price_en = 0;
            $k = 0;
            $max_price = -1;
            $max_price_en = -1;
            foreach ($exists_properties as $property_id => $property_node) {
                if ($property_node['price'] > $max_price) $max_price = $property_node['price'];
                if ($property_node['price_en'] > $max_price_en) $max_price_en = $property_node['price_en'];
                $sum_price += $property_node['price'];
                $sum_price_en += $property_node['price_en'];
                $k++;
            }
            $average_price = ($sum_price) / $k;
            $average_price_en = ($sum_price_en) / $k;

            // dd($exists_properties);

            $min_price = $max_price;
            $min_price_en = $max_price_en;
            foreach ($exists_properties as $property_id => $property_node) {
                if ($property_node['price'] < $min_price) $min_price = $property_node['price'];
                if ($property_node['price_en'] < $min_price_en) $min_price_en = $property_node['price_en'];
            }

            $fields = [
                'id' => $product_id,
                'min_price' => $min_price,
                'min_price_en' => $min_price_en,
                'max_price' => $max_price,
                'max_price_en' => $max_price_en,
                'average_price' => $average_price,
                'average_price_en' => $average_price_en,
            ];
            // unset($product_id_properties[$product_id]);
            // dd($product_id_properties);
            if (!$this->Update($fields))
                // dd($err[] = "Не обновились цены товара с ID = $product_id");
            unset($product_id_properties[$product_id]);
        }
        return $err;
    }
}
