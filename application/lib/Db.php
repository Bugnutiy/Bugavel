<?php

namespace application\lib;

use application\core\View;
use PDO;
use PDOStatement;

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
		try {
			$this->db = new PDO('mysql:host=' . $config['host'] . ';dbname=' . $config['name'] . ';charset=utf8', $config['user'], $config['password']);
		} catch (\Exception $th) {
			// throw $th;
			View::errorCode(502);
		}
	}

	public function query($sql, $params = [])
	{
		// dd($sql);
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
	 * @param array $fields поле=>значение
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

			$valuestr .= ':f' . $i . ', ';

			$valuearr[':f' . $i] = $value;
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
		// dd($sign);
		$set = '';
		$valuearr = [];
		$i = 0;
		foreach ($fields as $field => $value) {
			$set .= "`$field` = :f$i, ";
			$valuearr[':f' . $i] = $value;
			$i++;
		}
		$set = substr($set, 0, -2);
		//dd($set);
		if (is_string($sign)) {
			$q = "UPDATE `$tname` SET $set WHERE ($sign)";
			// ddd($q);
			// dd($valuearr);
			return $this->query($q, $valuearr)->rowCount();
		}

		return 0;
	}
	/**
	 * @param string $tname Имя таблицы
	 * @param string|NULL $sign Условие поиска, WHERE писать не нужно
	 * @param array|NULL $params PDO:prepare params Параметры для поиска, без них не работает
	 * @param array|NULL $page [Страница => количество записей на странице] [1=>10]
	 */
	public function fetAllLite($tname, $sign = '', $params = [], $page = [])
	{
		$limit = '';
		if (!empty($page)) {
			$n = current($page);
			$page = key($page);
			// $start = $n * (--$page);
			$start = --$page * $n;
			$limit = " LIMIT $start,$n";
		}

		if (empty($sign) and empty($params)) {
			return $this->fetAll("SELECT * FROM `$tname`" . $limit);
		} elseif (!empty($sign) and !empty($params)) {
			return $this->fetAll("SELECT * FROM `$tname` WHERE ($sign)" . $limit, $params);
		} else return NULL;
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
	/**
	 * Создать новую таблицу (не реализовано)
	 * @param string $tname Имя таблицы
	 * @param array  $fields Настройки поля таблицы ['поле'=>['параметр'=>'значение']]
	 * 
	 * @return PDOStatement
	 */
	public function NewTable($tname, $fields)
	{
		# code...
	}
	public function LastInsertId()
	{
		return $this->db->lastInsertId();
	}
}
