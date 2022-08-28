-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Авг 28 2022 г., 13:01
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
(8, 'Дизель Би', 'Diesel Bee', '<p>Diesel bee гибрид третий версии. Благодаря запатентованной системе в третьем гибриде&nbsp;получилось полностью сымитировать работу индукции. В работе есть хлесткий удар индукции и проседание, чтобы не было лишней травматизации. По работе гибрид третий получился между гибридом 1 и гориллой, остался острый удар первого гибрида и тяговитость гориллы. </p><p>Подходит абсолютно для всех видов работ. отлично справляется с тонкими контурами и легко справляется с самыми толстыми контурами на любых участках кожи.</p>', '<p>Diesel bee hybrid third version. Thanks to the patented system in the third hybrid, it turned out to completely simulate the work of induction. There is a whiplash of induction and subsidence in the work, so that there is no unnecessary traumatization. According to the work, the third hybrid turned out to be between hybrid 1 and gorilla, the sharp blow of the first hybrid and the traction of the gorilla remained.</p><p>It is absolutely suitable for all types of work. perfectly copes with thin contours and easily copes with the thickest contours on any skin areas.</p>', '[\"public\\/images\\/categories\\/Diesel Bee 6305e07d1ec9c.png\"]', '<iframe src=\"https://www.youtube.com/embed/jexP06ALt9U\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', '2022-08-24 11:25:33', '2022-08-27 18:17:08');

-- --------------------------------------------------------

--
-- Структура таблицы `mail_config`
--

CREATE TABLE `mail_config` (
  `id` int(11) UNSIGNED NOT NULL,
  `host` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SMTPSecure` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `port` int(11) NOT NULL,
  `from_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
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

CREATE TABLE `orders` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'EN',
  `currency` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'EN',
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
  `images_min` text COLLATE utf8mb4_unicode_ci,
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
-- Структура таблицы `status`
--

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
(1, 'mm6loff46o3i808h01ga45ktcrco0ut6', 'Леонид', 'Смагин', 'RU', 'RU', 'RU', '8 (978) 503-66-11', 'admin@leosmagin.com', '', 'Улица пушкина, дом Калатушкина', '', 'Вашингтон', 'Охайо', '', '', '813869ad63acf6888f4b3492e4a5e66a', 'admin', 0, 0, '2022-08-22 07:21:26', '2022-08-28 10:01:17'),
(10, NULL, 'Новый', 'Пользователь ', 'US', 'RU', 'RU', '', 'BigBag.minecrafter@gmail.com', '', '', '', '', '', '', '', '12478e7ad0e39aa9c35be4b9a694ba9b', 'authorize', 0, 0, '2022-08-24 16:11:48', '2022-08-27 11:25:26'),
(11, 'hj0bhqbljlq19ka6j8ocrees54ql91qn', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-27 11:50:24', '2022-08-27 11:50:56'),
(12, '2p1b90h8g9bd5n21gl548fng3vut0hk6', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-27 14:01:48', '2022-08-27 14:01:48'),
(14, '1lcd5pegp0108ph1o8scee75et5ji0go', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-28 02:19:39', '2022-08-28 02:19:39'),
(16, '69fo8q7do7iimc349o8f7gi87kfecc6g', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-28 02:20:59', '2022-08-28 02:20:59'),
(17, '806f5ib17o2vqical47hkojm1lih4n66', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2022-08-28 08:24:30', '2022-08-28 08:24:30');

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
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `orders_status`
--
ALTER TABLE `orders_status`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `products_properties`
--
ALTER TABLE `products_properties`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
