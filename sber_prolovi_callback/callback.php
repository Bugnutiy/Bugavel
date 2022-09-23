<?php

$error_checker = false;

if(
	!isset($_POST['checksum']) ||
	!isset($_POST['amount']) ||
	!isset($_POST['mdOrder']) ||
	!isset($_POST['operation']) ||
	!isset($_POST['orderNumber']) ||
	!isset($_POST['status'])
){

	$error_checker = true;
}

// Проверяем checksum

if( !$error_checker ){

	$data = '';
	$temp_data = $_POST;

	ksort($temp_data);

	foreach( $temp_data as $key=>$value ){

		if( $key=='checksum' ) continue;

		$data .= $key.';'.urldecode($value).';';
	}

	$key = '2hon5fgept7ve20tn5mm0deu3p';
	$checksum = hash_hmac('sha256', $data, $key);
  
	if( $checksum!=strtolower($_POST['checksum']) ){

		$error_checker = true;
	}
}

// Если оплата не прошла

if( !$error_checker ){

	if(
		$_POST['operation']!='deposited' ||
		(int)$_POST['status']!==1
	){

		$error_checker = true;
	}
}

// Если вызов некорректный

if( $error_checker===true ){

	exit();
}

//

include 'modulkassa.php';

$mkassa = new ModulKassa();
$mkassa->doc_send( array(

	'email' => 'info@prolovi.ru',

	'order_id' => $_POST['orderNumber'],
	'item_title' => urldecode($_POST['orderDescription']),
	'sum' => $_POST['amount']/100

) );

//

$out = '=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

Checksum: '.$checksum.'
Date: '.date('Y-m-d H:i:s').'

'.print_r($_POST,1).'

';

$file = fopen('log-sber.php','a+');
fwrite($file,$out);
fclose($file);


?>