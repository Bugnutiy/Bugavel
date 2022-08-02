-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 02 2021 г., 14:27
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
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
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
(1, '6umhp11dvj5avgeob2tfokgjnhdq5euu', 'Юрий', '+7(978)503-66-11', '', 'ул. Интернациональная, 144', '14', 'подъезд 1', NULL, NULL, 0, 3, '2021-01-21 18:26:44', '2021-01-23 12:34:36'),
(2, '0h76n095ikh036ganvcj9lo1nnj7cdgh', 'Мария', '+7(933)299-13-84', '', 'ул. Пушкина, д. 144', '32', 'подъезд 1', NULL, NULL, 0, 1, '2021-01-23 12:34:51', '2021-01-23 12:35:31'),
(3, 'pgo61dsrugslk0hcgkftqisi0rt6p0t8', 'Виктор', '+7(944)221-18-48', '', 'респ. Крым, Сакский р-н, с. Молочное, ул. Победы, 62', '', '', NULL, NULL, 0, 3, '2021-01-23 12:35:41', '2021-04-14 18:52:50');

--
-- Индексы сохранённых таблиц
--

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
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
