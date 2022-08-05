<?php

namespace application\lib\Shop;

use application\lib\Shop\General;

class Products extends General
{

    /**
     * Class constructor.
     */
    public function __construct(&$db)
    {
        parent::__construct($db, strtolower(getClassName(self::class)));
    }
}
