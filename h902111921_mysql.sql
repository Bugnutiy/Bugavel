-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: h902111921.mysql
-- Время создания: Окт 31 2022 г., 06:03
-- Версия сервера: 5.6.41-84.1
-- Версия PHP: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `h902111921_leosnew`
--
CREATE DATABASE IF NOT EXISTS `h902111921_leosnew` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `h902111921_leosnew`;

-- --------------------------------------------------------

--
-- Структура таблицы `cart`
--
-- Создание: Авг 28 2022 г., 18:50
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED DEFAULT NULL,
  `property_id` int(11) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `changed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `property_id`, `quantity`, `created_at`, `changed_at`) VALUES
(286, 8586, 1, 19, 1, '2022-10-30 09:07:21', '2022-10-30 09:07:21'),
(288, 8617, 1, 19, 1, '2022-10-30 15:14:03', '2022-10-30 15:14:03'),
(289, 8617, 20, 38, 1, '2022-10-30 15:14:03', '2022-10-30 15:14:03'),
(290, 8627, 21, 39, 1, '2022-10-30 15:37:57', '2022-10-30 15:37:57'),
(291, 8627, 20, 38, 1, '2022-10-30 15:38:07', '2022-10-30 15:38:07'),
(292, 8627, 1, 19, 1, '2022-10-30 15:38:17', '2022-10-30 15:38:17');

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--
-- Создание: Авг 28 2022 г., 18:49
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 NOT NULL,
  `name_en` varchar(40) CHARACTER SET utf8mb4 NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 NOT NULL,
  `description_en` longtext CHARACTER SET utf8mb4 NOT NULL,
  `images` longtext CHARACTER SET utf8mb4,
  `videos` longtext CHARACTER SET utf8mb4,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `changed_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `name_en`, `description`, `description_en`, `images`, `videos`, `created_at`, `changed_at`) VALUES
(1, 'Запчасти', 'Spare parts', '<p><br></p>', '<p><br></p>', '[\"public\\/images\\/categories\\/Spare parts 6305deb2485f8.png\"]', '', '2022-08-24 11:17:54', '2022-08-28 21:41:06'),
(2, 'Источники питания', 'Power supply', '<p><br></p>', '<p><br></p>', '[\"public\\/images\\/categories\\/Power supply 6305deebd7012.png\"]', '', '2022-08-24 11:18:51', '2022-08-28 21:49:49'),
(3, 'Индукция', 'Coil Machine', '<p>Классическая индукционная машинка. <span style=\"color: var(--bs-body-color); font-weight: var(--bs-body-font-weight);\">Собрана и настроена мной лично. Рама цельнофрезерованная, выполнена монолита железа.</span></p>', '<p><br></p>', '[\"public\\/images\\/categories\\/Coil Machine 6305df3f55b21.png\"]', '', '2022-08-24 11:20:15', '2022-08-30 16:16:57'),
(4, 'Ротор', 'Rotary Machine', '<p><span style=\"background-color: rgb(250, 250, 250); color: rgb(50, 54, 58);\">Классическая роторная машинка direct drive. Оснащён мощным швейцарским мотором MAXON A MAX. Можно использовать как для классических игл так и для картриджной системы.</span></p>', '<p><br></p>', '[\"public\\/images\\/categories\\/Rotary Machine 6305df87588e1.png\"]', '<iframe src=\"https://www.youtube.com/embed/HDifsf3MvWI\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', '2022-08-24 11:21:27', '2022-08-29 00:22:41'),
(5, 'Скат', 'Hybray', '<p><br></p>', '<p><br></p>', '[\"public\\/images\\/categories\\/Hybray 6305dfbc53e19.png\"]', '<iframe src=\"https://www.youtube.com/embed/FZG-HziJSgs\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', '2022-08-24 11:22:20', '2022-08-24 19:02:13'),
(6, 'Горилла', 'Gorilla Machine', '<p>Горилла имея самый мощный мотор, отлично подходит для работы с толстыми контурами 7-18рл и крупными магнумами. Максимальный комфорт в работе и не превзойденная надёжность делает эту машинку главной в вашем парке рабочих лошадок.</p>', '<p><u>Due to sanctions against our country, payment is not possible. There is only one proven option. If you want to buy a machine, you have to pay this amount to my partner from Europe @hardcraftcompany (Instagram) , wait until he gets it and then send it to your address. The price includes the price of the machine 555 euros + shipping 65 euros to my partner and custom tax 60 euros (tax you do not have to pay for you it is paid by my partner) shipping to your address is paid separately.</u></p><p>Gorilla with the most powerful motor is great for working with thick lines 7-18rl and large magnums Maximum work comfort and unmatched reliability make this machine the ultimate in your workhorse fleet.</p>', '[\"public\\/images\\/categories\\/Gorilla Machine 6305dff379396.png\"]', '', '2022-08-24 11:23:15', '2022-09-27 13:12:05'),
(7, 'Гибрид V1', 'Hybrid Machine V1', '<p>Особенность гибрида, сочетание в себе хлесткого удара индукции и стабильность ротора. С лёгкостью выполняет контурные, закрасочные и теневые работы любыми группами игл.</p>', '<p><u>Due to sanctions against our country, payment is not possible. There is only one proven option. If you want to buy a machine, you have to pay this amount to my partner from Europe @hardcraftcompany (Instagram) , wait until he gets it and then send it to your address. The price includes the price of the machine 525 euros + shipping 65 euros to my partner and custom tax 60 euros (tax you do not have to pay for you it is paid by my partner) shipping to your address is paid separately.</u></p>', '[\"public\\/images\\/categories\\/Hybrid Machine 6305e041a8d50.png\"]', '<iframe src=\"https://www.youtube.com/embed/3qFzHp9LL4E\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', '2022-08-24 11:24:33', '2022-09-27 13:13:33'),
(8, 'Дизель Би', 'Diesel Bee', '<p>Diesel bee гибрид третий версии. Благодаря запатентованной системе в третьем гибриде&nbsp;получилось полностью сымитировать работу индукции. В работе есть хлесткий удар индукции и проседание, чтобы не было лишней травматизации. По работе гибрид третий получился между гибридом 1 и гориллой, остался острый удар первого гибрида и тяговитость гориллы. </p><p>Подходит абсолютно для всех видов работ. отлично справляется с тонкими контурами и легко справляется с самыми толстыми контурами на любых участках кожи.</p>', '<p><u>Due to sanctions against our country, payment is not possible. There is only one proven option. If you want to buy a machine, you have to pay this amount to my partner from Europe @hardcraftcompany (Instagram) , wait until he gets it and then send it to your address. The price includes the price of the machine 555 euros + shipping 65 euros to my partner and custom tax 60 euros (tax you do not have to pay for you it is paid by my partner) shipping to your address is paid separately.</u></p><p>Diesel bee hybrid third version. Thanks to the patented system in the third hybrid, it turned out to completely simulate the work of induction. There is a whiplash of induction and subsidence in the work, so that there is no unnecessary traumatization. According to the work, the third hybrid turned out to be between hybrid 1 and gorilla, the sharp blow of the first hybrid and the traction of the gorilla remained.</p><p>It is absolutely suitable for all types of work. perfectly copes with thin contours and easily copes with the thickest contours on any skin areas.</p>', '[\"public\\/images\\/categories\\/Diesel Bee 6305e07d1ec9c.png\"]', '<iframe src=\"https://www.youtube.com/embed/jexP06ALt9U\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', '2022-08-24 11:25:33', '2022-09-27 13:14:23');

-- --------------------------------------------------------

--
-- Структура таблицы `mail_config`
--
-- Создание: Авг 28 2022 г., 18:50
--

DROP TABLE IF EXISTS `mail_config`;
CREATE TABLE `mail_config` (
  `id` int(11) UNSIGNED NOT NULL,
  `host` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `SMTPSecure` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `port` int(11) NOT NULL,
  `from_email` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `from_name` varchar(100) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `mail_config`
--

INSERT INTO `mail_config` (`id`, `host`, `username`, `password`, `SMTPSecure`, `port`, `from_email`, `from_name`) VALUES
(1, 'mail.nic.ru', 'info@leosmagin.com', 'DMZb2PuM2WF', 'ssl', 465, 'info@leosmagin.com', '');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--
-- Создание: Авг 28 2022 г., 18:50
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `lang` varchar(2) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'EN',
  `currency` varchar(10) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'EN',
  `status` int(11) UNSIGNED NOT NULL DEFAULT '1',
  `payment_status` tinyint(1) DEFAULT '0',
  `canceled` tinyint(1) DEFAULT '0',
  `info_method` varchar(20) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `delivery_method` varchar(20) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `delivery_time` varchar(30) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `first_name` varchar(100) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `second_name` varchar(100) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `phone` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `instagram` varchar(100) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `billing_country` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `address` mediumtext CHARACTER SET utf8mb4,
  `apartment` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `region` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `zip_code` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `additions` mediumtext CHARACTER SET utf8mb4,
  `cart` longtext CHARACTER SET utf8mb4,
  `cost` mediumtext CHARACTER SET utf8mb4,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `changed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `lang`, `currency`, `status`, `payment_status`, `canceled`, `info_method`, `delivery_method`, `delivery_time`, `first_name`, `second_name`, `phone`, `email`, `instagram`, `billing_country`, `address`, `apartment`, `city`, `region`, `zip_code`, `additions`, `cart`, `cost`, `created_at`, `changed_at`) VALUES
(2, 54, 'RU', 'RU', 1, 0, 0, '', '', '', 'Евгения', 'Шувалова', '89957831303', 'smoktunosya@gmail.com', '', 'RU', 'Коммунарка дом 13', '', 'Москва', 'Москва', '108814', '', '{\"14\":{\"user_id\":\"54\",\"product_id\":\"1\",\"property_id\":\"19\",\"quantity\":\"1\",\"created_at\":\"2022-08-29 13:28:11\",\"changed_at\":\"2022-08-29 13:28:11\"},\"15\":{\"user_id\":\"54\",\"product_id\":\"5\",\"property_id\":\"23\",\"quantity\":\"1\",\"created_at\":\"2022-08-29 13:28:27\",\"changed_at\":\"2022-08-29 13:28:27\"}}', '{\"RUB\":48000,\"USD\":900}', '2022-08-29 10:32:48', '2022-08-29 10:32:48'),
(3, 1280, 'EN', 'EN', 1, 0, 0, '', '', '', 'Krystsina', 'Bartashevich', '690976064', 'bartashevich12@gmail.com', 'gifkl', 'PL', 'Al Solidarnosci 115/ 29', '', 'Warszawa', 'Mazowiecki', '00-140', '', '{\"69\":{\"user_id\":\"1280\",\"product_id\":\"12\",\"property_id\":\"30\",\"quantity\":\"1\",\"created_at\":\"2022-09-05 14:36:14\",\"changed_at\":\"2022-09-05 14:36:14\"}}', '{\"RUB\":28000,\"USD\":555}', '2022-09-05 11:38:26', '2022-09-05 11:38:26'),
(4, 1315, 'EN', 'US', 1, 0, 0, '', '', '', 'Philip', 'Milic', '5109991367', 'fealeye@gmail.com', '@pmtattoos', 'US', '145 Boulder St', '', 'Nevada City', 'CA', '95959', '', '{\"73\":{\"user_id\":\"1315\",\"product_id\":\"12\",\"property_id\":\"30\",\"quantity\":\"1\",\"created_at\":\"2022-09-05 17:34:29\",\"changed_at\":\"2022-09-05 17:34:29\"}}', '{\"RUB\":28000,\"USD\":555}', '2022-09-05 14:57:57', '2022-09-05 14:57:57'),
(5, 1441, 'CH', 'CH', 1, 0, 0, '', '', '', 'David', 'GEORGE', '0798259603', 'contact@sailordave.ch', 'sailordavetattoos', 'CH', 'Avenue Nestlé 36', '', 'Vevey', 'Vaud', '1800', '', '{\"89\":{\"user_id\":\"1441\",\"product_id\":\"13\",\"property_id\":\"31\",\"quantity\":\"1\",\"created_at\":\"2022-09-06 05:02:46\",\"changed_at\":\"2022-09-06 05:02:46\"}}', '{\"RUB\":28000,\"USD\":555}', '2022-09-06 02:09:40', '2022-09-06 02:09:40'),
(6, 1506, 'RU', 'RU', 1, 0, 0, '', '', '', 'Дарья', 'Андрюшина ', '89093537625', 'lucky-pis@mail.ru', '', 'RU', 'Пискарёвский проспект 17к3, кв.53', '', 'Санкт-Петербург', 'Ленинградская область ', '', '', '{\"98\":{\"user_id\":\"1506\",\"product_id\":\"5\",\"property_id\":\"23\",\"quantity\":\"1\",\"created_at\":\"2022-09-06 16:42:56\",\"changed_at\":\"2022-09-06 16:42:56\"}}', '{\"RUB\":20000,\"USD\":385}', '2022-09-06 13:48:11', '2022-09-06 13:48:11'),
(7, 1549, 'AU', 'AU', 1, 0, 0, '', '', '', 'Michele', 'Veltri', '0416808253', 'mikeyveltritattoo@outlook.com', '@mikeydevita_tattoo', 'AU', '6/47 Jonson stress ', '', 'Byron Bay', 'Nsw', '2481', 'Shred Culture Tattoo Co', '{\"101\":{\"user_id\":\"1549\",\"product_id\":\"7\",\"property_id\":\"25\",\"quantity\":\"1\",\"created_at\":\"2022-09-06 22:58:36\",\"changed_at\":\"2022-09-06 22:58:36\"}}', '{\"RUB\":30000,\"USD\":555}', '2022-09-06 20:08:04', '2022-09-06 20:08:04'),
(8, 1666, 'FR', 'FR', 1, 0, 0, '', '', '', 'Leandro', 'Muniz', '0772068567', 'leandromuniz.ink29@gmail.com', 'leandromuniz.ink29', 'FR', '6 rue quincampoix', '', 'France', 'Paris', '75004', '', '{\"107\":{\"user_id\":\"1666\",\"product_id\":\"15\",\"property_id\":\"33\",\"quantity\":\"1\",\"created_at\":\"2022-09-07 13:18:28\",\"changed_at\":\"2022-09-07 13:18:28\"}}', '{\"RUB\":30000,\"USD\":555}', '2022-09-07 10:28:06', '2022-09-07 10:28:06'),
(9, 1687, 'RU', 'RU', 1, 0, 0, '', '', '', 'Яна', 'Валеева', '9096619593', 'nabalcone6@gmail.com', '', 'RU', '3-я Институтская, дом 17', '3 подъезд, квартира 68, этаж 17', 'Москва', 'Москва', '109428', '', '{\"109\":{\"user_id\":\"1687\",\"product_id\":\"6\",\"property_id\":\"24\",\"quantity\":\"1\",\"created_at\":\"2022-09-07 17:32:17\",\"changed_at\":\"2022-09-07 17:32:17\"}}', '{\"RUB\":20000,\"USD\":385}', '2022-09-07 14:40:24', '2022-09-07 14:40:24'),
(10, 2168, 'PL', 'PL', 1, 0, 0, '', '', '', 'Wiktoria', 'Zieniuk', '883185565', 'wiktoria.zieniuk11@gmail.com', '', 'PL', '28 Czerwca 1956r. 130/8', '', 'Poznań', 'Wilkopolska', '61-526', '', '{\"121\":{\"user_id\":\"2168\",\"product_id\":\"5\",\"property_id\":\"23\",\"quantity\":\"1\",\"created_at\":\"2022-09-10 21:09:35\",\"changed_at\":\"2022-09-10 21:09:35\"}}', '{\"RUB\":20000,\"USD\":385}', '2022-09-10 18:16:29', '2022-09-10 18:16:29'),
(11, 2167, 'DE', 'DE', 1, 0, 0, '', '', '', 'Florian', 'Meyer', '015126548642', 'florianjokic@icloud.com', 'American_lowlifex', 'SZ', 'Dompfaffstr. 7', '', 'Euskirchen', 'Nrw ', '53881', '', '{\"122\":{\"user_id\":\"2167\",\"product_id\":\"9\",\"property_id\":\"27\",\"quantity\":\"1\",\"created_at\":\"2022-09-10 21:13:51\",\"changed_at\":\"2022-09-10 21:13:51\"}}', '{\"RUB\":31000,\"USD\":565}', '2022-09-10 18:23:19', '2022-09-10 18:23:19'),
(12, 3019, 'RU', 'RU', 1, 0, 0, '', '', '', 'Никита', 'Радецкий', '9648672891', 'spawoe@gmail.com', 'instagram.com/radecki.tattoo', 'RU', 'ул. Антонова, д.70', 'кв.116', 'Пенза', 'Пензенская область', '', 'если возможно, было бы удобнее получить заказ с помощью СДЕК на пункте выдачи г.Пенза, ул.Антонова 18', '{\"135\":{\"user_id\":\"3019\",\"product_id\":\"5\",\"property_id\":\"23\",\"quantity\":\"1\",\"created_at\":\"2022-09-17 15:32:24\",\"changed_at\":\"2022-09-17 15:32:24\"}}', '{\"RUB\":20000,\"USD\":385}', '2022-09-17 12:50:07', '2022-09-17 12:50:07'),
(13, 3153, 'IT', 'IT', 1, 0, 0, '', '', '', 'Mattia', 'Corda', '3491869157', 'cordash@gmail.com', '', 'AX', 'Via nazionale  556', 'Bar Alexander', 'Sestri Levante', 'Italy', '16039', '', '{\"139\":{\"user_id\":\"3153\",\"product_id\":\"15\",\"property_id\":\"33\",\"quantity\":\"1\",\"created_at\":\"2022-09-19 08:57:38\",\"changed_at\":\"2022-09-19 08:57:38\"}}', '{\"RUB\":30000,\"USD\":555}', '2022-09-19 05:58:50', '2022-09-19 05:58:50'),
(14, 3799, 'BY', 'BY', 1, 0, 0, '', '', '', 'Ян', 'Вилкс ', '80255254575', 'nor45@bk.ru', '', 'BY', 'Проспект независимости 180', 'Кв 243', 'Минск ', 'Минск ', '220141', 'Добрый день!Могу оплатить на Сбербанк?', '{\"158\":{\"user_id\":\"3799\",\"product_id\":\"3\",\"property_id\":\"21\",\"quantity\":\"1\",\"created_at\":\"2022-09-22 18:14:53\",\"changed_at\":\"2022-09-22 18:14:53\"}}', '{\"RUB\":28000,\"USD\":515}', '2022-09-23 10:03:00', '2022-09-23 10:03:00'),
(15, 3920, 'DE', 'DE', 1, 0, 0, '', '', '', 'Alice', 'Casella', '1639758054', 'aliciainmagna@gmail.com', 'a.p_tattoo', 'SZ', 'Stephanstrasse 17', '', 'Berlin', 'Berlin', '10559', '', '{\"160\":{\"user_id\":\"3920\",\"product_id\":\"14\",\"property_id\":\"32\",\"quantity\":\"1\",\"created_at\":\"2022-09-23 22:43:15\",\"changed_at\":\"2022-09-23 22:43:15\"}}', '{\"RUB\":30000,\"USD\":555}', '2022-09-23 19:46:06', '2022-09-23 19:46:06'),
(16, 3935, 'EN', 'GB', 1, 0, 0, '', '', '', 'Kasia', 'Benewiat', '07594619395', 'xonesmilex3@gmail.com', 'benewiatkaa', 'GB', '31 Reeves way', '', 'Southampton', 'Hempshire', 'So318Fu', '', '{\"161\":{\"user_id\":\"3935\",\"product_id\":\"2\",\"property_id\":\"20\",\"quantity\":\"1\",\"created_at\":\"2022-09-24 00:31:01\",\"changed_at\":\"2022-09-24 00:31:01\"}}', '{\"RUB\":28000,\"USD\":515}', '2022-09-23 21:35:08', '2022-09-23 21:35:08'),
(17, 3935, 'EN', 'GB', 1, 0, 0, '', '', '', 'Kasia', 'Benewiat', '07594619395', 'xonesmilex3@gmail.com', 'benewiatkaa', 'GB', '31 Reeves way', '', 'Southampton', 'Hempshire', 'So318Fu', '', '{\"162\":{\"user_id\":\"3935\",\"product_id\":\"16\",\"property_id\":\"34\",\"quantity\":\"1\",\"created_at\":\"2022-09-24 00:35:26\",\"changed_at\":\"2022-09-24 00:35:26\"}}', '{\"RUB\":28000,\"USD\":515}', '2022-09-23 21:35:45', '2022-09-23 21:35:45'),
(18, 5366, 'RU', 'RU', 1, 0, 0, '', '', '', 'Николай', 'Житенко', '89850658125', 'sektantattoo@icloud.com', 'sektantattoo', 'RU', 'Варшавское шоссе 16к2 квартира 196 подъезд 3 этаж 16', '', 'Москва', 'Москва', '', '', '{\"200\":{\"user_id\":\"5366\",\"product_id\":\"5\",\"property_id\":\"23\",\"quantity\":\"1\",\"created_at\":\"2022-10-07 20:32:50\",\"changed_at\":\"2022-10-07 20:32:50\"}}', '{\"RUB\":20000,\"USD\":400}', '2022-10-07 17:42:23', '2022-10-07 17:42:23'),
(19, 5514, 'RU', 'RU', 1, 0, 0, '', '', '', 'Герман', 'Пивчик', '89999833050', 'herman666123@bk.ru', 'pivchik_tattoo', 'RU', 'Красная 125', 'Квартира 123', 'Солнечногорск', 'Московская область', '141506', 'Отправка СДЭКом до терминала на улице Солнечногорск, ул. Красная, 176', '{\"204\":{\"user_id\":\"5514\",\"product_id\":\"4\",\"property_id\":\"22\",\"quantity\":\"1\",\"created_at\":\"2022-10-08 19:14:44\",\"changed_at\":\"2022-10-08 19:14:44\"}}', '{\"RUB\":30000,\"USD\":680}', '2022-10-08 16:22:47', '2022-10-08 16:22:47'),
(20, 5577, 'RU', 'RU', 1, 0, 0, '', '', '', 'Алена', 'Прохорова', '89385311063', 'alena_prokhorova_PAO@mail.ru', '@alena_pao', 'RU', 'Губернского 37', 'КВ 44', 'Новороссийск', 'Краснодарский край ', '353900', '', '{\"205\":{\"user_id\":\"5577\",\"product_id\":\"21\",\"property_id\":\"39\",\"quantity\":\"1\",\"created_at\":\"2022-10-09 11:18:06\",\"changed_at\":\"2022-10-09 11:18:06\"}}', '{\"RUB\":30000,\"USD\":650}', '2022-10-09 08:21:55', '2022-10-09 08:21:55'),
(21, 5773, 'AU', 'AU', 1, 0, 0, '', '', '', 'Valentin', 'Valentin Sullivan', '+61413926662', 'valentin.sullivan.tattoos@gmail.com', 'Valentin.sullivan.tattoos', 'AU', '560a North Rd ', '', 'Ormonx', 'Victoria', '3204', '', '{\"226\":{\"user_id\":\"5773\",\"product_id\":\"12\",\"property_id\":\"30\",\"quantity\":\"1\",\"created_at\":\"2022-10-10 06:37:47\",\"changed_at\":\"2022-10-10 06:37:47\"}}', '{\"RUB\":28000,\"USD\":680}', '2022-10-10 03:40:41', '2022-10-10 03:40:41'),
(22, 5856, 'RU', 'RU', 1, 0, 0, '', '', '', 'Михаил', 'Арсеньев', '89997808263', 'tremerizmaestro666@gmail.com', 'tremerizm_', 'RU', 'Саларьевская 10к1', '1 подъезд, 9 этаж, 76кв', 'Москва', 'Москва', '119297', 'Обязательно свяжитесь со мной', '{\"246\":{\"user_id\":\"5856\",\"product_id\":\"16\",\"property_id\":\"34\",\"quantity\":\"1\",\"created_at\":\"2022-10-10 12:22:49\",\"changed_at\":\"2022-10-10 12:22:49\"},\"247\":{\"user_id\":\"5856\",\"product_id\":\"6\",\"property_id\":\"24\",\"quantity\":\"1\",\"created_at\":\"2022-10-10 12:22:59\",\"changed_at\":\"2022-10-10 12:22:59\"}}', '{\"RUB\":50000,\"USD\":1050}', '2022-10-10 09:28:09', '2022-10-10 09:28:09'),
(23, 6776, 'RU', 'RU', 1, 0, 0, '', '', '', 'Константин', 'Буглов', '89850612370', 'xbkbkx@gmail.com', '', 'RU', 'ул.Толбухина 11/1 ', '5 этаж кв.49', 'Москва', 'МО', '121596', '', '{\"262\":{\"user_id\":\"6776\",\"product_id\":\"12\",\"property_id\":\"30\",\"quantity\":\"1\",\"created_at\":\"2022-10-18 21:40:26\",\"changed_at\":\"2022-10-18 21:40:26\"}}', '{\"RUB\":28000,\"USD\":680}', '2022-10-18 18:43:33', '2022-10-18 18:43:33'),
(24, 7017, 'US', 'US', 1, 0, 0, '', '', '', 'Duclos', 'Laurine', '684449577', 'laurine.duclos@outlook.fr', 'nemesis.tattoos', 'FR', '3 rue Léonard Limosin', 'L’Antique Tattoo', 'Limoges', 'Haute-Vienne, Nouvelle Aquitaine, France', '87000', '', '{\"263\":{\"user_id\":\"7017\",\"product_id\":\"7\",\"property_id\":\"25\",\"quantity\":\"1\",\"created_at\":\"2022-10-20 22:50:27\",\"changed_at\":\"2022-10-20 22:50:27\"}}', '{\"RUB\":30000,\"USD\":680}', '2022-10-20 20:07:35', '2022-10-20 20:07:35'),
(25, 8402, 'BE', 'BE', 1, 0, 0, '', '', '', 'Guillaume', 'Magermans', '+32478561162', 'magermans.guillaume@gmail.com', 'https://www.instagram.com/magzwart/', 'BE', 'rue du Moulin, 26', '26', 'Péruwelz', 'Belgium ', '7600', '', '{\"284\":{\"user_id\":\"8402\",\"product_id\":\"17\",\"property_id\":\"35\",\"quantity\":\"1\",\"created_at\":\"2022-10-28 22:41:32\",\"changed_at\":\"2022-10-28 22:41:32\"}}', '{\"RUB\":28000,\"USD\":680}', '2022-10-28 19:48:15', '2022-10-28 19:48:15'),
(26, 8582, 'EN', 'EN', 1, 0, 0, '', '', '', 'andre', 'jessyca', '85881111582', 'michael.andrean1204@gmail.com', 'antlerism', 'ID', 'jl. tanjung duren utara 8 no 878', 'rumah', 'jl. tanjung duren utara 8 no 878', 'jakarta', '11470', '', '{\"285\":{\"user_id\":\"8582\",\"product_id\":\"13\",\"property_id\":\"31\",\"quantity\":\"1\",\"created_at\":\"2022-10-30 11:17:25\",\"changed_at\":\"2022-10-30 11:17:25\"}}', '{\"RUB\":28000,\"USD\":680}', '2022-10-30 08:19:13', '2022-10-30 08:19:13');

-- --------------------------------------------------------

--
-- Структура таблицы `orders_status`
--
-- Создание: Авг 28 2022 г., 18:50
--

DROP TABLE IF EXISTS `orders_status`;
CREATE TABLE `orders_status` (
  `id` int(11) UNSIGNED NOT NULL,
  `RU` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `EN` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `changed_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `orders_status`
--

INSERT INTO `orders_status` (`id`, `RU`, `EN`, `created_at`, `changed_at`) VALUES
(0, 'Отменен', 'Canceled', '2022-08-23 17:08:29', '2022-08-23 17:08:39'),
(1, 'Новый', 'New', '2022-08-23 17:08:29', '2022-08-23 17:08:29'),
(2, 'Обработан', 'Processed', '2022-08-23 17:09:23', '2022-08-23 17:09:23'),
(3, 'Отправлен', 'Sent', '2022-08-23 17:10:30', '2022-08-23 17:10:30'),
(4, 'Доставлен', 'Delivered', '2022-08-23 17:10:47', '2022-08-23 17:10:47');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--
-- Создание: Авг 28 2022 г., 18:51
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(11) UNSIGNED NOT NULL,
  `category_id` int(11) UNSIGNED NOT NULL DEFAULT '1',
  `name` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `name_en` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb4,
  `description_en` mediumtext CHARACTER SET utf8mb4,
  `images` mediumtext CHARACTER SET utf8mb4,
  `images_min` mediumtext CHARACTER SET utf8mb4,
  `min_price` int(11) DEFAULT NULL,
  `min_price_en` int(11) DEFAULT NULL,
  `max_price` int(11) DEFAULT NULL,
  `max_price_en` int(11) DEFAULT NULL,
  `average_price` int(11) DEFAULT NULL,
  `average_price_en` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `changed_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `name_en`, `description`, `description_en`, `images`, `images_min`, `min_price`, `min_price_en`, `max_price`, `max_price_en`, `average_price`, `average_price_en`, `quantity`, `created_at`, `changed_at`) VALUES
(1, 7, 'Hybrid black clipcord ', 'Hybrid black clipcord with shipping ', '<p>Особенность гибрида, сочетание в себе хлесткого удара индукции и стабильность ротора. С лёгкостью выполняет контурные, закрасочные и теневые работы любыми группами игл.</p><p>Данная версия не предназначена для работ с картриджами, используйте только классические иглы.</p><p><br></p><p>Характеристики:</p><p>Ход иглы 3,5 — 5,5 мм</p><p>Разъём Клип корд</p><p>Вес 140 грамм</p><p>Материал Алюминий авиационный</p><p>Покрытие анодирование</p>', '<p>The peculiarity of the HYBRID , the combination of the lashing kick of induction and the stability of the rotor. Easily performs lines, and shadow work with any group of needles.</p><p>This version is not designed to work with cartridges, use only classic needles.</p><p><br></p><p>Features:</p><p>Needle stroke 3.5 – 5.5 mm</p><p>Connector Clip cord</p><p>Weight 140 grams</p><p>Material Aviation aluminum</p><p>Coating anodizing</p>', '[\"public\\/images\\/products\\/Hybrid black clipcord  630bc5eeecb36.jpg\"]', '[\"public\\/images\\/products\\/min\\/Hybrid black clipcord  630bc5eeecb7b.jpg\"]', 30000, 650, 30000, 650, 30000, 650, 1, '2022-08-28 22:28:47', '2022-10-08 15:08:01'),
(2, 7, 'Hybrid mint clipcord ', 'Hybrid mint clipcord ', '<p>Особенность гибрида, сочетание в себе хлесткого удара индукции и стабильность ротора. С лёгкостью выполняет контурные, закрасочные и теневые работы любыми группами игл.</p><p>Данная версия не предназначена для работ с картриджами, используйте только классические иглы.</p><p><br></p><p>Характеристики:</p><p>Ход иглы 3,5 — 5,5 мм</p><p>Разъём Клип корд</p><p>Вес 140 грамм</p><p>Материал Алюминий авиационный</p><p>Покрытие анодирование</p>', '<p>The peculiarity of the HYBRID , the combination of the lashing kick of induction and the stability of the rotor. Easily performs lines, and shadow work with any group of needles.</p><p>This version is not designed to work with cartridges, use only classic needles.</p><p><br></p><p>Features:</p><p>Needle stroke 3.5 – 5.5 mm</p><p>Connector Clip cord</p><p>Weight 140 grams</p><p>Material Aviation aluminum</p><p>Coating anodizing</p>', '[\"public\\/images\\/products\\/Hybrid mint clipcord  630bc7c262d71.jpg\"]', '[\"public\\/images\\/products\\/min\\/Hybrid mint clipcord  630bc7c262dba.jpg\"]', 28000, 650, 28000, 650, 28000, 650, 0, '2022-08-28 22:53:38', '2022-10-07 11:35:50'),
(3, 7, 'Hybrid antiqua Rca', 'Hybrid antiqua Rca', '<p>Особенность гибрида, сочетание в себе хлесткого удара индукции и стабильность ротора. С лёгкостью выполняет контурные, закрасочные и теневые работы любыми группами игл.</p><p>Данная версия не предназначена для работ с картриджами, используйте только классические иглы.</p><p><br></p><p>Характеристики:</p><p>Ход иглы 3,5 — 5,5 мм</p><p>Разъём Rca</p><p>Вес 140 грамм</p><p>Материал Алюминий авиационный</p><p>Покрытие анодирование</p>', '<p>The peculiarity of the HYBRID , the combination of the lashing kick of induction and the stability of the rotor. Easily performs lines, and shadow work with any group of needles.</p><p>This version is not designed to work with cartridges, use only classic needles.</p><p><br></p><p>Features:</p><p>Needle stroke 3.5 – 5.5 mm</p><p>Connector Rca</p><p>Weight 140 grams</p><p>Material Aviation aluminum</p><p>Coating anodizing</p>', '[\"public\\/images\\/products\\/Hybrid antiqua Rca 630bd040689d8.jpg\"]', '[\"public\\/images\\/products\\/min\\/Hybrid antiqua Rca 630bd04068a21.jpg\"]', 28000, 650, 28000, 650, 28000, 650, 0, '2022-08-28 23:29:52', '2022-10-07 11:36:30'),
(4, 6, 'Gorilla black clipcord ', 'Gorilla black clipcord ', '<p>Горилла имея самый мощный мотор, отлично подходит для работы с толстыми контурами 7-18рл и крупными магнумами. Максимальный комфорт в работе и не превзойденная надёжность делает эту машинку главной в вашем парке рабочих лошадок.</p><p>Разъём клипкорд</p><p>Вес 180 грамм</p><p>Ход иглы 3,5 — 5 мм</p>', '<p>Gorilla with the most powerful motor is great for working with thick lines 7-18rl and large magnums Maximum work comfort and unmatched reliability make this machine the ultimate in your workhorse fleet.</p><p><br></p><p>Clipcord connector</p><p>Weight 180 grams</p><p>Needle stroke 3.5 – 5 mm</p>', '[\"public\\/images\\/products\\/Gorilla black clipcord  630bd33f6d794.jpg\"]', '[\"public\\/images\\/products\\/min\\/Gorilla black clipcord  630bd33f6d7f2.jpg\"]', 30000, 680, 30000, 680, 30000, 680, 2, '2022-08-28 23:42:39', '2022-10-07 11:37:04'),
(5, 4, 'Rotary gold ', 'Rotary gold ', '<p>Классическая роторная машинка direct drive. Оснащён мощным швейцарским мотором MAXON A MAX. Можно использовать как для классических игл так и для картриджной системы. В комплекте три сменных эксцентрика с ходом 3.6 мм, 4.2 мм и с ходом 5 мм </p><p>Эксцентрик с ходом 3.6 мм отлично подойдёт для покраса и цветовых растяжек </p><p>Эксцентрик с ходом 4,2 мм отлично подойдёт для контурных работ и плотного покраса </p><p>Эксцентрик с ходом 5 мм предназначен для дотворка и экспериментальных техник </p><p><br></p><p>Подключение : Клип корд </p><p>Покрытие : Анодирование </p><p><br></p>', '<p>Classic rotary direct drive machine.&nbsp;Equipped with a powerful Swiss motor MAXON A MAX.&nbsp;Can be used for both classic needles and cartridge system.&nbsp;Includes three eccentrics with 3.6mm, 4.2mm and 5mm stroke. </p><p><span style=\"color: var(--bs-body-color); font-weight: var(--bs-body-font-weight);\">Eccentric with 3.6 mm stroke is perfect for color and color stretching. </span></p><p><span style=\"color: var(--bs-body-color); font-weight: var(--bs-body-font-weight);\">Eccentric with 4.2mm stroke is perfect for lines and shader. </span></p><p><span style=\"color: var(--bs-body-color); font-weight: var(--bs-body-font-weight);\">Eccentric with a stroke of 5 mm is designed for dotwork and experimental techniques. </span></p><p><br></p><p>Connection : Clip cord</p><p><span style=\"color: var(--bs-body-color); font-weight: var(--bs-body-font-weight);\">Finish : Anodizing</span></p>', '[\"public\\/images\\/products\\/Rotary  630bdd36c5e24.jpg\",\"public\\/images\\/products\\/Rotary  630bdd36c5e26.jpg\"]', '[\"public\\/images\\/products\\/min\\/Rotary  630bdd36c5e9e.jpg\"]', 20000, 400, 20000, 400, 20000, 400, 1, '2022-08-29 00:20:34', '2022-10-03 16:37:48'),
(6, 4, 'Rotary black ', 'Rotary black', '<p>Классическая роторная машинка direct drive. Оснащён мощным швейцарским мотором MAXON A MAX. Можно использовать как для классических игл так и для картриджной системы. В комплекте три сменных эксцентрика с ходом 3.6 мм, 4.2 мм и с ходом 5 мм </p><p>Эксцентрик с ходом 3.6 мм отлично подойдёт для покраса и цветовых растяжек </p><p>Эксцентрик с ходом 4,2 мм отлично подойдёт для контурных работ и плотного покраса </p><p>Эксцентрик с ходом 5 мм предназначен для дотворка и экспериментальных техник </p><p><br></p><p>Подключение : Клип корд </p><p>Покрытие : Анодирование </p><p><br></p>', '<p>Classic rotary direct drive machine.&nbsp;Equipped with a powerful Swiss motor MAXON A MAX.&nbsp;Can be used for both classic needles and cartridge system.&nbsp;Includes three eccentrics with 3.6mm, 4.2mm and 5mm stroke. </p><p><span style=\"color: var(--bs-body-color); font-weight: var(--bs-body-font-weight);\">Eccentric with 3.6 mm stroke is perfect for color and color stretching. </span></p><p><span style=\"color: var(--bs-body-color); font-weight: var(--bs-body-font-weight);\">Eccentric with 4.2mm stroke is perfect for lines and shader. </span></p><p><span style=\"color: var(--bs-body-color); font-weight: var(--bs-body-font-weight);\">Eccentric with a stroke of 5 mm is designed for dotwork and experimental techniques. </span></p><p><br></p><p>Connection : Clip cord</p><p><span style=\"color: var(--bs-body-color); font-weight: var(--bs-body-font-weight);\">Finish : Anodizing</span></p>', '[\"public\\/images\\/products\\/Rotary black 630bdf311d5a8.jpg\",\"public\\/images\\/products\\/Rotary black 630bdf311d5aa.jpg\"]', '[\"public\\/images\\/products\\/min\\/Rotary black 630bdf311d60f.jpg\"]', 20000, 400, 20000, 400, 20000, 400, 1, '2022-08-29 00:33:37', '2022-10-07 11:31:43'),
(7, 6, 'Gorilla gold clipcord ', 'Gorilla gold clipcord ', '<p>Горилла имея самый мощный мотор, отлично подходит для работы с толстыми контурами 7-18рл и крупными магнумами. Максимальный комфорт в работе и не превзойденная надёжность делает эту машинку главной в вашем парке рабочих лошадок.</p><p>Разъём клипкорд</p><p>Вес 180 грамм</p><p>Ход иглы 3,5 — 5 мм</p>', '<p>Gorilla with the most powerful motor is great for working with thick lines 7-18rl and large magnums Maximum work comfort and unmatched reliability make this machine the ultimate in your workhorse fleet.</p><p><br></p><p>Clipcord connector</p><p>Weight 180 grams</p><p>Needle stroke 3.5 – 5 mm</p>', '[\"public\\/images\\/products\\/Gorilla gold clipcord  630be0b7c3eca.jpg\"]', '[\"public\\/images\\/products\\/min\\/Gorilla gold clipcord  630be0b7c3f58.jpg\"]', 30000, 680, 30000, 680, 30000, 680, 1, '2022-08-29 00:40:07', '2022-10-07 11:37:43'),
(8, 6, 'Gorilla red camo clipcord ', 'Gorilla red camo clipcord ', '<p>Горилла имея самый мощный мотор, отлично подходит для работы с толстыми контурами 7-18рл и крупными магнумами. Максимальный комфорт в работе и не превзойденная надёжность делает эту машинку главной в вашем парке рабочих лошадок.</p><p>Разъём клипкорд</p><p>Вес 180 грамм</p><p>Ход иглы 3,5 — 5 мм</p>', '<p>Gorilla with the most powerful motor is great for working with thick lines 7-18rl and large magnums Maximum work comfort and unmatched reliability make this machine the ultimate in your workhorse fleet.</p><p><br></p><p>Clipcord connector</p><p>Weight 180 grams</p><p>Needle stroke 3.5 – 5 mm</p>', '[\"public\\/images\\/products\\/Gorilla red camo clipcord  630be2cc4ae2c.jpg\"]', '[\"public\\/images\\/products\\/min\\/Gorilla red camo clipcord  630be2cc4ae97.jpg\"]', 31000, 680, 31000, 680, 31000, 680, 1, '2022-08-29 00:49:00', '2022-09-26 21:02:42'),
(9, 6, 'Gorilla antiqua Rca', 'Gorilla antiqua Rca', '<p>Горилла имея самый мощный мотор, отлично подходит для работы с толстыми контурами 7-18рл и крупными магнумами. Максимальный комфорт в работе и не превзойденная надёжность делает эту машинку главной в вашем парке рабочих лошадок.</p><p>Разъём  рса</p><p>Вес 180 грамм</p><p>Ход иглы 3,5 — 5 мм</p>', '<p>Gorilla with the most powerful motor is great for working with thick lines 7-18rl and large magnums Maximum work comfort and unmatched reliability make this machine the ultimate in your workhorse fleet.</p><p><br></p><p>Connector RCA </p><p>Weight 180 grams</p><p>Needle stroke 3.5 – 5 mm</p>', '[\"public\\/images\\/products\\/Gorilla antiqua Rca 630c9501d050c.jpg\"]', '[\"public\\/images\\/products\\/min\\/Gorilla antiqua Rca 630c9501d059f.jpg\"]', 31000, 680, 31000, 680, 31000, 680, 1, '2022-08-29 13:29:21', '2022-09-26 21:03:13'),
(10, 3, 'Индукция ', 'Coil machine ', '<p>Классическая индукционная машинка.</p><p>Собрана и настроена мной лично.</p><p>Рама цельнофрезерованная из сделана монолита железа.&nbsp;</p><p>Назначение: контур от 3 до 11 игл</p><p>Рабочий вольтаж: 4-6,5 вольт</p><p>Вес: 180 грамм</p><p>Покрытие: состаренный никель</p><p>Подключение: клипкорд&nbsp;</p>', '<p>Классическая индукционная машинка.</p><p>Собрана и настроена мной лично.</p><p>Рама цельнофрезерованная из сделана монолита железа.&nbsp;</p><p>Назначение: контур от 3 до 11 игл</p><p>Рабочий вольтаж: 4-6,5 вольт</p><p>Вес: 180 грамм</p><p>Покрытие: состаренный никель</p><p>Подключение: клипкорд&nbsp;</p>', '[\"public\\/images\\/products\\/Coil machine  630dc193a260b.jpg\"]', '[\"public\\/images\\/products\\/min\\/Coil machine  630dc193a26ad.jpg\"]', 14000, 250, 14000, 250, 14000, 250, 1, '2022-08-30 10:51:47', '2022-08-30 16:14:46'),
(11, 3, 'Индукция ', 'Coil machine ', '<p><br></p>', '<p><br></p>', '[\"public\\/images\\/products\\/Coil machine  630dcba70be1b.jpg\"]', '[\"public\\/images\\/products\\/min\\/Coil machine  630dcba70bf04.jpg\"]', 14000, 250, 14000, 250, 14000, 250, 1, '2022-08-30 11:34:47', '2022-08-30 11:34:47'),
(12, 8, 'Diesel bee чёрный ', 'Diesel bee black ', '<p class=\"ql-align-justify\">Характеристики:</p><p class=\"ql-align-justify\">Ход иглы 3,5 — 5,5 мм</p><p class=\"ql-align-justify\">Разъём Клип корд</p><p class=\"ql-align-justify\">Вес 130 грамм</p><p class=\"ql-align-justify\">Материал Алюминий авиационный</p><p class=\"ql-align-justify\">Покрытие анодирование</p>', '<p class=\"ql-align-justify\">Features:</p><p class=\"ql-align-justify\">Needle stroke 3.5 – 5.5 mm</p><p class=\"ql-align-justify\">Connector Clip cord</p><p class=\"ql-align-justify\">Weight 140 grams</p><p class=\"ql-align-justify\">Material Aviation aluminum</p><p class=\"ql-align-justify\">Coating anodizing</p>', '[\"public\\/images\\/products\\/Diesel bee black  6319852e9300e.jpg\"]', '[\"public\\/images\\/products\\/min\\/Diesel bee black  6319852e930c7.jpg\"]', 28000, 680, 28000, 680, 28000, 680, 2, '2022-09-05 10:41:45', '2022-09-27 16:52:22'),
(13, 8, 'Diesel bee золотой', 'Diesel bee gold', '<p class=\"ql-align-justify\">Характеристики:</p><p class=\"ql-align-justify\">Ход иглы 3,5 — 5,5 мм</p><p class=\"ql-align-justify\">Разъём Клип корд</p><p class=\"ql-align-justify\">Вес 130 грамм</p><p class=\"ql-align-justify\">Материал Алюминий авиационный</p><p class=\"ql-align-justify\">Покрытие анодирование</p><p><br></p>', '<p class=\"ql-align-justify\">Features:</p><p class=\"ql-align-justify\">Needle stroke 3.5 – 5.5 mm</p><p class=\"ql-align-justify\">Connector Clip cord</p><p class=\"ql-align-justify\">Weight 140 grams</p><p class=\"ql-align-justify\">Material Aviation aluminum</p><p class=\"ql-align-justify\">Coating anodizing</p>', '[\"public\\/images\\/products\\/Diesel bee gold 6319850f760e7.jpg\"]', '[\"public\\/images\\/products\\/min\\/Diesel bee gold 6319850f7619d.jpg\"]', 28000, 680, 28000, 680, 28000, 680, 2, '2022-09-05 10:43:41', '2022-09-27 16:52:06'),
(14, 6, 'Gorilla gold Rca', 'Gorilla gold Rca', '<p>Горилла имея самый мощный мотор, отлично подходит для работы с толстыми контурами 7-18рл и крупными магнумами. Максимальный комфорт в работе и не превзойденная надёжность делает эту машинку главной в вашем парке рабочих лошадок.</p><p>Разъём  рса</p><p>Вес 180 грамм</p><p>Ход иглы 3,5 — 5 мм</p>', '<p>Gorilla with the most powerful motor is great for working with thick lines 7-18rl and large magnums Maximum work comfort and unmatched reliability make this machine the ultimate in your workhorse fleet.</p><p><br></p><p>Connector RCA </p><p>Weight 180 grams</p><p>Needle stroke 3.5 – 5 mm</p>', '[\"public\\/images\\/products\\/Gorilla gold Rca 63164baf458b1.jpg\"]', '[\"public\\/images\\/products\\/min\\/Gorilla gold Rca 63164baf45953.jpg\"]', 30000, 680, 30000, 680, 30000, 680, 1, '2022-09-05 22:19:11', '2022-09-26 21:04:18'),
(15, 6, 'Gorilla black Rca', 'Gorilla black Rca', '<p>Горилла имея самый мощный мотор, отлично подходит для работы с толстыми контурами 7-18рл и крупными магнумами. Максимальный комфорт в работе и не превзойденная надёжность делает эту машинку главной в вашем парке рабочих лошадок.</p><p>Разъём  рса</p><p>Вес 180 грамм</p><p>Ход иглы 3,5 — 5 мм</p>', '<p>Gorilla with the most powerful motor is great for working with thick lines 7-18rl and large magnums Maximum work comfort and unmatched reliability make this machine the ultimate in your workhorse fleet.</p><p><br></p><p>Connector RCA </p><p>Weight 180 grams</p><p>Needle stroke 3.5 – 5 mm</p>', '[\"public\\/images\\/products\\/Gorilla black Rca 63164d25cd67e.jpg\"]', '[\"public\\/images\\/products\\/min\\/Gorilla black Rca 63164d25cd6d8.jpg\"]', 30000, 680, 30000, 680, 30000, 680, 4, '2022-09-05 22:25:25', '2022-10-07 11:38:47'),
(16, 7, 'Hybrid silver clipcord ', 'Hybrid silver clipcord ', '<p>Особенность гибрида, сочетание в себе хлесткого удара индукции и стабильность ротора. С лёгкостью выполняет контурные, закрасочные и теневые работы любыми группами игл.</p><p>Данная версия не предназначена для работ с картриджами, используйте только классические иглы.</p><p><br></p><p>Характеристики:</p><p>Ход иглы 3,5 — 5,5 мм</p><p>Разъём Клип корд</p><p>Вес 140 грамм</p><p>Материал Алюминий авиационный</p><p>Покрытие анодирование</p>', '<p>The peculiarity of the HYBRID , the combination of the lashing kick of induction and the stability of the rotor. Easily performs lines, and shadow work with any group of needles.</p><p>This version is not designed to work with cartridges, use only classic needles.</p><p><br></p><p>Features:</p><p>Needle stroke 3.5 – 5.5 mm</p><p>Connector Clip cord</p><p>Weight 140 grams</p><p>Material Aviation aluminum</p><p>Coating anodizing</p>', '[\"public\\/images\\/products\\/Hybrid silver clipcord  63164eac7e228.jpg\"]', '[\"public\\/images\\/products\\/min\\/Hybrid silver clipcord  63164eac7e27b.jpg\"]', 30000, 650, 30000, 650, 30000, 650, 1, '2022-09-05 22:28:12', '2022-10-08 15:09:13'),
(17, 8, 'Diesel bee black cherry', 'Diesel bee black cherry', '<p class=\"ql-align-justify\">Характеристики:</p><p class=\"ql-align-justify\">Ход иглы 3,5 — 5,5 мм</p><p class=\"ql-align-justify\">Разъём Клип корд</p><p class=\"ql-align-justify\">Вес 130 грамм</p><p class=\"ql-align-justify\">Материал Алюминий авиационный</p><p class=\"ql-align-justify\">Покрытие анодирование</p>', '<p class=\"ql-align-justify\">Features:</p><p class=\"ql-align-justify\">Needle stroke 3.5 – 5.5 mm</p><p class=\"ql-align-justify\">Connector Clip cord</p><p class=\"ql-align-justify\">Weight 140 grams</p><p class=\"ql-align-justify\">Material Aviation aluminum</p><p class=\"ql-align-justify\">Coating anodizing</p>', '[\"public\\/images\\/products\\/Diesel bee black cherry 6332ffcd8ded7.jpg\"]', '[\"public\\/images\\/products\\/min\\/Diesel bee black cherry 6332ffcd8df8d.jpg\"]', 28000, 680, 28000, 680, 28000, 680, 2, '2022-09-27 16:51:09', '2022-09-27 16:51:09'),
(18, 6, 'Gorilla silver clipcord ', 'Gorilla silver clipcord ', '<p>Горилла имея самый мощный мотор, отлично подходит для работы с толстыми контурами 7-18рл и крупными магнумами. Максимальный комфорт в работе и не превзойденная надёжность делает эту машинку главной в вашем парке рабочих лошадок.</p><p>Разъём клипкорд</p><p>Вес 180 грамм</p><p>Ход иглы 3,5 — 5 мм</p>', '<p>Gorilla with the most powerful motor is great for working with thick lines 7-18rl and large magnums Maximum work comfort and unmatched reliability make this machine the ultimate in your workhorse fleet.</p><p><br></p><p>Clipcord connector</p><p>Weight 180 grams</p><p>Needle stroke 3.5 – 5 mm</p>', '[\"public\\/images\\/products\\/Gorilla silver clipcord  633fe7ca8a26c.jpg\"]', '[\"public\\/images\\/products\\/min\\/Gorilla silver clipcord  633fe7ca8a2fc.jpg\"]', 30000, 680, 30000, 680, 30000, 680, 3, '2022-10-07 11:48:10', '2022-10-07 11:48:10'),
(20, 7, 'Hybrid black b clipcord ', 'Hybrid black b clipcord with shipping ', '<p>Особенность гибрида, сочетание в себе хлесткого удара индукции и стабильность ротора. С лёгкостью выполняет контурные, закрасочные и теневые работы любыми группами игл.</p><p>Данная версия не предназначена для работ с картриджами, используйте только классические иглы.</p><p><br></p><p>Характеристики:</p><p>Ход иглы 3,5 — 5,5 мм</p><p>Разъём Клип корд</p><p>Вес 140 грамм</p><p>Материал Алюминий авиационный</p><p>Покрытие анодирование</p>', '<p>The peculiarity of the HYBRID , the combination of the lashing kick of induction and the stability of the rotor. Easily performs lines, and shadow work with any group of needles.</p><p>This version is not designed to work with cartridges, use only classic needles.</p><p><br></p><p>Features:</p><p>Needle stroke 3.5 – 5.5 mm</p><p>Connector Clip cord</p><p>Weight 140 grams</p><p>Material Aviation aluminum</p><p>Coating anodizing</p>', '[\"public\\/images\\/products\\/Hybrid black b clipcord with shipping  633fe94543a47.jpg\"]', '[\"public\\/images\\/products\\/min\\/Hybrid black b clipcord with shipping  633fe94543aba.jpg\"]', 30000, 650, 30000, 650, 30000, 650, 1, '2022-10-07 11:54:29', '2022-10-08 15:09:29'),
(21, 7, 'Hybrid antiqua clipcord ', 'Hybrid antiqua clipcord with shipping ', '<p>Особенность гибрида, сочетание в себе хлесткого удара индукции и стабильность ротора. С лёгкостью выполняет контурные, закрасочные и теневые работы любыми группами игл.</p><p>Данная версия не предназначена для работ с картриджами, используйте только классические иглы.</p><p><br></p><p>Характеристики:</p><p>Ход иглы 3,5 — 5,5 мм</p><p>Разъём Клип корд</p><p>Вес 140 грамм</p><p>Материал Алюминий авиационный</p><p>Покрытие анодирование</p>', '<p>The peculiarity of the HYBRID , the combination of the lashing kick of induction and the stability of the rotor. Easily performs lines, and shadow work with any group of needles.</p><p>This version is not designed to work with cartridges, use only classic needles.</p><p><br></p><p>Features:</p><p>Needle stroke 3.5 – 5.5 mm</p><p>Connector Clip cord</p><p>Weight 140 grams</p><p>Material Aviation aluminum</p><p>Coating anodizing</p>', '[\"public\\/images\\/products\\/Hybrid antiqua clipcord with shipping  633fe9fa47154.jpg\"]', '[\"public\\/images\\/products\\/min\\/Hybrid antiqua clipcord with shipping  633fe9fa471ae.jpg\"]', 30000, 650, 30000, 650, 30000, 650, 3, '2022-10-07 11:57:30', '2022-10-08 15:09:51');

-- --------------------------------------------------------

--
-- Структура таблицы `products_properties`
--
-- Создание: Авг 28 2022 г., 18:51
--

DROP TABLE IF EXISTS `products_properties`;
CREATE TABLE `products_properties` (
  `id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `classname` varchar(100) CHARACTER SET utf8mb4 DEFAULT '',
  `classname_en` varchar(100) CHARACTER SET utf8mb4 DEFAULT '',
  `name` varchar(100) CHARACTER SET utf8mb4 DEFAULT 'default',
  `name_en` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `price_en` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `changed_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Экземпляры товара с индивидуальными свойствами';

--
-- Дамп данных таблицы `products_properties`
--

INSERT INTO `products_properties` (`id`, `product_id`, `classname`, `classname_en`, `name`, `name_en`, `price`, `price_en`, `quantity`, `created_at`, `changed_at`) VALUES
(19, 1, '', '', 'Hybrid black clipcord ', 'Hybrid black clipcord ', 30000, 650, 1, '2022-08-28 22:28:47', '2022-10-08 15:08:01'),
(20, 2, '', '', 'Hybrid mint clipcord ', 'Hybrid mint clipcord ', 30000, 650, 0, '2022-08-28 22:53:38', '2022-10-08 15:08:16'),
(21, 3, '', '', 'Hybrid antiqua Rca', 'Hybrid antiqua Rca', 30000, 650, 0, '2022-08-28 23:29:52', '2022-10-08 15:08:40'),
(22, 4, '', '', 'Gorilla black clipcord ', 'Gorilla black clipcord ', 30000, 680, 1, '2022-08-28 23:42:39', '2022-10-07 11:37:04'),
(23, 5, '', '', 'Rotary ', 'Rotary ', 20000, 400, 0, '2022-08-29 00:20:34', '2022-10-03 16:37:48'),
(24, 6, '', '', 'Rotary black ', 'Rotary black', 20000, 400, 0, '2022-08-29 00:33:37', '2022-10-07 11:31:43'),
(25, 7, '', '', 'Gorilla gold clipcord ', 'Gorilla gold clipcord ', 30000, 680, 0, '2022-08-29 00:40:07', '2022-10-07 11:37:43'),
(26, 8, '', '', 'Gorilla red camo clipcord ', 'Gorilla red camo clipcord ', 31000, 680, 1, '2022-08-29 00:49:00', '2022-09-26 21:02:42'),
(27, 9, '', '', 'Gorilla antiqua Rca', 'Gorilla antiqua Rca', 31000, 680, 1, '2022-08-29 13:29:21', '2022-09-26 21:03:13'),
(28, 10, '', '', 'Индукция ', 'Coil machine ', 14000, 250, 1, '2022-08-30 10:51:47', '2022-08-30 10:51:47'),
(29, 11, '', '', 'Индукция ', 'Coil machine ', 14000, 250, 1, '2022-08-30 11:34:47', '2022-08-30 11:34:47'),
(30, 12, '', '', 'Diesel bee чёрный ', 'Diesel bee black ', 28000, 680, 0, '2022-09-05 10:41:45', '2022-09-27 16:52:22'),
(31, 13, '', '', 'Diesel bee золотой', 'Diesel bee gold', 28000, 680, 1, '2022-09-05 10:43:41', '2022-09-27 16:52:06'),
(32, 14, '', '', 'Gorilla gold Rca', 'Gorilla gold Rca', 30000, 680, 1, '2022-09-05 22:19:11', '2022-09-26 21:04:18'),
(33, 15, '', '', 'Gorilla black Rca', 'Gorilla black Rca', 30000, 680, 4, '2022-09-05 22:25:25', '2022-10-07 11:38:47'),
(34, 16, '', '', 'Hybrid silver clipcord ', 'Hybrid silver clipcord ', 30000, 650, 0, '2022-09-05 22:28:12', '2022-10-08 15:09:13'),
(35, 17, '', '', 'Diesel bee black cherry', 'Diesel bee black cherry', 28000, 680, 1, '2022-09-27 16:51:09', '2022-09-27 16:51:09'),
(36, 18, '', '', 'Gorilla silver clipcord ', 'Gorilla silver clipcord ', 30000, 680, 3, '2022-10-07 11:48:10', '2022-10-07 11:48:10'),
(38, 20, '', '', 'Hybrid black b clipcord ', 'Hybrid black b clipcord with shipping ', 30000, 650, 1, '2022-10-07 11:54:29', '2022-10-08 15:09:29'),
(39, 21, '', '', 'Hybrid antiqua clipcord ', 'Hybrid antiqua clipcord with shipping ', 30000, 650, 2, '2022-10-07 11:57:30', '2022-10-08 15:09:51');

-- --------------------------------------------------------

--
-- Структура таблицы `sber_config`
--
-- Создание: Авг 28 2022 г., 18:51
--

DROP TABLE IF EXISTS `sber_config`;
CREATE TABLE `sber_config` (
  `id` int(1) UNSIGNED NOT NULL,
  `host` mediumtext CHARACTER SET utf8mb4 NOT NULL,
  `userName` mediumtext CHARACTER SET utf8mb4 NOT NULL,
  `password` mediumtext CHARACTER SET utf8mb4 NOT NULL,
  `ApiToken` mediumtext CHARACTER SET utf8mb4 NOT NULL,
  `secretKey` mediumtext CHARACTER SET utf8mb4
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `status`
--
-- Создание: Авг 28 2022 г., 18:51
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `block` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `status`
--

INSERT INTO `status` (`id`, `block`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--
-- Создание: Авг 28 2022 г., 18:52
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `session_id` varchar(128) CHARACTER SET utf8mb4 DEFAULT NULL,
  `first_name` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `second_name` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `country` varchar(2) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'EN',
  `billing_country` varchar(2) CHARACTER SET utf8mb4 DEFAULT NULL,
  `lang` varchar(2) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'EN',
  `phone` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `instagram` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `address` mediumtext CHARACTER SET utf8mb4,
  `apartment` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `region` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `zip_code` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `additions` mediumtext CHARACTER SET utf8mb4,
  `password` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL,
  `role` varchar(20) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'guest',
  `temp` tinyint(1) DEFAULT '1',
  `orders` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `changed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `session_id`, `first_name`, `second_name`, `country`, `billing_country`, `lang`, `phone`, `email`, `instagram`, `address`, `apartment`, `city`, `region`, `zip_code`, `additions`, `password`, `role`, `temp`, `orders`, `created_at`, `changed_at`) VALUES
(1, NULL, 'Леонид', 'Смагин', 'EN', 'RU', 'EN', '+79782599591', 'info@leosmagin.com', '', '', '', '', '', '', '', '813869ad63acf6888f4b3492e4a5e66a', 'admin', 0, 0, '2022-08-22 07:21:26', '2022-10-10 12:24:09'),
(307, NULL, 'CmlXKGQft', 'alFCyQjUwPR', 'TH', 'JP', 'TH', '3170896085', 'lpaulette8g765w93lzy@outlook.com', 'jOleuKfyRcJsbAB', 'AHYEPMcuVdb', 'dXRkxaKJEqf', 'ScdqoeKFtL', 'YpeiJtDQlAPMFUSg', 'tcdIRFgoKOj', 'shZAiRrID', '8473256e6f12f720a323ecf1733e7af0', 'authorize', 0, 0, '2022-08-30 03:22:26', '2022-09-01 03:27:41'),
(686, NULL, 'Марина', 'Марина', 'EE', 'SR', 'EE', '+71231234567', 'petrov-antokha.198679@mail.ru', 'Марина', 'https://delby.ru/', '', 'Moscow', 'Moscow', '131251', 'Доброго времени суток! \r\nМеня зовут Марина, я менеджер службы доставки DELBY https://delby.ru/. \r\nНаша компания оказывает услуги  экспресс-доставки физическим и юридическим лицам по Москве и Московской области пешими курьерами и на авто. \r\n \r\nСекрет популярности доставки в условиях современного ритма жизни заключается в ее скорости и удобстве. Чтобы оформить доставку документов, подарков, товаров из своего магазина и другого, Вам не нужно покидать дом. Просто оформите заказ в DELBY https://delby.ru/ . Мы всегда спешим  выручить Вас в любую минуту. \r\n \r\nНаши преимущества: \r\n- фиксированная стоимость по Москве в любую точку города; \r\n- собственный штат профессиональных курьеров; \r\n- берем в работу любые направления занятости; \r\n- ДАРИМ ПРОМОКОД НА СКИДКУ на любой заказ в приложении  -50руб «DELNEW» \r\n \r\nКонтакты: почта и +7(495) 740-63-20', '0046d69af17d5da2eaf0670a24b9ef0e', 'authorize', 0, 0, '2022-09-01 10:59:07', '2022-09-03 11:21:28'),
(687, NULL, 'Марина', 'Марина', 'EE', 'MT', 'EE', '+71231234567', 'elena_zubareva95954@mail.ru', 'Марина', 'https://birja-job.ru/', '', 'Moscow', 'Moscow', '111523', 'Приветствую! \r\nМеня зовут Марина, я менеджер площадки [url=https://birja-job.ru/]БИРЖА ДЖОБ[/url]. \r\nНа официальной платформе РФ [url=https://birja-job.ru/]БИРЖА ДЖОБ[/url] мы собрали проверенных заказчиков и профессиональных исполнителей. \r\n \r\nЕсли Вы мастер в строительных вопросах, специалист в общепите, профи на производстве и в других сферах деятельности, тогда мы  приглашаем Вас на регистрацию на нашей площадке! Авторизуйтесь как ИСПОЛНИТЕЛЬ и берите заказы в удобное Вам время и месте. \r\nВНИМАНИЕ! Все заказы без комиссии! \r\nПолучайте оплату за работу и не совершайте больше никаких расходов. \r\nhttps://birja-job.ru/', '649cb7824e0c234818e8d3beb0542af0', 'authorize', 0, 0, '2022-09-01 10:59:07', '2022-09-03 11:21:28'),
(688, NULL, 'Марина', 'Марина', 'EE', 'TC', 'EE', '+71231234567', 'marat_galiamov19731128@mail.ru', 'Марина', 'https://mskjob.ru/create-account/?type=0', '', 'Moscow', 'Moscow', '134134', 'Доброго времени суток! \r\nМеня зовут Марина, я менеджер площадки [url=https://mskjob.ru/create-account/?type=0]МСК ДЖОБ[/url]. \r\nВы ищите работу или подработку с высокой заработной платой? Тогда приглашаем Вас на официальный сайт Москвы [url=https://mskjob.ru/create-account/?type=0]MSK JOB[/url]. На нашей площадке собраны только проверенные, высококлассные работодатели России. Оставляйте свое резюме  - выходите на работу! \r\n \r\nНе упустите возможность стать успешным в работе :-) \r\nhttps://mskjob.ru/', '543675b07373bb52593fe285075681af', 'authorize', 0, 0, '2022-09-01 10:59:07', '2022-09-03 11:21:28'),
(898, NULL, 'DcGlkoJqySeXWEYV', 'MUWNGAupPjXbfDeR', 'KR', 'JP', 'KR', '9145692684', 'kurstin6710scvuo4@outlook.com', 'hqVMiEFLB', 'bviDFzLw', 'kwPAagoz', 'IvtBAcbSrRNlYMkE', 'KTDxfoIivVZq', 'dneBLGwqQ', 'seUDkpaynbH', '8fa750ac3c8b8b551c6c473d34e8525e', 'authorize', 0, 0, '2022-09-02 18:03:51', '2022-09-04 18:08:25'),
(1046, NULL, 'Роман', 'Роман', 'EE', 'BG', 'EE', '+19999999999', 'ilinagho1971@mail.ru', 'Роман', 'https://www.google.com/', '', 'Moscow', 'Moscow', '145433', 'Интересна переписка  и заказы конкурентов ?  Любопытно с кем общается жена/муж/сотрудник  ? \r\n \r\nПомогу \"попасть\" в нужную вам почту, анонимность полная, консультации бесплатные. \r\n \r\nБез предоплат !  Доказательства любые ( фото вашего письма, либо читаю ваше письмо )  и т.д. \r\n \r\nСтоимость - \'Мaил\'лиcт\'бк\'инбoкс\' - 10 000 рублей/ Яндекс 15 000р. + Корпоративные. \r\n \r\nПaрoль НЕ меняется, а остаётся тем же, что использует владелец почты. \r\n \r\nТак же пробив гибдд, фнс, банки. + детализация звонков \"билайн\" \"мтс\" \"ТЕЛЕ2\" \"Мегафон\" \r\n \r\nДля связи писать на почту:    uslugiopen5 @ gmail. com ( пробелы убрать )', 'dfe255ac1d891800275c0df237418b12', 'authorize', 0, 0, '2022-09-04 01:49:30', '2022-09-06 01:55:32'),
(1159, NULL, 'K_nmsaO', 'karkasnye_vfsa', 'RU', 'PE', 'RU', '85333346322', 'epcdtsxnqsa@progontop.online', '', 'https://karkasnye-doma-spb-1.ru/', '', 'Moscow', 'Moscow', '123211', 'строительство каркасных домов спб <a href=\"https://www.karkasnye-doma-spb-1.ru/\">https://www.karkasnye-doma-spb-1.ru/</a>.', '87cd750090321d7f90697212a95cb46d', 'authorize', 0, 0, '2022-09-04 23:09:11', '2022-09-06 23:11:18'),
(1181, NULL, 'Яндекс Директ', 'Яндекс Директ', 'EE', 'KM', 'EE', '384347834', 'masterdirekt77@gmail.com', 'Яндекс Директ', 'https://yandex.ru/', '', 'Moscow', 'Moscow', '154522', 'Здравствуйте! \r\nПредлагаю услугу по созданию и ведению рекламной кампании в Яндекс Директ. \r\nОпыт работы в интернет маркетинге – более 8 лет. \r\nГлубокое погружение в бизнес клиента. \r\nГрамотная проработка всех аспектов кампании. \r\n \r\nВ услугу входит: \r\n- создание аккаунта; \r\n- сбор семантики; \r\n- проработка минус-слов; \r\n- написание объявлений; \r\n- выставление ставок; \r\n- заполнение расширений; \r\n- настройка UTM меток; \r\n- настройка минус площадок; \r\n- настройка метрики. \r\n \r\nДля оценки бюджета от Вас потребуется: \r\n- указать цели кампании и примерный бюджет на рекламу; \r\n- адрес сайта, товары/услуги которые планируете рекламировать; \r\n- регион для рекламы; \r\n- уникальные торговые предложения; \r\n- пожелания по ключевым словам и текстам объявлений. \r\n \r\nТак же оказываю услуги по созданию и доработке сайтов. \r\nОбращайтесь! \r\nБуду рад сотрудничеству! \r\nДорожу каждым клиентом!', '6364b51e27c095421114781a5053b231', 'authorize', 0, 0, '2022-09-05 04:38:08', '2022-09-07 04:46:00'),
(1594, NULL, 'PRSTKfBLpvuE', 'vYuboDCXiqawBTfm', 'US', 'JP', 'US', '8506944960', 'breiane75i0b1@outlook.com', 'gukTLwjo', 'MSyWIxUbLBVZRev', 'karcMgUXHZiNbV', 'XdlnuZcApzI', 'URYXrKeCafGzQj', 'PDzNAoBb', 'SdvGFPzqMAtx', 'c0449992f618101649e231389fe9e4d6', 'authorize', 0, 0, '2022-09-07 00:06:31', '2022-09-09 00:09:42'),
(1880, NULL, 'Яна', 'Валеева', 'CH', 'RU', 'RU', '9096619593', 'nabalcone6@gmail.com', '', '3я институтская, дом 17', 'Подъезд 68, квартира 68, этаж 17', 'Москва', 'Москва', '109428', '', '60760a9a737221fa4e3f40de5ad2f18b', 'authorize', 0, 0, '2022-09-08 21:48:36', '2022-09-24 17:23:21'),
(2150, NULL, 'eISQfuOKgvmbXh', 'WeowlBRJ', 'VN', 'JP', 'VN', '9269141638', 'qsamonaqc07e72a@outlook.com', 'JtVuSpCUHaLWM', 'ElNowHaj', 'qTGjUSwnidWI', 'JVGieUFvjOhEbMtT', 'srEuafyJUiRzX', 'EldeuMvrTGkHL', 'nPjqsCzMQrKeJA', '25d8069cf9b5699835d9cd0cc65615c5', 'authorize', 0, 0, '2022-09-10 15:06:21', '2022-09-12 15:08:28'),
(2340, NULL, 'PhilipweitaVX', 'Philipweita', 'FR', 'CR', 'FR', '88795363319', 'mordvinovmilano+advm@mail.ru', 'Philipweita', '', '', 'Kaohsiung Municipality', 'Kaohsiung Municipality', '112514', 'leosmagin.com ofeiifeodwpdeofijesdwsfeiiejokdwpdoefigjfidoksfihigjskodwsfiheghifegergsdfsregsfggrgr', '3781efcc9d938e7e68d55c45a2001f2c', 'authorize', 0, 0, '2022-09-12 03:06:28', '2022-09-14 03:08:38'),
(2450, NULL, 'Na_nnsr', 'lechenie_wbsr', 'DE', 'MR', 'DE', '88571383258', 'uqzgxupmzMt@doktormunchen.de', 'lechenie_qssr', 'http://www.uin.in.ua/forum/viewtopic.php?f=7&t=23284&p=48516&sid=44f12aa003f8ad053421d68768937ab1#p48516', '', 'Warszawa', 'Warszawa', '135433', 'Лечение рака легких в Германии без посредников для пациентов из Польши, Литвы, Украины, Казахстана и других стран! \r\n<a href=\"http://www.uin.in.ua/forum/viewtopic.php?f=7&t=23284&p=48516&sid=44f12aa003f8ad053421d68768937ab1#p48516\">метастазы легких лечение в германии</a> \r\nЛучшие клиники, полное медецинское сопровождение. Дистанционная консультация с немецким врачом. \r\nСмотрите отзывы на форуме https://service-core.com.ua/forum/post4893.html#p4893', 'a6128e76e96f99c0540952de19114ebc', 'authorize', 0, 0, '2022-09-12 17:22:35', '2022-09-14 17:30:13'),
(2707, NULL, 'bdkFjXLrlmDqYutG', 'LoHPJEmiqd', 'FR', 'JP', 'FR', '3160054650', 'michaelanthonyeo19bpi63825@outlook.com', 'SxGUKjyNzrACYkd', 'fqIaLuywjBNtCU', 'LSuJAXlfHFKebwg', 'dgqpYemKCW', 'ujKeaFfhS', 'HTZArRjVhgKntoPa', 'SBZVJlMkQL', 'b72877466b8dc934b150c4569a4ebc4e', 'authorize', 0, 0, '2022-09-14 12:27:10', '2022-09-16 12:30:07'),
(2783, NULL, 'P_nfotO', 'perevozki_vcot', 'RU', 'CD', 'RU', '88196823791', 'qpwifaamzot@xrum.store', '', 'https://narodrecept.ru/', '', 'Moscow', 'Moscow', '135555', 'доставить груз в Италию <a href=\"https://narodrecept.ru/\">https://narodrecept.ru/</a>.', 'ad0b6715c51e0eae6768617d38a03439', 'authorize', 0, 0, '2022-09-15 02:40:38', '2022-09-17 02:53:21'),
(2900, NULL, 'DonaldTeNLD', 'DonaldTeN', 'FR', 'BE', 'FR', '82594223339', 'satelkagashkin+22e@mail.ru', 'DonaldTeN', '', '', 'Nuwara Eliya', 'Nuwara Eliya', '153551', 'leosmagin.com Mfuehdwkjdwjfjwfwjhfdwkdwkhfjweh hidwhdjwskfawdhfwhkjdwdhqhfbejkdw fejkdlwjakdwefjkewndwfhwefjwehfew kjwjalkdheahfbejkfnjkewbfhegbfewjgjfkewsbjk', '84796cc7f94130949d6df48cf8c507c5', 'authorize', 0, 0, '2022-09-16 08:36:46', '2022-09-18 08:40:57'),
(2942, NULL, 'P_waotO', 'perevozki_ayot', 'RU', 'SN', 'RU', '84386723313', 'ttjwvcmuzot@xrum.store', '', 'https://narodrecept.ru/', '', 'Moscow', 'Moscow', '151111', 'грузоперевозки в Италию <a href=\"https://narodrecept.ru/\">https://narodrecept.ru/</a>.', 'ad0b6715c51e0eae6768617d38a03439', 'authorize', 0, 0, '2022-09-16 19:04:27', '2022-09-18 19:55:35'),
(3049, NULL, 'D_vjKtO', 'dostavka_ivKt', 'RU', 'DO', 'RU', '83498996956', 'knhzjlhktKt@xrum.store', '', 'https://avolvo.ru/', '', 'Moscow', 'Moscow', '134553', 'международные автоперевозки в Латвию <a href=\"https://avolvo.ru#международные-автоперевозки-в-Латвию\">https://avolvo.ru</a>.', 'bb9d62180cd997ae57a31495fd4195a5', 'authorize', 0, 0, '2022-09-17 19:08:29', '2022-09-19 19:11:13'),
(3100, NULL, 'FrankPaypeYC', 'FrankPaype', 'FR', 'SA', 'FR', '82632544242', 'mymail@mymails.cmo', 'FrankPaype', '', '', 'Hohenems', 'Hohenems', '143511', 'BILD.de: Aktuelle Nachrichten. \r\nWIR KONNEN ES NICHT GLAUBEN: Mike Tyson ist wieder fabelhaft reich! https://87bil.co/bild.de/?Nachrichten-ID-958822', '392a89595329736b66ffc554ce81953e', 'authorize', 0, 0, '2022-09-18 12:11:44', '2022-09-20 12:30:10'),
(3244, NULL, 'MichaelKizXA', 'MichaelKiz', 'RU', 'RO', 'RU', '82848411241', 'info@santehnik-na-dom-spb.ru', '', '[url=https://santehnik-na-dom-spb.ru/]https://santehnik-na-dom-spb.ru/[/url]', '', 'Bamako', 'Bamako', '124422', '[url=https://santehnik-na-dom-spb.ru/]сантехник вызов на дом круглосуточно[/url] \r\n[url=https://santehnik-na-dom-spb.ru/]http://santehnik-na-dom-spb.ru/[/url] \r\n[url=http://www.google.tt/url?q=http://santehnik-na-dom-spb.ru]http://www.google.ro/url?q=http://santehnik-na-dom-spb.ru[/url]', '98f58911138c63195761bde4a74e1412', 'authorize', 0, 0, '2022-09-19 19:13:18', '2022-09-21 19:27:48'),
(3323, NULL, 'F_eloiO', 'filosofiya_igoi', 'RU', 'HU', 'RU', '86841763764', 'nqjfekezzoi@xrum.store', '', 'https://koah.ru/', '', 'Moscow', 'Moscow', '123432', 'философствовали <a href=\"https://koah.ru/#философствовали\">koah.ru</a>.', '8535214e1afcc3b350f3a9f85feb0bb3', 'authorize', 0, 0, '2022-09-20 10:01:41', '2022-09-22 10:12:18'),
(3387, NULL, 'Oscargew', 'Oscargew', 'EE', 'YT', 'EE', '+7 (495) 109-3618', 'info@vodostok-moscow.ru', 'Oscargew', 'https://vodostok-moscow.ru/', '', 'Moscow', 'Moscow', '153241', 'Добрый день. \r\nМы подсчитали все и подготовили смету. \r\nДо вас не смогли дозвониться, ждем звонка и направлянм счет. \r\n \r\nС уважением, \r\n\"Мосводостоки\"', '607f1f7be2a430ef534f50b62553f32a', 'authorize', 0, 0, '2022-09-20 23:55:06', '2022-09-23 00:01:00'),
(3462, NULL, 'CarlosSorge', 'CarlosSorge', 'EE', 'BY', 'EE', '+71231234567', 'cioliachale197436@rambler.ru', 'CarlosSorge', 'https://nerzhaveyka-spb.ru/?utm_source=email&utm_campaign=09_2022', '', 'Moscow', 'Moscow', '155444', 'Металлобаза №2 приглашает Вас к сотрудничеству. \r\nНовые газовые баллоны по ГОСТ 949-73 производство АО «ПНТЗ». \r\nКапиллярные трубы из нержавеющей стали \r\nТрубы большого диаметра по ТУ1381-199-00220302-2018 под заказ \r\nДиаметром от 350 до 2820  мм с толщиной стенки от 3 до 30 мм из нержавеющей стали аустенитного класса методом вальцовки из листов и сварки продольных и кольцевых швов. \r\nБесшовные трубы \r\nПроизводство: Россия , Китай \r\nСтандарты:ГОСТ 9941-81,ГОСТ  9940-81 \r\nМарка стали: 03Х17Н13М2, 06ХН28МДТ, 08Х17Н13М2Т, 08Х18Н10Т,  08Х22Н6Т,10Х17Н13М2Т, 12Х18Н10Т (AISI 321, 316TI, 310S, 904L) \r\n \r\nСпец предложение по бесшовной трубе 325х8 12Х18Н10Т (AISI 321) \r\n \r\nЛисты \r\nПроизводство: Россия, Индия, Китай и др \r\nМарки стали: \r\nГОСТ:12X17, 08X17T, 08-12X18H1, 03X18H10, 08X18H10Т, 03X17H14М2, 08X17H13М2Т, 20X23H18 \r\nASTM: AISI430, 439, 304, 304L, 321, 316L, 316TI, 310, 904L \r\n \r\nНаш сайт Нерж.РФ или  https://nerzhaveyka-spb.ru/?utm_source=email&utm_campaign=09_2022 \r\nemail для связи: email@nerzhaveyka-spb.ru \r\n \r\nтел: +7 (812) 748-55-22', '4d58bb2843dde468b91c4226725b4418', 'authorize', 0, 0, '2022-09-21 12:39:49', '2022-09-23 12:40:49'),
(3832, NULL, 'D_wnMrO', 'detskiy_qzMr', 'RU', 'RS', 'RU', '89299387134', 'bfstvjpgkMr@xrum.store', '', 'https://organizaciya-detskikh-prazdnikov.ru/', '', 'Moscow', 'Moscow', '121141', 'агентство по организации детских праздников <a href=\"https://organizaciya-detskikh-prazdnikov.ru/#агентство-по-организации-детских-праздников\">organizaciya-detskikh-prazdnikov.ru</a>.', '29665319710f70c526166348c10ad2e5', 'authorize', 0, 0, '2022-09-22 23:32:29', '2022-09-24 23:46:11'),
(4013, NULL, 'ThurmmTB', 'Thurmm', 'GB', 'ZM', 'GB', '88744322767', 'thurman@webstor-globalyou.store', 'Thurmm', 'https://firmlist.ru/ru_blagoveschensk/9060127-mirpack-polietilenovaya-produkciya-v-blagoveschensk.html\r\n', '', 'Kulim', 'Kulim', '113341', 'пакеты для мусора 240л\r\nмешки для мусора сайт\r\nмусорные мешки купить\r\n \r\n[url=https://belgorod.spravka.city/company/mirpack-polietilenovaya-produkciya-v-belgorod', '513c80ea0a2d99f9b2af3cf45745e0b9', 'authorize', 0, 0, '2022-09-24 11:51:35', '2022-09-26 11:55:44'),
(4064, NULL, 'CharlesdubUF', 'Charlesdub', 'FR', 'ML', 'FR', '81723451628', 'cvillas@gmail.com', 'Charlesdub', '', '', 'Mosta', 'Mosta', '114123', 'Get NFT for $50,000 right now, details in your account http://morales-get-nft.poojahavanam.com/id-4534', '8990deca4e5ee49aa6bd224e27f11802', 'authorize', 0, 0, '2022-09-25 01:46:35', '2022-09-27 02:09:21'),
(4219, NULL, 'CharlesnarRN', 'Charlesnar', 'US', 'UM', 'US', '82857332869', 'kirsten.neubert@thimm.de', 'Charlesnar', '', '', 'Khujand', 'Khujand', '133235', 'Schnelle Einnahmen von 9000000 $ in 3 Monaten >>>>>>>>>>>>>>>>>>>>>>>>>>> https://telegra.ph/Insiderinformationen-zu-Investitionen-in-KryptowГ¤hrung-und-Einkommen-150000-09-26-26098 <<<<<<<<<<<<<<<<<<<<<<<<', '3c13d16208566148661fb4eb7cbc6376', 'authorize', 0, 0, '2022-09-26 15:21:54', '2022-09-28 15:23:33'),
(4283, NULL, 'TravisTruptON', 'TravisTrupt', 'US', 'LR', 'US', '86316386851', 'mathilda.cauliez@gmail.com', 'TravisTrupt', '', '', 'Hohenems', 'Hohenems', '122344', '90% discount for you and your site leosmagin.com >>> http://xiaomi-shop-near-me.lcloud-report.com/product-8938 <<<', 'd0819e4abb8f5fd132c03718d582035e', 'authorize', 0, 0, '2022-09-27 06:32:09', '2022-09-29 06:44:37'),
(4398, NULL, 'RusselljagHN', 'Russelljag', 'US', 'MK', 'US', '81593671347', 'bertieno1@yahoo.com.au', 'Russelljag', '', '', 'Toledo', 'Toledo', '111422', 'NFT Collection Drop Revenue & Profit Calculator >>> https://telegra.ph/Earnings-on-NFT-on-autopilot-from-1000-per-day-09-27-359?news-id-274537 <<<', 'a158665f075379e4512d1fb9d2518f78', 'authorize', 0, 0, '2022-09-27 21:29:25', '2022-09-29 21:32:14'),
(4500, NULL, 'engHcVli', 'jJQgXpzfuNxih', 'CN', 'JP', 'CN', '3721445502', 'dakisha2y17x3@outlook.com', 'sFYOLKpea', 'FRHnLOztMYlEby', 'HaQxiSKNPvRXzcem', 'gLPuORnrhF', 'CBXhGroF', 'QidHzvmCyBIeNxLb', 'RQHuUPOnwS', 'a02e48ae331ce7c32823f1dbbf5dafc1', 'authorize', 0, 0, '2022-09-28 12:32:15', '2022-09-30 12:33:06'),
(4572, NULL, 'P_bqKaO', 'perevozka_eeKa', 'RU', 'HK', 'RU', '84773579871', 'vugahlmlbKa@xrum.store', '', 'https://grandpeople.ru/', '', 'Moscow', 'Moscow', '123242', 'перевоз вещей из Германии в Россию <a href=\"https://www.grandpeople.ru/#перевоз-вещей-из-Германии-в-Россию\">https://www.grandpeople.ru/</a>.', '9ad1a75dc726d7d1fd4832d269b1a906', 'authorize', 0, 0, '2022-09-28 21:58:56', '2022-09-30 22:14:34'),
(4706, NULL, 'IrvingomishHA', 'Irvingomish', 'US', 'IQ', 'US', '89523126278', 'eforesti@freenet.de', 'Irvingomish', '', '', 'Klimmen', 'Klimmen', '123144', 'Investieren Sie und erhalten Sie mehr als 50.000 EUR pro Monat >>> https://telegra.ph/Ab-1000--pro-Tag-im-automatischen-Modus-09-29-3411?id-67464531 <<<', 'f98e466bc86e90b252d84c27a45c7621', 'authorize', 0, 0, '2022-09-29 21:14:33', '2022-10-01 21:46:48'),
(4761, NULL, 'B_tmOiO', 'boks_ohOi', 'EN', 'RU', 'EN', '88914899488', 'mfvpivmwdOi@xrum.store', 'boks_fyOi', 'http://boks-v-moskve.ru/', '', 'Moscow', 'Moscow', '134244', 'бокс москва <a href=\"http://www.boks-v-moskve.ru#бокс-москва\">http://www.boks-v-moskve.ru</a>.', 'd97c21b1a4a86170c21bb5f46d3bad59', 'authorize', 0, 0, '2022-09-30 11:20:24', '2022-10-02 11:55:47'),
(4823, NULL, 'AnthonydizPY', 'Anthonydiz', 'FR', 'MC', 'FR', '81474587147', 'danield@wegwerfmail.de', 'Anthonydiz', '', '', 'Gray Mountain', 'Gray Mountain', '125232', 'Ihr mogliches Einkommen betragt ca. mehr als 50.000 EUR pro Woche https://telegra.ph/Ab-1000--pro-Tag-im-automatischen-Modus-09-29-10939?id-83714301', 'e15df1d54614cf6eef23766fbf4be68c', 'authorize', 0, 0, '2022-10-01 01:13:06', '2022-10-03 01:24:09'),
(4863, NULL, 'IrvingomishHA', 'Irvingomish', 'US', 'BR', 'US', '89387396241', 'explained4@lycos.de', 'Irvingomish', '', '', 'Klimmen', 'Klimmen', '123344', 'Sie konnten der nachste Millionar sein. Beeil dich >>> http://fiverr-earn-money.microscopemanufacturerindia.com/id-4035 <<<', 'f98e466bc86e90b252d84c27a45c7621', 'authorize', 0, 0, '2022-10-01 13:40:38', '2022-10-03 13:48:42'),
(4961, NULL, 'IrvingomishHA', 'Irvingomish', 'US', 'DO', 'US', '89167721363', 'abumalak198814@hotmail.com', 'Irvingomish', '', '', 'Klimmen', 'Klimmen', '122511', 'NFT GIVEAWAYS - NFT DROPS CALENDAR >>> https://telegra.ph/Get-NFT-over-25000-for-free-10-02-13910 <<<', 'f98e466bc86e90b252d84c27a45c7621', 'authorize', 0, 0, '2022-10-02 17:39:31', '2022-10-04 17:46:54'),
(5024, NULL, 'CharlesSleexPT', 'CharlesSleex', 'US', 'SA', 'US', '88261711454', 'paul.4seybold@hotmail.com', 'CharlesSleex', '', '', 'Sishen', 'Sishen', '124552', 'Facebook Promotion Quality >>> http://how-to-update-promotion-on-facebook.vallagos.com/news-2326 <<<', 'c452265dfc595d48fa3da351755e88c1', 'authorize', 0, 0, '2022-10-03 11:31:56', '2022-10-05 11:35:15'),
(5190, NULL, 'T_ctmlO', 'torty_dlml', 'RU', 'LA', 'RU', '86989886496', 'tympuvlduml@xrum.store', '', 'https://tort-kupit.ru/', '', 'Moscow', 'Moscow', '114352', 'торты в москве <a href=\"https://tort-kupit.ru/#торты-в-москве\">https://tort-kupit.ru/</a>.', '3f801fc97d3bff8b07f8ef19ca67725d', 'authorize', 0, 0, '2022-10-05 00:53:13', '2022-10-07 01:10:41'),
(5265, NULL, 'CharlesSleexPT', 'CharlesSleex', 'US', 'BF', 'US', '89994584785', 'rebecca_kern@gmx.at', 'CharlesSleex', '', '', 'Sishen', 'Sishen', '142433', 'Einkommen 1000 Euro pro Tag auf Autopilot >>> https://telegra.ph/Wie-ein-Obdachloser-in-3-Wochen-genau-1000000-Euro-verdiente-10-05-11685 <<<', 'c452265dfc595d48fa3da351755e88c1', 'authorize', 0, 0, '2022-10-06 04:59:15', '2022-10-08 05:03:54'),
(5283, NULL, 'FrankDupCX', 'FrankDup', 'US', 'BJ', 'US', '85438573942', 'colleensmith935@gmail.com', 'FrankDup', '', '', 'Bottegone', 'Bottegone', '144424', 'The Wolf of Wall Street accidentally told how to make from $1000 a day on autopilot >>> https://telegra.ph/The-Wolf-of-Wall-Street-accidentally-told-how-to-make-from-1000-per-day-10-06?id-45734572067 <<<', 'e674fb35d03ad025c1f9e952554b36e7', 'authorize', 0, 0, '2022-10-06 09:56:06', '2022-10-08 10:32:04'),
(5329, NULL, 'T_fjonO', 'Tipografiy_aton', 'RU', 'CA', 'RU', '82212692938', 'vqcapdczuon@xrum.store', '', 'https://vk.com/global3412', '', 'Moscow', 'Moscow', '145543', 'Офсетная типография <a href=\"http://www.vk.com/global3412#Офсетная-типография\">http://www.vk.com/global3412</a>.', 'a1733fed079c8c9dfe617d013602682f', 'authorize', 0, 0, '2022-10-06 21:36:17', '2022-10-08 21:57:34'),
(5517, NULL, 'JefferyMomDG', 'JefferyMom', 'US', 'BG', 'US', '82731152596', 'pjh88@yahoo.com.au', 'JefferyMom', '', '', 'Bottegone', 'Bottegone', '122444', 'How to make $15,000,000 from your NFTs >>> https://telegra.ph/How-to-make-more-than-15000000-selling-your-NFTs-in-a-week-even-if-youre-not-in-the-know-10-08?news-81512357 <<<', 'dcd177c2def50fe6499c636143273de7', 'authorize', 0, 0, '2022-10-08 17:04:31', '2022-10-10 17:09:48'),
(5536, NULL, 'ThomasneeliJL', 'Thomasneeli', 'EN', 'CA', 'EN', '83984494557', 'info@santhechnik-srochno-spb.ru', 'Thomasneeli', '[url=https://santhechnik-srochno-spb.ru/]https://santhechnik-srochno-spb.ru/[/url]', '', 'Edson', 'Edson', '145433', '[url=https://santhechnik-srochno-spb.ru/]вызов бесплатного сантехника на дом[/url] \r\n[url=https://www.santhechnik-srochno-spb.ru/]https://www.santhechnik-srochno-spb.ru/[/url] \r\n[url=https://ewhois.org/www/santhechnik-srochno-spb.ru]http://google.mn/url?q=http://santhechnik-srochno-spb.ru[/url]', '150ae086d0667aa8227d0781d31fbbc9', 'authorize', 0, 0, '2022-10-08 22:40:44', '2022-10-10 23:27:23'),
(5728, NULL, 'JustinnexOP', 'Justinnex', 'RU', 'LU', 'RU', '85341519511', 'info@vyezd-santehnika-spb.ru', '', '[url=https://vyezd-santehnika-spb.ru/]https://vyezd-santehnika-spb.ru/[/url]', '', 'Chisinau', 'Chisinau', '132424', '[url=https://vyezd-santehnika-spb.ru/]требуется сантехник срочно[/url] \r\n[url=http://vyezd-santehnika-spb.ru]https://www.vyezd-santehnika-spb.ru[/url] \r\n[url=http://google.com.tr/url?q=http://vyezd-santehnika-spb.ru]http://www.ocmw-info-cpas.be/?URL=vyezd-santehnika-spb.ru[/url]', '87b97dbf773086f6e4aa868509ee9d19', 'authorize', 0, 0, '2022-10-09 17:42:19', '2022-10-11 18:13:08'),
(5885, NULL, 'JesuslicQS', 'Jesuslic', 'GB', 'VI', 'GB', '85546699425', 'nikkyellis@yahoo.com.au', 'Jesuslic', '', '', 'Debrecen', 'Debrecen', '131353', 'HOW TO MAKE $15,000,000 FROM YOUR NFTS https://telegra.ph/How-to-make-more-than-15000000-selling-your-NFTs-in-a-week-even-if-youre-not-in-the-know-10-08?news-40918528', '200f29efe3c45cba4abbefb856e58805', 'authorize', 0, 0, '2022-10-10 14:30:18', '2022-10-12 14:34:03'),
(5949, NULL, 'JefferyMomDG', 'JefferyMom', 'US', 'YT', 'US', '86111772375', 'c_haynessmith@optusnet.com.au', 'JefferyMom', '', '', 'Bottegone', 'Bottegone', '113214', 'Invest today and become the next millionaire... >>> https://telegra.ph/Verify-that-you-are-human-10-11?id-49416949 <<<', 'dcd177c2def50fe6499c636143273de7', 'authorize', 0, 0, '2022-10-11 04:53:06', '2022-10-13 05:12:27'),
(6138, NULL, 'IMpUbZaPNegBoD', 'tzbikwYRx', 'CN', 'JP', 'CN', '8212222016', 'vfnr8efimov@outlook.com', 'tzOsINhEVUFlGX', 'WYodQbXImrSUy', 'kFNtUgSWQYjM', 'lmovISRjBfA', 'CaHruIgXf', 'OrxIYdiAFVNEhD', 'MUzPJDqxbk', '1504016d9d1f6605cd111419164af64e', 'authorize', 0, 0, '2022-10-12 04:40:07', '2022-10-14 05:01:31'),
(6166, NULL, 'HibeimilaVR', 'Hibeimila', 'RU', 'BR', 'RU', '81976929973', 'Hibeimila@onemailtop.xyz', '', 'http://buylasixon.com', '', 'New York', 'New York', '131413', 'The most active compounds were 25a Fig <a href=https://buylasixon.com/>does lasix make you tired</a> viagra harga atarax alprazolam That, to me, raises questions about the economic motivations of the purchase', '8fd2fe3459dc3bf5792f2d70e052e407', 'authorize', 0, 0, '2022-10-12 08:11:37', '2022-10-14 08:14:04'),
(6167, NULL, 'M_qaOaO', 'medee_mtOa', 'RU', 'TR', 'RU', '82325862235', 'ebiexuwwoOa@post2k.online', '', 'https://medee.ru/', '', 'Moscow', 'Moscow', '131425', 'интересное на этом сайте <a href=\"http://www.medee.ru\">http://www.medee.ru</a>.', '01c9bb20b3d3bab704685e08c2628875', 'authorize', 0, 0, '2022-10-12 08:19:06', '2022-10-14 08:24:49'),
(6305, NULL, 'ТаракановаЛайф', 'ТаракановаЛайф', 'EE', 'GU', 'EE', '+71231234567', 'terqinorddels197852@rambler.ru', 'ТаракановаЛайф', 'https://tarakanovalife.ru/', '', 'Moscow', 'Moscow', '115542', 'Здравствуйте. Анимационная студия ТаракановаЛайф, предлагает Вам: \r\n \r\n- создание анимационного мультсериала для ТВ и соцсетей, под Ваш бизнес тему или отдельно; \r\n \r\n- создание мультипликационного персонажа, для соцсетей, для нанесения на фото, для привлечения дополнительного внимания зрителя/подписчика/клиента. Наши работы можно посмотреть в Inst. @TarakanovaLife \r\n \r\nТема: Приглашаем к сотрудничеству \r\n \r\nПочта: info@tarakanovalife.ru \r\n \r\nТелефон: +79166351053 \r\n \r\nКонтактное лицо: Бурлаков Александр', '92074f885f774f3cc04155bd37058478', 'authorize', 0, 0, '2022-10-13 14:01:00', '2022-10-15 14:02:50'),
(6349, NULL, 'actitlyJG', 'actitly', 'RU', 'SO', 'RU', '82827276758', 'actitly@bernardmail.xyz', '', 'https://buylasixon.com', '', 'New York', 'New York', '154523', '<a href=https://buylasixon.com/>taking lasix but still swelling</a> However, issues have emerged since these initial studies relating to design and validation of gene classifiers 3, particularly the small numbers of patient samples used to derive the classifier and the little overlap in these gene signatures', '02c10439e15061759c29e317c193f166', 'authorize', 0, 0, '2022-10-14 03:53:30', '2022-10-16 04:06:54'),
(6380, NULL, 'JefferyMomDG', 'JefferyMom', 'US', 'MU', 'US', '89235592961', 'carsmiles1985@gmail.com', 'JefferyMom', '', '', 'Bottegone', 'Bottegone', '141123', 'With just a few clicks, you can earn €15,000 every day for the rest of your life... >>> https://telegra.ph/Verify-that-you-are-human-10-11?id-85396031 <<<', 'dcd177c2def50fe6499c636143273de7', 'authorize', 0, 0, '2022-10-14 10:39:39', '2022-10-16 10:49:19'),
(6438, NULL, 'C_pdstO', 'chip_cmst', 'RU', 'WS', 'RU', '86283534772', 'rxmndadlest@post2k.online', '', 'https://chip-tyuning-spb-1.ru', '', 'Moscow', 'Moscow', '152315', 'чип тюнинг двигателя спб <a href=\"http://www.chip-tyuning-spb-1.ru\">http://www.chip-tyuning-spb-1.ru</a>.', 'ebe0fe11c3f09df84ac2dd37cdedc0c2', 'authorize', 0, 0, '2022-10-15 01:29:09', '2022-10-17 01:33:28'),
(6508, NULL, 'KevinsalOK', 'Kevinsal', 'RU', 'MN', 'RU', '88231616543', 'info@vyvod-zapoi-spb.ru', '', '[url=https://vyvod-zapoi-spb.ru/]https://vyvod-zapoi-spb.ru/[/url]', '', 'Orange Walk', 'Orange Walk', '134551', '[url=https://vyvod-zapoi-spb.ru/]вывод из запоя недорого[/url] \r\n[url=https://www.vyvod-zapoi-spb.ru]http://vyvod-zapoi-spb.ru[/url] \r\n[url=https://google.td/url?q=http://vyvod-zapoi-spb.ru]https://www.kbrfx.com/?URL=vyvod-zapoi-spb.ru[/url]', 'b7be1fb05eafc635f02363c9a3619aa6', 'authorize', 0, 0, '2022-10-15 19:02:11', '2022-10-17 19:14:46'),
(6526, NULL, 'mALhwvSkMOVRjE', 'qHRpzBunILbNa', 'SE', 'JP', 'SE', '5903182126', 'georgiyocacvor@outlook.com', 'QxbZIuiyhtcwEH', 'OMgBwnhILy', 'lfmraiHtOCXzGR', 'iVxPjfvzLCbu', 'XiRbGfcBPkdrOZnz', 'RzLqrVEXn', 'ixRtwSKAlMYDa', '86093f1d948f9ea6b78df1313f89e658', 'authorize', 0, 0, '2022-10-15 22:19:09', '2022-10-17 22:19:46'),
(6562, NULL, 'R_sfmiO', 'remont_oimi', 'RU', 'MA', 'RU', '81276628362', 'asvamikqvmi@post2k.online', '', 'https://remont-telefonov-spb-1.ru', '', 'Moscow', 'Moscow', '154123', 'ремонт телефонов в спб <a href=\"http://www.remont-telefonov-spb-1.ru/\">http://www.remont-telefonov-spb-1.ru/</a>.', 'c4f878b45e79cc9236438eb1a5c9677f', 'authorize', 0, 0, '2022-10-16 09:33:34', '2022-10-18 09:43:20'),
(6607, NULL, 'JimmyCapZS', 'JimmyCap', 'EN', 'PR', 'EN', '85662497229', 'info@vyvedenie-iz-zapoya-spb.ru', 'JimmyCap', '[url=http://vyvedenie-iz-zapoya-spb.ru]http://vyvedenie-iz-zapoya-spb.ru[/url]', '', 'Rio Grande', 'Rio Grande', '113333', '[url=http://vyvedenie-iz-zapoya-spb.ru]алкоголь запой[/url] \r\n[url=http://www.vyvedenie-iz-zapoya-spb.ru]http://www.vyvedenie-iz-zapoya-spb.ru[/url] \r\n[url=https://google.co.uk/url?q=http://vyvedenie-iz-zapoya-spb.ru]http://ww.deborahamos.net/?URL=vyvedenie-iz-zapoya-spb.ru[/url]', '3eb38d5734b3e89d8fdf2270ef06a2fb', 'authorize', 0, 0, '2022-10-16 20:14:59', '2022-10-18 21:10:09'),
(6668, NULL, 'JefferyMomDG', 'JefferyMom', 'EN', 'IT', 'EN', '82572527293', 'nicnat106@aol.com', 'JefferyMom', '', '', 'Bottegone', 'Bottegone', '134135', 'Invest today and become the next millionaire... >>> https://telegra.ph/Income-during-the-crisis-for-everyone-from-1000-per-day-10-17-6668?id-81608739 <<<', 'dcd177c2def50fe6499c636143273de7', 'authorize', 0, 0, '2022-10-17 11:13:29', '2022-10-19 11:17:38'),
(6730, NULL, 'ParSec', 'ParSec', 'EE', 'AT', 'EE', '+71231234567', 'diasopettoutp197228@rambler.ru', 'ParSec', 'http://parsec.expert/', '', 'Moscow', 'Moscow', '152433', 'Предлагаем следующие услуги: \r\nСбор контактов Вашей целевой Аудитории. \r\nРассылка сообщений в Telegram(текстом | с ссылками | с картинкой | с видеофайлом | с аудиофайлом) \r\nНаполняем Telegram-группы живыми людьми. \r\nУНИЧТОЖЕНИЕ Telegram контактов конкурентов. \r\nДобавление и рассылка в INSTAGRAM, Facebook. \r\nРазмещение объявлений на доски. \r\nРазмещение текста и ссылок во всех возможных каталогах. \r\nПолный отчёт. \r\nБЕСПЛАТНЫЙ ТЕСТ УСЛУГ! \r\nСвяжитесь с нами здесь: \r\nСайт: http://parsec.expert \r\nViber, WhatsApp: +35796466236 \r\nTelegram: https://t.me/parsecManager \r\nКанал: https://t.me/parsecTel', '3166658a76441437c4dec462e6989862', 'authorize', 0, 0, '2022-10-18 04:39:01', '2022-10-20 04:39:25'),
(6732, NULL, 'A_luOrO', 'avtomagnit_hpOr', 'RU', 'MN', 'RU', '84627126529', 'gcclbbvcgOr@post2k.online', '', 'https://kupit-shtatnuyu-magnitolu.ru', '', 'Moscow', 'Moscow', '111525', 'купить штатную автомагнитолу <a href=\"https://kupit-shtatnuyu-magnitolu.ru/\">https://kupit-shtatnuyu-magnitolu.ru/</a>.', '5dce9ed51befe2beff93ac297230b543', 'authorize', 0, 0, '2022-10-18 04:47:33', '2022-10-20 04:48:23'),
(6868, NULL, 'AttaicyXq', 'Attaicy', 'RU', 'PL', 'RU', '83948436983', 'Attaicy@maill1.xyz', '', 'http://buylasixon.com', '', 'New York', 'New York', '142445', 'Noninvasive prenatal testing that shows discordance with fetal karyotype can be a clue to an underlying maternal malignancy <a href=https://buylasixon.com/>taking lasix but not peeing much</a> Sixty percent of patients have a mutation in the CHD7 gene 34 which codes for a DNA binding protein involved in early embryonic development', '11f946593fa9ecccb45111f9d53e75b4', 'authorize', 0, 0, '2022-10-19 09:31:05', '2022-10-21 10:00:51'),
(6877, NULL, 'DavidmedlyIH', 'Davidmedly', 'GB', 'RS', 'GB', '82694156726', 'lioness072687@yahoo.ca', 'Davidmedly', '', '', 'Toledo', 'Toledo', '112331', 'GET RICH QUICKLY AND EFFECTIVELY... https://telegra.ph/Income-during-the-crisis-for-everyone-from-1000-per-day-10-17-7950?id-63646010', '3c9ecf407864b4811cf4e6c12aeb062e', 'authorize', 0, 0, '2022-10-19 11:45:47', '2022-10-21 12:05:56'),
(7210, NULL, 'spongafOr', 'spongaf', 'RU', 'MR', 'RU', '87347523739', 'spongaf@barrymail.xyz', '', 'https://bestcialis20mg.com', '', 'New York', 'New York', '124451', 'In the preparations stained for MT 1 MMP by the immunofluorescence method, the LAM cells showed a positive cytoplasmic reaction that was similar to that observed with the immunoperoxidase method <a href=http://bestcialis20mg.com/>buy liquid cialis online</a>', 'fd1d2dbae2dfcfc51e01f2c20148caeb', 'authorize', 0, 0, '2022-10-21 19:25:51', '2022-10-23 19:27:28'),
(7215, NULL, 'DavidmedlyIH', 'Davidmedly', 'AU', 'HR', 'AU', '86183831375', 'amanda.hand@daniladilba.org.au', 'Davidmedly', '', '', 'Toledo', 'Toledo', '133321', 'THE CURRENT CRISIS IS AN OPPORTUNITY TO SEIZE ON YOUR WILDEST DREAMS... https://telegra.ph/How-does-a-simple-student-make-from-15000-per-day-10-20?id-69388715', '3c9ecf407864b4811cf4e6c12aeb062e', 'authorize', 0, 0, '2022-10-21 20:18:50', '2022-10-23 20:26:11'),
(7329, NULL, 'ClmPxipMVvatwZ', 'tRhvGPnKAj', 'IN', 'JP', 'IN', '2636872369', 'artemnk5nale@outlook.com', 'IvyGzfbedhUJ', 'eCTVqsAn', 'tzWBuCfSeoPpYHry', 'NsEBOFmyMoCcvlP', 'YwmolXpDftI', 'mGynqpQiFULl', 'nzmfObAK', '7680f3f7c127654ada8d4c9550295a9e', 'authorize', 0, 0, '2022-10-22 14:14:46', '2022-10-24 14:32:17'),
(7521, NULL, 'AnthonysnimaHC', 'Anthonysnima', 'GB', 'TZ', 'GB', '87281466379', 'no.reply.feedbackform@gmail.com', 'Anthonysnima', 'https://www.no-site.com', '', 'Kwekwe', 'Kwekwe', '141354', 'Hеllо!  leosmagin.com \r\n \r\nDid yоu knоw thаt it is pоssiblе tо sеnd аppеаl еntirеly lеgаl? \r\nWе prоviding а nеw lеgitimаtе mеthоd оf sеnding businеss оffеr thrоugh fееdbасk fоrms. Suсh fоrms аrе lосаtеd оn mаny sitеs. \r\nWhеn suсh businеss prоpоsаls аrе sеnt, nо pеrsоnаl dаtа is usеd, аnd mеssаgеs аrе sеnt tо fоrms spесifiсаlly dеsignеd tо rесеivе mеssаgеs аnd аppеаls. \r\nаlsо, mеssаgеs sеnt thrоugh соntасt Fоrms dо nоt gеt intо spаm bесаusе suсh mеssаgеs аrе соnsidеrеd impоrtаnt. \r\nWе оffеr yоu tо tеst оur sеrviсе fоr frее. Wе will sеnd up tо 50,000 mеssаgеs fоr yоu. \r\nThе соst оf sеnding оnе milliоn mеssаgеs is 49 USD. \r\n \r\nThis оffеr is сrеаtеd аutоmаtiсаlly. Plеаsе usе thе соntасt dеtаils bеlоw tо соntасt us. \r\n \r\nContact us. \r\nTelegram - @FeedbackMessages \r\nSkype  live:contactform_18 \r\nWhatsApp - +375259112693 \r\nWe only use chat.', 'dcb88237369b88b4a214b006c00e5f99', 'authorize', 0, 0, '2022-10-24 12:22:11', '2022-10-26 12:34:23'),
(8029, NULL, 'Разбрасыватель удобрений', 'Разбрасыватель удобрений', 'EE', 'BV', 'EE', '+71231234567', 'mudfeipoper198468@rambler.ru', 'Разбрасыватель удобрений', 'https://36vsc.ru/', '', 'Moscow', 'Moscow', '153455', 'Разбрасыватель удобрений за 75000 руб. от производителя \r\n \r\nРУМ 600л - 74 000руб. с НДС \r\n \r\nРУМ 800л - 75 000руб. с НДС \r\n \r\nРУМ 1010л - 76 000руб. с НДС \r\n \r\nРУМ 1210л - 84 000руб. с НДС \r\n \r\nСтоимость полного комплекта: кардан, тент, РВД+муфты+штуцера, пальцы для навески. \r\n \r\nДоставка по всем регионам РФ. Свое Производство, Гарантия 12 мес., Срок службы 7-10 лет. \r\n \r\nДилерам и торгующим организациям индивидуальные взаимовыгодные условия \r\n \r\nсайт: 36vsc.ru \r\n \r\nтел. +7 905 658 3944', '1392cb6eb110c0ce12a31621f8d8f754', 'authorize', 0, 0, '2022-10-25 21:19:18', '2022-10-27 21:19:28'),
(8056, NULL, 'DavidmedlyIH', 'Davidmedly', 'EN', 'ES', 'EN', '88791119958', 'Legrand.juliette@yahoo.fr', 'Davidmedly', '', '', 'Toledo', 'Toledo', '115221', 'L\'etudiant a gagne 7 860 000 euros https://telegra.ph/LГ©tudiant-a-gagnГ©-7-860-000-euros-sur-la-crypto-monnaie-10-24-11658?id-45192523', '3c9ecf407864b4811cf4e6c12aeb062e', 'authorize', 0, 0, '2022-10-26 01:40:23', '2022-10-28 01:51:14'),
(8245, NULL, 'DavidmedlyIH', 'Davidmedly', 'AU', 'MR', 'AU', '87698933723', 'dmcklveen@aol.com', 'Davidmedly', '', '', 'Toledo', 'Toledo', '154224', 'SYDNEY STUDENT EARNS $7,934,866 IN 3 MONTHS https://telegra.ph/Sydney-student-earns-7934866-with-crypto-in-3-months-10-26-9861?id-news-65696054', '3c9ecf407864b4811cf4e6c12aeb062e', 'authorize', 0, 0, '2022-10-27 07:55:13', '2022-10-29 07:58:01'),
(8434, NULL, 'uBtGQbhO', 'NcrzJFUhEBK', 'DE', 'JP', 'DE', '7572805293', 'joannemarshabpl@hotmail.com', 'voySEVKFpbjMA', 'ahHEeqRYtG', 'siKtJefIa', 'MiewjFOnA', 'bHiYCjkFR', 'LncNoxvzSYiTg', 'uOjKDIiFYMmCBV', 'ad29181e49aeb7820cef7253e3a304a3', 'authorize', 0, 0, '2022-10-29 01:45:17', '2022-10-31 02:17:12'),
(8451, 'b08231a5017adb741a2b276e2f61e711', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 06:04:42', '2022-10-29 06:04:42'),
(8452, 'ec6ec65799abd6b3c27565738cc2985a', NULL, NULL, 'EN', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 06:04:45', '2022-10-29 06:06:11'),
(8453, 'aafe5807970bb86f0e14a9ab7c924a10', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 06:16:45', '2022-10-29 06:16:45'),
(8454, '8ff22316cf61ea10ed5c4cc0ed7784c3', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 06:22:11', '2022-10-29 06:22:11'),
(8455, 'ac638969c4cbe65ba702100bb31b858d', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 06:30:03', '2022-10-29 06:30:03'),
(8456, '7c4c1cef6c5823ef3421ae13afe78bd4', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 06:37:22', '2022-10-29 06:37:22'),
(8457, 'e494c5179e0697865c65d35009f38c35', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 06:48:46', '2022-10-29 08:49:46'),
(8458, 'c3635da14e7a7aedbdb98af5823f57dd', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 06:58:16', '2022-10-29 06:58:16'),
(8459, '424fac89ab725f77738de250b23a622b', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 07:16:58', '2022-10-29 07:16:58'),
(8460, '2478373e3f60a3041671f0101734e4f1', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 07:20:00', '2022-10-29 07:20:00'),
(8461, 'a186b7a5c36d4f6693c290c25cc46673', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 07:24:07', '2022-10-29 07:24:18'),
(8462, '74b8fe795b562efba1419ea41af20ca8', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 07:32:12', '2022-10-29 07:32:25'),
(8463, 'fe266d64381edf2aab3fc36f0f032af1', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 07:35:30', '2022-10-29 07:35:30'),
(8464, '6511423666e28c24e8c0f6f8efdb27fc', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 07:58:01', '2022-10-29 07:58:01'),
(8465, '07608e2032b0d8adc3d31f07e13647bd', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 07:58:23', '2022-10-29 08:00:04'),
(8466, 'c02df52f585b0edb11066de6c9be1eb6', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 08:02:25', '2022-10-29 08:02:25'),
(8467, 'bab99832a500973b220a06957df6422d', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 08:14:27', '2022-10-29 08:14:27'),
(8468, '15f110476fe2a7b618400b79d475d658', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 08:15:06', '2022-10-29 08:15:06'),
(8469, 'a139e0299282a6ea912bb5bb899ea753', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 08:32:58', '2022-10-29 08:32:58'),
(8470, '8e8a2c0facec37873b0e583df799494f', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 08:41:56', '2022-10-29 08:45:52'),
(8471, 'e618e0112489a4dba401c6f1304e9c51', NULL, NULL, 'DK', NULL, 'DK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 08:50:30', '2022-10-29 08:52:00'),
(8472, '9379055579b167af22c5dc6f77793fca', NULL, NULL, 'DE', NULL, 'DE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 08:51:46', '2022-10-29 08:51:46'),
(8473, 'c9efdf0cf3a9e3e6b550678c90611054', NULL, NULL, 'US', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 08:57:56', '2022-10-29 08:57:56'),
(8474, 'f645aaf8d3e35b399d7e0c72415d08e3', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 09:13:34', '2022-10-29 09:13:34'),
(8475, 'b4af8c35ad5f29189c3627f7c223aee4', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 09:13:45', '2022-10-29 09:13:45'),
(8476, '136bdfa01d98eefc41d76ca10ba5cdb1', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 09:13:46', '2022-10-29 09:15:35'),
(8477, 'f57ae063ff71b85faf1a7e1d4954085e', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 09:23:08', '2022-10-29 09:23:08'),
(8478, '921a47e44a03994102634599032ee1f0', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 09:23:40', '2022-10-29 09:23:40'),
(8479, '753d2835e672090ee1d2efc183d01c9c', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 09:30:15', '2022-10-29 09:30:15'),
(8480, 'c2f1a73f2b71ffd4085e9be3f77a0c2f', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 09:31:44', '2022-10-29 09:31:44'),
(8481, '026671e51503215ec34d110566106802', NULL, NULL, 'PL', NULL, 'PL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 10:07:23', '2022-10-29 22:11:51'),
(8482, 'ff9e5cfc6653e280aabf333e42f43f02', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 10:13:11', '2022-10-29 10:13:11'),
(8483, '1f7b765479aaa1b6866c4144fa90fa1c', NULL, NULL, 'NL', NULL, 'NL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 10:34:55', '2022-10-29 10:53:29'),
(8484, '6bd22a3ffeee5550656a4a8066d6e1ce', NULL, NULL, 'DE', NULL, 'DE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 10:54:59', '2022-10-29 10:54:59'),
(8485, '5714a52684e9b6ee658396fb0ca0ff62', NULL, NULL, 'NL', NULL, 'NL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 11:07:15', '2022-10-29 11:10:41'),
(8486, 'c91aee6f76182a04a283091ff01ed3ea', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 11:09:06', '2022-10-29 11:09:06'),
(8487, '16429cfbf09c3d4e16a3dd6edb4e6ecb', NULL, NULL, 'BY', NULL, 'BY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 11:10:20', '2022-10-29 11:10:20'),
(8488, '49aa5cdfe311980e0b4ce13002a3d758', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 11:13:22', '2022-10-29 11:13:22'),
(8489, 'bac24a6a1118baa24ca14facdd6da5e8', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 11:17:50', '2022-10-29 11:17:50'),
(8490, '12b21dab44b99b5aca38b3c38639aa50', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 11:49:47', '2022-10-29 11:49:47'),
(8491, '24b34b8969ad82a85a0461f6e5ec90ee', NULL, NULL, 'IE', NULL, 'IE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 11:51:42', '2022-10-29 11:51:42'),
(8492, '225a55e0ae0aa5f536d133f73e281152', NULL, NULL, 'IE', NULL, 'IE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 11:51:59', '2022-10-29 11:51:59'),
(8493, '11bab0f209763b69bb521eda0f7a8a4e', NULL, NULL, 'CN', NULL, 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 11:53:59', '2022-10-29 11:53:59'),
(8494, 'a4f6a31432d28b2ff4ed76fb40b879ed', NULL, NULL, 'CN', NULL, 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 12:03:28', '2022-10-29 12:03:28'),
(8495, 'a4a96b74685121a0cbaf21761ef3858b', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 12:12:44', '2022-10-29 12:12:44'),
(8496, 'e486841f6b6a1fa3807d97d77b5da1c2', NULL, NULL, 'IL', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 12:28:09', '2022-10-29 12:30:35'),
(8497, 'f57e2768347aa77318337c8908ffbc5b', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 13:12:44', '2022-10-29 13:12:44'),
(8498, '477339ec59d618957c5e562403cb180b', NULL, NULL, 'CA', NULL, 'CA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 13:20:51', '2022-10-29 13:22:40'),
(8499, '280442a099669f4bf30e8bec8683bd7c', NULL, NULL, 'IT', NULL, 'IT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 13:28:21', '2022-10-29 13:38:30'),
(8500, 'bfed93d9043c9da354ece601b5e53b6c', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 14:12:55', '2022-10-29 14:12:55'),
(8501, '7d1f1f968d1881ed322842e19c4bca23', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 14:21:12', '2022-10-29 14:22:25'),
(8502, 'f0b885d18da793774cf0faa4a9523b3a', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 14:28:40', '2022-10-29 14:28:40'),
(8503, 'dd0a9079b16562c8eefa25537c2002e8', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 14:37:16', '2022-10-29 14:37:33'),
(8504, '06975f79894c4efe3b915a6adddbc420', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 14:37:16', '2022-10-29 14:37:16'),
(8505, '2a8a8a374f771f172255323bff817799', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 14:44:58', '2022-10-29 14:44:58'),
(8506, '95678d1a10c98a61aadb23ae1cad685b', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 14:55:58', '2022-10-29 14:55:58'),
(8507, 'a9f5c0afd180cb5611f4da7b21cdc821', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 14:59:41', '2022-10-29 14:59:41'),
(8508, '9e66558ecab83a6a6d3b7f5b2d8c85eb', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 15:07:07', '2022-10-29 15:07:07'),
(8509, 'bbfe1e9a9e23dfdb6dc66c91ef60f4ca', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 15:13:52', '2022-10-29 15:13:52'),
(8510, '606ab3ac1d3fe27a7c6b0363b1c79b54', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 15:30:06', '2022-10-29 15:30:06'),
(8511, '1c3da38cd7f0f4e7eb7a43f08ddb3a4a', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 15:30:06', '2022-10-29 15:30:06'),
(8512, '4875206dbe8001be2580dad7cadf7312', NULL, NULL, 'CA', NULL, 'CA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 15:32:49', '2022-10-29 15:32:49'),
(8513, '9b6e75ed8bcf7d2b26a6a6c351978c78', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 16:13:28', '2022-10-29 16:13:28'),
(8514, '08e431bf1473e50ab4d5d332906d1bb4', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 16:34:22', '2022-10-29 16:34:22'),
(8515, 'ab1ce8f6c89f3565f6951f5fab571791', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 17:08:58', '2022-10-29 17:08:58'),
(8516, '7188a94732427f2d82c42fd033019014', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 17:19:49', '2022-10-29 17:19:49'),
(8517, 'e2516450e81dd6734dda92d4b83a2c81', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 17:32:59', '2022-10-29 17:32:59'),
(8518, 'ef53abbdc88cb8fb172a7c226dd7af0c', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 17:44:41', '2022-10-29 17:53:12'),
(8519, '3e682dd963303f5051d2905c51351cc0', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 18:18:35', '2022-10-29 18:18:35'),
(8520, 'e83c208544c5c22498916a80e456a18e', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 18:49:20', '2022-10-29 18:49:20'),
(8521, '9a5ab79d6aade3bf608691eb33dfb843', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 19:03:49', '2022-10-29 19:03:49'),
(8522, '8d509b3387520f6373dda996dacadd3a', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 19:19:33', '2022-10-29 19:19:33');
INSERT INTO `users` (`id`, `session_id`, `first_name`, `second_name`, `country`, `billing_country`, `lang`, `phone`, `email`, `instagram`, `address`, `apartment`, `city`, `region`, `zip_code`, `additions`, `password`, `role`, `temp`, `orders`, `created_at`, `changed_at`) VALUES
(8523, 'd3d16f749f6d9e0c15c75aaf132a6bcd', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 19:55:08', '2022-10-29 19:55:08'),
(8524, 'e2f4a39a73bda08e7fc8532b44ea93b1', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 20:11:49', '2022-10-29 20:11:49'),
(8525, '6cf4c9e3ae6ccd2b45bb17386a303a32', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 20:11:49', '2022-10-29 20:12:22'),
(8526, '2c57efe2490b6ac0da85355de8ba126c', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 20:15:42', '2022-10-29 20:15:42'),
(8527, '8b180727df6a8bb7a1fd7a39fd293c7f', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 20:18:44', '2022-10-29 20:18:44'),
(8528, '688bb587956f43c5c36e76d2f02a3871', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 20:24:18', '2022-10-29 20:24:18'),
(8529, '869ff954eb8b028d86e82f6a503231bc', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 20:33:14', '2022-10-29 20:33:14'),
(8530, 'b9081602f8f493a400a66aefa939cfd3', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 20:49:50', '2022-10-29 20:49:50'),
(8531, '8b72c5f61b5fcbc55c78081153303385', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 21:17:11', '2022-10-29 21:17:11'),
(8532, '9223f942e8c84bc380a29eac118ef66c', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 22:15:56', '2022-10-29 22:15:56'),
(8533, '9270b9018617871ee1921bd34de6cdb3', NULL, NULL, 'ES', NULL, 'ES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 22:29:15', '2022-10-29 22:30:21'),
(8534, '22775b729733e96a02130fb8d626770f', NULL, NULL, 'ES', NULL, 'ES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 22:30:56', '2022-10-29 22:30:56'),
(8535, '398d70cb8a6f8f0322c7529d1ec7b327', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 23:16:22', '2022-10-29 23:16:22'),
(8536, 'd4e59b4dcf42faf7ebdf390b2a9ed4ef', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 23:28:57', '2022-10-29 23:28:57'),
(8537, '7b1729dfb93e5765049de51cd2eefcb9', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-29 23:51:16', '2022-10-29 23:51:16'),
(8538, 'ffc59b56b85a4139d2a6b9bbf9d8bd2e', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 00:16:46', '2022-10-30 00:16:46'),
(8539, '747c16542401f96c411af2434f449420', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 00:45:06', '2022-10-30 00:45:06'),
(8540, 'def30f70b73cb308e6855aac07192ff0', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 00:52:37', '2022-10-30 00:52:37'),
(8541, '2c8646dc6632c42b381cd664e3b9cbc8', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 00:52:40', '2022-10-30 00:52:40'),
(8542, 'ee9504ddb200c6ebf9877fa7cce5a4e4', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 00:52:41', '2022-10-30 00:52:41'),
(8543, 'a43193916cfc3f014ea9fbca92f6a276', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 00:52:41', '2022-10-30 00:52:41'),
(8544, '71c67a7cc1b9939be36a0b59ca50d871', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 01:16:43', '2022-10-30 01:16:43'),
(8545, '11edafa2ff44b16a61162df870b95480', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 01:25:36', '2022-10-30 01:25:40'),
(8546, '7f43d8fe0571f7e4c4a247e9040bbb88', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 01:40:48', '2022-10-30 01:40:48'),
(8547, '694afc102ba023a88db0c7cab29444a4', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 01:41:00', '2022-10-30 01:48:04'),
(8548, '8701e2b82db1e5697d84a4263d111129', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 01:41:36', '2022-10-30 01:41:36'),
(8549, '75f60981682b3a285c4d932a7860f302', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 01:42:21', '2022-10-30 01:42:21'),
(8550, 'f37a98862c56750afa1f5550f1504ff6', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 01:43:14', '2022-10-30 01:43:14'),
(8551, 'dc2f8933a1042fe2ac37c79b2b794b41', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 01:44:11', '2022-10-30 01:44:11'),
(8552, 'acd0afd828077f666add896dfce09651', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 01:44:55', '2022-10-30 01:44:55'),
(8553, 'c04bba86a5617e7397d6a6db431d8a45', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 01:45:37', '2022-10-30 01:45:37'),
(8554, 'b2f887f0d4df6be8c517f9d1f093d5dc', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 01:46:21', '2022-10-30 01:46:21'),
(8555, 'f0d57008b37b8b332f17461865b27695', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 01:47:11', '2022-10-30 01:47:11'),
(8556, '506d9e6d9f58b4629dd00fa9b0079ac7', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 01:47:54', '2022-10-30 01:47:54'),
(8557, '38fcb6e95521a77c039c94b7258a36b2', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 01:56:15', '2022-10-30 01:56:15'),
(8558, 'f1a3c6c0aa2fa06f067bdef05613fd27', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 02:00:36', '2022-10-30 02:00:36'),
(8559, 'd28ad5c2bb7d7a13f3f13b3ddf4ef48a', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 02:11:44', '2022-10-30 02:11:44'),
(8560, '01ac05c9f953018e3b9629dc3b0a5b7f', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 02:14:49', '2022-10-30 02:14:49'),
(8561, 'ff1e522d0195c3e9af2083921c031f52', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 02:32:40', '2022-10-30 02:32:40'),
(8562, 'c0f050d4f83f1528fa0c2657acb43c04', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 02:40:15', '2022-10-30 02:40:15'),
(8563, '6866f8ca8d015722f5100c7e05f4a440', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 03:09:35', '2022-10-30 03:09:35'),
(8564, '464de202c3f68164f6bcad31be77d7f6', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 03:43:52', '2022-10-30 03:43:52'),
(8565, '3fde97c20a442ab8b3360593831f9c91', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 03:51:08', '2022-10-30 03:51:08'),
(8566, 'e15c206d2fbad5b8e31b8f9b8ca52b33', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 03:55:52', '2022-10-30 03:55:52'),
(8567, '51715713703cdcf55e0dc1eee6387c7c', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 04:37:26', '2022-10-30 04:37:26'),
(8568, 'fa8806484260313c79ae9031a26bc874', NULL, NULL, 'HU', NULL, 'HU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 04:46:42', '2022-10-30 04:46:42'),
(8569, 'b8de2a6f4db02726d2741bb5baade5a6', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 05:13:00', '2022-10-30 05:13:00'),
(8570, '7de59c14d3aec7f8dc07a4e1325655e5', 'skyreveryHobQL', 'skyreveryHob', 'RU', 'GT', 'RU', '87434973949', 'malinoleg91@mail.ru', '', 'https://skyrevery.com/', '', 'Москва', 'Москва', '135451', ' \r\n[url=https://skyrevery.com/private-jets/citation-cj2/]Private jet Cessna Citation CJ2 cabin dimentions[/url]        -  more information on our website [url=https://skyrevery.com]skyrevery.com[/url] \r\n[url=https://skyrevery.com/]Private jet rental[/url] at SkyRevery allows you to use such valuable resource as time most efficiently. \r\nYou are the one who decides where and when your private jet will fly. It is possible to organize and perform a flight between any two civil airports worldwide round the clock. In airports, private jet passengers use special VIP terminals where airport formalities are minimized, and all handling is really fast – you come just 30 minutes before  the estimated time of the departure of the rented private jet. \r\nWhen you need [url=https://skyrevery.com/]private jet charter[/url] now, we can organise your flight with departure in 3 hours from confirmation.', '1e71e0426248800758fd93b44e087f81', 'authorize', 0, 0, '2022-10-30 05:14:16', '2022-10-30 05:14:25'),
(8571, 'e74a2000e16b0ab1e1bd18070a3bfb0b', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 05:24:11', '2022-10-30 05:24:11'),
(8572, 'e24f6d8256786184832bb5fdbb09068d', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 05:26:27', '2022-10-30 05:26:27'),
(8573, '7ee3fba9329fcbd89d636b7bfbf59cbd', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 05:41:45', '2022-10-30 05:41:45'),
(8574, '03238b12132f2c74b21de6804f8e9e2d', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 06:01:21', '2022-10-30 06:01:21'),
(8575, '9314e969399155406275e0e572bdeb46', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 06:18:20', '2022-10-30 06:18:20'),
(8576, '4bf6e0ed03dc5e3fb962b3df1bd25fe6', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 06:26:59', '2022-10-30 06:26:59'),
(8577, '2526ba375712d9286bcca5582deac7a8', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 06:41:46', '2022-10-30 06:41:46'),
(8578, '62ff48bfdee5d4f7a88dbc0732743375', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 07:16:13', '2022-10-30 07:16:13'),
(8579, '09b5695bb7358ce7c58e6ffe526ae9ea', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 07:39:50', '2022-10-30 07:40:15'),
(8580, '8e2d1eeca4b961ee3ff09b7caaafe0ef', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 07:41:50', '2022-10-30 07:42:35'),
(8581, '578379cd4d240864c27807334adb158c', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 08:15:25', '2022-10-30 08:15:25'),
(8582, 'a72075f8d818b86dcc28e4c23f4a14a2', 'andre', 'jessyca', 'EN', 'ID', 'EN', '85881111582', 'michael.andrean1204@gmail.com', 'antlerism', 'jl. tanjung duren utara 8 no 878', 'rumah', 'jl. tanjung duren utara 8 no 878', 'jakarta', '11470', '', NULL, 'guest', 1, 0, '2022-10-30 08:16:49', '2022-10-30 08:20:19'),
(8583, 'ba4b948f5b04614f9f01658ef12404ce', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 08:51:41', '2022-10-30 08:51:41'),
(8584, '153f297f4e000a00861afea7e445fef9', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 08:52:23', '2022-10-30 09:06:32'),
(8585, 'e423a2aac1c7035580c130aae465ad7e', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 08:53:33', '2022-10-30 08:53:33'),
(8586, '04aed3f587bb7a802f2f09d3829decac', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 08:53:54', '2022-10-30 09:12:05'),
(8587, '409e34a9cd1124f46dfdcb97b9589fa7', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 09:15:12', '2022-10-30 09:15:12'),
(8588, '3a228b40cd213c60b98318bd51c1a083', NULL, NULL, 'PL', NULL, 'PL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 09:16:48', '2022-10-30 09:16:48'),
(8589, 'a39d380eb8e77d73d0bced36fd7f3467', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 09:45:58', '2022-10-30 09:45:58'),
(8590, 'd5fc89951bace9fcd4e8c7e9b6aa86fa', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 09:46:55', '2022-10-30 09:46:55'),
(8591, '523ed6c24b2547617a5ff3dd79caf68d', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 09:59:06', '2022-10-30 09:59:30'),
(8592, '31d58b308a8fb4be8bd2b5ca105f9c74', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 10:10:50', '2022-10-30 10:10:50'),
(8593, '29740b2562643b642990c16eabc00a89', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 10:14:30', '2022-10-30 10:14:30'),
(8594, '196dcefe42c1632376421b1344ad7aed', NULL, NULL, 'EN', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 10:44:12', '2022-10-30 10:45:01'),
(8595, '8d68cd89881129b0f6ee88859263c73a', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 10:48:25', '2022-10-30 10:48:25'),
(8596, '55d8d09757eab60fe53d3f1f297d5d95', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 10:58:47', '2022-10-30 10:58:47'),
(8597, '31b68c0a8ba86275928970510b8bfdc5', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 11:12:59', '2022-10-30 11:12:59'),
(8598, '22b207331bcf78d7316f07d41024da95', NULL, NULL, 'FI', NULL, 'FI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 11:24:57', '2022-10-30 11:24:57'),
(8599, '2e7d2250eae0d3bec030d9bcf7cfb86c', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 11:38:45', '2022-10-30 11:38:45'),
(8600, '633d3fd5b344df4d74efeaf5b02dd0f4', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 12:12:06', '2022-10-30 12:12:06'),
(8601, 'adb5e9d4221e22c21ea9d7886467fb2c', NULL, NULL, 'TR', NULL, 'TR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 12:21:18', '2022-10-30 12:21:18'),
(8602, 'bf600a14d479f8952e98ec9e90731fe4', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 12:54:09', '2022-10-30 12:54:09'),
(8603, '52651a4605e1d59a307cf85040525310', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 12:54:58', '2022-10-30 12:54:58'),
(8604, '97d31c871982e8b67f395d2dbefb13ad', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 12:55:11', '2022-10-30 13:25:35'),
(8605, '720683b2ff3005d20705f8292a0d4343', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 12:55:34', '2022-10-30 12:55:34'),
(8606, '09ccdf5cfaf7ab452c642f98c1a1d10a', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 12:56:16', '2022-10-30 12:56:16'),
(8607, 'c4d2faa3d8a5b856a4805b34d91500f9', NULL, NULL, 'DE', NULL, 'DE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 13:01:12', '2022-10-30 13:01:12'),
(8608, 'cf1640e322939959ec7016d2d941e26f', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 13:07:36', '2022-10-30 13:07:36'),
(8609, '8dacd98af7a79ce4fdaa389b3c680083', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 13:12:14', '2022-10-30 13:12:14'),
(8610, 'e836f3cb4206b25dafa0fa52af440f25', NULL, NULL, 'CN', NULL, 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 13:38:47', '2022-10-30 13:38:47'),
(8611, 'c4cfdf7c8b53ecb587133900d2f9879b', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 14:11:00', '2022-10-30 14:11:00'),
(8612, '865c4bc8424efc8ac2cb579a10d3baf7', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 15:08:17', '2022-10-30 15:08:17'),
(8613, '9c89aa8f5ee65588221a72525c2dd73b', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 15:09:38', '2022-10-30 15:09:38'),
(8614, '3ec174d1a645d6c74871c3da4c576724', NULL, NULL, 'PT', NULL, 'PT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 15:12:24', '2022-10-30 15:12:24'),
(8615, '6054e892f91e533a5d6147902d39d94b', NULL, NULL, 'PT', NULL, 'PT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 15:12:27', '2022-10-30 15:12:27'),
(8616, '1f38689c58d995ef37d5ebaf3510d8df', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 15:13:28', '2022-10-30 15:13:28'),
(8617, '6dd6e01f8a247ebf0e4e1832bb0bb318', NULL, NULL, 'PT', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 15:13:33', '2022-10-30 15:14:13'),
(8618, 'a0bc1531f7ab29f8388b516def10d8ae', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 15:14:22', '2022-10-30 15:14:22'),
(8619, 'f2a2cd788ae8d7a01ee204c3b71d3aad', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 15:14:44', '2022-10-30 15:14:44'),
(8620, 'eac7367e11dcfdc3fc2ca0a40a8ca8ee', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 15:14:52', '2022-10-30 15:14:52'),
(8621, '8d62b043f7e5cd5c2b2eee56cb701767', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 15:25:40', '2022-10-30 15:26:21'),
(8622, '60102be04bc0253840ec4d1bd1d0ebc0', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 15:31:15', '2022-10-30 15:31:15'),
(8623, '615f7c8a324b32e1f2aeb2a678d33bed', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 15:32:28', '2022-10-30 15:32:28'),
(8624, '748f68d0f8fd1baccc8d2ccaedfd2af2', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 15:36:46', '2022-10-30 15:36:46'),
(8625, '9e570051e210e1eae5c57807e20b6ab1', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 15:36:48', '2022-10-30 15:36:48'),
(8626, 'f464b0c67459a7699d3290777d618cfa', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 15:37:29', '2022-10-30 15:37:29'),
(8627, '7626ad3f06b67299d2fdaa8149b4641d', NULL, NULL, 'US', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 15:37:46', '2022-10-30 15:38:27'),
(8628, 'cadb806b0277e60c909344eee8ea4cf2', NULL, NULL, 'TR', NULL, 'TR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 15:42:16', '2022-10-30 15:43:20'),
(8629, 'a24195420d1fb9ed3c24f94bf8a60d36', NULL, NULL, 'HK', NULL, 'HK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 16:00:01', '2022-10-30 16:00:11'),
(8630, 'aa6e831c2ac60ca39863a7068fe6fe88', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 16:10:47', '2022-10-30 16:10:47'),
(8631, '6cfa9075afc6e7c659a1bf9ae872a976', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 16:21:53', '2022-10-30 16:21:53'),
(8632, 'c7af4580cba239ec6ebe6745d5eb6e64', NULL, NULL, 'DE', NULL, 'DE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 16:29:31', '2022-10-30 16:29:31'),
(8633, 'b4d05368907a275c297125091e17d9cd', NULL, NULL, 'FR', NULL, 'FR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 16:47:43', '2022-10-30 16:47:43'),
(8634, 'e1992ff38cd16d82e0061fca3e7a92fb', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 16:58:04', '2022-10-30 16:58:04'),
(8635, '42fbadf45980fb0afe3f1afc5297adbd', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 16:58:11', '2022-10-30 16:58:11'),
(8636, '2a99a0dff3955181d1abe342403befd5', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 16:58:46', '2022-10-30 16:58:46'),
(8637, '680f301144a9541ef41504021d3d067f', NULL, NULL, 'US', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 16:58:53', '2022-10-30 16:59:36'),
(8638, '78402c25225b84705960cd8328b9aec1', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 17:11:39', '2022-10-30 17:11:39'),
(8639, '70fed5ba389ec8395b2829492a0b675b', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 17:18:29', '2022-10-30 17:18:29'),
(8640, '8bf17a6861041488d98752b9b283afd6', NULL, NULL, 'CA', NULL, 'CA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 17:23:46', '2022-10-30 17:23:46'),
(8641, '83576434bd69c62619f1d1126715c5c2', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 17:24:03', '2022-10-30 17:24:03'),
(8642, 'f7877b2c22ba6d144f889279f4614d56', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 17:26:45', '2022-10-30 17:26:45'),
(8643, 'a8bc043c6849c87c74e981b7224290bd', NULL, NULL, 'SG', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 17:35:52', '2022-10-30 17:35:52'),
(8644, '4f56f14f3af95080ec0418da422413f4', NULL, NULL, 'CA', NULL, 'CA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 17:47:38', '2022-10-30 17:47:38'),
(8645, 'f257d133dd3c71858a3633d4564ecb87', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 18:12:54', '2022-10-30 18:12:54'),
(8646, '06d95185146e29e8919fd09c667c2de8', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 18:20:51', '2022-10-30 18:20:51'),
(8647, 'c3a62c4a0f9ba7f39f43387e3c8bb964', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 18:23:56', '2022-10-30 18:23:56'),
(8648, '177b807ac01885c46aa39c01ccc403fd', NULL, NULL, 'SE', NULL, 'SE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 18:43:59', '2022-10-30 18:43:59'),
(8649, '48670503702d4c00cf71587c6777516b', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 18:44:52', '2022-10-30 18:44:53'),
(8650, '144d3c0963da88bd38eba3278994fbf8', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 19:23:16', '2022-10-30 19:23:16'),
(8651, 'e475eaa7bdce3e751bb670f5a13357f8', NULL, NULL, 'IL', NULL, 'IL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 20:06:09', '2022-10-30 20:06:15'),
(8652, 'bd49dadfdea5d4a3aa5aee5cf66b16c6', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 20:21:43', '2022-10-30 20:21:43'),
(8653, 'de7e96fe615654f50f6fd490aa885e09', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 20:31:53', '2022-10-30 20:32:49'),
(8654, 'fbe8959e98e35709fbbe46883cbac1d3', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 20:36:25', '2022-10-30 20:36:25'),
(8655, 'fc191992d5b2b9af4f82614ab3a7671f', NULL, NULL, 'NL', NULL, 'NL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 21:18:28', '2022-10-30 21:19:36'),
(8656, 'aa18f5eb10ebacfd197bc22f2c19a826', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 21:23:17', '2022-10-30 21:23:17'),
(8657, 'd4f6ab963a689104399fda0c5b97399c', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 21:35:22', '2022-10-30 21:35:22'),
(8658, 'a679853a58e81f2be02c19acb9a361db', NULL, NULL, 'CA', NULL, 'CA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 21:47:05', '2022-10-30 21:47:05'),
(8659, 'aa675fa6cd6ddb72da0e4b3c302c510b', NULL, NULL, 'DE', NULL, 'DE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 21:48:52', '2022-10-30 21:49:14'),
(8660, '7da5c6d4fbae95a7cc14cc7b8f571019', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 22:09:05', '2022-10-30 22:09:05'),
(8661, 'd2e46b657eac4e35d695c38f3db29884', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 22:22:21', '2022-10-30 22:22:21'),
(8662, '58198edd0c121e4e97cc1fa52f3446ce', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 22:56:07', '2022-10-30 22:56:07'),
(8663, '598ea4d7cda7838a16aca79b281643c7', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 23:16:46', '2022-10-30 23:16:46'),
(8664, '404d17148fd9626200966460ad946df5', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-30 23:20:49', '2022-10-30 23:20:49'),
(8665, '401e376b2a97e09cbcec8767aa22dfea', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-31 00:18:53', '2022-10-31 00:18:53'),
(8666, '858a7064d36f48f8579b89169948030f', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-31 00:47:27', '2022-10-31 00:47:27'),
(8667, 'd981d2e61b7f2f9622216ca3bcce5170', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-31 00:50:38', '2022-10-31 00:50:38'),
(8668, 'c3a8235d7612ced5ad39fdc4e8e81484', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-31 00:54:51', '2022-10-31 00:55:36'),
(8669, '4f50f2aa87707a57e452ab542141e2f2', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-31 01:11:35', '2022-10-31 01:12:56'),
(8670, '62545840ccc653e4bd34aa5c263c2685', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-31 01:17:35', '2022-10-31 01:17:35'),
(8671, 'f04f634117ddaa71440f0e4e1992fbba', NULL, NULL, 'FR', NULL, 'FR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-31 01:37:10', '2022-10-31 01:38:52'),
(8672, '83cb28931b4ba8050cd61d8b98928121', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-31 02:17:12', '2022-10-31 02:17:12'),
(8673, '127a67ce35c6aaa81afb8ddd6f841f33', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-31 02:22:57', '2022-10-31 02:22:57'),
(8674, '3fb4f9cd2e3438999ea9a6f7d7c16a79', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-31 03:17:34', '2022-10-31 03:17:34'),
(8675, '045ee1be760ceb9a68665afcaa015360', NULL, NULL, 'US', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-31 03:18:55', '2022-10-31 03:18:55'),
(8676, '8d42e4678b1ec5275b017e75fccc1542', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-31 03:55:27', '2022-10-31 03:55:27'),
(8677, '00ba6fa3c27fcac8257feab4ba45202a', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-31 04:16:31', '2022-10-31 04:16:31'),
(8678, 'b1afd9587de110c4c1f0c8f747ec261a', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-31 04:28:27', '2022-10-31 04:28:27'),
(8679, '0742ca55d775b4828d57ca200f0efa0c', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-31 05:15:46', '2022-10-31 05:15:46'),
(8680, 'b1000451fb3836680537380467840e21', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-31 05:21:51', '2022-10-31 05:21:51'),
(8681, 'b9d2dcd2644cae00ad72fc9f734318bd', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-10-31 05:59:47', '2022-10-31 05:59:56');

-- --------------------------------------------------------

--
-- Структура таблицы `users_roles`
--
-- Создание: Авг 28 2022 г., 18:52
--

DROP TABLE IF EXISTS `users_roles`;
CREATE TABLE `users_roles` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mail_config`
--
ALTER TABLE `mail_config`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders_status`
--
ALTER TABLE `orders_status`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_ibfk_1` (`category_id`);

--
-- Индексы таблицы `products_properties`
--
ALTER TABLE `products_properties`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sber_config`
--
ALTER TABLE `sber_config`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Индексы таблицы `users_roles`
--
ALTER TABLE `users_roles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=296;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `mail_config`
--
ALTER TABLE `mail_config`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT для таблицы `orders_status`
--
ALTER TABLE `orders_status`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `products_properties`
--
ALTER TABLE `products_properties`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT для таблицы `sber_config`
--
ALTER TABLE `sber_config`
  MODIFY `id` int(1) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8682;

--
-- AUTO_INCREMENT для таблицы `users_roles`
--
ALTER TABLE `users_roles`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
