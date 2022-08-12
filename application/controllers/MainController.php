<?php

namespace application\controllers;

use application\core\Controller;
use application\core\View;
use application\lib\Shop\Products;
use application\lib\Shop\Cart;

// use application\lib\Db;
// use application\models\AdminModel;
/**
 * Class AdminController
 */
class MainController extends Controller
{

	function __construct($route)
	{
		parent::__construct($route);

		if (isset($_GET['lang'])) {
			$lang = &$_GET['lang'];
			if ($lang == "RU") {
				$this->model->user->update($this->model->user->getUserId(), ['lang' => 'RU']);
			} elseif ($lang == "EN") {
				$this->model->user->update($this->model->user->getUserId(), ['lang' => 'EN']);
			}
		}
		$this->view->layout = 'mainLayout';
		$this->view->default_vars = [
			"categories" => $this->model->shop->categories->getAll(),
			"user" => $this->model->user->getUser(),
			"route" => $route
		];
	}

	public function indexAction()
	{
		//debug($_SESSION);
		// dd("Dd");
		// dd($this->view->layout);
		$this->view->render(['RU' => 'LeoSmagin - Главная страница', 'EN' => 'LeoSmagin - Main page']);
	}

	public function catalogAction()
	{
		$err = [];
		$vars = [];
		if (!empty($_GET['addcart'])) {
			// dd($this->model->shop->cart->addToCart($_GET['addcart'], $this->model->user->getUserId()));

			$err = array_merge($err, $this->model->shop->cart->addToCart($_GET['addcart'], $this->model->user->getUserId()));
			$vars = array_merge($vars, ['err' => $err]);
		}
		if (!empty($_GET['category'])) {
			$products = $this->model->shop->products->getByCategoryId($_GET['category']);
			foreach ($products as $product_id => $value) {
				$products[$product_id]['properties'] = $this->model->shop->products_properties->getByProductId($product_id);
			}
			$vars = array_merge($vars, [
				'products' => $products,
			]);
			// $this->model->shop->products_properties->getByProductId()
			$this->view->render([
				'RU' => 'LeoSmagin - ' . (empty($this->view->default_vars['categories'][$_GET['category']]) ? 'Каталог' : $this->view->default_vars['categories'][$_GET['category']]['name']),

				'EN' => 'LeoSmagin - ' . (empty($this->view->default_vars['categories'][$_GET['category']]) ? 'Catalog' : $this->view->default_vars['categories'][$_GET['category']]['name_en'])
			], $vars);
			exit;
		} else {
			$vars = array_merge($vars, [
				'products' => $this->model->shop->products->getAll(),
			]);
		}
		// dd($vars);
		$this->view->render(['RU' => 'LeoSmagin - Каталог', 'EN' => 'LeoSmagin - Catalog'], $vars);
	}
	public function productAction()
	{
		$vars = [];
		// $this->view->path=$this->route['controller'] . '/' .'productview';
		if (empty($_GET['id'])) View::redirect('/');

		$product = $this->model->shop->products->getById($_GET['id']);
		if (empty($product)) View::redirect('/');

		$properties = $this->model->shop->products_properties->getByProductId($_GET['id']);
		if (empty($properties)) View::redirect('/');

		$vars = array_merge($vars, [
			'product' => $product,
			'properties' => $properties,
		]);

		$this->view->render(['RU' => 'LeoSmagin - Каталог', 'EN' => 'LeoSmagin - Catalog'],$vars);

	}
}
