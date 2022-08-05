<?php

namespace application\lib\Sber;

use application\lib\Db;
use PDO;


class Sber
{
    /**
     * $db
     *
     * @var Db
     */
    protected $db;
    protected $config;
    protected $tname = 'sber_config';

    /**
     * __construct
     *
     * @param Db $db
     */

    public function __construct(&$db)
    {
        $this->db = &$db;
        if (!$this->db->Exists($this->tname)) {
            $this->create_table();
        }
        $this->config = current($this->db->fetAll("SELECT * FROM `$this->tname`"));
    }

    protected function create_table()
    {
        $this->db->query("CREATE TABLE `$this->tname` ( `id` INT UNSIGNED NOT NULL AUTO_INCREMENT , `host` TEXT NOT NULL , `userName` TEXT NOT NULL , `password` TEXT NOT NULL , `ApiToken` TEXT NOT NULL , `secretKey` TEXT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;");
        $this->db->insert($this->tname, [
            'host' => 'https://3dsec.sberbank.ru/payment/rest/',
            'userName' => 'login',
            'password' => 'password',
            'ApiToken' => 'token',
            'secretKey' => NULL,
        ]);
    }


    /**
     * getSettings
     * 
     * @return array Текущие настройки
     */

    public function getSettings()
    {
        return $this->db->fetAllLite($this->tname);
    }

    /**
     * Регистрация заказа
     *
     * @param mixed $orderNumber
     * @param mixed $amount
     * @param int $currency
     * @param string $returnUrl
     * @param string $failUrl
     * @param string $email
     * 
     * @return [type]
     */
    public function register($orderNumber, $amount, $currency = 0x0, $returnUrl = '', $failUrl = '', $email = '')
    {
        $this->parcurl('register.do', []);
    }
    /**
     * Регистрация заказа с предавторизацией
     */
    public function registerPreAuth()
    {
    }
    /**
     * Запрос завершения оплаты заказа (Для двухстадийных платежей)
     */
    public function deposit()
    {
    }
    /**
     * Запрос отмены оплаты заказа (Для двустадийных)
     */
    public function reverse()
    {
    }
    /**
     * Запрос возврата средств оплаты заказа
     */
    public function refund()
    {
    }
    /**
     * Получение статуса заказа
     */
    public function getOrderStatusExtended()
    {
    }

    /**
     * Запрос отмены неоплаченного заказа
     */
    public function decline()
    {
    }
    /**
     * Автонастройщик curl
     * 
     * @param string $operation Концовка url-запроса (Например register.do)
     * @param array $postfields Тело запроса
     * 
     * @return string|JSON Возвращает ответ в формате JSON
     */
    protected function parcurl($operation, $postfields)
    {
        // $postfields = [
        //     'orderNumber' => '12141145235g1wq1',
        //     'amount' => 1500,
        //     'returnUrl' => 'http://leosnew/'
        // ];
        $req = curl_init($this->config['host'] . $operation);
        $header = [
            'Content-Type' => 'application/x-www-form-urlencoded'
        ];

        $post = [
            'userName' => $this->config['userName'] . "-api",
            'password' => $this->config['password'],
        ];

        $post = array_merge($post, $postfields);
        curl_setopt_array(
            $req,
            [
                CURLOPT_POST => true,
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_SSL_VERIFYPEER => false,
                CURLOPT_ENCODING => "",
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => "POST",
                CURLOPT_POSTFIELDS => http_build_query($post),
                CURLOPT_HTTPHEADER => $header,
            ]
        );
        return curl_exec($req);
    }
}
