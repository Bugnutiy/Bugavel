-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 21 2021 г., 20:50
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `magazin`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cart`
--

CREATE TABLE `cart` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `quantity` decimal(19,3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `changed_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `property_id`, `quantity`, `created_at`, `changed_at`) VALUES
(30, 27, 3, 5, '1.000', '2021-01-15 14:13:04', '2021-01-15 14:13:04'),
(36, 28, 9, 16, '1.000', '2021-01-16 13:35:24', '2021-01-16 13:35:42');

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `properties_id` int(11) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `icon` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `changed_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `properties_id`, `parent`, `icon`, `created_at`, `changed_at`) VALUES
(2, 'Корма для кошек', 1, NULL, NULL, '2020-12-27 18:21:42', '2021-01-02 17:38:44'),
(4, 'Корма для собак', 1, NULL, NULL, '2021-01-01 18:49:28', '2021-01-02 17:38:50');

-- --------------------------------------------------------

--
-- Структура таблицы `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `query` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `changed_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `log`
--

INSERT INTO `log` (`id`, `user_id`, `query`, `created_at`, `changed_at`) VALUES
(1, 44, 'UPDATE `Корм для кошек и собак` SET `product_id` = \'5\', `Производитель` = \'Applaws\', `Тип корма` = \'сухой\', `Возраст животного` = \'котята (до 1 года)\', `Холистик` = \'1\', `Особые потребности` = \'беззерновой\', `Ветеринарная диета` = \'\', `Тип упаковки` = \'Мешок\', `Вкус` = \'Курица\', `Основной ингредиент` = \'птица\', `Текстура` = \'Сухие гранулы\', `Вес` = \'7.5\', `Гарнир` = \'овощи\', `Лечебный` = \'0\', `Порода` = \'\', `цена` = \'2824.00\', `закупочная цена` = \'2503.00\', `количество` = \'56\' WHERE `id` = 12', '2021-01-21 15:53:55', '2021-01-21 15:53:55'),
(2, 44, 'UPDATE `products` SET `average_price` = \'2824\' WHERE `id` = \'5\'', '2021-01-21 15:53:55', '2021-01-21 15:53:55'),
(3, 44, 'UPDATE `Корм для кошек и собак` SET `product_id` = \'7\', `Производитель` = \'Purina ONE\', `Тип корма` = \'сухой\', `Возраст животного` = \'взрослые (1-6 лет)\', `Холистик` = \'0\', `Особые потребности` = \'для вывода шерсти\', `Ветеринарная диета` = \'\', `Тип упаковки` = \'zip-пакет\', `Вкус` = \'курица\', `Основной ингредиент` = \'птица\', `Текстура` = \'Сухие гранулы\', `Вес` = \'0.085\', `Гарнир` = \'злаки\', `Лечебный` = \'0\', `Порода` = \'\', `цена` = \'35.6\', `закупочная цена` = \'30.00\', `количество` = \'2000\' WHERE `id` = 14', '2021-01-21 15:54:03', '2021-01-21 15:54:03'),
(4, 44, 'UPDATE `products` SET `average_price` = \'2463.8\' WHERE `id` = \'7\'', '2021-01-21 15:54:03', '2021-01-21 15:54:03'),
(5, 44, 'UPDATE `Корм для кошек и собак` SET `product_id` = \'7\', `Производитель` = \'Purina ONE\', `Тип корма` = \'сухой\', `Возраст животного` = \'взрослые (1-6 лет)\', `Холистик` = \'0\', `Особые потребности` = \'для вывода шерсти\', `Ветеринарная диета` = \'\', `Тип упаковки` = \'zip-пакет\', `Вкус` = \'курица\', `Основной ингредиент` = \'птица\', `Текстура` = \'Сухие гранулы\', `Вес` = \'15.000\', `Гарнир` = \'злаки\', `Лечебный` = \'0\', `Порода` = \'\', `цена` = \'4892.00\', `закупочная цена` = \'4520.00\', `количество` = \'244\' WHERE `id` = 13', '2021-01-21 15:54:16', '2021-01-21 15:54:16'),
(6, 44, 'UPDATE `products` SET `average_price` = \'2463.8\' WHERE `id` = \'7\'', '2021-01-21 15:54:16', '2021-01-21 15:54:16'),
(7, 44, 'UPDATE `Корм для кошек и собак` SET `product_id` = \'8\', `Производитель` = \'Bozita\', `Тип корма` = \'влажный\', `Возраст животного` = \'взрослые (1-6 лет)\', `Холистик` = \'0\', `Особые потребности` = \'\', `Ветеринарная диета` = \'\', `Тип упаковки` = \'Tetra Pak\', `Вкус` = \'с мясом лося\', `Основной ингредиент` = \'птица\', `Текстура` = \'мягкие гранулы\', `Вес` = \'0.37\', `Гарнир` = \'\', `Лечебный` = \'0\', `Порода` = \'\', `цена` = \'212.00\', `закупочная цена` = \'140.00\', `количество` = \'55\' WHERE `id` = 15', '2021-01-21 15:54:25', '2021-01-21 15:54:25'),
(8, 44, 'UPDATE `products` SET `average_price` = \'212\' WHERE `id` = \'8\'', '2021-01-21 15:54:25', '2021-01-21 15:54:25'),
(9, 44, 'INSERT INTO `Корм для кошек и собак` (`product_id`, `Производитель`, `Тип корма`, `Возраст животного`, `Холистик`, `Особые потребности`, `Ветеринарная диета`, `Тип упаковки`, `Вкус`, `Основной ингредиент`, `Текстура`, `Вес`, `Гарнир`, `Лечебный`, `Порода`, `цена`, `закупочная цена`, `количество`) VALUES (\'3\', \'Royal Canin\', \'Cухой\', \'взрослые (1-6 лет)\', \'0\', \'для стерилизованных/кастрированных\', \'\', \'zip-пакет\', \'курица\', \'птица\', \'Сухие гранулы\', \'0.5\', \'злаки\', \'0\', \'\', \'400\', \'300\', \'280\')', '2021-01-21 16:26:47', '2021-01-21 16:26:47'),
(10, 44, 'UPDATE `products` SET `average_price` = \'1718.5\' WHERE `id` = \'3\'', '2021-01-21 16:26:47', '2021-01-21 16:26:47'),
(11, 44, 'UPDATE `Корм для кошек и собак` SET `product_id` = \'3\', `Производитель` = \'Royal Canin\', `Тип корма` = \'Cухой\', `Возраст животного` = \'взрослые (1-6 лет)\', `Холистик` = \'0\', `Особые потребности` = \'для стерилизованных/кастрированных\', `Ветеринарная диета` = \'\', `Тип упаковки` = \'zip-пакет\', `Вкус` = \'курица\', `Основной ингредиент` = \'птица\', `Текстура` = \'Сухие гранулы\', `Вес` = \'10.000\', `Гарнир` = \'злаки\', `Лечебный` = \'0\', `Порода` = \'\', `цена` = \'4900.00\', `закупочная цена` = \'4483.00\', `количество` = \'860\' WHERE `id` = 7', '2021-01-21 16:27:11', '2021-01-21 16:27:11'),
(12, 44, 'UPDATE `products` SET `average_price` = \'1721\' WHERE `id` = \'3\'', '2021-01-21 16:27:11', '2021-01-21 16:27:11'),
(13, 44, 'INSERT INTO `products` (`name`,`category_id`,`description`,`photos`) VALUES (\'Tesst\',\'4\',\'efgvjjkl\',\'[]\')', '2021-01-21 16:27:50', '2021-01-21 16:27:50'),
(14, 44, 'DELETE FROM `products` WHERE  `id` = \'14\'', '2021-01-21 16:33:38', '2021-01-21 16:33:38'),
(15, 44, 'UPDATE `Корм для кошек и собак` SET `product_id` = \'3\', `Производитель` = \'Royal Canin\', `Тип корма` = \'Cухой\', `Возраст животного` = \'взрослые (1-6 лет)\', `Холистик` = \'0\', `Особые потребности` = \'для стерилизованных/кастрированных\', `Ветеринарная диета` = \'\', `Тип упаковки` = \'zip-пакет\', `Вкус` = \'курица\', `Основной ингредиент` = \'птица\', `Текстура` = \'Сухие гранулы\', `Вес` = \'0.5\', `Гарнир` = \'злаки\', `Лечебный` = \'0\', `Порода` = \'\', `цена` = \'400.00\', `закупочная цена` = \'300.00\', `количество` = \'280\' WHERE `id` = 21', '2021-01-21 16:40:55', '2021-01-21 16:40:55'),
(16, 44, 'UPDATE `products` SET `average_price` = \'1721\' WHERE `id` = \'3\'', '2021-01-21 16:40:55', '2021-01-21 16:40:55');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `state` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'Новый',
  `payment_state` tinyint(1) DEFAULT 0,
  `canceled` tinyint(1) DEFAULT 0,
  `info_method` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_method` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_time` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apartment` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `cost` decimal(19,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `changed_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `state`, `payment_state`, `canceled`, `info_method`, `delivery_method`, `delivery_time`, `user_name`, `phone`, `email`, `address`, `apartment`, `additions`, `comment`, `cart`, `cost`, `created_at`, `changed_at`) VALUES
(1, 44, 'Выполнен', 1, 0, 'Звонок оператора', 'Самовывоз', '', 'FKWEBk', '+7(978)482-93-38', '', 'qahfwl;ha', '', '', '', '{\"73\":{\"user_id\":\"44\",\"product_id\":\"3\",\"property_id\":\"7\",\"quantity\":\"1.000\",\"created_at\":\"2021-01-20 19:04:34\",\"changed_at\":\"2021-01-20 19:04:34\"}}', '4890.00', '2021-01-20 16:14:26', '2021-01-21 10:15:13'),
(2, 44, 'Выполнен', 1, 0, 'Звонок оператора', 'Курьер', '', 'FKWEBk', '+7(978)482-93-38', '', 'qahfwl;ha', '', '', '', '{\"73\":{\"user_id\":\"44\",\"product_id\":\"3\",\"property_id\":\"7\",\"quantity\":\"1.000\",\"created_at\":\"2021-01-20 19:04:34\",\"changed_at\":\"2021-01-20 19:04:34\"},\"74\":{\"user_id\":\"44\",\"product_id\":\"3\",\"property_id\":\"6\",\"quantity\":\"4.000\",\"created_at\":\"2021-01-20 19:04:36\",\"changed_at\":\"2021-01-20 19:14:55\"}}', '9726.00', '2021-01-21 09:08:47', '2021-01-21 10:55:02'),
(3, 44, 'Выполнен', 1, 0, 'Звонок оператора', 'Курьер', '', 'FKWEBk', '+7(978)482-93-38', '', 'qahfwl;ha', '', '', '', '{\"73\":{\"user_id\":\"44\",\"product_id\":\"3\",\"property_id\":\"7\",\"quantity\":\"1.000\",\"created_at\":\"2021-01-20 19:04:34\",\"changed_at\":\"2021-01-20 19:04:34\"},\"74\":{\"user_id\":\"44\",\"product_id\":\"3\",\"property_id\":\"6\",\"quantity\":\"4.000\",\"created_at\":\"2021-01-20 19:04:36\",\"changed_at\":\"2021-01-20 19:14:55\"}}', '9726.00', '2021-01-21 09:09:47', '2021-01-21 10:14:13'),
(4, 44, 'Выполнен', 1, 0, 'Звонок оператора', 'Курьер', '', 'FKWEBk', '+7(978)482-93-38', '', 'qahfwl;ha', '', '', '', '{\"75\":{\"user_id\":\"44\",\"product_id\":\"8\",\"property_id\":\"15\",\"quantity\":\"1.000\",\"created_at\":\"2021-01-21 14:01:32\",\"changed_at\":\"2021-01-21 14:01:32\"}}', '212.00', '2021-01-21 11:01:36', '2021-01-21 11:08:39'),
(5, 44, 'Выполнен', 1, 0, 'Звонок оператора', 'Курьер', '', 'FKWEBk', '+7(978)482-93-38', '', 'qahfwl;ha', '', '', '', '{\"76\":{\"user_id\":\"44\",\"product_id\":\"3\",\"property_id\":\"6\",\"quantity\":\"2.000\",\"created_at\":\"2021-01-21 14:08:12\",\"changed_at\":\"2021-01-21 14:08:12\"}}', '2418.00', '2021-01-21 11:08:15', '2021-01-21 11:08:35'),
(6, 44, 'Выполнен', 1, 0, 'Звонок оператора', 'Курьер', '', 'FKWEBk', '+7(978)482-93-38', '', 'qahfwl;ha', '', '', '', '{\"77\":{\"user_id\":\"44\",\"product_id\":\"9\",\"property_id\":\"16\",\"quantity\":\"1.000\",\"created_at\":\"2021-01-21 15:39:22\",\"changed_at\":\"2021-01-21 15:39:22\"}}', '4421.00', '2021-01-01 12:40:39', '2021-01-03 12:40:45');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photos` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `average_price` decimal(19,2) NOT NULL DEFAULT 0.00,
  `created_at` datetime DEFAULT current_timestamp(),
  `changed_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `category_id`, `description`, `photos`, `average_price`, `created_at`, `changed_at`) VALUES
(3, 'Royal Canin 37. Сухой. Для стерилизованных кошек', 2, '<ul>\r\n<div class=\"_1SoKXqA-aN\" data-tid=\"11be0d4a\"></div>\r\n<li class=\"_3l91CB6_eZ\">Тип корма: сухой</li>\r\n<li class=\"_3l91CB6_eZ\">Возраст животного: взрослые (1-6&nbsp;лет)</li>\r\n<li class=\"_3l91CB6_eZ\">Особые потребности: для стерилизованных/кастрированных / профилактика избыточного веса\r\n</li>\r\n<li class=\"_3l91CB6_eZ\">Холистик: нет</li>\r\n<li class=\"_3l91CB6_eZ\">Вес упаковки: 0.4...15&nbsp;кг</li>\r\n</ul>', '[\"16094980455276.png\",\"16094980455265.png\"]', '1721.00', '2021-01-01 13:47:25', '2021-01-21 19:27:11'),
(4, 'Purina Pro Plan Sterilaized. Сухой. Для стерилизованных', 2, '<ul>\r\n<div class=\"_1SoKXqA-aN\" data-tid=\"11be0d4a\"></div>\r\n<li class=\"_3l91CB6_eZ\">Тип корма: сухой</li>\r\n<li class=\"_3l91CB6_eZ\">Возраст животного: взрослые (1-6&nbsp;лет)</li>\r\n<li class=\"_3l91CB6_eZ\">Особые потребности: для стерилизованных/кастрированных / профилактика МКБ / профилактика\r\nзубного камня / профилактика избыточного веса</li>\r\n<li class=\"_3l91CB6_eZ\">Холистик: нет</li>\r\n<li class=\"_3l91CB6_eZ\">Вес упаковки: 0.2...12&nbsp;кг</li>\r\n</ul>\r\n', '[\"16095010386305.png\"]', '2635.96', '2021-01-01 14:37:18', '2021-01-21 18:50:21'),
(5, 'Applaws беззерновой для котят', 2, '<ul>\r\n    <div class=\"_1SoKXqA-aN\" data-tid=\"11be0d4a\"></div>\r\n    <li class=\"_3l91CB6_eZ\">Тип корма: сухой</li>\r\n    <li class=\"_3l91CB6_eZ\">Возраст животного: котята (до 1&nbsp;года)</li>\r\n    <li class=\"_3l91CB6_eZ\">Особые потребности: беззерновой</li>\r\n    <li class=\"_3l91CB6_eZ\">Холистик: есть</li>\r\n    <li class=\"_3l91CB6_eZ\">Вес упаковки: 0.4...7.5&nbsp;кг</li>\r\n</ul>', '[\"16095081177252.png\"]', '2824.00', '2021-01-01 16:35:17', '2021-01-21 18:53:55'),
(7, 'Сухой корм для кошек CAT CHOW для вывода шерсти', 2, '<ul>\r\n<div class=\"_1SoKXqA-aN\" data-tid=\"11be0d4a\"></div>\r\n<li class=\"_3l91CB6_eZ\">Тип корма: сухой</li>\r\n<li class=\"_3l91CB6_eZ\">Возраст животного: взрослые (1-6&nbsp;лет)</li>\r\n<li class=\"_3l91CB6_eZ\">Особые потребности: для вывода шерсти</li>\r\n<li class=\"_3l91CB6_eZ\">Холистик: нет</li>\r\n<li class=\"_3l91CB6_eZ\">Вес упаковки: 0.4...15&nbsp;кг</li>\r\n</ul>', '[\"16095124642071.png\"]', '2463.80', '2021-01-01 17:47:44', '2021-01-21 18:54:03'),
(8, 'Влажный корм Bozita с мясом лося', 2, '<ul>\r\n<div class=\"_1SoKXqA-aN\" data-tid=\"11be0d4a\"></div>\r\n<li class=\"_3l91CB6_eZ\">Тип корма: влажный</li>\r\n<li class=\"_3l91CB6_eZ\">Холистик: нет</li>\r\n<li class=\"_3l91CB6_eZ\">Вес упаковки: 0.37&nbsp;кг</li>\r\n<li class=\"_3l91CB6_eZ\">Тип упаковки: Tetra Pak</li>\r\n</ul>', '[\"16095141063594.png\"]', '212.00', '2021-01-01 18:15:06', '2021-01-21 18:54:25');

-- --------------------------------------------------------

--
-- Структура таблицы `properties_pointers`
--

CREATE TABLE `properties_pointers` (
  `id` int(11) NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_struct` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `changed_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `properties_pointers`
--

INSERT INTO `properties_pointers` (`id`, `name`, `data_struct`, `created_at`, `changed_at`) VALUES
(1, 'Корм для кошек и собак', '{\"tname\": \"Корм для кошек и собак\",\"fields\": {\"Производитель\": {\"data_type\": \"VARCHAR(50)\",\"filter_type\": \"checkbox\",\"NULL\": \"NULL\"},\"Тип корма\": {\"data_type\": \"VARCHAR(50)\",\"filter_type\": \"radio\",\"NULL\": \"NOT NULL\"},\"Возраст животного\": {\"data_type\": \"VARCHAR(50)\",\"filter_type\": \"checkbox\",\"NULL\": \"NULL\"},\"Холистик\": {\"data_type\": \"BOOLEAN\",\"filter_type\": \"radio\",\"NULL\": \"NULL\"},\"Особые потребности\": {\"data_type\": \"VARCHAR(50)\",\"filter_type\": \"checkbox\",\"NULL\": \"NULL\"},\"Ветеринарная диета\": {\"data_type\": \"VARCHAR(50)\",\"filter_type\": \"checkbox\",\"NULL\": \"NULL\"},\"Тип упаковки\": {\"data_type\": \"VARCHAR(50)\",\"filter_type\": \"checkbox\",\"NULL\": \"NOT NULL\"},\"Вкус\": {\"data_type\": \"VARCHAR(50)\",\"filter_type\": \"checkbox\",\"NULL\": \"NULL\"},\"Основной ингредиент\": {\"data_type\": \"VARCHAR(50)\",\"filter_type\": \"checkbox\",\"NULL\": \"NULL\"},\"Текстура\": {\"data_type\": \"VARCHAR(50)\",\"filter_type\": \"checkbox\",\"NULL\": \"NULL\"},\"Вес\": {\"data_type\": \"DECIMAL(19,3)\",\"filter_type\": \"limit\",\"NULL\": \"NULL\",\"different\": \"true\"},\"Гарнир\": {\"data_type\": \"VARCHAR(50)\",\"filter_type\": \"checkbox\",\"NULL\": \"NULL\"},\"Лечебный\": {\"data_type\": \"BOOLEAN\",\"filter_type\": \"radio\",\"NULL\": \"NULL\"},\"Порода\": {\"data_type\": \"VARCHAR(50)\",\"filter_type\": \"checkbox\",\"NULL\": \"NULL\"},\"created_at\": {\"data_type\": \"DATETIME\",\"filter_type\": \"NONE\",\"NULL\": \"NOT NULL DEFAULT CURRENT_TIMESTAMP\"},\"changed_at\": {\"data_type\": \"DATETIME\",\"filter_type\": \"NONE\",\"NULL\": \"on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP\"},\"цена\": {\"data_type\": \"DECIMAL(19,2)\",\"filter_type\": \"limit\",\"NULL\": \"NOT NULL\"},\"закупочная цена\": {\"data_type\": \"DECIMAL(19,2)\",\"filter_type\": \"NONE\",\"NULL\": \"NULL\"},\"количество\": {\"data_type\": \"FLOAT\",\"filter_type\": \"limit\",\"NULL\": \"NOT NULL\"}},\"different\": \"Вес\"}', '2020-12-27 18:20:47', '2021-01-21 15:27:22');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `session_id` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apartment` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `temp` tinyint(1) DEFAULT 1,
  `orders` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `changed_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `session_id`, `user_name`, `phone`, `email`, `address`, `apartment`, `additions`, `password`, `role`, `temp`, `orders`, `created_at`, `changed_at`) VALUES
(39, '2tie2535rvmsf8vkpb8vg6k8aihn7p0b', 'Юрий', '+7(978)503-66-11', 'yura.mezentsev@yandex.ru', 'fewef', '33', 'rsdq', '813869ad63acf6888f4b3492e4a5e66a', NULL, 0, 4, '2021-01-16 16:31:22', '2021-01-20 13:12:40'),
(43, '2op1hm7ad6itjhof4osielbgq7qqm40a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2021-01-20 12:10:39', '2021-01-20 14:08:09'),
(44, '6umhp11dvj5avgeob2tfokgjnhdq5euu', 'FKWEBk', '+7(978)482-93-38', '', 'qahfwl;ha', '', '', NULL, NULL, 0, 12, '2021-01-20 14:08:17', '2021-01-21 17:45:37');

-- --------------------------------------------------------

--
-- Структура таблицы `корм для кошек и собак`
--

CREATE TABLE `корм для кошек и собак` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `Производитель` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Тип корма` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Возраст животного` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Холистик` tinyint(1) DEFAULT NULL,
  `Особые потребности` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ветеринарная диета` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Тип упаковки` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Вкус` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Основной ингредиент` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Текстура` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Вес` decimal(19,3) DEFAULT NULL,
  `Гарнир` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Лечебный` tinyint(1) DEFAULT NULL,
  `Порода` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `changed_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `цена` decimal(19,2) NOT NULL,
  `закупочная цена` decimal(19,2) DEFAULT NULL,
  `количество` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `корм для кошек и собак`
--

INSERT INTO `корм для кошек и собак` (`id`, `product_id`, `Производитель`, `Тип корма`, `Возраст животного`, `Холистик`, `Особые потребности`, `Ветеринарная диета`, `Тип упаковки`, `Вкус`, `Основной ингредиент`, `Текстура`, `Вес`, `Гарнир`, `Лечебный`, `Порода`, `created_at`, `changed_at`, `цена`, `закупочная цена`, `количество`) VALUES
(5, 3, 'Royal Canin', 'Cухой', 'взрослые (1-6 лет)', 0, 'для стерилизованных/кастрированных', '', 'zip-пакет', 'курица', 'птица', 'Сухие гранулы', '0.400', 'злаки', 0, '', '2021-01-01 14:20:45', '2021-01-21 15:49:10', '375.00', '250.00', 280),
(6, 3, 'Royal Canin', 'Cухой', 'взрослые (1-6 лет)', 0, 'для стерилизованных/кастрированных', '', 'zip-пакет', 'курица', 'птица', 'Сухие гранулы', '2.000', 'злаки', 0, '', '2021-01-01 14:26:22', '2021-01-21 14:08:34', '1209.00', '1000.00', 346),
(7, 3, 'Royal Canin', 'Cухой', 'взрослые (1-6 лет)', 0, 'для стерилизованных/кастрированных', '', 'zip-пакет', 'курица', 'птица', 'Сухие гранулы', '10.000', 'злаки', 0, '', '2021-01-01 14:29:14', '2021-01-21 19:27:11', '4900.00', '4483.00', 860),
(8, 4, 'Purina ONE', 'сухой', 'взрослые (1-6 лет)', 0, 'для стерилизованных/кастрированных', 'профилактика МКБ', 'Мешок ', 'Индейка', 'птица', 'Сухие гранулы', '10.000', 'злаки', 0, '', '2021-01-01 14:45:31', '2021-01-11 19:47:49', '5210.82', '4890.21', 765),
(9, 4, 'Purina ONE', 'сухой', 'взрослые (1-6 лет)', 0, 'для стерилизованных/кастрированных', 'профилактика МКБ', 'Мешок', 'Индейка', 'птица', 'Сухие гранулы', '7.000', 'злаки', 0, '', '2021-01-01 14:50:14', '2021-01-11 19:47:31', '4047.00', '3776.00', 985),
(10, 4, 'Purina ONE', 'сухой', 'взрослые (1-6 лет)', 0, 'для стерилизованных/кастрированных', 'профилактика МКБ', 'Мешок', 'Индейка', 'птица', 'Сухие гранулы', '1.500', 'злаки', 0, '', '2021-01-01 16:22:07', '2021-01-01 16:22:07', '1102.00', '850.00', 291),
(11, 4, 'Purina ONE', 'сухой', 'взрослые (1-6 лет)', 0, 'для стерилизованных/кастрированных', 'профилактика МКБ', 'zip-пакет', 'Индейка', 'птица', 'Сухие гранулы', '0.200', 'злаки', 0, '', '2021-01-01 16:24:19', '2021-01-01 16:24:19', '184.00', '100.00', 634),
(12, 5, 'Applaws', 'сухой', 'котята (до 1 года)', 1, 'беззерновой', '', 'Мешок', 'Курица', 'птица', 'Сухие гранулы', '7.500', 'овощи', 0, '', '2021-01-01 16:42:32', '2021-01-01 16:42:32', '2824.00', '2503.00', 56),
(13, 7, 'Purina ONE', 'сухой', 'взрослые (1-6 лет)', 0, 'для вывода шерсти', '', 'zip-пакет', 'курица', 'птица', 'Сухие гранулы', '15.000', 'злаки', 0, '', '2021-01-01 17:54:49', '2021-01-01 18:21:32', '4892.00', '4520.00', 244),
(14, 7, 'Purina ONE', 'сухой', 'взрослые (1-6 лет)', 0, 'для вывода шерсти', '', 'zip-пакет', 'курица', 'птица', 'Сухие гранулы', '0.085', 'злаки', 0, '', '2021-01-01 17:57:41', '2021-01-12 19:23:16', '35.60', '30.00', 2000),
(15, 8, 'Bozita', 'влажный', 'взрослые (1-6 лет)', 0, '', '', 'Tetra Pak', 'с мясом лося', 'птица', 'мягкие гранулы', '0.370', '', 0, '', '2021-01-01 18:47:33', '2021-01-21 14:01:45', '212.00', '140.00', 55),
(21, 3, 'Royal Canin', 'Cухой', 'взрослые (1-6 лет)', 0, 'для стерилизованных/кастрированных', '', 'zip-пакет', 'курица', 'птица', 'Сухие гранулы', '0.500', 'злаки', 0, '', '2021-01-21 19:26:47', '2021-01-21 19:26:47', '400.00', '300.00', 280);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_id` (`id`);

--
-- Индексы таблицы `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users` (`user_id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users` (`user_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `properties_pointers`
--
ALTER TABLE `properties_pointers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Индексы таблицы `корм для кошек и собак`
--
ALTER TABLE `корм для кошек и собак`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product` (`product_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `properties_pointers`
--
ALTER TABLE `properties_pointers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT для таблицы `корм для кошек и собак`
--
ALTER TABLE `корм для кошек и собак`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
