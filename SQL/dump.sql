-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Час створення: Лют 21 2019 р., 10:38
-- Версія сервера: 5.6.41
-- Версія PHP: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `thinkglobal_test`
--

-- --------------------------------------------------------

--
-- Структура таблиці `income`
--

CREATE TABLE `income` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `value` float(10,2) NOT NULL,
  `invoice` int(11) NOT NULL,
  `customer` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп даних таблиці `income`
--

INSERT INTO `income` (`id`, `date`, `value`, `invoice`, `customer`) VALUES
(1, '2018-12-02', 100.00, 1, 'Иванов Иван'),
(2, '2018-12-20', 120.00, 5, 'Иванов Иван'),
(3, '2019-01-14', 50.00, 2, 'Чапаев Василий'),
(4, '2019-01-19', 600.00, 3, 'Айбелив Айкенфлаев'),
(5, '2019-01-20', 210.00, 6, 'Иванов Иван');

-- --------------------------------------------------------

--
-- Структура таблиці `invoice`
--

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `value` float(10,2) NOT NULL,
  `customer` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп даних таблиці `invoice`
--

INSERT INTO `invoice` (`id`, `date`, `value`, `customer`) VALUES
(1, '2018-11-15', 200.00, 'Иванов Иван'),
(2, '2018-12-01', 300.00, 'Чапаев Василий'),
(3, '2018-12-02', 500.00, 'Айбелив Айкенфлаев'),
(5, '2018-12-18', 130.00, 'Иванов Иван'),
(6, '2019-01-10', 210.00, 'Иванов Иван'),
(7, '2019-01-17', 190.00, 'Чапаев Василий'),
(8, '2019-02-22', 115.00, 'Иванов Иван');

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `income`
--
ALTER TABLE `income`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice` (`invoice`);

--
-- Індекси таблиці `invoice`
--
ALTER TABLE `invoice`
  ADD UNIQUE KEY `id_2` (`id`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `income`
--
ALTER TABLE `income`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблиці `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
