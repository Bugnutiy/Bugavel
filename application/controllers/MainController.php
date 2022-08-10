<?php

namespace application\controllers;

use application\core\Controller;
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
			// dd($lang);
			if ($lang == "RU") {
				// dd($this->model->user->getUserId());
				$this->model->user->update($this->model->user->getUserId(), ['lang' => 'RU']);
			} elseif ($lang == "EN") {
				// dd($this->model->user->getUserId());
				// dd($this->model->user->update($this->model->user->getUserId(), ['lang' => 'EN']));
				$this->model->user->update($this->model->user->getUserId(), ['lang' => 'EN']);
			}
		}
		$this->view->layout = 'main';
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
		$this->view->render(['RU' => 'Титлв=ы', 'EN' => 'title']);
	}

	public function testAction()
	{
		$this->view->layout = 'test';
		$this->view->render('TEST');
	}
}
