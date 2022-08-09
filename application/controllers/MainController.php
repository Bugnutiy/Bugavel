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
		
		$this->view->layout = 'main';
	}

	public function mainAction()
	{
		//debug($_SESSION);

		$this->view->render('Администратор');
	}
	
	public function testAction()
	{
		$this->view->layout = 'test';
		$this->view->render('TEST');
	}
}
