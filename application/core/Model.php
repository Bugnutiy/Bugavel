<?php

namespace application\core;

use application\lib\Db;
use application\lib\Sber\Sber;
use application\lib\User\User;
use application\lib\Shop\Shop;
use PHPMailer\PHPMailer\PHPMailer;

/**
 * Родитель всех моделей, в нём подключаются библиотеки, используемые везде
 */
class Model
{
	/**
	 * @var Db
	 */
	public $db;

	/**
	 * @var Sber
	 */
	public $sber;

	/**
	 * @var User
	 */
	public $user;

	/**
	 * @var Shop
	 */
	public $shop;

	public function __construct()
	{
		$this->db = new Db;
		$this->sber = new Sber($this->db);
		$this->user = new User($this->db);
		$this->shop = new Shop($this->db);
		// dd($_COOKIE);
		// ddd($this->user);
		// dd($_SERVER);
	}

	/**
	 * Сохранятор файлов multipart/form-data
	 * @param int $limit_size Максимальный размер файла в байтах
	 * @param array $valid_format одномерный массив поддерживаемых форматов
	 * @param string $path_file Путь сохранения
	 * @param array $name массив имен файлов
	 * @param array $FILES Часть глобального массива $_FILES
	 */
	public function setFiles($limit_size, $valid_format, $path_file, $name, $FILES = [])
	{
		// ddd($limit_size);
		if (empty($FILES)) $FILES = $_FILES;
		$arr['err'] = [];
		$error = "";
		if (!empty(current($FILES)['name'][0])) {

			foreach (current($FILES)['name'] as $key => $fname) {
				// валидация размера файла
				if (current($FILES)['size'][$key] > $limit_size) {
					$arr['err'][] = "Размер файла \"$fname\" превышает допустимый!";
				}

				// валидация формата файла
				//$format = explode(".",current($FILES)["name"]);
				$format[$key] = strtolower(pathinfo(current($FILES)["name"][$key], PATHINFO_EXTENSION));
				if (!in_array($format[$key], $valid_format)) {
					$arr['err'][] = "Формат файла \"$fname\" недопустимый!";
				}

				// если не было ошибок
				if (empty($arr['err'])) {
					// проверяем загружен ли файл
					if (is_uploaded_file(current($FILES)["tmp_name"][$key])) {
						// сохраняем файл
						$arr['fname'][] = $name[$key] . '.' . $format[$key];

						if (!file_exists($path_file))
							if (!mkdir($path_file, 0777, 1)) {
								$arr['err'][] = "Не удалось создать директорию $path_file";
								return $arr;
							}
						if (!move_uploaded_file(current($FILES)['tmp_name'][$key], $path_file . $name[$key] . "." . $format[$key])) {
							$arr['err'][] = "Не удалось переместить файл $name[$key] из загрузок в директорию $path_file";
						}
					} else {
						// Если файл не загрузился
						$arr['err'][] = "Ошибка загрузки $fname!";
					}
				}
			}
		} else {
			$arr['err'][] = "Файлы отсутствуют!";
		}
		if (!empty($arr['err'])) {
		} else if ($FILES) {
			$arr['err'] = [];
		}
		// dd($arr);
		return $arr;
	}

	/**
	 * Отправить письмо
	 *
	 * @param string $address E-Mail получателя
	 * @param string $title	Тема письма
	 * @param string $body	Само письмо
	 * @param boolean $isHTML
	 * @return array
	 */
	public function sendMail($address, $title, $body, $isHTML = true)
	{
		require_once 'application/lib/mailer/src/PHPMailer.php';
		require_once 'application/lib/mailer/src/SMTP.php';
		require_once 'application/lib/mailer/src/Exception.php';
		$result='';
		$status='';
		$mail_config = current($this->db->fetAllLite('mail_config'));
		$mail = new PHPMailer();
		try {
			$mail->isSMTP();
			$mail->CharSet = "UTF-8";
			$mail->SMTPAuth   = true;
			//$mail->SMTPDebug = 2;
			$mail->Debugoutput = function ($str, $level) {
				$GLOBALS['status'][] = $str;
			};

			// Настройки вашей почты
			// $mail->Host       = 'mail.nic.ru'; // SMTP сервера вашей почты
			// $mail->Username   = 'info@leosmagin.com'; // Логин на почте
			// $mail->Password   = 'DMZb2PuM2WF'; // Пароль на почте
			// $mail->SMTPSecure = 'ssl';
			// $mail->Port       = 465;
			// $mail->setFrom('info@leosmagin.com', $name); // Адрес самой почты и имя отправителя

			$mail->Host       = $mail_config['host']; // SMTP сервера вашей почты
			$mail->Username   = $mail_config['username']; // Логин на почте
			$mail->Password   = $mail_config['password']; // Пароль на почте
			$mail->SMTPSecure = $mail_config['SMTPSecure'];
			$mail->Port       = $mail_config['port'];
			$mail->setFrom($mail_config['from_email'], $mail_config['from_name']); // Адрес самой почты и имя отправителя

			// Получатель письма
			$mail->addAddress($address);
			// $mail->addAddress('youremail@gmail.com'); // Ещё один, если нужен

			// Прикрипление файлов к письму
			// if (!empty($file['name'][0])) {
			// 	for ($ct = 0; $ct < count($file['tmp_name']); $ct++) {
			// 		$uploadfile = tempnam(sys_get_temp_dir(), sha1($file['name'][$ct]));
			// 		$filename = $file['name'][$ct];
			// 		if (move_uploaded_file($file['tmp_name'][$ct], $uploadfile)) {
			// 			$mail->addAttachment($uploadfile, $filename);
			// 			$rfile[] = "Файл $filename прикреплён";
			// 		} else {
			// 			$rfile[] = "Не удалось прикрепить файл $filename";
			// 		}
			// 	}
			// }
			// Отправка сообщения
			$mail->isHTML($isHTML);
			$mail->Subject = $title;
			$mail->Body = $body;

			// Проверяем отравленность сообщения
			if ($mail->send()) {
				$result = "success";
			} else {
				$result = "error";
			}
		} catch (\Exception $e) {
			$result = "error";
			$status = "Сообщение не было отправлено. Причина ошибки: {$mail->ErrorInfo}";
		}

		return ["result" => $result, "status" => $status];
		# code...
	}
}
