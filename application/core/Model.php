<?php

namespace application\core;

use application\lib\Db;
use application\lib\Sber\Sber;
use application\lib\User\User;
use application\lib\Shop\Shop;

/**
 * Родитель всех моделей, в нём подключаются библиотеки, используемые везде
 */
class Model
{
	/**
	 * @var Db
	 */
	public $db;

	/**
	 * @var Sber
	 */
	public $sber;

	/**
	 * @var User
	 */
	public $user;

	/**
	 * @var Shop
	 */
	public $shop;

	public function __construct()
	{
		$this->db = new Db;
		$this->sber = new Sber($this->db);
		$this->user = new User($this->db);
		$this->shop = new Shop($this->db);
		// dd($_COOKIE);
		// ddd($this->user);
		// dd($_SERVER);
	}

	/**
	 * Сохранятор файлов
	 * @param int $limit_size Максимальный размер файла
	 * @param array $valid_format Массив поддерживаемых форматов
	 * @param string $path_file Путь сохранения
	 * @param array $name имена файлов
	 */
	public function setFiles($limit_size, $valid_format, $path_file, $name)
	{
		// ddd($limit_size);
		$arr['err'] = [];
		$error = "";
		if (!empty(current($_FILES)['name'][0])) {

			foreach (current($_FILES)['name'] as $key => $fname) {
				// валидация размера файла
				if (current($_FILES)['size'][$key] > $limit_size) {
					$arr['err'][] = "Размер файла \"$fname\" превышает допустимый!";
				}

				// валидация формата файла
				//$format = explode(".",current($_FILES)["name"]);
				$format[$key] = strtolower(pathinfo(current($_FILES)["name"][$key], PATHINFO_EXTENSION));
				if (!in_array($format[$key], $valid_format)) {
					$arr['err'][] = "Формат файла \"$fname\" недопустимый!";
				}

				// если не было ошибок
				if (empty($arr['err'])) {
					// проверяем загружен ли файл
					if (is_uploaded_file(current($_FILES)["tmp_name"][$key])) {
						// сохраняем файл
						$arr['fname'][] = $name[$key] . '.' . $format[$key];
						
						if (!file_exists($path_file))
							if (!mkdir($path_file, 0777, 1)) {
								$arr['err'][] = "Не удалось создать директорию $path_file";
								return $arr;
							}
						if (!move_uploaded_file(current($_FILES)['tmp_name'][$key], $path_file . $name[$key] . "." . $format[$key])) {
							$arr['err'][] = "Не удалось переместить файл $name[$key] из загрузок в директорию $path_file";
						}
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
		// dd($arr);
		return $arr;
	}
}
