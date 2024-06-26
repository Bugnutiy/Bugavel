<?php

namespace application\core;
/**
 * Класс шаблонов и вывода инфы
 */
class View
{
	public $folder = "application/views/";
	public $path;
	public $route;
	/**
	 * Массив стандартных переменных для view-шаблона
	 *
	 * @var array [переменная => значение]
	 */
	public $default_vars =[];
	
	public $layout = 'default';

	/**
	 * __construct
	 *
	 * @param array $route
	 * @param array|null $default_vars
	 */
	public function __construct($route)
	{
		$this->route = $route;
		$this->path = $route['controller'] . '/' . $route['action'];
		// $this->default_vars = $default_vars;
		//debug($this->path);
	}

	/**
	 * Отображение страницы
	 *
	 * @param string $title
	 * @param array $vars
	 * 
	 * @return void
	 */
	public function render($title, $vars = [])
	{
		extract($this->default_vars);
		extract($vars);
		$path = 'application/views/' . $this->path . '.php';
		if (file_exists($path)) {
			ob_start();
			require $path;
			$content = ob_get_clean();
			require 'application/views/layouts/' . $this->layout . '.php';
			//debug($this->layout);
		} else {
			echo 'Вид не найден: ' . $this->path . '.php';
		}
	}

	/**
	 * redirect
	 *
	 * @param string $url
	 * 
	 * @return void
	 */
	public static function redirect($url)
	{
		header('location: ' . $url);
		exit;
	}

	/**
	 * Отображение ошибок
	 *
	 * @param int|string $code
	 * 
	 * @return void
	 */
	public static function errorCode($code)
	{
		http_response_code($code);
		$path = 'application/views/errors/' . $code . '.php';
		if (file_exists($path))
			require $path;
		else
			echo "View: неизвестная ошибка. Код: $code";
		exit;
	}

	public function message($status, $message)
	{
		exit(json_encode(['status' => $status, 'message' => $message]));
	}

	public function location($url)
	{
		exit(json_encode(['url' => $url]));
	}
}
