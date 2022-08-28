<?php

namespace application\lib\Shop;

use application\lib\Shop\General;
use application\lib\Shop\Products_properties;
use PDO;

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
    public function getByCategoryId($id)
    {
        return $this->getByField('category_id', $id);
    }
    /**
     * Обновить общее количество товара из его вариаций
     *
     * @param [type] $id
     * @return void
     */
    public function UpdateQuantity($id)
    {
        $id = intval($id);
        $properties = $this->properties->getByProductId($id);
        $quantity = 0;
        foreach ($properties as $property_node) {
            $quantity += $property_node['quantity'];
        }
        return $this->db->update($this->table, ['quantity' => $quantity], "`id` = $id");
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
            name_en
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
        if (isset($arr['images_min'])) {
            $arr['images_min'] = json_encode($arr['images_min']);
        }

        if (!empty($arr['id'])) {
            $id = intval($arr['id']);
            $exist = current($this->getById($id));
            unset($arr['id']);
            // ddd($exist);
            // ddd("----------------------------");
            // dd($arr);
            $table = $this->table;
            $structure = $this->db->query("DESCRIBE `$table`")->fetchAll(PDO::FETCH_GROUP);
            $matcher = [];
            foreach ($arr as $key => $value) {
                if (isset($exist[$key]))
                    $matcher[$key] = $exist[$key];
                else {

                    if (!isset($structure[$key])) {
                        $err[] = 'В таблице ' . $this->table . ' не настроены поля ' . $key . ' под запрос';
                        return $err;
                    } else {
                        $matcher[$key] = NULL;
                    }
                }
            }
            if ($matcher == $arr) {
                $err[] = 'Поменяйте хотя бы одно значение';
                return $err;
            }
            if (isset($arr['images'])) {
                $exists_images = json_decode($exist['images'], 1);
                //dd($images);
                if (!empty($exists_images)) {
                    foreach ($exists_images as $image) {
                        if (file_exists($image)) {
                            unlink($image);
                        }
                    }
                }
            }
            if (isset($arr['images_min'])) {
                $exists_images = json_decode($exist['images_min'], 1);
                //dd($images);
                if (!empty($exists_images)) {
                    foreach ($exists_images as $image) {
                        if (file_exists($image)) {
                            unlink($image);
                        }
                    }
                }
            }
            if (!$this->db->update($this->table, $arr, "`id` = $id")) {
                $err[] = 'Обновить запись в БД не удалось';
            }
            // dd($this->UpdateQuantity($id));
        } else {
            /* dd($arr);
              arr
                  name            t
                  name_en         t
                  category_id     t
                  description     t
                  description_en  t
                  price           yt  average_price           ///
                  price_en        yt  average_price_en        ///
                  quantity        y                           ///
                  images          t
              property
                  id
                  product_id                                  ///
                  name                                        ///
                  price                                       /// 
                  price_en                                    ///
                  quantity                                    ///
              product
                  id
                  category_id
                  name
                  name_en
                  description
                  description_en
                  images
                  min_price
                  min_price_en
                  max_price
                  max_price_en
                  average_price
                  average_price_en 
            */
            $property = [
                'product_id' => "0",
                'name' => $arr['name'],
                'name_en' => $arr['name_en'],
                'price' => $arr['price'],
                'price_en' => $arr['price_en'],
                'quantity' => $arr['quantity']
            ];
            // unset($arr['quantity']);
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
        if (isset($exist['images_min'])) {
            $images = json_decode($exist['images_min'], 1);
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

        $product_id_properties = [];
        foreach ($all_exists_properties as $property_id => $property_node) {
            if ($property_node['quantity'] > 0)
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
            $k_en = 0;
            $max_price = current($exists_properties)['price'];
            $max_price_en = current($exists_properties)['price_en'];
            // if (current($exists_properties)['price'])


            foreach ($exists_properties as $property_id => $property_node) {
                ddd($property_node['price_en']);
                if ($property_node['price'] > $max_price)
                    $max_price = $property_node['price'];
                if ($property_node['price_en'] > $max_price_en)
                    $max_price_en = $property_node['price_en'];

                if ($property_node['price']) {
                    $sum_price += $property_node['price'];
                    $k++;
                }
                if ($property_node['price_en']) {
                    $sum_price_en += $property_node['price_en'];
                    $k_en++;
                }
            }
            ddd($max_price_en);
            $min_price = $max_price;
            // if (current($exists_properties)['price_en'])
            $min_price_en = $max_price_en;
            foreach ($exists_properties as $property_id => $property_node) {
                if ($property_node['price'] && $property_node['price'] < $min_price)
                    $min_price = $property_node['price'];
                if ($property_node['price_en'] && $property_node['price_en'] < $min_price_en)
                    $min_price_en = $property_node['price_en'];
            }
            // dd($min_price_en);
            $average_price = ($sum_price) / $k;
            $average_price_en = ($sum_price_en) / $k_en;

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
            // dd($this->Update($fields));
            if (!$this->Update($fields))
                $err[] = "Не обновились цены товара с ID = $product_id";
            // unset($product_id_properties[$product_id]);

        }
        return $err;
    }
}
