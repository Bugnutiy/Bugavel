<?php
namespace application\lib;
require 'application/lib/YandexKassa/autoload.php';

 use YandexCheckout\Client;
/**
 * 
 */
class Yk
{
	private $yk;

	public function createPayment($amount,$uid,$desc='',$url='http://yandex.ru/',$capt=false)
	{
		$payment=$this->yk->createPayment(
	        [
	            'amount' => [
	                'value' => $amount,
	                'currency' => 'RUB',
	            ], 
	            'confirmation' => [
	                'type' => 'redirect',
	                'return_url' => $url,
	            ],
	            'capture' => $capt,
	            'description' => $desc,
	        ],
	        $uid
	    );
	    return $payment->JsonSerialize();
	}
	public function getPaymentInfo($yid)
	{
		return $this->yk->getPaymentInfo($yid)->jsonSerialize();
	}
	public function cancelPayment($yid,$uniq)
	{
		try{
			return $this->yk->cancelPayment($yid,$uniq)->jsonSerialize();
		} catch (Exception $e){
			return 0;
		} 
	}
	public function capturePayment($yid,$amount)
	{
		$this->yk->capturePayment(
        array(
            'amount' => $amount,
        ),
        $yid,
        uniqid('', true)
    );
	}
	function __construct()
	{
		$config = require 'application/config/yandex.php';
		$this->yk = new Client();
	//debug(get_class_methods($this->yk));
    	$this->yk->setAuth($config['Login'], $config['key']);
	}
}