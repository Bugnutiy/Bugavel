<?php

namespace application\controllers;


use application\core\View;
use application\core\Controller;
use application\core\Model;

// use application\lib\Db;


class AuthController extends Controller
{
    function __construct($route)
    {
        parent::__construct($route);
        $default_vars = [
            'categories' => $this->model->shop->categories,
            //'products' => $this->model->shop->products,
            //'properties' => $this->model->shop->properties,
            'shop' => $this->model->shop
        ];
        $this->view = new View($route, $default_vars);
    }
    public function registerAction()
    {
        if (!empty($_POST)) {
            //debug($this->model->registerUser());
            if ($this->model->registerUser()) {
                $this->view->render('Регистрация', ['registered' => true]);
            } else {
                $this->view->render('Регистрация', ['registered' => false]);
            }
            //debug($_POST);
        } else {

            $this->view->render('Регистрация');
        }
    }
    public function loginAction()
    {
        //debug(session_id());
        //debug($this->model->shop->user->getUser());
        $vars = [];
        if (!empty($_POST)) {
            if ($this->model->Login()) {
                $vars['login'] = true;
            } else $vars['login'] = false;
        }
        if (!empty($_SESSION['authorize']['id'])) {
            $vars['logged'] = true;
        }
        $this->view->render('Вход', $vars);
    }
}
