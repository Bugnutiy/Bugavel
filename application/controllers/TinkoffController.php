<?php

namespace application\controllers;

use application\core\Controller;
use PDO;
// use application\lib\Db;
// use application\models\AdminModel;
/**
 * Class AdminController
 */
class TinkoffController extends Controller
{

  function __construct($route)
  {
    parent::__construct($route);
    $this->view->layout = 'mainLayout';
  }
  public function successAction()
  {
    http_response_code(200);
    $this->dbAddAll('success');
  }

  public function failAction()
  {
    http_response_code(200);
    $this->dbAddAll('fail');
  }

  public function notificationsAction()
  {
    http_response_code(200);
    $this->dbAddAll('notifications');
  }

  private function dbAddAll(string $name)
  {
    $this->model->db->insert('tinkoffAnswers', [
      'url' => $name,
      'post' => json_encode($_POST),
      'get' => json_encode($_GET),
      'file' => json_encode(json_decode(file_get_contents('php://input'),1))
    ]);
  }
}
