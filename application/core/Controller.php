<?php

namespace application\core;

use application\core\View;
use application\core\Model;

class Controller
{
  /**
   * @var Model
   */
  public $model;

  public $route;
  /**
   * @var View
   */
  public $view;
  public $acl;

  public function __construct($route)
  {
    $this->route = $route;
    //$_SESSION['authorize']['id'] = 1;
    if (!$this->checkAcl()) {
      View::errorCode(400);
    }

    $this->model = $this->loadModel($route['controller'] . 'Model');

    $this->view = new View($route);
    //$this->before();//вызов функции смены шаблона контроллера
    // dd($route['controller']);
  }

  public function loadModel($name)
  {
    $path = 'application\models\\' . ucfirst($name);
    if (class_exists($path)) {
      return new $path;
    }
  }

  public function checkAcl()
  {
    $this->acl = require 'application/acl/' . $this->route['controller'] . '.php';
    if ($this->isAcl('all')) {
      return true;
    } elseif (isset($_SESSION['authorize']['id']) and $this->isAcl('authorize')) {
      return true;
    } elseif (!isset($_SESSION['authorize']['id']) and $this->isAcl('guest')) {
      return true;
    } elseif (isset($_SESSION['admin']) and $this->isAcl('admin')) {
      return true;
    }
    return false;
  }

  public function isAcl($key)
  {
    return in_array($this->route['action'], $this->acl[$key]);
  }
}
