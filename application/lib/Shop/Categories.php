<?php

namespace application\lib\Shop;

use PDO;

class Categories
{

    protected $tree = [], $html = '', $data, $pdo;
    protected $user_id;
    function __construct(&$pdo, $user_id)
    {
        $this->pdo = &$pdo;
        $this->user_id = $user_id;
        $this->data = $this->query("SELECT * FROM `categories`")->fetchAll(PDO::FETCH_UNIQUE | PDO::FETCH_ASSOC);

        $this->tree = $this->mapTree($this->data);
        $this->html = $this->cat_to_string($this->tree);
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

    private function mapTree($dataset)
    {
        $tree = [];
        foreach ($dataset as $id => &$node) {
            //dd($id);
            if (!$node['parent']) {
                $tree[$id] = &$node;
            } else {
                $dataset[$node['parent']]['childs'][$id] = &$node;
            }
        }
        return $tree;
    }

    private function cat_to_string($data, $lvl = 0)
    {
        $str = '';
        foreach ($data as $id => $item) {
            $item['id'] = $id;
            $str .= $this->cat_template($item, $lvl);
        }
        return $str;
    }

    private function cat_template($category, $lvl = 0)
    {
        ob_start();
        include 'categories_pattern.php';
        return ob_get_clean();
    }

    public function getHtml()
    {
        return $this->html;
    }

    public function getTree()
    {
        return $this->tree;
    }
    public function getDb($id = false)
    {
        if ((int)$id)
            if (!empty($this->data[$id]))
                return $this->data[$id];
            else return false;
        return $this->data;
    }
    public function newCategory($name, $property, $parent)
    {
        $name = $this->pdo->quote($name);
        $q = "INSERT INTO `categories` (`name`, `properties_id` , `parent`) VALUES ($name, '$property', $parent)";
        return $this->query($q);
    }
    public function delete_by_field($fieldname, $fieldval, $additions = [])
    {
        $fieldval = $this->pdo->quote($fieldval);
        return $this->query("DELETE FROM `categories` WHERE `$fieldname` = $fieldval");
    }
    protected function category_to_breadcrumbs_arr($id, $arr = [])
    {
        if (isset($this->data[$id])) {
            $arr[$id] = $this->data[$id];
            if (!!$arr[$id]['parent']) {
                $arr = $this->category_to_breadcrumbs_arr($arr[$id]['parent'], $arr);
            }
        }
        return $arr;
    }
    public function breadcrumbs_array($id = NULL)
    {
        $id = (int)$id;
        if (!$id) return [];
        //$arr = $this->category_to_breadcrumbs_arr($id);
        $arr = array_reverse($this->category_to_breadcrumbs_arr($id), true);
        return $arr;
        // $this->
    }
}
