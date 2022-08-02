<?php

namespace application\models;

use application\core\Model;

class Main extends Model
{
	
	public function getNews()
	{
		$result = $this->db->fetAll('SELECT title, text FROM news');
		return $result;
	}
}

?>