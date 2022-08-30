-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: h902111921.mysql
-- Время создания: Авг 30 2022 г., 20:34
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
(16, 88, 6, 24, 1, '2022-08-29 12:33:03', '2022-08-29 12:33:03'),
(17, 92, 2, 20, 1, '2022-08-29 12:33:28', '2022-08-29 12:33:28'),
(18, 93, 3, 21, 1, '2022-08-29 12:33:29', '2022-08-29 12:33:29'),
(19, 144, 7, 25, 1, '2022-08-29 17:18:35', '2022-08-29 17:18:35'),
(20, 145, 4, 22, 1, '2022-08-29 17:18:36', '2022-08-29 17:18:36'),
(21, 148, 8, 26, 1, '2022-08-29 17:18:38', '2022-08-29 17:18:38'),
(22, 154, 9, 27, 1, '2022-08-29 17:18:44', '2022-08-29 17:18:44'),
(23, 162, 3, 21, 1, '2022-08-29 17:18:49', '2022-08-29 17:18:49'),
(24, 163, 3, 21, 1, '2022-08-29 17:18:52', '2022-08-29 17:18:52'),
(25, 164, 2, 20, 1, '2022-08-29 17:18:53', '2022-08-29 17:18:53'),
(26, 166, 2, 20, 1, '2022-08-29 17:18:54', '2022-08-29 17:18:54'),
(27, 181, 8, 26, 1, '2022-08-29 17:19:00', '2022-08-29 17:19:00'),
(28, 187, 9, 27, 1, '2022-08-29 17:19:04', '2022-08-29 17:19:04'),
(29, 192, 4, 22, 1, '2022-08-29 17:19:07', '2022-08-29 17:19:07'),
(30, 221, 6, 24, 1, '2022-08-29 17:19:28', '2022-08-29 17:19:28'),
(31, 230, 6, 24, 1, '2022-08-29 17:19:51', '2022-08-29 17:19:51'),
(32, 254, 3, 21, 1, '2022-08-29 17:27:50', '2022-08-29 17:27:50'),
(33, 262, 8, 26, 1, '2022-08-29 17:32:28', '2022-08-29 17:32:28'),
(34, 268, 9, 27, 1, '2022-08-29 18:01:55', '2022-08-29 18:01:55'),
(35, 274, 7, 25, 1, '2022-08-29 18:23:39', '2022-08-29 18:23:39'),
(36, 346, 7, 25, 1, '2022-08-30 12:47:32', '2022-08-30 12:47:32');

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
(6, 'Горилла', 'Gorilla Machine', '<p>Горилла имея самый мощный мотор, отлично подходит для работы с толстыми контурами 7-18рл и крупными магнумами. Максимальный комфорт в работе и не превзойденная надёжность делает эту машинку главной в вашем парке рабочих лошадок.</p>', '<p>Gorilla with the most powerful motor is great for working with thick lines 7-18rl and large magnums Maximum work comfort and unmatched reliability make this machine the ultimate in your workhorse fleet.</p>', '[\"public\\/images\\/categories\\/Gorilla Machine 6305dff379396.png\"]', '', '2022-08-24 11:23:15', '2022-08-28 23:38:33'),
(7, 'Гибрид V1', 'Hybrid Machine V1', '<p>Особенность гибрида, сочетание в себе хлесткого удара индукции и стабильность ротора. С лёгкостью выполняет контурные, закрасочные и теневые работы любыми группами игл.</p>', '<p><br></p>', '[\"public\\/images\\/categories\\/Hybrid Machine 6305e041a8d50.png\"]', '<iframe src=\"https://www.youtube.com/embed/3qFzHp9LL4E\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', '2022-08-24 11:24:33', '2022-08-30 23:05:51'),
(8, 'Дизель Би', 'Diesel Bee', '<p>Diesel bee гибрид третий версии. Благодаря запатентованной системе в третьем гибриде&nbsp;получилось полностью сымитировать работу индукции. В работе есть хлесткий удар индукции и проседание, чтобы не было лишней травматизации. По работе гибрид третий получился между гибридом 1 и гориллой, остался острый удар первого гибрида и тяговитость гориллы. </p><p>Подходит абсолютно для всех видов работ. отлично справляется с тонкими контурами и легко справляется с самыми толстыми контурами на любых участках кожи.</p>', '<p>Diesel bee hybrid third version. Thanks to the patented system in the third hybrid, it turned out to completely simulate the work of induction. There is a whiplash of induction and subsidence in the work, so that there is no unnecessary traumatization. According to the work, the third hybrid turned out to be between hybrid 1 and gorilla, the sharp blow of the first hybrid and the traction of the gorilla remained.</p><p>It is absolutely suitable for all types of work. perfectly copes with thin contours and easily copes with the thickest contours on any skin areas.</p>', '[\"public\\/images\\/categories\\/Diesel Bee 6305e07d1ec9c.png\"]', '<iframe src=\"https://www.youtube.com/embed/jexP06ALt9U\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', '2022-08-24 11:25:33', '2022-08-27 18:17:08');

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
(2, 54, 'RU', 'RU', 1, 0, 0, '', '', '', 'Евгения', 'Шувалова', '89957831303', 'smoktunosya@gmail.com', '', 'RU', 'Коммунарка дом 13', '', 'Москва', 'Москва', '108814', '', '{\"14\":{\"user_id\":\"54\",\"product_id\":\"1\",\"property_id\":\"19\",\"quantity\":\"1\",\"created_at\":\"2022-08-29 13:28:11\",\"changed_at\":\"2022-08-29 13:28:11\"},\"15\":{\"user_id\":\"54\",\"product_id\":\"5\",\"property_id\":\"23\",\"quantity\":\"1\",\"created_at\":\"2022-08-29 13:28:27\",\"changed_at\":\"2022-08-29 13:28:27\"}}', '{\"RUB\":48000,\"USD\":900}', '2022-08-29 10:32:48', '2022-08-29 10:32:48');

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
(1, 7, 'Hybrid black clipcord ', 'Hybrid black clipcord ', '<p>Особенность гибрида, сочетание в себе хлесткого удара индукции и стабильность ротора. С лёгкостью выполняет контурные, закрасочные и теневые работы любыми группами игл.</p><p>Данная версия не предназначена для работ с картриджами, используйте только классические иглы.</p><p><br></p><p>Характеристики:</p><p>Ход иглы 3,5 — 5,5 мм</p><p>Разъём Клип корд</p><p>Вес 140 грамм</p><p>Материал Алюминий авиационный</p><p>Покрытие анодирование</p>', '<p>The peculiarity of the HYBRID , the combination of the lashing kick of induction and the stability of the rotor. Easily performs lines, and shadow work with any group of needles.</p><p>This version is not designed to work with cartridges, use only classic needles.</p><p><br></p><p>Features:</p><p>Needle stroke 3.5 – 5.5 mm</p><p>Connector Clip cord</p><p>Weight 140 grams</p><p>Material Aviation aluminum</p><p>Coating anodizing</p>', '[\"public\\/images\\/products\\/Hybrid black clipcord  630bc5eeecb36.jpg\"]', '[\"public\\/images\\/products\\/min\\/Hybrid black clipcord  630bc5eeecb7b.jpg\"]', 28000, 515, 28000, 515, 28000, 515, 1, '2022-08-28 22:28:47', '2022-08-28 22:48:21'),
(2, 7, 'Hybrid mint clipcord ', 'Hybrid mint clipcord ', '<p>Особенность гибрида, сочетание в себе хлесткого удара индукции и стабильность ротора. С лёгкостью выполняет контурные, закрасочные и теневые работы любыми группами игл.</p><p>Данная версия не предназначена для работ с картриджами, используйте только классические иглы.</p><p><br></p><p>Характеристики:</p><p>Ход иглы 3,5 — 5,5 мм</p><p>Разъём Клип корд</p><p>Вес 140 грамм</p><p>Материал Алюминий авиационный</p><p>Покрытие анодирование</p>', '<p>The peculiarity of the HYBRID , the combination of the lashing kick of induction and the stability of the rotor. Easily performs lines, and shadow work with any group of needles.</p><p>This version is not designed to work with cartridges, use only classic needles.</p><p><br></p><p>Features:</p><p>Needle stroke 3.5 – 5.5 mm</p><p>Connector Clip cord</p><p>Weight 140 grams</p><p>Material Aviation aluminum</p><p>Coating anodizing</p>', '[\"public\\/images\\/products\\/Hybrid mint clipcord  630bc7c262d71.jpg\"]', '[\"public\\/images\\/products\\/min\\/Hybrid mint clipcord  630bc7c262dba.jpg\"]', 28000, 515, 28000, 515, 28000, 515, 1, '2022-08-28 22:53:38', '2022-08-28 22:53:38'),
(3, 7, 'Hybrid antiqua Rca', 'Hybrid antiqua Rca', '<p>Особенность гибрида, сочетание в себе хлесткого удара индукции и стабильность ротора. С лёгкостью выполняет контурные, закрасочные и теневые работы любыми группами игл.</p><p>Данная версия не предназначена для работ с картриджами, используйте только классические иглы.</p><p><br></p><p>Характеристики:</p><p>Ход иглы 3,5 — 5,5 мм</p><p>Разъём Rca</p><p>Вес 140 грамм</p><p>Материал Алюминий авиационный</p><p>Покрытие анодирование</p>', '<p>The peculiarity of the HYBRID , the combination of the lashing kick of induction and the stability of the rotor. Easily performs lines, and shadow work with any group of needles.</p><p>This version is not designed to work with cartridges, use only classic needles.</p><p><br></p><p>Features:</p><p>Needle stroke 3.5 – 5.5 mm</p><p>Connector Rca</p><p>Weight 140 grams</p><p>Material Aviation aluminum</p><p>Coating anodizing</p>', '[\"public\\/images\\/products\\/Hybrid antiqua Rca 630bd040689d8.jpg\"]', '[\"public\\/images\\/products\\/min\\/Hybrid antiqua Rca 630bd04068a21.jpg\"]', 28000, 515, 28000, 515, 28000, 515, 1, '2022-08-28 23:29:52', '2022-08-28 23:29:52'),
(4, 6, 'Gorilla black clipcord ', 'Gorilla black clipcord ', '<p>Горилла имея самый мощный мотор, отлично подходит для работы с толстыми контурами 7-18рл и крупными магнумами. Максимальный комфорт в работе и не превзойденная надёжность делает эту машинку главной в вашем парке рабочих лошадок.</p><p>Разъём клипкорд</p><p>Вес 180 грамм</p><p>Ход иглы 3,5 — 5 мм</p>', '<p>Gorilla with the most powerful motor is great for working with thick lines 7-18rl and large magnums Maximum work comfort and unmatched reliability make this machine the ultimate in your workhorse fleet.</p><p><br></p><p>Clipcord connector</p><p>Weight 180 grams</p><p>Needle stroke 3.5 – 5 mm</p>', '[\"public\\/images\\/products\\/Gorilla black clipcord  630bd33f6d794.jpg\"]', '[\"public\\/images\\/products\\/min\\/Gorilla black clipcord  630bd33f6d7f2.jpg\"]', 30000, 555, 30000, 555, 30000, 555, 0, '2022-08-28 23:42:39', '2022-08-30 16:07:28'),
(5, 4, 'Rotary gold ', 'Rotary gold ', '<p>Классическая роторная машинка direct drive. Оснащён мощным швейцарским мотором MAXON A MAX. Можно использовать как для классических игл так и для картриджной системы. В комплекте три сменных эксцентрика с ходом 3.6 мм, 4.2 мм и с ходом 5 мм </p><p>Эксцентрик с ходом 3.6 мм отлично подойдёт для покраса и цветовых растяжек </p><p>Эксцентрик с ходом 4,2 мм отлично подойдёт для контурных работ и плотного покраса </p><p>Эксцентрик с ходом 5 мм предназначен для дотворка и экспериментальных техник </p><p><br></p><p>Подключение : Клип корд </p><p>Покрытие : Анодирование </p><p><br></p>', '<p>Classic rotary direct drive machine.&nbsp;Equipped with a powerful Swiss motor MAXON A MAX.&nbsp;Can be used for both classic needles and cartridge system.&nbsp;Includes three eccentrics with 3.6mm, 4.2mm and 5mm stroke. </p><p><span style=\"color: var(--bs-body-color); font-weight: var(--bs-body-font-weight);\">Eccentric with 3.6 mm stroke is perfect for color and color stretching. </span></p><p><span style=\"color: var(--bs-body-color); font-weight: var(--bs-body-font-weight);\">Eccentric with 4.2mm stroke is perfect for lines and shader. </span></p><p><span style=\"color: var(--bs-body-color); font-weight: var(--bs-body-font-weight);\">Eccentric with a stroke of 5 mm is designed for dotwork and experimental techniques. </span></p><p><br></p><p>Connection : Clip cord</p><p><span style=\"color: var(--bs-body-color); font-weight: var(--bs-body-font-weight);\">Finish : Anodizing</span></p>', '[\"public\\/images\\/products\\/Rotary  630bdd36c5e24.jpg\",\"public\\/images\\/products\\/Rotary  630bdd36c5e26.jpg\"]', '[\"public\\/images\\/products\\/min\\/Rotary  630bdd36c5e9e.jpg\"]', 20000, 385, 20000, 385, 20000, 385, 1, '2022-08-29 00:20:34', '2022-08-29 00:32:27'),
(6, 4, 'Rotary black ', 'Rotary black', '<p>Классическая роторная машинка direct drive. Оснащён мощным швейцарским мотором MAXON A MAX. Можно использовать как для классических игл так и для картриджной системы. В комплекте три сменных эксцентрика с ходом 3.6 мм, 4.2 мм и с ходом 5 мм </p><p>Эксцентрик с ходом 3.6 мм отлично подойдёт для покраса и цветовых растяжек </p><p>Эксцентрик с ходом 4,2 мм отлично подойдёт для контурных работ и плотного покраса </p><p>Эксцентрик с ходом 5 мм предназначен для дотворка и экспериментальных техник </p><p><br></p><p>Подключение : Клип корд </p><p>Покрытие : Анодирование </p><p><br></p>', '<p>Classic rotary direct drive machine.&nbsp;Equipped with a powerful Swiss motor MAXON A MAX.&nbsp;Can be used for both classic needles and cartridge system.&nbsp;Includes three eccentrics with 3.6mm, 4.2mm and 5mm stroke. </p><p><span style=\"color: var(--bs-body-color); font-weight: var(--bs-body-font-weight);\">Eccentric with 3.6 mm stroke is perfect for color and color stretching. </span></p><p><span style=\"color: var(--bs-body-color); font-weight: var(--bs-body-font-weight);\">Eccentric with 4.2mm stroke is perfect for lines and shader. </span></p><p><span style=\"color: var(--bs-body-color); font-weight: var(--bs-body-font-weight);\">Eccentric with a stroke of 5 mm is designed for dotwork and experimental techniques. </span></p><p><br></p><p>Connection : Clip cord</p><p><span style=\"color: var(--bs-body-color); font-weight: var(--bs-body-font-weight);\">Finish : Anodizing</span></p>', '[\"public\\/images\\/products\\/Rotary black 630bdf311d5a8.jpg\",\"public\\/images\\/products\\/Rotary black 630bdf311d5aa.jpg\"]', '[\"public\\/images\\/products\\/min\\/Rotary black 630bdf311d60f.jpg\"]', 20000, 385, 20000, 385, 20000, 385, 1, '2022-08-29 00:33:37', '2022-08-29 00:33:37'),
(7, 6, 'Gorilla gold clipcord ', 'Gorilla gold clipcord ', '<p>Горилла имея самый мощный мотор, отлично подходит для работы с толстыми контурами 7-18рл и крупными магнумами. Максимальный комфорт в работе и не превзойденная надёжность делает эту машинку главной в вашем парке рабочих лошадок.</p><p>Разъём клипкорд</p><p>Вес 180 грамм</p><p>Ход иглы 3,5 — 5 мм</p>', '<p>Gorilla with the most powerful motor is great for working with thick lines 7-18rl and large magnums Maximum work comfort and unmatched reliability make this machine the ultimate in your workhorse fleet.</p><p><br></p><p>Clipcord connector</p><p>Weight 180 grams</p><p>Needle stroke 3.5 – 5 mm</p>', '[\"public\\/images\\/products\\/Gorilla gold clipcord  630be0b7c3eca.jpg\"]', '[\"public\\/images\\/products\\/min\\/Gorilla gold clipcord  630be0b7c3f58.jpg\"]', 30000, 555, 30000, 555, 30000, 555, 1, '2022-08-29 00:40:07', '2022-08-29 13:48:59'),
(8, 6, 'Gorilla red camo clipcord ', 'Gorilla red camo clipcord ', '<p>Горилла имея самый мощный мотор, отлично подходит для работы с толстыми контурами 7-18рл и крупными магнумами. Максимальный комфорт в работе и не превзойденная надёжность делает эту машинку главной в вашем парке рабочих лошадок.</p><p>Разъём клипкорд</p><p>Вес 180 грамм</p><p>Ход иглы 3,5 — 5 мм</p>', '<p>Gorilla with the most powerful motor is great for working with thick lines 7-18rl and large magnums Maximum work comfort and unmatched reliability make this machine the ultimate in your workhorse fleet.</p><p><br></p><p>Clipcord connector</p><p>Weight 180 grams</p><p>Needle stroke 3.5 – 5 mm</p>', '[\"public\\/images\\/products\\/Gorilla red camo clipcord  630be2cc4ae2c.jpg\"]', '[\"public\\/images\\/products\\/min\\/Gorilla red camo clipcord  630be2cc4ae97.jpg\"]', 31000, 565, 31000, 565, 31000, 565, 1, '2022-08-29 00:49:00', '2022-08-29 14:03:33'),
(9, 6, 'Gorilla antiqua Rca', 'Gorilla antiqua Rca', '<p>Горилла имея самый мощный мотор, отлично подходит для работы с толстыми контурами 7-18рл и крупными магнумами. Максимальный комфорт в работе и не превзойденная надёжность делает эту машинку главной в вашем парке рабочих лошадок.</p><p>Разъём  рса</p><p>Вес 180 грамм</p><p>Ход иглы 3,5 — 5 мм</p>', '<p>Gorilla with the most powerful motor is great for working with thick lines 7-18rl and large magnums Maximum work comfort and unmatched reliability make this machine the ultimate in your workhorse fleet.</p><p><br></p><p>Connector RCA </p><p>Weight 180 grams</p><p>Needle stroke 3.5 – 5 mm</p>', '[\"public\\/images\\/products\\/Gorilla antiqua Rca 630c9501d050c.jpg\"]', '[\"public\\/images\\/products\\/min\\/Gorilla antiqua Rca 630c9501d059f.jpg\"]', 31000, 565, 31000, 565, 31000, 565, 2, '2022-08-29 13:29:21', '2022-08-29 13:29:21'),
(10, 3, 'Индукция ', 'Coil machine ', '<p>Классическая индукционная машинка.</p><p>Собрана и настроена мной лично.</p><p>Рама цельнофрезерованная из сделана монолита железа.&nbsp;</p><p>Назначение: контур от 3 до 11 игл</p><p>Рабочий вольтаж: 4-6,5 вольт</p><p>Вес: 180 грамм</p><p>Покрытие: состаренный никель</p><p>Подключение: клипкорд&nbsp;</p>', '<p>Классическая индукционная машинка.</p><p>Собрана и настроена мной лично.</p><p>Рама цельнофрезерованная из сделана монолита железа.&nbsp;</p><p>Назначение: контур от 3 до 11 игл</p><p>Рабочий вольтаж: 4-6,5 вольт</p><p>Вес: 180 грамм</p><p>Покрытие: состаренный никель</p><p>Подключение: клипкорд&nbsp;</p>', '[\"public\\/images\\/products\\/Coil machine  630dc193a260b.jpg\"]', '[\"public\\/images\\/products\\/min\\/Coil machine  630dc193a26ad.jpg\"]', 14000, 250, 14000, 250, 14000, 250, 1, '2022-08-30 10:51:47', '2022-08-30 16:14:46'),
(11, 3, 'Индукция ', 'Coil machine ', '<p><br></p>', '<p><br></p>', '[\"public\\/images\\/products\\/Coil machine  630dcba70be1b.jpg\"]', '[\"public\\/images\\/products\\/min\\/Coil machine  630dcba70bf04.jpg\"]', 14000, 250, 14000, 250, 14000, 250, 1, '2022-08-30 11:34:47', '2022-08-30 11:34:47');

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
(19, 1, '', '', 'Hybrid black clipcord ', 'Hybrid black clipcord ', 28000, 515, 0, '2022-08-28 22:28:47', '2022-08-28 22:28:47'),
(20, 2, '', '', 'Hybrid mint clipcord ', 'Hybrid mint clipcord ', 28000, 515, 1, '2022-08-28 22:53:38', '2022-08-28 22:53:38'),
(21, 3, '', '', 'Hybrid antiqua Rca', 'Hybrid antiqua Rca', 28000, 515, 1, '2022-08-28 23:29:52', '2022-08-28 23:29:52'),
(22, 4, '', '', 'Gorilla black clipcord ', 'Gorilla black clipcord ', 30000, 555, 0, '2022-08-28 23:42:39', '2022-08-30 16:07:28'),
(23, 5, '', '', 'Rotary ', 'Rotary ', 20000, 385, 0, '2022-08-29 00:20:34', '2022-08-29 00:20:34'),
(24, 6, '', '', 'Rotary black ', 'Rotary black', 20000, 385, 1, '2022-08-29 00:33:37', '2022-08-29 00:33:37'),
(25, 7, '', '', 'Gorilla gold clipcord ', 'Gorilla gold clipcord ', 30000, 555, 1, '2022-08-29 00:40:07', '2022-08-29 00:40:07'),
(26, 8, '', '', 'Gorilla red camo clipcord ', 'Gorilla red camo clipcord ', 31000, 565, 1, '2022-08-29 00:49:00', '2022-08-29 14:03:33'),
(27, 9, '', '', 'Gorilla antiqua Rca', 'Gorilla antiqua Rca', 31000, 565, 2, '2022-08-29 13:29:21', '2022-08-29 13:29:21'),
(28, 10, '', '', 'Индукция ', 'Coil machine ', 14000, 250, 1, '2022-08-30 10:51:47', '2022-08-30 10:51:47'),
(29, 11, '', '', 'Индукция ', 'Coil machine ', 14000, 250, 1, '2022-08-30 11:34:47', '2022-08-30 11:34:47');

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
(1, 'e8d2c9ac1f6534b30cdc55a22bd73f3c', 'Леонид', 'Смагин', 'RU', 'RU', 'RU', '+79782599591', 'info@leosmagin.com', '', '', '', '', '', '', '', '813869ad63acf6888f4b3492e4a5e66a', 'admin', 0, 0, '2022-08-22 07:21:26', '2022-08-30 20:05:53'),
(35, 'ca970971fbac58d319dcfb6b73cc57d4', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-28 20:42:13', '2022-08-28 20:42:13'),
(36, '2175d5064983ffbabfa609eca8dec94b', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-28 21:25:06', '2022-08-28 21:25:06'),
(37, '370b7afc68bd805a2e8a67ea9268f252', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-28 21:25:06', '2022-08-28 21:38:33'),
(38, 'd1437a17daf8612c8a1adeb0d39af462', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-28 22:44:07', '2022-08-28 22:44:09'),
(39, 'd3b038f7984abd3715008406a02207aa', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-28 22:54:56', '2022-08-28 22:55:15'),
(40, '81e9ab17ca9a770cf7bc7237c1921565', NULL, NULL, 'US', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-28 22:55:37', '2022-08-28 22:57:24'),
(41, '6fbc0af39028461b669bcf29592bbaf5', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-28 22:57:38', '2022-08-28 22:58:42'),
(42, 'f817b9679fba77a09f7d0bf94799b79e', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-28 23:57:22', '2022-08-28 23:57:22'),
(43, 'e32fe6781ae7d01502c348fac25b46e8', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 00:04:37', '2022-08-29 00:04:37'),
(44, 'db11f4c118ef469ff16b20fb2d25e807', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 02:47:39', '2022-08-29 02:47:39'),
(45, '0282413cbdb017b913e224c3627eb6d4', NULL, NULL, 'AU', NULL, 'AU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 05:13:50', '2022-08-29 05:14:29'),
(46, 'a9fce6cb69da31fc29de480a7cea1d91', NULL, NULL, 'MY', NULL, 'MY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 06:51:50', '2022-08-29 06:51:53'),
(47, '08a90f50e6dab3eac90e5ff2cb617a64', NULL, NULL, 'DK', NULL, 'DK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 08:31:29', '2022-08-29 08:33:08'),
(48, '438f5b4d434e0ac1e4040b4852f57361', NULL, NULL, 'TR', NULL, 'TR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 08:44:34', '2022-08-29 08:44:40'),
(49, '4ba5be8c36fd716f7b746057a68a60ed', NULL, NULL, 'FR', NULL, 'FR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 09:21:14', '2022-08-29 09:21:14'),
(50, 'c222ff0361b009c17e5cc1c9e7887ecb', NULL, NULL, 'BY', NULL, 'BY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 09:52:15', '2022-08-29 09:52:15'),
(51, '18f91c40aef672c78590ae8b1689ba14', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 10:04:56', '2022-08-29 15:18:54'),
(52, '493d45988bc829c8eb35ea128a8f8e9f', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 10:08:39', '2022-08-29 10:08:39'),
(54, 'b7ee2198e2f6a3d67ce6bd849f1cddb1', 'Евгения', 'Шувалова', 'RU', 'RU', 'RU', '89957831303', 'smoktunosya@gmail.com', '', 'Коммунарка дом 13', '', 'Москва', 'Москва', '108814', '', NULL, 'guest', 1, 0, '2022-08-29 10:21:19', '2022-08-29 11:01:14'),
(55, 'ee49350b54336eb3a7a194c03b0c9036', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 10:30:47', '2022-08-29 10:34:42'),
(56, 'de14be65e69cc086d3e41a77e2ac78ad', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 10:51:55', '2022-08-29 10:51:55'),
(57, '09dfffe2ed1ff27b11a4661dd772a15d', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 10:52:04', '2022-08-29 10:52:04'),
(58, '46d7d86c3a36186a3184269600207bf1', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 11:18:37', '2022-08-29 11:18:37'),
(59, '235d35379a407807e6976190239d8a35', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 11:32:33', '2022-08-29 11:33:09'),
(60, 'b7298db2340900db29c195a340eb30be', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 11:38:54', '2022-08-29 11:38:54'),
(61, 'd32e459a280c5ef8cd3afde83e50f5a6', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 11:39:15', '2022-08-29 11:39:15'),
(62, 'fa357986da80a37fab0fbad42d1cebd9', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 11:39:21', '2022-08-29 11:39:21'),
(63, '11926ac3a0b15971978572839f13d6ae', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 11:53:49', '2022-08-29 11:53:49'),
(64, '3d938215809d3c5220fb3210454cd0d3', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:00:36', '2022-08-29 12:00:36'),
(65, 'bc2c7840cd455f1d244666dd3d9d1766', NULL, NULL, 'PL', NULL, 'PL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:04:21', '2022-08-29 12:04:39'),
(66, '41f40b5c2f44360a7e54ba7545bc32d5', NULL, NULL, 'PL', NULL, 'PL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:04:26', '2022-08-29 12:04:54'),
(67, '5c69af625158321ad872217132af9478', NULL, NULL, 'PL', NULL, 'PL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:20:16', '2022-08-29 12:20:54'),
(68, '16bc6ebb2d5e93ccef877ef19230fd6e', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:29:20', '2022-08-29 12:29:37'),
(69, '05ed1ddcb0e59d3690aeb3c7c21ad09a', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:29:26', '2022-08-29 12:29:26'),
(70, '985ce01d17529a9f90caacf02e21f59d', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:32:08', '2022-08-29 12:32:08'),
(71, 'ecf03864836a1300a1bcdda8c83023df', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:32:24', '2022-08-29 12:32:24'),
(72, 'b817e20d03c22cc758cee87cfdf2ca19', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:32:25', '2022-08-29 12:32:25'),
(73, 'd38944b0a564b1ee4291106716722494', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:32:26', '2022-08-29 12:32:26'),
(74, '50b5ae89745f9ef6d9319329d50c0f3b', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:32:26', '2022-08-29 12:32:26'),
(75, '9f46afeae48136ca10de60ba6ef85161', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:32:28', '2022-08-29 12:32:28'),
(76, '52eec4e48378f0b12cea94e4afeefc55', NULL, NULL, 'US', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:32:28', '2022-08-29 12:32:28'),
(77, '292e0e235b471a56a1e5b2305af571ac', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:32:28', '2022-08-29 12:32:28'),
(78, '53774e6be31b5baf679fc5119c70666e', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:32:29', '2022-08-29 12:32:29'),
(79, 'aa86911ef29d4d65a9eb3384f3fd7ae2', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:32:32', '2022-08-29 12:32:32'),
(80, '17fe6f44292d793e29bed4ee6d67c094', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:32:33', '2022-08-29 12:32:33'),
(81, '2bd27fb140230564f5a8dcda6b706cc9', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:32:34', '2022-08-29 12:32:34'),
(82, 'be1ad18484c6dfa1506c92f2b4bf89d7', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:32:35', '2022-08-29 12:32:35'),
(83, 'deac0d39f468466e94d951e154e452f2', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:32:38', '2022-08-29 12:32:38'),
(84, '6a8006408b053a1b8275fc881db242d5', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:32:47', '2022-08-29 12:32:47'),
(85, '483282b6ecd9a0e447f2882eaf61be35', NULL, NULL, 'US', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:32:49', '2022-08-29 12:32:49'),
(86, 'c9eea1644e21d5b8b7bc9b03397726d2', NULL, NULL, 'US', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:32:58', '2022-08-29 12:32:58'),
(87, 'f2680a1df773c0e70a5ca60aa0aa41fe', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:33:00', '2022-08-29 12:33:00'),
(88, '0ab513369c8f78a517b247c682a1465b', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:33:03', '2022-08-29 12:33:03'),
(89, 'ba78ed82e4c5be59a2086d2a07fc1582', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:33:07', '2022-08-29 12:33:07'),
(90, '567872b9c1b9a6b607517f432e3cfb96', NULL, NULL, 'US', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:33:08', '2022-08-29 12:33:08'),
(91, '8252dbf6c9a92c202bc35dcae82290fd', NULL, NULL, 'US', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:33:08', '2022-08-29 12:33:08'),
(92, '2c4e27ff0fbb02c6ba6beca07cc5a446', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:33:28', '2022-08-29 12:33:28'),
(93, 'd3198f3c5a7af172b18940f2d1da3e5a', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:33:29', '2022-08-29 12:33:29'),
(94, '1fcf58fdd28349907bc37304d6924d4b', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:35:15', '2022-08-29 12:35:15'),
(95, '5e60f60ab16082a89a8f52ea90a21325', NULL, NULL, 'US', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:35:29', '2022-08-29 12:35:29'),
(96, '8cc5c25ef6cf5f43bd417ef8ee0e4d0e', NULL, NULL, 'US', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:35:34', '2022-08-29 12:35:34'),
(97, 'e5e367f2e44a4b6af858357e61f1f94d', NULL, NULL, 'US', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:35:39', '2022-08-29 12:35:39'),
(98, '14b524ccb040fd5bc041ddc8f197e025', NULL, NULL, 'US', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:35:41', '2022-08-29 12:35:41'),
(99, 'e4753b4d64c59ebcb0ea8d229e3910a6', NULL, NULL, 'US', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:36:25', '2022-08-29 12:36:25'),
(100, '1cf050ed76a9e1bc2eb9b741a20dc85e', NULL, NULL, 'US', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:37:51', '2022-08-29 12:37:51'),
(101, 'cda3dcf6e7eceba011cdb73fea0b5f72', NULL, NULL, 'US', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 12:41:37', '2022-08-29 12:41:37'),
(102, '73ca7125e2bdae7fc2499103b76a8aa4', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 13:00:31', '2022-08-29 13:00:31'),
(103, '44cbf67189d26f1c654e0d977ea11410', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 13:00:32', '2022-08-29 13:00:32'),
(104, 'd3739ae8d241cdac49de397061bde6d8', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 13:34:51', '2022-08-29 13:34:51'),
(105, '01b484a7c416308ac92ad463a9fc5307', NULL, NULL, 'DE', NULL, 'DE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 13:39:45', '2022-08-29 13:39:45'),
(106, '2258f27b232a36ba10a35ee159cd7770', NULL, NULL, 'DE', NULL, 'DE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 13:39:45', '2022-08-29 13:39:45'),
(107, '0f75f03a15a9a1baa683b3ae8fc03640', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 14:19:02', '2022-08-29 14:19:02'),
(108, '68975520c90b97bdab8c95ca95c0a8f2', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 14:51:39', '2022-08-29 14:51:39'),
(109, '5222a3e50b1222e45b45b652b4e91df9', NULL, NULL, 'DE', NULL, 'DE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 14:53:37', '2022-08-29 14:55:32'),
(110, '0d91497553fdb5ecc52d0088e02ff3a3', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 15:13:52', '2022-08-29 15:14:15'),
(111, '57f9aee8fc471d2a9066eed1c909fc44', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 15:13:58', '2022-08-29 15:13:58'),
(112, '698e2ad5c2a1b7a498875e384d6eca66', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 15:14:50', '2022-08-29 15:16:23'),
(113, '1599105a966e715f2830277525abdf16', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 15:15:55', '2022-08-29 15:15:55'),
(114, '27672f46a915af85762b07dcbc81ec6a', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 15:27:11', '2022-08-29 15:27:28'),
(115, 'e7d489d60b44fb6702a95eb360435ad2', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 15:35:39', '2022-08-29 15:35:39'),
(116, 'd1fba8a8535d86143f10fcb6f874f263', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 15:52:17', '2022-08-29 15:52:17'),
(117, '564ec95af2489c7ce3a275984af606d5', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 15:59:29', '2022-08-29 16:10:25'),
(118, '5731cb44d667b288cb5c758b235b4a3f', NULL, NULL, 'EN', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 16:05:13', '2022-08-29 16:14:49'),
(119, 'b7989469b57ab101d6fbc30c7f42f802', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 16:06:51', '2022-08-29 16:06:51'),
(120, '7dbef904a603ee0ca8756fdc3bd2c790', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 16:11:58', '2022-08-29 16:11:58'),
(121, 'a3d053aa74dad4051c3a74feebf29018', NULL, NULL, 'NG', NULL, 'NG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 16:49:21', '2022-08-29 16:49:21'),
(122, '9d85c3c99ca30342505a84355dc7f6f2', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:13:57', '2022-08-29 17:14:32'),
(123, 'e7f1b0a195eca733a9851950ae151675', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:16:44', '2022-08-29 17:16:44'),
(124, 'bf5271c4ab2e0625bbd4c0d6cdbb5f1f', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:17:47', '2022-08-29 17:17:47'),
(125, 'ef8254e34286e872eda62ec0d3e91612', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:01', '2022-08-29 17:18:01'),
(126, 'd7c612920143a35933838dd522fbbe4d', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:03', '2022-08-29 17:18:03'),
(127, 'af4e597ef12ad20c9599d8fdcb67524b', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:04', '2022-08-29 17:18:04'),
(128, '46f9c9e01150a4a37f97f00e70403f44', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:06', '2022-08-29 17:18:06'),
(129, '6a8b41125a805914a114493e900bd88b', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:07', '2022-08-29 17:18:07'),
(130, 'b7967697242f2f39cfd0e5843a919655', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:09', '2022-08-29 17:18:09'),
(131, 'c0c64dd04cdc66209b68007e46788516', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:11', '2022-08-29 17:18:11'),
(132, '3686a5df92b589428f3de3cf6635347f', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:13', '2022-08-29 17:18:13'),
(133, '9025ca032e3ff503d63bd1830be24a48', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:14', '2022-08-29 17:18:14'),
(134, '308391be7567a308a9e26c592cb52877', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:16', '2022-08-29 17:18:16'),
(135, 'a87a1794bc72a79049463cbe22dd695a', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:17', '2022-08-29 17:18:17'),
(136, '83cf9492ade14bc5170be3e3b0dabcb2', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:19', '2022-08-29 17:18:19'),
(137, 'f08e7261d0dcee8bcc29de4ace73de44', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:20', '2022-08-29 17:18:20'),
(138, 'd8e4d6e931929931d49c99ff51b7aa28', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:21', '2022-08-29 17:18:21'),
(139, '8103e18ce48ae9050ba8ce4914f28bad', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:23', '2022-08-29 17:18:23'),
(140, 'e184b1f0a905c10ca899e84a19c57712', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:25', '2022-08-29 17:18:25'),
(141, 'a243706864c5ce16d780f42257b66806', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:26', '2022-08-29 17:18:26'),
(142, 'e55cfb16973c02416eadb887dc109d17', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:27', '2022-08-29 17:18:27'),
(143, 'f8bb514baff7193329578c6aae4a0852', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:28', '2022-08-29 17:18:28'),
(144, 'b6f5a2c577e850d39ddf5b2c43161c76', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:35', '2022-08-29 17:18:35'),
(145, '1d04b46adfe2e27462873656f14e311a', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:36', '2022-08-29 17:18:36'),
(146, 'd811e556c1d4647314a454d9eac3fa7b', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:37', '2022-08-29 17:18:37'),
(147, 'b473dbb2766e3d02107ab91e2b998ef1', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:38', '2022-08-29 17:18:38'),
(148, '4382e08815ad2ac70f96d4c13560a682', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:38', '2022-08-29 17:18:38'),
(149, '839d612e3123f8617b09761417235906', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:39', '2022-08-29 17:18:39'),
(150, 'dac9260e3ba2431b38ef74dc7f866079', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:40', '2022-08-29 17:18:40'),
(151, '9f823624b030b128020eadc82583077e', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:41', '2022-08-29 17:18:41'),
(152, '5a8809e0492027008b7ac550264bf714', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:43', '2022-08-29 17:18:43'),
(153, 'e5b67fa9c0ad8579522ea10c0ed74a2b', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:44', '2022-08-29 17:18:44'),
(154, 'adec8d9169b86fa6aa9256cef86792a2', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:44', '2022-08-29 17:18:44'),
(155, '93aae31cf868e2e6754aa90e219a2f44', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:45', '2022-08-29 17:18:45'),
(156, 'f748d143c78dff3df229ee33e9fbaa07', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:45', '2022-08-29 17:18:45'),
(157, '83a0bada8b695ea24913036d2735a830', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:46', '2022-08-29 17:18:46'),
(158, '3f5a49f3028ec2c922fbeb7b9b21cb11', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:46', '2022-08-29 17:18:46'),
(159, 'c8472d6e868792a1c0c6ade9f2aa8164', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:47', '2022-08-29 17:18:47'),
(160, '14b6bd99a31a114b518d0fbfef321f61', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:48', '2022-08-29 17:18:48'),
(161, '58321e0991ce89bd12e8d7c4d7d94138', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:48', '2022-08-29 17:18:48'),
(162, '3f955bfad71b77441fa6c9fd9397966c', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:49', '2022-08-29 17:18:49'),
(163, '71fbe71187bfc2ffad0dd0ff457bd1f0', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:52', '2022-08-29 17:18:52'),
(164, '5c6f640c5d1c98b011061d0bac7aae3e', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:53', '2022-08-29 17:18:53'),
(165, '97c36afd60b179b1309fed135ae60d54', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:53', '2022-08-29 17:18:53'),
(166, '60f5fed328877e651114b00747aa5594', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:54', '2022-08-29 17:18:54'),
(167, '8bb0f799b6d5e5cef763abba24072108', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:54', '2022-08-29 17:18:54'),
(168, '5c2a1d079bac83cea63a191b4859f0eb', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:55', '2022-08-29 17:18:55'),
(169, '75338358c73ceeede6fc9d84cd90054b', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:55', '2022-08-29 17:18:55'),
(170, '23118dab5bd13ddc56e7d6edaac1dae7', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:55', '2022-08-29 17:18:55'),
(171, '55bf02d9edbf6d76b62d79b904f6544e', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:56', '2022-08-29 17:18:56'),
(172, '3b2257a8cd7199ae33230c75d745563b', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:56', '2022-08-29 17:18:56'),
(173, 'b35dff697e7c3b541ef7903acf7f371e', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:57', '2022-08-29 17:18:57'),
(174, 'e7b9348784fc27fa83bdc0f4671b4398', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:57', '2022-08-29 17:18:57'),
(175, 'da97e969011db9039c2c9bef2c5e2e86', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:58', '2022-08-29 17:18:58'),
(176, '1e5ce98e63a6923d81dd5ad21c726662', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:58', '2022-08-29 17:18:58'),
(177, 'e3ae385040ecedf837c165b845608ce4', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:59', '2022-08-29 17:18:59'),
(178, 'd26a3fbe22d0f9957e77a188d14746b4', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:59', '2022-08-29 17:18:59'),
(179, '0d6d060a6f5cd2eb06d2740426196d83', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:18:59', '2022-08-29 17:18:59'),
(180, '8fb19d941d7793670d8f81bcf90f17c5', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:00', '2022-08-29 17:19:00'),
(181, '2cd09d633b3de451118702e14fdc3a0b', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:00', '2022-08-29 17:19:00'),
(182, 'e8e96f899aa0b66b63928ad543a2ffe9', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:01', '2022-08-29 17:19:01'),
(183, '2bff63995959ee93bfd85badb2f5f29f', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:01', '2022-08-29 17:19:01'),
(184, '1f43a2e6209226bdb1806160defd97cf', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:02', '2022-08-29 17:19:02'),
(185, 'e09fed483230e68f019f7d89f9e421b0', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:03', '2022-08-29 17:19:03'),
(186, '928c761ed454a3c14e1d0048838b8fa8', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:04', '2022-08-29 17:19:04'),
(187, 'ba6eadbc3c3e1e4f9c61305970e324bd', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:04', '2022-08-29 17:19:04'),
(188, 'e681f4437de12d0722de97688496e27e', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:04', '2022-08-29 17:19:04'),
(189, '5efa78b4ea2cecc1bd35061c3653d822', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:05', '2022-08-29 17:19:05'),
(190, '44b6af6de571db6cef5095aab170f060', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:05', '2022-08-29 17:19:05'),
(191, '17f06a477fd659f912355a994018db08', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:07', '2022-08-29 17:19:07'),
(192, '6b25748ccf5f238b740c97de4b1bf490', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:07', '2022-08-29 17:19:07'),
(193, '2d4640f75a089debec5373131ea4d553', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:07', '2022-08-29 17:19:07'),
(194, '3c36fa15ed2cd2aa45d20d622e25bb6b', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:08', '2022-08-29 17:19:08'),
(195, '7cebfeb7451dd110a8bd0bbc1caa35f4', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:09', '2022-08-29 17:19:09'),
(196, '9334a7bf08826f1d894c13c3dde06ca4', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:10', '2022-08-29 17:19:10'),
(197, 'd6a46e6b4e10fe855894e322f23b3a91', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:10', '2022-08-29 17:19:10'),
(198, '645fab26d614d77653914ddeaae168ba', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:12', '2022-08-29 17:19:12'),
(199, 'ead4153e43c53c3995e0b4e9b11c8ffa', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:12', '2022-08-29 17:19:12'),
(200, '08db57d652ffd8e8a1934cb51b275fe7', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:14', '2022-08-29 17:19:14'),
(201, '82d684f4ed41890a4516b9f5f83ffd92', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:17', '2022-08-29 17:19:17'),
(202, '8e65eceac8bc0a8cb85a2340150beafd', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:18', '2022-08-29 17:19:18'),
(203, 'b95c36ad0a24291719082f2629afb7e6', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:19', '2022-08-29 17:19:19'),
(204, 'da739d733f4bdebefc7b7f48358ea907', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:20', '2022-08-29 17:19:20'),
(205, '88b1ca549d2c539d8e29c39110b0e0b6', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:21', '2022-08-29 17:19:21'),
(206, 'f967d81f6e52c660a85c51fc776def2b', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:21', '2022-08-29 17:19:21'),
(207, '5495c8004bc1e78ed80fd7a7aa8fc01d', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:22', '2022-08-29 17:19:22'),
(208, 'c04d8e11c2edb53011d5c34ac331171e', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:22', '2022-08-29 17:19:22'),
(209, 'd1068d86f28b2a0be247053bef7380c1', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:22', '2022-08-29 17:19:22'),
(210, 'aeba94dda02f0e33946eb74416cc2c99', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:23', '2022-08-29 17:19:23'),
(211, '8b4469f88037e88f746b0d81557cb30a', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:23', '2022-08-29 17:19:23'),
(212, 'd96dc198a5962ff28d8387ae0345dd21', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:23', '2022-08-29 17:19:23'),
(213, '689491ab73c363f7496a85ae16cb126c', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:24', '2022-08-29 17:19:24'),
(214, '1d7653b76c4fc4e2c158671c0cf471fd', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:24', '2022-08-29 17:19:24'),
(215, '02aa8d3f09419a1a70c5fcc5c52b767d', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:24', '2022-08-29 17:19:24'),
(216, '10a38fe9588488b319d247d807602f5c', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:25', '2022-08-29 17:19:25'),
(217, 'e31c034ced413c48dcce4c8b5bb31be0', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:26', '2022-08-29 17:19:26'),
(218, 'd979a06e8a5459bc7fe70e4b57e149f0', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:26', '2022-08-29 17:19:26'),
(219, '177ef302954c075f50adb7d71e312eb6', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:27', '2022-08-29 17:19:27'),
(220, 'f0bb45adf031f0849888c39d19ef03c2', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:27', '2022-08-29 17:19:27'),
(221, '4998c234222e48d77fdd258d1a902a94', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:28', '2022-08-29 17:19:28'),
(222, '3c1f3fcb5e7d8e7231dcac8998f23e31', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:29', '2022-08-29 17:19:29'),
(223, '8fcda32eb0239a1afe6b83333da1eac3', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:47', '2022-08-29 17:19:47'),
(224, '64a2f97d63bdda60bae7475169e67b90', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:47', '2022-08-29 17:19:47'),
(225, 'd0882d4c989d7093a9ea9dd492691446', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:48', '2022-08-29 17:19:48'),
(226, '9e4e206314403eb0e255e4f02aa1a40d', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:48', '2022-08-29 17:19:48'),
(227, '7fec613ebfe09cef711c2cace9584b35', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:50', '2022-08-29 17:19:50'),
(228, '55e5bafe79c5d2ef48d502970bad8ba4', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:50', '2022-08-29 17:19:50'),
(229, 'd18019c0b474258e8b2b9fb1b40a6197', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:50', '2022-08-29 17:19:50'),
(230, 'c94c2c818830fb74e425eac389b5f8fd', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:51', '2022-08-29 17:19:51'),
(231, '7d8cc84cb073d1e0f0f6ee135f888293', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:51', '2022-08-29 17:19:51'),
(232, '3f04ed756278c03a9e2e5afa6bb51125', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:19:51', '2022-08-29 17:19:51'),
(233, '3f13d83328db78bc8e2440e0a40b071c', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:20:19', '2022-08-29 17:20:19'),
(234, 'a34390cfe7b94c1cf66994ac57b7a92d', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:20:19', '2022-08-29 17:20:19'),
(235, '7e4def2e304f6973850887f4a59cf9b4', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:20:21', '2022-08-29 17:20:21'),
(236, '0d5ea5e9c21bb334eacccd2dfc78396f', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:22:22', '2022-08-29 17:22:22'),
(237, 'c34ee276dae893149e75f8df33dd4396', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:22:44', '2022-08-29 17:22:44'),
(238, '2915ccb22b8a8d9fc9d219ff509b830d', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:23:06', '2022-08-29 17:23:06'),
(239, '8f24e22a015c5e16cb620db938e73233', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:23:06', '2022-08-29 17:23:06'),
(240, '5492265239e2ac5add10bdd367f341d8', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:23:06', '2022-08-29 17:23:06'),
(241, 'e30d7d027a193d413b9b8bb8cf54ce4d', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:23:07', '2022-08-29 17:23:07'),
(242, '4d364ce5786fadc02862dd271acc6fbf', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:23:07', '2022-08-29 17:23:07'),
(243, 'fbe1c1c72116c9d1af8041a28e361e4f', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:23:07', '2022-08-29 17:23:07'),
(244, '2bf574637f75cc8a35b030b30c14e7e3', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:23:09', '2022-08-29 17:23:09'),
(245, 'e97190b895ff366d8ff251c35dacd95d', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:23:09', '2022-08-29 17:23:09'),
(246, 'e236715f7a0854fda3f9a4bb6bcec726', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:23:09', '2022-08-29 17:23:09'),
(247, '3dc7355ad5b14b4541bb21667b43c8f8', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:23:10', '2022-08-29 17:23:10'),
(248, '2183c6bb7a490ecdf8607ce84eec3abb', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:23:10', '2022-08-29 17:23:10'),
(249, 'e0dcb58e0913f8e27492636accd13942', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:23:37', '2022-08-29 17:23:37'),
(250, '123efd4d51000c019cbc3b8cf3fb1c93', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:24:50', '2022-08-29 17:24:50'),
(251, '528bbc04e8263f6398ee0d5295370bfb', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:25:45', '2022-08-29 17:25:45'),
(252, 'd7b93afbfcb37d3371c3a21aaf5b2088', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:26:09', '2022-08-29 17:26:09'),
(253, '5e858be42f0d0398d31e04b438a48eba', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:27:34', '2022-08-29 17:27:34'),
(254, '63f1ead5f25e844396660e50d04d2ffc', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:27:50', '2022-08-29 17:27:50'),
(255, '5a6e7598c6a23af9f57e733173dc5a16', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:28:35', '2022-08-29 17:28:35'),
(256, '613873b21a66f32c1906b2c53480704e', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:28:35', '2022-08-29 17:28:35'),
(257, 'a721dc09d10d7f70e85a0756291def2d', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:28:40', '2022-08-29 17:28:40'),
(258, '313f21fec9c738453bae3aca26731c29', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:29:11', '2022-08-29 17:29:11'),
(259, 'a2d7bfa18e7242595b221d7b003dc870', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:29:23', '2022-08-29 17:29:23'),
(260, 'c6d384d908d04c1dc0d686ce04ee8646', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:32:08', '2022-08-29 17:32:08'),
(261, '4ee0e4dcf96e0c1ac9f5c7d4620acbe1', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:32:12', '2022-08-29 17:32:12'),
(262, 'c4262218229621305386c540beee88ec', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:32:28', '2022-08-29 17:32:28'),
(263, 'e220316961a7153bd5b5794241853e24', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:34:22', '2022-08-29 17:34:22'),
(264, '95263828025a9d5b486a5c54387b8f11', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:37:26', '2022-08-29 17:37:26'),
(265, 'a7f07d28e870aa13ec9163b76f1fe8dd', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:39:09', '2022-08-29 17:39:09'),
(266, '26022f7fd4673fe85abe2ff162594fcf', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:50:12', '2022-08-29 17:50:12'),
(267, '4b4684b627f1bc3d1abb98acabf3af63', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 17:57:50', '2022-08-29 17:57:50'),
(268, '0706c0039fcb892b135252ce1cdcfca4', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 18:01:55', '2022-08-29 18:01:55'),
(269, '28d1ed6005995877766de919608f82d2', NULL, NULL, 'FR', NULL, 'FR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 18:06:39', '2022-08-29 18:06:39'),
(270, '801f8169dfdeb99aef1dd436942e382a', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 18:08:01', '2022-08-29 18:09:05'),
(271, '77646437e4c8a78c3a5c5716b89f6840', NULL, NULL, 'GB', NULL, 'GB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 18:13:37', '2022-08-29 18:13:37'),
(272, '64e9e7aa9368999d0d5a5d6c8a6320a3', NULL, NULL, 'PL', NULL, 'PL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 18:14:52', '2022-08-29 18:15:00'),
(273, 'cd256f78af316632fba2a0b1ad14641f', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 18:22:48', '2022-08-29 18:22:48'),
(274, '56d9336e883952d0dca9698032d5568c', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 18:23:39', '2022-08-29 18:23:39'),
(275, 'b3d4be6ec196075ed100ca2e13e70813', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 18:27:37', '2022-08-29 18:27:37'),
(276, 'b1e5d5bf9a8aa21ee50c449136f62eee', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 18:56:50', '2022-08-29 18:56:50'),
(277, 'ddd88c96d529af92b61f606e2c9971f1', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 19:07:08', '2022-08-29 19:07:08'),
(278, 'b63610511bfcd780629d57921a2b8f5d', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 19:07:09', '2022-08-29 19:07:09'),
(279, 'eab0efd5a8010003a955e0352f99f022', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 19:07:09', '2022-08-29 19:07:09'),
(280, 'd20acb2e7980f5ab0fb4e55c204910a0', NULL, NULL, 'US', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 19:07:10', '2022-08-29 19:07:10'),
(281, '0213ab98fea981b4a8b2d6b3b95faeab', NULL, NULL, 'US', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 19:07:10', '2022-08-29 19:07:10'),
(282, '30b5dd154ce3a42cf0513f0a8658339d', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 19:07:11', '2022-08-29 19:07:11'),
(283, 'bf3192310e4dedb6ffffabbca461f103', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 19:07:11', '2022-08-29 19:07:11'),
(284, 'ee9de2a0af7c086302c40524a538545e', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 19:07:12', '2022-08-29 19:07:12'),
(285, 'cf950150f817a9dace8c629411bd42a0', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 19:07:12', '2022-08-29 19:07:12'),
(286, 'c4838fedba0ee99c1ba3c52dd19a2648', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 19:07:13', '2022-08-29 19:07:13'),
(287, '56a6b9a406698c00dfe89372d10bcf99', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 19:07:16', '2022-08-29 19:07:16'),
(288, 'fd8434fc69c99421a58f79ea547f4247', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 19:07:19', '2022-08-29 19:07:19'),
(289, 'c2d53332dd36083cec9cf005b704b9cd', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 19:07:20', '2022-08-29 19:07:20'),
(290, '526f70f4f95e40ddcf6155c44698dc04', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 19:07:23', '2022-08-29 19:07:23'),
(291, '92f5f18b5928b766f8f2a87400c9faa3', NULL, NULL, 'IT', NULL, 'IT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 19:07:33', '2022-08-29 19:08:20'),
(293, '2201dcfc9a87380114402b223b6c09a5', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 19:54:00', '2022-08-29 19:56:52');
INSERT INTO `users` (`id`, `session_id`, `first_name`, `second_name`, `country`, `billing_country`, `lang`, `phone`, `email`, `instagram`, `address`, `apartment`, `city`, `region`, `zip_code`, `additions`, `password`, `role`, `temp`, `orders`, `created_at`, `changed_at`) VALUES
(294, '29380489351bfaff5482fd0460632a50', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 21:24:08', '2022-08-29 21:24:08'),
(295, '7008be33d98c1dd7fb8353419d01a9de', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 21:31:09', '2022-08-29 21:40:23'),
(296, 'a8e142ffc9e1596a26b83338777eb16d', NULL, NULL, 'US', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 21:36:55', '2022-08-29 21:47:50'),
(297, 'd8c4c35211164dbd3e52ea3d547b92d5', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 21:44:48', '2022-08-29 21:44:48'),
(298, '722393da41270f026a1b323ed8a29b96', NULL, NULL, 'FR', NULL, 'FR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 22:01:23', '2022-08-29 22:02:31'),
(299, 'da42cc9d202165406134bd2ddad2fe0a', NULL, NULL, 'FR', NULL, 'FR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-29 22:11:08', '2022-08-29 22:14:29'),
(300, 'a0f305b5a189191c2b1eacebd5c64c08', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 00:10:52', '2022-08-30 00:10:52'),
(301, '16105054501c1f71bb1425a60400d90a', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 00:21:34', '2022-08-30 00:21:34'),
(302, 'c982aae7351a9dbe2ab4600a1fd29623', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 00:29:32', '2022-08-30 00:39:45'),
(303, 'ac2c1288e90b1c158c181b34962ae7d2', NULL, NULL, 'US', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 00:34:21', '2022-08-30 00:42:39'),
(304, '7caef08200828d90f7f2716fe409a01a', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 01:01:54', '2022-08-30 01:01:54'),
(305, '93f4924fc9d5d7e58f25ebd72fc886aa', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 02:04:43', '2022-08-30 02:04:43'),
(306, 'c1b9ef6441562cca7676502ac555429f', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 03:00:11', '2022-08-30 03:00:11'),
(307, '3f46682f2a9a64ecbc60104460db2091', 'CmlXKGQft', 'alFCyQjUwPR', 'TH', 'JP', 'TH', '3170896085', 'lpaulette8g765w93lzy@outlook.com', 'jOleuKfyRcJsbAB', 'AHYEPMcuVdb', 'dXRkxaKJEqf', 'ScdqoeKFtL', 'YpeiJtDQlAPMFUSg', 'tcdIRFgoKOj', 'shZAiRrID', '8473256e6f12f720a323ecf1733e7af0', 'authorize', 0, 0, '2022-08-30 03:22:26', '2022-08-30 03:22:45'),
(308, '291e15560192430124800d7415343ca0', NULL, NULL, 'FR', NULL, 'FR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 04:23:51', '2022-08-30 04:23:51'),
(309, '0094ca776ed1a0b116fbd8621831ecea', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 05:30:25', '2022-08-30 05:31:03'),
(310, '23bc34d7f409c5106c2a7d407271c004', NULL, NULL, 'NO', NULL, 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 05:31:15', '2022-08-30 05:31:15'),
(311, '52b38913cf280497ad035b8f7e752b11', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 05:35:18', '2022-08-30 05:35:18'),
(312, 'ed782a97e4d9be88103dd2193596bfbe', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 05:38:09', '2022-08-30 05:50:59'),
(313, 'b5f1950241a1a16bfd1d3cda7ae8f0aa', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 05:42:32', '2022-08-30 05:42:32'),
(314, 'e63b19935690d45cf957e1c629e8fa34', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 05:44:00', '2022-08-30 05:44:00'),
(315, '2b2e5bf7fd656ff8d9af9d22a02a3919', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 06:06:21', '2022-08-30 06:06:21'),
(316, 'a6db669aeac144148dccbefa127068c7', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 06:06:23', '2022-08-30 06:06:23'),
(317, 'c354c37ff88c803a528b0efbfe0280d6', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 06:06:27', '2022-08-30 06:06:27'),
(318, 'fac39772dba6ef9c0cf2b8dbb3d03523', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 06:06:30', '2022-08-30 06:06:30'),
(319, '4a794f67d2b20e5a5812872dafe2e985', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 06:06:51', '2022-08-30 06:06:51'),
(320, '9233c5092c3e5f9706b2eade11c41acc', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 06:06:58', '2022-08-30 06:06:58'),
(321, '5fe634c7996b075fc402c8baff138775', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 06:28:15', '2022-08-30 10:31:48'),
(322, '96877a939c8d5e1cf1a2aaa61fa8e309', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 07:05:53', '2022-08-30 07:05:53'),
(323, '3cb65b88682c155c21ca5426f9ef00a6', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 07:06:02', '2022-08-30 07:06:02'),
(324, 'e2cd8c60afd7f958551906e200f17ff5', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 07:06:04', '2022-08-30 07:06:04'),
(325, '926f86cc6fec84f7fd2f0189ada6cbed', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 07:06:15', '2022-08-30 07:06:15'),
(326, '32d11a60e85d7cca9bdc8aa33677f5ea', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 07:06:19', '2022-08-30 07:06:19'),
(327, '3c185c7bf842c119952b4a74bf8c17e5', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 07:06:30', '2022-08-30 07:06:30'),
(328, '4e209c09543d484fd9e07375edc2e2ea', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 07:06:35', '2022-08-30 07:06:35'),
(329, '462b5429b67f38013c66948695810727', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 07:06:45', '2022-08-30 07:06:45'),
(330, 'bb9317ad756a4d9b54e75df612e74719', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 07:07:00', '2022-08-30 07:07:00'),
(332, '7bc50a0d336652ac254062cff6f9c986', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 08:46:17', '2022-08-30 08:46:33'),
(333, '02f93188434f906ceecb3ae2195a5e0f', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 09:01:49', '2022-08-30 09:01:49'),
(334, 'b702f47203b5c39ba85b807f767ab07e', NULL, NULL, 'DE', NULL, 'DE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 09:22:40', '2022-08-30 09:36:25'),
(335, '972967ee04c20d55ebf908a0f40b549f', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 09:22:55', '2022-08-30 09:22:55'),
(336, '85217ea9dacfb2e9aa4a7db44816de2c', NULL, NULL, 'PL', NULL, 'PL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 10:08:21', '2022-08-30 10:09:51'),
(337, 'bbd1689c06d00a2b51a4b9ee00db1bfe', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 11:19:39', '2022-08-30 11:19:39'),
(338, '9af83afadc252b42536652e79fc0961c', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 11:19:39', '2022-08-30 11:19:39'),
(339, '1c85b6b9f5654dfd6237cf16b6da224d', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 11:19:49', '2022-08-30 11:22:27'),
(340, '718ccc25d2807b48d41c3df016fe0217', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 11:19:49', '2022-08-30 11:19:49'),
(341, '78fa516c9be0c13b3ade8a4d90546f0f', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 11:54:10', '2022-08-30 11:54:34'),
(342, 'ffc7ccbe8390d8943c9d53ec38be5bbd', NULL, NULL, 'IE', NULL, 'IE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 12:15:32', '2022-08-30 12:15:32'),
(343, 'c31992777bf7142c374533a0f2dc6d53', NULL, NULL, 'CN', NULL, 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 12:33:23', '2022-08-30 12:33:23'),
(344, '658a5d8a431fe47ab3e66d6749edc60a', NULL, NULL, 'FR', NULL, 'FR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 12:34:05', '2022-08-30 12:36:46'),
(345, 'c4b4d48f6e800e21b646189dfd5bd9d3', NULL, NULL, 'DE', NULL, 'DE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 12:43:32', '2022-08-30 12:44:04'),
(346, '11ab8da9e9e0767bfad7745e198f0ed6', NULL, NULL, 'DE', NULL, 'DE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 12:45:10', '2022-08-30 12:47:59'),
(347, 'a3b6debf19e6f0d5beec7239f83999a5', NULL, NULL, 'DE', NULL, 'DE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 12:46:33', '2022-08-30 12:46:33'),
(348, 'a586a257415d96c630b1b2d4b42e3b3c', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 13:16:39', '2022-08-30 13:16:39'),
(349, 'c876a1d5fc1ede722f57a2dff14b7b20', NULL, NULL, 'DE', NULL, 'DE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 13:26:38', '2022-08-30 13:26:38'),
(350, '1ff02956ea50d8953916dce6b07a9647', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 13:55:16', '2022-08-30 13:55:16'),
(351, '06cc651d5a22f2cf6fe1316bc0f8cce3', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 14:22:38', '2022-08-30 14:23:47'),
(352, 'ff1206380db01e56284198820362bf5a', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 14:26:24', '2022-08-30 14:26:24'),
(353, 'b7c024c5e2e7b90ba6c2f964fdb82976', NULL, NULL, 'GB', NULL, 'GB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 14:51:52', '2022-08-30 14:52:50'),
(354, '49a01d2e60644e86281b583a2900c3c0', NULL, NULL, 'IT', NULL, 'IT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 15:03:51', '2022-08-30 15:04:32'),
(355, '1eea53d32f0a6b8675889a3ee80af8e7', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 16:10:44', '2022-08-30 16:10:44'),
(356, '615658fc267a102e49f0f6149f52daed', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 16:11:24', '2022-08-30 16:13:03'),
(357, 'cb0df116aed51ab418fdcedd0386f5f5', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 16:24:44', '2022-08-30 16:24:44'),
(358, '43c3a80dafad5288db843f63a220b6d3', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 16:31:48', '2022-08-30 16:40:15'),
(359, 'bbd1063845858d1160f44e048a33530b', NULL, NULL, 'US', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 16:37:22', '2022-08-30 16:47:10'),
(360, 'ab3b65a7b1bcadc2081ab0c6585e98df', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 16:43:24', '2022-08-30 16:43:24'),
(361, 'b781d59a561f2014d484abd2d358bb39', NULL, NULL, 'IL', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 17:39:13', '2022-08-30 17:39:53'),
(362, '6b001f4c289f79bae155ca0e4d8a0d66', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 18:51:28', '2022-08-30 18:51:28'),
(363, 'cc69978416d182af7dd49846233f8465', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 18:56:40', '2022-08-30 18:56:40'),
(364, 'bafc7b062c520eb78f7b659d70b4250e', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 18:58:19', '2022-08-30 19:07:27'),
(365, '86718f9768dad2d51cafbc35c4f2d88e', NULL, NULL, 'US', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 19:03:43', '2022-08-30 19:12:21'),
(366, '8204eebb654b5f2c756499915a9793cb', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 19:06:27', '2022-08-30 19:10:56'),
(367, '7018ba938cacfb057dfd9ff0dfc676db', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 19:09:16', '2022-08-30 19:09:16'),
(368, 'c3090fb4aa9187ee06e159df5822321e', NULL, NULL, 'AT', NULL, 'AT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 19:34:06', '2022-08-30 19:35:17'),
(369, '12b942e8266b7810c7666baad14a5050', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 19:45:47', '2022-08-30 19:45:47'),
(370, '5afb0002aa9eb9f09e91aab4292523c9', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 19:52:48', '2022-08-30 19:52:48'),
(371, '52ec7ae1097ed2ce0aa643da83401571', NULL, NULL, 'ZA', NULL, 'ZA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 19:59:03', '2022-08-30 19:59:21'),
(372, 'ab3c9e11867cf2f71a2d714f250419e7', NULL, NULL, 'LV', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 20:18:54', '2022-08-30 20:20:22'),
(373, 'e58308bfef5e7e43c06c1128973729fd', NULL, NULL, 'LV', NULL, 'LV', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 20:20:34', '2022-08-30 20:20:34'),
(374, '7bff339f757d48cbd445e93d2f4b6c4d', NULL, NULL, 'LV', NULL, 'LV', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-30 20:20:34', '2022-08-30 20:20:34');

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `orders_status`
--
ALTER TABLE `orders_status`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `products_properties`
--
ALTER TABLE `products_properties`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=375;

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
