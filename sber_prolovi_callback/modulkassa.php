<?php

// Логин учётной записи Modulkassa

define('KASSA_LOGIN', 'kse007@mail.ru');

// Пароль учётной записи Modulkassa

define('KASSA_PWD', 'ur9MlhmD');

// Идентификатор торговой точки Modulkassa

define('KASSA_POINT_ID', 'b017e1d9-e0da-4616-8047-29bdabd20478');

//

class ModulKassa{

	protected $log = array();

	// Адрес боевого API Modulkassa

	protected $url = 'https://service.modulpos.ru/api/fn';

	// Адрес тестового API Modulkassa

//	protected $url = 'https://demo-fn.avanpos.com/fn';

	protected function make_query( $method, $path, $request=array() ){

		if( isset($this->action_login) ){

			$auth = $this->action_login.':'.$this->action_password;
		}
		else{
			$auth = KASSA_LOGIN.':'.KASSA_PWD;
		}

		//

		$curl = curl_init($this->url.$path);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);

		if( $method=='POST' ){

			curl_setopt($curl, CURLOPT_POST, 1);

			if( count($request)>0 ){

				curl_setopt($curl, CURLOPT_HTTPHEADER, array(

					'Content-Type: application/json',
				));

				curl_setopt($curl, CURLOPT_POSTFIELDS, json_encode($request) );
			}
		}

		curl_setopt($curl, CURLOPT_USERPWD, $auth);
		curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);
		$resp = curl_exec($curl);
		curl_close($curl);

		$this->log[] = array(

			'date' => date('Y-m-d H:i:s'),
			'url' => $this->url.$path,
			'request' => $request,
			'response' => $resp
		);

		if( strpos($resp,'{')===0 ){

			$resp = json_decode($resp,1);
		}

		return $resp;
	}

	public function login(){

		if( isset($this->action_login) ){

			return;
		}

		$path = '/v1/associate/'.KASSA_POINT_ID;

		$data = $this->make_query( 'POST', $path );

		if( isset($data['userName']) ){

			$this->action_login = $data['userName'];
			$this->action_password = $data['password'];
		}
	}

	public function kassa_status(){

		$this->login();

		$path = '/v1/status';

		$data = $this->make_query( 'GET', $path );

		$this->log_write();

		return $data;
	}

	public function doc_send( $params ){

		$this->login();

		$date = new DateTime(date('Y-m-d H:i:s',strtotime('+3 hours')), new DateTimeZone('Europe/Moscow'));

		$datetime = $date->format(DateTime::ATOM);

		$request = array(

			/*

				Определяется на отправляющей стороне, для исключения ситуации с
				дублированием документов в случае потери ответа сервера. Id должен быть
				достаточно большой строкой из букв и цифр для сведения к минимуму
				возможности коллизий. Подойдет Java randomUUID или TimeUUID

			*/

			'id' => $this->guid(),

			/*
				Номер документа (заказа), в формате магазина
			*/

			'docNum' => $params['order_id'],

			/*
				SALE - продажа
				RETURN - возврат
			*/

			'docType' => 'SALE',

			/*
				Время создания документа на оплату
			*/

			'checkoutDateTime' => $datetime,

			/*
				Адрес электронной почты или телефон покупателя
			*/

			'email' => $params['email'],

			/*
				URL для подтверждения успешной фискализации на стороне Интернет-магазина
			*/

//			'responseURL' => '',

			/*
				Может иметь следующие значения:

					null - по умолчанию (из настроек)
					COMMON - ОСН
					SIMPLIFIED - УСН Доходы
					SIMPLIFIED_WITH_EXPENSE - УСН Доход минус расход
					ENVD - ЕНВД
					PATENT - ПСН
					COMMON_AGRICULTURAL - ЕСХН
			*/

			'taxMode' => null,

			/*
				Набор позиций в чеке, список товаров на оплату
			*/

			'inventPositions' => array(

				array(

					/*
						Штрихкод товара
					*/

//					'barcode' => '10001',

					/*
						Сумма скидки, примененной на позицию
					*/

//					'discSum' => 0,

					/*
						Наименование товара
					*/

					'name' => $params['item_title'],

					/*
						Цена позиции товара. Точность должна быть
						не больше 2-х знаков после запятой.
					*/

					'price' => $params['sum'],

					/*
						Количество товара
					*/

					'quantity' => 1,

					/*
						Тег НДС согласно ФЗ-54

						НДС 0% - 1104
						НДС 10% - 1103
						НДС 20% - 1102
						НДС не облагается - 1105
						НДС с рассч. ставкой 10% - 1107
						НДС с рассч. ставкой 20% - 1106
					*/

					'vatTag' => 1105,

					/*
						Ревизия ставки НДС
						Допустимое значение - 2018
						Используется только для возвратов по
						ставке НДС, отличной от текущей (возврат
						по ставке НДС 18% в 2019 году, например)
					*/

//					'vatRevision' => '',

					/*
						Предмет расчета. Список доступных значений:

							commodity
							excise
							job
							service
							gambling_bet
							gambling_prize
							lottery
							lottery_prize
							intellectual_activity
							payment
							agent_commission
							composite
							another

						Если не указано, то касса проводит
						продажу с предметом расчета ТОВАР
					*/

//					'paymentObject' => 'commodity',

					/*
						Признак расчета. Список доступных значений:

							full_prepayment
							prepayment
							advance
							full_payment
							partial_payment
							credit
							credit_payment

						Если не указано, то касса проводит
						продажу с признаком расчета ПОЛНЫЙ РАСЧЕТ
					*/

//					'paymentMethod' => 'full_payment'
				)
			),

			/*
				Список оплат, применяемых на чек
			*/

			'moneyPositions' => array(

				array(
					/*
						Тип оплаты
							CARD - безналичная оплата
							CASH - оплата наличными
					*/

					'paymentType' => 'CARD',

					/*
						Сумма выбранного типа оплаты, точность
						должна быть не больше 2-х знаков после
						запятой.
					*/

					'sum' => $params['sum']
				)
			),

			/*
				Печатать ли бумажный чек на кассе при
				фискализации. По умолчанию false
			*/

//			'printReceipt' => true,

			/*
				Имя кассира
			*/

//			'cashierName' => 'Иванов Петр Васильевич',

			/*
				ИНН кассира (используется валидатор ИНН)
			*/

//			'cashierInn' => '540362451162',

			/*
				Должность кассира (до 100 символов)
			*/

//			'cashierPosition' => 'Старший кассир',
		);

		//

		$path = '/v1/doc';

		$data = $this->make_query( 'POST', $path, $request );

		$this->log_write();
	}

	protected function guid(){

		if( function_exists('com_create_guid') === true ){

			$out = trim(com_create_guid(), '{}');
		}
		else{
			$out = sprintf('%04X%04X-%04X-%04X-%04X-%04X%04X%04X', mt_rand(0, 65535), mt_rand(0, 65535), mt_rand(0, 65535), mt_rand(16384, 20479), mt_rand(32768, 49151), mt_rand(0, 65535), mt_rand(0, 65535), mt_rand(0, 65535));
		}

		return strtolower($out);
	}

	protected function log_write(){

		if( count($this->log)>0 ){

			$code = array('');

			$code[] = '-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=';
			$code[] = '';

			foreach( $this->log as $row ){

				$code[] = 'Date: '.$row['date'];

				$code[] = 'Request: '.$row['url'];
				$code[] = print_r($row['request'],1);
				$code[] = 'Response: '.$row['response'];
				$code[] = '';
				$code[] = '';
			}

			$code = implode("\r\n",$code);

			$file = fopen('log-modulkassa.php','a+');
			fwrite($file,$code);
			fclose($file);
		}
	}
};

?>