<?php

namespace application\controllers;

use application\core\Controller;
use application\core\View;
use application\lib\Shop\Products;
use application\lib\Shop\Cart;

use function PHPSTORM_META\type;

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
			"route" => $route,
			"cart_total" => $this->model->shop->cart->getTotal($this->model->user->getUserId())
		];
		// $alerts = [
		// 	0 => [
		// 		'type'=>'danger',
		// 		'RU'=>'',
		// 		'EN'=>''
		// 	]
		// ];
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
			if (empty($err)) {
				$cart_total = $this->model->shop->cart->getTotal($this->model->user->getUserId());
				$alert[] = [
					'type' => 'success',
					'RU' => 'Товар добавлен в корзину',
					'EN' => 'The product has been added to the cart'
				];
				$vars = array_merge($vars, [
					'alerts' => $alert,
					'cart_total' => $cart_total,
				]);
			} else $vars = array_merge($vars, ['err' => $err]);
		}
		$products = [];
		if (!empty($_GET['category'])) {
			$products = $this->model->shop->products->getByCategoryId($_GET['category']);
		} else {
			$products = $this->model->shop->products->getAll();
		}
		foreach ($products as $product_id => $value) {
			$products[$product_id]['properties'] = $this->model->shop->products_properties->getByProductId($product_id, 1);
		}
		$vars = array_merge($vars, [
			'products' => $products,
		]);
		// $_SERVER['REQUEST_URI']=str_replace($_SERVER['REDIRECT_QUERY_STRING'],'',$_SERVER['REQUEST_URI']);
		// dd($_SERVER);
		if (!empty($_GET['category'])) {
			$this->view->render([
				'RU' => 'LeoSmagin - ' . (empty($this->view->default_vars['categories'][$_GET['category']]) ? 'Каталог' : $this->view->default_vars['categories'][$_GET['category']]['name']),

				'EN' => 'LeoSmagin - ' . (empty($this->view->default_vars['categories'][$_GET['category']]) ? 'Catalog' : $this->view->default_vars['categories'][$_GET['category']]['name_en'])
			], $vars);
			exit;
		} else {
			$this->view->render([
				'RU' => 'LeoSmagin - Все товары',
				'EN' => 'LeoSmagin - All goods',
			], $vars);
		}
	}
	public function productAction()
	{
		$vars = [];
		$alerts = [];
		if (!empty($_POST['property_id']) && !empty($_POST['quantity'])) {
			// dd($_POST);
			$err = $this->model->shop->cart->addToCart($_POST['property_id'], $this->model->user->getUserId(), $_POST['quantity']);
			// dd($err);
			if (empty($err)) {
				$alerts[] = [
					'type' => 'success',
					'RU' => 'Товар добавлен в корзину',
					'EN' => 'The product has been added to the cart'
				];
			}
			$cart_total = $this->model->shop->cart->getTotal($this->model->user->getUserId());
			// dd($this->model->shop->cart->getByUser($this->model->user->getUserId()));
			// dd($cart_total);
			$vars = array_merge($vars, [
				'err' => $err,
				'alerts' => $alerts,
				'cart_total' => $cart_total
			]);
		}
		// $this->view->path=$this->route['controller'] . '/' .'productview';
		if (empty($_GET['id'])) View::redirect('/');

		$product = $this->model->shop->products->getById($_GET['id']);
		if (empty($product)) View::redirect('/');

		$category = $this->model->shop->categories->getById(current($product)['category_id']);
		if (empty($category)) View::redirect('/');

		$properties = $this->model->shop->products_properties->getByProductId($_GET['id']);
		if (empty($properties)) View::redirect('/');

		$avaliable_properties = $this->model->shop->products_properties->getByProductId($_GET['id'], 1);
		if (empty($properties)) View::redirect('/');

		$vars = array_merge($vars, [
			'product' => $product,
			'category' => current($category),
			'properties' => $properties,
			'avaliable_properties' => $avaliable_properties,
		]);

		$this->view->render(
			[
				'RU' => 'LeoSmagin - ' . current($product)['name'],
				'EN' => 'LeoSmagin - ' . current($product)['name_en']
			],
			$vars
		);
	}
	public function cartAction()
	{
		$vars = [];

		$vars = array_merge($vars, [
			'cart' => $this->model->shop->cart->getByUser($this->model->user->getUserId()),
			'properties'=>$this->model->shop->products_properties->getAll(),
			'products'=>$this->model->shop->products->getAll(),
		]);
		// dd($vars);
		$this->view->render(
			[
				'RU' => 'Ваша корзина - LeoSmagin.com',
				'EN' => 'Your Shopping Cart - LeoSmagin.com'
			],
			$vars
		);
		// dd('cart');
	}
}
