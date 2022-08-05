<?php

namespace application\lib\Shop;

use application\lib\Db;

class Cart
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
