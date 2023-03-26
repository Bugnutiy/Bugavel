-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 26 2023 г., 17:45
-- Версия сервера: 10.8.4-MariaDB
-- Версия PHP: 7.4.30

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

CREATE TABLE `cart` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED DEFAULT NULL,
  `property_id` int(11) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `changed_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `display_order` int(12) NOT NULL DEFAULT 1,
  `name` varchar(40) CHARACTER SET utf8mb4 NOT NULL,
  `name_en` varchar(40) CHARACTER SET utf8mb4 NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 NOT NULL,
  `description_en` longtext CHARACTER SET utf8mb4 NOT NULL,
  `images` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `videos` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `changed_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `display_order`, `name`, `name_en`, `description`, `description_en`, `images`, `videos`, `created_at`, `changed_at`) VALUES
(1, 1, 'Расходники', 'Consumables', '<p><br></p>', '<p><br></p>', '[\"public\\/images\\/categories\\/Consumables 642053eb8b62a.png\"]', '', '2023-03-26 01:06:12', '2023-03-26 17:17:15'),
(2, 1, 'Запчасти', 'Spare parts', '<p><br></p>', '<p><br></p>', '[\"public\\/images\\/categories\\/Spare parts 642053f2095e4.png\"]', '', '2023-03-26 17:15:19', '2023-03-26 17:17:22'),
(3, 1, 'Силовое оборудование', 'Power supply', '<p><br></p>', '<p><br></p>', '[\"public\\/images\\/categories\\/Power supply 64205410eeb75.png\"]', '', '2023-03-26 17:17:52', '2023-03-26 17:17:52'),
(4, 1, 'Переходники', 'Adapters', '<p><br></p>', '<p><br></p>', '[\"public\\/images\\/categories\\/Adapters 64205438b4ed9.png\"]', '', '2023-03-26 17:18:32', '2023-03-26 17:18:32'),
(5, 1, 'Guru', 'Guru', '<p>Идеально подойдёт как для новичка так и для опытного мастера. Благодаря своей универсальности, каждый мастер найдёт свою любимую настройку для каждой зоны. На аппарате стоит базовый эксцентрик с ходом 3,5 мм , мы рекомендуем эту длинну хода для работы на системе игла-дюза (через переходник tattoohelper), при такой настройке аппарата получается красивый мягкий пиксель. Если поставить эксцентрик с ходом 2,5 мм и переходник под модуль , тогда получается быстрый, плотный и мягкий прокрас. Также вы можете ставить тату иглу, на любой эксцентрик ( 3,5 или 2мм) и получать не менее красивые работы.</p>', '<p>Ideal for both a beginner and an experienced craftsman. Thanks to its versatility, each master will find his favorite setting for each zone. The device has a basic eccentric with a stroke of 3.5 mm, we recommend this stroke length to work on the needle-nozzle system (via the tattoohelper adapter), with this setup of the device, a beautiful soft pixel is obtained. If you put an eccentric with a stroke of 2.5 mm and an adapter for the module, then you get a fast, dense and soft paint. You can also put a tattoo needle on any eccentric (3.5 or 2mm) and get no less beautiful work.</p>', '[\"public\\/images\\/categories\\/Guru 6420549791699.png\"]', '', '2023-03-26 17:20:07', '2023-03-26 17:20:07'),
(6, 1, 'Lovi', 'Lovi', '<p>Легендарный аппарат, который навсегда покорил сотни мастеров самыми красивыми пикселями, аппарат который принёс множество кубков за самый воздушные брови в чемпионатах. Да! Не один аппарат не даёт такой красивый пиксель как Лови! Благодаря наличию 3 насадок жёсткости , вы можете настроить машинку под любой тип кожи и желаемый уровень прокраса. </p><p> Аппарат предназначен для работы на игле-дюзе , через переходник tattoohelper. Ход иглы 3,8 мм. Вес 65 гр. </p><p> Мотор MAXON (оригинал) </p><p> В комплекте машинка, шнур питания, tattoohelper .</p>', '<p>The legendary device that forever conquered hundreds of masters with the most beautiful pixels, the device that brought many cups for the most airy eyebrows in the championships. Yes! Not one device does not give such a beautiful pixel as Catch! Thanks to the presence of 3 stiffeners, you can customize the machine for any type of skin and the desired level of procrastination.</p><p>The device is designed to work on a needle nozzle, through a tattoohelper adapter. The needle stroke is 3.8 mm. Weight 65 gr.</p><p>MAXON motor (original)</p><p>Included is a typewriter, power cord, tattoo helper.</p>', '[\"public\\/images\\/categories\\/Lovi 64205504c6cc7.png\"]', '', '2023-03-26 17:21:56', '2023-03-26 17:21:56'),
(7, 1, 'Fanatica', 'Fanatica', '<p>Ручка для работы модульными системами. Не для кого не секрет, что модульная система гасит хлёсткость любого модульного аппарата, из-за мембраны картриджа , а также за счёт встроенной в аппарат обратно-поступательной пружины . В машинке фанатика , мы смогли добиться максимальной имитации работы системы игла-дюза, за счёт того, что не стали ставить пружину, для сохранения силы удара , внутреннюю конструкцию шатуна установлена на двух подшипниках, что даёт максимально легкое скольжение, и конечно же ,мотор премиум класса maxon DC max ,который также стоит на нашем флагмане Lovi.</p>', '<p>A handle for working with modular systems. It\'s no secret that the modular system dampens the lashing of any modular device, due to the cartridge membrane, as well as due to the back-and-forth spring built into the device. In the fanatic\'s typewriter, we were able to achieve maximum imitation of the needle-nozzle system, due to the fact that we did not put a spring to preserve the impact force, the internal structure of the connecting rod is mounted on two bearings, which gives the easiest possible sliding, and of course, the maxon DC max premium class motor, which also stands on our the flagship of Lovi.</p>', '[\"public\\/images\\/categories\\/Fanatica 642055667a134.png\"]', '', '2023-03-26 17:23:34', '2023-03-26 17:23:34'),
(8, 1, 'Хорс', 'Hors', '<p>Наша компания производит лучшее оборудование для перманентного макияжа. Мы знаем как должен работать аппарат , чтобы обеспечить максимальный результат проведённой процедуры. Хорс - это сочетание современных технологий, нашего опыта и знаний. Мы учли все возможные потребности мастера и воплотили их в этом аппарате:</p><p>- идеальные габариты и вес;</p><p>- отсутствие вибрации ;</p><p>- правильное соотношение мощности мотора к скорости;</p><p>- работа с картриджами любой жёсткости;</p><p>- одинаково идеально держит линию и красит.</p>', '<p>Our company produces the best equipment for permanent makeup. We know how the device should work to ensure the maximum result of the procedure. Horse is a combination of modern technologies, our experience and knowledge. We took into account all the possible needs of the master and embodied them in this device:</p><p>- ideal dimensions and weight;</p><p>- no vibration ;</p><p>- the correct ratio of motor power to speed;</p><p>- work with cartridges of any hardness;</p><p>- equally perfectly holds the line and paints.</p>', '[\"public\\/images\\/categories\\/Hors 6420559d31279.png\"]', '', '2023-03-26 17:24:29', '2023-03-26 17:24:29');

-- --------------------------------------------------------

--
-- Структура таблицы `mail_config`
--

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
(1, 'mail.nic.ru', 'info@prolovi.ru', 'DMZb2PuM2WF', 'ssl', 465, 'info@prolovi.ru', '');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `lang` varchar(2) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'EN',
  `currency` varchar(10) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'EN',
  `status` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `payment_status` tinyint(1) DEFAULT 0,
  `canceled` tinyint(1) DEFAULT 0,
  `info_method` varchar(20) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `delivery_method` varchar(20) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `delivery_time` varchar(30) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `first_name` varchar(100) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `second_name` varchar(100) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `phone` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `instagram` varchar(100) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `billing_country` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `address` mediumtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `apartment` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `region` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `zip_code` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `additions` mediumtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `cart` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `cost` mediumtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `changed_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `orders_status`
--

CREATE TABLE `orders_status` (
  `id` int(11) UNSIGNED NOT NULL,
  `RU` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `EN` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `changed_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
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
  `category_id` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `name` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `name_en` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `description_en` mediumtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `images` mediumtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `images_min` mediumtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `min_price` int(11) DEFAULT NULL,
  `min_price_en` int(11) DEFAULT NULL,
  `max_price` int(11) DEFAULT NULL,
  `max_price_en` int(11) DEFAULT NULL,
  `average_price` int(11) DEFAULT NULL,
  `average_price_en` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `changed_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `products_properties`
--

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
  `created_at` datetime DEFAULT current_timestamp(),
  `changed_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Экземпляры товара с индивидуальными свойствами';

-- --------------------------------------------------------

--
-- Структура таблицы `sber_config`
--

CREATE TABLE `sber_config` (
  `id` int(1) UNSIGNED NOT NULL,
  `host` mediumtext CHARACTER SET utf8mb4 NOT NULL,
  `userName` mediumtext CHARACTER SET utf8mb4 NOT NULL,
  `password` mediumtext CHARACTER SET utf8mb4 NOT NULL,
  `ApiToken` mediumtext CHARACTER SET utf8mb4 NOT NULL,
  `secretKey` mediumtext CHARACTER SET utf8mb4 DEFAULT NULL
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
  `session_id` varchar(128) CHARACTER SET utf8mb4 DEFAULT NULL,
  `first_name` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `second_name` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `country` varchar(2) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'EN',
  `billing_country` varchar(2) CHARACTER SET utf8mb4 DEFAULT NULL,
  `lang` varchar(2) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'EN',
  `phone` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `instagram` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `address` mediumtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `apartment` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `region` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `zip_code` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `additions` mediumtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL,
  `role` varchar(20) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'guest',
  `temp` tinyint(1) DEFAULT 1,
  `orders` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `changed_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `session_id`, `first_name`, `second_name`, `country`, `billing_country`, `lang`, `phone`, `email`, `instagram`, `address`, `apartment`, `city`, `region`, `zip_code`, `additions`, `password`, `role`, `temp`, `orders`, `created_at`, `changed_at`) VALUES
(1, 's8gq1chp05hq2i5rtc2vkddlrav13luj', 'Леонид', 'Смагин', 'RU', 'RU', 'RU', '', 'info@leosmagin.com', '', '', '', '', '', '', '', '813869ad63acf6888f4b3492e4a5e66a', 'admin', 0, 0, '2023-03-25 18:19:35', '2023-03-26 14:43:56');

-- --------------------------------------------------------

--
-- Структура таблицы `users_roles`
--

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
