-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Авг 27 2022 г., 12:15
-- Версия сервера: 5.6.51-log
-- Версия PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `leosnew`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cart`
--

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
(4, 4, 2, 3, 1, '2022-08-24 15:53:54', '2022-08-24 15:53:54'),
(5, 1, 3, 4, 1, '2022-08-24 16:40:13', '2022-08-24 16:40:13'),
(6, 11, 3, 4, 1, '2022-08-24 16:42:01', '2022-08-24 16:42:01');

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_en` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` mediumtext COLLATE utf8mb4_unicode_ci,
  `videos` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `changed_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `name_en`, `description`, `description_en`, `images`, `videos`, `created_at`, `changed_at`) VALUES
(1, 'Запчасти', 'Spare parts', '<p><br></p>', '<p><br></p>', '[\"public\\/images\\/categories\\/Spare parts 6305deb2485f8.png\"]', '', '2022-08-24 11:17:54', '2022-08-24 11:17:54'),
(2, 'Источники питания', 'Power supply', '<p><br></p>', '<p><br></p>', '[\"public\\/images\\/categories\\/Power supply 6305deebd7012.png\"]', '', '2022-08-24 11:18:51', '2022-08-24 11:18:51'),
(3, 'Индукция', 'Coil Machine', '<p><br></p>', '<p><br></p>', '[\"public\\/images\\/categories\\/Coil Machine 6305df3f55b21.png\"]', '', '2022-08-24 11:20:15', '2022-08-24 11:20:15'),
(4, 'Ротор', 'Rotary Machine', '<p><br></p>', '<p><br></p>', '[\"public\\/images\\/categories\\/Rotary Machine 6305df87588e1.png\"]', '', '2022-08-24 11:21:27', '2022-08-24 11:21:27'),
(5, 'Скат', 'Hybray', '<p><br></p>', '<p><br></p>', '[\"public\\/images\\/categories\\/Hybray 6305dfbc53e19.png\"]', '<iframe src=\"https://www.youtube.com/embed/FZG-HziJSgs\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', '2022-08-24 11:22:20', '2022-08-24 19:02:13'),
(6, 'Горилла', 'Gorilla Machine', '<p><br></p>', '<p><br></p>', '[\"public\\/images\\/categories\\/Gorilla Machine 6305dff379396.png\"]', '', '2022-08-24 11:23:15', '2022-08-24 11:23:15'),
(7, 'Гибрид', 'Hybrid Machine', '<p><br></p>', '<p><br></p>', '[\"public\\/images\\/categories\\/Hybrid Machine 6305e041a8d50.png\"]', '<iframe src=\"https://www.youtube.com/embed/3qFzHp9LL4E\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', '2022-08-24 11:24:33', '2022-08-24 19:09:34'),
(8, 'Дизель Би', 'Diesel Bee', '<p>Прод</p>', '<p>Чрод</p>', '[\"public\\/images\\/categories\\/Diesel Bee 6305e07d1ec9c.png\"]', '<iframe src=\"https://www.youtube.com/embed/jexP06ALt9U\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', '2022-08-24 11:25:33', '2022-08-24 18:58:03');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'EN',
  `ip_country` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'EN',
  `status` int(11) UNSIGNED NOT NULL DEFAULT '1',
  `payment_status` tinyint(1) DEFAULT '0',
  `canceled` tinyint(1) DEFAULT '0',
  `info_method` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `delivery_method` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `delivery_time` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `second_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `billing_country` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `apartment` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additions` text COLLATE utf8mb4_unicode_ci,
  `cart` longtext CHARACTER SET utf8mb4,
  `cost` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `changed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `lang`, `ip_country`, `status`, `payment_status`, `canceled`, `info_method`, `delivery_method`, `delivery_time`, `first_name`, `second_name`, `phone`, `email`, `instagram`, `billing_country`, `address`, `apartment`, `city`, `region`, `zip_code`, `additions`, `cart`, `cost`, `created_at`, `changed_at`) VALUES
(1, 3, 'US', 'EN', 1, 0, 0, '', '', '', 'Имя', 'Фамилия', '+79785036611', 'admin@leosmagin.com', '', 'RU', 'Адрес тут какой', '', 'Город тут такой', 'Регион', '', '', '{\"1\":{\"user_id\":\"3\",\"product_id\":\"1\",\"property_id\":\"1\",\"quantity\":\"1\",\"created_at\":\"2022-08-24 17:53:59\",\"changed_at\":\"2022-08-24 17:53:59\"}}', '{\"RUB\":12123,\"USD\":75}', '2022-08-24 14:55:04', '2022-08-24 14:55:04'),
(2, 3, 'RU', 'EN', 1, 0, 0, '', '', '', 'Имя', 'Фамилия', '8 (978) 503-66-11', 'admin@leosmagin.com', '', 'PR', 'Адрес тут какой', '', 'Город тут такой', 'Регион', '', '', '{\"2\":{\"user_id\":\"3\",\"product_id\":\"1\",\"property_id\":\"1\",\"quantity\":\"1\",\"created_at\":\"2022-08-24 17:55:43\",\"changed_at\":\"2022-08-24 17:55:43\"}}', '{\"RUB\":12123,\"USD\":75}', '2022-08-24 14:56:00', '2022-08-24 14:56:00'),
(3, 4, 'RU', 'EN', 1, 0, 0, '', '', '', 'Имя', 'Фамилия', '+79785036611', 'yura.mezentsev@yandex.ru', '', 'RU', 'Адрес тут какой', '', 'Город тут такой', 'Регион', '', '', '{\"3\":{\"user_id\":\"4\",\"product_id\":\"1\",\"property_id\":\"1\",\"quantity\":\"1\",\"created_at\":\"2022-08-24 18:50:33\",\"changed_at\":\"2022-08-24 18:50:49\"}}', '{\"RUB\":28000,\"USD\":555}', '2022-08-24 15:51:51', '2022-08-24 15:51:51');

-- --------------------------------------------------------

--
-- Структура таблицы `orders_status`
--

CREATE TABLE `orders_status` (
  `id` int(11) UNSIGNED NOT NULL,
  `RU` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `EN` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
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

CREATE TABLE `products` (
  `id` int(11) UNSIGNED NOT NULL,
  `category_id` int(11) UNSIGNED NOT NULL DEFAULT '1',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `description_en` text COLLATE utf8mb4_unicode_ci,
  `images` text COLLATE utf8mb4_unicode_ci,
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

INSERT INTO `products` (`id`, `category_id`, `name`, `name_en`, `description`, `description_en`, `images`, `min_price`, `min_price_en`, `max_price`, `max_price_en`, `average_price`, `average_price_en`, `quantity`, `created_at`, `changed_at`) VALUES
(1, 8, 'Diesel bee чёрный ', 'Diesel bee black ', '<p>Особенность гибрида, сочетание в себе хлесткого удара индукции и стабильность ротора. С лёгкостью выполняет контурные, закрасочные и теневые работы любыми группами игл.</p>', '<p>The peculiarity of the HYBRID , the combination of the lashing kick of induction and the stability of the rotor. Easily performs lines, and shadow work with any group of needles. </p>', '[\"public\\/images\\/products\\/Diesel bee black  6306474e5a856.jpg\"]', 28000, 555, 28000, 555, 28000, 555, 7, '2022-08-24 17:53:18', '2022-08-24 18:48:17'),
(2, 8, 'Diesel bee золото', 'Diesel bee gold ', '<p>Особенность гибрида, сочетание в себе хлесткого удара индукции и стабильность ротора. С лёгкостью выполняет контурные, закрасочные и теневые работы любыми группами игл.</p>', '<p>The peculiarity of the HYBRID , the combination of the lashing kick of induction and the stability of the rotor. Easily performs lines, and shadow work with any group of needles. </p>', '[\"public\\/images\\/products\\/Diesel bee gold  63064985529de.jpg\"]', 28000, 555, 28000, 555, 28000, 555, 1, '2022-08-24 18:53:41', '2022-08-24 18:53:41'),
(3, 7, ' Hybrid чёрный', 'Hybrid black', '<p>Особенность гибрида, сочетание в себе хлесткого удара индукции и стабильность ротора. С лёгкостью выполняет контурные, закрасочные и теневые работы любыми группами игл.</p>', '<p>The peculiarity of the HYBRID , the combination of the lashing kick of induction and the stability of the rotor. Easily performs lines, and shadow work with any group of needles. </p>', '[\"public\\/images\\/products\\/Hybrid black 630654d260b47.jpg\"]', 28000, 555, 28000, 555, 28000, 555, 2, '2022-08-24 19:06:52', '2022-08-24 19:41:54');

-- --------------------------------------------------------

--
-- Структура таблицы `products_properties`
--

CREATE TABLE `products_properties` (
  `id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `classname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `classname_en` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `name_en` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
(1, 1, '', '', 't1', 't1', 28000, 555, 1, '2022-08-24 17:53:18', '2022-08-24 18:46:43'),
(3, 2, '', '', 'Diesel bee золото', 'Diesel bee gold ', 28000, 555, 1, '2022-08-24 18:53:41', '2022-08-24 18:53:41'),
(4, 3, '', '', ' Hybrid чёрный', 'Hybrid black', 28000, 555, 2, '2022-08-24 19:06:52', '2022-08-24 19:06:52');

-- --------------------------------------------------------

--
-- Структура таблицы `sber_config`
--

CREATE TABLE `sber_config` (
  `id` int(1) UNSIGNED NOT NULL,
  `host` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `userName` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ApiToken` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `secretKey` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `session_id` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `second_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'EN',
  `billing_country` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'EN',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `apartment` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additions` text COLLATE utf8mb4_unicode_ci,
  `password` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'guest',
  `temp` tinyint(1) DEFAULT '1',
  `orders` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `changed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `session_id`, `first_name`, `second_name`, `country`, `billing_country`, `lang`, `phone`, `email`, `instagram`, `address`, `apartment`, `city`, `region`, `zip_code`, `additions`, `password`, `role`, `temp`, `orders`, `created_at`, `changed_at`) VALUES
(1, 'iteni43dirjtebh7f7achv6cbvubec3b', 'Леонид', 'Смагин', 'RU', 'US', 'RU', '+7 (978) 503-66-11', 'admin@leosmagin.com', '', 'Улица пушкина, дом Калатушкина', '', 'Вашингтон', 'Охайо', '', '', '813869ad63acf6888f4b3492e4a5e66a', 'admin', 0, 0, '2022-08-22 07:21:26', '2022-08-24 16:41:54'),
(2, 'sj654sog66m03279t0bfg3pdvij8vev9', NULL, NULL, 'US', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-24 08:55:43', '2022-08-24 09:12:45'),
(3, 'f8vrt3dhdudb763voghvr3c837', 'Имя', 'Фамилия', 'US', 'PR', 'RU', '8 (978) 503-66-11', 'admin@leosmagin.com', '', 'Адрес тут какой', '', 'Город тут такой', 'Регион', '', '', NULL, 'guest', 1, 0, '2022-08-24 14:34:27', '2022-08-24 15:23:23'),
(4, 'fl7ke79e9drr0ueuscdc6hvus5', 'Имя', 'Фамилия', 'US', 'RU', 'RU', '+79785036611', 'yura.mezentsev@yandex.ru', '', 'Адрес тут какой', '', 'Город тут такой', 'Регион', '', '', NULL, 'guest', 1, 0, '2022-08-24 15:24:01', '2022-08-24 16:01:32'),
(6, 'h4u7m3onugn2m02qe27mv40030', NULL, NULL, 'US', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-24 16:02:38', '2022-08-24 16:11:23'),
(7, 'p0348em15l8nfgnffq8gj8ie14', NULL, NULL, 'US', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-24 16:09:55', '2022-08-24 16:09:55'),
(9, 'a8e3c1l2otuiipijdp5gpr5ae0', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-24 16:10:58', '2022-08-24 16:10:58'),
(10, 'fc7n3c3jmejs9hmsj2oi5766i3', 'Новый', 'Пользователь ', 'US', 'RU', 'RU', '', 'BigBag.minecrafter@gmail.com', '', '', '', '', '', '', '', '12478e7ad0e39aa9c35be4b9a694ba9b', 'authorize', 0, 0, '2022-08-24 16:11:48', '2022-08-24 16:15:09'),
(11, 'vstdfbmmin1skfr1j9c0dmgkv3', NULL, NULL, 'US', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-24 16:42:01', '2022-08-24 16:43:17');

-- --------------------------------------------------------

--
-- Структура таблицы `users_roles`
--

CREATE TABLE `users_roles` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
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
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users` (`user_id`);

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
  ADD KEY `category` (`category_id`);

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `orders_status`
--
ALTER TABLE `orders_status`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `products_properties`
--
ALTER TABLE `products_properties`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `sber_config`
--
ALTER TABLE `sber_config`
  MODIFY `id` int(1) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
