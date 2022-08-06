<?php

namespace application\lib\Shop;

use application\lib\Shop\General;

class Products extends General
{

    /**
     * Class constructor.
     */
    public function __construct(&$db)
    {
        parent::__construct($db, strtolower(getClassName(self::class)));
    }

    public function Update($arr)
    {
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
            if (!$this->db->insert($this->table.'_properties', $property)) {
                $err[] = 'Создать запись в таблице "варианты товаров" не удалось';
            }
        }

        return $err;
    }
}
