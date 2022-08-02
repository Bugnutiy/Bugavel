<?php

namespace application\core;

use application\lib\Db;
//use application\lib\Yk;

abstract class Model
{
	public $db;
	//public $yk;
	public function setFiles($limit_size, $valid_format, $path_file, $name)
	{
		$arr['err'] = [];
		$error = "";
		if (!empty($_FILES['upload_file']['name'][0])) {

			foreach ($_FILES['upload_file']['name'] as $key => $fname) {
				// валидация размера файла
				if ($_FILES['upload_file']['size'][$key] > $limit_size) {
					$arr['err'] = "Размер файла \"$fname\" превышает допустимый!";
				}

				// валидация формата файла
				//$format = explode(".",$_FILES["upload_file"]["name"]);
				$format[$key] = strtolower(pathinfo($_FILES["upload_file"]["name"][$key], PATHINFO_EXTENSION));
				if (!in_array($format[$key], $valid_format)) {
					$arr['err'] = "Формат файла \"$fname\" недопустимый!";
				}

				// если не было ошибок
				if (empty($arr['err'])) {
					// проверяем загружен ли файл
					if (is_uploaded_file($_FILES["upload_file"]["tmp_name"][$key])) {
						// сохраняем файл
						$arr['fname'][] = $name[$key] . '.' . $format[$key];
						move_uploaded_file($_FILES['upload_file']['tmp_name'][$key], $path_file . $name[$key] . "." . $format[$key]);
					} else {
						// Если файл не загрузился
						$arr['err'][] = "Ошибка загрузки $fname!";
					}
				}
			}
		} else {
			$arr['err'][] = "Файлы отсутствуют!";
		}
		if (!empty($arr['err'])) {
		} else if ($_FILES) {
			$arr['err'] = 0;
		}
		return $arr;
	}
	public function __construct()
	{
		$this->db = new Db;
		//$this->yk = new Yk;
	}
}

/**
 * 
 */
/*abstract class ModelYk
{
	public $yk;
	public function __construct()
	{
		$this->Model();
		$this->yk = new Yk;
	}
}//*/
