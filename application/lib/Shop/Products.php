<?php

namespace application\lib\Shop;

use PDO;

class Products
{
    protected $pdo, $data, $assoc;
    protected $user_id;
    function __construct(&$pdo, $user_id)
    {
        $this->pdo = &$pdo;
        $this->user_id = $user_id;
        $this->data = $this->query('SELECT * FROM `products`')->fetchAll(PDO::FETCH_UNIQUE | PDO::FETCH_ASSOC);
    }
    protected function query($sql, $params = [])
    {
        if (!stristr($sql, 'SELECT')) {
            $user_id = '';
            if (!empty($this->user_id))
                $user_id = $this->user_id;
            $user_id = $this->pdo->quote($user_id);
            $query = $this->pdo->quote($sql);

            $log = $this->pdo->prepare("INSERT INTO `log` ( `user_id`, `query` ) VALUES ( $user_id, $query )");
            $log->execute();
        }

        $stmt = $this->pdo->prepare($sql);
        //if($sql!="SET NAMES 'utf8'")
        //$this->query("SET NAMES 'utf8'");
        //$query = $this->db->query($sql); //prepare заменил query
        if (!empty($params)) {
            foreach ($params as $key => $val) {
                $stmt->bindValue(':' . $key, $val);
            }
        }
        $stmt->execute();
        return $stmt;
        //return $query;
    }
    public function getAll($id = false)
    {
        if ((int)$id)
            if (!empty($this->data[$id]))
                return $this->data[$id];
            else
                return false;
        return $this->data;
    }
    public function getAllByField($field, $val, $additions = '')
    {
        $val = $this->pdo->quote($val);
        return $this->query("SELECT * FROM `products` WHERE `$field` = $val $additions")->fetchAll(PDO::FETCH_UNIQUE | PDO::FETCH_ASSOC);
    }
    public function newProduct($name, $category_id, $description, $photos)
    {
        $err = [];
        $name = $this->pdo->quote($name);
        $category_id = $this->pdo->quote($category_id);
        $description = $this->pdo->quote($description);
        if (is_array($photos)) {
            $photos = json_encode($photos, JSON_UNESCAPED_UNICODE);
        }
        if (is_string($photos)) {
            $q = "INSERT INTO `products` (`name`,`category_id`,`description`,`photos`) VALUES ($name,$category_id,$description,'$photos')";

            if ($this->query($q)) {
            }
            //$err = [];
            else {
                $err[] = "Ошибка MySql. Запрос: \"$q\"";
            }
        } else $err[] = "Ошибка прерменной photos";
        return $err;
    }
    public function remove_by_field($fieldname, $fieldval, $additions = '')
    {
        $fieldval = $this->pdo->quote($fieldval);
        $arr = $this->query("SELECT * FROM `products` WHERE `$fieldname` = $fieldval $additions")->fetchAll(PDO::FETCH_UNIQUE | PDO::FETCH_ASSOC);

        //dd($arr);
        foreach ($arr as $id => $product) {
            $photos = json_decode($product['photos'], true);

            if (!empty($photos)) {
                foreach ($photos as $name) {
                    unlink("public/images/photos/$name");
                }
            }
        }
        return $this->query("DELETE FROM `products` WHERE  `$fieldname` = $fieldval");
    }
    public function random_products($num = 1, $arr = [])
    {
        $rand = [];
        if (empty($arr)) $arr = $this->data;

        return true_array_rand($arr, $num);
        //debug($keys);
    }
    public function update($id, $fields = [])
    {
        //debug($fields);
        $id = $this->pdo->quote($id);
        $set = '';
        foreach ($fields as $field_name => $field_val) {
            $field_val = $this->pdo->quote($field_val);
            $set .= "`$field_name` = $field_val, ";
        }
        $set = rtrim($set, ', ');
        //debug($set);
        return $this->query("UPDATE `products` SET $set WHERE `id` = $id");
    }
}
