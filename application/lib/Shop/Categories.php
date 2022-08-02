<?php

namespace application\lib\Shop;

use application\lib\Shop\General;
use application\lib\Db;

class Categories extends General
{
    /**
     * Class constructor.
     */

    public function __construct(&$db)
    {
        parent::__construct($db, strtolower(getClassName(self::class)));
    }

    /**
     * delete
     *
     * @param integer $id
     * 
     * @return void
     */
    public function delete($id)
    {
        $exist = current($this->getById($id));
        $exist_products = $this->db->fetAllLite('products', '`category_id` = :cid', [':cid' => $id]);
        // dd($exist_products);
        foreach ($exist_products as $product_id => $product_node) {
            $images = json_decode($product_node['images'], 1);
            foreach ($images as $image) {
                if (file_exists($image)) {
                    unlink($image);
                }
            }
            $this->db->delete('products', '`id` = :id', [':id' => $product_id]);
        }
        if (isset($exist['images'])) {
            $images = json_decode($exist['images'], 1);
            // dd($images);
            foreach ($images as $image) {
                if (file_exists($image)) {
                    unlink($image);
                }
            }
        }
        $this->db->delete($this->table, '`id` = :id', ['id' => $id])->rowCount();
    }
}
