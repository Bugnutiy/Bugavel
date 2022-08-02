<?php

namespace application\lib\Shop;

use application\lib\Db;

/**
 * [Class General]
 */
abstract class General
{
    /**
     *@var Db 
     */
    protected $db;
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
    public function getAll()
    {
        return $this->db->fetAllLite($this->table);
    }
    /**
     * getById
     *
     * @param int|string $id
     * 
     * @return array
     */
    public function getById($id)
    {
        // if (empty($this->entries)) {
        return $this->db->fetAllLite($this->table, '`id` = :id', ['id' => $id]);
        // }
        // return [$id => $this->$entries[$id]];
    }
    /**
     * @param array $arr Массив
     */
    public function Update($arr)
    {
        $err = [];
        // dd($arr);
        if (empty($arr)) return $err[] = 'Запрос оказался пуст';
        if (isset($arr['images'])) {
            $arr['images'] = json_encode($arr['images']);
        }

        if (!empty($arr['id'])) {
            $id = $arr['id'];
            if (isset($arr['images'])) {
                $images = json_decode(current($this->getById($id))['images'], 1);
                //dd($images);
                if (!empty($images)) {
                    foreach ($images as $image) {
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
            if (!$this->db->insert($this->table, $arr)) {
                $err[] = 'Создать запись в БД не удалось';
            }
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

        return $this->db->delete($this->table, '`id` = :id', ['id' => $id]);
    }
}
