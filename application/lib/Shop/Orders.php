<?php

namespace application\lib\Shop;

use application\lib\Db;

class Orders
{
    /**
     * @var Db
     */
    private $db;
    function __construct(&$db)
    {
        $this->db = &$db;
    }
}
