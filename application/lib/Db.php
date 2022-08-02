<?php

namespace application\lib;

use PDO;

class Db
{

	protected $db;
	public function getPDO()
	{
		return $this->db;
	}
	public function __construct()
	{
		$config = require 'application/config/db.php';
		$this->db = new PDO('mysql:host=' . $config['host'] . ';dbname=' . $config['name'] . ';charset=utf8', $config['user'], $config['password']);
	}

	public function query($sql, $params = [])
	{
		$stmt = $this->db->prepare($sql);
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

	public function fetAll($sql, $params = [])
	{
		//$this->query("SET NAMES 'utf8'");
		$result = $this->query($sql, $params);
		return $result->fetchAll(PDO::FETCH_ASSOC);
	}

	public function fetColumn($sql, $params = [])
	{
		//$this->query("SET NAMES 'utf8'");
		$result = $this->query($sql, $params);
		return $result->fetchColumn();
	}

	public function quer($sql)
	{
		$stmt = $this->db->query($sql);
		//$query = $this->db->query($sql); //prepare заменил query
		return $stmt;
		//return $query;
	}
}
