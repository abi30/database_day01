-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 13, 2021 at 12:14 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `airline_company`
--

-- --------------------------------------------------------

--
-- Table structure for table `airports`
--

CREATE TABLE `airports` (
  `airport_id` int(10) UNSIGNED NOT NULL,
  `airport_name` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `airports`
--

INSERT INTO `airports` (`airport_id`, `airport_name`) VALUES
(1, 'vienna_airport'),
(2, 'germany_airport'),
(3, 'dallas_airport'),
(4, 'newyork_airport'),
(5, 'india_airport'),
(6, 'bangladesh_airport');

-- --------------------------------------------------------

--
-- Table structure for table `flights`
--

CREATE TABLE `flights` (
  `flightId` int(10) UNSIGNED NOT NULL,
  `flight_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `flight_identifier` varchar(10) DEFAULT NULL,
  `Destination` int(10) UNSIGNED DEFAULT NULL,
  `from` int(10) UNSIGNED DEFAULT NULL,
  `flight_plane_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flights`
--

INSERT INTO `flights` (`flightId`, `flight_date`, `flight_identifier`, `Destination`, `from`, `flight_plane_id`) VALUES
(1, '2021-04-15 10:06:59', 'vie', 6, 1, 1),
(2, '2021-04-27 10:06:59', 'BNG', 1, 6, 2),
(3, '2021-04-25 10:08:51', 'GER', 3, 2, 3),
(4, '2021-04-27 10:08:51', 'USA', 2, 3, 4),
(5, '2021-04-29 10:08:51', 'NEW', 5, 4, 7),
(6, '2021-04-30 10:08:51', 'IND', 2, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `planes`
--

CREATE TABLE `planes` (
  `plane_id` int(11) NOT NULL,
  `identified_number` int(11) NOT NULL,
  `manufacturer` varchar(40) DEFAULT NULL,
  `model` varchar(40) DEFAULT NULL,
  `capacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `planes`
--

INSERT INTO `planes` (`plane_id`, `identified_number`, `manufacturer`, `model`, `capacity`) VALUES
(1, 10002, 'boeing_usa', '737', 500),
(2, 10202, 'boeing_usa', '719', 210),
(3, 18762, 'airbus_ger', '363c', 280),
(4, 13212, 'boeing_usa', '737a', 450),
(5, 10206, 'boeing_usa', '767b', 234),
(6, 10311, 'airbus_ger', '316b', 380),
(7, 12312, 'airbus_ger', '380a', 600);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airports`
--
ALTER TABLE `airports`
  ADD PRIMARY KEY (`airport_id`);

--
-- Indexes for table `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`flightId`),
  ADD UNIQUE KEY `flight_identifier` (`flight_identifier`),
  ADD KEY `Destination` (`Destination`),
  ADD KEY `flight_plane_id` (`flight_plane_id`),
  ADD KEY `from` (`from`);

--
-- Indexes for table `planes`
--
ALTER TABLE `planes`
  ADD PRIMARY KEY (`plane_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `flights`
--
ALTER TABLE `flights`
  ADD CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`Destination`) REFERENCES `airports` (`airport_id`),
  ADD CONSTRAINT `flights_ibfk_2` FOREIGN KEY (`flight_plane_id`) REFERENCES `planes` (`plane_id`),
  ADD CONSTRAINT `flights_ibfk_3` FOREIGN KEY (`from`) REFERENCES `airports` (`airport_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
