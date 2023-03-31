-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: h902111921.mysql
-- Время создания: Мар 30 2023 г., 15:22
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
-- База данных: `h902111921_lovinew`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cart`
--
-- Создание: Мар 26 2023 г., 14:45
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
(1, 277, 7, 7, 1, '2023-03-30 09:16:31', '2023-03-30 09:16:31'),
(2, 278, 4, 4, 1, '2023-03-30 09:16:31', '2023-03-30 09:16:31'),
(3, 280, 5, 5, 1, '2023-03-30 09:16:32', '2023-03-30 09:16:32'),
(4, 287, 6, 6, 1, '2023-03-30 09:16:34', '2023-03-30 09:16:34'),
(5, 288, 2, 2, 1, '2023-03-30 09:16:34', '2023-03-30 09:16:34'),
(6, 294, 3, 3, 1, '2023-03-30 09:18:39', '2023-03-30 09:18:39'),
(7, 295, 9, 9, 1, '2023-03-30 09:18:41', '2023-03-30 09:18:41'),
(8, 307, 8, 8, 1, '2023-03-30 09:21:05', '2023-03-30 09:21:05'),
(9, 308, 1, 1, 1, '2023-03-30 09:21:38', '2023-03-30 09:21:38'),
(10, 317, 3, 3, 1, '2023-03-30 09:29:41', '2023-03-30 09:29:41'),
(12, 357, 4, 4, 1, '2023-03-30 15:09:05', '2023-03-30 15:09:05'),
(13, 357, 3, 3, 1, '2023-03-30 15:09:47', '2023-03-30 15:09:47'),
(14, 359, 10, 10, 1, '2023-03-30 15:10:13', '2023-03-30 15:10:13');

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--
-- Создание: Мар 26 2023 г., 14:45
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
-- Создание: Мар 26 2023 г., 14:45
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
(1, 'mail.nic.ru', 'info@prolovi.ru', 'DMZb2PuM2WF', 'ssl', 465, 'info@prolovi.ru', '');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--
-- Создание: Мар 26 2023 г., 14:45
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
(1, 124, 'RU', 'RU', 1, 0, 0, '', '', '', 'Павел', 'Коптев', '89166576052', 'paul-208@yandex.ru', '', 'RU', '2 Грайвороновский, 42 к 1, 149', '', 'Москва', 'Москва', '', '', '{\"11\":{\"user_id\":\"124\",\"product_id\":\"7\",\"property_id\":\"7\",\"quantity\":\"1\",\"created_at\":\"2023-03-30 17:09:01\",\"changed_at\":\"2023-03-30 17:09:01\"}}', '{\"RUB\":5500,\"USD\":70}', '2023-03-30 14:13:04', '2023-03-30 14:13:04');

-- --------------------------------------------------------

--
-- Структура таблицы `orders_status`
--
-- Создание: Мар 26 2023 г., 14:45
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
-- Создание: Мар 26 2023 г., 14:45
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
(1, 7, 'Fanatica ', 'Fanatica ', '<p>Ручка для работы модульными системами. Не для кого не секрет, что модульная система гасит хлёсткость любого модульного аппарата, из-за мембраны картриджа , а также за счёт встроенной в аппарат обратно-поступательной пружины . В машинке фанатика , мы смогли добиться максимальной имитации работы системы игла-дюза, за счёт того, что не стали ставить пружину, для сохранения силы удара , внутреннюю конструкцию шатуна установлена на двух подшипниках, что даёт максимально легкое скольжение, и конечно же ,мотор премиум класса maxon DC max ,который также стоит на нашем флагмане Lovi.</p><p>Вес аппарата 70 гр.</p><p>В комплекте :</p><p>-машинка</p><p>-провод питания RCA</p><p>Цена 42 т . рублей</p><p>Гарантия 6 м есяцев</p>', '<p>Fanatica </p>', '[\"public\\/images\\/products\\/Fanatica  6421a38858802.jpg\"]', '[\"public\\/images\\/products\\/min\\/Fanatica  6421a38858859.jpg\"]', 42000, 520, 42000, 520, 42000, 520, 1, '2023-03-27 16:48:48', '2023-03-27 17:10:55'),
(2, 5, 'GURU АКЦИЯ - 50%', 'GURU ', '<p>Идеально подойдёт как для новичка так и для опытного мастера. Благодаря своей универсальности, каждый мастер найдёт свою любимую настройку для каждой зоны. На аппарате стоит базовый эксцентрик с ходом 3,5 мм , мы рекомендуем эту длинну хода для работы на системе игла-дюза (через переходник tattoohelper), при такой настройке аппарата получается красивый мягкий пиксель. Если поставить эксцентрик с ходом 2,5 мм и переходник под модуль , тогда получается быстрый, плотный и мягкий прокрас . Также вы можете ставить тату иглу, на любой эксцентрик ( 3,5 или 2мм) и получать не менее красивые работы.</p><p>В машинке стоит мотор фулхабер (оригинал ).Вес 52 гр</p><p>В комплекте идет машинка GURU, базовый эксцентрик с ходом 3,5 , шнур питания и переходник на выбор. </p>', '<p>Guru</p>', '[\"public\\/images\\/products\\/GURU  64219f7b77c03.jpg\"]', '[\"public\\/images\\/products\\/min\\/GURU  64219f7b77c9c.jpg\"]', 17000, 3000, 17000, 3000, 17000, 3000, 2, '2023-03-27 16:51:55', '2023-03-30 17:02:33'),
(3, 6, 'Lovi ', 'Lovi', '<p>Легендарный аппарат, который навсегда покорил сотни мастеров самыми красивыми пикселями, аппарат который принёс множество кубков за самый воздушные брови в чемпионатах. Да! Не один аппарат не даёт такой красивый пиксель как Лови! Благодаря наличию 3 насадок жёсткости , вы можете настроить машинку под любой тип кожи и желаемый уровень прокраса.</p><p>Аппарат предназначен для работы на игле-дюзе , через переходник tattoohelper. Ход иглы 3,8 мм. Вес 65 гр.</p><p>Мотор MAXON (оригинал)</p><p>В комплекте машинка, шнур питания, tattoohelper</p>', '<p>Lovi </p>', '[\"public\\/images\\/products\\/Lovi 6421a6dc6a8b4.jpg\"]', '[\"public\\/images\\/products\\/min\\/Lovi 6421a6dc6a90c.jpg\"]', 42000, 530, 42000, 530, 42000, 530, 3, '2023-03-27 17:23:24', '2023-03-27 17:23:24'),
(4, 8, 'Хорс коричневый ', 'Xopc brown ', '<p>Наша компания производит лучшее оборудование для перманентного макияжа. Мы знаем как должен работать аппарат , чтобы обеспечить максимальный результат проведённой процедуры. Хорс - это сочетание современных технологий, нашего опыта и знаний. Мы учли все возможные потребности мастера и воплотили их в этом аппарате:</p><p>- идеальные габариты и вес;</p><p>- отсутствие вибрации ;</p><p>- правильное соотношение мощности мотора к скорости;</p><p>- работа с картриджами любой жёсткости;</p><p>- одинаково идеально держит линию и красит</p>', '<p>Xopc</p>', '[\"public\\/images\\/products\\/Xopc 6425943481622.jpg\"]', '[\"public\\/images\\/products\\/min\\/Xopc 64259434816b8.jpg\"]', 37000, 500, 37000, 500, 37000, 500, 1, '2023-03-27 17:30:08', '2023-03-30 17:00:45'),
(5, 4, 'Tattoohelper титан ф18', 'Tattoohelper ', '<p>Переходник для роторных машинок. Позволяет работать на системе игла - дюза.</p><p>В комплекте: Переходник диаметр ф18</p><p>фторопластовая вставка</p><p>бар-иглодержатель</p><p>шестигранный ключ</p>', '<p>Tattoohelper </p>', '[\"public\\/images\\/products\\/Tattoohelper  6421fd2269699.jpg\",\"public\\/images\\/products\\/Tattoohelper  6421fd226969c.jpg\"]', '[\"public\\/images\\/products\\/min\\/Tattoohelper  6421fd2269761.jpg\"]', 5000, 70, 5000, 70, 5000, 70, 0, '2023-03-27 23:31:30', '2023-03-30 17:01:42'),
(6, 4, 'Tattoohelper титан ф16', 'Tattoohelper ', '<p>Переходник для роторных машинок. Позволяет работать на системе игла - дюза.</p><p>В комплекте: Переходник диаметр ф16</p><p>фторопластовая вставка</p><p><span style=\"color: var(--bs-body-color); font-weight: var(--bs-body-font-weight);\">бар-иглодержатель</span></p><p><span style=\"color: var(--bs-body-color);\">шестигранный ключ</span></p>', '<p>Tattoohelper </p>', '[\"public\\/images\\/products\\/Tattoohelper  6421fd5d05520.jpg\",\"public\\/images\\/products\\/Tattoohelper  6421fd5d05523.jpg\"]', '[\"public\\/images\\/products\\/min\\/Tattoohelper  6421fd5d055e6.jpg\"]', 5000, 70, 5000, 70, 5000, 70, 3, '2023-03-27 23:32:29', '2023-03-27 23:35:00'),
(7, 4, 'Держатель под картридж ', 'Grip for cartridges ', '<p>Переходник для роторных тату машинок, позволяет работать картриджем (модулем).</p><p>В комплект входит: толкатели 2 шт. 9.2 см.</p><p>Характеристики:</p><p>Диаметр узкой части держателя 16 мм, а широкой части 19 мм.</p><p>Цвет: серебро</p><p>Материал: титан</p><p>Вес: 45 гр.</p>', '<p>Cartridg</p>', '[\"public\\/images\\/products\\/Grip for cartridges  64221668eb0a9.jpg\"]', '[\"public\\/images\\/products\\/min\\/Grip for cartridges  64221668eb109.jpg\"]', 5500, 70, 5500, 70, 5500, 70, 3, '2023-03-28 01:16:43', '2023-03-28 01:19:20'),
(8, 3, 'Шнур RCA ', 'RCA ', '<p>Шнур RCA </p>', '<p>RCA </p>', '[\"public\\/images\\/products\\/RCA  6422b1010b267.jpg\"]', '[\"public\\/images\\/products\\/min\\/RCA  6422b1010b2bf.jpg\"]', 2000, 30, 2000, 30, 2000, 30, 3, '2023-03-28 12:18:57', '2023-03-28 12:18:57'),
(9, 3, 'Шнур питания для Lovi, Guru, Ray', 'Lovi, Guru, Ray ', '<p>Шнур питания для аппаратов Lovi, Guru, Ray </p>', '<p>Lovi, Guru, Ray </p>', '[\"public\\/images\\/products\\/Lovi, Guru, Ray  6422b1c1bf172.jpg\"]', '[\"public\\/images\\/products\\/min\\/Lovi, Guru, Ray  6422b1c1bf1c7.jpg\"]', 2000, 30, 2000, 30, 2000, 30, 5, '2023-03-28 12:22:09', '2023-03-28 12:22:09'),
(10, 8, 'Хорс мрамор ', 'Xopc mramor', '<p>Наша компания производит лучшее оборудование для перманентного макияжа. Мы знаем как должен работать аппарат , чтобы обеспечить максимальный результат проведённой процедуры. Хорс - это сочетание современных технологий, нашего опыта и знаний. Мы учли все возможные потребности мастера и воплотили их в этом аппарате:</p><p>- идеальные габариты и вес;</p><p>- отсутствие вибрации ;</p><p>- правильное соотношение мощности мотора к скорости;</p><p>- работа с картриджами любой жёсткости;</p><p>- одинаково идеально держит линию и красит</p>', '<p>Xopc</p>', '[\"public\\/images\\/products\\/Xopc mramor 642594ef84920.jpg\"]', '[\"public\\/images\\/products\\/min\\/Xopc mramor 642594ef8497f.jpg\"]', 39000, 500, 39000, 500, 39000, 500, 2, '2023-03-30 16:55:59', '2023-03-30 17:00:23');

-- --------------------------------------------------------

--
-- Структура таблицы `products_properties`
--
-- Создание: Мар 26 2023 г., 14:45
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
(1, 1, '', '', 'Fanatica ', 'Fanatica ', 42000, 520, 1, '2023-03-27 16:48:48', '2023-03-27 16:48:48'),
(2, 2, '', '', 'GURU ', 'GURU ', 17000, 3000, 2, '2023-03-27 16:51:55', '2023-03-30 16:59:37'),
(3, 3, '', '', 'Lovi ', 'Lovi', 42000, 530, 3, '2023-03-27 17:23:24', '2023-03-27 17:23:24'),
(4, 4, '', '', 'Хорс', 'Xopc', 37000, 500, 1, '2023-03-27 17:30:08', '2023-03-30 17:00:44'),
(5, 5, '', '', 'Tattoohelper титан ф18', 'Tattoohelper ', 5000, 70, 0, '2023-03-27 23:31:30', '2023-03-30 17:01:42'),
(6, 6, '', '', 'Tattoohelper титан ф16', 'Tattoohelper ', 5000, 70, 3, '2023-03-27 23:32:29', '2023-03-27 23:32:29'),
(7, 7, '', '', 'Держатель под картридж ', 'Grip for cartridges ', 5500, 70, 2, '2023-03-28 01:16:43', '2023-03-28 01:16:43'),
(8, 8, '', '', 'Шнур RCA ', 'RCA ', 2000, 30, 3, '2023-03-28 12:18:57', '2023-03-28 12:18:57'),
(9, 9, '', '', 'Шнур питания для Lovi, Guru, Ray', 'Lovi, Guru, Ray ', 2000, 30, 5, '2023-03-28 12:22:09', '2023-03-28 12:22:09'),
(10, 10, '', '', 'Хорс мрамор ', 'Xopc mramor', 39000, 500, 2, '2023-03-30 16:55:59', '2023-03-30 17:00:23');

-- --------------------------------------------------------

--
-- Структура таблицы `sber_config`
--
-- Создание: Мар 26 2023 г., 14:45
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
-- Создание: Мар 26 2023 г., 14:45
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
-- Создание: Мар 26 2023 г., 14:45
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
(1, '2cceae136da505805fc4aaafcae5c287', 'Леонид', 'Смагин', 'RU', 'RU', 'RU', '', 'info@leosmagin.com', '', '', '', '', '', '', '', '813869ad63acf6888f4b3492e4a5e66a', 'admin', 0, 0, '2023-03-25 18:19:35', '2023-03-30 14:02:48'),
(124, '0f05d05c5009d52920b407350498519e', 'Павел', 'Коптев', 'RU', 'RU', 'RU', '89166576052', 'paul-208@yandex.ru', '', '2 Грайвороновский, 42 к 1, 149', '', 'Москва', 'Москва', '', '', NULL, 'guest', 1, 0, '2023-03-28 06:22:00', '2023-03-30 14:23:56'),
(156, 'a2da39c269e1591a750699b570577d8b', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-28 15:14:57', '2023-03-28 15:14:57'),
(157, 'e6e55c79657db6ac576b11bcf0734da1', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-28 15:18:11', '2023-03-28 15:18:11'),
(158, '176be926655056608faec3ccef634b2f', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-28 15:37:59', '2023-03-28 15:37:59'),
(159, '60bc0b7838986f9611e01a20e81c1ed4', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-28 16:09:43', '2023-03-28 16:09:43'),
(160, '635325ef6ca4e05a8bd8691eea4b81a3', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-28 16:21:45', '2023-03-28 16:21:45'),
(161, 'e6aca1fbdabe06c80be5bb92e70167bf', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-28 16:23:23', '2023-03-28 16:23:23'),
(162, '39bb56655969daa7d80886674e2a5679', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-28 16:50:15', '2023-03-28 16:50:15'),
(163, 'b911ac082e530e95451c346d20da40bd', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-28 17:01:54', '2023-03-28 17:01:54'),
(164, '36b77636958797d15188ca4005fb42b3', NULL, NULL, 'UA', NULL, 'UA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-28 17:06:11', '2023-03-28 17:06:11'),
(165, 'cf526530f9c38298052996630a519bf0', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-28 17:14:35', '2023-03-28 17:14:35'),
(166, '478207df7e5302eafc9e30a050dd1c85', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-28 17:30:57', '2023-03-28 17:30:57'),
(167, 'daebb35779bbb8f0b4c6c917e729721a', NULL, NULL, 'UA', NULL, 'UA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-28 17:49:35', '2023-03-28 17:49:36'),
(168, 'd8f1f063610805bb01a7bcfa7bcc0e81', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-28 18:45:15', '2023-03-28 18:45:15'),
(169, '32146fc1e8b57664724b907c52f85a92', NULL, NULL, 'FI', NULL, 'FI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-28 19:09:40', '2023-03-28 19:09:40'),
(170, '07ffe9877d20f28dcc6c9791ca10b96c', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-28 19:14:21', '2023-03-28 19:14:21'),
(171, 'c8b40e62b04f3d488b176bd143d32276', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-28 19:15:04', '2023-03-28 19:15:04'),
(172, '692372a6b4dc851264a90370cb5e1791', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-28 19:16:18', '2023-03-28 19:16:18'),
(173, 'b2873b8af6177d440c6abbc912c5c675', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-28 19:16:59', '2023-03-28 19:16:59'),
(174, 'e01392b87a27d347615d8763ee1557b6', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-28 19:39:44', '2023-03-28 19:39:44'),
(176, 'd704a759424a6d075b43bfc16f0364ac', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-28 20:22:15', '2023-03-28 20:22:15'),
(177, 'f5a57befe644395fea60bd1a2e5731b5', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-28 20:35:49', '2023-03-28 20:35:49'),
(178, '2f89935ad98c56359e880f1d5e124d5e', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-28 20:53:10', '2023-03-28 20:53:13'),
(179, '37f2079ced470e4a8839c2354479e063', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-28 21:27:01', '2023-03-28 21:27:01'),
(180, 'aeeee6ce415fd46dd1b31e325e4ed39c', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-28 21:51:49', '2023-03-28 21:51:49'),
(181, 'e45d1b42efb8a44e54db1cb76ca0b581', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-28 22:11:56', '2023-03-28 22:11:56'),
(182, '409c44b90a7c6232ad0438716f5d0feb', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-28 22:11:56', '2023-03-28 22:11:56'),
(183, 'f260c371d286800866d1a27268c39ab8', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-28 22:11:56', '2023-03-28 22:11:56'),
(184, '1cc44808c86a8dbc701034862c1bdae1', NULL, NULL, 'CN', NULL, 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-28 22:26:28', '2023-03-28 22:26:28'),
(185, '195ed3a40e00946d5eb14898a0ef6cdd', NULL, NULL, 'CN', NULL, 'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-28 22:39:00', '2023-03-28 22:39:00'),
(186, '9cc33fe04882da0b1fb3862034d01ea8', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-28 23:27:04', '2023-03-28 23:27:04'),
(187, '796368af503fa1996f6e0285d24956b1', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 00:52:16', '2023-03-29 00:52:16'),
(188, '1c0115d42c8f91c766c4b39f64267e39', NULL, NULL, 'DE', NULL, 'DE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 00:52:18', '2023-03-29 00:52:18'),
(189, '0b35bbd714d6cf84e407de6c249c25fd', NULL, NULL, 'BE', NULL, 'BE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 01:09:23', '2023-03-29 01:09:23'),
(190, 'a670fb9ad88473d792f283c594c5446d', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 01:22:21', '2023-03-29 01:22:21'),
(191, 'e2d059e6d50cf311e927c37f070ae3b1', NULL, NULL, 'IN', NULL, 'IN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 01:50:09', '2023-03-29 01:50:09'),
(192, '25c039021ce3890101daf0ab5e63547c', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 03:34:33', '2023-03-29 03:34:33'),
(193, '9b9822b57a52b349be5768d66747a94b', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 04:17:29', '2023-03-29 04:17:29'),
(194, '4859370c4bb0f45701940e1ce7bea13d', NULL, NULL, 'FI', NULL, 'FI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 04:18:54', '2023-03-29 04:18:54'),
(195, '6c63fd78005233507f9a62c33b447e66', NULL, NULL, 'IN', NULL, 'IN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 04:45:09', '2023-03-29 04:45:09'),
(196, 'c268f60a938deb7e888a3683702d0288', NULL, NULL, 'UZ', NULL, 'UZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 05:21:29', '2023-03-29 05:21:29'),
(197, '1d6951c65d06b75b1f15b7185690a979', NULL, NULL, 'CH', NULL, 'CH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 05:42:46', '2023-03-29 05:42:46'),
(198, '81f01a8597c7ad17cdf71723afe9ac5b', NULL, NULL, 'SG', NULL, 'SG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 06:13:59', '2023-03-29 06:13:59'),
(199, '074e78b3cd246e31a7bdd9026be53e93', NULL, NULL, 'UA', NULL, 'UA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 07:00:17', '2023-03-29 07:00:17'),
(200, 'f260d116c6fd5b7b1ae39fda1535852c', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 07:51:15', '2023-03-29 07:54:31'),
(201, '6d41b34470a5be05a1e5afd67a4faaa7', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 08:04:46', '2023-03-29 08:04:46'),
(202, 'c5bd5cdc2e4b5b249438c284839bb65f', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 08:39:41', '2023-03-29 08:39:41'),
(203, '8e41fe9d06ec97305662b92895ba824b', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 09:01:24', '2023-03-29 09:01:24'),
(204, '71c5718cd1306d4a825e41744b3139d9', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 09:06:28', '2023-03-29 09:06:28'),
(205, 'c848e174eb21e164c95fedacdf7ac486', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 09:41:35', '2023-03-29 09:41:35'),
(206, 'ff8b1ce4bb052b584615cc521b3d6ec0', NULL, NULL, 'BE', NULL, 'BE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 09:50:39', '2023-03-29 09:50:39'),
(207, '666d1bcc21d65f14e14b7036db409e6b', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 11:47:19', '2023-03-29 11:47:19'),
(208, '75d55a7f6d4cfc859801792b427f347c', NULL, NULL, 'DE', NULL, 'DE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 12:43:08', '2023-03-29 12:43:08'),
(209, 'f0fa308b4b95ac80995609e6ffc00376', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 13:14:00', '2023-03-29 13:14:00'),
(210, 'a839b9f36b23089438d52645e84c38db', NULL, NULL, 'EE', NULL, 'EE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 13:16:36', '2023-03-29 13:16:36'),
(211, '02629fdf7190d90c02db990c3bbf726e', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 13:17:20', '2023-03-29 13:17:20'),
(212, 'eee244f24f7a707fdbe33d9d3e304494', NULL, NULL, 'FI', NULL, 'FI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 13:18:35', '2023-03-29 13:18:35'),
(213, 'bd85ef05797ea67424aa5182898a0616', NULL, NULL, 'SG', NULL, 'SG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 13:32:45', '2023-03-29 13:32:46'),
(214, '9a4e9eb8ff39f8f346a9c30c0ee48903', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 13:46:28', '2023-03-29 13:46:28'),
(215, 'f9d8ecd26ced7737f03cebc080b66767', NULL, NULL, 'SG', NULL, 'SG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 14:58:10', '2023-03-29 14:58:10'),
(216, 'b003fe06b392055f8dd245a7660a843f', NULL, NULL, 'SG', NULL, 'SG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 15:38:56', '2023-03-29 15:38:56'),
(217, '2c8b2614aec204058566c82a2b26622c', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 17:00:39', '2023-03-29 17:00:39'),
(218, '59625fb3ac8aac3e4ba08f70ea70d652', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 17:00:43', '2023-03-29 17:00:43'),
(219, '961471506a06098af0c4a8250d1946bd', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 18:10:44', '2023-03-29 18:10:44'),
(220, '5ac186b4b67d65e627fe99df455426f9', NULL, NULL, 'NO', NULL, 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 18:57:38', '2023-03-29 18:57:38'),
(221, 'c4ce9244fd61cbb8f0cf6f0cb82bbf80', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 19:02:18', '2023-03-29 19:02:18'),
(222, 'eb03774d72d8a961d963ab8cb7c0fc9a', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 19:34:18', '2023-03-29 19:34:18'),
(223, 'f694cf5a304b856d24c9cdb7ff77e906', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 19:39:45', '2023-03-29 19:39:45'),
(224, 'e19705664073e682f0e1b1405dd27c8c', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 19:49:28', '2023-03-29 19:49:28'),
(225, '396d3862262a5544d9428221e43cec16', NULL, NULL, 'GB', NULL, 'GB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 20:51:03', '2023-03-29 20:51:03'),
(226, 'b4f5f35dbb253377f1f2de4e71141265', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 21:14:21', '2023-03-29 21:14:21'),
(227, 'f58d4a54cc5ead4806a67288ed7d9bcf', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 22:21:52', '2023-03-29 22:21:52'),
(228, '85ecf9c8140046016b5a7bee431801c1', NULL, NULL, 'DE', NULL, 'DE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 22:25:35', '2023-03-29 22:25:35'),
(229, 'c649ac064cb338228644e5af827081c8', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 23:12:09', '2023-03-29 23:12:09'),
(230, 'c41839f8a7d876929e52d3e374b1f0d7', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-29 23:23:26', '2023-03-29 23:23:26'),
(231, 'c04e648c860569a0f733ca2e6c206abf', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 01:10:39', '2023-03-30 01:10:39'),
(232, 'abbb88b5004865a4e8d3dcdd4f5676d2', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 01:38:09', '2023-03-30 01:38:09'),
(233, 'd6d5e6f90d23f51e2e71fd8c7361d997', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 01:45:22', '2023-03-30 01:45:22'),
(234, '1d081d6ea94fc4a6ced0e9f10089df3d', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 01:54:01', '2023-03-30 01:54:01'),
(235, '0184357a452cdf3a4a3e880351d0505b', NULL, NULL, 'GB', NULL, 'GB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 02:22:17', '2023-03-30 02:22:17'),
(236, 'dc7ff731369f00b88061a57139a26cc9', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 02:45:04', '2023-03-30 02:45:04'),
(237, '87ca8bbe40cc77a275ab9f42a639cfd7', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 02:58:16', '2023-03-30 02:58:16'),
(238, 'f17207f0fef1ad88fff23ae3ac493cbc', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 03:25:25', '2023-03-30 03:25:25'),
(239, '2b3bf6fe85521510ba7dd958d306afea', NULL, NULL, 'DE', NULL, 'DE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 04:52:06', '2023-03-30 04:52:06'),
(240, 'daf79c3e7a083d493426b3091c6c708d', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 05:21:19', '2023-03-30 05:21:19'),
(241, '8b0f8974c959e252e2e64dacd64bac70', NULL, NULL, 'DE', NULL, 'DE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 05:41:26', '2023-03-30 05:41:26'),
(242, 'cb81fcc1553128b301b992bed10ca694', NULL, NULL, 'UA', NULL, 'UA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 05:48:57', '2023-03-30 05:48:57'),
(243, '39e41ea1a11bf07db0d27a3fb769c0f5', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 07:10:16', '2023-03-30 07:10:16'),
(244, '6fb9b68eb7abeeb7f09ace3f21828c16', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 07:21:33', '2023-03-30 07:21:33'),
(245, '9f7d9aacb1b54cf04bb19597bd07c647', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 07:33:40', '2023-03-30 07:33:40'),
(246, 'a1e7d3e788aaf05ff534e5aec76a744d', NULL, NULL, 'LT', NULL, 'LT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 08:02:00', '2023-03-30 08:02:00'),
(247, 'd0159e5dbf68978da1348e670d6f988d', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 08:04:03', '2023-03-30 08:04:03'),
(248, 'ed04e14d3f1c67432805f42fe6fbe196', NULL, NULL, 'SE', NULL, 'SE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 08:10:03', '2023-03-30 08:10:03'),
(249, 'ae12f80d2b4593994cbe5c711aa19dc4', NULL, NULL, 'BY', NULL, 'BY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 08:38:33', '2023-03-30 08:38:33'),
(250, 'dc31fd24d9f3822f031d2613e5dcd738', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:07:40', '2023-03-30 09:07:40'),
(251, '088f071911a781e39620d2fea8a992d8', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:09:40', '2023-03-30 09:09:40'),
(252, '74ef175d6ade20e3f21f561668fddf57', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:11:58', '2023-03-30 09:11:58'),
(253, '484a8f09b066ab25e045622ef0fef611', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:12:46', '2023-03-30 09:12:46'),
(254, '54af051c073827ec5ee28c68beed127b', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:14:43', '2023-03-30 09:14:43'),
(255, '87430b304ecac1e29dbceaaa4a572b37', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:14:43', '2023-03-30 09:14:43'),
(256, '644b348dd2ce03f930fd440797de7a01', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:14:43', '2023-03-30 09:14:43'),
(257, 'eb8366602f59291c5406a3bdb476cd8f', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:14:43', '2023-03-30 09:14:43'),
(258, 'ea1736aef49764658b598bf0fb2746a3', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:14:44', '2023-03-30 09:14:44'),
(259, 'c00da565bb09e28587b03231e5024e1c', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:14:44', '2023-03-30 09:14:44'),
(260, '66ed51fdfac376d4a4aaedd14850599b', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:14:44', '2023-03-30 09:14:44'),
(261, 'b1660f4bed6b489245446bbfbb70b322', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:14:45', '2023-03-30 09:14:45'),
(262, 'e0dcfbf733c8fc3a7592685c9b1b15c2', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:14:45', '2023-03-30 09:14:45'),
(263, '67da03fab4a8bc69cac81646d59af8c4', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:14:46', '2023-03-30 09:14:46'),
(264, 'f64517b5c60b7c01cc2f7cc6f747e478', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:14:46', '2023-03-30 09:14:46'),
(265, 'e2e3cf7fc4bce35d69d4819497b18a08', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:14:47', '2023-03-30 09:14:47'),
(266, '821e2db22bf3c44516794247eb208538', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:14:47', '2023-03-30 09:14:47'),
(267, '376e5770b96669f65e73b8a578ee99fa', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:14:47', '2023-03-30 09:14:47'),
(268, 'a64a7600752a3cd07dd59415058cbda3', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:15:43', '2023-03-30 09:15:43'),
(269, '456f436c7f7b73f9617aa58af47535b5', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:15:43', '2023-03-30 09:15:43'),
(270, '21c9093fba52cae1463ea78b97dffddd', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:16:29', '2023-03-30 09:16:29'),
(271, '908fd3dbd5a371dff425a844120384f8', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:16:30', '2023-03-30 09:16:30'),
(272, '963ba23df3ddff712dcc6beb4282cd68', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:16:30', '2023-03-30 09:16:30'),
(273, '62653318335279a7a1e616ada6b656f3', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:16:30', '2023-03-30 09:16:30'),
(274, '9caa8a52fab7104d7d10a0e6e4513b19', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:16:30', '2023-03-30 09:16:30'),
(275, '04caa948d1d67d37fc2d5406d130e14d', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:16:30', '2023-03-30 09:16:30'),
(276, '6fb073c39c8796d76b47744fda371d8b', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:16:31', '2023-03-30 09:16:31'),
(277, 'c0854b19df69c2022a08ef4f543249fc', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:16:31', '2023-03-30 09:16:31'),
(278, '2fd0f7c2de5ffd5397c60fa1ed21ea48', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:16:31', '2023-03-30 09:16:31'),
(279, '7edb1a39f39b7cf2a9a925cf903f36ce', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:16:31', '2023-03-30 09:16:31'),
(280, '70545c02731cfb18f3cbd3b2feb3f537', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:16:32', '2023-03-30 09:16:32'),
(281, 'afba25a2e6b9cfbec98f88d8b4aeeee5', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:16:32', '2023-03-30 09:16:32'),
(282, '171ed34b62bc3d319624a94a6b02ecb5', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:16:32', '2023-03-30 09:16:32'),
(283, '375bcb9344737060c3efbe62b6f85d68', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:16:33', '2023-03-30 09:16:33'),
(284, '91826561ce971cfe6cbeb871f7dd4ec0', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:16:33', '2023-03-30 09:16:33'),
(285, 'b93c20166189b50d36332d241c8ac6b4', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:16:33', '2023-03-30 09:16:33'),
(286, '2b02c9462d5623fd38d1a28bf87e8bb2', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:16:34', '2023-03-30 09:16:34'),
(287, '8c3425da84cf1f0221d158c4f8285dde', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:16:34', '2023-03-30 09:16:34'),
(288, '10b2f6ffe760f64b1e6a9be16a0d5df0', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:16:34', '2023-03-30 09:16:34'),
(289, '0ff4352b0e70e45826017eafa820939c', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:16:35', '2023-03-30 09:16:35'),
(290, '1e68d78b8c7559c4e85de366608f007d', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:17:36', '2023-03-30 09:17:36'),
(291, 'b0c50eb1949542c4cf5baf41a34282ce', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:17:37', '2023-03-30 09:17:37'),
(292, 'a5d8c801c31471434f5cdee61891aea7', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:17:38', '2023-03-30 09:17:38'),
(293, '4590d6a728209e49d2058f66dd8cd6c1', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:18:09', '2023-03-30 09:18:09'),
(294, '678f30698e93dedde62ae24c9b701198', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:18:39', '2023-03-30 09:18:39'),
(295, 'fe4c35c196585e2e0db1fa8bd530c86f', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:18:41', '2023-03-30 09:18:41'),
(296, 'c44236853e85c62d4eb2117a0a19121e', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:19:13', '2023-03-30 09:19:13'),
(297, '5331ba5289fb1df49c0d2914927274a7', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:19:13', '2023-03-30 09:19:13'),
(298, '04d8448f1b3eded9a5ec57b696296663', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:19:15', '2023-03-30 09:19:15'),
(299, '0682980b0ca9b0ffb8ae07c32fb55814', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:20:27', '2023-03-30 09:20:27'),
(300, 'defa02d06f797bde94d71902acbf6c84', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:20:28', '2023-03-30 09:20:28'),
(301, 'e168708178cac52066bb5f45a46ac336', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:20:29', '2023-03-30 09:20:29'),
(302, '0336d951818dd908e390d95fbc214e17', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:20:29', '2023-03-30 09:20:29'),
(303, '89bed5c8bb76987a06adbfbc27035a82', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:20:48', '2023-03-30 09:20:48'),
(304, '8e6ac67aa67f54f4ecf0601bdd63fbe5', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:20:50', '2023-03-30 09:20:50'),
(305, '2acf96d13caee51ad509e5736e0d77f7', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:20:52', '2023-03-30 09:20:52'),
(306, '6606d1f6163806dcba55c425ff8f601b', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:20:52', '2023-03-30 09:20:52'),
(307, '89043b26870b98905a28abdc37d54bb6', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:21:05', '2023-03-30 09:21:05'),
(308, 'f83a780072d07e178e2b9f4bf8f0f60f', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:21:38', '2023-03-30 09:21:38'),
(309, '7c0ce6d6bd73e64f87bcd136f72defa8', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:21:40', '2023-03-30 09:21:40'),
(310, 'd00c1480d836368789708223aa1ddc23', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:21:41', '2023-03-30 09:21:41'),
(311, '6b169340c35470b410587cb169dd21f8', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:22:03', '2023-03-30 09:22:03'),
(312, '7973dd88e6fff20277949a0c5f94802e', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:22:03', '2023-03-30 09:22:03'),
(313, '911f293c743bfb4154321407c94cfb60', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:25:01', '2023-03-30 09:25:01'),
(314, '78566a482a09776ef6d1eeb4da2b9f03', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:25:01', '2023-03-30 09:25:01'),
(315, 'cf520de37cd69cb553a3324769bdd786', NULL, NULL, 'RS', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:25:31', '2023-03-30 09:27:03'),
(316, '1772c72d302bb30064c21ef82eec7569', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:29:21', '2023-03-30 09:29:21'),
(317, '6ba8abcb03426b788f8c8554492548d9', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:29:41', '2023-03-30 09:29:41'),
(318, '46835e168f66673226c530b3eb8c8615', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:29:44', '2023-03-30 09:29:44'),
(319, 'ccdad25b05717ace519bd64cbd3e6859', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:30:39', '2023-03-30 09:30:39'),
(320, '5d03847f178789b76a4db5e4d465865b', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:31:58', '2023-03-30 09:31:58'),
(321, 'b27757200b10e0be2f3ed30c8ff69a32', NULL, NULL, 'RU', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 09:53:05', '2023-03-30 09:53:05'),
(322, '9e9a811acbcfa290b0868742ebc0f26f', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 10:11:17', '2023-03-30 10:11:17'),
(323, 'cb9e35dafe74b1a3dabb11c1e219cb6f', NULL, NULL, 'EN', NULL, 'EN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 10:58:46', '2023-03-30 10:58:46'),
(324, '91c1d8630477ff995de2366ec7a167c4', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 11:17:21', '2023-03-30 11:17:21'),
(325, '5cf33412b8d0ed5a0adce2144fb24107', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 11:19:35', '2023-03-30 11:19:35'),
(326, 'aed0bc05231979544bf4be6ce1f4a5be', NULL, NULL, 'FR', NULL, 'FR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 11:30:20', '2023-03-30 11:30:33'),
(327, 'cf706eba6bfba43f420f1e0ca9d0efcd', NULL, NULL, 'FI', NULL, 'FI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 11:43:49', '2023-03-30 11:43:49'),
(328, '4f9ff3f3338a1d64b3be8bf5e778d802', NULL, NULL, 'FI', NULL, 'FI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 11:46:30', '2023-03-30 11:46:30'),
(329, '1db057bc8dafb6afe058edb310919fb5', NULL, NULL, 'FI', NULL, 'FI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 11:49:40', '2023-03-30 11:49:40'),
(330, 'c6b6b6aed94fe8091aa201b06b019b9b', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 11:56:00', '2023-03-30 11:56:00'),
(331, 'b2175fd4e2517bfeda62dca096084d74', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 12:12:41', '2023-03-30 12:12:41'),
(332, 'f170926118cedb210b21b76a3c30b4fa', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 12:21:20', '2023-03-30 12:21:20'),
(333, 'b14954b9652ca09b69c8b95a096eefad', 'омг официальный сайтLJ', 'сайт омг омг ссылка', 'RU', 'SR', 'RU', '87674335967', 'kiskalove145@rambler.ru', '', 'https://omgomgomg2j4yrf4mjdv3h5c5xfvxtqqs2in7smi65mjps7vwkmqmtqd.xyz', '', 'Moscow', 'Moscow', '123443', 'ProLovi - Р“Р»Р°РІРЅР°СЏ СЃС‚СЂР°РЅРёС†Р° \r\n- \r\n \r\n \r\n \r\nОмг Омг onion - это крупный анонимный магазин с огромным ассортиментом товаров и услуг в СНГ. На площадке представлены сотни категорий, в которых можно найти предложения от тысяч продавцов. Главное подобрать подходящее, сравнить отзывы, количество продаж и другие особенности. После чего оформить заказ и максимально быстро получить его. Главное, что Омг Омг юнион гарантирует анонимность и безопасность каждому пользователю, и вы можете доверять проекту. Ссылка на Omg Omg онион -  https://xn--om-4na.com  . Это рабочее на данный момент зеркало Omg Omg, которое можно использовать для покупок. Потому переходите на сайте и окунитесь в мир тысяч товаров и услуг. А при возникновении любых трудностей, администрация проекта поможет в их решении.\r\n \r\n \r\n<a href=\"https://omgomg-info.xyz\" alt=\"omg ссылка\">omg</a> \r\n<a href=\"https://omg-infos.xyz\" alt=\"omgomgomg ссылка\">омг onion</a> \r\n \r\n[url=https://xn--mg-7bb.com]omg ссылка[/url]', 'fbe17b5608b4ca30df59fad32332688d', 'authorize', 0, 0, '2023-03-30 12:22:55', '2023-03-30 12:22:55'),
(334, 'a030323b419626f504bec92bae7b2baf', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 12:36:45', '2023-03-30 12:36:45'),
(335, 'c4f020699f48d4724ab6044f7c7ac4d6', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 13:04:07', '2023-03-30 13:04:07'),
(336, '342b58089870afd5d1376d9f2c32efb0', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 13:14:49', '2023-03-30 13:14:49'),
(337, 'a6a8f50b879209ee5d77052e66dddf85', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 13:15:22', '2023-03-30 13:15:22'),
(338, 'f99ab4062e457a8d57a6d411dd34a3f6', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 14:01:27', '2023-03-30 14:01:27'),
(339, '4cffe969339bbeeeba2b482e91ae9e08', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 14:03:06', '2023-03-30 14:03:06'),
(340, 'bd156bad9a6fff96ec097d08f495a659', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 14:03:30', '2023-03-30 14:03:30'),
(341, '83d89030e2f9eb281229b789b5176277', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 14:03:43', '2023-03-30 14:03:43'),
(342, 'f23b716b0a156cb74f5c05a9ef7ea1b7', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 14:08:27', '2023-03-30 14:08:27'),
(343, '3442fe62861c2936d6c9031f5b6785d2', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 14:08:43', '2023-03-30 14:08:43'),
(344, '184cb86ecd0a9ad4e9cc5d0b051b867f', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 14:09:16', '2023-03-30 14:09:16'),
(345, '3ca2f42c46a662586aba6e279be26115', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 14:09:27', '2023-03-30 14:09:27'),
(346, '06f6dbd28a8bbfe481e988c0a897b0f9', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 14:10:12', '2023-03-30 14:10:12'),
(347, '4a7ed12c8292e11b42a2afbbca52fd5d', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 14:10:25', '2023-03-30 14:10:25'),
(348, 'a549b817753a051bfc7a2f065b757059', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 14:12:20', '2023-03-30 14:12:20'),
(349, '74d0648c9e43984d46598952d9a8d73a', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 14:14:02', '2023-03-30 14:14:02'),
(350, '606fc1053a90d89591375e7bf41493aa', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 14:19:12', '2023-03-30 14:19:12'),
(351, '1434141e8077ecbd81eb8c1037f9a5a5', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 14:23:12', '2023-03-30 14:23:12'),
(352, '78cb477c802c25aaf8b617b23f3b1b12', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 14:24:30', '2023-03-30 14:24:30'),
(353, '1b506e8c0c778c32002891448afecff3', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 14:36:14', '2023-03-30 14:36:14'),
(354, '17cd4148bc53509dc5d7d96481717490', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 14:55:52', '2023-03-30 14:55:52'),
(355, 'd7ddd5c08e842cfc3bfc0583bfe94585', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 15:04:08', '2023-03-30 15:04:08'),
(356, '8beb81949a48f6e527b4ff340b4a6ea5', NULL, NULL, 'US', NULL, 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 15:05:27', '2023-03-30 15:05:27'),
(357, '797a550ec7a35e2ecdc7574691d13172', NULL, NULL, 'UA', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 15:08:55', '2023-03-30 15:09:51'),
(358, 'ac098ee407eff9fad469b31b36080563', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 15:10:12', '2023-03-30 15:10:12'),
(359, 'f8918d2fdd7a77ca3332cf4df1413acc', NULL, NULL, 'RU', NULL, 'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guest', 1, 0, '2023-03-30 15:10:13', '2023-03-30 15:10:13');

-- --------------------------------------------------------

--
-- Структура таблицы `users_roles`
--
-- Создание: Мар 26 2023 г., 14:45
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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `products_properties`
--
ALTER TABLE `products_properties`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=360;

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
