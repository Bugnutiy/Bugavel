<?php

namespace application\controllers;

use application\core\Controller;
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
		$vars = [];
		if (!empty($_GET['addcart'])) {
			$this->model->shop->cart->addToCart($_GET['addcart'], $this->model->user->getUserId());
		}
		if (!empty($_GET['category'])) {
			$vars = [
				'products' => $this->model->shop->products->getByCategoryId($_GET['category']),
			];

			$this->view->render([
				'RU' => 'LeoSmagin - ' . (empty($this->view->default_vars['categories'][$_GET['category']]) ? 'Каталог' : $this->view->default_vars['categories'][$_GET['category']]['name']),

				'EN' => 'LeoSmagin - ' . (empty($this->view->default_vars['categories'][$_GET['category']]) ? 'Catalog' : $this->view->default_vars['categories'][$_GET['category']]['name_en'])
			], $vars);
		} else {
			$vars = [
				'products' => $this->model->shop->products->getAll(),
			];
		}
		// dd($vars);
		$this->view->render(['RU' => 'LeoSmagin - Каталог', 'EN' => 'LeoSmagin - Catalog'], $vars);
	}
}
