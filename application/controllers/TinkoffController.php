<?php

namespace application\controllers;

use application\core\Controller;
use PDO;
use application\controllers\MainController;
// use application\lib\Db;
// use application\models\AdminModel;
/**
 * Class AdminController
 */
class TinkoffController extends MainController
{

  function __construct($route)
  {
    parent::__construct($route);
    $this->view->layout = 'mainLayout';
  }
  public function successAction()
  {
    http_response_code(200);
    // $this->dbAddAll('success');
    // $this->view->redirect('/');
    $vars = [
      'w' => 'b',
    ];
    $this->view->render(['RU' => 'ProLovi - Рассрочка', 'EN' => 'ProLovi - Installment'], $vars);
  }

  public function failAction()
  {
    http_response_code(200);
    // $this->dbAddAll('fail');
    $this->view->redirect('/');
  }

  public function notificationsAction()
  {
    // dd(11);

    $this->model->db->insert('tinkoffAnswers', [
      'url' => '1',
      'post' => '1',
      'get' => '1',
      'file' =>  '1'
    ]);
    // $this->dbAddAll('notifications'); //todo delete
    $file = json_decode(file_get_contents('php://input'), 1);

    $files[1] = json_encode($file);
    $files[2] = $_SERVER['REMOTE_ADDR'];

    $this->model->db->insert('tinkoffAnswers', [
      'url' => 'notificationsAction',
      'post' => json_encode($_POST),
      'get' => json_encode($_GET),
      'file' =>  json_encode($files)
    ]);
    // $file = '{
    //   "id": "1_6524589bf28fb",
    //   "status": "signed",
    //   "created_at": "2023-10-09T19:45:50.205Z",
    //   "demo": true,
    //   "committed": false,
    //   "first_payment": 0,
    //   "order_amount": 50000,
    //   "credit_amount": 46750,
    //   "transfer_amount": 46750,
    //   "product": "installment_credit",
    //   "term": 6,
    //   "monthly_payment": 8333.33,
    //   "first_name": "\u0410",
    //   "last_name": "\u0410",
    //   "middle_name": "\u0410",
    //   "phone": "+7912*****21",
    //   "loan_number": "loan-number",
    //   "email": "1*2@gmail.com",
    //   "appropriate_signing_types": [
    //     "bank",
    //     "sms"
    //   ],
    //   "signing_type": "sms",
    //   "chosen_bank": "\u0422\u0438\u043d\u044c\u043a\u043e\u0444\u0444 \u0411\u0430\u043d\u043a",
    //   "expected_overdue_at": "2023-10-23T19:46:37.961Z",
    //   "items": [
    //     {
    //       "name": "X-PRO \u041f\u0420\u0415\u0414\u0417\u0410\u041a\u0410\u0417!",
    //       "quantity": 1,
    //       "price": 50000,
    //       "category": "default",
    //       "vendorCode": "[4]"
    //     }
    //   ]
    // }';
    // $file = json_decode($file, 1);

    $ip = ip2long($_SERVER['REMOTE_ADDR']); //swap!
    // $ip = ip2long('91.194.226.12'); //swap!

    $minIP = ip2long('91.194.226.1');
    $maxIP = ip2long('91.194.227.254');

    if ($ip <= $minIP or $ip >= $maxIP or empty($file)) {
      return false;
    }
    if ($file['status'] != 'signed') {
      return false;
    }
    // ddd($file);

    $oansw = $this->model->shop->orders->MakeOrderTinkoff($file);
    // ddd($oansw);
    if (current($oansw)['type'] != 'success') return false;

    $user_id = substr($file['id'], 0, strpos($file['id'], '_'));
    $user = current($this->model->user->getUser($user_id));
    $order = current($this->model->shop->orders->getById(current($oansw)['ID']));

    $properties = $this->model->shop->products_properties->getAll();
    $products = $this->model->shop->products->getAll();

    $cart = json_decode($order['cart'], 1);
    $countries = require "application/config/countries.php";
    ob_start();
    require 'application/views/mail/newOrderAdmin.php';
    $message = ob_get_clean();
    $this->model->sendMail($this->model->mail_config['from_email'], 'Новый Заказ №' . current($oansw)['ID'], $message);
    // $this->view->redirect('/');
    // ddd(1);
    http_response_code(200);
  }

  private function dbAddAll(string $name)
  {
    $file[1] = json_encode(json_decode(file_get_contents('php://input'), 1));
    $file[2] = $_SERVER['REMOTE_ADDR'];

    $this->model->db->insert('tinkoffAnswers', [
      'url' => $name,
      'post' => json_encode($_POST),
      'get' => json_encode($_GET),
      'file' =>  json_encode($file)
    ]);
  }
}
