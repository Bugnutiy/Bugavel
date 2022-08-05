<?php

namespace application\lib;

use PDO;

class Db
{

	protected $db, $config;
	public function getPDO()
	{
		return $this->db;
	}
	public function __construct()
	{
		$config = require 'application/config/db.php';
		$this->config = $config;
		$this->db = new PDO('mysql:host=' . $config['host'] . ';dbname=' . $config['name'] . ';charset=utf8', $config['user'], $config['password']);
	}

	public function query($sql, $params = [])
	{
		//if($sql!="SET NAMES 'utf8'")
		//$this->query("SET NAMES 'utf8'");
		//$query = $this->db->query($sql); //prepare заменил query
		if (!empty($params)) {
			$stmt = $this->db->prepare($sql);
			$stmt->execute($params);
		} else {
			$stmt = $this->db->prepare($sql);
			$stmt->execute();
		}

		return $stmt;
		//return $query;
	}

	public function fetAll($sql, $params = [])
	{
		//$this->query("SET NAMES 'utf8'");
		$result = $this->query($sql, $params);
		return $result->fetchAll(PDO::FETCH_ASSOC | PDO::FETCH_UNIQUE);
	}

	public function fetColumn($sql, $params = [])
	{
		//$this->query("SET NAMES 'utf8'");
		$result = $this->query($sql, $params);
		return $result->fetchColumn();
	}

	// public function quer($sql)
	// {
	// 	$stmt = $this->db->query($sql);
	// 	//$query = $this->db->query($sql); //prepare заменил query
	// 	return $stmt;
	// 	//return $query;
	// }
	public function Exists($tname)
	{
		$dbname = $this->config['name'];
		$q = $this->query("SHOW TABLES FROM `$dbname` LIKE '$tname';")->fetchAll(PDO::FETCH_ASSOC);
		return !empty($q);
	}
	public function quote($string, $param = NULL)
	{
		return $this->db->quote($string, $param);
	}
	/**
	 * Добавить запись в таблицу
	 * @param string $tname имя таблицы
	 * @param array $fields свойство=>значение
	 * @return 1|0 Успешность операции
	 */
	public function insert($tname, $fields)
	{
		$fieldstr = '';
		$valuestr = '';
		$valuearr = [];
		$i = 0;
		foreach ($fields as $field => $value) {
			$fieldstr .= '`' . $field . '`, ';

			$valuestr .= ':' . $i . ', ';

			$valuearr[':' . $i] = $value;
			$i++;
		}
		$fieldstr = substr($fieldstr, 0, -2);
		$valuestr = substr($valuestr, 0, -2);
		$q = "INSERT INTO `$tname` ($fieldstr) VALUES ($valuestr)";
		// ddd($q);
		//ddd($valuearr);
		//dd($q);
		return $this->query($q, $valuearr)->rowCount();
	}
	/**
	 * Обновить запись в таблице
	 * @param string $tname Имя таблицы
	 * @param array $fields свойство=>значение
	 * @param string $sign Условие поиска
	 * @return 1|0 Успешность операции
	 */
	public function update($tname, $fields, $sign)
	{
		$set = '';
		$valuearr = [];
		$i = 0;
		foreach ($fields as $field => $value) {
			$set .= "`$field` = :$i, ";
			$valuearr[':' . $i] = $value;
			$i++;
		}
		$set = substr($set, 0, -2);
		//dd($set);
		if (is_string($sign)) {
			$q = "UPDATE `$tname` SET $set WHERE ($sign)";
			return $this->query($q, $valuearr)->rowCount();
		}

		return 0;
	}
	/**
	 * @param string $tname Имя таблицы
	 * @param string|NULL $sign Условие поиска,
	 * @param array|NULL $params PDO:prepare params
	 */
	public function fetAllLite($tname, $sign = '', $params = [])
	{
		if (empty($sign))
			return $this->fetAll("SELECT * FROM `$tname`");
		else
			return $this->fetAll("SELECT * FROM `$tname` WHERE ($sign)", $params);
	}
	/**
	 * @param string $tname Имя таблицы
	 * @param string|NULL $sign Условие поиска,
	 * @param array|NULL $params PDO:prepare params
	 * 
	 * @return PDOStatement
	 */
	public function Delete($tname, $sign = '', $params = [])
	{
		return $this->query("DELETE FROM `$tname` WHERE ($sign)", $params);
	}
}
