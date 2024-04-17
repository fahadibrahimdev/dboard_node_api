-- MySQL dump 10.13  Distrib 5.7.21, for macos10.13 (x86_64)
--
-- Host: 23.106.120.176    Database: thundertechsol_dboard_qa
-- ------------------------------------------------------
-- Server version	5.5.5-10.5.22-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attendance_status`
--

DROP TABLE IF EXISTS `attendance_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` varchar(100) NOT NULL,
  `is_active` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `att_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_status`
--

LOCK TABLES `attendance_status` WRITE;
/*!40000 ALTER TABLE `attendance_status` DISABLE KEYS */;
INSERT INTO `attendance_status` VALUES (1,'Pending','PENDING',1),(2,'Approved','APPROVED',1),(3,'Denied','DENIED',1);
/*!40000 ALTER TABLE `attendance_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lookup_types`
--

DROP TABLE IF EXISTS `lookup_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lookup_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lookup_type_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lookup_types`
--

LOCK TABLES `lookup_types` WRITE;
/*!40000 ALTER TABLE `lookup_types` DISABLE KEYS */;
INSERT INTO `lookup_types` VALUES (1,'GAME',1),(2,'TEAM',1),(3,'SETTINGS',1),(4,'TRANSACTION_TYPES',1),(5,'SHIFTS',1),(6,'PAGES',1);
/*!40000 ALTER TABLE `lookup_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lookups`
--

DROP TABLE IF EXISTS `lookups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lookups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` varchar(100) NOT NULL,
  `type` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `lookup_detail_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `lookup_types_constraints` (`type`),
  CONSTRAINT `lookup_types_constraints` FOREIGN KEY (`type`) REFERENCES `lookup_types` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lookups`
--

LOCK TABLES `lookups` WRITE;
/*!40000 ALTER TABLE `lookups` DISABLE KEYS */;
INSERT INTO `lookups` VALUES (1,'Bunny','BUNNY',2,1,0),(4,'Aladdin','ALADDIN',2,1,0),(5,'Leo','LEO',2,1,0),(6,'Simba','SIMBA',2,1,0),(7,'Morning','MORNING',5,1,0),(8,'Evening','EVENING',5,1,0),(9,'Night','NIGHT',5,1,0),(10,'Milky Way','MILKY_WAY',1,1,0),(11,'Orian Star','ORIAN STAR',1,1,0),(12,'Free Play','FREE_PLAY',4,1,0),(13,'Deposit','DEPOSIT',4,1,0),(17,'CCTV','CHAMPION_TRADERS',2,1,0),(18,'HVAC','HVAC',2,1,0),(19,'Sonic','SONIC',2,1,0);
/*!40000 ALTER TABLE `lookups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `news` varchar(9999) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'Hello Everyone,\r\nWe are just getting started!\r\nKindly use the attendance module & share your feedback at the following email address.\r\n\r\nFeedback Email: devdock29@gmail.com',1);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`thundertechsol`@`localhost`*/ /*!50003 TRIGGER `news_insert_trigger` AFTER INSERT ON `news` FOR EACH ROW BEGIN
    UPDATE user_details
    SET flags = 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(45) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `is_active` varchar(65) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'Reports','REPORTS','1'),(2,'Attendance','ATTENDANCE','1'),(3,'Finances','FINANCES','1'),(4,'Privacy','PRIVACY','1'),(5,'Settings','SETTINGS','1'),(6,'Team Attendance','TEAM_ATTENDANCE','1'),(7,'News','NEWS','1');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remarks`
--

DROP TABLE IF EXISTS `remarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remarks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(1000) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `attendance_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `attendence_id` (`attendance_id`),
  CONSTRAINT `user_attendance_constraint` FOREIGN KEY (`attendance_id`) REFERENCES `user_attendances` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `userid_constraint` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remarks`
--

LOCK TABLES `remarks` WRITE;
/*!40000 ALTER TABLE `remarks` DISABLE KEYS */;
INSERT INTO `remarks` VALUES (1,'Hello Asad',3,'2024-04-16 11:51:50',2),(2,'Hi fahad',2,'2024-04-16 11:52:06',2),(3,'Hello 3 from Asad',3,'2024-04-16 11:55:02',2),(4,'1',2,'2024-04-16 12:08:06',2),(5,'Hello 3 from Asad',2,'2024-04-16 12:08:29',2),(6,'Hallo',2,'2024-04-16 12:17:25',2),(7,'Igwwzige1w zigw1 ,hi1w ,ihs ,iqs ,iha,viha ,ihqs ,ihqsq ,ihsq ,ihs ,iiha ,ihqs, ihqs ,ohqs ,8ysqv,iisq ihsq ,iha sq,iihqs ,iyqvs,iyvqs,iyvqsi,hvqsqd iyve1x9y1evx9y1evx9yqev 9ywve1x9ue1b 9u1eb 9ue1b 9u1ev1x9y1ebx9y1vex9y1he 9y1bex9yve1x',2,'2024-04-16 12:18:40',2),(8,'Hello asad butt',3,'2024-04-16 12:18:47',2),(9,'Test f1',3,'2024-04-16 12:19:06',2),(10,'Cjxjxjxjxj',2,'2024-04-16 12:19:12',2),(11,'Hallo',2,'2024-04-16 12:24:54',2),(12,'Hello 3 from asad',2,'2024-04-16 12:48:53',2),(13,'Hallo for testinh',2,'2024-04-16 12:49:40',2),(14,'H2',3,'2024-04-16 12:50:07',2),(15,'Hallo',2,'2024-04-16 12:54:39',2),(16,'Hello',3,'2024-04-16 12:54:45',2),(17,'Hello 3 from asad',2,'2024-04-16 12:55:21',2),(18,'6t6fyg7',2,'2024-04-16 13:48:18',2),(19,'3 geyb3theyn3y',2,'2024-04-16 13:48:33',2),(20,'G',4,'2024-04-16 14:01:34',3),(21,'Gg2',4,'2024-04-16 14:02:19',3),(22,'H1',3,'2024-04-16 14:02:38',2),(23,'G',4,'2024-04-16 14:03:14',2),(24,'Hello ahmad',3,'2024-04-16 14:03:29',2),(25,'G',4,'2024-04-16 14:04:05',2),(26,'F1',3,'2024-04-16 14:04:26',2),(27,'Hallo',2,'2024-04-16 14:04:37',2),(28,'T1',3,'2024-04-16 14:43:12',2),(29,'H3',3,'2024-04-16 15:02:56',2),(30,'Hello',3,'2024-04-16 15:04:45',2),(31,'Hallo',2,'2024-04-16 15:04:56',2);
/*!40000 ALTER TABLE `remarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` varchar(100) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Agent','AGENT',1),(2,'Leader','LEADER',1),(3,'Super User','SUPER_USER',1);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_info`
--

DROP TABLE IF EXISTS `social_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `social_platform` varchar(50) NOT NULL,
  `social_id` varchar(100) NOT NULL,
  `social_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `player_linking` (`user_id`),
  CONSTRAINT `player_linking` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_info`
--

LOCK TABLES `social_info` WRITE;
/*!40000 ALTER TABLE `social_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `denied_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_constraint` (`user_id`),
  KEY `lead_constraint` (`lead_user_id`),
  KEY `created_constraint` (`created_by`),
  KEY `deleted_constraint` (`deleted_by`),
  KEY `modify_constraint` (`modify_by`),
  KEY `game_constraint` (`game`),
  KEY `shift_constraint` (`shift_id`),
  KEY `team_constraint` (`team_id`),
  KEY `type_constraint` (`type`),
  KEY `deneid_constraint` (`denied_by`),
  KEY `aprroved_constraint` (`approved_by`) USING BTREE,
  CONSTRAINT `aprroved_constraint` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `created_constraint` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `deleted_constraint` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `deneid_constraint` FOREIGN KEY (`denied_by`) REFERENCES `users` (`id`),
  CONSTRAINT `game_constraint` FOREIGN KEY (`game`) REFERENCES `lookups` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `lead_constraint` FOREIGN KEY (`lead_user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `modify_constraint` FOREIGN KEY (`modify_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `shift_constraint` FOREIGN KEY (`shift_id`) REFERENCES `lookups` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `team_constraint` FOREIGN KEY (`team_id`) REFERENCES `lookups` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `type_constraint` FOREIGN KEY (`type`) REFERENCES `lookups` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `user_constraint` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
