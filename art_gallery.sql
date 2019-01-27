-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2018 at 07:41 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `art_gallery`
--
CREATE DATABASE IF NOT EXISTS `art_gallery` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `art_gallery`;

-- --------------------------------------------------------

--
-- Table structure for table `art`
--

DROP TABLE IF EXISTS `art`;
CREATE TABLE IF NOT EXISTS `art` (
  `art_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(35) DEFAULT NULL,
  `artist_id` int(11) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `year` year(4) DEFAULT NULL,
  `quantity` int(20) DEFAULT NULL,
  `exhibit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`art_id`),
  KEY `artist_id` (`artist_id`),
  KEY `exhibit_id` (`exhibit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `art`:
--   `artist_id`
--       `artist` -> `artist_id`
--   `exhibit_id`
--       `exhibition` -> `exhibit_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
CREATE TABLE IF NOT EXISTS `artist` (
  `artist_id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` int(11) NOT NULL,
  `dob` date NOT NULL,
  `native` varchar(30) NOT NULL,
  PRIMARY KEY (`artist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `artist`:
--

-- --------------------------------------------------------

--
-- Table structure for table `art_order`
--

DROP TABLE IF EXISTS `art_order`;
CREATE TABLE IF NOT EXISTS `art_order` (
  `order_no` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_quantity` int(20) NOT NULL,
  `total_price` int(20) NOT NULL,
  `placement_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delivery_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `art_order`:
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
CREATE TABLE IF NOT EXISTS `booking` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `cust_id` int(11) NOT NULL,
  `art_id` int(11) NOT NULL,
  PRIMARY KEY (`bid`),
  KEY `cust_id` (`cust_id`),
  KEY `art_id` (`art_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `booking`:
--   `art_id`
--       `art` -> `art_id`
--   `cust_id`
--       `person` -> `pid`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `cust_id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_no` int(20) NOT NULL,
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `customers`:
--   `cust_id`
--       `person` -> `pid`
--

-- --------------------------------------------------------

--
-- Table structure for table `exhibition`
--

DROP TABLE IF EXISTS `exhibition`;
CREATE TABLE IF NOT EXISTS `exhibition` (
  `exhibit_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `exhibit_date` datetime NOT NULL,
  `location` varchar(20) NOT NULL,
  `available_seat` int(20) NOT NULL,
  PRIMARY KEY (`exhibit_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `exhibition`:
--

-- --------------------------------------------------------

--
-- Table structure for table `maintain`
--

DROP TABLE IF EXISTS `maintain`;
CREATE TABLE IF NOT EXISTS `maintain` (
  `maintain_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `exhibit_id` int(11) NOT NULL,
  PRIMARY KEY (`maintain_id`),
  KEY `exhibit_id` (`exhibit_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `maintain`:
--

-- --------------------------------------------------------

--
-- Table structure for table `paintings`
--

DROP TABLE IF EXISTS `paintings`;
CREATE TABLE IF NOT EXISTS `paintings` (
  `paint_id` int(11) NOT NULL,
  `medium` varchar(20) NOT NULL,
  PRIMARY KEY (`paint_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `paintings`:
--   `paint_id`
--       `art` -> `art_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `payment_no` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  `amount` int(20) NOT NULL,
  `mode` varchar(30) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`payment_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `payment`:
--

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
CREATE TABLE IF NOT EXISTS `person` (
  `pid` int(11) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `gender` enum('M','F','O') DEFAULT NULL,
  `email` varchar(35) DEFAULT NULL,
  `password` varchar(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `phone` bigint(10) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `person`:
--

-- --------------------------------------------------------

--
-- Table structure for table `sculptures`
--

DROP TABLE IF EXISTS `sculptures`;
CREATE TABLE IF NOT EXISTS `sculptures` (
  `sculp_id` int(11) NOT NULL,
  `weight` float(20,0) NOT NULL,
  `material_used` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sculp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `sculptures`:
--   `sculp_id`
--       `art` -> `art_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `staff_id` int(11) NOT NULL,
  `salary` int(20) NOT NULL DEFAULT '10000',
  `designation` enum('Curator','Manager','Consultant','Sponsor') DEFAULT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `staff`:
--

--
-- Constraints for dumped tables
--

--
-- Constraints for table `art`
--
ALTER TABLE `art`
  ADD CONSTRAINT `art_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`),
  ADD CONSTRAINT `art_ibfk_2` FOREIGN KEY (`exhibit_id`) REFERENCES `exhibition` (`exhibit_id`);

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`art_id`) REFERENCES `art` (`art_id`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`cust_id`) REFERENCES `person` (`pid`);

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `person` (`pid`);

--
-- Constraints for table `paintings`
--
ALTER TABLE `paintings`
  ADD CONSTRAINT `paintings_ibfk_1` FOREIGN KEY (`paint_id`) REFERENCES `art` (`art_id`);

--
-- Constraints for table `sculptures`
--
ALTER TABLE `sculptures`
  ADD CONSTRAINT `sculptures_ibfk_1` FOREIGN KEY (`sculp_id`) REFERENCES `art` (`art_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
