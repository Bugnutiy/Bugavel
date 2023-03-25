-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: h902111921.mysql
-- Время создания: Мар 25 2023 г., 18:18
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

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--
-- Создание: Дек 21 2022 г., 19:35
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `display_order` int(12) NOT NULL DEFAULT '1',
  `name` varchar(40) CHARACTER SET utf8mb4 NOT NULL,
  `name_en` varchar(40) CHARACTER SET utf8mb4 NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 NOT NULL,
  `description_en` longtext CHARACTER SET utf8mb4 NOT NULL,
  `images` longtext CHARACTER SET utf8mb4,
  `videos` longtext CHARACTER SET utf8mb4,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `changed_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mail_config`
--
ALTER TABLE `mail_config`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `orders_status`
--
ALTER TABLE `orders_status`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `products_properties`
--
ALTER TABLE `products_properties`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

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
