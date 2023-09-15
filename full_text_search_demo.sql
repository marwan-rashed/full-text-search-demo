-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 15, 2023 at 01:33 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `full_text_search_demo`
--
CREATE DATABASE IF NOT EXISTS `full_text_search_demo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `full_text_search_demo`;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
CREATE TABLE IF NOT EXISTS `documents` (
  `document_id` int(11) NOT NULL AUTO_INCREMENT,
  `creation_date` datetime NOT NULL DEFAULT current_timestamp(),
  `path` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`document_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncate table before insert `documents`
--

TRUNCATE TABLE `documents`;
--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`document_id`, `creation_date`, `path`, `content`) VALUES
(1, '2023-08-25 21:40:29', '/data/test1.pdf', 'This is the first pdf test file.\r\n\r\nThis file is created to test full_text_search in node and MySQL.\r\n\r\nfile location : /data/test1.pdf'),
(2, '2023-08-25 21:40:29', '/data/test2.pdf', 'This is the second test file.\r\n\r\nfile location : /data/test2.pdf\r\n\r\nAuthor : Marwan Rashed');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `documents`
--
ALTER TABLE `documents` ADD FULLTEXT KEY `content_full_text_index` (`content`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
