<?php

namespace application\controllers;

use application\core\Controller;
// use application\lib\Db;
// use application\models\AdminModel;
/**
 * Class AdminController
 */
class AdminController extends Controller
{

	function __construct($route)
	{
		parent::__construct($route);
		$this->view->layout = 'admin';
	}

	public function mainAction()
	{
		//debug($_SESSION);

		$this->view->render('Администратор');
	}
	/////////////////////////////////////////////////categories//////////////////////////////////////////////
	public function categoriesAction()
	{
		$bcr = ['Категории'];

		$vars = [
			'bcr' => $bcr,
			'categories' => $this->model->shop->categories->getAll(),
		];
		$this->view->render('Администратор - категории', $vars);
	}
	public function categoriesEditAction()
	{
		$bcr = ['Категории' => '/admin/categories', 'Изменить'];

		$fpath = 'public/images/categories/';
		$vars = ['bcr' => $bcr];
		if (!empty($_POST)) {
			if (!empty(current($_FILES)['name'][0])) {
				$names = [];
				foreach (current($_FILES)['name'] as $name) {
					$names[] = $_POST['name_en'] . ' ' . uniqid();
				}
				$file = $this->model->setFiles(20 * (2 ** 23), ['png', 'jpg'], $fpath, $names);
			}
			if (!empty($file['err'])) {
				$vars = array_merge($vars, ['err' => $file['err']]);
			} else {
				if (!empty($file)) {
					foreach ($file['fname'] as $fname) {
					}
					$_POST['images'][] = $fpath . $fname;
				}
				$err = $this->model->shop->categories->Update($_POST);
				if (empty($err))
					$this->view->redirect('/admin/categories');
				else $vars = ['err' => $err];
			}
		}

		if (isset($_GET['id']) and !isset($_GET['copy'])) {
			$vars = array_merge($vars,  [
				'header' => 'Редактировать',
				'category' => $this->model->shop->categories->getById($_GET['id']),
			]);
			// dd($vars);
			$this->view->render('Редактирование категории', $vars);
		} else if (empty($_GET)) {

			$vars = array_merge($vars, [
				'header' => 'Создать категорию',
			]);
			$this->view->render('Новая категория', $vars);
		} else {
			$vars = array_merge($vars, [
				'header' => 'Дублировать',
				'category' => $this->model->shop->categories->getById($_GET['id']),
				'copy' => true
			]);
			// dd($vars);
			$this->view->render('Дублирование категории', $vars);
		}
	}
	public function categoriesDeleteAction()
	{
		$bcr = ['Категории' => '/admin/categories', 'Удалить'];


		if (empty($_POST['confirm'])) {
			$vars = [
				'bcr' => $bcr,
				'category' => $this->model->shop->categories->getById($_GET['id'])
			];
			//dd($vars['category']);
			$this->view->render("Удалить категорию", $vars);
		} else {

			if ($_POST['confirm']) {
				$this->model->shop->categories->delete($_POST['id']);
				$this->view->redirect("/admin/categories");
			}
		}
	}
	/////////////////////////////////////////////products/////////////////////////////////////////
	public function productsAction()
	{
		$bcr = ['Товары'];
		$vars = [
			'bcr' => $bcr,
			'products' => $this->model->shop->products->getAll(),
		];
		$this->view->render('Администратор - товары', $vars);
	}

	public function productsEditAction()
	{
		$bcr = ['Товары' => '/admin/products', 'Изменить'];

		$fpath = 'public/images/products/';
		$vars = ['bcr' => $bcr];
		if (!empty($_POST)) {
			if (!empty(current($_FILES)['name'][0])) {
				$names = [];
				foreach (current($_FILES)['name'] as $name) {
					$names[] = $_POST['name_en'] . ' ' . uniqid();
				}
				$file = $this->model->setFiles(20 * (2 ** 23), ['png', 'jpg'], $fpath, $names);
			}
			if (!empty($file['err'])) {
				$vars = array_merge($vars, ['err' => $file['err']]);
			} else {

				if (!empty($file)) {
					foreach ($file['fname'] as $fname) {
						$_POST['images'][] = $fpath . $fname;
					}
				}

				$err = $this->model->shop->products->Update($_POST);
				if (empty($err)) {
					$this->view->redirect('/admin/products');
				} else $vars = ['err' => $err];
			}
		}

		if (isset($_GET['id']) and !isset($_GET['copy'])) {
			$vars = array_merge($vars,  [
				'header' => 'Редактировать',
				//////////////////////////////<<<<< Редактировать
				'categories' => $this->model->shop->categories->getAll(),
				'product' => $this->model->shop->products->getById($_GET['id']),
			]);
			// dd($vars);
			$this->view->render('Редактирование товара', $vars);
		} else if (empty($_GET)) {

			$vars = array_merge($vars, [
				'header' => 'Новый товар',
				///////////////////////////////////////<<<<< Новый
				'categories' => $this->model->shop->categories->getAll(),
			]);
			$this->view->render('Новый товар', $vars);
		} else {
			$vars = array_merge($vars, [
				'header' => 'Дублировать товар',
				'categories' => $this->model->shop->categories->getAll(),
				///////////////////////////////<<<<<<< Дублировать
				'product' => $this->model->shop->products->getById($_GET['id']),
				'copy' => true
			]);
			// dd($vars);
			$this->view->render('Дублирование товара', $vars);
		}
	}

	public function productsDeleteAction()
	{
		$bcr = ['Товары' => '/admin/products', 'Удалить'];


		if (empty($_POST['confirm'])) {
			$vars = [
				'bcr' => $bcr,
				'product' => $this->model->shop->products->getById($_GET['id'])
			];
			//dd($vars['category']);
			$this->view->render("Удалить товар", $vars);
		} else {

			if ($_POST['confirm']) {
				$this->model->shop->products->delete($_POST['id']);
				$this->view->redirect("/admin/products");
			}
		}
	}
	/////////////////////////////////////////////properties///////////////////////////////////////
	public function propertiesAction()
	{
		if (isset($_GET['product_id'])) {
			$bcr = ['Товары' => '/admin/products', 'Вариации'];
			$vars = [
				'bcr' => $bcr,
				'product' => $this->model->shop->products->getById($_GET['product_id']),
				'properties' => $this->model->shop->products_properties->getByProductId($_GET['product_id']),
			];
			// dd($vars);
			$this->view->render('Вариации', $vars);
			exit;
		}
		// $this->view->redirect('/admin/products/');
	}
	public function propertiesEditAction()
	{
		// $this->model->shop->products->UpdatePrice(8);
		// $property
		$bcr = ['Товары' => '/admin/products', 'Вариации' => '/admin/products/properties?product_id=' . $_GET['product_id'], 'Изменить'];

		// $fpath = 'public/images/products/';
		$vars = ['bcr' => $bcr];
		if (!empty($_POST)) {
			// dd($_POST);
			// $_POST['product_id']=$_GET[]
			$err = $this->model->shop->products_properties->Update($_POST);
			// dd($err);
			// dd($err);
			// dd($err);
			if (empty($err)) {
				$this->model->shop->products->UpdatePrice($_GET['product_id']);
				$this->view->redirect('/admin/products/properties?product_id=' . $_GET['product_id']);
			} else {
				// dd($err);
				$vars = ['err' => $err];
			};
		}


		if (isset($_GET['id']) and !isset($_GET['copy'])) {
			$vars = array_merge($vars,  [
				'header' => 'Редактировать',
				//////////////////////////////<<<<< Редактировать
				// 'categories' => $this->model->shop->categories->getAll(),
				'product' => $this->model->shop->products->getById($_GET['product_id']),
				'property' => $this->model->shop->products_properties->getById($_GET['id'])
			]);
			// dd($vars);
			$this->view->render('Редактирование товара', $vars);
		} else if (empty($_GET['id'])) {

			$vars = array_merge($vars, [
				'header' => 'Новая вариация',
				///////////////////////////////////////<<<<< Новый
				'product' => $this->model->shop->products->getById($_GET['product_id']),
			]);
			$this->view->render('Новый товар', $vars);
		} else {
			$vars = array_merge($vars, [
				'header' => 'Дублировать',
				///////////////////////////////<<<<<<< Дублировать
				'product' => $this->model->shop->products->getById($_GET['product_id']),
				'property' => $this->model->shop->products_properties->getById($_GET['id']),
				'copy' => true
			]);
			// dd($vars);
			$this->view->render('Дублирование товара', $vars);
		}
	}

	public function propertiesDeleteAction()
	{
		$bcr = ['Товары' => '/admin/products', 'Вариации' => '/admin/products/properties?product_id=' . $_GET['product_id'], 'Удалить'];


		if (empty($_POST['confirm'])) {
			$vars = [
				'bcr' => $bcr,
				'property' => $this->model->shop->products_properties->getById($_GET['id'])
			];
			//dd($vars['category']);
			$this->view->render("Удалить вариацию", $vars);
		} else {

			if ($_POST['confirm']) {

				if ($this->model->shop->products_properties->delete($_POST['id']))
					$this->model->shop->products->UpdatePrice($_GET['product_id']);
				$this->view->redirect('/admin/products/properties?product_id=' . $_GET['product_id']);
			}
		}
	}
	/////////////////////////////////////////////SberBank/////////////////////////////////////////
	public function sberAction()
	{
		$bcr = ['Сбер'];
		$vars = [
			'bcr' => $bcr,
			'sber' => $this->model->sber->getSettings(),
		];
		$this->view->render('Настройки СберБанка', $vars);
	}

	public function testAction()
	{
		$this->view->layout = 'test';
		$this->view->render('TEST');
	}
}
