<?php

session_start();
ini_set('display_errors', 1);
error_reporting(E_ALL);
//

function ddstr($str)
{
	ob_start();
	// echo '<pre>';
	var_dump($str);
	// echo '</pre>';
	return ob_get_clean();
}
function dd($str)
{
	echo "<pre>\n";
	var_dump($str);
	echo '</pre>';
	exit;
}
function ddd($str)
{
	echo "<pre>\n";
	var_dump($str);
	echo '</pre>';
	//exit;
}

function true_array_rand($array = [], $num = 1)
{
	$rand_arr = [];
	if ($num > count($array)) $num = count($array);
	for ($i = 0; $i < $num; $i++) {
		$rand = array_rand($array);
		$rand_arr[$rand] = $array[$rand];
		unset($array[$rand]);
	}

	return $rand_arr;
}

use application\core\Router;

spl_autoload_register(function ($class) {
	$path = str_replace('\\', '/', $class . '.php');
	if (file_exists($path)) {
		require $path;
	}
});
/**
 * @param string full classname
 * @return string min classname
 */
function getClassName($class)
{
	return substr(strrchr($class, '\\'), 1);
}
$router = new Router;
$router->run();
