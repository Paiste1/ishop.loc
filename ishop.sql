-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 11 2020 г., 08:15
-- Версия сервера: 10.3.13-MariaDB-log
-- Версия PHP: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ishop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `attribute_group`
--

CREATE TABLE `attribute_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `attribute_group`
--

INSERT INTO `attribute_group` (`id`, `title`) VALUES
(1, 'Механизм'),
(2, 'Стекло'),
(3, 'Ремешок'),
(4, 'Корпус'),
(5, 'Индикация');

-- --------------------------------------------------------

--
-- Структура таблицы `attribute_product`
--

CREATE TABLE `attribute_product` (
  `attr_id` int(10) UNSIGNED NOT NULL COMMENT 'id группы (attr_value)',
  `product_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `attribute_product`
--

INSERT INTO `attribute_product` (`attr_id`, `product_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 39),
(1, 40),
(1, 41),
(2, 4),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 39),
(5, 40),
(5, 41),
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(8, 39),
(8, 40),
(12, 1),
(12, 2),
(12, 3),
(12, 4),
(12, 39),
(12, 40),
(18, 1),
(18, 2),
(18, 4),
(18, 39),
(19, 3),
(19, 40);

-- --------------------------------------------------------

--
-- Структура таблицы `attribute_value`
--

CREATE TABLE `attribute_value` (
  `id` int(10) UNSIGNED NOT NULL,
  `value` varchar(255) NOT NULL,
  `attr_group_id` int(10) UNSIGNED NOT NULL COMMENT 'Назв группы (attr_group)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `attribute_value`
--

INSERT INTO `attribute_value` (`id`, `value`, `attr_group_id`) VALUES
(1, 'Механика с автоподзаводом', 1),
(2, 'Механика с ручным заводом', 1),
(3, 'Кварцевый от батарейки', 1),
(4, 'Кварцевый от солнечного аккумулятора', 1),
(5, 'Сапфировое', 2),
(6, 'Минеральное', 2),
(7, 'Полимерное', 2),
(8, 'Стальной', 3),
(9, 'Кожаный', 3),
(10, 'Каучуковый', 3),
(11, 'Полимерный', 3),
(12, 'Нержавеющая сталь', 4),
(13, 'Титановый сплав', 4),
(14, 'Латунь', 4),
(15, 'Полимер', 4),
(16, 'Керамика', 4),
(17, 'Алюминий', 4),
(18, 'Аналоговые', 5),
(19, 'Цифровые', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `brand`
--

CREATE TABLE `brand` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL DEFAULT 'brand_no_image.jpg',
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `brand`
--

INSERT INTO `brand` (`id`, `title`, `alias`, `img`, `description`) VALUES
(1, 'Casio', 'casio', 'abt-1.jpg', 'Описание бренда CASIO'),
(2, 'Citizen', 'citizen', 'abt-2.jpg', 'Описание бренда Citizen'),
(3, 'Royal London', 'royal-london', 'abt-3.jpg', 'Описание бренда Royal London'),
(4, 'Seiko', 'seiko', 'seiko.png', NULL),
(5, 'Diesel', 'diesel', 'diesel.png', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `parent_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'id родит. катег.',
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `title`, `alias`, `parent_id`, `keywords`, `description`) VALUES
(1, 'Men', 'men', 0, 'Men', 'Men'),
(2, 'Women', 'women', 0, 'Women', 'Women'),
(3, 'Kids', 'kids', 0, 'Kids', 'Kids'),
(4, 'Электронные', 'elektronnye', 1, 'Электронные', 'Электронные'),
(5, 'Механические', 'mehanicheskie', 1, 'mehanicheskie', 'mehanicheskie'),
(6, 'Casio', 'casio', 4, 'Casio', 'Casio'),
(7, 'Citizen', 'citizen', 4, 'Citizen', 'Citizen'),
(8, 'Royal London', 'royal-london', 5, 'Royal London', 'Royal London'),
(9, 'Seiko', 'seiko', 5, 'Seiko', 'Seiko'),
(10, 'Epos', 'epos', 5, 'Epos', 'Epos'),
(11, 'Электронные', 'elektronnye-11', 2, 'Электронные', 'Электронные'),
(12, 'Механические', 'mehanicheskie-12', 2, 'Механические', 'Механические'),
(13, 'Adriatica', 'adriatica', 11, 'Adriatica', 'Adriatica'),
(14, 'Test', 'test', 0, 'test', 'test1'),
(15, 'Test1', 'test1', 3, '', ''),
(16, 'Test 2', 'test-2', 15, 'ddd', 'fff');

-- --------------------------------------------------------

--
-- Структура таблицы `currency`
--

CREATE TABLE `currency` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(10) NOT NULL,
  `symbol_right` varchar(10) NOT NULL,
  `value` float(15,2) NOT NULL COMMENT 'значение к баз. валюте',
  `base` int(1) NOT NULL COMMENT 'базовая валюта'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `currency`
--

INSERT INTO `currency` (`id`, `title`, `code`, `symbol_left`, `symbol_right`, `value`, `base`) VALUES
(1, 'рубль', 'RUB', '', ' руб.', 1.00, 1),
(2, 'доллар', 'USD', '$ ', '', 61.70, 0),
(3, 'Евро', 'EUR', '€ ', '', 68.62, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `gallery`
--

CREATE TABLE `gallery` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `gallery`
--

INSERT INTO `gallery` (`id`, `product_id`, `img`) VALUES
(1, 2, 's-1.jpg'),
(2, 2, 's-2.jpg'),
(3, 2, 's-3.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `modification`
--

CREATE TABLE `modification` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL COMMENT 'Название модификации',
  `price` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `modification`
--

INSERT INTO `modification` (`id`, `product_id`, `title`, `price`) VALUES
(1, 1, 'Silver', 300),
(2, 1, 'Black', 300),
(3, 1, 'Dark Black', 305),
(4, 1, 'Red', 310),
(5, 2, 'Silver', 80),
(6, 2, 'Red', 70);

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE `order` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` int(10) NOT NULL DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL COMMENT 'дата обработки',
  `currency` varchar(10) NOT NULL COMMENT 'валюта',
  `note` text DEFAULT NULL COMMENT 'примечание',
  `sum` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `order`
--

INSERT INTO `order` (`id`, `user_id`, `status`, `date`, `update_at`, `currency`, `note`, `sum`) VALUES
(9, 2, 1, '2020-01-15 11:42:53', NULL, 'RUB', 'test', 0),
(10, 2, 2, '2020-01-15 12:51:07', NULL, 'RUB', '431', 0),
(11, 5, 1, '2020-01-15 13:01:47', '2020-01-21 06:15:05', 'RUB', 'Сашка барабашка', 0),
(12, 2, 2, '2020-01-15 13:20:44', NULL, 'RUB', '13', 0),
(13, 2, 0, '2020-01-21 06:31:51', '2020-01-21 06:14:05', 'RUB', 'test', 0),
(23, 2, 0, '2020-02-11 05:00:06', NULL, 'RUB', 'комментарий от Алешки', 300),
(24, 2, 0, '2020-02-11 05:06:28', NULL, 'RUB', 'hello world !', 300),
(25, 2, 0, '2020-02-11 05:10:53', NULL, 'RUB', 'hello!', 300);

-- --------------------------------------------------------

--
-- Структура таблицы `order_product`
--

CREATE TABLE `order_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL COMMENT '№ заказа',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT '№ продукта',
  `qty` int(11) NOT NULL COMMENT 'кол-во',
  `title` varchar(255) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `order_product`
--

INSERT INTO `order_product` (`id`, `order_id`, `product_id`, `qty`, `title`, `price`) VALUES
(25, 9, 2, 1, 'Casio MQ-24-7BUL', 70),
(26, 9, 4, 1, 'Citizen JP1010-00E', 400),
(27, 9, 5, 4, 'Citizen BJ2111-08E', 500),
(28, 9, 2, 2, 'Casio MQ-24-7BUL (Silver)', 80),
(29, 10, 2, 1, 'Casio MQ-24-7BUL', 70),
(30, 10, 6, 1, 'Citizen AT0696-59E', 350),
(31, 10, 7, 1, 'Q&Q Q956J302Y', 20),
(32, 10, 8, 1, 'Royal London 41040-01', 90),
(33, 11, 2, 1, 'Casio MQ-24-7BUL', 70),
(34, 12, 2, 1, 'Casio MQ-24-7BUL', 70),
(35, 13, 1, 1, 'Casio MRP-700-1AVEF', 300),
(36, 13, 3, 1, 'Casio GA-1000-1AER', 400),
(37, 13, 2, 2, 'Casio MQ-24-7BUL (Silver)', 80),
(51, 23, 1, 1, 'Casio MRP-700-1AVEF', 300),
(52, 24, 1, 1, 'Casio MRP-700-1AVEF', 300),
(53, 25, 1, 1, 'Casio MRP-700-1AVEF', 300);

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL COMMENT 'для поиска',
  `content` text DEFAULT NULL,
  `price` float NOT NULL DEFAULT 0,
  `old_price` varchar(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `img` varchar(255) NOT NULL DEFAULT 'no_image.jpg',
  `hit` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `category_id`, `title`, `alias`, `content`, `price`, `old_price`, `status`, `keywords`, `description`, `img`, `hit`) VALUES
(1, 6, 'Casio MRP-700-1AVEF', 'casio-mrp-700-1avef', NULL, 300, '0', 1, NULL, NULL, 'p-1.png', 0),
(2, 6, 'Casio MQ-24-7BUL', 'casio-mq-24-7bul', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam tristique, diam in consequat iaculis, est purus iaculis mauris, imperdiet facilisis ante ligula at nulla. Quisque volutpat nulla risus, id maximus ex aliquet ut. Suspendisse potenti. Nulla varius lectus id turpis dignissim porta. Quisque magna arcu, blandit quis felis vehicula, feugiat gravida diam. Nullam nec turpis ligula. Aliquam quis blandit elit, ac sodales nisl. Aliquam eget dolor eget elit malesuada aliquet. In varius lorem lorem, semper bibendum lectus lobortis ac.</p>\r\n\r\n<p>Mauris placerat vitae lorem gravida viverra. Mauris in fringilla ex. Nulla facilisi. Etiam scelerisque tincidunt quam facilisis lobortis. In malesuada pulvinar neque a consectetur. Nunc aliquam gravida purus, non malesuada sem accumsan in. Morbi vel sodales libero.</p>\r\n', 70, '80', 1, '', '', 'p-2.png', 1),
(3, 6, 'Casio GA-1000-1AER', 'casio-ga-1000-1aer', '', 400, '', 1, '123', '456', 'p-3.png', 1),
(4, 6, 'Citizen JP1010-00E', 'citizen-jp1010-00e', NULL, 400, '0', 1, NULL, NULL, 'p-4.png', 1),
(5, 7, 'Citizen BJ2111-08E', 'citizen-bj2111-08e', NULL, 500, '550', 1, NULL, NULL, 'p-5.png', 1),
(6, 7, 'Citizen AT0696-59E', 'citizen-at0696-59e', NULL, 350, '355', 1, NULL, NULL, 'p-6.png', 1),
(7, 6, 'Q&Q Q956J302Y', 'q-and-q-q956j302y', NULL, 20, '0', 1, NULL, NULL, 'p-7.png', 1),
(8, 6, 'Royal London 41040-01', 'royal-london-41040-01', NULL, 90, '0', 1, NULL, NULL, 'p-8.png', 1),
(9, 6, 'Royal London 20034-02', 'royal-london-20034-02', NULL, 110, '0', 1, NULL, NULL, 'no_image.jpg', 0),
(10, 6, 'Royal London 41156-02', 'royal-london-41156-02', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam tristique, diam in consequat iaculis, est purus iaculis mauris, imperdiet facilisis ante ligula at nulla. Quisque volutpat nulla risus, id maximus ex aliquet ut. Suspendisse potenti. Nulla varius lectus id turpis dignissim porta. Quisque magna arcu, blandit quis felis vehicula, feugiat gravida diam. Nullam nec turpis ligula. Aliquam quis blandit elit, ac sodales nisl. Aliquam eget dolor eget elit malesuada aliquet. In varius lorem lorem, semper bibendum lectus lobortis ac.</p>\n\n                                            <p>Mauris placerat vitae lorem gravida viverra. Mauris in fringilla ex. Nulla facilisi. Etiam scelerisque tincidunt quam facilisis lobortis. In malesuada pulvinar neque a consectetur. Nunc aliquam gravida purus, non malesuada sem accumsan in. Morbi vel sodales libero.</p>', 100, '0', 1, NULL, NULL, 'no_image.jpg', 1),
(11, 3, 'Тестовый товар', 'testovyy-tovar', 'контент...', 10, '0', 1, NULL, NULL, 'no_image.jpg', 0),
(12, 7, 'Часы 1', 'chasy-1', NULL, 100, '0', 1, NULL, NULL, 'no_image.jpg', 0),
(13, 7, 'Часы 2', 'chasy-2', NULL, 105, '0', 1, NULL, NULL, 'no_image.jpg', 0),
(14, 7, 'Часы 3', 'chasy-3', NULL, 110, '0', 1, NULL, NULL, 'no_image.jpg', 0),
(15, 7, 'Часы 4', 'chasy-4', NULL, 115, '0', 1, NULL, NULL, 'no_image.jpg', 0),
(16, 7, 'Часы 5', 'chasy-5', NULL, 115, '0', 1, NULL, NULL, 'no_image.jpg', 0),
(17, 7, 'Часы 6', 'chasy-6', NULL, 120, '0', 1, NULL, NULL, 'no_image.jpg', 0),
(20, 7, 'Часы 7', 'chasy-7', NULL, 120, '0', 1, NULL, NULL, 'no_image.jpg', 0),
(21, 7, 'Часы 8', 'chasy-8', NULL, 120, '0', 1, NULL, NULL, 'no_image.jpg', 0),
(22, 7, 'Часы 9', 'chasy-9', NULL, 125, '0', 1, NULL, NULL, 'no_image.jpg', 0),
(23, 7, 'Часы 10', 'chasy-10', NULL, 125, '0', 1, NULL, NULL, 'no_image.jpg', 0),
(24, 7, 'Часы 11', 'chasy-11', NULL, 125, '0', 1, NULL, NULL, 'no_image.jpg', 0),
(25, 7, 'Часы 12', 'chasy-12', NULL, 125, '0', 1, NULL, NULL, 'no_image.jpg', 0),
(26, 7, 'Часы 13', 'chasy-13', NULL, 125, '0', 1, NULL, NULL, 'no_image.jpg', 0),
(27, 7, 'Часы 14', 'chasy-14', NULL, 125, '0', 1, NULL, NULL, 'no_image.jpg', 0),
(28, 7, 'Часы 15', 'chasy-15', NULL, 125, '0', 1, NULL, NULL, 'no_image.jpg', 0),
(29, 7, 'Часы 16', 'chasy-16', NULL, 125, '0', 1, NULL, NULL, 'no_image.jpg', 0),
(30, 7, 'Часы 17', 'chasy-17', NULL, 125, '0', 1, NULL, NULL, 'no_image.jpg', 0),
(31, 7, 'Часы 18', 'chasy-18', NULL, 125, '0', 1, NULL, NULL, 'no_image.jpg', 0),
(32, 7, 'Часы 19', 'chasy-19', NULL, 125, '0', 1, NULL, NULL, 'no_image.jpg', 0),
(33, 7, 'Часы 20', 'chasy-20', NULL, 125, '0', 1, NULL, NULL, 'no_image.jpg', 0),
(38, 16, 'Новый товар  2', 'novyy-tovar-2', '<p><img alt=\"\" src=\"/public/upload/images/1/bnr-1.jpg\" style=\"height:163px; width:400px\" /></p>\r\n\r\n<p>hello world</p>\r\n', 1000, '', 1, '', '', 'no_image.jpg', 0),
(39, 15, 'Новый товар 3', 'novyy-tovar-3', '', 1001, '', 1, '', '', 'no_image.jpg', 0),
(40, 16, 'Тестовый товар 11', 'testovyy-tovar-11', 'Vasya is here', 555, '700', 1, '', '', 'no_image.jpg', 1),
(41, 15, 'Новый 13', 'novyy-13', '', 6800, '', 1, '12', '13', '9748a52891ea1b95b07a1715b8aca23d.jpg', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `related_product`
--

CREATE TABLE `related_product` (
  `product_id` int(10) UNSIGNED NOT NULL COMMENT '№ товара',
  `related_id` int(10) UNSIGNED NOT NULL COMMENT 'Связанные товары'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `related_product`
--

INSERT INTO `related_product` (`product_id`, `related_id`) VALUES
(1, 2),
(1, 5),
(2, 5),
(2, 10),
(5, 1),
(5, 7),
(5, 8),
(40, 12),
(40, 13),
(40, 14),
(41, 12);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL COMMENT 'телефон',
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user' COMMENT 'роль пользователя'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `login`, `password`, `email`, `phone`, `name`, `address`, `role`) VALUES
(2, 'alex_13.91', '$2y$10$Gs/wNMO75QVSx2BFR/5/nuXwAsKrUF9CVnYxR/55HRQuohxOEnH1S', 'alex_13.91@mail.ru', '+7 (924) 837-1833', 'Алексей1', 'russia', 'user'),
(3, 'user5', '$2y$10$Xw3xlrQKkdxsymmYn3l3TuHtIu.dCkr44FWzv1fBHXSMLdfYC/Dga', '5@1.ru', '+7 (924) 837-1833', 'user5', '555', 'user'),
(4, 'user1', '$2y$10$bAfohT7QbsMHiD6QI1wPG.CLA7SpPlVlhbIpBqzTjjYzC4YSC71WO', '1@1.ru', '', 'admin', '123', 'user'),
(5, 'heysmileyourself@mail.ru', '$2y$10$LBf6kcW0qeigXkjukqZWfO76wYoyHlNPIsEAV5Fi1Jktnz29Ofjx.', 'heysmileyourself@mail.ru', '+7 (950) 096-5795', 'Alexa', 'Маршала Жукова 11 в Иркутск', 'user'),
(6, 'paiste', '$2y$10$5eQux0kPKKVGHHe8thXm1eTYG87a5KuQaLbANRYJr/a2755VoenM.', 'alexpaiste.ap@gmail.com', '', 'Алёшенька', 'Russia', 'admin'),
(7, 'user11', '$2y$10$7YWZzQLsSjE7ri0I8t5ImOZFUWhhIaR1mht7bWiJKKSvIS9gbSZqm', '11@1.ru', '+7 (924) 837-1833', '123', '123', 'user');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `attribute_group`
--
ALTER TABLE `attribute_group`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `attribute_product`
--
ALTER TABLE `attribute_product`
  ADD PRIMARY KEY (`attr_id`,`product_id`);

--
-- Индексы таблицы `attribute_value`
--
ALTER TABLE `attribute_value`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value` (`value`),
  ADD KEY `attr_group_id` (`attr_group_id`);

--
-- Индексы таблицы `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alias` (`alias`);

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alias` (`alias`);

--
-- Индексы таблицы `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `modification`
--
ALTER TABLE `modification`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alias` (`alias`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `hit` (`hit`);

--
-- Индексы таблицы `related_product`
--
ALTER TABLE `related_product`
  ADD PRIMARY KEY (`product_id`,`related_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `attribute_group`
--
ALTER TABLE `attribute_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `attribute_value`
--
ALTER TABLE `attribute_value`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `modification`
--
ALTER TABLE `modification`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT для таблицы `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
