-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 21 2021 г., 21:31
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
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `property_id` int(11) UNSIGNED NOT NULL,
  `quantity` decimal(19,3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `changed_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `properties_id` int(11) UNSIGNED NOT NULL,
  `parent` int(11) UNSIGNED DEFAULT NULL,
  `icon` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `changed_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `food_for_birds`
--

CREATE TABLE `food_for_birds` (
  `id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `Производитель` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Назначение` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Тип корма` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Вид птицы` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Размер птицы` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Тип питания` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Для птенцов` tinyint(1) DEFAULT NULL,
  `Вес упаковки, кг` decimal(19,3) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `changed_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `цена` decimal(19,2) NOT NULL,
  `закупочная цена` decimal(19,2) DEFAULT NULL,
  `количество` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `food_for_cats_and_dogs`
--

CREATE TABLE `food_for_cats_and_dogs` (
  `id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `Производитель` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Тип корма` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Возраст животного` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Холистик` tinyint(1) DEFAULT NULL,
  `Особые потребности` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ветеринарная диета` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Тип упаковки` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Вкус` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Основной ингредиент` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Текстура` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Вес` decimal(19,3) DEFAULT NULL,
  `Гарнир` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Лечебный` tinyint(1) DEFAULT NULL,
  `Порода` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `changed_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `цена` decimal(19,2) NOT NULL,
  `закупочная цена` decimal(19,2) DEFAULT NULL,
  `количество` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `log`
--

CREATE TABLE `log` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `query` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `changed_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
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

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photos` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `average_price` decimal(19,2) NOT NULL DEFAULT 0.00,
  `created_at` datetime DEFAULT current_timestamp(),
  `changed_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `properties_pointers`
--

CREATE TABLE `properties_pointers` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_struct` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `changed_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Индексы таблицы `food_for_birds`
--
ALTER TABLE `food_for_birds`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `food_for_cats_and_dogs`
--
ALTER TABLE `food_for_cats_and_dogs`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT для таблицы `food_for_birds`
--
ALTER TABLE `food_for_birds`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `food_for_cats_and_dogs`
--
ALTER TABLE `food_for_cats_and_dogs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `properties_pointers`
--
ALTER TABLE `properties_pointers`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
