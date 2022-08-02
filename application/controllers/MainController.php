<?php

namespace application\controllers;

use application\core\Controller;
use application\lib\Db;

class MainController extends Controller
{

	public function indexAction()
	{
		//debug($_SESSION);

		$this->view->render('Главная страница');
	}

	public function adminindexAction()
	{
		$this->view->layout = 'admin';
		$this->view->render('Главная страница');
	}

	public function newsAction()
	{
		/*$vars = [
			'name'=>'Вася',
			'age'=>'68',
			'array'=>[1,2,3],
		];*/
		/*
		$db = new Db; //инициализация

		$form = 2; //Запрос

		//$form = '2; DELETE FROM users'; //удалит таблицу! Формы запросов надо блокировать
		//$data = $db->fetColumn('SELECT name FROM users WHERE id='.$form);

		$params = [ //Подготовленный запрос защищает от удаления
			'id' => $form,
		];

		$data = $db->fetColumn('SELECT name FROM users WHERE id = :id', $params);

		//$data = $db->fetColumn('SELECT name FROM users WHERE id=1'); //fetColumn из файла Db.php метод Выводит инфу из колонки с названием name из таблицы users где значение колонки id == . так же может быть вызван query и fetAll

		//$adata = $db->fetAll('SELECT name FROM users');//возвращает массив из колонки name таблицы users $adata[id+1]['name']

		debug($data);
		//echo $adata[1]['name'];//выводит name с id 2;
		//debug($adata); 
		*/

		$result = $this->model->getNews();
		$vars = [
			'news' => $result
		];
		$this->view->render('Новости',$vars);
		//$this->view->render('Главная страница'/*,$vars*/);
	}

	public function contactsAction()
	{
		$this->view->render('Контакты');
	}

	public function confidentAction()
	{
		$this->view->render('Политика конфиденциальности');
	}
	
}
