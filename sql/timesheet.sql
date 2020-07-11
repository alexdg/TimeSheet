-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Jul 11, 2020 at 03:13 PM
-- Server version: 8.0.19
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `timesheet`
--

-- --------------------------------------------------------

--
-- Table structure for table `card_action_log`
--

CREATE TABLE `card_action_log` (
  `id_card` varchar(8) NOT NULL,
  `id_employee` int NOT NULL,
  `datetime` datetime NOT NULL,
  `id_device` int NOT NULL,
  `id_action` int NOT NULL,
  `image_file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `card_state_log`
--

CREATE TABLE `card_state_log` (
  `id_card` varchar(8) NOT NULL,
  `id_seq` int NOT NULL,
  `datetime` datetime NOT NULL,
  `card_state` int NOT NULL,
  `id_employee` int NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `define_actions`
--

CREATE TABLE `define_actions` (
  `id_action` int NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `define_locations`
--

CREATE TABLE `define_locations` (
  `id_location` int NOT NULL,
  `address` varchar(255) NOT NULL,
  `place` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_card`
--

CREATE TABLE `employee_card` (
  `id_employee` int NOT NULL,
  `employee_name` varchar(255) NOT NULL,
  `id_card` varchar(8) NOT NULL,
  `card_state` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `timesheet_devices`
--

CREATE TABLE `timesheet_devices` (
  `id_device` int NOT NULL,
  `id_location` int NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `define_actions`
--
ALTER TABLE `define_actions`
  ADD PRIMARY KEY (`id_action`);

--
-- Indexes for table `define_locations`
--
ALTER TABLE `define_locations`
  ADD PRIMARY KEY (`id_location`);

--
-- Indexes for table `employee_card`
--
ALTER TABLE `employee_card`
  ADD PRIMARY KEY (`id_employee`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
