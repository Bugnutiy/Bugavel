<?php

namespace application\lib\tinkoff\Credit;

use application\lib\Db;
// use PDO;

// const SESSION_DEATH_TIME = (2 * 24 * 60 * 60); //2 дня

// const SESSION_DEATH_TIME = (1 * 60); //1 минута

class Credit
{
  /**
   * @var array Содержит в себе информацию о пользователе
   */
  protected $session;
  /**
   * @var Db
   */
  protected $db;

  function __Construct(&$db)
  {
    $this->db = &$db;
  }
}