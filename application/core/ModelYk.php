<?php

namespace application\core;

use application\lib\Db;
use application\lib\Yk;

/*abstract class Model
{
	public $db;
	//public $yk;

	public function __construct()
	{
		$this->db = new Db;
		//$this->yk = new Yk;
	}
}//*/

/**
 * 
 */
abstract class ModelYk
{
	public $db;
	public $yk;
	public function __construct()
	{
		$this->db = new Db;
		$this->yk = new Yk;
	}
}//*/

?>