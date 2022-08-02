<?php

namespace application\lib\Shop;

use PDO;

class Properties
{
    protected $db, $pointers, $pdo;
    protected $user_id;
    function __construct(&$pdo, $user_id)
    {
        $this->pdo = &$pdo;
        $this->user_id = $user_id;
        $this->pointers = $this->query("SELECT * FROM `properties_pointers`")->fetchAll(PDO::FETCH_UNIQUE | PDO::FETCH_ASSOC);
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
    public function getPointers($id = false)
    {
        if ((int)$id)
            if (!empty($this->pointers[$id]))
                return $this->pointers[$id];
            else return false;
        return $this->pointers;
    }
    public function getPointersByField($fieldname, $fieldval, $additions)
    {
        $fieldval = $this->pdo->quote($fieldval);
        return $this->query("SELECT * FROM `properties_pointers` WHERE `$fieldname` = $fieldval $additions")->fetchAll(PDO::FETCH_UNIQUE | PDO::FETCH_ASSOC);
    }
    public function getProperties($name, $id = false)
    {
        $arr = $this->query("SELECT * FROM `$name`")->fetchAll(PDO::FETCH_UNIQUE | PDO::FETCH_ASSOC);
        if ($id) {
            return $arr[$id];
        }
        return $arr;
    }
    public function getPropertiesByField($name, $fieldname, $fieldval, $additions = '')
    {
        $fieldval = $this->pdo->quote($fieldval);
        $arr = $this->query("SELECT * FROM `$name` WHERE `$fieldname` = $fieldval $additions")->fetchAll(PDO::FETCH_UNIQUE | PDO::FETCH_ASSOC);

        return $arr;
    }

    public function remove_by_field($field_name, $field_val, $addition = '')
    {
    }
    public function insert_assoc($arr)
    {
        $quer = [];
        $name = $arr['tname'];
        $fields_str = json_encode($arr, JSON_UNESCAPED_UNICODE);
        $quer[] = "INSERT INTO `properties_pointers` (`name`, `data_struct`) VALUES ('$name', '$fields_str')";
        $fields = '';
        foreach ($arr['fields'] as $fname => $info) {
            $data_type = $info['data_type'];
            $nul = $info['NULL'];
            $fields .= "`$fname` $data_type $nul , ";
        }
        $quer[] = "CREATE TABLE `$name` ( `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT , `product_id` INT(11) UNSIGNED NOT NULL , $fields PRIMARY KEY (`id`)) ENGINE = InnoDB;";
        return $quer;
    }
    public function post_to_assoc()
    {
        $assoc = [];
        $arr = [];
        $additions = [];
        $tname = $_POST['tname'];
        if (!empty($_POST['additions'])) {
            $additions = $this->additions_names_to_fields($_POST['additions']);
        }
        //dd($_POST);
        foreach ($_POST['field_name'] as $key => $field_name) {
            $arr[$field_name] = [
                'data_type' => $_POST['data_type'][$key],
                'filter_type' => $_POST['filter_type'][$key],
                'NULL' => $_POST['NULL'][$key],
            ];
        }
        $arr['created_at'] = [
            'data_type' => 'TIMESTAMP',
            'filter_type' => 'NONE',
            'NULL' => 'NOT NULL DEFAULT CURRENT_TIMESTAMP'
        ];
        $arr['changed_at'] = [
            'data_type' => 'TIMESTAMP',
            'filter_type' => 'NONE',
            'NULL' => 'on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP'
        ];

        $assoc['tname'] = $tname;
        $assoc['fields'] = array_merge($arr, $additions);
        //dd($additions);
        if (!empty($_POST['different'])) {
            $assoc['fields'][$_POST['field_name'][$_POST['different']]]['different'] = true;
            $assoc['different'] = $_POST['field_name'][$_POST['different']];
        }
        //debug($assoc);
        return $assoc;
    }
    private function additions_names_to_fields($additions)
    {
        $arr = [];
        foreach ($additions as $addition) {
            switch ($addition) {
                case 'price':
                    $arr['цена'] = [
                        'data_type' => 'DECIMAL(19,2)',
                        'filter_type' => 'limit',
                        'NULL' => 'NOT NULL'
                    ];
                    $arr['закупочная цена'] = [
                        'data_type' => 'DECIMAL(19,2)',
                        'filter_type' => 'NONE',
                        'NULL' => 'NULL'
                    ];
                    // $arr['цена для оптовиков'] = [
                    //     'data_type' => 'DECIMAL(19,2)',
                    //     'filter_type' => 'NONE',
                    //     'NULL' => 'NULL'
                    // ];
                    break;

                case 'quantity':
                    $arr['количество'] = [
                        'data_type' => 'FLOAT',
                        'filter_type' => 'limit',
                        'NULL' => 'NOT NULL'
                    ];
                    // $arr['продано всего'] = [
                    //     'data_type' => 'FLOAT',
                    //     'filter_type' => 'NONE',
                    //     'NULL' => 'NULL'
                    // ];
                    // $arr['продано в этом месяце'] = [
                    //     'data_type' => 'FLOAT',
                    //     'filter_type' => 'NONE',
                    //     'NULL' => 'NULL'
                    // ];
                    // $arr['продано на этой неделе'] = [
                    //     'data_type' => 'FLOAT',
                    //     'filter_type' => 'NONE',
                    //     'NULL' => 'NULL'
                    // ];
                    break;

                default:
                    $arr[$addition] = [
                        'data_type' => 'VARCHAR(50)',
                        'filter_type' => 'NONE',
                        'NULL' => 'NULL'
                    ];
                    break;
            }
        }
        return $arr;
    }
    public function newProductProperty($tname, $fields)
    {
        $fieldstr = '';
        $valstr = '';
        foreach ($fields as $fname => $fval) {
            $fieldstr .= "`$fname`, ";
            if ($fval !== 'NULL')
                $valstr .= $this->pdo->quote($fval) . ', ';
            else {
                $valstr .= 'NULL, ';
            }
        }
        $fieldstr = mb_substr($fieldstr, 0, -2);
        $valstr = mb_substr($valstr, 0, -2);
        // dd($fieldstr);
        // dd($valstr);
        $q = "INSERT INTO `$tname` ($fieldstr) VALUES ($valstr)";

        return $this->query($q);
    }
    public function updateProperty($tname, $property_id, $fields)
    {
        //dd($fields);
        $set = '';
        foreach ($fields as $fname => $fval) {
            $set .= "`$fname` = ";
            if ($fval !== 'NULL')
                $set .= $this->pdo->quote($fval) . ', ';
            else {
                $set .= 'NULL, ';
            }
        }
        $set = mb_substr($set, 0, -2);
        //dd($set);

        $q = "UPDATE `$tname` SET $set WHERE `id` = $property_id";
        return $this->query($q);
    }
    public function deleteProperty($tname, $id)
    {
        $q = "DELETE FROM `$tname` WHERE `id` = $id";
        return $this->query($q);
    }
}
