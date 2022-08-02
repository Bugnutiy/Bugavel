<?php

namespace application\lib\Shop\Db;

use PDO;

abstract class UniShopDB
{
    /**
     * @see PDO
     */
    protected $pdo;

    protected $user_id;
    /**
     * Class constructor.
     */
    function __construct(&$pdo)
    {
        $this->pdo = &$pdo;
    }

    protected function query($sql, $params = [])
    {
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
    protected function quote(&$str, $return = false)
    {
        if ($return) {
            return $this->pdo->quote($str);
        } else
            $str = $this->pdo->quote($str);
    }
    public function Log($user_id, $sql)
    {
        $this->quote($user_id);
        $this->quote($sql);
        return $this->query("INSERT INTO `log` ( `user_id`, `query` ) VALUES ( $user_id, $sql )");
    }
}
