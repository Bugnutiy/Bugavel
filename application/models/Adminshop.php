<?php

namespace application\models;

use application\core\Model;
use application\lib\Shop\Categories;
use application\lib\Shop\Properties;
use application\lib\Shop\Products;
use application\lib\Shop\UniShop;

class Adminshop extends Model
{
    public $categories;
    public $properties;
    public $products;
    public $shop;

    function __construct()
    {
        parent::__construct();
        $pdo = $this->db->getPDO();
        $this->shop = new UniShop($pdo);
        $this->categories = $this->shop->categories;
        $this->properties = $this->shop->properties;
        $this->products = $this->shop->products;
    }
    /********************************************************* Свойства */
    public function properties_form_to_new()
    {
        $err = [];
        if (!empty($_POST)) {
            $query = $this->properties->insert_assoc($this->properties->post_to_assoc());
            foreach ($query as $q) {
                if (!$this->db->quer($q)) {
                    $err[] = ['1' => 'Ошибка записи в БД'];
                }
            }
        } else {
            $err[] = ['0' => 'Запрос пустой'];
        }
        return $err;
    }
    public function properties_delete($id)
    {
        $target = $this->properties->getPointers($id);
        $tname = $target['name'];
        // dd($target);
        $this->db->query("DROP TABLE `$tname`");
        $this->db->query("DELETE FROM `properties_pointers` WHERE `id` = $id");
    }
    /********************************************************* Категории */
    public function addcategory()
    {
        $name = $_POST['name'];
        $parent = "'" . $_POST['parent'] . "'";
        if ($_POST['parent'] === 'NULL') {
            $parent = 'NULL';
        }

        $property = $_POST['properties'];

        //dd($q);
        return $this->categories->newCategory($name, $property, $parent);
    }
    public function categories_delete($id)
    {
        return $this->categories->delete_by_field('id', $id);
    }
    /********************************************************* Товары */
    public function addProduct()
    {
        $photos = [];
        if (!empty($_FILES['upload_file']['name'][0])) {
            // ограничение размера файла
            $limit_size = 20 * 1024 * 1024; // 10 Mb
            // корректные форматы файлов
            $valid_format = array("jpeg", "jpg", "gif", "png");
            // путь до нового файла
            $path_file = "public/images/photos/";
            // имя нового файла
            foreach ($_FILES['upload_file']['name'] as $key => $value) {
                $rand_name[$key] = time() . mt_rand(0, 9999);
            }
            //debug($_FILES);
            $arr = $this->setFiles($limit_size, $valid_format, $path_file, $rand_name);

            $photos = $arr['fname'];
        }


        return ($this->products->newProduct($_POST['name'], $_POST['category'], $_POST['description'], $photos));
    }
    public function product_delete($id)
    {
        $product = $this->shop->AllAboutProduct($id);
        foreach ($product['samples'] as $property_id => $value) {
            $this->properties->deleteProperty($product['data_struct']['tname'], $property_id);
        }
        $this->products->remove_by_field('id', $id);
    }
    public function addProductProperty()
    {
        $err = '';
        if (!empty($_POST['tname'])) {
            if (empty($_POST['property_id'])) {

                if (!$this->shop->newProductProperty($_POST['tname'], $_POST['fields'])) {
                    $err = 'Не удалось добавить запись';
                }
            } else {
                if (!$this->shop->updateProperty($_POST['tname'], $_POST['property_id'], $_POST['fields'])) {
                    $err = 'Не удалоcь обновить запись';
                }
            }
        } else {
            $err = 'Отсутствует tname';
        }
        return $err;
    }
    public function getOrders()
    {
        $additions = 'WHERE ';
        if (!empty($_GET['canceled']))
            $additions .= '`canceled` AND ';
        else
            $additions .= 'NOT `canceled` AND ';

        if (!empty($_GET['state'])) {
            $state = $this->db->getPDO()->quote($_GET['state']);
            $additions .= "`state` = $state AND ";
            //return $this->shop->orders->getOrders($additions);
        }
        $additions = rtrim($additions, 'AND ');
        return $this->shop->orders->getOrders($additions);
    }
}
