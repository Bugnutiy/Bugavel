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
				if (isset($_SESSION['admin'])) {
					$this->model->user->update($this->model->user->getUserId(), ['country' => 'RU']);
				}
				$this->model->user->update($this->model->user->getUserId(), ['lang' => 'RU']);
			} elseif ($lang == "EN") {
				$this->model->user->update($this->model->user->getUserId(), ['lang' => 'EN']);
				if (isset($_SESSION['admin'])) {
					$this->model->user->update($this->model->user->getUserId(), ['country' => 'EN']);
				}
			}
		}
		$this->view->layout = 'mainLayout';
		$this->view->default_vars = [
			"categories" => $this->model->shop->categories->getAll('', '', '', ['display_order' => 'ASC']),
			"user" => $this->model->user->getUser(),
			"route" => $route,
			"cart_total" => $this->model->shop->cart->getTotal($this->model->user->getUserId())
		];
		// dd($this->view->default_vars['user']);
		/* Обработка регистрации, входа и создания заказа */
		if (isset($_GET['register'])) {
			// dd($this->register());
			$this->view->default_vars = array_merge($this->view->default_vars, [
				'alerts' => $this->register(),
				"user" => $this->model->user->getUser(),

			]);
		}

		if (isset($_GET['authorization'])) {
			// dd($this->register());
			$this->view->default_vars = array_merge($this->view->default_vars, [
				'alerts' => $this->authorize(),
				"user" => $this->model->user->getUser(),

			]);
			if (isset($_SESSION['admin'])) {
				$this->view->redirect('/admin/categories');
			}
		}

		if (isset($_GET['order'])) {
			// dd($this->register());
			$this->view->default_vars = array_merge($this->view->default_vars, [
				'alerts' => $this->makeOrder(),
				"user" => $this->model->user->getUser(),
			]);
		}

		$blocked = $this->model->db->fetAllLite('status')[1];
		if ($blocked['block'] && !isset($_SESSION['admin'])) {
			$this->view->layout = 'default';
			$this->view->render('');
			exit;
		}
	}
	protected function makeOrder()
	{
		// ddd($_POST);
		if (isset($_POST['email'])) {
			$this->model->user->update($this->model->user->getUserId(), $_POST);

			$oansw = $this->model->shop->orders->makeOrder($this->model->user->getUser(), $_POST);
			// $id=$this->model->shop->orders->db->LastInsertId();
			if (isset($oansw) && current($oansw)['type'] == 'success') {
				$user = current($this->model->user->getUser());
				// dd($oansw);
				$order = current($this->model->shop->orders->getById(current($oansw)['ID']));
				// dd($order);
				ob_start();
				require 'application/views/mail/newOrder.php';
				$message = ob_get_clean();

				$this->model->sendMail($_POST['email'], ($user['lang'] == 'RU' ? 'Заказ №' : 'Order №') . current($oansw)['ID'], $message);

				$properties = $this->model->shop->products_properties->getAll();
				$products = $this->model->shop->products->getAll();
				// ddd($user);
				// ddd($oansw);
				$cart = json_decode($order['cart'], 1);
				// ddd($cart);
				// ddd($order);
				// dd(1);
				$countries = require "application/config/countries.php";
				ob_start();
				require 'application/views/mail/newOrderAdmin.php';
				$message = ob_get_clean();

				$this->model->sendMail('protattoo@mail.ru', 'Новый Заказ №' . current($oansw)['ID'], $message);
			}
			return $oansw;
		} else {
			return [];
		}
	}
	protected function authorize()
	{
		if (isset($_POST['email']) && isset($_POST['password'])) {
			// ddd($_GET);
			// ddd($_POST);
			return $this->model->user->Login();
		} else {
			$err[] = [
				'type' => 'danger',
				'EN' => 'An error has occurred! Please try again!',
				'RU' => 'Произошла ошибка! Пожалуйста, попробуйте ещё раз!'
			];
			return $err;
		}
	}

	protected function register()
	{
		if (isset($_POST['email']) && isset($_POST['password'])) {
			// ddd($_GET);
			// ddd($_POST);
			return $this->model->user->Register();
		} else {
			$err[] = [
				'type' => 'danger',
				'EN' => 'An error has occurred! Please try again!',
				'RU' => 'Произошла ошибка! Пожалуйста, попробуйте ещё раз!'
			];
			return $err;
		}
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
					'RU' => 'Товар добавлен <a href="/cart" class="alert-link">в корзину</a>',
					'EN' => 'The product has been added to <a href="/cart" class="alert-link">the cart</a>'
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
					'RU' => 'Товар добавлен <a href="/cart" class="alert-link">в корзину</a>',
					'EN' => 'The product has been added to <a href="/cart" class="alert-link">the cart</a>'
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
		if (isset($_GET['del'])) {
			if ($this->model->shop->cart->Delete($_GET['del'], $this->model->user->getUserId())) {
				$this->view->redirect('/cart');
			} else {
				$this->view->redirect('/');
			}
		}

		$request = json_decode(file_get_contents("php://input"), 1); //(AJAX POST)
		if (!empty($request) and !empty($request['id'] and !empty($request['quantity']))) {
			// sleep(1);
			echo json_encode([
				'db_answ' => $this->model->shop->cart->Update($request),
				'cart' => $this->model->shop->cart->getByUser($this->model->user->getUserId()),
				'properties' => $this->model->shop->products_properties->getAll(),
				// 'products' => $this->model->shop->products->getAll(),
				'cart_total' => $this->model->shop->cart->getTotal($this->model->user->getUserId())

			]);
			exit;
		}
		$vars = [];

		$vars = array_merge($vars, [
			'cart' => $this->model->shop->cart->getByUser($this->model->user->getUserId()),
			'properties' => $this->model->shop->products_properties->getAll(),
			'products' => $this->model->shop->products->getAll(),
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
	/*********************************ABOUT***************************************/
	public function policyAction()
	{
		$this->view->render([
			'RU' => 'Политика конфиденциальности и правила использования - LeoSmagin.com',
			'EN' => 'Privacy Policy and Terms of Use - LeoSmagin.com',
		], []);
	}
	public function paymentAction()
	{
		$this->view->render([
			'RU' => 'Способы оплаты - LeoSmagin.com',
			'EN' => 'Payment methods - LeoSmagin.com',
		], []);
	}
	public function contactsAction()
	{
		$this->view->render([
			'RU' => 'Контакты - LeoSmagin.com',
			'EN' => 'Contacts - LeoSmagin.com',
		], []);
	}
	public function deliveryAction()
	{
		$this->view->render([
			'RU' => 'Доставка - LeoSmagin.com',
			'EN' => 'Delivery - LeoSmagin.com',
		], []);
	}
}
