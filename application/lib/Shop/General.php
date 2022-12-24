<?php

namespace application\lib\Shop;

use application\lib\Db;
use PDO;

/**
 * [Class General]
 */
abstract class General
{
    /**
     *@var Db 
     */
    public $db;
    /**
     * @var string название таблицы
     */
    protected $table;
    // /**
    //  * @var array все записи
    //  */
    // protected $entries = [];
    /**
     * __construct
     *
     * @param Db $db
     * @param string $tname
     */
    function __construct(&$db, $tname)
    {
        $this->table = $tname;
        $this->db = &$db;
    }
    /**
     * Получить записи, соответствующие значению определенного столбца
     *
     * @param string $field_name Имя поля таблицы. Не давать доступ из фронтэнда! Не защищено!
     * @param string|number $field_value 
     * @return array Ассоциативный массив записей
     */
    public function getByField($field_name, $field_value)
    {
        return $this->db->fetAllLite($this->table, "`$field_name` = :value", [':value' => $field_value]); //TODO SECURITY
    }
    /**
     * Получить все записи из таблицы, соответствующей имени класса
     * @param string|NULL $sign Условие поиска, WHERE писать не нужно
     * @param array|NULL $params PDO:prepare params Параметры для поиска, без них не работает sign
     * @param array|NULL $page [Страница => количество записей на странице] [1=>10]
	 * @param array|NULL $order ['поле'=>'ASC/DESC']
     * 
     * 
     * @return array Ассоциативный массив записей
     */
    public function getAll($sign = '', $params = [], $page = [], $order=[])
    {
        return $this->db->fetAllLite($this->table, $sign, $params, $page, $order);
    }
    /**
     * getById
     *
     * @param int|string|null $id
     * 
     * @return array
     */
    public function getById($id = NULL)
    {
        // if (empty($this->entries)) {
        if (!empty($id))
            return $this->db->fetAllLite($this->table, '`id` = :id', ['id' => $id]);
        return $this->getAll();
        // }
        // return [$id => $this->$entries[$id]];
    }
    /**
     * @param array $arr Массив
     */
    public function Update($arr)
    {
        $err = [];
        if (empty($arr)) {
            $err[] = 'Запрос оказался пуст';
            return $err;
        }
        if (isset($arr['images'])) {
            $arr['images'] = json_encode($arr['images']);
        }
        if (isset($arr['images_min'])) {
            $arr['images_min'] = json_encode($arr['images_min']);
        }
        if (!empty($arr['id'])) {
            $id = $arr['id'];
            unset($arr['id']);
            $exist = current($this->getById($id));
            $table = $this->table;
            $structure = $this->db->query("DESCRIBE `$table`")->fetchAll(PDO::FETCH_GROUP);
            // dd($structure);
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
            // dd($arr);   
            if ($matcher == $arr) {
                $err[] = 'Поменяйте хотя бы одно значение';
                return $err;
            }
            if (isset($arr['images'])) {
                $exists_images = json_decode($exist['images'], 1);
                if (!empty($exists_images)) {
                    foreach ($exists_images as $image) {
                        if (file_exists($image)) {
                            unlink($image);
                        }
                    }
                }
            }
            if (isset($arr['images_min'])) {
                $exists_images_min = json_decode($exist['images_min'], 1);
                if (!empty($exists_images_min)) {
                    foreach ($exists_images_min as $image) {
                        if (file_exists($image)) {
                            unlink($image);
                        }
                    }
                }
            }

            if (!$this->db->update($this->table, $arr, "`id` = $id")) {
                $err[] = 'Обновить запись в таблице ' . $this->table . ' не удалось';
            }
        } else {
            $exist = current($this->db->fetAllLite($this->table, NULL, NULL, [1 => 1]));
            if (!empty($exist)) {
                $matcher = [];
                foreach ($arr as $key => $value) {
                    if (isset($exist[$key]))
                        $matcher[$key] = $exist[$key];
                    else {
                        $err[] = 'В таблице ' . $this->table . ' не созданы столбцы с такими именами';
                        return $err;
                    }
                }
            }
            if (!$this->db->insert($this->table, $arr)) {
                $err[] = 'Создать запись в таблице ' . $this->table . ' не удалось';
            }
        }

        return $err;
    }
    /**
     * Delete
     *
     * @param int|string $id
     * 
     * @return 0|int Quantity
     */
    public function Delete($id)
    {
        $exist = current($this->getById($id));
        if (isset($exist['images'])) {
            $images = json_decode($exist['images'], 1);
            foreach ($images as $image) {
                if (file_exists($image)) {
                    unlink($image);
                }
            }
        }
        if (isset($exist['images_min'])) {
            $images_min = json_decode($exist['images_min'], 1);
            foreach ($images_min as $image) {
                if (file_exists($image)) {
                    unlink($image);
                }
            }
        }
        return $this->db->delete($this->table, '`id` = :id', ['id' => $id])->rowCount();
    }
}
