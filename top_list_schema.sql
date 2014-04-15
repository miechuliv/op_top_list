-- phpMyAdmin SQL Dump
-- version 4.0.5
-- http://www.phpmyadmin.net
--
-- Host: mysql2.zenbox.pl
-- Czas wygenerowania: 15 Kwi 2014, 13:31
-- Wersja serwera: 5.5.34-32.0-log
-- Wersja PHP: 5.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Baza danych: `demostrona_nasz`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `top_list`
--

CREATE TABLE IF NOT EXISTS `top_list` (
  `top_list_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `limit` int(11) NOT NULL,
  UNIQUE KEY `top_list_id` (`top_list_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `top_list_description`
--

CREATE TABLE IF NOT EXISTS `top_list_description` (
  `top_list_description_id` int(11) NOT NULL AUTO_INCREMENT,
  `top_list_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  UNIQUE KEY `top_list_description_id` (`top_list_description_id`),
  KEY `top_list_id` (`top_list_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `top_list_product`
--

CREATE TABLE IF NOT EXISTS `top_list_product` (
  `product_id` int(11) NOT NULL,
  `product_sort_order` int(11) NOT NULL,
  `top_list_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `top_list_id` int(11) NOT NULL,
  PRIMARY KEY (`top_list_product_id`),
  KEY `product_id` (`product_id`),
  KEY `top_list_id` (`top_list_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
