-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 04, 2024 at 09:56 AM
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
(12, 'AOA,\n\nPlease vote for PTI.\n(Imran Khan).\n\nVote for change.\n\nYou wanna know your candidates?\n\nGo message IMRAN KHAN on Facebook\nType your Halka number and Khan Saab will tell you his name along with the symbol.\n\nhttps://www.facebook.com/ImranKhanOfficial?mibextid=ZbWKwL', 0),
(13, 'Hello, team members, agents, and leaders alike,\r\nThis serves as a gentle reminder to utilize the D board for recording your attendance. Your presence during duty hours directly corresponds to your basic salary. Failure to mark your attendance will result in it being recorded as an absence.\r\n\r\nIt is essential for leaders to also mark their attendance; otherwise, it will be considered as an absence, and deductions will be applied accordingly. Additionally, if a leader fails to approve or denies attendance, the deduction will be attributed to the leader, not the agent.', 1);

--
-- Triggers `news`
--
DELIMITER $$
CREATE TRIGGER `news_insert_trigger` AFTER INSERT ON `news` FOR EACH ROW BEGIN
    UPDATE user_details
    SET flags = 1;
END
$$
DELIMITER ;

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
(114, 'Fahad Ibrahim', 'fib', '1234567', 'aefg', 'web', 'fahad@gmail.com', '03000000001', NULL, 0, NULL, 2, '2024-03-04 09:36:31', 1, 0),
(115, 'Muhammad Talal', 'talal', 'ABC123mab', 'Dummy Token', 'ios', 'talal@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
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
(201, 'Alpha', 'alpha', '12345678', 'DUMMY TOKEN', 'android', 'wajihulhasan.syed09@outlook.com', '', NULL, 0, NULL, 1, NULL, NULL, 1),
(202, 'Nikolina', 'maksic', 'NIKOLINA', 'DUMMY TOKEN', 'ios', 'nikolinamaksic3@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 1),
(203, 'Nikolina Maksic', 'Nina', 'NIKOLINA', 'DUMMY TOKEN', 'ios', 'nikolinamaksic3@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 1),
(204, 'Ali hussnain', 'alihussnain', 'ali123', 'Dummy Token', 'ios', 'api@gg.com', '', NULL, 0, NULL, 1, NULL, NULL, 0),
(205, 'Ahmad Mustafah', 'ahmi', '123456', 'DUMMY TOKEN', 'android', 'ahmadmustafahbutt@gmail.com', '', NULL, 0, NULL, 1, NULL, NULL, 0);

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `add_user_details` AFTER INSERT ON `users` FOR EACH ROW BEGIN
    INSERT INTO user_details (user_id, flags)
    VALUES (NEW.id, 1);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_activity`
--

CREATE TABLE `user_activity` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `last_login_time` datetime NOT NULL,
  `last_logout_time` datetime DEFAULT NULL,
  `last_login_platform` varchar(255) NOT NULL,
  `last_logout_platform` varchar(255) NOT NULL,
  `device_token` varchar(1000) DEFAULT NULL,
  `device_info` varchar(1000) DEFAULT NULL,
  `is_session_completed` tinyint(4) NOT NULL,
  `id_deleted` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_activity`
--

INSERT INTO `user_activity` (`id`, `user_id`, `last_login_time`, `last_logout_time`, `last_login_platform`, `last_logout_platform`, `device_token`, `device_info`, `is_session_completed`, `id_deleted`) VALUES
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
(11, 138, '2024-01-31 11:49:12', '2024-02-29 14:23:51', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
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
(53, 114, '2024-02-02 17:13:12', '2024-02-15 17:33:04', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(54, 114, '2024-02-03 06:51:09', '2024-02-07 17:42:47', 'android', 'FORCE', 'ghfffgh', 'asdjkfbajksdfbjasbdfasdf', 1, 0),
(55, 169, '2024-02-03 16:45:15', '2024-02-03 16:45:21', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(56, 169, '2024-02-03 16:45:21', '2024-02-03 16:45:22', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(57, 169, '2024-02-03 16:45:22', '2024-02-03 16:45:25', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(58, 169, '2024-02-03 16:45:25', '2024-02-03 16:45:25', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(59, 169, '2024-02-03 16:45:25', '2024-02-03 16:45:31', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(60, 169, '2024-02-03 16:45:31', '2024-02-03 16:45:31', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(61, 169, '2024-02-03 16:45:31', '2024-02-03 16:45:31', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(62, 169, '2024-02-03 16:45:31', NULL, 'web', '', '12345', 'Edge Browser', 0, 0),
(63, 114, '2024-02-07 17:42:47', '2024-02-07 18:01:26', 'Android', 'FORCE', 'MyDeviceTokenString', 's8+', 1, 0),
(64, 114, '2024-02-07 18:01:26', '2024-03-03 22:27:34', 'android', 'FORCE', 'ghfffgh', 'asdjkfbajksdfbjasbdfasdf', 1, 0),
(65, 116, '2024-02-07 18:05:04', NULL, 'android', '', 'ghfffgh', 'asdjkfbajksdfbjasbdfasdf', 0, 0),
(66, 114, '2024-02-15 17:33:04', NULL, 'web', '', '12345', 'Edge Browser', 0, 0),
(67, 125, '2024-02-18 09:18:26', '2024-02-18 09:18:27', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(68, 125, '2024-02-18 09:18:27', NULL, 'web', '', '12345', 'Edge Browser', 0, 0),
(69, 172, '2024-02-18 09:18:48', NULL, 'web', '', '12345', 'Edge Browser', 0, 0),
(70, 138, '2024-02-29 14:23:51', '2024-02-29 14:28:25', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(71, 138, '2024-02-29 14:28:25', '2024-02-29 15:06:29', 'web', 'FORCE', '12345', 'Edge Browser', 1, 0),
(72, 138, '2024-02-29 15:06:29', NULL, 'web', '', '12345', 'Edge Browser', 0, 0),
(73, 115, '2024-03-03 22:18:49', NULL, 'android', '', 'ghfffgh', 'asdjkfbajksdfbjasbdfasdf', 0, 0),
(74, 114, '2024-03-03 22:27:34', '2024-03-03 22:32:43', 'android', 'FORCE', 'ghfffgh', 'asdjkfbajksdfbjasbdfasdf', 1, 0),
(75, 114, '2024-03-03 22:32:43', NULL, 'undefined', '', 'ghfffgh', 'asdjkfbajksdfbjasbdfasdf', 0, 0),
(76, 114, '2024-03-03 22:35:22', NULL, 'undefined', '', 'Dummy Token', '[object Object]', 0, 0),
(77, 114, '2024-03-03 22:41:31', NULL, 'undefined', '', 'Dummy Token', 'dId:iPhone16,2,DN:[object Object],dIP:192.168.24.76,dMac:02:00:00:00:00:00,os:iOS,osVersion:17.0.1,uDId:[object Object],emu:[object Object],Loc:true', 0, 0),
(78, 114, '2024-03-03 22:42:14', NULL, 'undefined', '', 'Dummy Token', '\"dId:iPhone16,2,DN:[object Object],dIP:192.168.24.76,dMac:02:00:00:00:00:00,os:iOS,osVersion:17.0.1,uDId:[object Object],emu:[object Object],Loc:true\"', 0, 0),
(79, 114, '2024-03-03 22:44:09', NULL, 'undefined', '', 'Dummy Token', '\"dId:iPhone16,2,DN:[object Object],dIP:\"192.168.24.76\",dMac:\"02:00:00:00:00:00\",os:iOS,osVersion:17.0.1,uDId:[object Object],emu:[object Object],Loc:true\"', 0, 0),
(80, 114, '2024-03-03 22:49:05', NULL, 'undefined', '', 'Dummy Token', '{\"dId\":\"iPhone16,2\",\"DN\":{\"_h\":0,\"_i\":1,\"_j\":\"iPhone 15 Pro Max\",\"_k\":null},\"dIP\":\"192.168.24.76\",\"dMac\":\"02:00:00:00:00:00\",\"os\":\"iOS\",\"osVersion\":\"17.0.1\",\"uDId\":{\"_h\":0,\"_i\":1,\"_j\":\"9E56D7A7-5446-4CE0-88C4-B6FAC2DD60B4\",\"_k\":null},\"emu\":{\"_h\":0,\"_i\":1,\"_j\":true,\"_k\":null},\"Loc\":true}', 0, 0),
(81, 114, '2024-03-03 22:50:52', NULL, 'undefined', '', 'Dummy Token', '{\"deviceId\":\"iPhone16,2\",\"userDeviceName\":{\"_h\":0,\"_i\":1,\"_j\":\"iPhone 15 Pro Max\",\"_k\":null},\"deviceIPAdress\":\"192.168.24.76\",\"deviceMacAddress\":\"02:00:00:00:00:00\",\"osName\":\"iOS\",\"osVersion\":\"17.0.1\",\"uniqueDeviceId\":{\"_h\":0,\"_i\":1,\"_j\":\"9E56D7A7-5446-4CE0-88C4-B6FAC2DD60B4\",\"_k\":null},\"isEmulator\":{\"_h\":0,\"_i\":1,\"_j\":true,\"_k\":null},\"isLocationAvailable\":true}', 0, 0),
(82, 114, '2024-03-04 09:14:56', NULL, 'undefined', '', 'Dummy Token', '{\"deviceId\":\"alioth\",\"userDeviceName\":{\"_h\":0,\"_i\":1,\"_j\":\"POCO F3\",\"_k\":null},\"deviceIPAdress\":\"192.168.1.46\",\"deviceMacAddress\":\"\",\"osName\":\"Android\",\"osVersion\":\"13\",\"uniqueDeviceId\":{\"_h\":0,\"_i\":1,\"_j\":\"3b7868ed496d35fa\",\"_k\":null},\"isEmulator\":{\"_h\":0,\"_i\":1,\"_j\":false,\"_k\":null},\"isLocationAvailable\":false}', 0, 0),
(83, 114, '2024-03-04 09:22:54', NULL, 'undefined', '', 'Dummy Token', '{\"deviceId\":\"alioth\",\"userDeviceName\":{\"_h\":0,\"_i\":1,\"_j\":\"POCO F3\",\"_k\":null},\"deviceIPAdress\":\"192.168.1.46\",\"deviceMacAddress\":\"\",\"osName\":\"Android\",\"osVersion\":\"13\",\"uniqueDeviceId\":{\"_h\":0,\"_i\":1,\"_j\":\"f0e169a6828925b6\",\"_k\":null},\"isEmulator\":{\"_h\":0,\"_i\":1,\"_j\":false,\"_k\":null},\"isLocationAvailable\":false}', 0, 0),
(84, 114, '2024-03-04 09:36:03', NULL, 'undefined', '', 'Dummy Token', '{\"deviceId\":\"redfin\",\"userDeviceName\":{\"_h\":0,\"_i\":1,\"_j\":\"Redfin 64-bit only\",\"_k\":null},\"deviceIPAdress\":\"10.14.61.67\",\"deviceMacAddress\":\"\",\"osName\":\"Android\",\"osVersion\":\"13\",\"uniqueDeviceId\":{\"_h\":0,\"_i\":1,\"_j\":\"0cfad24474936725\",\"_k\":null},\"isEmulator\":{\"_h\":0,\"_i\":1,\"_j\":false,\"_k\":null},\"isLocationAvailable\":true}', 0, 0),
(85, 114, '2024-03-04 09:36:18', NULL, 'undefined', '', 'Dummy Token', '{\"deviceId\":\"oriole\",\"userDeviceName\":{\"_h\":0,\"_i\":1,\"_j\":\"Pixel 6\",\"_k\":null},\"deviceIPAdress\":\"10.12.133.60\",\"deviceMacAddress\":\"\",\"osName\":\"Android\",\"osVersion\":\"12\",\"uniqueDeviceId\":{\"_h\":0,\"_i\":1,\"_j\":\"39be5aa4d1056012\",\"_k\":null},\"isEmulator\":{\"_h\":0,\"_i\":1,\"_j\":false,\"_k\":null},\"isLocationAvailable\":true}', 0, 0),
(86, 115, '2024-03-04 09:41:01', NULL, 'undefined', '', 'Dummy Token', '{\"deviceId\":\"iPhone11,2\",\"userDeviceName\":{\"_h\":0,\"_i\":1,\"_j\":\"iPhone\",\"_k\":null},\"deviceIPAdress\":\"192.168.1.27\",\"deviceMacAddress\":\"02:00:00:00:00:00\",\"osName\":\"iOS\",\"osVersion\":\"17.3.1\",\"uniqueDeviceId\":{\"_h\":0,\"_i\":1,\"_j\":\"E96DB53A-6EC5-4779-947D-3A356176227D\",\"_k\":null},\"isEmulator\":{\"_h\":0,\"_i\":1,\"_j\":false,\"_k\":null},\"isLocationAvailable\":false}', 0, 0),
(87, 115, '2024-03-04 09:41:49', NULL, 'undefined', '', 'Dummy Token', '{\"deviceId\":\"iPhone11,2\",\"userDeviceName\":{\"_h\":0,\"_i\":1,\"_j\":\"iPhone\",\"_k\":null},\"deviceIPAdress\":\"192.168.1.27\",\"deviceMacAddress\":\"02:00:00:00:00:00\",\"osName\":\"iOS\",\"osVersion\":\"17.3.1\",\"uniqueDeviceId\":{\"_h\":0,\"_i\":1,\"_j\":\"E96DB53A-6EC5-4779-947D-3A356176227D\",\"_k\":null},\"isEmulator\":{\"_h\":0,\"_i\":1,\"_j\":false,\"_k\":null},\"isLocationAvailable\":false}', 0, 0),
(88, 205, '2024-03-04 09:47:24', NULL, 'undefined', '', 'Dummy Token', '{\"deviceId\":\"alioth\",\"userDeviceName\":{\"_h\":0,\"_i\":1,\"_j\":\"POCO F3\",\"_k\":null},\"deviceIPAdress\":\"192.168.1.46\",\"deviceMacAddress\":\"\",\"osName\":\"Android\",\"osVersion\":\"13\",\"uniqueDeviceId\":{\"_h\":0,\"_i\":1,\"_j\":\"f0e169a6828925b6\",\"_k\":null},\"isEmulator\":{\"_h\":0,\"_i\":1,\"_j\":false,\"_k\":null},\"isLocationAvailable\":false}', 0, 0),
(89, 205, '2024-03-04 09:50:29', NULL, 'undefined', '', 'ghfffgh', 'asdjkfbajksdfbjasbdfasdf', 0, 0);

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
(609, '2024-01-01 03:14:00', '2024-01-01 11:25:00', 1, 131, 2, 0, 'Testing 123', 7, 1, 131, NULL, NULL, NULL, '2024-01-04 11:15:31', NULL, NULL, NULL, 0, NULL),
(610, '2024-01-02 03:15:00', '2024-01-02 11:15:00', 1, 131, 2, 0, 'Testing 123', 7, 1, 131, NULL, NULL, NULL, '2024-01-04 11:15:58', NULL, NULL, NULL, 0, NULL),
(611, '2024-01-03 03:16:00', '2024-01-03 11:16:00', 1, 131, 2, 0, 'Testing 123', 7, 1, 131, NULL, NULL, NULL, '2024-01-04 11:16:17', NULL, NULL, NULL, 0, NULL),
(612, '2024-01-04 03:26:00', '2024-01-04 11:24:00', 1, 131, 2, 0, 'Testing 123', 7, 1, 131, NULL, NULL, NULL, '2024-01-04 11:16:38', NULL, NULL, NULL, 0, NULL),
(613, '2024-01-04 13:00:24', '2024-01-04 18:45:24', 1, 114, 2, 0, 'Testing 123', 8, 1, 114, NULL, NULL, NULL, '2024-01-04 18:41:59', NULL, NULL, NULL, 0, NULL),
(614, '2024-01-04 11:50:01', '2024-01-04 18:50:01', 1, 114, 3, 0, 'Testing 123', 9, 5, 114, NULL, NULL, NULL, '2024-01-04 18:50:18', NULL, NULL, NULL, 0, NULL),
(615, '2024-01-05 10:30:58', '2024-01-05 19:50:48', 1, 137, 2, 0, 'Testing 123', 8, 1, 137, NULL, NULL, NULL, '2024-01-05 12:22:59', NULL, NULL, NULL, 0, NULL),
(616, '2024-01-06 03:21:00', '2024-01-06 11:24:38', 1, 131, 2, 0, 'Testing 123', 7, 1, 131, NULL, NULL, NULL, '2024-01-06 11:24:55', NULL, NULL, NULL, 0, NULL),
(617, '2024-01-08 06:00:40', '2024-01-08 18:00:05', 1, 114, 2, 0, 'Testing 123', 7, 5, 114, NULL, NULL, NULL, '2024-01-08 16:55:01', NULL, NULL, NULL, 0, NULL),
(618, '2024-01-11 13:06:10', NULL, 1, 114, 1, 0, 'Testing 123', 9, 4, 114, NULL, NULL, NULL, '2024-01-11 16:10:42', NULL, NULL, NULL, 0, NULL),
(619, '2024-01-10 19:30:00', '2024-01-11 04:03:00', 1, 137, 2, 0, 'Testing 123', 9, 1, 137, NULL, NULL, NULL, '2024-01-12 03:31:49', NULL, NULL, NULL, 0, NULL),
(620, '2024-01-11 19:40:56', '2024-01-12 03:41:56', 1, 137, 2, 0, 'Testing 123', 9, 1, 137, NULL, NULL, NULL, '2024-01-12 03:32:20', NULL, NULL, NULL, 0, NULL),
(621, '2024-01-27 10:19:00', '2024-01-27 10:19:00', 1, 121, 1, 0, 'Testing 123', 7, 18, 121, NULL, NULL, NULL, '2024-01-27 10:19:28', NULL, NULL, NULL, 0, NULL),
(622, '2024-01-27 11:40:00', '2024-01-27 19:18:17', 1, 172, 2, 0, 'Testing 123', 8, 1, 172, NULL, NULL, NULL, '2024-01-27 12:17:58', NULL, NULL, NULL, 0, NULL),
(623, '2024-01-27 11:25:00', '2024-01-27 19:25:00', 1, 170, 2, 0, 'Testing 123', 8, 6, 170, NULL, NULL, NULL, '2024-01-27 21:32:37', NULL, NULL, NULL, 0, NULL),
(624, '2024-01-28 03:20:00', '2024-01-28 11:25:00', 1, 125, 2, 0, 'Testing 123', 7, 6, 125, NULL, NULL, NULL, '2024-01-28 04:12:28', NULL, NULL, NULL, 0, NULL),
(625, '2024-01-28 11:05:00', '2024-01-28 20:20:00', 1, 170, 2, 0, 'Testing 123', 8, 6, 170, NULL, NULL, NULL, '2024-01-28 22:56:34', NULL, NULL, NULL, 0, NULL),
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
(682, '2024-02-02 04:20:00', '2024-02-02 12:58:17', 1, 136, 2, 0, 'Testing 123', 7, 18, 136, NULL, NULL, NULL, '2024-02-02 04:25:35', NULL, NULL, NULL, 0, NULL),
(683, '2024-02-02 04:25:44', '2024-02-02 12:12:16', 1, 163, 2, 0, 'Testing 123', 7, 4, 163, NULL, NULL, NULL, '2024-02-02 04:25:51', NULL, NULL, NULL, 0, NULL),
(684, '2024-02-02 04:43:36', '2024-02-02 14:39:16', 1, 141, 2, 0, 'Testing 123', 7, 17, 141, NULL, NULL, NULL, '2024-02-02 04:43:54', NULL, NULL, NULL, 0, NULL),
(685, '2024-02-02 05:02:59', '2024-02-02 15:47:42', 1, 154, 2, 0, 'Testing 123', 7, 17, 154, NULL, NULL, NULL, '2024-02-02 04:58:42', NULL, NULL, NULL, 0, NULL),
(686, '2024-02-02 05:29:00', '2024-02-02 13:31:07', 1, 123, 2, 0, 'Testing 123', 7, 18, 123, NULL, NULL, NULL, '2024-02-02 05:33:34', NULL, NULL, NULL, 0, NULL),
(687, '2024-02-02 05:10:00', '2024-02-02 13:16:00', 1, 134, 2, 0, 'Testing 123', 7, 18, 134, NULL, NULL, NULL, '2024-02-02 07:12:17', NULL, NULL, NULL, 0, NULL),
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
(715, '2024-02-03 04:45:00', '2024-02-04 11:15:00', 1, 136, 2, 0, 'Testing 123', 7, 18, 136, NULL, NULL, NULL, '2024-02-03 05:00:15', NULL, NULL, NULL, 0, NULL),
(716, '2024-02-03 03:39:00', '2024-02-03 07:00:00', 1, 179, 2, 0, 'Testing 123', 7, 4, 179, NULL, NULL, NULL, '2024-02-03 06:50:48', NULL, NULL, NULL, 0, NULL),
(717, '2024-02-03 08:53:00', '2024-02-03 13:34:00', 1, 123, 2, 0, 'Testing 123', 7, 18, 123, NULL, NULL, NULL, '2024-02-03 09:11:15', NULL, NULL, NULL, 0, NULL),
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
(753, '2024-02-05 04:42:44', '2024-02-05 15:26:12', 1, 141, 2, 0, 'Testing 123', 7, 17, 141, NULL, NULL, NULL, '2024-02-05 04:43:07', NULL, NULL, NULL, 0, NULL),
(754, '2024-02-05 05:00:00', '2024-02-05 16:50:55', 1, 126, 2, 0, 'Testing 123', 7, 17, 126, NULL, NULL, NULL, '2024-02-05 05:02:17', NULL, NULL, NULL, 0, NULL),
(755, '2024-02-03 19:01:00', '2024-02-04 18:45:00', 1, 177, 2, 0, 'Testing 123', 8, 19, 177, NULL, NULL, NULL, '2024-02-05 10:45:58', NULL, NULL, NULL, 0, NULL),
(756, '2024-02-05 08:00:00', '2024-02-05 19:23:00', 1, 177, 2, 0, 'Testing 123', 8, 19, 177, NULL, NULL, NULL, '2024-02-05 10:46:26', NULL, NULL, NULL, 0, NULL),
(757, '2024-02-05 10:58:45', '2024-02-04 19:10:00', 1, 171, 2, 0, 'Testing 123', 8, 5, 171, NULL, NULL, NULL, '2024-02-05 10:59:14', NULL, NULL, NULL, 0, NULL),
(758, '2024-02-05 03:09:00', '2024-02-05 11:04:27', 1, 161, 2, 0, 'Testing 123', 7, 5, 161, NULL, NULL, NULL, '2024-02-05 11:05:09', NULL, NULL, NULL, 0, NULL),
(759, '2024-02-05 05:30:26', '2024-02-05 11:05:26', 1, 179, 2, 0, 'Testing 123', 7, 4, 179, NULL, NULL, NULL, '2024-02-05 11:05:58', NULL, NULL, NULL, 0, NULL),
(760, '2024-02-05 11:22:00', '2024-02-04 19:11:00', 1, 172, 2, 0, 'Testing 123', 8, 1, 172, NULL, NULL, NULL, '2024-02-05 11:31:55', NULL, NULL, NULL, 0, NULL),
(761, '2024-02-05 12:15:41', '2024-02-05 12:17:00', 1, 119, 3, 0, 'Testing 123', 7, 18, 119, NULL, NULL, NULL, '2024-02-05 12:15:50', NULL, NULL, NULL, 0, NULL),
(762, '2024-02-05 05:08:00', '2024-02-05 16:46:27', 1, 154, 2, 0, 'Testing 123', 7, 17, 154, NULL, NULL, NULL, '2024-02-05 16:42:24', NULL, NULL, NULL, 0, NULL),
(763, '2024-02-05 09:40:00', '2024-02-05 04:30:00', 1, 149, 2, 0, 'Testing 123', 9, 6, 149, NULL, NULL, NULL, '2024-02-05 17:16:00', NULL, NULL, NULL, 0, NULL),
(764, '2024-02-05 19:05:00', '2024-02-06 03:22:33', 1, 173, 2, 0, 'Testing 123', 9, 1, 173, NULL, NULL, NULL, '2024-02-05 19:08:14', NULL, NULL, NULL, 0, NULL),
(765, '2024-02-05 19:20:00', '2024-02-06 05:15:41', 1, 175, 2, 0, 'Testing 123', 9, 5, 175, NULL, NULL, NULL, '2024-02-05 19:28:30', NULL, NULL, NULL, 0, NULL),
(766, '2024-02-05 11:39:47', '2024-02-05 19:35:47', 1, 137, 2, 0, 'Testing 123', 8, 1, 137, NULL, NULL, NULL, '2024-02-05 19:32:07', NULL, NULL, NULL, 0, NULL),
(767, '2024-02-06 03:17:32', '2024-02-08 11:19:15', 1, 131, 2, 0, 'Testing 123', 7, 1, 131, NULL, NULL, NULL, '2024-02-06 03:17:37', NULL, NULL, NULL, 0, NULL),
(768, '2024-02-06 03:53:51', '2024-02-06 12:02:44', 1, 132, 2, 0, 'Testing 123', 7, 4, 132, NULL, NULL, NULL, '2024-02-06 03:53:55', NULL, NULL, NULL, 0, NULL),
(769, '2024-02-06 04:00:00', '2024-02-06 12:13:00', 1, 136, 2, 0, 'Testing 123', 7, 18, 136, NULL, NULL, NULL, '2024-02-06 04:17:03', NULL, NULL, NULL, 0, NULL),
(770, '2024-02-06 07:08:00', '2024-02-06 04:30:00', 1, 149, 2, 0, 'Testing 123', 9, 6, 149, NULL, NULL, NULL, '2024-02-06 05:02:12', NULL, NULL, NULL, 0, NULL),
(771, '2024-02-06 05:09:06', '2024-02-06 15:16:01', 1, 141, 2, 0, 'Testing 123', 7, 17, 141, NULL, NULL, NULL, '2024-02-06 05:10:03', NULL, NULL, NULL, 0, NULL),
(772, '2024-02-06 05:37:00', '2024-02-06 13:37:00', 1, 123, 2, 0, 'Testing 123', 7, 18, 123, NULL, NULL, NULL, '2024-02-06 05:42:14', NULL, NULL, NULL, 0, NULL),
(773, '2024-02-06 03:10:00', '2024-02-16 11:15:00', 1, 124, 2, 0, 'Testing 123', 7, 6, 124, NULL, NULL, NULL, '2024-02-06 06:51:06', NULL, NULL, NULL, 0, NULL),
(774, '2024-02-06 07:04:00', '2024-02-06 03:30:00', 1, 184, 2, 0, 'Testing 123', 9, 19, 184, NULL, NULL, NULL, '2024-02-06 07:56:39', NULL, NULL, NULL, 0, NULL),
(775, '2024-02-05 15:11:00', '2024-02-05 11:05:00', 1, 166, 2, 0, 'Testing 123', 7, 5, 166, NULL, NULL, NULL, '2024-02-06 11:42:57', NULL, NULL, NULL, 0, NULL),
(776, '2024-02-06 03:11:00', '2024-02-05 23:40:00', 1, 166, 2, 0, 'Testing 123', 7, 5, 166, NULL, NULL, NULL, '2024-02-06 11:43:47', NULL, NULL, NULL, 0, NULL),
(777, '2024-02-06 04:18:22', '2024-02-06 11:45:22', 1, 179, 2, 0, 'Testing 123', 7, 4, 179, NULL, NULL, NULL, '2024-02-06 11:45:51', NULL, NULL, NULL, 0, NULL),
(778, '2024-02-06 11:00:00', '2024-02-05 19:10:00', 1, 171, 2, 0, 'Testing 123', 8, 5, 171, NULL, NULL, NULL, '2024-02-06 12:11:01', NULL, NULL, NULL, 0, NULL),
(779, '2024-02-06 08:00:00', '2024-02-06 20:30:00', 1, 177, 2, 0, 'Testing 123', 8, 19, 177, NULL, NULL, NULL, '2024-02-06 15:23:45', NULL, NULL, NULL, 0, NULL),
(780, '2024-02-06 04:57:00', '2024-02-06 15:58:00', 1, 154, 2, 0, 'Testing 123', 7, 17, 154, NULL, NULL, NULL, '2024-02-06 15:53:59', NULL, NULL, NULL, 0, NULL),
(781, '2024-02-06 04:28:00', '2024-02-06 15:54:00', 1, 126, 2, 0, 'Testing 123', 7, 17, 126, NULL, NULL, NULL, '2024-02-06 15:54:23', NULL, NULL, NULL, 0, NULL),
(782, '2024-02-06 03:14:00', '2024-02-06 11:19:00', 1, 161, 2, 0, 'Testing 123', 7, 5, 161, NULL, NULL, NULL, '2024-02-06 17:02:03', NULL, NULL, NULL, 0, NULL),
(783, '2024-02-04 11:09:00', '2024-02-04 19:09:00', 1, 165, 2, 0, 'Testing 123', 8, 4, 165, NULL, NULL, NULL, '2024-02-06 19:10:57', NULL, NULL, NULL, 0, NULL),
(784, '2024-02-06 19:05:00', '2024-02-07 03:16:00', 1, 165, 2, 0, 'Testing 123', 9, 4, 165, NULL, NULL, NULL, '2024-02-06 19:11:27', NULL, NULL, NULL, 0, NULL),
(785, '2024-02-06 19:05:00', '2024-02-07 03:25:00', 1, 173, 2, 0, 'Testing 123', 9, 1, 173, NULL, NULL, NULL, '2024-02-06 19:16:28', NULL, NULL, NULL, 0, NULL),
(786, '2024-02-05 11:15:00', '2024-02-04 19:41:00', 1, 169, 2, 0, 'Testing 123', 8, 6, 169, NULL, NULL, NULL, '2024-02-06 19:39:18', NULL, NULL, NULL, 0, NULL),
(787, '2024-02-06 11:43:00', '2024-02-05 19:37:00', 1, 169, 2, 0, 'Testing 123', 8, 6, 169, NULL, NULL, NULL, '2024-02-06 19:40:27', NULL, NULL, NULL, 0, NULL),
(788, '2024-02-05 11:30:00', '2024-02-05 19:50:00', 1, 170, 2, 0, 'Testing 123', 8, 6, 170, NULL, NULL, NULL, '2024-02-06 20:59:01', NULL, NULL, NULL, 0, NULL),
(789, '2024-02-06 11:15:00', '2024-02-06 19:46:00', 1, 170, 2, 0, 'Testing 123', 8, 6, 170, NULL, NULL, NULL, '2024-02-06 20:59:32', NULL, NULL, NULL, 0, NULL),
(790, '2024-02-06 10:00:34', '2024-02-06 18:00:34', 1, 186, 2, 0, 'Testing 123', 8, 19, 186, NULL, NULL, NULL, '2024-02-07 03:00:17', NULL, NULL, NULL, 0, NULL),
(791, '2024-02-07 07:10:00', '2024-02-07 03:19:00', 1, 184, 2, 0, 'Testing 123', 9, 19, 184, NULL, NULL, NULL, '2024-02-07 03:03:59', NULL, NULL, NULL, 0, NULL),
(792, '2024-02-06 19:00:00', '2024-02-07 03:15:54', 1, 174, 2, 0, 'Testing 123', 9, 5, 174, NULL, NULL, NULL, '2024-02-07 03:16:26', NULL, NULL, NULL, 0, NULL),
(793, '2024-02-06 19:00:00', '2024-02-07 03:15:00', 1, 175, 2, 0, 'Testing 123', 9, 5, 175, NULL, NULL, NULL, '2024-02-07 03:16:47', NULL, NULL, NULL, 0, NULL),
(794, '2024-02-07 03:12:00', '2024-02-16 11:17:00', 1, 124, 2, 0, 'Testing 123', 7, 6, 124, NULL, NULL, NULL, '2024-02-07 03:18:50', NULL, NULL, NULL, 0, NULL),
(795, '2024-02-07 04:02:00', '2024-02-07 12:05:32', 1, 132, 2, 0, 'Testing 123', 7, 4, 132, NULL, NULL, NULL, '2024-02-07 04:17:07', NULL, NULL, NULL, 0, NULL),
(796, '2024-02-07 04:22:00', '2024-02-07 13:21:32', 1, 126, 2, 0, 'Testing 123', 7, 17, 126, NULL, NULL, NULL, '2024-02-07 04:25:35', NULL, NULL, NULL, 0, NULL),
(797, '2024-02-07 04:51:00', '2024-02-07 13:21:32', 1, 123, 2, 0, 'Testing 123', 7, 18, 123, NULL, NULL, NULL, '2024-02-07 04:57:36', NULL, NULL, NULL, 0, NULL),
(798, '2024-02-07 04:08:00', '2024-02-07 11:38:00', 1, 136, 2, 0, 'Testing 123', 7, 18, 136, NULL, NULL, NULL, '2024-02-07 05:10:21', NULL, NULL, NULL, 0, NULL),
(799, '2024-02-07 07:01:47', '2024-02-07 14:20:42', 1, 141, 2, 0, 'Testing 123', 7, 17, 141, NULL, NULL, NULL, '2024-02-07 07:02:06', NULL, NULL, NULL, 0, NULL),
(800, '2024-02-07 06:31:00', '2024-02-08 00:03:00', 1, 177, 2, 0, 'Testing 123', 7, 19, 177, NULL, NULL, NULL, '2024-02-07 07:31:29', NULL, NULL, NULL, 0, NULL),
(801, '2024-02-07 03:12:00', '2024-02-07 11:13:11', 1, 161, 2, 0, 'Testing 123', 7, 5, 161, NULL, NULL, NULL, '2024-02-07 11:13:24', NULL, NULL, NULL, 0, NULL),
(802, '2024-02-02 17:30:43', '2024-02-03 03:30:43', 1, 186, 2, 0, 'Testing 123', 9, 19, 186, NULL, NULL, NULL, '2024-02-07 11:14:42', NULL, NULL, NULL, 0, NULL),
(803, '2024-02-06 19:28:27', '2024-02-07 11:26:27', 1, 179, 2, 0, 'Testing 123', 7, 4, 179, NULL, NULL, NULL, '2024-02-07 11:29:55', NULL, NULL, NULL, 0, NULL),
(804, '2024-02-06 11:39:52', '2024-02-06 19:16:52', 1, 137, 2, 0, 'Testing 123', 8, 1, 137, NULL, NULL, NULL, '2024-02-07 11:42:18', NULL, NULL, NULL, 0, NULL),
(805, '2024-02-06 19:40:00', '2024-02-07 10:30:00', 1, 149, 2, 0, 'Testing 123', 9, 6, 149, NULL, NULL, NULL, '2024-02-07 11:55:42', NULL, NULL, NULL, 0, NULL),
(806, '2024-02-07 19:10:00', '2024-02-08 03:30:00', 1, 173, 2, 0, 'Testing 123', 9, 1, 173, NULL, NULL, NULL, '2024-02-07 19:13:13', NULL, NULL, NULL, 0, NULL),
(807, '2024-02-07 11:27:00', '2024-02-07 19:19:00', 1, 178, 2, 0, 'Testing 123', 8, 4, 178, NULL, NULL, NULL, '2024-02-07 19:20:41', NULL, NULL, NULL, 0, NULL),
(808, '2024-02-03 10:35:00', '2024-02-02 19:07:00', 1, 198, 2, 0, 'Testing 123', 8, 4, 198, NULL, NULL, NULL, '2024-02-07 19:20:57', NULL, NULL, NULL, 0, NULL),
(809, '2024-02-04 11:02:00', '2024-02-03 19:09:00', 1, 198, 2, 0, 'Testing 123', 8, 4, 198, NULL, NULL, NULL, '2024-02-07 19:22:41', NULL, NULL, NULL, 0, NULL),
(810, '2024-02-05 11:06:00', '2024-02-03 19:25:00', 1, 198, 2, 0, 'Testing 123', 8, 4, 198, NULL, NULL, NULL, '2024-02-07 19:24:26', NULL, NULL, NULL, 0, NULL),
(811, '2024-02-06 11:01:00', '2024-02-05 19:09:00', 1, 198, 2, 0, 'Testing 123', 8, 4, 198, NULL, NULL, NULL, '2024-02-07 19:25:12', NULL, NULL, NULL, 0, NULL),
(812, '2024-02-07 11:30:38', '2024-02-07 19:25:38', 1, 137, 2, 0, 'Testing 123', 8, 1, 137, NULL, NULL, NULL, '2024-02-07 19:26:05', NULL, NULL, NULL, 0, NULL),
(813, '2024-02-06 23:04:00', '2024-02-06 19:17:00', 1, 198, 2, 0, 'Testing 123', 8, 4, 198, NULL, NULL, NULL, '2024-02-07 19:26:27', NULL, NULL, NULL, 0, NULL),
(814, '2024-02-03 11:58:00', '2024-02-03 19:40:00', 1, 178, 2, 0, 'Testing 123', 8, 4, 178, NULL, NULL, NULL, '2024-02-07 20:41:50', NULL, NULL, NULL, 0, NULL),
(815, '2024-02-04 11:02:00', '2024-02-04 18:52:00', 1, 178, 2, 0, 'Testing 123', 8, 4, 178, NULL, NULL, NULL, '2024-02-07 20:44:17', NULL, NULL, NULL, 0, NULL),
(816, '2024-02-05 11:00:00', '2024-02-05 19:26:00', 1, 178, 2, 0, 'Testing 123', 8, 4, 178, NULL, NULL, NULL, '2024-02-07 20:45:40', NULL, NULL, NULL, 0, NULL),
(817, '2024-02-06 12:34:00', '2024-02-05 19:33:00', 1, 178, 2, 0, 'Testing 123', 8, 4, 178, NULL, NULL, NULL, '2024-02-07 20:47:19', NULL, NULL, NULL, 0, NULL),
(818, '2024-02-07 15:08:00', '2024-02-07 11:26:00', 1, 166, 2, 0, 'Testing 123', 7, 5, 166, NULL, NULL, NULL, '2024-02-08 01:52:24', NULL, NULL, NULL, 0, NULL),
(819, '2024-02-07 08:00:44', '2024-02-07 16:35:44', 1, 186, 2, 0, 'Testing 123', 8, 19, 186, NULL, NULL, NULL, '2024-02-08 02:49:59', NULL, NULL, NULL, 0, NULL),
(820, '2024-02-07 19:13:00', '2024-02-08 03:55:00', 1, 165, 2, 0, 'Testing 123', 9, 4, 165, NULL, NULL, NULL, '2024-02-08 03:58:58', NULL, NULL, NULL, 0, NULL),
(821, '2024-02-08 04:15:38', '2024-02-08 12:01:36', 1, 132, 2, 0, 'Testing 123', 7, 4, 132, NULL, NULL, NULL, '2024-02-08 04:15:44', NULL, NULL, NULL, 0, NULL),
(822, '2024-02-07 11:10:00', '2024-02-07 19:30:00', 1, 170, 2, 0, 'Testing 123', 8, 6, 170, NULL, NULL, NULL, '2024-02-08 07:43:20', NULL, NULL, NULL, 0, NULL),
(823, '2024-02-07 19:00:00', '2024-02-08 09:30:00', 1, 166, 2, 0, 'Testing 123', 7, 5, 166, NULL, NULL, NULL, '2024-02-08 09:28:42', NULL, NULL, NULL, 0, NULL),
(824, '2024-02-08 03:19:00', '2024-02-08 11:35:00', 1, 131, 2, 0, 'Testing 123', 7, 1, 131, NULL, NULL, NULL, '2024-02-08 11:20:29', NULL, NULL, NULL, 0, NULL),
(825, '2024-02-08 03:53:15', '2024-02-08 11:45:15', 1, 179, 2, 0, 'Testing 123', 7, 4, 179, NULL, NULL, NULL, '2024-02-08 11:46:59', NULL, NULL, NULL, 0, NULL),
(826, '2024-02-08 19:02:00', '2024-02-09 03:25:00', 1, 173, 2, 0, 'Testing 123', 9, 1, 173, NULL, NULL, NULL, '2024-02-08 19:05:47', NULL, NULL, NULL, 0, NULL),
(827, '2024-02-08 11:14:00', '2024-02-07 19:11:00', 1, 198, 2, 0, 'Testing 123', 8, 4, 198, NULL, NULL, NULL, '2024-02-08 19:11:41', NULL, NULL, NULL, 0, NULL),
(828, '2024-02-08 11:15:00', '2024-02-08 19:28:00', 1, 178, 2, 0, 'Testing 123', 8, 4, 178, NULL, NULL, NULL, '2024-02-08 19:30:58', NULL, NULL, NULL, 0, NULL),
(829, '2024-02-08 12:00:48', '2024-02-08 19:44:48', 1, 137, 2, 0, 'Testing 123', 8, 1, 137, NULL, NULL, NULL, '2024-02-08 19:54:12', NULL, NULL, NULL, 0, NULL),
(830, '2024-02-08 03:09:00', '2024-02-08 09:30:00', 1, 161, 2, 0, 'Testing 123', 7, 5, 161, NULL, NULL, NULL, '2024-02-09 04:10:26', NULL, NULL, NULL, 0, NULL),
(831, '2024-02-09 04:13:33', '2024-02-09 12:04:30', 1, 132, 2, 0, 'Testing 123', 7, 4, 132, NULL, NULL, NULL, '2024-02-09 04:13:38', NULL, NULL, NULL, 0, NULL),
(832, '2024-02-09 04:25:45', '2024-02-09 13:14:08', 1, 126, 2, 0, 'Testing 123', 7, 17, 126, NULL, NULL, NULL, '2024-02-09 04:25:57', NULL, NULL, NULL, 0, NULL),
(833, '2024-02-09 04:39:00', '2024-02-09 13:06:00', 1, 154, 2, 0, 'Testing 123', 7, 17, 154, NULL, NULL, NULL, '2024-02-09 04:42:35', NULL, NULL, NULL, 0, NULL),
(834, '2024-02-07 19:10:10', '2024-02-08 15:20:10', 1, 186, 2, 0, 'Testing 123', 9, 19, 186, NULL, NULL, NULL, '2024-02-09 04:48:56', NULL, NULL, NULL, 0, NULL),
(835, '2024-02-09 07:31:00', '2024-02-09 04:09:00', 1, 184, 2, 0, 'Testing 123', 9, 19, 184, NULL, NULL, NULL, '2024-02-09 04:54:10', NULL, NULL, NULL, 0, NULL),
(836, '2024-02-09 04:51:00', '2024-02-09 13:24:35', 1, 123, 1, 0, 'Testing 123', 7, 18, 123, NULL, NULL, NULL, '2024-02-09 05:11:22', NULL, NULL, NULL, 0, NULL),
(837, '2024-02-09 07:02:00', '2024-02-09 18:01:00', 1, 177, 2, 0, 'Testing 123', 7, 19, 177, NULL, NULL, NULL, '2024-02-09 08:03:11', NULL, NULL, NULL, 0, NULL),
(838, '2024-02-08 11:18:00', '2024-02-08 19:36:00', 1, 170, 2, 0, 'Testing 123', 8, 6, 170, NULL, NULL, NULL, '2024-02-09 09:55:57', NULL, NULL, NULL, 0, NULL),
(839, '2024-02-09 03:27:00', '2024-02-09 11:27:46', 1, 161, 3, 0, 'Testing 123', 7, 5, 161, NULL, NULL, NULL, '2024-02-09 11:27:59', NULL, NULL, NULL, 0, NULL),
(840, '2024-02-09 11:00:00', '2024-02-08 19:10:00', 1, 171, 2, 0, 'Testing 123', 8, 5, 171, NULL, NULL, NULL, '2024-02-09 11:28:30', NULL, NULL, NULL, 0, NULL),
(841, '2024-02-09 03:06:00', '2024-02-09 11:28:58', 1, 161, 2, 0, 'Testing 123', 7, 5, 161, NULL, NULL, NULL, '2024-02-09 11:29:11', NULL, NULL, NULL, 0, NULL),
(842, '2024-02-09 05:18:00', '2024-02-09 11:24:00', 1, 136, 2, 0, 'Testing 123', 7, 18, 136, NULL, NULL, NULL, '2024-02-09 12:19:16', NULL, NULL, NULL, 0, NULL),
(843, '2024-02-07 19:00:00', '2024-02-09 03:30:00', 1, 174, 3, 0, 'Testing 123', 9, 5, 174, NULL, NULL, NULL, '2024-02-09 18:21:37', NULL, NULL, NULL, 0, NULL),
(844, '2024-02-08 19:00:00', '2024-02-09 03:40:00', 1, 174, 2, 0, 'Testing 123', 9, 5, 174, NULL, NULL, NULL, '2024-02-09 18:22:14', NULL, NULL, NULL, 0, NULL),
(845, '2024-02-09 19:00:00', '2024-02-10 03:45:00', 1, 175, 2, 0, 'Testing 123', 9, 5, 175, NULL, NULL, NULL, '2024-02-09 19:07:22', NULL, NULL, NULL, 0, NULL),
(846, '2024-02-09 11:04:00', '2024-02-09 19:16:00', 1, 178, 2, 0, 'Testing 123', 8, 4, 178, NULL, NULL, NULL, '2024-02-09 19:17:14', NULL, NULL, NULL, 0, NULL),
(847, '2024-02-09 19:12:00', '2024-02-10 03:13:32', 1, 173, 2, 0, 'Testing 123', 9, 1, 173, NULL, NULL, NULL, '2024-02-09 19:17:27', NULL, NULL, NULL, 0, NULL),
(848, '2024-02-07 12:30:00', '2024-02-06 19:27:00', 1, 169, 2, 0, 'Testing 123', 8, 6, 169, NULL, NULL, NULL, '2024-02-09 19:19:55', NULL, NULL, NULL, 0, NULL),
(849, '2024-02-09 11:02:00', '2024-02-08 19:16:00', 1, 198, 2, 0, 'Testing 123', 8, 4, 198, NULL, NULL, NULL, '2024-02-09 19:20:33', NULL, NULL, NULL, 0, NULL),
(850, '2024-02-08 11:22:00', '2024-02-07 19:17:00', 1, 169, 2, 0, 'Testing 123', 8, 6, 169, NULL, NULL, NULL, '2024-02-09 19:20:37', NULL, NULL, NULL, 0, NULL),
(851, '2024-02-09 11:24:00', '2024-02-08 19:12:00', 1, 169, 2, 0, 'Testing 123', 8, 6, 169, NULL, NULL, NULL, '2024-02-09 19:21:14', NULL, NULL, NULL, 0, NULL),
(852, '2024-02-08 19:19:00', '2024-02-09 03:40:00', 1, 165, 2, 0, 'Testing 123', 9, 4, 165, NULL, NULL, NULL, '2024-02-09 19:48:06', NULL, NULL, NULL, 0, NULL),
(853, '2024-02-09 11:18:00', '2024-02-09 19:15:00', 1, 170, 2, 0, 'Testing 123', 8, 6, 170, NULL, NULL, NULL, '2024-02-09 19:57:14', NULL, NULL, NULL, 0, NULL),
(854, '2024-02-09 21:12:00', '2024-02-10 03:35:00', 1, 165, 2, 0, 'Testing 123', 9, 4, 165, NULL, NULL, NULL, '2024-02-10 03:37:27', NULL, NULL, NULL, 0, NULL),
(855, '2024-02-10 04:14:00', '2024-02-10 13:20:07', 1, 132, 2, 0, 'Testing 123', 7, 4, 132, NULL, NULL, NULL, '2024-02-10 04:15:17', NULL, NULL, NULL, 0, NULL),
(856, '2024-02-10 04:35:42', '2024-02-10 13:22:46', 1, 141, 2, 0, 'Testing 123', 7, 17, 141, NULL, NULL, NULL, '2024-02-10 04:36:08', NULL, NULL, NULL, 0, NULL),
(857, '2024-02-09 19:00:00', '2024-02-10 03:45:00', 1, 174, 2, 0, 'Testing 123', 9, 5, 174, NULL, NULL, NULL, '2024-02-10 04:58:37', NULL, NULL, NULL, 0, NULL),
(858, '2024-02-10 04:54:00', '2024-02-10 10:54:00', 1, 136, 2, 0, 'Testing 123', 7, 18, 136, NULL, NULL, NULL, '2024-02-10 05:00:53', NULL, NULL, NULL, 0, NULL),
(859, '2024-02-10 09:10:00', '2024-02-10 13:38:44', 1, 123, 2, 0, 'Testing 123', 7, 18, 123, NULL, NULL, NULL, '2024-02-10 09:15:30', NULL, NULL, NULL, 0, NULL),
(860, '2024-02-09 09:15:05', '2024-02-08 19:05:05', 1, 186, 2, 0, 'Testing 123', 8, 19, 186, NULL, NULL, NULL, '2024-02-10 09:40:59', NULL, NULL, NULL, 0, NULL),
(861, '2024-02-07 04:17:00', '2024-02-07 13:20:00', 1, 154, 2, 0, 'Testing 123', 7, 17, 154, NULL, NULL, NULL, '2024-02-10 10:22:54', NULL, NULL, NULL, 0, NULL),
(862, '2024-02-10 04:08:00', '2024-02-10 14:06:37', 1, 154, 2, 0, 'Testing 123', 7, 17, 154, NULL, NULL, NULL, '2024-02-10 10:23:13', NULL, NULL, NULL, 0, NULL),
(863, '2024-02-10 03:04:41', '2024-02-10 11:05:41', 1, 179, 2, 0, 'Testing 123', 7, 4, 179, NULL, NULL, NULL, '2024-02-10 11:05:57', NULL, NULL, NULL, 0, NULL),
(864, '2024-02-10 11:11:00', '2024-02-10 19:11:00', 1, 171, 2, 0, 'Testing 123', 8, 5, 171, NULL, NULL, NULL, '2024-02-10 12:12:21', NULL, NULL, NULL, 0, NULL),
(865, '2024-02-09 23:58:00', '2024-02-10 19:13:00', 1, 172, 2, 0, 'Testing 123', 8, 1, 172, NULL, NULL, NULL, '2024-02-10 12:12:46', NULL, NULL, NULL, 0, NULL),
(866, '2024-02-10 04:21:00', '2024-02-10 14:30:10', 1, 126, 2, 0, 'Testing 123', 7, 17, 126, NULL, NULL, NULL, '2024-02-10 14:30:29', NULL, NULL, NULL, 0, NULL),
(867, '2024-02-10 07:46:00', '2024-02-10 18:46:00', 1, 177, 2, 0, 'Testing 123', 8, 19, 177, NULL, NULL, NULL, '2024-02-10 17:47:18', NULL, NULL, NULL, 0, NULL),
(868, '2024-02-10 12:00:44', '2024-02-10 19:06:44', 1, 137, 2, 0, 'Testing 123', 8, 1, 137, NULL, NULL, NULL, '2024-02-10 19:07:09', NULL, NULL, NULL, 0, NULL),
(869, '2024-02-10 19:00:00', '2024-02-11 03:53:00', 1, 175, 2, 0, 'Testing 123', 9, 5, 175, NULL, NULL, NULL, '2024-02-10 19:15:30', NULL, NULL, NULL, 0, NULL),
(870, '2024-02-10 19:11:00', '2024-02-11 03:45:00', 1, 173, 2, 0, 'Testing 123', 9, 1, 173, NULL, NULL, NULL, '2024-02-10 19:16:56', NULL, NULL, NULL, 0, NULL),
(871, '2024-02-10 11:01:00', '2024-02-10 19:46:00', 1, 178, 2, 0, 'Testing 123', 8, 4, 178, NULL, NULL, NULL, '2024-02-10 19:47:58', NULL, NULL, NULL, 0, NULL),
(872, '2024-02-11 07:07:00', '2024-02-11 03:15:00', 1, 184, 2, 0, 'Testing 123', 9, 19, 184, NULL, NULL, NULL, '2024-02-11 03:16:44', NULL, NULL, NULL, 0, NULL),
(873, '2024-02-10 03:12:00', '2024-02-11 11:19:00', 1, 131, 2, 0, 'Testing 123', 7, 1, 131, NULL, NULL, NULL, '2024-02-11 03:53:19', NULL, NULL, NULL, 0, NULL),
(874, '2024-02-10 19:00:00', '2024-02-11 03:53:00', 1, 174, 2, 0, 'Testing 123', 9, 5, 174, NULL, NULL, NULL, '2024-02-11 03:53:47', NULL, NULL, NULL, 0, NULL),
(875, '2024-02-11 03:24:00', '2024-02-11 11:24:00', 1, 131, 2, 0, 'Testing 123', 7, 1, 131, NULL, NULL, NULL, '2024-02-11 03:54:32', NULL, NULL, NULL, 0, NULL),
(876, '2024-02-11 04:11:27', '2024-02-11 12:00:00', 1, 132, 2, 0, 'Testing 123', 7, 4, 132, NULL, NULL, NULL, '2024-02-11 04:11:33', NULL, NULL, NULL, 0, NULL),
(877, '2024-02-10 03:08:00', '2024-02-10 11:07:00', 1, 161, 2, 0, 'Testing 123', 7, 5, 161, NULL, NULL, NULL, '2024-02-11 05:46:51', NULL, NULL, NULL, 0, NULL),
(878, '2024-02-10 09:00:26', '2024-02-10 17:05:26', 1, 186, 2, 0, 'Testing 123', 8, 19, 186, NULL, NULL, NULL, '2024-02-11 06:38:33', NULL, NULL, NULL, 0, NULL),
(879, '2024-02-10 11:51:00', '2024-02-10 19:09:00', 1, 170, 2, 0, 'Testing 123', 8, 6, 170, NULL, NULL, NULL, '2024-02-11 09:30:42', NULL, NULL, NULL, 0, NULL),
(880, '2024-02-11 11:00:00', '2024-02-11 19:21:00', 1, 171, 2, 0, 'Testing 123', 8, 5, 171, NULL, NULL, NULL, '2024-02-11 11:55:32', NULL, NULL, NULL, 0, NULL),
(881, '2024-02-11 07:13:00', '2024-02-11 16:10:00', 1, 149, 2, 0, 'Testing 123', 9, 6, 149, NULL, NULL, NULL, '2024-02-11 14:45:17', NULL, NULL, NULL, 0, NULL),
(882, '2024-02-11 03:15:00', '2024-02-11 17:40:00', 1, 166, 2, 0, 'Testing 123', 7, 5, 166, NULL, NULL, NULL, '2024-02-11 18:13:05', NULL, NULL, NULL, 0, NULL),
(883, '2024-02-09 03:10:00', '2024-02-09 11:14:00', 1, 166, 2, 0, 'Testing 123', 8, 5, 166, NULL, NULL, NULL, '2024-02-11 18:13:37', NULL, NULL, NULL, 0, NULL),
(884, '2024-02-10 15:13:00', '2024-02-11 11:13:00', 1, 166, 2, 0, 'Testing 123', 7, 5, 166, NULL, NULL, NULL, '2024-02-11 18:14:38', NULL, NULL, NULL, 0, NULL),
(885, '2024-02-11 11:01:00', '2024-02-11 19:01:00', 1, 198, 2, 0, 'Testing 123', 8, 4, 198, NULL, NULL, NULL, '2024-02-11 19:02:06', NULL, NULL, NULL, 0, NULL),
(886, '2024-02-11 19:01:00', '2024-02-12 03:35:36', 1, 173, 2, 0, 'Testing 123', 9, 1, 173, NULL, NULL, NULL, '2024-02-11 19:03:19', NULL, NULL, NULL, 0, NULL),
(887, '2024-02-11 19:00:00', '2024-02-12 03:37:00', 1, 175, 2, 0, 'Testing 123', 9, 5, 175, NULL, NULL, NULL, '2024-02-11 19:42:11', NULL, NULL, NULL, 0, NULL),
(888, '2024-02-12 03:06:18', '2024-02-12 11:15:00', 1, 124, 2, 0, 'Testing 123', 7, 6, 124, NULL, NULL, NULL, '2024-02-12 03:06:26', NULL, NULL, NULL, 0, NULL),
(889, '2024-02-11 19:00:00', '2024-02-12 03:37:17', 1, 174, 2, 0, 'Testing 123', 9, 5, 174, NULL, NULL, NULL, '2024-02-12 03:37:57', NULL, NULL, NULL, 0, NULL),
(890, '2024-02-12 07:30:00', '2024-02-12 03:44:00', 1, 184, 2, 0, 'Testing 123', 9, 19, 184, NULL, NULL, NULL, '2024-02-12 03:44:20', NULL, NULL, NULL, 0, NULL),
(891, '2024-02-12 04:14:00', '2024-02-12 14:15:34', 1, 134, 2, 0, 'Testing 123', 7, 18, 134, NULL, NULL, NULL, '2024-02-12 04:15:14', NULL, NULL, NULL, 0, NULL),
(892, '2024-02-12 04:18:01', '2024-02-12 14:37:58', 1, 141, 2, 0, 'Testing 123', 7, 17, 141, NULL, NULL, NULL, '2024-02-12 04:18:43', NULL, NULL, NULL, 0, NULL),
(893, '2024-02-12 03:19:00', '2024-02-12 11:16:00', 1, 131, 2, 0, 'Testing 123', 7, 1, 131, NULL, NULL, NULL, '2024-02-12 04:31:38', NULL, NULL, NULL, 0, NULL),
(894, '2024-02-12 04:33:16', '2024-02-12 14:39:42', 1, 126, 2, 0, 'Testing 123', 7, 17, 126, NULL, NULL, NULL, '2024-02-12 04:33:28', NULL, NULL, NULL, 0, NULL),
(895, '2024-02-12 04:14:00', '2024-02-12 11:57:34', 1, 132, 2, 0, 'Testing 123', 7, 4, 132, NULL, NULL, NULL, '2024-02-12 04:34:20', NULL, NULL, NULL, 0, NULL),
(896, '2024-02-12 04:13:00', '2024-02-12 11:51:00', 1, 136, 2, 0, 'Testing 123', 7, 18, 136, NULL, NULL, NULL, '2024-02-12 04:42:02', NULL, NULL, NULL, 0, NULL),
(897, '2024-02-12 05:06:00', '2024-02-12 14:39:00', 1, 154, 2, 0, 'Testing 123', 7, 17, 154, NULL, NULL, NULL, '2024-02-12 05:03:53', NULL, NULL, NULL, 0, NULL),
(898, '2024-02-12 08:49:00', '2024-02-12 13:12:00', 1, 123, 2, 0, 'Testing 123', 7, 18, 123, NULL, NULL, NULL, '2024-02-12 09:02:11', NULL, NULL, NULL, 0, NULL),
(899, '2024-02-12 11:00:00', '2024-02-12 19:10:00', 1, 171, 2, 0, 'Testing 123', 8, 5, 171, NULL, NULL, NULL, '2024-02-12 11:25:13', NULL, NULL, NULL, 0, NULL),
(900, '2024-02-11 03:11:00', '2024-02-11 11:33:00', 1, 161, 2, 0, 'Testing 123', 7, 5, 161, NULL, NULL, NULL, '2024-02-12 11:34:13', NULL, NULL, NULL, 0, NULL),
(901, '2024-02-11 11:18:00', '2024-02-11 18:38:00', 1, 172, 2, 0, 'Testing 123', 8, 1, 172, NULL, NULL, NULL, '2024-02-12 11:43:26', NULL, NULL, NULL, 0, NULL),
(902, '2024-02-12 11:33:00', '2024-02-12 19:16:00', 1, 172, 2, 0, 'Testing 123', 8, 1, 172, NULL, NULL, NULL, '2024-02-12 11:43:40', NULL, NULL, NULL, 0, NULL),
(903, '2024-02-11 18:00:42', '2024-02-12 03:00:42', 1, 186, 2, 0, 'Testing 123', 9, 19, 186, NULL, NULL, NULL, '2024-02-12 12:57:59', NULL, NULL, NULL, 0, NULL),
(904, '2024-02-11 19:08:00', '2024-02-12 15:10:00', 1, 149, 2, 0, 'Testing 123', 9, 6, 149, NULL, NULL, NULL, '2024-02-12 18:42:44', NULL, NULL, NULL, 0, NULL),
(905, '2024-02-12 19:00:00', '2024-02-13 03:26:57', 1, 175, 2, 0, 'Testing 123', 9, 5, 175, NULL, NULL, NULL, '2024-02-12 19:03:20', NULL, NULL, NULL, 0, NULL),
(906, '2024-02-12 11:03:00', '2024-02-12 19:22:00', 1, 198, 2, 0, 'Testing 123', 8, 4, 198, NULL, NULL, NULL, '2024-02-12 19:22:42', NULL, NULL, NULL, 0, NULL),
(907, '2024-02-12 11:30:16', '2024-02-12 19:00:16', 1, 137, 2, 0, 'Testing 123', 8, 1, 137, NULL, NULL, NULL, '2024-02-12 19:26:50', NULL, NULL, NULL, 0, NULL),
(908, '2024-02-12 11:09:00', '2024-02-12 19:36:00', 1, 178, 2, 0, 'Testing 123', 8, 4, 178, NULL, NULL, NULL, '2024-02-12 19:38:49', NULL, NULL, NULL, 0, NULL),
(909, '2024-02-09 21:12:00', '2024-02-10 03:35:00', 1, 165, 2, 0, 'Testing 123', 9, 4, 165, NULL, NULL, NULL, '2024-02-12 19:39:07', NULL, NULL, NULL, 0, NULL),
(910, '2024-02-11 19:13:00', '2024-02-12 14:54:00', 1, 165, 2, 0, 'Testing 123', 9, 4, 165, NULL, NULL, NULL, '2024-02-12 19:41:03', NULL, NULL, NULL, 0, NULL),
(911, '2024-02-12 19:35:00', '2024-02-13 03:26:22', 1, 165, 2, 0, 'Testing 123', 9, 4, 165, NULL, NULL, NULL, '2024-02-12 19:41:27', NULL, NULL, NULL, 0, NULL),
(912, '2024-02-12 19:00:00', '2024-02-13 03:27:00', 1, 174, 2, 0, 'Testing 123', 9, 5, 174, NULL, NULL, NULL, '2024-02-13 03:27:12', NULL, NULL, NULL, 0, NULL),
(913, '2024-02-13 04:07:00', '2024-02-14 11:45:00', 1, 136, 2, 0, 'Testing 123', 7, 18, 136, NULL, NULL, NULL, '2024-02-13 04:12:37', NULL, NULL, NULL, 0, NULL),
(914, '2024-02-13 04:13:55', '2024-02-13 12:23:48', 1, 132, 2, 0, 'Testing 123', 7, 4, 132, NULL, NULL, NULL, '2024-02-13 04:14:00', NULL, NULL, NULL, 0, NULL),
(915, '2024-02-13 04:17:00', '2024-02-13 14:50:00', 1, 134, 2, 0, 'Testing 123', 7, 18, 134, NULL, NULL, NULL, '2024-02-13 05:17:25', NULL, NULL, NULL, 0, NULL),
(916, '2024-02-13 05:29:00', '2024-02-13 14:21:17', 1, 154, 2, 0, 'Testing 123', 7, 17, 154, NULL, NULL, NULL, '2024-02-13 05:29:16', NULL, NULL, NULL, 0, NULL),
(917, '2024-02-13 03:23:58', '2024-02-13 08:08:58', 1, 179, 2, 0, 'Testing 123', 7, 4, 179, NULL, NULL, NULL, '2024-02-13 08:15:31', NULL, NULL, NULL, 0, NULL),
(918, '2024-02-13 06:19:00', '2024-02-13 13:18:00', 1, 123, 2, 0, 'Testing 123', 7, 18, 123, NULL, NULL, NULL, '2024-02-13 09:06:38', NULL, NULL, NULL, 0, NULL);
INSERT INTO `user_attendances` (`id`, `start_time`, `end_time`, `is_active`, `user_id`, `status`, `leaves`, `comments`, `shift_id`, `team_id`, `created_by`, `deleted_by`, `approved_by`, `modify_by`, `created_time`, `deleted_time`, `approved_time`, `modify_time`, `deny_by`, `deny_time`) VALUES
(919, '2024-02-13 03:22:00', '2024-02-13 11:28:00', 1, 131, 2, 0, 'Testing 123', 7, 1, 131, NULL, NULL, NULL, '2024-02-13 11:12:41', NULL, NULL, NULL, 0, NULL),
(920, '2024-02-13 11:30:33', '2024-02-13 19:10:00', 1, 171, 2, 0, 'Testing 123', 8, 5, 171, NULL, NULL, NULL, '2024-02-13 11:30:56', NULL, NULL, NULL, 0, NULL),
(921, '2024-02-13 11:48:00', '2024-02-13 19:22:00', 1, 172, 2, 0, 'Testing 123', 8, 1, 172, NULL, NULL, NULL, '2024-02-13 12:00:13', NULL, NULL, NULL, 0, NULL),
(922, '2024-02-13 03:10:00', '2024-02-13 13:00:00', 1, 124, 2, 0, 'Testing 123', 7, 6, 124, NULL, NULL, NULL, '2024-02-13 13:31:37', NULL, NULL, NULL, 0, NULL),
(923, '2024-02-12 17:40:28', '2024-02-13 03:35:28', 1, 186, 2, 0, 'Testing 123', 9, 19, 186, NULL, NULL, NULL, '2024-02-13 17:19:44', NULL, NULL, NULL, 0, NULL),
(924, '2024-02-13 19:03:00', '2024-02-14 03:35:00', 1, 173, 2, 0, 'Testing 123', 9, 1, 173, NULL, NULL, NULL, '2024-02-13 19:06:47', NULL, NULL, NULL, 0, NULL),
(925, '2024-02-13 11:14:00', '2024-02-13 19:12:00', 1, 178, 2, 0, 'Testing 123', 8, 4, 178, NULL, NULL, NULL, '2024-02-13 19:14:02', NULL, NULL, NULL, 0, NULL),
(926, '2024-02-11 06:17:00', '2024-02-11 18:26:00', 1, 177, 2, 0, 'Testing 123', 8, 19, 177, NULL, NULL, NULL, '2024-02-13 19:18:13', NULL, NULL, NULL, 0, NULL),
(927, '2024-02-12 07:18:00', '2024-02-11 19:34:00', 1, 177, 2, 0, 'Testing 123', 8, 19, 177, NULL, NULL, NULL, '2024-02-13 19:19:22', NULL, NULL, NULL, 0, NULL),
(928, '2024-02-13 19:00:00', '2024-02-14 03:30:00', 1, 175, 2, 0, 'Testing 123', 9, 5, 175, NULL, NULL, NULL, '2024-02-13 19:27:34', NULL, NULL, NULL, 0, NULL),
(929, '2024-02-13 12:02:00', '2024-02-13 20:08:51', 1, 198, 2, 0, 'Testing 123', 8, 4, 198, NULL, NULL, NULL, '2024-02-13 20:09:48', NULL, NULL, NULL, 0, NULL),
(930, '2024-02-13 10:50:54', '2024-02-13 20:30:54', 1, 137, 2, 0, 'Testing 123', 8, 1, 137, NULL, NULL, NULL, '2024-02-13 21:37:24', NULL, NULL, NULL, 0, NULL),
(931, '2024-02-13 07:00:00', '2024-02-13 03:30:00', 1, 184, 2, 0, 'Testing 123', 9, 19, 184, NULL, NULL, NULL, '2024-02-14 03:11:11', NULL, NULL, NULL, 0, NULL),
(932, '2024-02-14 03:11:00', '2024-02-16 11:56:00', 1, 124, 2, 0, 'Testing 123', 7, 6, 124, NULL, NULL, NULL, '2024-02-14 03:17:02', NULL, NULL, NULL, 0, NULL),
(933, '2024-02-14 03:25:00', '2024-02-14 11:23:00', 1, 131, 2, 0, 'Testing 123', 7, 1, 131, NULL, NULL, NULL, '2024-02-14 03:34:11', NULL, NULL, NULL, 0, NULL),
(934, '2024-02-13 19:00:00', '2024-02-14 03:30:00', 1, 174, 2, 0, 'Testing 123', 9, 5, 174, NULL, NULL, NULL, '2024-02-14 03:50:57', NULL, NULL, NULL, 0, NULL),
(935, '2024-02-14 04:08:36', '2024-02-14 14:00:11', 1, 126, 2, 0, 'Testing 123', 7, 17, 126, NULL, NULL, NULL, '2024-02-14 04:08:44', NULL, NULL, NULL, 0, NULL),
(936, '2024-02-14 08:00:00', '2024-02-14 04:21:00', 1, 184, 2, 0, 'Testing 123', 9, 19, 184, NULL, NULL, NULL, '2024-02-14 04:19:18', NULL, NULL, NULL, 0, NULL),
(937, '2024-02-14 04:16:00', '2024-02-14 12:01:24', 1, 132, 2, 0, 'Testing 123', 7, 4, 132, NULL, NULL, NULL, '2024-02-14 04:35:55', NULL, NULL, NULL, 0, NULL),
(938, '2024-02-14 04:03:00', '2024-02-14 14:09:00', 1, 134, 2, 0, 'Testing 123', 7, 18, 134, NULL, NULL, NULL, '2024-02-14 04:56:48', NULL, NULL, NULL, 0, NULL),
(939, '2024-02-14 04:10:00', '2024-02-15 12:05:00', 1, 136, 2, 0, 'Testing 123', 7, 18, 136, NULL, NULL, NULL, '2024-02-14 05:01:18', NULL, NULL, NULL, 0, NULL),
(940, '2024-02-14 04:35:00', '2024-02-14 13:45:00', 1, 154, 2, 0, 'Testing 123', 7, 17, 154, NULL, NULL, NULL, '2024-02-14 05:02:13', NULL, NULL, NULL, 0, NULL),
(941, '2024-02-13 17:20:45', '2024-02-14 03:30:45', 1, 186, 2, 0, 'Testing 123', 9, 19, 186, NULL, NULL, NULL, '2024-02-14 05:29:33', NULL, NULL, NULL, 0, NULL),
(942, '2024-02-14 05:34:00', '2024-02-14 13:25:00', 1, 123, 2, 0, 'Testing 123', 7, 18, 123, NULL, NULL, NULL, '2024-02-14 05:36:50', NULL, NULL, NULL, 0, NULL),
(943, '2024-02-14 11:11:00', '2024-02-14 19:15:00', 1, 171, 2, 0, 'Testing 123', 8, 5, 171, NULL, NULL, NULL, '2024-02-14 11:13:52', NULL, NULL, NULL, 0, NULL),
(944, '2024-02-14 03:26:58', '2024-02-14 11:21:58', 1, 179, 2, 0, 'Testing 123', 7, 4, 179, NULL, NULL, NULL, '2024-02-14 11:26:29', NULL, NULL, NULL, 0, NULL),
(945, '2024-02-14 11:21:00', '2024-02-14 19:23:00', 1, 172, 2, 0, 'Testing 123', 8, 1, 172, NULL, NULL, NULL, '2024-02-14 12:21:05', NULL, NULL, NULL, 0, NULL),
(946, '2024-02-14 12:20:00', NULL, 1, 114, 1, 0, 'Testing 123', 8, 1, 114, NULL, NULL, NULL, '2024-02-14 12:21:10', NULL, NULL, NULL, 0, NULL),
(947, '2024-02-13 07:24:00', '2024-02-13 18:59:00', 1, 177, 2, 0, 'Testing 123', 8, 19, 177, NULL, NULL, NULL, '2024-02-14 13:49:34', NULL, NULL, NULL, 0, NULL),
(948, '2024-02-14 09:10:00', '2024-02-14 19:43:00', 1, 177, 2, 0, 'Testing 123', 8, 19, 177, NULL, NULL, NULL, '2024-02-14 13:49:59', NULL, NULL, NULL, 0, NULL),
(949, '2024-02-14 07:18:00', '2024-02-14 15:05:00', 1, 149, 2, 0, 'Testing 123', 9, 6, 149, NULL, NULL, NULL, '2024-02-14 13:57:46', NULL, NULL, NULL, 0, NULL),
(950, '2024-02-12 19:10:00', '2024-02-13 16:10:00', 1, 149, 2, 0, 'Testing 123', 9, 6, 149, NULL, NULL, NULL, '2024-02-14 14:20:11', NULL, NULL, NULL, 0, NULL),
(951, '2024-02-12 19:10:00', '2024-02-13 16:10:00', 1, 149, 2, 0, 'Testing 123', 9, 6, 149, NULL, NULL, NULL, '2024-02-14 14:21:24', NULL, NULL, NULL, 0, NULL),
(952, '2024-02-13 11:07:00', '2024-02-13 07:57:00', 1, 161, 2, 0, 'Testing 123', 8, 5, 161, NULL, NULL, NULL, '2024-02-14 17:30:32', NULL, NULL, NULL, 0, NULL),
(953, '2024-02-13 11:09:00', '2024-02-13 07:11:00', 1, 161, 3, 0, 'Testing 123', 8, 5, 161, NULL, NULL, NULL, '2024-02-14 17:31:10', NULL, NULL, NULL, 0, NULL),
(954, '2024-02-14 11:50:29', '2024-02-14 18:03:29', 1, 137, 2, 0, 'Testing 123', 8, 1, 137, NULL, NULL, NULL, '2024-02-14 18:03:45', NULL, NULL, NULL, 0, NULL),
(955, '2024-02-14 19:00:00', '2024-02-15 03:46:23', 1, 173, 2, 0, 'Testing 123', 9, 1, 173, NULL, NULL, NULL, '2024-02-14 19:06:57', NULL, NULL, NULL, 0, NULL),
(956, '2024-02-14 17:15:43', '2024-02-15 03:30:43', 1, 186, 2, 0, 'Testing 123', 9, 19, 186, NULL, NULL, NULL, '2024-02-14 19:11:24', NULL, NULL, NULL, 0, NULL),
(957, '2024-02-14 11:14:00', '2024-02-14 19:26:00', 1, 178, 2, 0, 'Testing 123', 8, 4, 178, NULL, NULL, NULL, '2024-02-14 19:26:13', NULL, NULL, NULL, 0, NULL),
(958, '2024-02-14 19:00:00', '2024-02-15 04:14:53', 1, 175, 2, 0, 'Testing 123', 9, 5, 175, NULL, NULL, NULL, '2024-02-14 19:44:08', NULL, NULL, NULL, 0, NULL),
(959, '2024-02-15 07:08:00', '2024-02-15 03:18:26', 1, 184, 2, 0, 'Testing 123', 9, 19, 184, NULL, NULL, NULL, '2024-02-15 03:18:47', NULL, NULL, NULL, 0, NULL),
(960, '2024-02-15 04:15:21', '2024-02-15 12:05:08', 1, 132, 2, 0, 'Testing 123', 7, 4, 132, NULL, NULL, NULL, '2024-02-15 04:15:26', NULL, NULL, NULL, 0, NULL),
(961, '2024-02-15 04:16:00', '2024-02-16 14:33:00', 1, 126, 2, 0, 'Testing 123', 7, 17, 126, NULL, NULL, NULL, '2024-02-15 04:18:58', NULL, NULL, NULL, 0, NULL),
(962, '2024-02-14 19:01:00', '2024-02-15 04:14:00', 1, 174, 2, 0, 'Testing 123', 9, 5, 174, NULL, NULL, NULL, '2024-02-15 04:21:17', NULL, NULL, NULL, 0, NULL),
(963, '2024-02-15 03:29:00', '2024-02-15 11:30:00', 1, 131, 2, 0, 'Testing 123', 7, 1, 131, NULL, NULL, NULL, '2024-02-15 04:24:18', NULL, NULL, NULL, 0, NULL),
(964, '2024-02-15 04:09:00', '2024-02-15 11:36:00', 1, 136, 2, 0, 'Testing 123', 7, 18, 136, NULL, NULL, NULL, '2024-02-15 04:38:16', NULL, NULL, NULL, 0, NULL),
(965, '2024-02-15 04:33:00', '2024-02-15 13:50:00', 1, 154, 2, 0, 'Testing 123', 7, 17, 154, NULL, NULL, NULL, '2024-02-15 04:39:43', NULL, NULL, NULL, 0, NULL),
(966, '2024-02-15 04:57:00', '2024-02-15 13:20:17', 1, 123, 2, 0, 'Testing 123', 7, 18, 123, NULL, NULL, NULL, '2024-02-15 05:07:49', NULL, NULL, NULL, 0, NULL),
(967, '2024-02-15 07:14:00', '2024-02-15 04:50:00', 1, 149, 2, 0, 'Testing 123', 9, 6, 149, NULL, NULL, NULL, '2024-02-15 05:18:11', NULL, NULL, NULL, 0, NULL),
(968, '2024-02-15 04:17:00', '2024-02-15 14:45:50', 1, 134, 2, 0, 'Testing 123', 7, 18, 134, NULL, NULL, NULL, '2024-02-15 10:23:43', NULL, NULL, NULL, 0, NULL),
(969, '2024-02-15 11:00:00', '2024-02-15 19:11:00', 1, 171, 2, 0, 'Testing 123', 8, 5, 171, NULL, NULL, NULL, '2024-02-15 11:36:50', NULL, NULL, NULL, 0, NULL),
(970, '2024-02-14 23:27:00', '2024-02-15 19:12:00', 1, 172, 2, 0, 'Testing 123', 8, 1, 172, NULL, NULL, NULL, '2024-02-15 11:46:02', NULL, NULL, NULL, 0, NULL),
(971, '2024-02-14 11:00:00', '2024-02-13 19:04:00', 1, 161, 2, 0, 'Testing 123', 8, 5, 161, NULL, NULL, NULL, '2024-02-15 18:54:40', NULL, NULL, NULL, 0, NULL),
(972, '2024-02-16 11:08:00', '2024-02-15 19:14:00', 1, 178, 2, 0, 'Testing 123', 8, 4, 178, NULL, NULL, NULL, '2024-02-15 19:24:20', NULL, NULL, NULL, 0, NULL),
(973, '2024-02-15 19:36:00', '2024-02-16 04:34:32', 1, 173, 2, 0, 'Testing 123', 9, 1, 173, NULL, NULL, NULL, '2024-02-15 19:43:54', NULL, NULL, NULL, 0, NULL),
(974, '2024-02-15 11:25:42', '2024-02-15 19:50:42', 1, 137, 2, 0, 'Testing 123', 8, 1, 137, NULL, NULL, NULL, '2024-02-15 19:50:58', NULL, NULL, NULL, 0, NULL),
(975, '2024-02-15 03:05:00', '2024-02-14 23:35:00', 1, 124, 2, 0, 'Testing 123', 7, 6, 124, NULL, NULL, NULL, '2024-02-15 21:59:05', NULL, NULL, NULL, 0, NULL),
(976, '2024-02-15 19:00:00', '2024-02-16 04:00:00', 1, 175, 2, 0, 'Testing 123', 9, 5, 175, NULL, NULL, NULL, '2024-02-16 04:15:03', NULL, NULL, NULL, 0, NULL),
(977, '2024-02-16 07:30:00', '2024-02-16 04:20:00', 1, 184, 2, 0, 'Testing 123', 9, 19, 184, NULL, NULL, NULL, '2024-02-16 04:18:35', NULL, NULL, NULL, 0, NULL),
(978, '2024-02-16 04:29:00', '2024-02-16 13:35:50', 1, 126, 2, 0, 'Testing 123', 7, 17, 126, NULL, NULL, NULL, '2024-02-16 04:32:46', NULL, NULL, NULL, 0, NULL),
(979, '2024-02-16 04:15:00', '2024-02-16 12:03:15', 1, 132, 2, 0, 'Testing 123', 7, 4, 132, NULL, NULL, NULL, '2024-02-16 04:45:13', NULL, NULL, NULL, 0, NULL),
(980, '2024-02-16 04:46:00', '2024-02-16 13:11:50', 1, 154, 2, 0, 'Testing 123', 7, 17, 154, NULL, NULL, NULL, '2024-02-16 04:47:28', NULL, NULL, NULL, 0, NULL),
(981, '2024-02-16 05:05:34', NULL, 1, 141, 1, 0, 'Testing 123', 7, 17, 141, NULL, NULL, NULL, '2024-02-16 05:05:44', NULL, NULL, NULL, 0, NULL),
(982, '2024-02-16 04:43:00', '2024-02-19 11:29:00', 1, 136, 1, 0, 'Testing 123', 7, 18, 136, NULL, NULL, NULL, '2024-02-16 05:11:41', NULL, NULL, NULL, 0, NULL),
(983, '2024-02-16 05:18:00', '2024-02-16 13:16:52', 1, 123, 1, 0, 'Testing 123', 7, 18, 123, NULL, NULL, NULL, '2024-02-16 05:23:37', NULL, NULL, NULL, 0, NULL),
(984, '2024-02-07 19:16:00', '2024-02-08 15:20:00', 1, 149, 2, 0, 'Testing 123', 9, 6, 149, NULL, NULL, NULL, '2024-02-16 09:20:07', NULL, NULL, NULL, 0, NULL),
(985, '2024-02-15 19:45:00', '2024-02-16 16:15:00', 1, 149, 2, 0, 'Testing 123', 9, 6, 149, NULL, NULL, NULL, '2024-02-16 09:20:57', NULL, NULL, NULL, 0, NULL),
(986, '2024-02-15 17:10:15', '2024-02-16 04:00:15', 1, 186, 2, 0, 'Testing 123', 9, 19, 186, NULL, NULL, NULL, '2024-02-16 10:43:17', NULL, NULL, NULL, 0, NULL),
(987, '2024-02-16 03:02:00', '2024-02-16 11:00:04', 1, 124, 2, 0, 'Testing 123', 7, 6, 124, NULL, NULL, NULL, '2024-02-16 11:00:27', NULL, NULL, NULL, 0, NULL),
(988, '2024-02-14 23:02:00', '2024-02-14 19:08:00', 1, 161, 2, 0, 'Testing 123', 8, 5, 161, NULL, NULL, NULL, '2024-02-16 11:08:35', NULL, NULL, NULL, 0, NULL),
(989, '2024-02-16 11:08:26', '2024-02-16 19:15:00', 1, 171, 2, 0, 'Testing 123', 8, 5, 171, NULL, NULL, NULL, '2024-02-16 11:08:41', NULL, NULL, NULL, 0, NULL),
(990, '2024-02-16 03:08:00', '2024-02-16 11:08:37', 1, 161, 2, 0, 'Testing 123', 7, 5, 161, NULL, NULL, NULL, '2024-02-16 11:08:49', NULL, NULL, NULL, 0, NULL),
(991, '2024-02-16 04:12:16', '2024-02-16 12:51:16', 1, 179, 2, 0, 'Testing 123', 7, 4, 179, NULL, NULL, NULL, '2024-02-16 11:52:38', NULL, NULL, NULL, 0, NULL),
(992, '2024-02-16 07:01:00', '2024-02-16 14:00:00', 1, 134, 1, 0, 'Testing 123', 7, 18, 134, NULL, NULL, NULL, '2024-02-16 13:08:35', NULL, NULL, NULL, 0, NULL),
(993, '2024-02-15 07:15:00', '2024-02-15 18:57:00', 1, 177, 2, 0, 'Testing 123', 8, 19, 177, NULL, NULL, NULL, '2024-02-16 17:15:45', NULL, NULL, NULL, 0, NULL),
(994, '2024-02-16 08:15:00', NULL, 1, 177, 1, 0, 'Testing 123', 8, 19, 177, NULL, NULL, NULL, '2024-02-16 17:16:15', NULL, NULL, NULL, 0, NULL),
(995, '2024-02-16 11:18:00', '2024-02-16 19:36:00', 1, 178, 2, 0, 'Testing 123', 8, 4, 178, NULL, NULL, NULL, '2024-02-16 19:37:01', NULL, NULL, NULL, 0, NULL),
(996, '2024-02-17 03:23:00', '2024-02-17 11:38:00', 1, 131, 2, 0, 'Testing 123', 7, 1, 131, NULL, NULL, NULL, '2024-02-17 03:39:18', NULL, NULL, NULL, 0, NULL),
(997, '2024-02-17 07:00:00', '2024-02-17 03:55:00', 1, 174, 2, 0, 'Testing 123', 9, 5, 174, NULL, NULL, NULL, '2024-02-17 04:07:56', NULL, NULL, NULL, 0, NULL),
(998, '2024-02-17 04:15:00', '2024-02-17 12:01:49', 1, 132, 2, 0, 'Testing 123', 7, 4, 132, NULL, NULL, NULL, '2024-02-17 04:20:05', NULL, NULL, NULL, 0, NULL),
(999, '2024-02-17 04:45:00', '2024-02-17 16:18:00', 1, 134, 1, 0, 'Testing 123', 7, 18, 134, NULL, NULL, NULL, '2024-02-17 07:48:41', NULL, NULL, NULL, 0, NULL),
(1000, '2024-02-17 03:13:00', '2024-02-17 11:15:00', 1, 124, 2, 0, 'Testing 123', 7, 6, 124, NULL, NULL, NULL, '2024-02-17 10:14:15', NULL, NULL, NULL, 0, NULL),
(1001, '2024-02-16 11:14:00', '2024-02-16 19:24:00', 1, 172, 2, 0, 'Testing 123', 8, 1, 172, NULL, NULL, NULL, '2024-02-17 10:15:27', NULL, NULL, NULL, 0, NULL),
(1002, '2024-02-16 19:14:00', '2024-02-17 03:45:00', 1, 149, 2, 0, 'Testing 123', 9, 6, 149, NULL, NULL, NULL, '2024-02-17 10:29:15', NULL, NULL, NULL, 0, NULL),
(1003, '2024-02-17 04:15:00', '2024-02-17 14:09:00', 1, 126, 2, 0, 'Testing 123', 7, 17, 126, NULL, NULL, NULL, '2024-02-17 11:15:31', NULL, NULL, NULL, 0, NULL),
(1004, '2024-02-17 04:13:12', '2024-02-17 12:00:12', 1, 179, 2, 0, 'Testing 123', 7, 4, 179, NULL, NULL, NULL, '2024-02-17 12:01:32', NULL, NULL, NULL, 0, NULL),
(1005, '2024-02-17 10:59:00', '2024-02-17 19:20:00', 1, 171, 2, 0, 'Testing 123', 8, 5, 171, NULL, NULL, NULL, '2024-02-17 13:12:36', NULL, NULL, NULL, 0, NULL),
(1006, '2024-02-17 11:10:00', '2024-02-17 19:23:00', 1, 172, 2, 0, 'Testing 123', 8, 1, 172, NULL, NULL, NULL, '2024-02-17 13:12:38', NULL, NULL, NULL, 0, NULL),
(1007, '2024-02-17 07:10:00', '2024-02-17 03:20:00', 1, 184, 1, 0, 'Testing 123', 9, 19, 184, NULL, NULL, NULL, '2024-02-17 17:15:01', NULL, NULL, NULL, 0, NULL),
(1008, '2024-02-05 18:57:00', '2024-02-17 03:00:00', 1, 184, 2, 0, 'Testing 123', 9, 19, 184, NULL, NULL, NULL, '2024-02-17 17:17:53', NULL, NULL, NULL, 0, NULL),
(1009, '2024-02-08 07:00:00', '2024-02-17 03:08:00', 1, 184, 1, 0, 'Testing 123', 9, 19, 184, NULL, NULL, NULL, '2024-02-17 17:19:59', NULL, NULL, NULL, 0, NULL),
(1010, '2024-02-17 19:06:00', '2024-02-18 03:42:35', 1, 173, 2, 0, 'Testing 123', 9, 1, 173, NULL, NULL, NULL, '2024-02-17 19:27:28', NULL, NULL, NULL, 0, NULL),
(1011, '2024-02-12 11:40:00', '2024-02-12 19:13:00', 1, 170, 2, 0, 'Testing 123', 8, 6, 170, NULL, NULL, NULL, '2024-02-17 19:31:13', NULL, NULL, NULL, 0, NULL),
(1012, '2024-02-13 11:30:00', '2024-02-13 19:21:00', 1, 170, 2, 0, 'Testing 123', 8, 6, 170, NULL, NULL, NULL, '2024-02-17 19:32:20', NULL, NULL, NULL, 0, NULL),
(1013, '2024-02-14 11:41:00', '2024-02-14 19:21:00', 1, 170, 2, 0, 'Testing 123', 8, 6, 170, NULL, NULL, NULL, '2024-02-17 19:33:13', NULL, NULL, NULL, 0, NULL),
(1014, '2024-02-17 11:04:00', '2024-02-17 19:11:00', 1, 178, 2, 0, 'Testing 123', 8, 4, 178, NULL, NULL, NULL, '2024-02-17 19:33:26', NULL, NULL, NULL, 0, NULL),
(1015, '2024-02-15 11:38:00', '2024-02-15 19:52:00', 1, 170, 2, 0, 'Testing 123', 8, 6, 170, NULL, NULL, NULL, '2024-02-17 19:34:20', NULL, NULL, NULL, 0, NULL),
(1016, '2024-02-16 12:12:00', '2024-02-16 19:20:00', 1, 170, 2, 0, 'Testing 123', 8, 6, 170, NULL, NULL, NULL, '2024-02-17 19:35:19', NULL, NULL, NULL, 0, NULL),
(1017, '2024-02-17 12:00:00', '2024-02-17 19:22:00', 1, 170, 2, 0, 'Testing 123', 8, 6, 170, NULL, NULL, NULL, '2024-02-17 19:37:06', NULL, NULL, NULL, 0, NULL),
(1018, '2024-02-17 19:00:00', '2024-02-19 03:26:00', 1, 175, 2, 0, 'Testing 123', 9, 5, 175, NULL, NULL, NULL, '2024-02-18 02:42:37', NULL, NULL, NULL, 0, NULL),
(1019, '2024-02-17 19:00:00', '2024-02-18 03:25:50', 1, 174, 1, 0, 'Testing 123', 9, 5, 174, NULL, NULL, NULL, '2024-02-18 03:26:27', NULL, NULL, NULL, 0, NULL),
(1020, '2024-02-18 03:20:00', '2024-02-18 11:26:00', 1, 131, 2, 0, 'Testing 123', 7, 1, 131, NULL, NULL, NULL, '2024-02-18 03:49:45', NULL, NULL, NULL, 0, NULL),
(1021, '2024-02-18 04:14:50', '2024-02-18 12:22:30', 1, 132, 2, 0, 'Testing 123', 7, 4, 132, NULL, NULL, NULL, '2024-02-18 04:14:55', NULL, NULL, NULL, 0, NULL),
(1022, '2024-02-18 07:15:00', '2024-02-18 04:00:00', 1, 184, 1, 0, 'Testing 123', 9, 19, 184, NULL, NULL, NULL, '2024-02-18 04:56:46', NULL, NULL, NULL, 0, NULL),
(1023, '2024-02-12 03:15:00', '2024-02-12 11:30:00', 1, 166, 2, 0, 'Testing 123', 7, 5, 166, NULL, NULL, NULL, '2024-02-18 09:56:41', NULL, NULL, NULL, 0, NULL),
(1024, '2024-02-13 15:13:00', '2024-02-13 11:28:00', 1, 166, 2, 0, 'Testing 123', 7, 5, 166, NULL, NULL, NULL, '2024-02-18 09:57:43', NULL, NULL, NULL, 0, NULL),
(1025, '2024-02-14 15:20:00', '2024-02-14 13:22:00', 1, 166, 2, 0, 'Testing 123', 7, 5, 166, NULL, NULL, NULL, '2024-02-18 09:58:49', NULL, NULL, NULL, 0, NULL),
(1026, '2024-02-15 15:14:00', '2024-02-15 14:00:00', 1, 166, 2, 0, 'Testing 123', 7, 5, 166, NULL, NULL, NULL, '2024-02-18 10:00:14', NULL, NULL, NULL, 0, NULL),
(1027, '2024-02-16 03:02:00', '2024-02-18 11:30:00', 1, 166, 2, 0, 'Testing 123', 7, 5, 166, NULL, NULL, NULL, '2024-02-18 10:00:57', NULL, NULL, NULL, 0, NULL),
(1028, '2024-02-17 15:00:00', '2024-02-17 11:20:00', 1, 166, 2, 0, 'Testing 123', 7, 5, 166, NULL, NULL, NULL, '2024-02-18 10:01:39', NULL, NULL, NULL, 0, NULL),
(1029, '2024-02-18 15:08:00', '2024-02-18 11:15:00', 1, 124, 2, 0, 'Testing 123', 7, 6, 124, NULL, NULL, NULL, '2024-02-18 11:37:08', NULL, NULL, NULL, 0, NULL),
(1030, '2024-02-18 11:33:00', '2024-02-19 07:13:00', 1, 172, 2, 0, 'Testing 123', 8, 1, 172, NULL, NULL, NULL, '2024-02-18 12:28:38', NULL, NULL, NULL, 0, NULL),
(1031, '2024-02-15 19:30:35', '2024-02-16 04:00:35', 1, 186, 1, 0, 'Testing 123', 9, 19, 186, NULL, NULL, NULL, '2024-02-18 15:38:27', NULL, NULL, NULL, 0, NULL),
(1032, '2024-02-16 19:10:31', '2024-02-17 03:05:31', 1, 186, 1, 0, 'Testing 123', 9, 19, 186, NULL, NULL, NULL, '2024-02-18 15:39:22', NULL, NULL, NULL, 0, NULL),
(1033, '2024-02-18 03:11:00', '2024-02-18 17:25:00', 1, 166, 2, 0, 'Testing 123', 7, 5, 166, NULL, NULL, NULL, '2024-02-18 17:25:12', NULL, NULL, NULL, 0, NULL),
(1034, '2024-02-17 19:16:00', '2024-02-18 17:00:00', 1, 149, 2, 0, 'Testing 123', 9, 6, 149, NULL, NULL, NULL, '2024-02-18 18:18:37', NULL, NULL, NULL, 0, NULL),
(1035, '2024-02-18 19:10:00', '2024-02-19 03:42:42', 1, 173, 2, 0, 'Testing 123', 9, 1, 173, NULL, NULL, NULL, '2024-02-18 19:23:47', NULL, NULL, NULL, 0, NULL),
(1036, '2024-02-18 11:00:00', '2024-02-18 19:25:00', 1, 178, 2, 0, 'Testing 123', 8, 4, 178, NULL, NULL, NULL, '2024-02-18 19:26:31', NULL, NULL, NULL, 0, NULL),
(1037, '2024-02-18 11:26:00', '2024-02-18 19:25:00', 1, 170, 2, 0, 'Testing 123', 8, 6, 170, NULL, NULL, NULL, '2024-02-18 19:26:59', NULL, NULL, NULL, 0, NULL),
(1038, '2024-02-18 19:10:00', '2024-02-19 03:49:48', 1, 175, 2, 0, 'Testing 123', 9, 5, 175, NULL, NULL, NULL, '2024-02-18 19:35:15', NULL, NULL, NULL, 0, NULL),
(1039, '2024-02-19 03:19:00', '2024-02-19 11:15:00', 1, 131, 2, 0, 'Testing 123', 7, 1, 131, NULL, NULL, NULL, '2024-02-19 03:39:57', NULL, NULL, NULL, 0, NULL),
(1040, '2024-02-19 04:07:38', NULL, 1, 126, 1, 0, 'Testing 123', 7, 17, 126, NULL, NULL, NULL, '2024-02-19 04:07:46', NULL, NULL, NULL, 0, NULL),
(1041, '2024-02-19 04:07:38', '2024-02-19 14:40:09', 1, 126, 2, 0, 'Testing 123', 7, 17, 126, NULL, NULL, NULL, '2024-02-19 04:08:19', NULL, NULL, NULL, 0, NULL),
(1042, '2024-02-19 04:28:00', '2024-02-19 13:50:33', 1, 134, 1, 0, 'Testing 123', 7, 18, 134, NULL, NULL, NULL, '2024-02-19 04:41:39', NULL, NULL, NULL, 0, NULL),
(1043, '2024-02-19 05:12:00', '2024-02-19 01:24:00', 1, 123, 1, 0, 'Testing 123', 7, 18, 123, NULL, NULL, NULL, '2024-02-19 05:16:48', NULL, NULL, NULL, 0, NULL),
(1044, '2024-02-17 19:15:57', '2024-02-18 03:40:57', 1, 186, 1, 0, 'Testing 123', 9, 19, 186, NULL, NULL, NULL, '2024-02-19 06:35:33', NULL, NULL, NULL, 0, NULL),
(1045, '2024-02-19 04:27:00', '2024-02-19 23:38:00', 1, 136, 1, 0, 'Testing 123', 7, 18, 136, NULL, NULL, NULL, '2024-02-19 08:36:11', NULL, NULL, NULL, 0, NULL),
(1046, '2024-02-17 04:36:00', '2024-02-17 14:19:00', 1, 141, 2, 0, 'Testing 123', 7, 17, 141, NULL, NULL, NULL, '2024-02-19 10:09:36', NULL, NULL, NULL, 0, NULL),
(1047, '2024-02-19 05:22:00', '2024-02-19 14:39:57', 1, 141, 2, 0, 'Testing 123', 7, 17, 141, NULL, NULL, NULL, '2024-02-19 10:10:46', NULL, NULL, NULL, 0, NULL),
(1048, '2024-02-19 10:58:00', '2024-02-19 19:20:00', 1, 171, 2, 0, 'Testing 123', 8, 5, 171, NULL, NULL, NULL, '2024-02-19 11:42:24', NULL, NULL, NULL, 0, NULL),
(1049, '2024-02-19 05:30:00', '2024-02-19 11:44:45', 1, 124, 2, 0, 'Testing 123', 7, 6, 124, NULL, NULL, NULL, '2024-02-19 11:45:20', NULL, NULL, NULL, 0, NULL),
(1050, '2024-02-19 11:34:00', '2024-02-19 19:17:00', 1, 172, 2, 0, 'Testing 123', 8, 1, 172, NULL, NULL, NULL, '2024-02-19 11:55:27', NULL, NULL, NULL, 0, NULL),
(1051, '2024-02-18 19:18:00', '2024-02-19 17:25:00', 1, 149, 2, 0, 'Testing 123', 9, 6, 149, NULL, NULL, NULL, '2024-02-19 12:08:45', NULL, NULL, NULL, 0, NULL),
(1052, '2024-02-19 04:07:55', '2024-02-19 12:19:55', 1, 179, 2, 0, 'Testing 123', 7, 4, 179, NULL, NULL, NULL, '2024-02-19 12:20:21', NULL, NULL, NULL, 0, NULL),
(1053, '2024-02-19 05:00:00', '2024-02-19 13:00:00', 1, 127, 2, 0, 'Testing 123', 7, 17, 127, NULL, NULL, NULL, '2024-02-19 12:58:03', NULL, NULL, NULL, 0, NULL),
(1054, '2024-02-19 19:05:00', '2024-02-21 04:15:00', 1, 173, 2, 0, 'Testing 123', 9, 1, 173, NULL, NULL, NULL, '2024-02-19 19:14:35', NULL, NULL, NULL, 0, NULL),
(1055, '2024-02-20 11:04:00', '2024-02-19 19:12:00', 1, 178, 2, 0, 'Testing 123', 8, 4, 178, NULL, NULL, NULL, '2024-02-19 19:15:28', NULL, NULL, NULL, 0, NULL),
(1056, '2024-02-20 03:11:08', '2024-02-20 11:02:15', 1, 132, 2, 0, 'Testing 123', 7, 4, 132, NULL, NULL, NULL, '2024-02-20 03:11:15', NULL, NULL, NULL, 0, NULL),
(1057, '2024-02-20 07:12:00', '2024-02-20 03:41:00', 1, 184, 1, 0, 'Testing 123', 9, 19, 184, NULL, NULL, NULL, '2024-02-20 03:41:42', NULL, NULL, NULL, 0, NULL),
(1058, '2024-02-20 04:06:56', '2024-02-20 14:04:05', 1, 126, 2, 0, 'Testing 123', 7, 17, 126, NULL, NULL, NULL, '2024-02-20 04:07:05', NULL, NULL, NULL, 0, NULL),
(1059, '2024-02-20 04:12:00', '2024-02-21 11:43:00', 1, 136, 1, 0, 'Testing 123', 7, 18, 136, NULL, NULL, NULL, '2024-02-20 04:22:20', NULL, NULL, NULL, 0, NULL),
(1060, '2024-02-20 04:33:00', '2024-02-20 14:10:00', 1, 154, 2, 0, 'Testing 123', 7, 17, 154, NULL, NULL, NULL, '2024-02-20 04:34:17', NULL, NULL, NULL, 0, NULL),
(1061, '2024-02-20 04:25:00', '2024-02-20 15:01:40', 1, 141, 2, 0, 'Testing 123', 7, 17, 141, NULL, NULL, NULL, '2024-02-20 04:53:12', NULL, NULL, NULL, 0, NULL),
(1062, '2024-02-19 17:40:40', '2024-02-20 04:00:40', 1, 186, 1, 0, 'Testing 123', 9, 19, 186, NULL, NULL, NULL, '2024-02-20 05:07:39', NULL, NULL, NULL, 0, NULL),
(1063, '2024-02-18 03:07:00', '2024-02-18 11:25:00', 1, 161, 2, 0, 'Testing 123', 7, 5, 161, NULL, NULL, NULL, '2024-02-20 08:26:37', NULL, NULL, NULL, 0, NULL),
(1064, '2024-02-19 03:10:00', '2024-02-19 11:14:00', 1, 161, 2, 0, 'Testing 123', 7, 5, 161, NULL, NULL, NULL, '2024-02-20 08:27:03', NULL, NULL, NULL, 0, NULL),
(1065, '2024-02-19 13:30:55', '2024-02-19 19:30:55', 1, 137, 2, 0, 'Testing 123', 8, 1, 137, NULL, NULL, NULL, '2024-02-20 10:31:11', NULL, NULL, NULL, 0, NULL),
(1066, '2024-02-20 07:10:00', '2024-02-20 11:30:00', 1, 166, 2, 0, 'Testing 123', 9, 5, 166, NULL, NULL, NULL, '2024-02-20 11:52:27', NULL, NULL, NULL, 0, NULL),
(1067, '2024-02-20 04:15:06', '2024-02-20 12:01:06', 1, 179, 2, 0, 'Testing 123', 7, 4, 179, NULL, NULL, NULL, '2024-02-20 12:02:23', NULL, NULL, NULL, 0, NULL),
(1068, '2024-02-19 12:03:00', '2024-02-19 20:04:00', 1, 198, 2, 0, 'Testing 123', 8, 4, 198, NULL, NULL, NULL, '2024-02-20 12:13:27', NULL, NULL, NULL, 0, NULL),
(1069, '2024-02-17 19:00:00', '2024-02-18 03:54:00', 1, 198, 2, 0, 'Testing 123', 7, 4, 198, NULL, NULL, NULL, '2024-02-20 12:17:31', NULL, NULL, NULL, 0, NULL),
(1070, '2024-02-20 15:30:00', '2024-02-20 11:05:00', 1, 124, 2, 0, 'Testing 123', 7, 6, 124, NULL, NULL, NULL, '2024-02-20 12:30:41', NULL, NULL, NULL, 0, NULL),
(1071, '2024-02-20 04:33:00', '2024-02-20 14:10:00', 1, 127, 2, 0, 'Testing 123', 7, 17, 127, NULL, NULL, NULL, '2024-02-20 14:04:46', NULL, NULL, NULL, 0, NULL),
(1072, '2024-02-20 04:16:00', '2024-02-20 14:22:00', 1, 134, 1, 0, 'Testing 123', 7, 18, 134, NULL, NULL, NULL, '2024-02-20 16:14:48', NULL, NULL, NULL, 0, NULL),
(1073, '2024-02-20 11:24:00', NULL, 1, 172, 1, 0, 'Testing 123', 8, 1, 172, NULL, NULL, NULL, '2024-02-20 18:11:24', NULL, NULL, NULL, 0, NULL),
(1074, '2024-02-19 19:16:00', '2024-02-20 14:50:00', 1, 149, 2, 0, 'Testing 123', 9, 6, 149, NULL, NULL, NULL, '2024-02-20 18:47:38', NULL, NULL, NULL, 0, NULL),
(1075, '2024-02-21 18:58:00', '2024-02-21 03:20:00', 1, 173, 2, 0, 'Testing 123', 9, 1, 173, NULL, NULL, NULL, '2024-02-20 19:05:27', NULL, NULL, NULL, 0, NULL),
(1076, '2024-02-20 11:00:00', '2024-02-20 19:08:33', 1, 171, 2, 0, 'Testing 123', 8, 5, 171, NULL, NULL, NULL, '2024-02-20 19:08:56', NULL, NULL, NULL, 0, NULL),
(1077, '2024-02-20 11:10:43', '2024-02-20 19:17:43', 1, 137, 2, 0, 'Testing 123', 8, 1, 137, NULL, NULL, NULL, '2024-02-20 19:18:04', NULL, NULL, NULL, 0, NULL),
(1078, '2024-02-21 11:03:00', '2024-02-20 19:17:00', 1, 178, 2, 0, 'Testing 123', 8, 4, 178, NULL, NULL, NULL, '2024-02-20 19:18:42', NULL, NULL, NULL, 0, NULL),
(1079, '2024-02-20 19:00:00', '2024-02-21 03:22:48', 1, 174, 2, 0, 'Testing 123', 9, 5, 174, NULL, NULL, NULL, '2024-02-20 19:43:47', NULL, NULL, NULL, 0, NULL),
(1080, '2024-02-20 17:40:19', '2024-02-21 16:05:19', 1, 186, 1, 0, 'Testing 123', 9, 19, 186, NULL, NULL, NULL, '2024-02-21 01:06:59', NULL, NULL, NULL, 0, NULL),
(1081, '2024-02-21 03:10:30', '2024-02-21 11:00:00', 1, 124, 2, 0, 'Testing 123', 7, 6, 124, NULL, NULL, NULL, '2024-02-21 03:10:37', NULL, NULL, NULL, 0, NULL),
(1082, '2024-02-20 19:00:00', '2024-02-21 03:14:48', 1, 175, 2, 0, 'Testing 123', 9, 5, 175, NULL, NULL, NULL, '2024-02-21 03:15:05', NULL, NULL, NULL, 0, NULL),
(1083, '2024-02-21 03:15:00', '2024-02-21 11:27:00', 1, 131, 2, 0, 'Testing 123', 7, 1, 131, NULL, NULL, NULL, '2024-02-21 04:04:36', NULL, NULL, NULL, 0, NULL),
(1084, '2024-02-21 07:15:00', '2024-02-21 15:25:00', 1, 149, 2, 0, 'Testing 123', 9, 6, 149, NULL, NULL, NULL, '2024-02-21 04:20:48', NULL, NULL, NULL, 0, NULL),
(1085, '2024-02-21 04:02:00', '2024-02-22 11:16:00', 1, 136, 1, 0, 'Testing 123', 7, 18, 136, NULL, NULL, NULL, '2024-02-21 04:36:14', NULL, NULL, NULL, 0, NULL),
(1086, '2024-02-21 04:36:00', '2024-02-21 13:04:24', 1, 154, 2, 0, 'Testing 123', 7, 17, 154, NULL, NULL, NULL, '2024-02-21 04:36:49', NULL, NULL, NULL, 0, NULL),
(1087, '2024-02-21 04:35:00', '2024-02-21 13:00:00', 1, 127, 2, 0, 'Testing 123', 7, 17, 127, NULL, NULL, NULL, '2024-02-21 04:36:53', NULL, NULL, NULL, 0, NULL),
(1088, '2024-02-21 04:38:21', '2024-02-21 13:50:21', 1, 141, 2, 0, 'Testing 123', 7, 17, 141, NULL, NULL, NULL, '2024-02-21 04:38:38', NULL, NULL, NULL, 0, NULL),
(1089, '2024-02-21 08:00:00', '2024-02-21 04:59:00', 1, 184, 1, 0, 'Testing 123', 9, 19, 184, NULL, NULL, NULL, '2024-02-21 04:51:50', NULL, NULL, NULL, 0, NULL),
(1090, '2024-02-20 05:37:00', '2024-02-20 13:20:00', 1, 123, 1, 0, 'Testing 123', 7, 18, 123, NULL, NULL, NULL, '2024-02-21 05:49:51', NULL, NULL, NULL, 0, NULL),
(1091, '2024-02-21 05:30:00', '2024-02-21 12:55:34', 1, 123, 1, 0, 'Testing 123', 7, 18, 123, NULL, NULL, NULL, '2024-02-21 05:50:11', NULL, NULL, NULL, 0, NULL),
(1092, '2024-02-21 06:16:00', '2024-02-21 14:38:00', 1, 126, 2, 0, 'Testing 123', 7, 17, 126, NULL, NULL, NULL, '2024-02-21 06:33:43', NULL, NULL, NULL, 0, NULL),
(1093, '2024-02-21 04:30:20', '2024-02-21 12:03:20', 1, 179, 2, 0, 'Testing 123', 7, 4, 179, NULL, NULL, NULL, '2024-02-21 12:09:43', NULL, NULL, NULL, 0, NULL),
(1094, '2024-02-21 11:36:00', NULL, 1, 172, 1, 0, 'Testing 123', 8, 1, 172, NULL, NULL, NULL, '2024-02-21 14:05:24', NULL, NULL, NULL, 0, NULL),
(1095, '2024-02-20 11:00:00', '2024-02-19 19:03:00', 1, 161, 2, 0, 'Testing 123', 8, 5, 161, NULL, NULL, NULL, '2024-02-21 18:51:19', NULL, NULL, NULL, 0, NULL),
(1096, '2024-02-21 10:59:00', '2024-02-21 19:15:00', 1, 171, 2, 0, 'Testing 123', 8, 5, 171, NULL, NULL, NULL, '2024-02-21 18:51:36', NULL, NULL, NULL, 0, NULL),
(1097, '2024-02-20 23:02:00', '2024-02-20 19:07:00', 1, 161, 2, 0, 'Testing 123', 8, 5, 161, NULL, NULL, NULL, '2024-02-21 18:51:42', NULL, NULL, NULL, 0, NULL),
(1098, '2024-02-21 11:01:00', '2024-02-21 19:07:00', 1, 178, 2, 0, 'Testing 123', 8, 4, 178, NULL, NULL, NULL, '2024-02-21 19:07:53', NULL, NULL, NULL, 0, NULL),
(1099, '2024-02-21 19:00:00', '2024-02-22 03:56:28', 1, 173, 2, 0, 'Testing 123', 9, 1, 173, NULL, NULL, NULL, '2024-02-21 19:13:13', NULL, NULL, NULL, 0, NULL),
(1100, '2024-02-22 07:12:00', '2024-02-22 03:45:02', 1, 184, 1, 0, 'Testing 123', 9, 19, 184, NULL, NULL, NULL, '2024-02-22 03:45:35', NULL, NULL, NULL, 0, NULL),
(1101, '2024-02-21 19:00:00', '2024-02-22 03:52:00', 1, 174, 2, 0, 'Testing 123', 9, 5, 174, NULL, NULL, NULL, '2024-02-22 03:52:21', NULL, NULL, NULL, 0, NULL),
(1102, '2024-02-21 19:00:00', '2024-02-22 03:52:00', 1, 175, 2, 0, 'Testing 123', 9, 5, 175, NULL, NULL, NULL, '2024-02-22 03:59:06', NULL, NULL, NULL, 0, NULL),
(1103, '2024-02-22 04:12:15', '2024-02-23 14:01:00', 1, 126, 2, 0, 'Testing 123', 7, 17, 126, NULL, NULL, NULL, '2024-02-22 04:12:26', NULL, NULL, NULL, 0, NULL),
(1104, '2024-02-22 04:30:20', '2024-02-22 14:25:30', 1, 141, 2, 0, 'Testing 123', 7, 17, 141, NULL, NULL, NULL, '2024-02-22 04:30:48', NULL, NULL, NULL, 0, NULL),
(1105, '2024-02-22 04:35:00', '2024-02-22 14:03:00', 1, 154, 2, 0, 'Testing 123', 7, 17, 154, NULL, NULL, NULL, '2024-02-22 04:34:43', NULL, NULL, NULL, 0, NULL),
(1106, '2024-02-22 04:35:32', '2024-02-22 13:08:43', 1, 127, 2, 0, 'Testing 123', 7, 17, 127, NULL, NULL, NULL, '2024-02-22 04:35:58', NULL, NULL, NULL, 0, NULL),
(1107, '2024-02-22 04:19:00', '2024-02-23 11:35:00', 1, 136, 1, 0, 'Testing 123', 7, 18, 136, NULL, NULL, NULL, '2024-02-22 04:52:20', NULL, NULL, NULL, 0, NULL),
(1108, '2024-02-22 05:33:00', '2024-02-22 13:08:00', 1, 123, 1, 0, 'Testing 123', 7, 18, 123, NULL, NULL, NULL, '2024-02-22 05:55:40', NULL, NULL, NULL, 0, NULL),
(1109, '2024-02-22 03:07:00', '2024-02-22 11:04:01', 1, 124, 2, 0, 'Testing 123', 7, 6, 124, NULL, NULL, NULL, '2024-02-22 11:04:39', NULL, NULL, NULL, 0, NULL),
(1110, '2024-02-21 11:24:07', '2024-02-21 18:09:07', 1, 137, 2, 0, 'Testing 123', 8, 1, 137, NULL, NULL, NULL, '2024-02-22 11:13:41', NULL, NULL, NULL, 0, NULL),
(1111, '2024-02-21 19:20:00', '2024-02-22 04:10:00', 1, 149, 2, 0, 'Testing 123', 9, 6, 149, NULL, NULL, NULL, '2024-02-22 11:17:07', NULL, NULL, NULL, 0, NULL),
(1112, '2024-02-22 04:40:06', '2024-02-22 12:10:06', 1, 179, 2, 0, 'Testing 123', 7, 4, 179, NULL, NULL, NULL, '2024-02-22 12:20:33', NULL, NULL, NULL, 0, NULL),
(1113, '2024-02-21 04:31:00', '2024-02-21 11:15:00', 1, 134, 1, 0, 'Testing 123', 7, 18, 134, NULL, NULL, NULL, '2024-02-22 16:15:33', NULL, NULL, NULL, 0, NULL),
(1114, '2024-02-22 11:04:00', '2024-02-22 19:29:00', 1, 178, 2, 0, 'Testing 123', 8, 4, 178, NULL, NULL, NULL, '2024-02-22 19:29:56', NULL, NULL, NULL, 0, NULL),
(1115, '2024-02-19 11:05:00', '2024-02-19 19:22:00', 1, 170, 2, 0, 'Testing 123', 8, 6, 170, NULL, NULL, NULL, '2024-02-22 19:43:31', NULL, NULL, NULL, 0, NULL),
(1116, '2024-02-22 19:00:00', '2024-02-23 03:52:26', 1, 175, 2, 0, 'Testing 123', 9, 5, 175, NULL, NULL, NULL, '2024-02-22 19:43:37', NULL, NULL, NULL, 0, NULL),
(1117, '2024-02-20 12:00:00', '2024-02-20 19:17:00', 1, 170, 2, 0, 'Testing 123', 8, 6, 170, NULL, NULL, NULL, '2024-02-22 19:44:34', NULL, NULL, NULL, 0, NULL),
(1118, '2024-02-22 11:30:00', '2024-02-22 19:16:00', 1, 170, 2, 0, 'Testing 123', 8, 6, 170, NULL, NULL, NULL, '2024-02-22 19:45:49', NULL, NULL, NULL, 0, NULL),
(1119, '2024-02-21 17:50:03', '2024-02-22 05:10:03', 1, 186, 1, 0, 'Testing 123', 9, 19, 186, NULL, NULL, NULL, '2024-02-22 22:50:34', NULL, NULL, NULL, 0, NULL),
(1120, '2024-02-22 17:45:41', '2024-02-23 04:25:41', 1, 186, 1, 0, 'Testing 123', 9, 19, 186, NULL, NULL, NULL, '2024-02-22 22:51:18', NULL, NULL, NULL, 0, NULL),
(1121, '2024-02-23 03:15:00', '2024-02-23 11:18:00', 1, 132, 2, 0, 'Testing 123', 7, 4, 132, NULL, NULL, NULL, '2024-02-23 03:18:08', NULL, NULL, NULL, 0, NULL),
(1122, '2024-02-23 07:01:00', '2024-02-23 03:23:11', 1, 184, 2, 0, 'Testing 123', 9, 19, 184, NULL, NULL, NULL, '2024-02-23 03:23:37', NULL, NULL, NULL, 0, NULL),
(1123, '2024-02-23 04:12:42', '2024-02-26 13:35:00', 1, 126, 2, 0, 'Testing 123', 7, 17, 126, NULL, NULL, NULL, '2024-02-23 04:12:49', NULL, NULL, NULL, 0, NULL),
(1124, '2024-02-23 04:38:00', '2024-02-23 13:36:00', 1, 154, 2, 0, 'Testing 123', 7, 17, 154, NULL, NULL, NULL, '2024-02-23 04:39:02', NULL, NULL, NULL, 0, NULL),
(1125, '2024-02-23 04:35:00', '2024-02-23 13:12:18', 1, 127, 2, 0, 'Testing 123', 7, 17, 127, NULL, NULL, NULL, '2024-02-23 04:41:42', NULL, NULL, NULL, 0, NULL),
(1126, '2024-02-23 07:15:00', '2024-02-23 03:10:00', 1, 149, 2, 0, 'Testing 123', 9, 6, 149, NULL, NULL, NULL, '2024-02-23 05:19:33', NULL, NULL, NULL, 0, NULL),
(1127, '2024-02-23 05:36:17', '2024-02-23 13:36:14', 1, 141, 2, 0, 'Testing 123', 7, 17, 141, NULL, NULL, NULL, '2024-02-23 05:36:53', NULL, NULL, NULL, 0, NULL),
(1128, '2024-02-22 11:36:00', '2024-02-22 19:32:00', 1, 171, 2, 0, 'Testing 123', 8, 5, 171, NULL, NULL, NULL, '2024-02-23 08:42:05', NULL, NULL, NULL, 0, NULL),
(1129, '2024-02-23 05:10:00', '2024-02-24 12:36:00', 1, 136, 1, 0, 'Testing 123', 7, 18, 136, NULL, NULL, NULL, '2024-02-23 09:40:09', NULL, NULL, NULL, 0, NULL),
(1130, '2024-02-22 12:01:35', '2024-02-22 19:00:35', 1, 137, 2, 0, 'Testing 123', 8, 1, 137, NULL, NULL, NULL, '2024-02-23 09:56:15', NULL, NULL, NULL, 0, NULL),
(1131, '2024-02-23 03:10:00', '2024-02-23 11:06:37', 1, 124, 2, 0, 'Testing 123', 7, 6, 124, NULL, NULL, NULL, '2024-02-23 11:07:03', NULL, NULL, NULL, 0, NULL),
(1132, '2024-02-23 04:19:44', '2024-02-23 12:00:44', 1, 179, 2, 0, 'Testing 123', 7, 4, 179, NULL, NULL, NULL, '2024-02-23 12:01:23', NULL, NULL, NULL, 0, NULL),
(1133, '2024-02-23 06:01:00', '2024-02-23 13:04:27', 1, 123, 1, 0, 'Testing 123', 7, 18, 123, NULL, NULL, NULL, '2024-02-23 13:04:43', NULL, NULL, NULL, 0, NULL),
(1134, '2024-02-23 11:02:00', '2024-02-23 19:15:00', 1, 161, 2, 0, 'Testing 123', 8, 5, 161, NULL, NULL, NULL, '2024-02-23 18:56:06', NULL, NULL, NULL, 0, NULL),
(1135, '2024-02-23 19:05:00', '2024-02-24 03:45:44', 1, 173, 2, 0, 'Testing 123', 9, 1, 173, NULL, NULL, NULL, '2024-02-23 19:10:24', NULL, NULL, NULL, 0, NULL),
(1136, '2024-02-24 11:12:00', '2024-02-23 19:10:00', 1, 178, 2, 0, 'Testing 123', 8, 4, 178, NULL, NULL, NULL, '2024-02-23 19:10:57', NULL, NULL, NULL, 0, NULL),
(1137, '2024-02-22 12:02:00', '2024-02-21 20:07:00', 1, 198, 2, 0, 'Testing 123', 8, 4, 198, NULL, NULL, NULL, '2024-02-23 19:41:37', NULL, NULL, NULL, 0, NULL),
(1138, '2024-02-21 00:01:00', '2024-02-20 20:17:00', 1, 198, 2, 0, 'Testing 123', 8, 4, 198, NULL, NULL, NULL, '2024-02-23 19:42:47', NULL, NULL, NULL, 0, NULL),
(1139, '2024-02-20 00:08:00', '2024-02-19 20:24:00', 1, 198, 2, 0, 'Testing 123', 8, 4, 198, NULL, NULL, NULL, '2024-02-23 19:44:35', NULL, NULL, NULL, 0, NULL),
(1140, '2024-02-15 00:03:00', '2024-02-15 20:11:00', 1, 198, 2, 0, 'Testing 123', 8, 4, 198, NULL, NULL, NULL, '2024-02-23 19:49:14', NULL, NULL, NULL, 0, NULL),
(1141, '2024-02-14 00:01:00', '2024-02-14 20:16:00', 1, 198, 2, 0, 'Testing 123', 8, 4, 198, NULL, NULL, NULL, '2024-02-23 19:51:27', NULL, NULL, NULL, 0, NULL),
(1142, '2024-02-16 00:02:00', '2024-02-16 20:16:00', 1, 198, 2, 0, 'Testing 123', 8, 4, 198, NULL, NULL, NULL, '2024-02-23 19:54:30', NULL, NULL, NULL, 0, NULL),
(1143, '2024-02-17 00:00:00', '2024-02-16 20:00:00', 1, 198, 2, 0, 'Testing 123', 8, 4, 198, NULL, NULL, NULL, '2024-02-23 19:56:06', NULL, NULL, NULL, 0, NULL),
(1144, '2024-02-23 00:05:00', '2024-02-23 20:10:00', 1, 198, 2, 0, 'Testing 123', 8, 4, 198, NULL, NULL, NULL, '2024-02-23 20:14:09', NULL, NULL, NULL, 0, NULL),
(1145, '2024-02-22 04:39:00', '2024-02-22 13:37:00', 1, 134, 1, 0, 'Testing 123', 7, 18, 134, NULL, NULL, NULL, '2024-02-23 20:39:39', NULL, NULL, NULL, 0, NULL),
(1146, '2024-02-23 04:39:00', '2024-02-23 12:39:00', 1, 134, 1, 0, 'Testing 123', 7, 18, 134, NULL, NULL, NULL, '2024-02-23 20:40:22', NULL, NULL, NULL, 0, NULL),
(1147, '2024-02-23 19:00:00', '2024-02-24 04:04:48', 1, 175, 2, 0, 'Testing 123', 9, 5, 175, NULL, NULL, NULL, '2024-02-24 02:52:56', NULL, NULL, NULL, 0, NULL),
(1148, '2024-02-24 07:18:00', '2024-02-24 03:26:00', 1, 184, 2, 0, 'Testing 123', 9, 19, 184, NULL, NULL, NULL, '2024-02-24 03:26:20', NULL, NULL, NULL, 0, NULL),
(1149, '2024-02-24 04:20:44', '2024-02-24 13:03:04', 1, 141, 2, 0, 'Testing 123', 7, 17, 141, NULL, NULL, NULL, '2024-02-24 04:21:16', NULL, NULL, NULL, 0, NULL),
(1150, '2024-02-23 11:05:00', '2024-02-24 03:25:00', 1, 170, 2, 0, 'Testing 123', 8, 6, 170, NULL, NULL, NULL, '2024-02-24 04:30:06', NULL, NULL, NULL, 0, NULL),
(1151, '2024-02-24 04:35:00', '2024-02-24 13:25:31', 1, 127, 2, 0, 'Testing 123', 7, 17, 127, NULL, NULL, NULL, '2024-02-24 04:38:21', NULL, NULL, NULL, 0, NULL),
(1152, '2024-02-24 04:07:00', '2024-02-26 11:02:00', 1, 136, 1, 0, 'Testing 123', 7, 18, 136, NULL, NULL, NULL, '2024-02-24 08:01:45', NULL, NULL, NULL, 0, NULL),
(1153, '2024-02-24 10:09:00', '2024-02-24 13:02:18', 1, 123, 1, 0, 'Testing 123', 7, 18, 123, NULL, NULL, NULL, '2024-02-24 10:15:47', NULL, NULL, NULL, 0, NULL),
(1154, '2024-02-22 03:21:00', '2024-02-24 11:28:00', 1, 131, 2, 0, 'Testing 123', 7, 1, 131, NULL, NULL, NULL, '2024-02-24 11:29:14', NULL, NULL, NULL, 0, NULL),
(1155, '2024-02-24 03:15:00', '2024-02-24 11:13:00', 1, 131, 2, 0, 'Testing 123', 7, 1, 131, NULL, NULL, NULL, '2024-02-24 11:29:49', NULL, NULL, NULL, 0, NULL),
(1156, '2024-02-24 04:13:40', '2024-02-24 11:05:40', 1, 179, 2, 0, 'Testing 123', 7, 4, 179, NULL, NULL, NULL, '2024-02-24 13:12:31', NULL, NULL, NULL, 0, NULL),
(1157, '2024-02-24 04:29:00', '2024-02-24 13:29:00', 1, 134, 1, 0, 'Testing 123', 7, 18, 134, NULL, NULL, NULL, '2024-02-24 16:30:05', NULL, NULL, NULL, 0, NULL),
(1158, '2024-02-23 11:30:56', '2024-02-23 19:23:56', 1, 137, 2, 0, 'Testing 123', 8, 1, 137, NULL, NULL, NULL, '2024-02-24 18:27:41', NULL, NULL, NULL, 0, NULL),
(1159, '2024-02-24 11:20:11', '2024-02-24 19:05:11', 1, 137, 2, 0, 'Testing 123', 8, 1, 137, NULL, NULL, NULL, '2024-02-24 19:05:28', NULL, NULL, NULL, 0, NULL),
(1160, '2024-02-24 19:00:00', '2024-02-25 02:45:11', 1, 175, 2, 0, 'Testing 123', 9, 5, 175, NULL, NULL, NULL, '2024-02-24 19:21:06', NULL, NULL, NULL, 0, NULL),
(1161, '2024-02-23 11:00:00', '2024-02-23 19:23:00', 1, 171, 2, 0, 'Testing 123', 8, 5, 171, NULL, NULL, NULL, '2024-02-24 19:24:48', NULL, NULL, NULL, 0, NULL),
(1162, '2024-02-24 11:45:00', '2024-02-24 19:24:00', 1, 171, 2, 0, 'Testing 123', 8, 5, 171, NULL, NULL, NULL, '2024-02-24 19:25:28', NULL, NULL, NULL, 0, NULL),
(1163, '2024-02-25 18:55:00', '2024-02-25 03:45:00', 1, 173, 2, 0, 'Testing 123', 9, 1, 173, NULL, NULL, NULL, '2024-02-24 19:28:10', NULL, NULL, NULL, 0, NULL),
(1164, '2024-02-25 11:01:00', '2024-02-24 19:34:40', 1, 178, 2, 0, 'Testing 123', 8, 4, 178, NULL, NULL, NULL, '2024-02-24 19:35:34', NULL, NULL, NULL, 0, NULL),
(1165, '2024-02-24 19:00:00', '2024-02-25 02:47:22', 1, 174, 2, 0, 'Testing 123', 9, 5, 174, NULL, NULL, NULL, '2024-02-25 02:47:39', NULL, NULL, NULL, 0, NULL),
(1166, '2024-02-25 03:13:16', '2024-02-25 11:08:28', 1, 132, 2, 0, 'Testing 123', 7, 4, 132, NULL, NULL, NULL, '2024-02-25 03:13:25', NULL, NULL, NULL, 0, NULL),
(1167, '2024-02-25 07:02:00', '2024-02-25 03:25:00', 1, 184, 2, 0, 'Testing 123', 9, 19, 184, NULL, NULL, NULL, '2024-02-25 03:25:28', NULL, NULL, NULL, 0, NULL),
(1168, '2024-02-24 03:30:00', '2024-02-25 11:49:00', 1, 124, 2, 0, 'Testing 123', 7, 6, 124, NULL, NULL, NULL, '2024-02-25 06:53:00', NULL, NULL, NULL, 0, NULL),
(1169, '2024-02-25 03:06:00', '2024-02-25 11:17:53', 1, 124, 2, 0, 'Testing 123', 7, 6, 124, NULL, NULL, NULL, '2024-02-25 06:53:24', NULL, NULL, NULL, 0, NULL),
(1170, '2024-02-24 03:12:00', '2024-02-24 11:19:00', 1, 161, 2, 0, 'Testing 123', 7, 5, 161, NULL, NULL, NULL, '2024-02-25 07:20:19', NULL, NULL, NULL, 0, NULL),
(1171, '2024-02-18 03:15:00', '2024-02-18 11:20:00', 1, 161, 3, 0, 'Testing 123', 7, 5, 161, NULL, NULL, NULL, '2024-02-25 07:21:02', NULL, NULL, NULL, 0, NULL),
(1172, '2024-02-19 03:10:00', '2024-02-19 12:35:00', 1, 166, 2, 0, 'Testing 123', 7, 5, 166, NULL, NULL, NULL, '2024-02-25 11:10:53', NULL, NULL, NULL, 0, NULL),
(1173, '2024-02-25 03:14:00', '2024-02-25 11:14:33', 1, 131, 2, 0, 'Testing 123', 7, 1, 131, NULL, NULL, NULL, '2024-02-25 11:14:46', NULL, NULL, NULL, 0, NULL),
(1174, '2024-02-24 19:23:00', '2024-02-25 16:00:00', 1, 149, 2, 0, 'Testing 123', 9, 6, 149, NULL, NULL, NULL, '2024-02-25 17:00:08', NULL, NULL, NULL, 0, NULL),
(1175, '2024-02-25 11:59:00', '2024-02-25 19:24:45', 1, 171, 2, 0, 'Testing 123', 8, 5, 171, NULL, NULL, NULL, '2024-02-25 19:25:01', NULL, NULL, NULL, 0, NULL),
(1176, '2024-02-25 19:04:00', '2024-02-26 03:19:38', 1, 173, 2, 0, 'Testing 123', 9, 1, 173, NULL, NULL, NULL, '2024-02-25 19:39:53', NULL, NULL, NULL, 0, NULL),
(1177, '2024-02-25 11:14:00', '2024-02-25 19:29:00', 1, 178, 3, 0, 'Testing 123', 8, 4, 178, NULL, NULL, NULL, '2024-02-25 19:44:12', NULL, NULL, NULL, 0, NULL),
(1178, '2024-02-21 03:10:00', '2024-02-21 00:00:00', 1, 166, 2, 0, 'Testing 123', 7, 5, 166, NULL, NULL, NULL, '2024-02-25 20:20:09', NULL, NULL, NULL, 0, NULL),
(1179, '2024-02-21 03:13:00', '2024-02-21 11:24:00', 1, 166, 2, 0, 'Testing 123', 7, 5, 166, NULL, NULL, NULL, '2024-02-25 20:20:36', NULL, NULL, NULL, 0, NULL),
(1180, '2024-02-22 02:20:00', '2024-02-22 11:20:00', 1, 166, 2, 0, 'Testing 123', 7, 5, 166, NULL, NULL, NULL, '2024-02-25 20:21:13', NULL, NULL, NULL, 0, NULL),
(1181, '2024-02-23 03:21:00', '2024-02-22 23:21:00', 1, 166, 2, 0, 'Testing 123', 7, 5, 166, NULL, NULL, NULL, '2024-02-25 20:21:47', NULL, NULL, NULL, 0, NULL),
(1182, '2024-02-24 03:21:00', '2024-02-24 13:20:00', 1, 166, 2, 0, 'Testing 123', 7, 5, 166, NULL, NULL, NULL, '2024-02-25 20:22:29', NULL, NULL, NULL, 0, NULL),
(1183, '2024-02-25 03:22:00', '2024-02-25 00:29:00', 1, 166, 2, 0, 'Testing 123', 7, 5, 166, NULL, NULL, NULL, '2024-02-25 20:22:59', NULL, NULL, NULL, 0, NULL),
(1184, '2024-02-26 03:35:00', '2024-02-26 11:01:34', 1, 132, 2, 0, 'Testing 123', 7, 4, 132, NULL, NULL, NULL, '2024-02-26 04:10:00', NULL, NULL, NULL, 0, NULL),
(1185, '2024-02-26 04:14:00', '2024-02-26 12:14:53', 1, 126, 2, 0, 'Testing 123', 7, 17, 126, NULL, NULL, NULL, '2024-02-26 04:21:00', NULL, NULL, NULL, 0, NULL),
(1186, '2024-02-24 04:14:00', '2024-02-26 13:23:00', 1, 126, 2, 0, 'Testing 123', 7, 17, 126, NULL, NULL, NULL, '2024-02-26 04:24:23', NULL, NULL, NULL, 0, NULL),
(1187, '2024-02-26 04:30:51', '2024-02-26 12:16:10', 1, 127, 2, 0, 'Testing 123', 7, 17, 127, NULL, NULL, NULL, '2024-02-26 04:31:01', NULL, NULL, NULL, 0, NULL),
(1188, '2024-02-24 04:38:00', '2024-02-24 01:25:00', 1, 154, 2, 0, 'Testing 123', 7, 17, 154, NULL, NULL, NULL, '2024-02-26 04:33:56', NULL, NULL, NULL, 0, NULL),
(1189, '2024-02-26 04:34:00', '2024-02-26 12:17:00', 1, 154, 2, 0, 'Testing 123', 7, 17, 154, NULL, NULL, NULL, '2024-02-26 04:34:29', NULL, NULL, NULL, 0, NULL),
(1190, '2024-02-26 04:36:12', '2024-02-27 12:15:00', 1, 141, 2, 0, 'Testing 123', 7, 17, 141, NULL, NULL, NULL, '2024-02-26 04:36:37', NULL, NULL, NULL, 0, NULL),
(1191, '2024-02-26 04:32:00', '2024-02-26 11:16:00', 1, 136, 1, 0, 'Testing 123', 7, 18, 136, NULL, NULL, NULL, '2024-02-26 05:15:10', NULL, NULL, NULL, 0, NULL),
(1192, '2024-02-26 05:50:00', '2024-02-26 12:26:32', 1, 123, 1, 0, 'Testing 123', 7, 18, 123, NULL, NULL, NULL, '2024-02-26 06:12:08', NULL, NULL, NULL, 0, NULL),
(1193, '2024-02-26 08:00:00', '2024-02-26 17:30:00', 1, 149, 2, 0, 'Testing 123', 9, 6, 149, NULL, NULL, NULL, '2024-02-26 09:14:16', NULL, NULL, NULL, 0, NULL),
(1194, '2024-02-26 03:17:00', '2024-02-27 11:01:00', 1, 124, 2, 0, 'Testing 123', 7, 6, 124, NULL, NULL, NULL, '2024-02-26 10:57:00', NULL, NULL, NULL, 0, NULL),
(1195, '2024-02-26 03:19:00', '2024-02-26 11:10:00', 1, 131, 2, 0, 'Testing 123', 7, 1, 131, NULL, NULL, NULL, '2024-02-26 11:17:14', NULL, NULL, NULL, 0, NULL),
(1196, '2024-02-26 11:15:00', '2024-02-26 19:36:00', 1, 172, 2, 0, 'Testing 123', 8, 1, 172, NULL, NULL, NULL, '2024-02-26 18:17:43', NULL, NULL, NULL, 0, NULL),
(1197, '2024-02-26 11:04:00', '2024-02-26 19:09:13', 1, 178, 2, 0, 'Testing 123', 8, 4, 178, NULL, NULL, NULL, '2024-02-26 19:09:53', NULL, NULL, NULL, 0, NULL),
(1198, '2024-02-26 13:03:38', '2024-02-26 19:45:38', 1, 137, 2, 0, 'Testing 123', 8, 1, 137, NULL, NULL, NULL, '2024-02-26 20:05:00', NULL, NULL, NULL, 0, NULL),
(1199, '2024-02-24 00:03:00', '2024-02-24 20:10:00', 1, 198, 2, 0, 'Testing 123', 8, 4, 198, NULL, NULL, NULL, '2024-02-26 20:13:12', NULL, NULL, NULL, 0, NULL),
(1200, '2024-02-26 00:06:00', '2024-02-26 20:13:00', 1, 198, 2, 0, 'Testing 123', 8, 4, 198, NULL, NULL, NULL, '2024-02-26 20:14:10', NULL, NULL, NULL, 0, NULL),
(1201, '2024-02-26 19:00:00', '2024-02-27 03:59:49', 1, 175, 2, 0, 'Testing 123', 9, 5, 175, NULL, NULL, NULL, '2024-02-27 00:10:18', NULL, NULL, NULL, 0, NULL),
(1202, '2024-02-26 19:05:00', '2024-02-27 03:10:08', 1, 173, 2, 0, 'Testing 123', 9, 1, 173, NULL, NULL, NULL, '2024-02-27 03:10:57', NULL, NULL, NULL, 0, NULL),
(1203, '2024-02-27 07:10:00', '2024-02-27 03:20:00', 1, 184, 2, 0, 'Testing 123', 9, 19, 184, NULL, NULL, NULL, '2024-02-27 03:20:41', NULL, NULL, NULL, 0, NULL),
(1204, '2024-02-27 03:15:00', '2024-02-27 11:12:48', 1, 132, 2, 0, 'Testing 123', 7, 4, 132, NULL, NULL, NULL, '2024-02-27 03:22:45', NULL, NULL, NULL, 0, NULL),
(1205, '2024-02-27 03:20:00', '2024-02-27 10:46:00', 1, 131, 2, 0, 'Testing 123', 7, 1, 131, NULL, NULL, NULL, '2024-02-27 04:09:40', NULL, NULL, NULL, 0, NULL),
(1206, '2024-02-26 04:50:00', '2024-02-26 12:10:00', 1, 134, 1, 0, 'Testing 123', 7, 18, 134, NULL, NULL, NULL, '2024-02-27 04:10:40', NULL, NULL, NULL, 0, NULL),
(1207, '2024-02-27 04:23:00', '2024-02-28 15:34:00', 1, 126, 2, 0, 'Testing 123', 7, 17, 126, NULL, NULL, NULL, '2024-02-27 04:28:51', NULL, NULL, NULL, 0, NULL),
(1208, '2024-02-27 04:38:00', '2024-02-27 17:08:00', 1, 154, 2, 0, 'Testing 123', 7, 17, 154, NULL, NULL, NULL, '2024-02-27 04:38:17', NULL, NULL, NULL, 0, NULL),
(1209, '2024-02-27 04:49:00', '2024-02-27 11:20:00', 1, 136, 1, 0, 'Testing 123', 7, 18, 136, NULL, NULL, NULL, '2024-02-27 05:08:57', NULL, NULL, NULL, 0, NULL),
(1210, '2024-02-27 04:45:00', '2024-02-27 13:54:00', 1, 134, 1, 0, 'Testing 123', 7, 18, 134, NULL, NULL, NULL, '2024-02-27 06:45:49', NULL, NULL, NULL, 0, NULL),
(1211, '2024-02-27 07:05:11', '2024-02-27 15:36:39', 1, 141, 2, 0, 'Testing 123', 7, 17, 141, NULL, NULL, NULL, '2024-02-27 07:05:37', NULL, NULL, NULL, 0, NULL),
(1212, '2024-02-27 07:05:45', NULL, 1, 141, 1, 0, 'Testing 123', 7, 17, 141, NULL, NULL, NULL, '2024-02-27 07:05:58', NULL, NULL, NULL, 0, NULL),
(1213, '2024-02-27 04:36:00', '2024-02-27 13:52:46', 1, 127, 2, 0, 'Testing 123', 7, 17, 127, NULL, NULL, NULL, '2024-02-27 08:02:44', NULL, NULL, NULL, 0, NULL),
(1214, '2024-02-27 03:24:00', '2024-02-27 11:29:00', 1, 125, 2, 0, 'Testing 123', 7, 6, 125, NULL, NULL, NULL, '2024-02-27 10:28:27', NULL, NULL, NULL, 0, NULL),
(1215, '2024-02-27 07:30:00', '2024-02-27 16:10:00', 1, 149, 2, 0, 'Testing 123', 9, 6, 149, NULL, NULL, NULL, '2024-02-27 10:51:01', NULL, NULL, NULL, 0, NULL),
(1216, '2024-02-26 11:10:00', '2024-02-26 19:20:00', 1, 171, 2, 0, 'Testing 123', 8, 5, 171, NULL, NULL, NULL, '2024-02-27 11:38:29', NULL, NULL, NULL, 0, NULL),
(1217, '2024-02-27 11:03:00', '2024-02-27 19:20:00', 1, 171, 2, 0, 'Testing 123', 8, 5, 171, NULL, NULL, NULL, '2024-02-27 11:38:53', NULL, NULL, NULL, 0, NULL),
(1218, '2024-02-27 11:33:00', '2024-02-27 19:09:35', 1, 172, 2, 0, 'Testing 123', 8, 1, 172, NULL, NULL, NULL, '2024-02-27 12:17:02', NULL, NULL, NULL, 0, NULL),
(1219, '2024-02-25 03:00:00', '2024-02-25 08:30:00', 1, 161, 1, 0, 'Testing 123', 7, 5, 161, NULL, NULL, NULL, '2024-02-27 19:00:43', NULL, NULL, NULL, 0, NULL),
(1220, '2024-02-27 03:12:00', '2024-02-26 23:04:00', 1, 161, 2, 0, 'Testing 123', 7, 5, 161, NULL, NULL, NULL, '2024-02-27 19:01:13', NULL, NULL, NULL, 0, NULL),
(1221, '2024-02-27 11:03:00', '2024-02-27 19:10:18', 1, 178, 2, 0, 'Testing 123', 8, 4, 178, NULL, NULL, NULL, '2024-02-27 19:10:58', NULL, NULL, NULL, 0, NULL),
(1222, '2024-02-27 19:00:00', '2024-02-29 15:04:00', 1, 175, 2, 0, 'Testing 123', 9, 5, 175, NULL, NULL, NULL, '2024-02-27 19:16:24', NULL, NULL, NULL, 0, NULL),
(1223, '2024-02-27 11:30:35', '2024-02-27 19:30:35', 1, 137, 2, 0, 'Testing 123', 8, 1, 137, NULL, NULL, NULL, '2024-02-27 19:30:50', NULL, NULL, NULL, 0, NULL),
(1224, '2024-02-28 07:00:00', '2024-02-28 03:46:39', 1, 184, 2, 0, 'Testing 123', 9, 19, 184, NULL, NULL, NULL, '2024-02-28 03:47:10', NULL, NULL, NULL, 0, NULL),
(1225, '2024-02-28 03:20:00', '2024-02-28 11:12:00', 1, 131, 2, 0, 'Testing 123', 7, 1, 131, NULL, NULL, NULL, '2024-02-28 04:01:51', NULL, NULL, NULL, 0, NULL),
(1226, '2024-02-28 04:00:00', '2024-02-28 11:09:00', 1, 132, 2, 0, 'Testing 123', 7, 4, 132, NULL, NULL, NULL, '2024-02-28 04:06:54', NULL, NULL, NULL, 0, NULL),
(1227, '2024-02-28 04:17:00', '2024-02-28 13:28:33', 1, 126, 2, 0, 'Testing 123', 7, 17, 126, NULL, NULL, NULL, '2024-02-28 04:24:20', NULL, NULL, NULL, 0, NULL),
(1228, '2024-02-28 04:25:00', '2024-02-28 01:33:00', 1, 154, 2, 0, 'Testing 123', 7, 17, 154, NULL, NULL, NULL, '2024-02-28 04:25:06', NULL, NULL, NULL, 0, NULL),
(1229, '2024-02-28 04:51:52', '2024-02-28 13:31:18', 1, 141, 2, 0, 'Testing 123', 7, 17, 141, NULL, NULL, NULL, '2024-02-28 04:52:22', NULL, NULL, NULL, 0, NULL);
INSERT INTO `user_attendances` (`id`, `start_time`, `end_time`, `is_active`, `user_id`, `status`, `leaves`, `comments`, `shift_id`, `team_id`, `created_by`, `deleted_by`, `approved_by`, `modify_by`, `created_time`, `deleted_time`, `approved_time`, `modify_time`, `deny_by`, `deny_time`) VALUES
(1230, '2024-02-28 15:30:00', '2024-02-28 11:26:00', 1, 124, 1, 0, 'Testing 123', 7, 6, 124, NULL, NULL, NULL, '2024-02-28 11:02:31', NULL, NULL, NULL, 0, NULL),
(1231, '2024-02-28 04:30:00', '2024-02-28 13:31:30', 1, 127, 2, 0, 'Testing 123', 7, 17, 127, NULL, NULL, NULL, '2024-02-28 11:50:13', NULL, NULL, NULL, 0, NULL),
(1232, '2024-02-28 11:37:00', '2024-02-28 19:27:31', 1, 172, 2, 0, 'Testing 123', 8, 1, 172, NULL, NULL, NULL, '2024-02-28 11:55:43', NULL, NULL, NULL, 0, NULL),
(1233, '2024-02-28 04:30:30', '2024-02-28 12:15:30', 1, 179, 2, 0, 'Testing 123', 7, 4, 179, NULL, NULL, NULL, '2024-02-28 12:24:52', NULL, NULL, NULL, 0, NULL),
(1234, '2024-02-28 04:55:00', '2024-02-28 15:55:05', 1, 134, 1, 0, 'Testing 123', 7, 18, 134, NULL, NULL, NULL, '2024-02-28 15:55:21', NULL, NULL, NULL, 0, NULL),
(1235, '2024-02-28 11:01:00', '2024-02-28 19:17:00', 1, 178, 2, 0, 'Testing 123', 8, 4, 178, NULL, NULL, NULL, '2024-02-28 19:24:05', NULL, NULL, NULL, 0, NULL),
(1236, '2024-02-28 11:05:00', '2024-02-28 19:29:26', 1, 171, 2, 0, 'Testing 123', 8, 5, 171, NULL, NULL, NULL, '2024-02-28 19:29:47', NULL, NULL, NULL, 0, NULL),
(1237, '2024-02-28 19:00:00', '2024-02-29 03:43:05', 1, 175, 2, 0, 'Testing 123', 9, 5, 175, NULL, NULL, NULL, '2024-02-28 19:34:55', NULL, NULL, NULL, 0, NULL),
(1238, '2024-02-27 20:00:00', '2024-02-28 04:10:00', 1, 149, 2, 0, 'Testing 123', 9, 6, 149, NULL, NULL, NULL, '2024-02-28 20:21:34', NULL, NULL, NULL, 0, NULL),
(1239, '2024-02-28 11:27:57', '2024-02-28 20:02:57', 1, 137, 2, 0, 'Testing 123', 8, 1, 137, NULL, NULL, NULL, '2024-02-29 00:03:31', NULL, NULL, NULL, 0, NULL),
(1240, '2024-02-29 03:29:26', '2024-02-29 11:25:39', 1, 132, 2, 0, 'Testing 123', 7, 4, 132, NULL, NULL, NULL, '2024-02-29 03:29:32', NULL, NULL, NULL, 0, NULL),
(1241, '2024-02-28 03:13:00', '2024-02-28 11:02:00', 1, 161, 2, 0, 'Testing 123', 7, 5, 161, NULL, NULL, NULL, '2024-02-29 03:51:31', NULL, NULL, NULL, 0, NULL),
(1242, '2024-02-29 07:02:00', '2024-02-29 03:54:21', 1, 173, 2, 0, 'Testing 123', 9, 1, 173, NULL, NULL, NULL, '2024-02-29 03:54:59', NULL, NULL, NULL, 0, NULL),
(1243, '2024-02-29 07:19:00', '2024-02-29 04:18:40', 1, 184, 2, 0, 'Testing 123', 9, 19, 184, NULL, NULL, NULL, '2024-02-29 04:18:59', NULL, NULL, NULL, 0, NULL),
(1244, '2024-02-29 04:17:00', '2024-02-29 13:25:43', 1, 126, 1, 0, 'Testing 123', 7, 17, 126, NULL, NULL, NULL, '2024-02-29 04:26:22', NULL, NULL, NULL, 0, NULL),
(1245, '2024-02-29 04:27:52', '2024-02-29 13:26:35', 1, 127, 1, 0, 'Testing 123', 7, 17, 127, NULL, NULL, NULL, '2024-02-29 04:28:02', NULL, NULL, NULL, 0, NULL),
(1246, '2024-02-29 04:26:00', '2024-02-29 13:27:00', 1, 154, 1, 0, 'Testing 123', 7, 17, 154, NULL, NULL, NULL, '2024-02-29 04:56:03', NULL, NULL, NULL, 0, NULL),
(1247, '2024-02-29 05:02:41', '2024-02-29 13:28:08', 1, 141, 1, 0, 'Testing 123', 7, 17, 141, NULL, NULL, NULL, '2024-02-29 05:03:06', NULL, NULL, NULL, 0, NULL),
(1248, '2024-02-29 07:18:00', '2024-02-29 04:10:00', 1, 149, 2, 0, 'Testing 123', 9, 6, 149, NULL, NULL, NULL, '2024-02-29 05:47:30', NULL, NULL, NULL, 0, NULL),
(1249, '2024-02-29 04:03:09', '2024-02-29 08:03:09', 1, 179, 2, 0, 'Testing 123', 7, 4, 179, NULL, NULL, NULL, '2024-02-29 08:04:26', NULL, NULL, NULL, 0, NULL),
(1250, '2024-02-29 03:24:00', '2024-02-29 11:13:00', 1, 131, 2, 0, 'Testing 123', 7, 1, 131, NULL, NULL, NULL, '2024-02-29 11:20:27', NULL, NULL, NULL, 0, NULL),
(1251, '2024-02-28 12:00:00', '2024-02-28 20:15:00', 1, 198, 2, 0, 'Testing 123', 8, 4, 198, NULL, NULL, NULL, '2024-02-29 12:13:55', NULL, NULL, NULL, 0, NULL),
(1252, '2024-02-10 11:41:00', '2024-02-09 19:22:00', 1, 169, 1, 0, 'Testing 123', 8, 6, 169, NULL, NULL, NULL, '2024-02-29 18:06:56', NULL, NULL, NULL, 0, NULL),
(1253, '2024-02-11 11:50:00', '2024-02-10 19:24:00', 1, 169, 1, 0, 'Testing 123', 8, 6, 169, NULL, NULL, NULL, '2024-02-29 18:08:54', NULL, NULL, NULL, 0, NULL),
(1254, '2024-02-12 12:20:00', '2024-02-11 19:15:00', 1, 169, 1, 0, 'Testing 123', 8, 6, 169, NULL, NULL, NULL, '2024-02-29 18:09:45', NULL, NULL, NULL, 0, NULL),
(1255, '2024-02-13 12:00:00', '2024-02-12 19:20:00', 1, 169, 1, 0, 'Testing 123', 8, 6, 169, NULL, NULL, NULL, '2024-02-29 18:11:58', NULL, NULL, NULL, 0, NULL),
(1256, '2024-02-14 00:05:00', '2024-02-13 19:22:00', 1, 169, 1, 0, 'Testing 123', 8, 6, 169, NULL, NULL, NULL, '2024-02-29 18:12:55', NULL, NULL, NULL, 0, NULL),
(1257, '2024-02-15 12:09:00', '2024-02-14 19:50:00', 1, 169, 1, 0, 'Testing 123', 8, 6, 169, NULL, NULL, NULL, '2024-02-29 18:14:04', NULL, NULL, NULL, 0, NULL),
(1258, '2024-02-16 12:30:00', '2024-02-15 19:22:00', 1, 169, 1, 0, 'Testing 123', 8, 6, 169, NULL, NULL, NULL, '2024-02-29 18:15:00', NULL, NULL, NULL, 0, NULL),
(1259, '2024-02-17 12:30:00', '2024-02-16 19:00:00', 1, 169, 1, 0, 'Testing 123', 8, 6, 169, NULL, NULL, NULL, '2024-02-29 18:18:14', NULL, NULL, NULL, 0, NULL),
(1260, '2024-02-18 11:35:00', '2024-02-17 19:26:00', 1, 169, 1, 0, 'Testing 123', 8, 6, 169, NULL, NULL, NULL, '2024-02-29 18:19:55', NULL, NULL, NULL, 0, NULL),
(1261, '2024-02-18 23:15:00', '2024-02-18 19:25:00', 1, 169, 1, 0, 'Testing 123', 8, 6, 169, NULL, NULL, NULL, '2024-02-29 18:21:02', NULL, NULL, NULL, 0, NULL),
(1262, '2024-02-20 12:28:00', '2024-02-19 19:17:00', 1, 169, 1, 0, 'Testing 123', 8, 6, 169, NULL, NULL, NULL, '2024-02-29 18:21:45', NULL, NULL, NULL, 0, NULL),
(1263, '2024-02-21 23:26:00', '2024-02-21 19:19:00', 1, 169, 1, 0, 'Testing 123', 8, 6, 169, NULL, NULL, NULL, '2024-02-29 18:23:12', NULL, NULL, NULL, 0, NULL),
(1264, '2024-02-22 23:19:00', '2024-02-24 03:26:00', 1, 169, 1, 0, 'Testing 123', 8, 6, 169, NULL, NULL, NULL, '2024-02-29 18:24:55', NULL, NULL, NULL, 0, NULL),
(1265, '2024-02-24 12:00:00', '2024-02-23 19:34:00', 1, 169, 1, 0, 'Testing 123', 8, 6, 169, NULL, NULL, NULL, '2024-02-29 18:26:36', NULL, NULL, NULL, 0, NULL),
(1266, '2024-02-25 11:40:00', '2024-02-24 20:32:00', 1, 169, 1, 0, 'Testing 123', 8, 6, 169, NULL, NULL, NULL, '2024-02-29 18:27:38', NULL, NULL, NULL, 0, NULL),
(1267, '2024-02-26 11:10:00', '2024-02-25 19:36:00', 1, 169, 1, 0, 'Testing 123', 8, 6, 169, NULL, NULL, NULL, '2024-02-29 18:28:40', NULL, NULL, NULL, 0, NULL),
(1268, '2024-02-27 12:00:00', '2024-02-26 20:30:00', 1, 169, 2, 0, 'Testing 123', 8, 6, 169, NULL, NULL, NULL, '2024-02-29 18:29:38', NULL, NULL, NULL, 0, NULL),
(1269, '2024-02-28 12:10:00', '2024-02-27 19:25:00', 1, 169, 1, 0, 'Testing 123', 8, 6, 169, NULL, NULL, NULL, '2024-02-29 18:30:25', NULL, NULL, NULL, 0, NULL),
(1270, '2024-02-29 11:33:16', '2024-02-29 19:23:16', 1, 137, 2, 0, 'Testing 123', 8, 1, 137, NULL, NULL, NULL, '2024-02-29 19:17:46', NULL, NULL, NULL, 0, NULL),
(1271, '2024-02-29 11:15:00', '2024-02-29 19:17:50', 1, 171, 2, 0, 'Testing 123', 8, 5, 171, NULL, NULL, NULL, '2024-02-29 19:18:17', NULL, NULL, NULL, 0, NULL),
(1272, '2024-02-29 15:04:00', '2024-03-01 11:25:00', 1, 124, 1, 0, 'Testing 123', 7, 6, 124, NULL, NULL, NULL, '2024-02-29 19:26:54', NULL, NULL, NULL, 0, NULL),
(1273, '2024-02-29 11:00:00', '2024-02-29 19:25:00', 1, 178, 2, 0, 'Testing 123', 8, 4, 178, NULL, NULL, NULL, '2024-02-29 19:27:16', NULL, NULL, NULL, 0, NULL),
(1274, '2024-02-29 12:05:00', '2024-02-28 19:27:00', 1, 169, 1, 0, 'Testing 123', 8, 6, 169, NULL, NULL, NULL, '2024-02-29 19:28:46', NULL, NULL, NULL, 0, NULL),
(1275, '2024-03-01 07:05:00', '2024-03-01 03:15:00', 1, 184, 1, 0, 'Testing 123', 9, 19, 184, NULL, NULL, NULL, '2024-03-01 03:15:20', NULL, NULL, NULL, 0, NULL),
(1276, '2024-03-01 03:15:00', '2024-03-01 11:04:28', 1, 132, 2, 0, 'Testing 123', 7, 4, 132, NULL, NULL, NULL, '2024-03-01 03:21:56', NULL, NULL, NULL, 0, NULL),
(1277, '2024-02-29 19:00:00', '2024-03-02 16:00:00', 1, 175, 2, 0, 'Testing 123', 9, 5, 175, NULL, NULL, NULL, '2024-03-01 03:27:39', NULL, NULL, NULL, 0, NULL),
(1278, '2024-03-01 07:13:00', '2024-03-01 03:44:26', 1, 173, 2, 0, 'Testing 123', 9, 1, 173, NULL, NULL, NULL, '2024-03-01 03:45:00', NULL, NULL, NULL, 0, NULL),
(1279, '2024-03-01 04:53:55', NULL, 1, 141, 1, 0, 'Testing 123', 7, 17, 141, NULL, NULL, NULL, '2024-03-01 04:54:14', NULL, NULL, NULL, 0, NULL),
(1280, '2024-03-01 05:04:26', '2024-03-01 13:34:54', 1, 127, 1, 0, 'Testing 123', 7, 17, 127, NULL, NULL, NULL, '2024-03-01 05:04:36', NULL, NULL, NULL, 0, NULL),
(1281, '2024-02-29 03:03:00', '2024-02-29 11:03:00', 1, 161, 1, 0, 'Testing 123', 7, 5, 161, NULL, NULL, NULL, '2024-03-01 05:37:41', NULL, NULL, NULL, 0, NULL),
(1282, '2024-02-29 12:12:00', '2024-02-29 20:05:00', 1, 198, 2, 0, 'Testing 123', 8, 4, 198, NULL, NULL, NULL, '2024-03-01 06:48:32', NULL, NULL, NULL, 0, NULL),
(1283, '2024-03-01 03:17:00', '2024-03-01 13:31:18', 1, 126, 1, 0, 'Testing 123', 7, 17, 126, NULL, NULL, NULL, '2024-03-01 10:19:52', NULL, NULL, NULL, 0, NULL),
(1284, '2024-02-29 19:17:00', '2024-03-01 16:05:00', 1, 149, 2, 0, 'Testing 123', 9, 6, 149, NULL, NULL, NULL, '2024-03-01 13:07:11', NULL, NULL, NULL, 0, NULL),
(1285, '2024-03-01 04:33:00', '2024-03-01 01:37:00', 1, 154, 1, 0, 'Testing 123', 7, 17, 154, NULL, NULL, NULL, '2024-03-01 13:08:51', NULL, NULL, NULL, 0, NULL),
(1286, '2024-03-01 15:09:00', '2024-02-29 23:05:00', 1, 124, 2, 0, 'Testing 123', 7, 6, 124, NULL, NULL, NULL, '2024-03-01 16:43:01', NULL, NULL, NULL, 0, NULL),
(1287, '2024-03-01 12:22:00', NULL, 1, 172, 1, 0, 'Testing 123', 8, 1, 172, NULL, NULL, NULL, '2024-03-01 19:02:44', NULL, NULL, NULL, 0, NULL),
(1288, '2024-03-01 19:00:00', '2024-03-02 03:50:00', 1, 173, 2, 0, 'Testing 123', 9, 1, 173, NULL, NULL, NULL, '2024-03-01 19:07:07', NULL, NULL, NULL, 0, NULL),
(1289, '2024-03-01 11:04:00', '2024-03-01 19:21:55', 1, 171, 2, 0, 'Testing 123', 8, 5, 171, NULL, NULL, NULL, '2024-03-01 19:22:12', NULL, NULL, NULL, 0, NULL),
(1290, '2024-03-01 10:59:00', '2024-03-01 19:19:00', 1, 178, 2, 0, 'Testing 123', 8, 4, 178, NULL, NULL, NULL, '2024-03-01 19:27:59', NULL, NULL, NULL, 0, NULL),
(1291, '2024-03-01 12:14:00', '2024-03-01 20:05:30', 1, 198, 2, 0, 'Testing 123', 8, 4, 198, NULL, NULL, NULL, '2024-03-01 20:08:05', NULL, NULL, NULL, 0, NULL),
(1292, '2024-03-02 07:03:00', '2024-03-02 03:33:00', 1, 184, 1, 0, 'Testing 123', 9, 19, 184, NULL, NULL, NULL, '2024-03-02 03:33:27', NULL, NULL, NULL, 0, NULL),
(1293, '2024-03-02 03:13:00', '2024-03-02 11:14:00', 1, 132, 2, 0, 'Testing 123', 7, 4, 132, NULL, NULL, NULL, '2024-03-02 03:34:45', NULL, NULL, NULL, 0, NULL),
(1294, '2024-03-02 04:14:00', NULL, 1, 126, 1, 0, 'Testing 123', 7, 17, 126, NULL, NULL, NULL, '2024-03-02 04:17:25', NULL, NULL, NULL, 0, NULL),
(1295, '2024-03-02 04:37:00', '2024-03-02 13:24:14', 1, 154, 1, 0, 'Testing 123', 7, 17, 154, NULL, NULL, NULL, '2024-03-02 04:38:11', NULL, NULL, NULL, 0, NULL),
(1296, '2024-03-02 04:40:48', '2024-03-02 13:14:40', 1, 141, 1, 0, 'Testing 123', 7, 17, 141, NULL, NULL, NULL, '2024-03-02 04:41:12', NULL, NULL, NULL, 0, NULL),
(1297, '2024-03-02 04:36:00', NULL, 1, 127, 1, 0, 'Testing 123', 7, 17, 127, NULL, NULL, NULL, '2024-03-02 04:41:23', NULL, NULL, NULL, 0, NULL),
(1298, '2024-03-02 04:02:00', '2024-03-02 12:02:52', 1, 136, 1, 0, 'Testing 123', 7, 18, 136, NULL, NULL, NULL, '2024-03-02 05:23:48', NULL, NULL, NULL, 0, NULL),
(1299, '2024-03-02 03:10:00', '2024-03-02 11:23:29', 1, 131, 2, 0, 'Testing 123', 7, 1, 131, NULL, NULL, NULL, '2024-03-02 06:11:12', NULL, NULL, NULL, 0, NULL),
(1300, '2024-03-02 03:10:00', '2024-03-02 07:28:00', 1, 171, 3, 0, 'Testing 123', 7, 5, 171, NULL, NULL, NULL, '2024-03-02 06:40:59', NULL, NULL, NULL, 0, NULL),
(1301, '2024-02-29 04:37:00', '2024-02-29 13:05:00', 1, 134, 1, 0, 'Testing 123', 7, 18, 134, NULL, NULL, NULL, '2024-03-02 07:02:44', NULL, NULL, NULL, 0, NULL),
(1302, '2024-03-02 05:00:39', '2024-03-02 13:17:51', 1, 204, 1, 0, 'Testing 123', 7, 17, 204, NULL, NULL, NULL, '2024-03-02 08:43:22', NULL, NULL, NULL, 0, NULL),
(1303, '2024-03-01 19:18:00', '2024-03-02 16:50:00', 1, 149, 2, 0, 'Testing 123', 9, 6, 149, NULL, NULL, NULL, '2024-03-02 08:55:24', NULL, NULL, NULL, 0, NULL),
(1304, '2024-03-02 11:43:00', '2024-03-02 19:43:00', 1, 172, 2, 0, 'Testing 123', 8, 1, 172, NULL, NULL, NULL, '2024-03-02 12:03:17', NULL, NULL, NULL, 0, NULL),
(1305, '2024-03-02 15:08:00', '2024-03-02 11:00:00', 1, 124, 2, 0, 'Testing 123', 7, 6, 124, NULL, NULL, NULL, '2024-03-02 17:31:50', NULL, NULL, NULL, 0, NULL),
(1306, '2024-03-02 18:51:01', '2024-03-03 03:04:29', 1, 175, 3, 0, 'Testing 123', 9, 5, 175, NULL, NULL, NULL, '2024-03-02 18:51:12', NULL, NULL, NULL, 0, NULL),
(1307, '2024-03-02 11:02:00', '2024-03-02 19:02:38', 1, 171, 2, 0, 'Testing 123', 8, 5, 171, NULL, NULL, NULL, '2024-03-02 19:02:55', NULL, NULL, NULL, 0, NULL),
(1308, '2024-03-02 00:04:00', '2024-03-02 20:13:03', 1, 198, 2, 0, 'Testing 123', 8, 4, 198, NULL, NULL, NULL, '2024-03-02 20:13:26', NULL, NULL, NULL, 0, NULL),
(1309, '2024-03-01 11:41:00', '2024-02-29 19:37:00', 1, 169, 2, 0, 'Testing 123', 8, 6, 169, NULL, NULL, NULL, '2024-03-02 23:27:25', NULL, NULL, NULL, 0, NULL),
(1310, '2024-03-02 12:29:00', '2024-03-01 19:15:00', 1, 169, 2, 0, 'Testing 123', 8, 6, 169, NULL, NULL, NULL, '2024-03-02 23:28:40', NULL, NULL, NULL, 0, NULL),
(1311, '2024-03-03 03:07:00', '2024-03-03 11:03:00', 1, 124, 2, 0, 'Testing 123', 7, 6, 124, NULL, NULL, NULL, '2024-03-03 03:11:58', NULL, NULL, NULL, 0, NULL),
(1312, '2024-03-03 18:56:00', '2024-03-03 03:17:00', 1, 184, 1, 0, 'Testing 123', 9, 19, 184, NULL, NULL, NULL, '2024-03-03 03:17:29', NULL, NULL, NULL, 0, NULL),
(1313, '2024-03-03 03:47:32', '2024-03-03 11:12:30', 1, 132, 2, 0, 'Testing 123', 7, 4, 132, NULL, NULL, NULL, '2024-03-03 03:47:38', NULL, NULL, NULL, 0, NULL),
(1314, '2024-02-29 19:00:00', '2024-03-03 15:30:00', 1, 174, 2, 0, 'Testing 123', 9, 5, 174, NULL, NULL, NULL, '2024-03-03 09:28:55', NULL, NULL, NULL, 0, NULL),
(1315, '2024-03-01 19:00:00', '2024-03-02 03:00:00', 1, 174, 2, 0, 'Testing 123', 9, 5, 174, NULL, NULL, NULL, '2024-03-03 09:29:53', NULL, NULL, NULL, 0, NULL),
(1316, '2024-03-03 03:10:00', '2024-03-03 11:15:00', 1, 131, 2, 0, 'Testing 123', 7, 1, 131, NULL, NULL, NULL, '2024-03-03 10:58:29', NULL, NULL, NULL, 0, NULL),
(1317, '2024-03-03 11:17:00', NULL, 1, 172, 1, 0, 'Testing 123', 8, 1, 172, NULL, NULL, NULL, '2024-03-03 16:51:07', NULL, NULL, NULL, 0, NULL),
(1318, '2024-03-03 11:02:00', '2024-03-03 19:19:13', 1, 171, 2, 0, 'Testing 123', 8, 5, 171, NULL, NULL, NULL, '2024-03-03 19:19:28', NULL, NULL, NULL, 0, NULL),
(1319, '2024-03-03 19:00:00', NULL, 1, 175, 1, 0, 'Testing 123', 9, 5, 175, NULL, NULL, NULL, '2024-03-03 19:27:10', NULL, NULL, NULL, 0, NULL),
(1320, '2024-03-02 23:03:00', '2024-03-03 19:32:00', 1, 178, 2, 0, 'Testing 123', 8, 4, 178, NULL, NULL, NULL, '2024-03-03 19:50:58', NULL, NULL, NULL, 0, NULL),
(1321, '2024-03-02 04:55:00', '2024-03-02 14:55:00', 1, 134, 1, 0, 'Testing 123', 7, 18, 134, NULL, NULL, NULL, '2024-03-03 19:55:39', NULL, NULL, NULL, 0, NULL),
(1322, '2024-03-04 02:37:39', NULL, 1, 132, 1, 0, 'Testing 123', 7, 4, 132, NULL, NULL, NULL, '2024-03-04 02:37:45', NULL, NULL, NULL, 0, NULL),
(1323, '2024-03-04 03:12:00', NULL, 1, 124, 1, 0, 'Testing 123', 7, 6, 124, NULL, NULL, NULL, '2024-03-04 03:16:00', NULL, NULL, NULL, 0, NULL),
(1324, '2024-03-04 04:09:35', NULL, 1, 204, 1, 0, 'Testing 123', 7, 17, 204, NULL, NULL, NULL, '2024-03-04 04:10:51', NULL, NULL, NULL, 0, NULL),
(1325, '2024-03-04 04:23:00', NULL, 1, 136, 1, 0, 'Testing 123', 7, 18, 136, NULL, NULL, NULL, '2024-03-04 04:27:12', NULL, NULL, NULL, 0, NULL),
(1326, '2024-03-04 04:28:22', NULL, 1, 126, 1, 0, 'Testing 123', 7, 17, 126, NULL, NULL, NULL, '2024-03-04 04:28:30', NULL, NULL, NULL, 0, NULL),
(1327, '2024-03-04 04:46:07', NULL, 1, 127, 1, 0, 'Testing 123', 7, 17, 127, NULL, NULL, NULL, '2024-03-04 04:46:19', NULL, NULL, NULL, 0, NULL),
(1328, '2024-03-04 04:47:00', NULL, 1, 154, 1, 0, 'Testing 123', 7, 17, 154, NULL, NULL, NULL, '2024-03-04 04:49:06', NULL, NULL, NULL, 0, NULL),
(1329, '2024-03-04 04:40:00', NULL, 1, 134, 1, 0, 'Testing 123', 7, 18, 134, NULL, NULL, NULL, '2024-03-04 05:20:43', NULL, NULL, NULL, 0, NULL),
(1330, '2024-03-04 05:31:01', NULL, 1, 141, 1, 0, 'Testing 123', 7, 17, 141, NULL, NULL, NULL, '2024-03-04 05:31:17', NULL, NULL, NULL, 0, NULL),
(1331, '2024-03-04 03:06:00', NULL, 1, 131, 1, 0, 'Testing 123', 7, 1, 131, NULL, NULL, NULL, '2024-03-04 05:35:38', NULL, NULL, NULL, 0, NULL),
(1332, '2024-03-04 06:20:00', NULL, 1, 123, 1, 0, 'Testing 123', 7, 18, 123, NULL, NULL, NULL, '2024-03-04 06:47:32', NULL, NULL, NULL, 0, NULL),
(1333, '2024-03-02 11:27:42', '2024-03-02 19:40:42', 1, 137, 1, 0, 'Testing 123', 8, 1, 137, NULL, NULL, NULL, '2024-03-04 06:52:12', NULL, NULL, NULL, 0, NULL),
(1334, '2024-02-26 03:13:00', '2024-02-26 11:17:00', 1, 166, 1, 0, 'Testing 123', 7, 5, 166, NULL, NULL, NULL, '2024-03-04 07:18:38', NULL, NULL, NULL, 0, NULL),
(1335, '2024-02-27 03:19:00', '2024-02-27 12:25:00', 1, 166, 1, 0, 'Testing 123', 7, 5, 166, NULL, NULL, NULL, '2024-03-04 07:19:30', NULL, NULL, NULL, 0, NULL),
(1336, '2024-02-28 03:17:00', '2024-02-28 11:20:00', 1, 166, 1, 0, 'Testing 123', 7, 5, 166, NULL, NULL, NULL, '2024-03-04 07:20:17', NULL, NULL, NULL, 0, NULL),
(1337, '2024-02-29 02:30:00', '2024-02-29 12:12:00', 1, 166, 1, 0, 'Testing 123', 7, 5, 166, NULL, NULL, NULL, '2024-03-04 07:21:08', NULL, NULL, NULL, 0, NULL),
(1338, '2024-03-01 03:16:00', '2024-03-01 11:23:00', 1, 166, 1, 0, 'Testing 123', 7, 5, 166, NULL, NULL, NULL, '2024-03-04 07:23:30', NULL, NULL, NULL, 0, NULL),
(1339, '2024-03-03 04:10:58', '2024-03-03 12:00:58', 1, 179, 1, 0, 'Testing 123', 7, 4, 179, NULL, NULL, NULL, '2024-03-04 07:58:24', NULL, NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `flags` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`id`, `user_id`, `flags`) VALUES
(1, 114, 0),
(2, 202, 1),
(3, 203, 1),
(4, 204, 1),
(5, 205, 0);

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
(217, 198, 8, 1),
(218, 204, 17, 1),
(219, 204, 7, 1);

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
(217, 201, 2, 1),
(218, 202, 7, 1),
(219, 202, 2, 1),
(220, 203, 7, 1),
(221, 203, 2, 1),
(222, 204, 7, 1),
(223, 204, 2, 1),
(224, 205, 7, 1),
(225, 205, 2, 1);

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
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id_index` (`user_id`);

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
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

--
-- AUTO_INCREMENT for table `user_activity`
--
ALTER TABLE `user_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `user_attendances`
--
ALTER TABLE `user_attendances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1340;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_lookups`
--
ALTER TABLE `user_lookups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220;

--
-- AUTO_INCREMENT for table `user_permissions`
--
ALTER TABLE `user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;

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
-- Constraints for table `user_details`
--
ALTER TABLE `user_details`
  ADD CONSTRAINT `user_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

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
