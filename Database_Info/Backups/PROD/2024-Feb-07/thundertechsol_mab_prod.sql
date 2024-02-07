-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 07, 2024 at 05:29 PM
-- Server version: 10.5.22-MariaDB-cll-lve
-- PHP Version: 8.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thundertechsol_mab_prod`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`thundertechsol`@`localhost` PROCEDURE `Player and Groups` (IN `P&G` INT)  NO SQL SELECT players.full_name, groups.group_name, group_profile.is_right_hand
FROM players
INNER JOIN group_profile
ON players.id = group_profile.player_id
INNER JOIN groups
ON group_profile.group_id = groups.id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_status`
--

CREATE TABLE `attendance_status` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(100) NOT NULL,
  `is_active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `attendance_status`
--

INSERT INTO `attendance_status` (`id`, `name`, `code`, `is_active`) VALUES
(1, 'Pending', 'PENDING', 1),
(2, 'Approved', 'APPROVED', 1),
(3, 'Denied', 'DENIED', 1);

-- --------------------------------------------------------

--
-- Table structure for table `lookups`
--

CREATE TABLE `lookups` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(100) NOT NULL,
  `type` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `lookup_detail_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `lookups`
--

INSERT INTO `lookups` (`id`, `name`, `code`, `type`, `is_active`, `lookup_detail_id`) VALUES
(1, 'Bunny', 'BUNNY', 2, 1, 0),
(4, 'Aladdin', 'ALADDIN', 2, 1, 0),
(5, 'Leo', 'LEO', 2, 1, 0),
(6, 'Simba', 'SIMBA', 2, 1, 0),
(7, 'Morning', 'MORNING', 5, 1, 0),
(8, 'Evening', 'EVENING', 5, 1, 0),
(9, 'Night', 'NIGHT', 5, 1, 0),
(10, 'Milky Way', 'MILKY_WAY', 1, 1, 0),
(11, 'Orian Star', 'ORIAN STAR', 1, 1, 0),
(12, 'Free Play', 'FREE_PLAY', 4, 1, 0),
(13, 'Deposit', 'DEPOSIT', 4, 1, 0),
(17, 'CCTV', 'CHAMPION_TRADERS', 2, 1, 0),
(18, 'HVAC', 'HVAC', 2, 1, 0),
(19, 'Sonic', 'SONIC', 2, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `lookup_types`
--

CREATE TABLE `lookup_types` (
  `id` int(11) NOT NULL,
  `code` varchar(100) NOT NULL,
  `is_active` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `lookup_types`
--

INSERT INTO `lookup_types` (`id`, `code`, `is_active`) VALUES
(1, 'GAME', 1),
(2, 'TEAM', 1),
(3, 'SETTINGS', 1),
(4, 'TRANSACTION_TYPES', 1),
(5, 'SHIFTS', 1),
(6, 'PAGES', 1);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(255) NOT NULL,
  `news` varchar(9999) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `news`, `is_active`) VALUES
(10, 'Hello Everyone,\nWe are just getting started!\nKindly use the attendance module & share your feedback at the following email address.\n\nFeedback Email: devdock29@gmail.com', 0),
(11, 'To all my dear friends, brothers, and sisters,\n\nWe\'ve introduced a new attendance app, and we encourage everyone to connect with your respective team leaders or Shaban if you encounter any issues during the sign-up or attendance submission process. Please note that failing to enter your attendance will be regarded as leave or result in deductions at the end. It\'s important to understand that the responsibility for completing the process lies with the team leaders; they must ensure it is done correctly. We want to emphasize that any form of fake or inaccurate attendance will not be accepted under any circumstances. The leaders have the responsibility of verifying and confirming the start and end time entries.\n\nThank you for your cooperation and understanding.', 0),
(12, 'AOA,\n\nPlease vote for PTI.\n(Imran Khan).\n\nVote for change.\n\nYou wanna know your candidates?\n\nGo message IMRAN KHAN on Facebook\nType your Halka number and Khan Saab will tell you his name along with the symbol.\n\nhttps://www.facebook.com/ImranKhanOfficial?mibextid=ZbWKwL', 1);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(45) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `is_active` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `code`, `is_active`) VALUES
(1, 'Reports', 'REPORTS', '1'),
(2, 'Attendance', 'ATTENDANCE', '1'),
(3, 'Finances', 'FINANCES', '1'),
(4, 'Privacy', 'PRIVACY', '1'),
(5, 'Settings', 'SETTINGS', '1'),
(6, 'Team Attendance', 'TEAM_ATTENDANCE', '1'),
(7, 'News', 'NEWS', '1');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(100) NOT NULL,
  `is_active` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `code`, `is_active`) VALUES
(1, 'Agent', 'AGENT', 1),
(2, 'Leader', 'LEADER', 1),
(3, 'Super User', 'SUPER_USER', 1);

-- --------------------------------------------------------

--
-- Table structure for table `social_info`
--

CREATE TABLE `social_info` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `social_platform` varchar(50) NOT NULL,
  `social_id` varchar(100) NOT NULL,
  `social_name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `shift_id` int(11) DEFAULT NULL,
  `lead_user_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `game` int(11) DEFAULT NULL,
  `amount` int(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `approved_time` timestamp NULL DEFAULT NULL,
  `deleted_time` timestamp NULL DEFAULT NULL,
  `modify_time` timestamp NULL DEFAULT NULL,
  `platform` varchar(100) DEFAULT NULL,
  `fb_page` varchar(100) DEFAULT NULL,
  `backend` varchar(100) DEFAULT NULL,
  `client_info` varchar(100) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `denied_by` int(11) DEFAULT NULL,
  `denied_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(500) NOT NULL,
  `user_name` varchar(500) NOT NULL,
  `password` varchar(500) NOT NULL,
  `device_token` varchar(500) DEFAULT NULL,
  `platform` varchar(500) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `mobile` varchar(500) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `is_super_user` tinyint(1) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `deleted_time` timestamp NULL DEFAULT NULL,
  `deleted_by` int(25) DEFAULT NULL,
  `new_user_req` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `user_name`, `password`, `device_token`, `platform`, `email`, `mobile`, `dob`, `is_super_user`, `image`, `role`, `deleted_time`, `deleted_by`, `new_user_req`) VALUES
(114, 'Fahad Ibrahim', 'fib', '1234567', 'Dummy Token', 'android', 'fahad@gmail.com', '03000000001', NULL, 0, NULL, 2, '2024-01-01 12:04:33', NULL, 0),
(115, 'Muhammad Talal', 'talal', 'ABC123mab', 'Dummy Token', 'android', 'talal@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(116, 'Ahsan Mahmood ', 'Ahsan', '1234567', 'Dummy Token', 'android', 'ab1981354@gmail.com', '', NULL, 0, NULL, 2, NULL, NULL, 0),
(117, 'Muhammad Noor', 'noorchaudary', 'teambunny1212', 'Dummy Token', 'android', 'umarchaudary6767@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(118, 'Ahmed Butt', 'Ahmed', '786786', 'Dummy Token', 'android', 'ahmedbutt5775@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(119, 'Muhammad Abdullah', 'Abdullah', 'mabDullah@5775', 'Dummy Token', 'android', 'abdullahbutt695@gmail.com', '', NULL, 0, NULL, 2, NULL, NULL, 0),
(120, 'Alishba Azhar', 'alishba', 'CHARSI06', 'Dummy Token', 'android', 'alishbaazhar.06@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(121, 'Waleed ismael', 'waleedbutt', 'waleed123', 'Dummy Token', 'android', 'waleedbut@gmail.com', '', NULL, 0, NULL, 2, NULL, NULL, 0),
(122, 'Umar Chaudary', 'umar01', 'umar0101', 'Dummy Token', 'android', 'umarchaudary78@gmail.com', '', NULL, 0, NULL, 2, NULL, NULL, 0),
(123, 'Saram Ali', 'Saram Ali', 'mab4321', 'Dummy Token', 'android', 'saramsilas7625@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(124, 'Fakhir', 'javed', 'Fakhir@123', 'Dummy Token', 'android', 'javedfakhir3@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(125, 'Fawad ul Hussnain ', 'Fawad FUH', '11223344', 'Dummy Token', 'android', 'fawadshah020@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(126, 'Ammar Hassan ', 'Ammar', '123456', 'Dummy Token', 'android', 'ammarhassan7997@gmail.com', '', NULL, 0, NULL, 2, NULL, NULL, 0),
(127, 'Sajjad Khan', 'sajjad', '454545', 'Dummy Token', 'android', 'sajjadkhan@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(130, 'Waqar Butt', 'Waqar7o3', 'Waqar.123', 'Dummy Token', 'android', 'narutobutt88o9@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(131, 'Talha', 'talha', 'talha123', 'Dummy Token', 'android', 'haffiztalha19@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(132, 'Zain Malik', 'malik123', 'zain123@.', 'Dummy Token', 'android', 'abubakarzain2004@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(133, 'IMRAN', 'Imran', '03224911512', 'Dummy Token', 'android', 'imran@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(134, 'Shahzaib Butt', 'shahzaib', 'luvments', 'Dummy Token', 'android', 'buttshahzaib568@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(135, 'Aiman Ejaz', 'Aiman Ejaz', 'aiman12345', 'Dummy Token', 'android', 'aimanejaz055@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(136, 'Roha Nasir', 'Roha Nasir', 'roha26627', 'Dummy Token', 'android', 'rohanasirkhan17@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(137, 'Hamza Butt', 'HamzaaBuTt', '03244238731', 'Dummy Token', 'ios', 'Zubairbutt4238731@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(138, 'MUHAMMAD SHABAN', 'shaban', 'Mission@123', 'Dummy Token', 'android', 'mtgarments1@gmail.com', '', NULL, 0, NULL, 2, NULL, NULL, 0),
(139, 'Waleed Khan', 'Waleed', 'WaleedKhan55', 'Dummy Token', 'android', 'wkk6515@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(140, 'Sajjad Khan', 'sajjad khan', '454545', 'Dummy Token', 'android', 'sajjadali70567@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(141, 'Aziz ', 'aziz', '151568', 'Dummy Token', 'android', 'aziz8900@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(142, 'Ahmad Mustafah', 'ahm', '1404ahmad', 'Dummy Token', 'android', 'ahmadmustafahbutt@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(143, 'Muhammad Ali', 'MAB', '123456', 'Dummy Token', 'ios', 'muhammadalibtt@yahoo.com', '', NULL, 0, NULL, 2, NULL, NULL, 0),
(144, 'Zain Leo', 'Williams Wordsworth', 'sting6745', 'Dummy Token', 'android', 'usmanamir616@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(145, 'Sirat saeed', 'sirat', 'chaudary', 'Dummy Token', 'ios', 'siratsaeed19@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(146, 'Anees Butt', 'Anees', 'loverboy', 'Dummy Token', 'android', 'ab587392@gmail.com', '', NULL, 0, NULL, 2, NULL, NULL, 0),
(147, 'Awais Sheikh', 'Sheikh07', 'mawais144', 'Dummy Token', 'ios', 'bbhm-f20-125@superior.edu.pk', '', NULL, 0, NULL, 2, NULL, NULL, 0),
(148, 'Taimoor Malik', 'Taimoor', 'fatima47', 'Dummy Token', 'android', 'azaan436@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(149, 'Abu Bakar Shahid Alvi', 'Abu Bakar', 'Mission@1234', 'Dummy Token', 'android', 'abubakaralvi778@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(150, 'Muhammad Azan', 'Azan', 'Azan112234', 'Dummy Token', 'android', 'mg9454617@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(151, 'Muiez Nadeem', 'mizz14', 'mizz114', 'Dummy Token', 'ios', 'muieznadeem14@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(153, 'Noman', 'Nomi', '123456', 'Dummy Token', 'android', 'nomi@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(154, 'Sikandar', 'sikandar', 'sikandar69', 'Dummy Token', 'android', 'sikandarkhan6969@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(156, 'Test', 'test', 'Apple123', 'DUMMY TOKEN', 'ios', 'test@icloud.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(157, 'Ibrahim', 'ibr', '123456', 'Dummy Token', 'ios', 'ahmadmustafahbutt@gmail.com', '', NULL, 0, NULL, 1, '2024-01-02 16:27:42', 1, 0),
(158, 'M Ali', 'mali', '123456', 'Dummy Token', 'ios', 'mali@yopmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(159, 'App review', 'bradbach76', 'apple123', 'Dummy Token', 'ios', 'bradbach76@icloud.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(160, 'Muiez Nadeem', 'BunxMiz', 'BUN_MIZ', 'Dummy Token', 'ios', 'muieznadeem123@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(161, 'Waqar Butt', 'Waqar777', 'Change.1', 'Dummy Token', 'android', 'johnwickchappter2@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(162, 'Fakhir', 'Fakhir', 'fakhir@123', 'Dummy Token', 'android', 'javedfakhir3@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(163, 'Zain', 'zainmalik', 'zain12345@', 'Dummy Token', 'android', 'abubakarzain2004@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(165, 'ImranAsif', 'ImranAsif', 'imran12345', 'Dummy Token', 'android', 'imasif339@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(166, 'Zain', 'zainarhsad', 'sting6745', 'Dummy Token', 'android', 'usmanamir616@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(167, 'Muzamil', '123', 'Muz@mil13', 'Dummy Token', 'android', 'Muzamilrj154@gmail.com', '03180049314', NULL, 0, NULL, 1, '2024-01-27 11:22:27', 1, 0),
(168, 'M.Sohail', '01', 'Sohail12', 'DUMMY TOKEN', 'android', 'Muzamilrj154@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(169, 'Aiman Ejaz', 'Aiman_13', 'Aiman_13', 'Dummy Token', 'android', 'aimanejaz055@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(170, 'Alishba Azhar', 'Alishba06', 'ALISHU', 'Dummy Token', 'android', 'alishbaazhar.06@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(171, 'Muhammad Sohail', 'Muzamil01', 'Muz@mil13', 'Dummy Token', 'android', 'Muzamilrj154@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(172, 'Kaleemullah Wajid', 'Kaleemullah', 'kaleem007', 'Dummy Token', 'android', 'kaleemwajid9@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(173, 'Abdul Moeez', 'moeez jutt', 'juttsab112233', 'Dummy Token', 'android', 'moeezj005@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(174, 'Waleed Khan', 'waleedkhan55', 'waleedkingkhan5', 'Dummy Token', 'android', 'wkk6515@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(175, 'Ahmad Raza', 'Ahmad raza', 'Abacus123', 'Dummy Token', 'android', 'ar7653241@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(176, 'Ahmad Mustafah', 'qwerty', '123456', 'Dummy Token', 'android', 'example@gmail.com', '11111222233', NULL, 0, NULL, 1, NULL, NULL, 0),
(177, 'Talal Butt', 'TalalButt10', 'aprilsmith', 'Dummy Token', 'android', 'tb50580@gmail.com', '', NULL, 0, NULL, 2, NULL, NULL, 0),
(178, 'Humaira', 'Humaira', 'huma1234', 'Dummy Token', 'android', 'humairalatif871@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(179, 'Noor shaikh', '@noor shaikh', '120934', 'Dummy Token', 'ios', 'princeflower786@icloud.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(181, 'Nouman', 'Ghaffar', 'nomi@751', 'DUMMY TOKEN', 'ios', 'noumanghaffar@9gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 1),
(182, 'Siratsaeed', 'Ali', '123123', 'DUMMY TOKEN', 'ios', 'siratsaeed19@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 1),
(183, 'Ch Ali', 'Ch Ali', 'chaudary', 'DUMMY TOKEN', 'ios', 'siratsaaed19@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(184, 'Azeem butt', '_azeembutt', 'azeemhassan0309', 'Dummy Token', 'android', 'azeemhassan0678@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(185, 'Azeem butt', '_Azeem', 'azeemhassan0309', 'DUMMY TOKEN', 'android', 'azeemhassan0678@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 1),
(186, 'Nouman Ghaffar', 'Noumanghaffar', 'nomi751', 'Dummy Token', 'ios', 'noumanghaffar@9gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(187, 'Chaudary', 'Chaudary', '111222', 'DUMMY TOKEN', 'ios', 'siratsaeed19@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 1),
(188, 'Siratsaeed', 'Sirat saeed', '123456', 'DUMMY TOKEN', 'ios', 'siratsaeed19@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 1),
(189, 'Ammar Hassan', 'nafi', '000000', 'DUMMY TOKEN', 'android', 'ammarhassan7997@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 1),
(190, 'Abdul Aziz', 'Abdul Aziz', 'aziz00', 'DUMMY TOKEN', 'android', 'azizbutt390@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 1),
(191, 'Abdul Muiez', 'Miz_48', 'Miz@123', 'DUMMY TOKEN', 'ios', 'muieznadeem48@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 1),
(192, 'Muiez Nadeem', 'Miz1933', 'Miz1933@', 'DUMMY TOKEN', 'ios', 'muieznadeem48@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 1),
(193, 'sajjad', 'sajjadk', '123456', 'DUMMY TOKEN', 'android', 'sajjadali70567@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 1),
(194, 'Sirat saaed', 'Ali302', '123456', 'DUMMY TOKEN', 'ios', 'siratsaeed19@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 1),
(195, 'Moeez', 'moeez8', '123456', 'Dummy Token', 'ios', 'abc@gmail.com', '', NULL, 0, NULL, 2, NULL, NULL, 0),
(196, 'Anees butt', 'aneesbutt', '654321', 'Dummy Token', 'android', 'wa@gmail.com', '', NULL, 0, NULL, 2, NULL, NULL, 0),
(197, 'Testing5', 'test5', '1234567', 'DUMMY TOKEN', 'android', 'testing@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 1),
(198, 'LAIBA MALIK', 'laiba_malik', 'laiba11', 'Dummy Token', 'android', 'laibamalik00@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(199, 'LAIBA Malik', 'laiba00', 'laiba123', 'DUMMY TOKEN', 'android', 'faiqaa112004@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 1),
(200, 'LAIBA Malik', 'laiba000', '123098', 'DUMMY TOKEN', 'android', 'faiqaa112004@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 1),
(201, 'Alpha', 'alpha', '12345678', 'DUMMY TOKEN', 'android', 'wajihulhasan.syed09@outlook.com', '', NULL, 0, NULL, 1, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_activity`
--

CREATE TABLE `user_activity` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `last_login_time` datetime NOT NULL,
  `last_logout_time` datetime DEFAULT NULL,
  `last_login_platfoam` varchar(255) NOT NULL,
  `last_logout_platfoam` varchar(255) NOT NULL,
  `device_token` varchar(1000) DEFAULT NULL,
  `device_info` varchar(1000) DEFAULT NULL,
  `is_session_completed` tinyint(4) NOT NULL,
  `id_deleted` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_activity`
--

INSERT INTO `user_activity` (`id`, `user_id`, `last_login_time`, `last_logout_time`, `last_login_platfoam`, `last_logout_platfoam`, `device_token`, `device_info`, `is_session_completed`, `id_deleted`) VALUES
(1, 114, '2023-12-30 13:13:09', '2023-12-30 13:13:43', 'android', 'FORCE', 'ghfffgh', 'asdjkfbajksdfbjasbdfasdf', 1, 0),
(2, 114, '2023-12-30 13:13:43', '2024-02-02 17:10:30', 'android', 'FORCE', 'ghfffgh', 'asdjkfbajksdfbjasbdfasdf', 1, 0),
(3, 121, '2024-01-27 10:14:15', '2024-01-27 10:18:17', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(4, 121, '2024-01-27 10:18:17', '2024-01-27 11:44:50', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(5, 121, '2024-01-27 10:18:17', '2024-01-27 11:44:50', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(6, 121, '2024-01-27 11:44:50', '2024-01-27 11:47:59', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(7, 121, '2024-01-27 11:47:59', '2024-01-31 12:17:25', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(8, 114, '2024-01-29 15:55:34', '2024-01-31 12:17:37', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(9, 177, '2024-01-29 16:12:22', '2024-01-29 16:12:25', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(10, 177, '2024-01-29 16:12:25', NULL, 'web', '', '12345', 'Edge Browser', 0, 0),
(11, 138, '2024-01-31 11:49:12', NULL, 'web', '', '12345', 'Edge Browser', 0, 0),
(12, 121, '2024-01-31 12:17:25', NULL, 'web', '', '12345', 'Edge Browser', 0, 0),
(13, 114, '2024-01-31 12:17:37', '2024-01-31 12:23:53', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(14, 114, '2024-01-31 12:23:53', '2024-01-31 12:24:03', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(15, 114, '2024-01-31 12:24:03', '2024-01-31 12:34:33', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(16, 114, '2024-01-31 12:34:33', '2024-01-31 12:40:55', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(17, 114, '2024-01-31 12:40:55', '2024-01-31 12:49:31', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(18, 114, '2024-01-31 12:49:31', '2024-01-31 13:19:13', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(19, 114, '2024-01-31 13:19:13', '2024-01-31 13:22:35', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(20, 114, '2024-01-31 13:22:35', '2024-01-31 13:25:50', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(21, 114, '2024-01-31 13:25:50', '2024-01-31 14:49:19', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(22, 114, '2024-01-31 14:49:19', '2024-01-31 16:15:04', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(23, 114, '2024-01-31 16:15:04', '2024-01-31 16:15:06', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(24, 114, '2024-01-31 16:15:06', '2024-01-31 16:15:12', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(25, 114, '2024-01-31 16:15:12', '2024-01-31 16:15:26', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(26, 114, '2024-01-31 16:15:26', '2024-02-01 20:56:14', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(27, 149, '2024-01-31 19:52:35', '2024-01-31 21:05:17', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(28, 183, '2024-01-31 20:42:26', NULL, 'web', '', '12345', 'Edge Browser', 0, 0),
(29, 154, '2024-01-31 21:02:17', NULL, 'web', '', '12345', 'Edge Browser', 0, 0),
(30, 134, '2024-01-31 21:02:46', NULL, 'web', '', '12345', 'Edge Browser', 0, 0),
(31, 149, '2024-01-31 21:05:17', NULL, 'web', '', '12345', 'Edge Browser', 0, 0),
(32, 114, '2024-02-01 20:56:14', '2024-02-02 10:05:30', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(33, 114, '2024-02-02 10:05:30', '2024-02-02 10:05:35', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(34, 114, '2024-02-02 10:05:35', '2024-02-02 10:10:47', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(35, 114, '2024-02-02 10:10:47', '2024-02-02 10:12:03', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(36, 114, '2024-02-02 10:12:03', '2024-02-02 10:15:18', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(37, 114, '2024-02-02 10:15:18', '2024-02-02 10:17:08', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(38, 114, '2024-02-02 10:17:08', '2024-02-02 10:17:21', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(39, 114, '2024-02-02 10:17:21', '2024-02-02 10:20:21', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(40, 114, '2024-02-02 10:20:21', '2024-02-02 10:30:24', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(41, 114, '2024-02-02 10:30:24', '2024-02-02 10:34:10', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(42, 114, '2024-02-02 10:34:10', '2024-02-02 10:45:21', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(43, 114, '2024-02-02 10:45:21', '2024-02-02 10:48:23', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(44, 114, '2024-02-02 10:45:21', '2024-02-02 10:48:23', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(45, 114, '2024-02-02 10:45:21', '2024-02-02 10:48:23', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(46, 114, '2024-02-02 10:48:23', '2024-02-02 10:51:12', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(47, 114, '2024-02-02 10:51:12', '2024-02-02 10:52:26', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(48, 114, '2024-02-02 10:52:26', '2024-02-02 10:52:36', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(49, 114, '2024-02-02 10:52:36', '2024-02-02 10:53:29', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(50, 114, '2024-02-02 10:53:29', '2024-02-02 11:48:23', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(51, 114, '2024-02-02 11:48:23', '2024-02-02 17:13:12', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(52, 114, '2024-02-02 17:10:30', '2024-02-03 06:51:09', 'android', 'FORCE', 'ghfffgh', 'asdjkfbajksdfbjasbdfasdf', 1, 0),
(53, 114, '2024-02-02 17:13:12', NULL, 'web', '', '12345', 'Edge Browser', 0, 0),
(54, 114, '2024-02-03 06:51:09', NULL, 'android', '', 'ghfffgh', 'asdjkfbajksdfbjasbdfasdf', 0, 0),
(55, 169, '2024-02-03 16:45:15', '2024-02-03 16:45:21', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(56, 169, '2024-02-03 16:45:21', '2024-02-03 16:45:22', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(57, 169, '2024-02-03 16:45:22', '2024-02-03 16:45:25', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(58, 169, '2024-02-03 16:45:25', '2024-02-03 16:45:25', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(59, 169, '2024-02-03 16:45:25', '2024-02-03 16:45:31', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(60, 169, '2024-02-03 16:45:31', '2024-02-03 16:45:31', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(61, 169, '2024-02-03 16:45:31', '2024-02-03 16:45:31', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(62, 169, '2024-02-03 16:45:31', NULL, 'web', '', '12345', 'Edge Browser', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_attendances`
--

CREATE TABLE `user_attendances` (
  `id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `is_active` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `leaves` tinyint(1) NOT NULL,
  `comments` varchar(255) NOT NULL,
  `shift_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `deleted_time` timestamp NULL DEFAULT NULL,
  `approved_time` timestamp NULL DEFAULT NULL,
  `modify_time` timestamp NULL DEFAULT NULL,
  `deny_by` int(25) NOT NULL,
  `deny_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_attendances`
--

INSERT INTO `user_attendances` (`id`, `start_time`, `end_time`, `is_active`, `user_id`, `status`, `leaves`, `comments`, `shift_id`, `team_id`, `created_by`, `deleted_by`, `approved_by`, `modify_by`, `created_time`, `deleted_time`, `approved_time`, `modify_time`, `deny_by`, `deny_time`) VALUES
(606, '2024-01-01 06:30:43', '2024-01-01 11:00:19', 1, 114, 2, 0, 'Testing 123', 7, 1, 114, NULL, NULL, NULL, '2024-01-01 10:44:05', NULL, NULL, NULL, 0, NULL),
(607, '2024-01-02 07:21:49', '2024-01-03 07:21:00', 1, 157, 1, 0, 'Testing 123', 7, 4, 157, NULL, NULL, NULL, '2024-01-02 07:22:02', NULL, NULL, NULL, 0, NULL),
(608, '2024-01-04 03:11:00', '2024-01-04 11:23:00', 1, 125, 1, 0, 'Testing 123', 7, 6, 125, NULL, NULL, NULL, '2024-01-04 11:14:43', NULL, NULL, NULL, 0, NULL),
(609, '2024-01-01 03:14:00', '2024-01-01 11:25:00', 1, 131, 1, 0, 'Testing 123', 7, 1, 131, NULL, NULL, NULL, '2024-01-04 11:15:31', NULL, NULL, NULL, 0, NULL),
(610, '2024-01-02 03:15:00', '2024-01-02 11:15:00', 1, 131, 1, 0, 'Testing 123', 7, 1, 131, NULL, NULL, NULL, '2024-01-04 11:15:58', NULL, NULL, NULL, 0, NULL),
(611, '2024-01-03 03:16:00', '2024-01-03 11:16:00', 1, 131, 1, 0, 'Testing 123', 7, 1, 131, NULL, NULL, NULL, '2024-01-04 11:16:17', NULL, NULL, NULL, 0, NULL),
(612, '2024-01-04 03:26:00', '2024-01-04 11:24:00', 1, 131, 1, 0, 'Testing 123', 7, 1, 131, NULL, NULL, NULL, '2024-01-04 11:16:38', NULL, NULL, NULL, 0, NULL),
(613, '2024-01-04 13:00:24', '2024-01-04 18:45:24', 1, 114, 2, 0, 'Testing 123', 8, 1, 114, NULL, NULL, NULL, '2024-01-04 18:41:59', NULL, NULL, NULL, 0, NULL),
(614, '2024-01-04 11:50:01', '2024-01-04 18:50:01', 1, 114, 3, 0, 'Testing 123', 9, 5, 114, NULL, NULL, NULL, '2024-01-04 18:50:18', NULL, NULL, NULL, 0, NULL),
(615, '2024-01-05 10:30:58', '2024-01-05 19:50:48', 1, 137, 1, 0, 'Testing 123', 8, 1, 137, NULL, NULL, NULL, '2024-01-05 12:22:59', NULL, NULL, NULL, 0, NULL),
(616, '2024-01-06 03:21:00', '2024-01-06 11:24:38', 1, 131, 1, 0, 'Testing 123', 7, 1, 131, NULL, NULL, NULL, '2024-01-06 11:24:55', NULL, NULL, NULL, 0, NULL),
(617, '2024-01-08 06:00:40', '2024-01-08 18:00:05', 1, 114, 2, 0, 'Testing 123', 7, 5, 114, NULL, NULL, NULL, '2024-01-08 16:55:01', NULL, NULL, NULL, 0, NULL),
(618, '2024-01-11 13:06:10', NULL, 1, 114, 1, 0, 'Testing 123', 9, 4, 114, NULL, NULL, NULL, '2024-01-11 16:10:42', NULL, NULL, NULL, 0, NULL),
(619, '2024-01-10 19:30:00', '2024-01-11 04:03:00', 1, 137, 1, 0, 'Testing 123', 9, 1, 137, NULL, NULL, NULL, '2024-01-12 03:31:49', NULL, NULL, NULL, 0, NULL),
(620, '2024-01-11 19:40:56', '2024-01-12 03:41:56', 1, 137, 1, 0, 'Testing 123', 9, 1, 137, NULL, NULL, NULL, '2024-01-12 03:32:20', NULL, NULL, NULL, 0, NULL),
(621, '2024-01-27 10:19:00', '2024-01-27 10:19:00', 1, 121, 1, 0, 'Testing 123', 7, 18, 121, NULL, NULL, NULL, '2024-01-27 10:19:28', NULL, NULL, NULL, 0, NULL),
(622, '2024-01-27 11:40:00', '2024-01-27 19:18:17', 1, 172, 1, 0, 'Testing 123', 8, 1, 172, NULL, NULL, NULL, '2024-01-27 12:17:58', NULL, NULL, NULL, 0, NULL),
(623, '2024-01-27 11:25:00', '2024-01-27 19:25:00', 1, 170, 1, 0, 'Testing 123', 8, 6, 170, NULL, NULL, NULL, '2024-01-27 21:32:37', NULL, NULL, NULL, 0, NULL),
(624, '2024-01-28 03:20:00', '2024-01-28 11:25:00', 1, 125, 1, 0, 'Testing 123', 7, 6, 125, NULL, NULL, NULL, '2024-01-28 04:12:28', NULL, NULL, NULL, 0, NULL),
(625, '2024-01-28 11:05:00', '2024-01-28 20:20:00', 1, 170, 1, 0, 'Testing 123', 8, 6, 170, NULL, NULL, NULL, '2024-01-28 22:56:34', NULL, NULL, NULL, 0, NULL),
(626, '2024-01-29 13:17:23', '2024-01-29 13:17:23', 1, 114, 2, 0, 'Testing 123', 8, 4, 114, NULL, NULL, NULL, '2024-01-29 13:17:31', NULL, NULL, NULL, 0, NULL),
(627, '2024-01-29 08:00:00', '2024-01-29 17:17:00', 1, 177, 2, 0, 'Testing 123', 7, 19, 177, NULL, NULL, NULL, '2024-01-29 16:17:43', NULL, NULL, NULL, 0, NULL),
(628, '2024-01-29 11:39:00', '2024-01-29 19:30:00', 1, 170, 2, 0, 'Testing 123', 8, 6, 170, NULL, NULL, NULL, '2024-01-30 03:28:33', NULL, NULL, NULL, 0, NULL),
(629, '2024-01-30 11:31:00', '2024-01-30 18:57:00', 1, 172, 2, 0, 'Testing 123', 8, 1, 172, NULL, NULL, NULL, '2024-01-30 11:43:13', NULL, NULL, NULL, 0, NULL),
(630, '2024-01-30 09:00:00', '2024-01-29 19:15:00', 1, 177, 2, 0, 'Testing 123', 8, 19, 177, NULL, NULL, NULL, '2024-01-30 12:28:13', NULL, NULL, NULL, 0, NULL),
(631, '2024-01-30 11:50:00', '2024-01-30 19:46:00', 1, 170, 2, 0, 'Testing 123', 8, 6, 170, NULL, NULL, NULL, '2024-01-31 03:35:03', NULL, NULL, NULL, 0, NULL),
(632, '2024-01-31 09:00:00', '2024-01-31 19:51:00', 1, 177, 2, 0, 'Testing 123', 8, 19, 177, NULL, NULL, NULL, '2024-01-31 09:56:46', NULL, NULL, NULL, 0, NULL),
(633, '2024-01-31 11:30:00', '2024-01-31 19:19:00', 1, 172, 2, 0, 'Testing 123', 8, 1, 172, NULL, NULL, NULL, '2024-01-31 11:49:22', NULL, NULL, NULL, 0, NULL),
(634, '2024-01-01 12:25:00', NULL, 1, 114, 1, 0, 'Testing 123', 7, 4, 114, NULL, NULL, NULL, '2024-01-31 12:26:34', NULL, NULL, NULL, 0, NULL),
(635, '2024-01-31 13:35:00', '2024-02-02 19:36:11', 1, 114, 2, 0, 'Testing 123', 8, 5, 114, NULL, NULL, NULL, '2024-01-31 13:35:51', NULL, NULL, NULL, 0, NULL),
(636, '2024-01-25 13:37:00', NULL, 1, 114, 1, 0, 'Testing 123', 8, 6, 114, NULL, NULL, NULL, '2024-01-31 13:38:00', NULL, NULL, NULL, 0, NULL),
(637, '2024-01-31 08:42:00', NULL, 1, 114, 1, 0, 'Testing 123', 7, 1, 114, NULL, NULL, NULL, '2024-01-31 13:42:47', NULL, NULL, NULL, 0, NULL),
(638, '2024-01-31 13:47:22', NULL, 1, 114, 1, 0, 'Testing 123', 8, 4, 114, NULL, NULL, NULL, '2024-01-31 13:47:30', NULL, NULL, NULL, 0, NULL),
(639, '2024-01-24 13:50:00', NULL, 1, 114, 1, 0, 'Testing 123', 9, 1, 114, NULL, NULL, NULL, '2024-01-31 13:50:14', NULL, NULL, NULL, 0, NULL),
(640, '2024-01-31 13:53:00', NULL, 1, 114, 1, 0, 'Testing 123', 9, 1, 114, NULL, NULL, NULL, '2024-01-31 13:53:12', NULL, NULL, NULL, 0, NULL),
(641, '2024-01-31 13:55:00', NULL, 1, 114, 1, 0, 'Testing 123', 9, 1, 114, NULL, NULL, NULL, '2024-01-31 13:55:22', NULL, NULL, NULL, 0, NULL),
(642, '2024-01-31 14:10:00', '2024-02-03 11:36:00', 1, 114, 2, 0, 'Testing 123', 9, 1, 114, NULL, NULL, NULL, '2024-01-31 14:10:38', NULL, NULL, NULL, 0, NULL),
(643, '2024-01-31 14:34:00', NULL, 1, 114, 1, 0, 'Testing 123', 9, 1, 114, NULL, NULL, NULL, '2024-01-31 14:35:01', NULL, NULL, NULL, 0, NULL),
(644, '2024-01-31 14:35:00', '2024-02-08 10:31:00', 1, 114, 2, 0, 'Testing 123', 9, 5, 114, NULL, NULL, NULL, '2024-01-31 14:35:33', NULL, NULL, NULL, 0, NULL),
(645, '2024-01-31 19:00:00', '2024-02-01 04:48:36', 1, 174, 2, 0, 'Testing 123', 9, 5, 174, NULL, NULL, NULL, '2024-01-31 19:41:39', NULL, NULL, NULL, 0, NULL),
(646, '2024-01-31 19:00:00', '2024-02-01 04:48:47', 1, 175, 2, 0, 'Testing 123', 9, 5, 175, NULL, NULL, NULL, '2024-01-31 19:42:47', NULL, NULL, NULL, 0, NULL),
(647, '2024-01-31 19:20:00', '2024-02-01 03:44:29', 1, 173, 2, 0, 'Testing 123', 9, 1, 173, NULL, NULL, NULL, '2024-01-31 21:09:14', NULL, NULL, NULL, 0, NULL),
(648, '2024-01-31 11:33:00', '2024-01-31 19:05:00', 1, 170, 2, 0, 'Testing 123', 8, 6, 170, NULL, NULL, NULL, '2024-01-31 23:09:05', NULL, NULL, NULL, 0, NULL),
(649, '2024-02-01 18:20:23', '2024-02-01 03:05:23', 1, 186, 2, 0, 'Testing 123', 9, 19, 186, NULL, NULL, NULL, '2024-02-01 03:05:20', NULL, NULL, NULL, 0, NULL),
(650, '2024-02-01 07:00:00', '2024-02-01 03:08:00', 1, 184, 2, 0, 'Testing 123', 9, 19, 184, NULL, NULL, NULL, '2024-02-01 03:08:06', NULL, NULL, NULL, 0, NULL),
(651, '2024-02-01 07:03:00', '2024-02-01 03:10:00', 1, 149, 2, 0, 'Testing 123', 9, 6, 149, NULL, NULL, NULL, '2024-02-01 03:37:24', NULL, NULL, NULL, 0, NULL),
(652, '2024-02-01 03:40:16', '2024-02-01 03:40:16', 1, 179, 2, 0, 'Testing 123', 7, 4, 179, NULL, NULL, NULL, '2024-02-01 03:53:46', NULL, NULL, NULL, 0, NULL),
(653, '2024-02-01 03:51:00', '2024-02-01 11:35:00', 1, 161, 3, 0, 'Testing 123', 7, 5, 161, NULL, NULL, NULL, '2024-02-01 04:02:41', NULL, NULL, NULL, 0, NULL),
(654, '2024-02-01 03:51:00', '2024-02-01 11:34:00', 1, 166, 3, 0, 'Testing 123', 7, 5, 166, NULL, NULL, NULL, '2024-02-01 04:02:53', NULL, NULL, NULL, 0, NULL),
(655, '2024-02-01 04:00:00', '2024-02-01 12:23:09', 1, 163, 2, 0, 'Testing 123', 7, 4, 163, NULL, NULL, NULL, '2024-02-01 04:16:01', NULL, NULL, NULL, 0, NULL),
(656, '2024-02-01 03:34:00', '2024-02-01 11:30:00', 1, 131, 2, 0, 'Testing 123', 7, 1, 131, NULL, NULL, NULL, '2024-02-01 04:22:45', NULL, NULL, NULL, 0, NULL),
(657, '2024-02-01 04:28:00', '2024-02-01 15:01:43', 1, 126, 2, 0, 'Testing 123', 7, 17, 126, NULL, NULL, NULL, '2024-02-01 05:13:05', NULL, NULL, NULL, 0, NULL),
(658, '2024-02-01 05:13:39', '2024-02-01 14:32:08', 1, 141, 2, 0, 'Testing 123', 7, 17, 141, NULL, NULL, NULL, '2024-02-01 05:13:52', NULL, NULL, NULL, 0, NULL),
(659, '2024-02-01 05:18:53', '2024-02-01 15:05:58', 1, 154, 2, 0, 'Testing 123', 7, 17, 154, NULL, NULL, NULL, '2024-02-01 05:14:37', NULL, NULL, NULL, 0, NULL),
(660, '2024-02-01 04:18:00', '2024-02-01 13:00:00', 1, 136, 2, 0, 'Testing 123', 7, 18, 136, NULL, NULL, NULL, '2024-02-01 05:29:41', NULL, NULL, NULL, 0, NULL),
(661, '2024-02-01 05:20:00', '2024-02-01 11:23:00', 1, 125, 2, 0, 'Testing 123', 7, 6, 125, NULL, NULL, NULL, '2024-02-01 06:26:30', NULL, NULL, NULL, 0, NULL),
(662, '2024-02-01 06:27:00', '2024-02-01 13:48:00', 1, 123, 2, 0, 'Testing 123', 7, 18, 123, NULL, NULL, NULL, '2024-02-01 06:27:20', NULL, NULL, NULL, 0, NULL),
(663, '2024-02-01 05:45:00', '2024-02-01 13:14:00', 1, 134, 2, 0, 'Testing 123', 7, 18, 134, NULL, NULL, NULL, '2024-02-01 07:52:14', NULL, NULL, NULL, 0, NULL),
(664, '2024-02-01 07:00:00', '2024-02-01 18:15:00', 1, 177, 2, 0, 'Testing 123', 7, 19, 177, NULL, NULL, NULL, '2024-02-01 09:21:31', NULL, NULL, NULL, 0, NULL),
(665, '2024-02-01 10:57:00', '2024-02-06 19:09:15', 1, 171, 3, 0, 'Testing 123', 8, 5, 171, NULL, NULL, NULL, '2024-02-01 10:57:57', NULL, NULL, NULL, 0, NULL),
(666, '2024-02-01 11:20:51', '2024-02-01 18:57:00', 1, 165, 2, 0, 'Testing 123', 8, 4, 165, NULL, NULL, NULL, '2024-02-01 11:21:02', NULL, NULL, NULL, 0, NULL),
(667, '2024-02-01 03:52:00', '2024-02-01 11:33:55', 1, 161, 2, 0, 'Testing 123', 7, 5, 161, NULL, NULL, NULL, '2024-02-01 11:34:23', NULL, NULL, NULL, 0, NULL),
(668, '2024-02-01 15:50:00', '2024-02-01 11:35:00', 1, 166, 2, 0, 'Testing 123', 7, 5, 166, NULL, NULL, NULL, '2024-02-01 11:35:26', NULL, NULL, NULL, 0, NULL),
(669, '2024-02-01 12:02:00', '2024-02-01 19:09:52', 1, 172, 2, 0, 'Testing 123', 8, 1, 172, NULL, NULL, NULL, '2024-02-01 12:21:45', NULL, NULL, NULL, 0, NULL),
(670, '2024-02-01 03:40:48', '2024-02-01 11:10:48', 1, 179, 2, 0, 'Testing 123', 7, 4, 179, NULL, NULL, NULL, '2024-02-01 12:22:47', NULL, NULL, NULL, 0, NULL),
(671, '2024-02-01 08:30:14', '2024-02-01 17:00:14', 1, 137, 2, 0, 'Testing 123', 8, 1, 137, NULL, NULL, NULL, '2024-02-01 16:10:52', NULL, NULL, NULL, 0, NULL),
(672, '2024-02-01 19:00:00', '2024-02-02 04:30:01', 1, 175, 2, 0, 'Testing 123', 9, 5, 175, NULL, NULL, NULL, '2024-02-01 19:05:25', NULL, NULL, NULL, 0, NULL),
(673, '2024-02-01 19:05:00', '2024-02-02 03:24:32', 1, 173, 2, 0, 'Testing 123', 9, 1, 173, NULL, NULL, NULL, '2024-02-01 19:10:21', NULL, NULL, NULL, 0, NULL),
(674, '2024-02-01 10:57:00', '2024-02-01 19:12:11', 1, 171, 3, 0, 'Testing 123', 8, 5, 171, NULL, NULL, NULL, '2024-02-01 19:13:29', NULL, NULL, NULL, 0, NULL),
(675, '2024-02-01 10:57:00', '2024-02-01 19:15:31', 1, 171, 2, 0, 'Testing 123', 8, 5, 171, NULL, NULL, NULL, '2024-02-01 19:16:19', NULL, NULL, NULL, 0, NULL),
(676, '2024-02-01 19:00:00', '2024-02-02 04:29:54', 1, 174, 2, 0, 'Testing 123', 9, 5, 174, NULL, NULL, NULL, '2024-02-01 20:00:44', NULL, NULL, NULL, 0, NULL),
(677, '2024-02-01 11:48:00', '2024-02-01 20:21:00', 1, 170, 2, 0, 'Testing 123', 8, 6, 170, NULL, NULL, NULL, '2024-02-01 20:24:18', NULL, NULL, NULL, 0, NULL),
(678, '2024-02-02 02:52:44', '2024-02-02 11:10:43', 1, 124, 2, 0, 'Testing 123', 7, 6, 124, NULL, NULL, NULL, '2024-02-02 02:52:55', NULL, NULL, NULL, 0, NULL),
(679, '2024-02-02 05:30:01', '2024-02-02 03:02:01', 1, 186, 3, 0, 'Testing 123', 9, 19, 186, NULL, NULL, NULL, '2024-02-02 03:02:28', NULL, NULL, NULL, 0, NULL),
(680, '2024-02-02 07:00:00', '2024-02-02 03:06:00', 1, 184, 2, 0, 'Testing 123', 9, 19, 184, NULL, NULL, NULL, '2024-02-02 03:07:03', NULL, NULL, NULL, 0, NULL),
(681, '2024-02-02 04:06:00', '2024-02-02 15:44:13', 1, 126, 2, 0, 'Testing 123', 7, 17, 126, NULL, NULL, NULL, '2024-02-02 04:09:49', NULL, NULL, NULL, 0, NULL),
(682, '2024-02-02 04:20:00', '2024-02-02 12:58:17', 1, 136, 1, 0, 'Testing 123', 7, 18, 136, NULL, NULL, NULL, '2024-02-02 04:25:35', NULL, NULL, NULL, 0, NULL),
(683, '2024-02-02 04:25:44', '2024-02-02 12:12:16', 1, 163, 2, 0, 'Testing 123', 7, 4, 163, NULL, NULL, NULL, '2024-02-02 04:25:51', NULL, NULL, NULL, 0, NULL),
(684, '2024-02-02 04:43:36', '2024-02-02 14:39:16', 1, 141, 2, 0, 'Testing 123', 7, 17, 141, NULL, NULL, NULL, '2024-02-02 04:43:54', NULL, NULL, NULL, 0, NULL),
(685, '2024-02-02 05:02:59', '2024-02-02 15:47:42', 1, 154, 2, 0, 'Testing 123', 7, 17, 154, NULL, NULL, NULL, '2024-02-02 04:58:42', NULL, NULL, NULL, 0, NULL),
(686, '2024-02-02 05:29:00', '2024-02-02 13:31:07', 1, 123, 1, 0, 'Testing 123', 7, 18, 123, NULL, NULL, NULL, '2024-02-02 05:33:34', NULL, NULL, NULL, 0, NULL),
(687, '2024-02-02 05:10:00', '2024-02-02 13:16:00', 1, 134, 1, 0, 'Testing 123', 7, 18, 134, NULL, NULL, NULL, '2024-02-02 07:12:17', NULL, NULL, NULL, 0, NULL),
(688, '2024-02-02 03:15:27', '2024-02-02 11:05:27', 1, 179, 2, 0, 'Testing 123', 7, 4, 179, NULL, NULL, NULL, '2024-02-02 09:01:27', NULL, NULL, NULL, 0, NULL),
(689, '2024-02-02 08:30:00', '2024-02-02 18:13:00', 1, 177, 2, 0, 'Testing 123', 8, 19, 177, NULL, NULL, NULL, '2024-02-02 09:23:06', NULL, NULL, NULL, 0, NULL),
(690, '2024-02-02 10:46:00', NULL, 1, 114, 3, 0, 'Testing 123', 9, 4, 114, NULL, NULL, NULL, '2024-02-02 10:46:34', NULL, NULL, NULL, 0, NULL),
(691, '2024-02-02 07:47:00', NULL, 1, 114, 2, 0, 'Testing 123', 9, 1, 114, NULL, NULL, NULL, '2024-02-02 10:47:37', NULL, NULL, NULL, 0, NULL),
(692, '2024-02-02 06:49:00', NULL, 1, 114, 2, 0, 'Testing 123', 7, 5, 114, NULL, NULL, NULL, '2024-02-02 10:49:50', NULL, NULL, NULL, 0, NULL),
(693, '2024-02-02 10:54:00', '0000-00-00 00:00:00', 1, 114, 2, 0, 'Testing 123', 7, 5, 114, NULL, NULL, NULL, '2024-02-02 10:54:38', NULL, NULL, NULL, 0, NULL),
(694, '2024-02-02 03:10:00', '2024-02-02 11:01:33', 1, 161, 2, 0, 'Testing 123', 7, 5, 161, NULL, NULL, NULL, '2024-02-02 11:01:50', NULL, NULL, NULL, 0, NULL),
(695, '2024-02-02 15:10:00', '2024-02-02 11:01:15', 1, 166, 2, 0, 'Testing 123', 7, 5, 166, NULL, NULL, NULL, '2024-02-02 11:02:01', NULL, NULL, NULL, 0, NULL),
(696, '2024-02-02 10:55:00', '2024-02-01 19:15:00', 1, 171, 2, 0, 'Testing 123', 8, 5, 171, NULL, NULL, NULL, '2024-02-02 11:02:54', NULL, NULL, NULL, 0, NULL),
(697, '2024-02-02 11:05:00', '0000-00-00 00:00:00', 1, 114, 2, 0, 'Testing 123', 7, 5, 114, NULL, NULL, NULL, '2024-02-02 11:05:29', NULL, NULL, NULL, 0, NULL),
(698, '2024-02-01 11:06:00', '0000-00-00 00:00:00', 1, 114, 2, 0, 'Testing 123', 8, 1, 114, NULL, NULL, NULL, '2024-02-02 11:06:12', NULL, NULL, NULL, 0, NULL),
(699, '2024-02-02 11:15:54', '2024-02-02 19:06:29', 1, 165, 2, 0, 'Testing 123', 8, 4, 165, NULL, NULL, NULL, '2024-02-02 11:16:06', NULL, NULL, NULL, 0, NULL),
(700, '2024-02-02 11:17:00', '2024-02-02 19:08:00', 1, 172, 2, 0, 'Testing 123', 8, 1, 172, NULL, NULL, NULL, '2024-02-02 11:31:35', NULL, NULL, NULL, 0, NULL),
(701, '2024-02-02 06:37:00', '2024-02-01 20:38:00', 1, 114, 3, 0, 'Testing 123', 8, 4, 114, NULL, NULL, NULL, '2024-02-02 11:38:24', NULL, NULL, NULL, 0, NULL),
(702, '2024-02-02 10:40:00', '2024-02-02 18:43:00', 1, 114, 2, 0, 'Testing 123', 8, 5, 114, NULL, NULL, NULL, '2024-02-02 11:40:18', NULL, NULL, NULL, 0, NULL),
(703, '2024-02-02 11:47:00', '2024-02-02 15:50:00', 1, 114, 3, 0, 'Testing 123', 8, 1, 114, NULL, NULL, NULL, '2024-02-02 11:47:09', NULL, NULL, NULL, 0, NULL),
(704, '2024-02-02 11:51:45', '2024-02-02 14:52:00', 1, 114, 2, 0, 'Testing 123', 8, 1, 114, NULL, NULL, NULL, '2024-02-02 11:51:50', NULL, NULL, NULL, 0, NULL),
(705, '2024-02-02 11:40:00', '2024-02-02 19:40:00', 1, 170, 2, 0, 'Testing 123', 8, 6, 170, NULL, NULL, NULL, '2024-02-02 15:02:35', NULL, NULL, NULL, 0, NULL),
(706, '2024-02-02 08:40:24', '2024-02-02 18:40:24', 1, 137, 2, 0, 'Testing 123', 8, 1, 137, NULL, NULL, NULL, '2024-02-02 18:34:50', NULL, NULL, NULL, 0, NULL),
(707, '2024-02-02 11:05:00', '2024-02-02 18:41:00', 1, 178, 2, 0, 'Testing 123', 8, 4, 178, NULL, NULL, NULL, '2024-02-02 18:42:13', NULL, NULL, NULL, 0, NULL),
(708, '2024-02-02 19:00:00', '2024-02-03 03:41:35', 1, 175, 2, 0, 'Testing 123', 9, 5, 175, NULL, NULL, NULL, '2024-02-02 19:07:56', NULL, NULL, NULL, 0, NULL),
(709, '2024-02-03 03:14:00', '2024-02-03 11:19:18', 1, 124, 2, 0, 'Testing 123', 7, 6, 124, NULL, NULL, NULL, '2024-02-03 03:16:20', NULL, NULL, NULL, 0, NULL),
(710, '2024-02-02 17:20:17', '2024-02-03 03:12:17', 1, 186, 2, 0, 'Testing 123', 9, 19, 186, NULL, NULL, NULL, '2024-02-03 03:30:21', NULL, NULL, NULL, 0, NULL),
(711, '2024-02-03 04:00:00', NULL, 1, 163, 1, 0, 'Testing 123', 7, 4, 163, NULL, NULL, NULL, '2024-02-03 04:09:41', NULL, NULL, NULL, 0, NULL),
(712, '2024-02-02 19:02:00', '2024-02-03 03:50:00', 1, 149, 2, 0, 'Testing 123', 9, 6, 149, NULL, NULL, NULL, '2024-02-03 04:10:26', NULL, NULL, NULL, 0, NULL),
(713, '2024-02-03 04:23:26', '2024-02-03 16:03:44', 1, 126, 2, 0, 'Testing 123', 7, 17, 126, NULL, NULL, NULL, '2024-02-03 04:23:38', NULL, NULL, NULL, 0, NULL),
(714, '2024-02-03 04:33:35', '2024-02-03 15:42:38', 1, 141, 2, 0, 'Testing 123', 7, 17, 141, NULL, NULL, NULL, '2024-02-03 04:33:51', NULL, NULL, NULL, 0, NULL),
(715, '2024-02-03 04:45:00', '2024-02-04 11:15:00', 1, 136, 1, 0, 'Testing 123', 7, 18, 136, NULL, NULL, NULL, '2024-02-03 05:00:15', NULL, NULL, NULL, 0, NULL),
(716, '2024-02-03 03:39:00', '2024-02-03 07:00:00', 1, 179, 2, 0, 'Testing 123', 7, 4, 179, NULL, NULL, NULL, '2024-02-03 06:50:48', NULL, NULL, NULL, 0, NULL),
(717, '2024-02-03 08:53:00', '2024-02-03 13:34:00', 1, 123, 1, 0, 'Testing 123', 7, 18, 123, NULL, NULL, NULL, '2024-02-03 09:11:15', NULL, NULL, NULL, 0, NULL),
(718, '2024-02-03 09:00:00', '2024-02-03 20:01:00', 1, 177, 2, 0, 'Testing 123', 8, 19, 177, NULL, NULL, NULL, '2024-02-03 09:11:59', NULL, NULL, NULL, 0, NULL),
(719, '2024-02-03 11:04:59', '2024-02-02 19:10:00', 1, 171, 2, 0, 'Testing 123', 8, 5, 171, NULL, NULL, NULL, '2024-02-03 11:05:35', NULL, NULL, NULL, 0, NULL),
(720, '2024-02-03 03:30:00', '2024-02-03 11:38:00', 1, 131, 2, 0, 'Testing 123', 7, 1, 131, NULL, NULL, NULL, '2024-02-03 11:07:49', NULL, NULL, NULL, 0, NULL),
(721, '2024-02-03 03:09:00', '2024-02-03 11:09:27', 1, 161, 2, 0, 'Testing 123', 7, 5, 161, NULL, NULL, NULL, '2024-02-03 11:09:39', NULL, NULL, NULL, 0, NULL),
(722, '2024-02-03 11:27:00', '2024-02-04 07:46:55', 1, 172, 2, 0, 'Testing 123', 8, 1, 172, NULL, NULL, NULL, '2024-02-03 11:52:03', NULL, NULL, NULL, 0, NULL),
(723, '2024-02-03 04:00:00', '2024-02-03 12:54:29', 1, 132, 2, 0, 'Testing 123', 7, 4, 132, NULL, NULL, NULL, '2024-02-03 12:55:06', NULL, NULL, NULL, 0, NULL),
(724, '2024-02-03 04:34:00', '2024-02-03 15:52:28', 1, 154, 2, 0, 'Testing 123', 7, 17, 154, NULL, NULL, NULL, '2024-02-03 15:48:26', NULL, NULL, NULL, 0, NULL),
(725, '2024-02-03 07:02:00', '2024-02-03 03:04:00', 1, 184, 2, 0, 'Testing 123', 9, 19, 184, NULL, NULL, NULL, '2024-02-03 16:54:52', NULL, NULL, NULL, 0, NULL),
(726, '2024-02-03 13:19:00', '2024-02-03 19:34:36', 1, 165, 2, 0, 'Testing 123', 8, 4, 165, NULL, NULL, NULL, '2024-02-03 17:52:57', NULL, NULL, NULL, 0, NULL),
(727, '2024-02-03 03:15:00', '2024-02-03 11:30:00', 1, 166, 2, 0, 'Testing 123', 7, 5, 166, NULL, NULL, NULL, '2024-02-03 17:54:42', NULL, NULL, NULL, 0, NULL),
(728, '2024-02-03 19:03:00', '2024-02-04 03:47:32', 1, 173, 2, 0, 'Testing 123', 9, 1, 173, NULL, NULL, NULL, '2024-02-03 19:15:29', NULL, NULL, NULL, 0, NULL),
(729, '2024-02-03 12:26:08', '2024-02-03 19:16:08', 1, 137, 2, 0, 'Testing 123', 8, 1, 137, NULL, NULL, NULL, '2024-02-03 19:16:35', NULL, NULL, NULL, 0, NULL),
(730, '2024-02-03 11:33:00', '2024-02-03 19:16:00', 1, 170, 2, 0, 'Testing 123', 8, 6, 170, NULL, NULL, NULL, '2024-02-03 23:51:45', NULL, NULL, NULL, 0, NULL),
(731, '2024-02-04 04:15:00', '2024-02-04 12:14:30', 1, 132, 2, 0, 'Testing 123', 7, 4, 132, NULL, NULL, NULL, '2024-02-04 04:19:32', NULL, NULL, NULL, 0, NULL),
(732, '2024-02-04 04:46:16', '2024-02-04 14:25:31', 1, 141, 2, 0, 'Testing 123', 7, 17, 141, NULL, NULL, NULL, '2024-02-04 04:47:11', NULL, NULL, NULL, 0, NULL),
(733, '2024-02-03 19:00:00', '2024-02-04 04:50:00', 1, 174, 2, 0, 'Testing 123', 9, 5, 174, NULL, NULL, NULL, '2024-02-04 04:56:50', NULL, NULL, NULL, 0, NULL),
(734, '2024-02-04 07:02:00', '2024-02-04 16:30:00', 1, 149, 2, 0, 'Testing 123', 9, 6, 149, NULL, NULL, NULL, '2024-02-04 05:04:38', NULL, NULL, NULL, 0, NULL),
(735, '2024-02-04 05:27:36', '2024-02-04 15:15:00', 1, 126, 2, 0, 'Testing 123', 7, 17, 126, NULL, NULL, NULL, '2024-02-04 05:27:45', NULL, NULL, NULL, 0, NULL),
(736, '2024-02-04 18:05:00', '2024-02-03 19:11:00', 1, 184, 2, 0, 'Testing 123', 9, 19, 184, NULL, NULL, NULL, '2024-02-04 07:11:42', NULL, NULL, NULL, 0, NULL),
(737, '2024-02-04 04:30:00', '2024-02-04 11:15:00', 1, 131, 2, 0, 'Testing 123', 7, 1, 131, NULL, NULL, NULL, '2024-02-04 07:33:33', NULL, NULL, NULL, 0, NULL),
(738, '2024-02-04 17:00:00', '2024-02-04 11:03:25', 1, 124, 2, 0, 'Testing 123', 7, 6, 124, NULL, NULL, NULL, '2024-02-04 11:03:46', NULL, NULL, NULL, 0, NULL),
(739, '2024-02-04 10:59:00', '2024-02-03 19:10:00', 1, 171, 2, 0, 'Testing 123', 8, 5, 171, NULL, NULL, NULL, '2024-02-04 11:16:45', NULL, NULL, NULL, 0, NULL),
(740, '2024-02-04 11:23:00', '2024-02-04 19:06:01', 1, 172, 2, 0, 'Testing 123', 8, 1, 172, NULL, NULL, NULL, '2024-02-04 11:55:03', NULL, NULL, NULL, 0, NULL),
(741, '2024-02-04 05:12:00', '2024-02-04 15:14:00', 1, 154, 2, 0, 'Testing 123', 7, 17, 154, NULL, NULL, NULL, '2024-02-04 15:08:21', NULL, NULL, NULL, 0, NULL),
(742, '2024-02-04 04:48:00', '2024-02-04 11:09:00', 1, 161, 2, 0, 'Testing 123', 7, 5, 161, NULL, NULL, NULL, '2024-02-04 17:25:27', NULL, NULL, NULL, 0, NULL),
(743, '2024-02-04 19:00:00', '2024-02-05 03:25:00', 1, 174, 2, 0, 'Testing 123', 9, 5, 174, NULL, NULL, NULL, '2024-02-04 19:02:48', NULL, NULL, NULL, 0, NULL),
(744, '2024-02-04 19:02:00', '2024-02-05 03:25:04', 1, 173, 2, 0, 'Testing 123', 9, 1, 173, NULL, NULL, NULL, '2024-02-04 19:04:24', NULL, NULL, NULL, 0, NULL),
(745, '2024-02-04 11:06:00', '2024-02-04 20:29:00', 1, 170, 2, 0, 'Testing 123', 8, 6, 170, NULL, NULL, NULL, '2024-02-04 20:32:18', NULL, NULL, NULL, 0, NULL),
(746, '2024-02-04 19:00:00', '2024-02-05 03:25:00', 1, 175, 2, 0, 'Testing 123', 9, 5, 175, NULL, NULL, NULL, '2024-02-04 22:31:17', NULL, NULL, NULL, 0, NULL),
(747, '2024-02-03 11:10:00', '2024-02-03 07:15:00', 1, 169, 2, 0, 'Testing 123', 8, 6, 169, NULL, NULL, NULL, '2024-02-05 03:01:10', NULL, NULL, NULL, 0, NULL),
(748, '2024-02-04 11:15:00', '2024-02-04 07:41:00', 1, 169, 2, 0, 'Testing 123', 8, 6, 169, NULL, NULL, NULL, '2024-02-05 03:02:02', NULL, NULL, NULL, 0, NULL),
(749, '2024-02-05 03:04:47', '2024-02-05 11:32:29', 1, 131, 2, 0, 'Testing 123', 7, 1, 131, NULL, NULL, NULL, '2024-02-05 03:05:02', NULL, NULL, NULL, 0, NULL),
(750, '2024-02-04 04:50:00', '2024-02-04 23:08:00', 1, 166, 2, 0, 'Testing 123', 7, 5, 166, NULL, NULL, NULL, '2024-02-05 03:34:31', NULL, NULL, NULL, 0, NULL),
(751, '2024-02-05 04:01:34', '2024-02-05 12:09:50', 1, 132, 2, 0, 'Testing 123', 7, 4, 132, NULL, NULL, NULL, '2024-02-05 04:01:41', NULL, NULL, NULL, 0, NULL),
(752, '2024-02-05 04:20:00', '2024-02-05 11:10:02', 1, 124, 2, 0, 'Testing 123', 7, 6, 124, NULL, NULL, NULL, '2024-02-05 04:37:28', NULL, NULL, NULL, 0, NULL),
(753, '2024-02-05 04:42:44', '2024-02-05 15:26:12', 1, 141, 1, 0, 'Testing 123', 7, 17, 141, NULL, NULL, NULL, '2024-02-05 04:43:07', NULL, NULL, NULL, 0, NULL),
(754, '2024-02-05 05:00:00', '2024-02-05 16:50:55', 1, 126, 1, 0, 'Testing 123', 7, 17, 126, NULL, NULL, NULL, '2024-02-05 05:02:17', NULL, NULL, NULL, 0, NULL),
(755, '2024-02-03 19:01:00', '2024-02-04 18:45:00', 1, 177, 2, 0, 'Testing 123', 8, 19, 177, NULL, NULL, NULL, '2024-02-05 10:45:58', NULL, NULL, NULL, 0, NULL),
(756, '2024-02-05 08:00:00', '2024-02-05 19:23:00', 1, 177, 2, 0, 'Testing 123', 8, 19, 177, NULL, NULL, NULL, '2024-02-05 10:46:26', NULL, NULL, NULL, 0, NULL),
(757, '2024-02-05 10:58:45', '2024-02-04 19:10:00', 1, 171, 2, 0, 'Testing 123', 8, 5, 171, NULL, NULL, NULL, '2024-02-05 10:59:14', NULL, NULL, NULL, 0, NULL),
(758, '2024-02-05 03:09:00', '2024-02-05 11:04:27', 1, 161, 2, 0, 'Testing 123', 7, 5, 161, NULL, NULL, NULL, '2024-02-05 11:05:09', NULL, NULL, NULL, 0, NULL),
(759, '2024-02-05 05:30:26', '2024-02-05 11:05:26', 1, 179, 2, 0, 'Testing 123', 7, 4, 179, NULL, NULL, NULL, '2024-02-05 11:05:58', NULL, NULL, NULL, 0, NULL),
(760, '2024-02-05 11:22:00', '2024-02-04 19:11:00', 1, 172, 2, 0, 'Testing 123', 8, 1, 172, NULL, NULL, NULL, '2024-02-05 11:31:55', NULL, NULL, NULL, 0, NULL),
(761, '2024-02-05 12:15:41', '2024-02-05 12:17:00', 1, 119, 3, 0, 'Testing 123', 7, 18, 119, NULL, NULL, NULL, '2024-02-05 12:15:50', NULL, NULL, NULL, 0, NULL),
(762, '2024-02-05 05:08:00', '2024-02-05 16:46:27', 1, 154, 1, 0, 'Testing 123', 7, 17, 154, NULL, NULL, NULL, '2024-02-05 16:42:24', NULL, NULL, NULL, 0, NULL),
(763, '2024-02-05 09:40:00', '2024-02-05 04:30:00', 1, 149, 2, 0, 'Testing 123', 9, 6, 149, NULL, NULL, NULL, '2024-02-05 17:16:00', NULL, NULL, NULL, 0, NULL),
(764, '2024-02-05 19:05:00', '2024-02-06 03:22:33', 1, 173, 2, 0, 'Testing 123', 9, 1, 173, NULL, NULL, NULL, '2024-02-05 19:08:14', NULL, NULL, NULL, 0, NULL),
(765, '2024-02-05 19:20:00', '2024-02-06 05:15:41', 1, 175, 2, 0, 'Testing 123', 9, 5, 175, NULL, NULL, NULL, '2024-02-05 19:28:30', NULL, NULL, NULL, 0, NULL),
(766, '2024-02-05 11:39:47', '2024-02-05 19:35:47', 1, 137, 2, 0, 'Testing 123', 8, 1, 137, NULL, NULL, NULL, '2024-02-05 19:32:07', NULL, NULL, NULL, 0, NULL),
(767, '2024-02-06 03:17:32', NULL, 1, 131, 1, 0, 'Testing 123', 7, 1, 131, NULL, NULL, NULL, '2024-02-06 03:17:37', NULL, NULL, NULL, 0, NULL),
(768, '2024-02-06 03:53:51', '2024-02-06 12:02:44', 1, 132, 1, 0, 'Testing 123', 7, 4, 132, NULL, NULL, NULL, '2024-02-06 03:53:55', NULL, NULL, NULL, 0, NULL),
(769, '2024-02-06 04:00:00', '2024-02-06 12:13:00', 1, 136, 1, 0, 'Testing 123', 7, 18, 136, NULL, NULL, NULL, '2024-02-06 04:17:03', NULL, NULL, NULL, 0, NULL),
(770, '2024-02-06 07:08:00', '2024-02-06 04:30:00', 1, 149, 2, 0, 'Testing 123', 9, 6, 149, NULL, NULL, NULL, '2024-02-06 05:02:12', NULL, NULL, NULL, 0, NULL),
(771, '2024-02-06 05:09:06', '2024-02-06 15:16:01', 1, 141, 1, 0, 'Testing 123', 7, 17, 141, NULL, NULL, NULL, '2024-02-06 05:10:03', NULL, NULL, NULL, 0, NULL),
(772, '2024-02-06 05:37:00', '2024-02-06 13:37:00', 1, 123, 1, 0, 'Testing 123', 7, 18, 123, NULL, NULL, NULL, '2024-02-06 05:42:14', NULL, NULL, NULL, 0, NULL),
(773, '2024-02-06 03:10:00', NULL, 1, 124, 1, 0, 'Testing 123', 7, 6, 124, NULL, NULL, NULL, '2024-02-06 06:51:06', NULL, NULL, NULL, 0, NULL),
(774, '2024-02-06 07:04:00', '2024-02-06 03:30:00', 1, 184, 2, 0, 'Testing 123', 9, 19, 184, NULL, NULL, NULL, '2024-02-06 07:56:39', NULL, NULL, NULL, 0, NULL),
(775, '2024-02-05 15:11:00', '2024-02-05 11:05:00', 1, 166, 2, 0, 'Testing 123', 7, 5, 166, NULL, NULL, NULL, '2024-02-06 11:42:57', NULL, NULL, NULL, 0, NULL),
(776, '2024-02-06 03:11:00', '2024-02-05 23:40:00', 1, 166, 2, 0, 'Testing 123', 7, 5, 166, NULL, NULL, NULL, '2024-02-06 11:43:47', NULL, NULL, NULL, 0, NULL),
(777, '2024-02-06 04:18:22', '2024-02-06 11:45:22', 1, 179, 1, 0, 'Testing 123', 7, 4, 179, NULL, NULL, NULL, '2024-02-06 11:45:51', NULL, NULL, NULL, 0, NULL),
(778, '2024-02-06 11:00:00', '2024-02-05 19:10:00', 1, 171, 2, 0, 'Testing 123', 8, 5, 171, NULL, NULL, NULL, '2024-02-06 12:11:01', NULL, NULL, NULL, 0, NULL),
(779, '2024-02-06 08:00:00', '2024-02-06 20:30:00', 1, 177, 2, 0, 'Testing 123', 8, 19, 177, NULL, NULL, NULL, '2024-02-06 15:23:45', NULL, NULL, NULL, 0, NULL),
(780, '2024-02-06 04:57:00', '2024-02-06 15:58:00', 1, 154, 1, 0, 'Testing 123', 7, 17, 154, NULL, NULL, NULL, '2024-02-06 15:53:59', NULL, NULL, NULL, 0, NULL),
(781, '2024-02-06 04:28:00', '2024-02-06 15:54:00', 1, 126, 1, 0, 'Testing 123', 7, 17, 126, NULL, NULL, NULL, '2024-02-06 15:54:23', NULL, NULL, NULL, 0, NULL),
(782, '2024-02-06 03:14:00', '2024-02-06 11:19:00', 1, 161, 2, 0, 'Testing 123', 7, 5, 161, NULL, NULL, NULL, '2024-02-06 17:02:03', NULL, NULL, NULL, 0, NULL),
(783, '2024-02-04 11:09:00', '2024-02-04 19:09:00', 1, 165, 1, 0, 'Testing 123', 8, 4, 165, NULL, NULL, NULL, '2024-02-06 19:10:57', NULL, NULL, NULL, 0, NULL),
(784, '2024-02-06 19:05:00', '2024-02-07 03:16:00', 1, 165, 2, 0, 'Testing 123', 9, 4, 165, NULL, NULL, NULL, '2024-02-06 19:11:27', NULL, NULL, NULL, 0, NULL),
(785, '2024-02-06 19:05:00', '2024-02-07 03:25:00', 1, 173, 1, 0, 'Testing 123', 9, 1, 173, NULL, NULL, NULL, '2024-02-06 19:16:28', NULL, NULL, NULL, 0, NULL),
(786, '2024-02-05 11:15:00', '2024-02-04 19:41:00', 1, 169, 1, 0, 'Testing 123', 8, 6, 169, NULL, NULL, NULL, '2024-02-06 19:39:18', NULL, NULL, NULL, 0, NULL),
(787, '2024-02-06 11:43:00', '2024-02-05 19:37:00', 1, 169, 1, 0, 'Testing 123', 8, 6, 169, NULL, NULL, NULL, '2024-02-06 19:40:27', NULL, NULL, NULL, 0, NULL),
(788, '2024-02-05 11:30:00', '2024-02-05 19:50:00', 1, 170, 1, 0, 'Testing 123', 8, 6, 170, NULL, NULL, NULL, '2024-02-06 20:59:01', NULL, NULL, NULL, 0, NULL),
(789, '2024-02-06 11:15:00', '2024-02-06 19:46:00', 1, 170, 1, 0, 'Testing 123', 8, 6, 170, NULL, NULL, NULL, '2024-02-06 20:59:32', NULL, NULL, NULL, 0, NULL),
(790, '2024-02-06 10:00:34', '2024-02-06 18:00:34', 1, 186, 2, 0, 'Testing 123', 8, 19, 186, NULL, NULL, NULL, '2024-02-07 03:00:17', NULL, NULL, NULL, 0, NULL),
(791, '2024-02-07 07:10:00', '2024-02-07 03:19:00', 1, 184, 2, 0, 'Testing 123', 9, 19, 184, NULL, NULL, NULL, '2024-02-07 03:03:59', NULL, NULL, NULL, 0, NULL),
(792, '2024-02-06 19:00:00', '2024-02-07 03:15:54', 1, 174, 2, 0, 'Testing 123', 9, 5, 174, NULL, NULL, NULL, '2024-02-07 03:16:26', NULL, NULL, NULL, 0, NULL),
(793, '2024-02-06 19:00:00', '2024-02-07 03:15:00', 1, 175, 2, 0, 'Testing 123', 9, 5, 175, NULL, NULL, NULL, '2024-02-07 03:16:47', NULL, NULL, NULL, 0, NULL),
(794, '2024-02-07 03:12:00', NULL, 1, 124, 1, 0, 'Testing 123', 7, 6, 124, NULL, NULL, NULL, '2024-02-07 03:18:50', NULL, NULL, NULL, 0, NULL),
(795, '2024-02-07 04:02:00', '2024-02-07 12:05:32', 1, 132, 1, 0, 'Testing 123', 7, 4, 132, NULL, NULL, NULL, '2024-02-07 04:17:07', NULL, NULL, NULL, 0, NULL),
(796, '2024-02-07 04:22:00', '2024-02-07 13:21:32', 1, 126, 1, 0, 'Testing 123', 7, 17, 126, NULL, NULL, NULL, '2024-02-07 04:25:35', NULL, NULL, NULL, 0, NULL),
(797, '2024-02-07 04:51:00', '2024-02-07 13:21:32', 1, 123, 1, 0, 'Testing 123', 7, 18, 123, NULL, NULL, NULL, '2024-02-07 04:57:36', NULL, NULL, NULL, 0, NULL),
(798, '2024-02-07 04:08:00', '2024-02-07 11:38:00', 1, 136, 1, 0, 'Testing 123', 7, 18, 136, NULL, NULL, NULL, '2024-02-07 05:10:21', NULL, NULL, NULL, 0, NULL),
(799, '2024-02-07 07:01:47', '2024-02-07 14:20:42', 1, 141, 1, 0, 'Testing 123', 7, 17, 141, NULL, NULL, NULL, '2024-02-07 07:02:06', NULL, NULL, NULL, 0, NULL),
(800, '2024-02-07 06:31:00', NULL, 1, 177, 1, 0, 'Testing 123', 7, 19, 177, NULL, NULL, NULL, '2024-02-07 07:31:29', NULL, NULL, NULL, 0, NULL),
(801, '2024-02-07 03:12:00', '2024-02-07 11:13:11', 1, 161, 1, 0, 'Testing 123', 7, 5, 161, NULL, NULL, NULL, '2024-02-07 11:13:24', NULL, NULL, NULL, 0, NULL),
(802, '2024-02-02 17:30:43', '2024-02-03 03:30:43', 1, 186, 1, 0, 'Testing 123', 9, 19, 186, NULL, NULL, NULL, '2024-02-07 11:14:42', NULL, NULL, NULL, 0, NULL),
(803, '2024-02-06 19:28:27', '2024-02-07 11:26:27', 1, 179, 1, 0, 'Testing 123', 7, 4, 179, NULL, NULL, NULL, '2024-02-07 11:29:55', NULL, NULL, NULL, 0, NULL),
(804, '2024-02-06 11:39:52', '2024-02-06 19:16:52', 1, 137, 1, 0, 'Testing 123', 8, 1, 137, NULL, NULL, NULL, '2024-02-07 11:42:18', NULL, NULL, NULL, 0, NULL),
(805, '2024-02-06 19:40:00', '2024-02-07 10:30:00', 1, 149, 1, 0, 'Testing 123', 9, 6, 149, NULL, NULL, NULL, '2024-02-07 11:55:42', NULL, NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_lookups`
--

CREATE TABLE `user_lookups` (
  `id` int(11) NOT NULL,
  `user_id` int(4) NOT NULL,
  `lookup_id` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_lookups`
--

INSERT INTO `user_lookups` (`id`, `user_id`, `lookup_id`, `is_active`) VALUES
(16, 114, 4, 1),
(17, 114, 7, 1),
(18, 114, 1, 1),
(19, 114, 5, 1),
(20, 114, 6, 1),
(22, 115, 8, 1),
(23, 114, 17, 1),
(24, 126, 17, 1),
(25, 126, 7, 1),
(26, 127, 17, 1),
(27, 127, 7, 1),
(28, 116, 5, 1),
(29, 116, 7, 1),
(30, 116, 8, 1),
(31, 116, 9, 1),
(33, 118, 8, 1),
(34, 130, 5, 1),
(35, 130, 7, 1),
(36, 132, 4, 1),
(37, 132, 7, 1),
(38, 121, 18, 1),
(39, 121, 7, 1),
(40, 119, 18, 1),
(41, 119, 7, 1),
(42, 123, 18, 1),
(43, 123, 7, 1),
(44, 121, 4, 1),
(45, 121, 1, 1),
(46, 121, 17, 1),
(47, 121, 5, 1),
(48, 121, 6, 1),
(49, 134, 18, 1),
(50, 134, 7, 1),
(51, 136, 18, 1),
(52, 136, 7, 1),
(53, 119, 4, 1),
(54, 119, 1, 1),
(55, 119, 17, 1),
(56, 119, 5, 1),
(57, 119, 6, 1),
(58, 139, 5, 1),
(59, 139, 9, 1),
(60, 125, 6, 1),
(61, 125, 7, 1),
(62, 122, 6, 1),
(63, 122, 7, 1),
(64, 122, 8, 1),
(65, 122, 9, 1),
(66, 135, 6, 1),
(67, 135, 8, 1),
(68, 124, 6, 1),
(69, 124, 7, 1),
(70, 120, 6, 1),
(74, 122, 1, 1),
(75, 134, 8, 1),
(76, 120, 8, 1),
(77, 118, 1, 1),
(78, 118, 7, 1),
(79, 118, 9, 1),
(80, 115, 7, 1),
(81, 115, 9, 1),
(82, 117, 1, 1),
(83, 117, 7, 1),
(84, 117, 8, 1),
(85, 117, 9, 1),
(86, 137, 1, 1),
(87, 137, 7, 1),
(88, 137, 8, 1),
(89, 137, 9, 1),
(90, 133, 4, 1),
(91, 133, 8, 1),
(92, 134, 4, 1),
(93, 143, 17, 1),
(94, 143, 18, 1),
(95, 143, 1, 1),
(96, 143, 4, 1),
(97, 143, 5, 1),
(98, 143, 6, 1),
(99, 143, 7, 1),
(100, 143, 8, 1),
(101, 143, 9, 1),
(102, 141, 17, 1),
(103, 141, 7, 1),
(104, 144, 5, 1),
(105, 144, 7, 1),
(106, 138, 4, 1),
(107, 138, 1, 1),
(109, 138, 6, 1),
(110, 138, 7, 1),
(111, 138, 8, 1),
(112, 138, 9, 1),
(113, 146, 4, 1),
(114, 146, 7, 1),
(115, 146, 8, 1),
(116, 146, 9, 1),
(117, 147, 1, 1),
(118, 147, 7, 1),
(119, 147, 8, 1),
(120, 147, 9, 1),
(122, 151, 7, 1),
(123, 151, 8, 1),
(124, 151, 9, 1),
(125, 150, 4, 1),
(126, 150, 7, 1),
(127, 150, 8, 1),
(128, 150, 9, 1),
(129, 148, 4, 1),
(130, 148, 7, 1),
(131, 148, 8, 1),
(132, 148, 9, 1),
(133, 149, 6, 1),
(134, 149, 8, 1),
(136, 153, 9, 1),
(137, 154, 17, 1),
(138, 154, 7, 1),
(139, 145, 4, 1),
(140, 145, 7, 1),
(141, 145, 8, 1),
(142, 145, 9, 1),
(143, 131, 1, 1),
(144, 131, 7, 1),
(145, 131, 8, 1),
(146, 131, 9, 1),
(147, 157, 4, 1),
(148, 157, 9, 1),
(149, 163, 4, 1),
(156, 165, 4, 1),
(157, 165, 7, 1),
(158, 165, 8, 1),
(159, 165, 9, 1),
(160, 171, 5, 1),
(162, 171, 8, 1),
(164, 172, 1, 1),
(165, 172, 7, 1),
(166, 172, 8, 1),
(167, 172, 9, 1),
(168, 170, 6, 1),
(169, 170, 7, 1),
(170, 170, 8, 1),
(171, 170, 9, 1),
(172, 177, 19, 1),
(173, 177, 7, 1),
(174, 177, 8, 1),
(175, 177, 9, 1),
(176, 174, 5, 1),
(177, 174, 9, 1),
(178, 175, 5, 1),
(179, 175, 9, 1),
(180, 161, 5, 1),
(181, 161, 7, 1),
(182, 166, 5, 1),
(183, 166, 7, 1),
(184, 114, 8, 1),
(185, 114, 9, 1),
(186, 114, 19, 1),
(187, 183, 4, 1),
(188, 183, 9, 1),
(189, 163, 7, 1),
(191, 178, 4, 1),
(192, 178, 8, 1),
(193, 179, 4, 1),
(194, 179, 7, 1),
(195, 186, 19, 1),
(197, 186, 8, 1),
(198, 186, 9, 1),
(199, 184, 19, 1),
(200, 184, 9, 1),
(201, 121, 19, 1),
(202, 173, 1, 1),
(203, 173, 7, 1),
(204, 173, 8, 1),
(205, 173, 9, 1),
(206, 195, 4, 1),
(207, 195, 7, 1),
(208, 195, 8, 1),
(209, 195, 9, 1),
(210, 196, 4, 1),
(211, 196, 7, 1),
(212, 196, 8, 1),
(213, 196, 9, 1),
(214, 169, 6, 1),
(215, 169, 8, 1),
(216, 198, 4, 1),
(217, 198, 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_permissions`
--

CREATE TABLE `user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_permissions`
--

INSERT INTO `user_permissions` (`id`, `user_id`, `permission_id`, `is_active`) VALUES
(27, 114, 7, 1),
(28, 114, 2, 1),
(29, 114, 6, 1),
(30, 115, 7, 1),
(31, 115, 2, 1),
(32, 116, 7, 1),
(33, 116, 2, 1),
(34, 117, 7, 1),
(35, 117, 2, 1),
(36, 118, 7, 1),
(37, 118, 2, 1),
(38, 119, 7, 1),
(39, 119, 2, 1),
(40, 120, 7, 1),
(41, 120, 2, 1),
(42, 121, 7, 1),
(43, 121, 2, 1),
(44, 122, 7, 1),
(45, 122, 2, 1),
(46, 123, 7, 1),
(47, 123, 2, 1),
(48, 124, 7, 1),
(49, 124, 2, 1),
(50, 125, 7, 1),
(51, 125, 2, 1),
(52, 126, 7, 1),
(53, 126, 2, 1),
(54, 127, 7, 1),
(55, 127, 2, 1),
(56, 126, 6, 1),
(59, 130, 7, 1),
(60, 130, 2, 1),
(61, 131, 7, 1),
(62, 131, 2, 1),
(63, 132, 7, 1),
(64, 132, 2, 1),
(65, 116, 6, 1),
(66, 133, 7, 1),
(67, 133, 2, 1),
(68, 121, 6, 1),
(69, 134, 7, 1),
(70, 134, 2, 1),
(71, 135, 7, 1),
(72, 135, 2, 1),
(73, 136, 7, 1),
(74, 136, 2, 1),
(75, 137, 7, 1),
(76, 137, 2, 1),
(77, 138, 7, 1),
(78, 138, 2, 1),
(79, 139, 7, 1),
(80, 139, 2, 1),
(81, 140, 7, 1),
(82, 140, 2, 1),
(83, 141, 7, 1),
(84, 141, 2, 1),
(85, 119, 6, 1),
(86, 142, 7, 1),
(87, 142, 2, 1),
(88, 122, 6, 1),
(89, 143, 7, 1),
(90, 143, 2, 1),
(91, 143, 6, 1),
(92, 144, 7, 1),
(93, 144, 2, 1),
(94, 145, 7, 1),
(95, 145, 2, 1),
(96, 138, 6, 1),
(97, 146, 7, 1),
(98, 146, 2, 1),
(99, 147, 7, 1),
(100, 147, 2, 1),
(101, 146, 6, 1),
(102, 147, 6, 1),
(103, 148, 7, 1),
(104, 148, 2, 1),
(105, 149, 7, 1),
(106, 149, 2, 1),
(107, 150, 7, 1),
(108, 150, 2, 1),
(109, 151, 7, 1),
(110, 151, 2, 1),
(113, 153, 7, 1),
(114, 153, 2, 1),
(115, 154, 7, 1),
(116, 154, 2, 1),
(117, 155, 7, 1),
(118, 155, 2, 1),
(119, 156, 7, 1),
(120, 156, 2, 1),
(121, 157, 7, 1),
(122, 157, 2, 1),
(123, 157, 6, 1),
(124, 157, 6, 1),
(125, 158, 7, 1),
(126, 158, 2, 1),
(127, 159, 7, 1),
(128, 159, 2, 1),
(129, 160, 7, 1),
(130, 160, 2, 1),
(131, 161, 7, 1),
(132, 161, 2, 1),
(133, 162, 7, 1),
(134, 162, 2, 1),
(135, 163, 7, 1),
(136, 163, 2, 1),
(141, 165, 7, 1),
(142, 165, 2, 1),
(143, 166, 7, 1),
(144, 166, 2, 1),
(145, 167, 7, 1),
(146, 167, 2, 1),
(147, 168, 7, 1),
(148, 168, 2, 1),
(149, 169, 7, 1),
(150, 169, 2, 1),
(151, 170, 7, 1),
(152, 170, 2, 1),
(153, 171, 7, 1),
(154, 171, 2, 1),
(155, 172, 7, 1),
(156, 172, 2, 1),
(157, 173, 7, 1),
(158, 173, 2, 1),
(159, 174, 7, 1),
(160, 174, 2, 1),
(161, 175, 7, 1),
(162, 175, 2, 1),
(163, 176, 7, 1),
(164, 176, 2, 1),
(165, 177, 7, 1),
(166, 177, 2, 1),
(167, 177, 6, 1),
(168, 178, 7, 1),
(169, 178, 2, 1),
(170, 179, 7, 1),
(171, 179, 2, 1),
(174, 181, 7, 1),
(175, 181, 2, 1),
(176, 182, 7, 1),
(177, 182, 2, 1),
(178, 183, 7, 1),
(179, 183, 2, 1),
(180, 184, 7, 1),
(181, 184, 2, 1),
(182, 185, 7, 1),
(183, 185, 2, 1),
(184, 186, 7, 1),
(185, 186, 2, 1),
(186, 187, 7, 1),
(187, 187, 2, 1),
(188, 188, 7, 1),
(189, 188, 2, 1),
(190, 189, 7, 1),
(191, 189, 2, 1),
(192, 190, 7, 1),
(193, 190, 2, 1),
(194, 191, 7, 1),
(195, 191, 2, 1),
(196, 192, 7, 1),
(197, 192, 2, 1),
(198, 193, 7, 1),
(199, 193, 2, 1),
(200, 194, 7, 1),
(201, 194, 2, 1),
(202, 195, 7, 1),
(203, 195, 2, 1),
(204, 196, 7, 1),
(205, 196, 2, 1),
(206, 195, 6, 1),
(207, 196, 6, 1),
(208, 197, 7, 1),
(209, 197, 2, 1),
(210, 198, 7, 1),
(211, 198, 2, 1),
(212, 199, 7, 1),
(213, 199, 2, 1),
(214, 200, 7, 1),
(215, 200, 2, 1),
(216, 201, 7, 1),
(217, 201, 2, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance_status`
--
ALTER TABLE `attendance_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `att_code` (`code`);

--
-- Indexes for table `lookups`
--
ALTER TABLE `lookups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lookup_code` (`code`),
  ADD KEY `lookup_types_constraints` (`type`);

--
-- Indexes for table `lookup_types`
--
ALTER TABLE `lookup_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lookup_type_code_unique` (`code`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_code` (`code`);

--
-- Indexes for table `social_info`
--
ALTER TABLE `social_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_linking` (`user_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_constraint` (`user_id`),
  ADD KEY `lead_constraint` (`lead_user_id`),
  ADD KEY `created_constraint` (`created_by`),
  ADD KEY `deleted_constraint` (`deleted_by`),
  ADD KEY `modify_constraint` (`modify_by`),
  ADD KEY `game_constraint` (`game`),
  ADD KEY `shift_constraint` (`shift_id`),
  ADD KEY `team_constraint` (`team_id`),
  ADD KEY `type_constraint` (`type`),
  ADD KEY `aprroved_constraint` (`approved_by`),
  ADD KEY `deneid_constraint` (`denied_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD KEY `role_constraint` (`role`);

--
-- Indexes for table `user_activity`
--
ALTER TABLE `user_activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_attendances`
--
ALTER TABLE `user_attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_attendance_id` (`user_id`),
  ADD KEY `user_attendance_shift_id` (`shift_id`),
  ADD KEY `user_attendance_team_id` (`team_id`),
  ADD KEY `user_attendance_status` (`status`);

--
-- Indexes for table `user_lookups`
--
ALTER TABLE `user_lookups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_lookups_constraints` (`lookup_id`),
  ADD KEY `user_lookups_id` (`user_id`);

--
-- Indexes for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_constraints` (`user_id`),
  ADD KEY `permission_id_constraint` (`permission_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance_status`
--
ALTER TABLE `attendance_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lookups`
--
ALTER TABLE `lookups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `lookup_types`
--
ALTER TABLE `lookup_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(45) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `social_info`
--
ALTER TABLE `social_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT for table `user_activity`
--
ALTER TABLE `user_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `user_attendances`
--
ALTER TABLE `user_attendances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=806;

--
-- AUTO_INCREMENT for table `user_lookups`
--
ALTER TABLE `user_lookups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT for table `user_permissions`
--
ALTER TABLE `user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lookups`
--
ALTER TABLE `lookups`
  ADD CONSTRAINT `lookup_types_constraints` FOREIGN KEY (`type`) REFERENCES `lookup_types` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `social_info`
--
ALTER TABLE `social_info`
  ADD CONSTRAINT `player_linking` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `aprroved_constraint` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `created_constraint` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `deleted_constraint` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `deneid_constraint` FOREIGN KEY (`denied_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `game_constraint` FOREIGN KEY (`game`) REFERENCES `lookups` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `lead_constraint` FOREIGN KEY (`lead_user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `modify_constraint` FOREIGN KEY (`modify_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `shift_constraint` FOREIGN KEY (`shift_id`) REFERENCES `lookups` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `team_constraint` FOREIGN KEY (`team_id`) REFERENCES `lookups` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `type_constraint` FOREIGN KEY (`type`) REFERENCES `lookups` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `user_constraint` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `role_constraint` FOREIGN KEY (`role`) REFERENCES `roles` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `user_attendances`
--
ALTER TABLE `user_attendances`
  ADD CONSTRAINT `user_attendance_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `user_attendance_shift_id` FOREIGN KEY (`shift_id`) REFERENCES `lookups` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `user_attendance_status` FOREIGN KEY (`status`) REFERENCES `attendance_status` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `user_attendance_team_id` FOREIGN KEY (`team_id`) REFERENCES `lookups` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `user_lookups`
--
ALTER TABLE `user_lookups`
  ADD CONSTRAINT `user_lookups_constraints` FOREIGN KEY (`lookup_id`) REFERENCES `lookups` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `user_lookups_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD CONSTRAINT `permission_id_constraint` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `user_id_constraints` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
