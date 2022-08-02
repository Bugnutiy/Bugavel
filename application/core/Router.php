<?php

namespace application\core;

use application\core\View;

class Router
{
	protected $routes;
	protected $params;
	public function __construct()
	{
		$arr = require 'application/config/routes.php';
		foreach ($arr as $key => $val) {
			$this->add($key, $val);
		}
	}

	public function add($route, $params)
	{
		$route = '#^' . $route . '$#';
		$this->routes[$route] = $params;
	}

	public function match()
	{
		$url = trim($_SERVER['REQUEST_URI'], '/');
		$url = str_replace('?' . $_SERVER['QUERY_STRING'], '', $url);
		/*$deb=['REQUEST_URI'=>$_SERVER['REQUEST_URI'],
				'$url'=>$url,
		];
		debug($deb);*/
		//debug($_GET);
		foreach ($this->routes as $route => $params) {
			if (preg_match($route, $url, $matches)) {
				$this->params = $params;
				return true;
			}
		}
		return false;
	}

	public function run()
	{
		if ($this->match()) {
			$path = 'application\controllers\\' . ucfirst($this->params['controller']) . 'Controller';
			//debug(class_exists($path));
			if (class_exists($path)) {
				$action = $this->params['action'] . 'Action';
				if (method_exists($path, $action)) {
					$controller = new $path($this->params);
					$controller->$action();
				} else {
					View::errorCode(402);
					//action
				}
			} else {
				View::errorCode(403);
				//controller
				//echo $path;
			}
		} else {
			View::errorCode(404);
			//маршрут
		}

		//echo 'start';
	}
}
