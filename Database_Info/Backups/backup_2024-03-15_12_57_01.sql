-- MySQL dump 10.13  Distrib 5.7.21, for macos10.13 (x86_64)
--
-- Host: 23.106.120.176    Database: thundertechsol_mab_uat
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
-- Table structure for table `finance`
--

DROP TABLE IF EXISTS `finance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_name` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `description` text DEFAULT NULL,
  `fb_url` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `game` (`game_id`),
  CONSTRAINT `finance_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `game` FOREIGN KEY (`game_id`) REFERENCES `lookups` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finance`
--

LOCK TABLES `finance` WRITE;
/*!40000 ALTER TABLE `finance` DISABLE KEYS */;
INSERT INTO `finance` VALUES (1,'devdock',2.90,'2024-03-04 09:14:35','testing for finance module','https://s594.sgp8.mysecurecloudhost.com:2083/cpsess3570883596/3rdparty/phpMyAdmin/index.php?route=/table/change&db=thundertechsol_mab_uat&table=finance',1,10);
/*!40000 ALTER TABLE `finance` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`thundertechsol`@`localhost`*/ /*!50003 TRIGGER before_insert_finance
BEFORE INSERT ON `finance`
FOR EACH ROW
BEGIN
    IF NEW.game_id IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'game_id not provided';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
  UNIQUE KEY `lookup_code` (`code`),
  KEY `lookup_types_constraints` (`type`),
  CONSTRAINT `lookup_types_constraints` FOREIGN KEY (`type`) REFERENCES `lookup_types` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lookups`
--

LOCK TABLES `lookups` WRITE;
/*!40000 ALTER TABLE `lookups` DISABLE KEYS */;
INSERT INTO `lookups` VALUES (1,'Bunny','BUNNY',2,1,0),(4,'Aladdin','ALADDIN',2,1,0),(5,'Leo','LEO',2,1,0),(6,'Simba','SIMBA',2,1,0),(7,'Morning','MORNING',5,1,0),(8,'Evening','EVENING',5,1,0),(9,'Night','NIGHT',5,1,0),(10,'Milky Way','MILKY_WAY',1,1,0),(11,'Orian Star','ORIAN STAR',1,1,0),(12,'Free Play','FREE_PLAY',4,1,0),(13,'Deposit','DEPOSIT',4,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'Hello From DEV DOCK! We are just starting soon!',1),(5,'We are a Sub Company of MAB Solutions',0),(7,'All Agents should provide actual Start & End DateTime while using Attendance Module. If anyone caught providing wrong information, panelty will be applied :)',1),(9,'your Attendance is ready',1),(10,'This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is dummy Long news for testing. This is d',1),(11,'hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151hallo testing 151',1),(20,'this news is testing trigger in user_datials table',1),(23,'Testing to users dump data',1),(24,'testing for web for update',1),(25,'testing for web 2',1);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`thundertechsol`@`localhost`*/ /*!50003 TRIGGER news_insert_trigger
AFTER INSERT ON news
FOR EACH ROW
BEGIN
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'Reports','REPORTS','1'),(2,'Attendance','ATTENDANCE','1'),(3,'Finances','FINANCES','1'),(4,'Privacy','PRIVACY','1'),(5,'Settings','SETTINGS','1'),(6,'Team Attendance','TEAM_ATTENDANCE','1'),(7,'News','NEWS','1'),(8,'New Player','NEW_PLAYER','1');
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
  CONSTRAINT `attendence_id` FOREIGN KEY (`attendance_id`) REFERENCES `user_attendances` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remarks`
--

LOCK TABLES `remarks` WRITE;
/*!40000 ALTER TABLE `remarks` DISABLE KEYS */;
INSERT INTO `remarks` VALUES (2,'hallo test2 ',91,'2023-11-07 15:15:31',7),(3,'hallo test3',91,'2023-11-07 14:31:36',34),(4,'hallo test 3',86,'2023-11-10 16:40:34',7),(5,'hallo test 3',86,'2023-11-13 11:22:58',3),(6,'hallo test4',86,'2023-11-10 16:41:19',7),(7,'hallo test 3',86,'2023-11-10 16:40:34',7),(8,'Halo for test 565',96,'2023-11-23 22:05:48',96),(9,'\"I was captivated by the eloquence of this piece; each word carefully chosen, weaving a tapestry of emotions. The author\'s ability to evoke such vivid imagery is commendable, creating a sensory experience for the reader. The narrative unfolds with a grace',89,'2023-11-21 15:26:38',141),(10,'\"I was captivated by the eloquence of this piece; each word carefully chosen, weaving a tapestry of emotions. The author\'s ability to evoke such vivid imagery is commendable, creating a sensory experience for the reader. The narrative unfolds with a grace',113,'2023-11-13 15:26:38',18),(11,'\"I was captivated by the eloquence of this piece; each word carefully chosen, weaving a tapestry of emotions. The author\'s ability to evoke such vivid imagery is commendable, creating a sensory experience for the reader. The narrative unfolds with a grace',89,'2023-11-21 15:26:38',141),(12,'\"I was captivated by the eloquence of this piece; each word carefully chosen, weaving a tapestry of emotions. The author\'s ability to evoke such vivid imagery is commendable, creating a sensory experience for the reader. The narrative unfolds with a grace',113,'2023-11-13 15:26:38',18),(13,'\"I was captivated by the eloquence of this piece; each word carefully chosen, weaving a tapestry of emotions. The author\'s ability to evoke such vivid imagery is commendable, creating a sensory experience for the reader. The narrative unfolds with a graceful rhythm, drawing me into its embrace. Themes of resilience and hope resonate, leaving a lingering impact on my thoughts. The depth of insight displayed reflects a profound understanding of the human experience. This work is a testament to the power of language, a symphony of words that resonates long after the last sentence. Bravo to the writer for crafting a masterpiece that transcends the ordinary and immerses the reader in a world of profound beauty.\"',114,'2023-11-13 15:30:33',141),(14,'\"I was captivated by the eloquence of this piece; each word carefully chosen, weaving a tapestry of emotions. The author\'s ability to evoke such vivid imagery is commendable, creating a sensory experience for the reader. The narrative unfolds with a graceful rhythm, drawing me into its embrace. Themes of resilience and hope resonate, leaving a lingering impact on my thoughts. The depth of insight displayed reflects a profound understanding of the human experience. This work is a testament to the power of language, a symphony of words that resonates long after the last sentence. Bravo to the writer for crafting a masterpiece that transcends the ordinary and immerses the reader in a world of profound beauty.\"',89,'2023-11-21 15:26:38',141),(15,'\"I was captivated by the eloquence of this piece; each word carefully chosen, weaving a tapestry of emotions. The author\'s ability to evoke such vivid imagery is commendable, creating a sensory experience for the reader. The narrative unfolds with a graceful rhythm, drawing me into its embrace. Themes of resilience and hope resonate, leaving a lingering impact on my thoughts. The depth of insight displayed reflects a profound understanding of the human experience. This work is a testament to the power of language, a symphony of words that resonates long after the last sentence. Bravo to the writer for crafting a masterpiece that transcends the ordinary and immerses the reader in a world of profound beauty.\"',113,'2023-11-13 15:26:38',18),(16,'attendanceDetailsattendanceDetailsattendanceDetailsattendanceDetailsattendanceDetailsattendanceDetailsattendanceDetailsattendanceDetailsattendanceDetailsattendanceDetailsattendanceDetailsattendanceDetailsattendanceDetailsattendanceDetailsattendanceDetailsattendanceDetailsattendanceDetailsattendanceDetailsattendanceDetailsattendanceDetailsattendanceDetailsattendanceDetailsattendanceDetailsattendanceDetailsattendanceDetailsattendanceDetailsattendanceDetailsattendanceDetailsattendanceDetailsattendanceDetailsattendanceDetailsattendanceDetailsattendanceDetailsattendanceDetails',95,'2023-11-13 16:19:08',47),(17,'\"I was captivated by the eloquence of this piece; each word carefully chosen, weaving a tapestry of emotions. The author\'s ability to evoke such vivid imagery is commendable, creating a sensory experience for the reader. The narrative unfolds with a graceful rhythm, drawing me into its embrace. Themes of resilience and hope resonate, leaving a lingering impact on my thoughts. The depth of insight displayed reflects a profound understanding of the human experience. This work is a testament to the power of language, a symphony of words that resonates long after the last sentence. Bravo to the writer for crafting a masterpiece that transcends the ordinary and immerses the reader in a world of profound beauty.\"',89,'2023-11-21 15:26:38',141),(18,'\"I was captivated by the eloquence of this piece; each word carefully chosen, weaving a tapestry of emotions. The author\'s ability to evoke such vivid imagery is commendable, creating a sensory experience for the reader. The narrative unfolds with a graceful rhythm, drawing me into its embrace. Themes of resilience and hope resonate, leaving a lingering impact on my thoughts. The depth of insight displayed reflects a profound understanding of the human experience. This work is a testament to the power of language, a symphony of words that resonates long after the last sentence. Bravo to the writer for crafting a masterpiece that transcends the ordinary and immerses the reader in a world of profound beauty.\"',113,'2023-11-13 15:26:38',18),(19,'hallo esting',121,'2024-03-11 14:13:43',1),(26,'hallo for testing remarks',76,'2024-03-11 14:37:34',121),(31,'hallo 123',1,'2024-03-11 14:43:11',1),(32,'hallo for testing remarks',76,'2024-03-11 14:43:40',1),(34,'hallo for testing remarks11',76,'2024-03-11 15:31:46',6),(37,'hallo for testing remarks11',76,'2024-03-12 06:32:46',1);
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
  KEY `aprroved_constraint` (`approved_by`),
  KEY `deneid_constraint` (`denied_by`),
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,83,1,7,84,13,10,11,84,NULL,NULL,NULL,'2023-10-11 14:16:03','2023-10-09 08:39:23',NULL,NULL,'strip','11','f2','nothing',1,NULL,NULL),(2,83,1,8,83,NULL,6,100,NULL,1,1,NULL,'2023-10-24 09:06:12',NULL,'0000-00-00 00:00:00',NULL,NULL,NULL,NULL,NULL,0,1,'2023-10-24 09:06:13'),(3,84,1,8,1,13,11,12,1,1,84,84,'2023-10-19 15:04:51','2023-10-10 15:04:51','2023-10-12 15:04:51','2023-10-20 15:04:51','paypak','nothing','nothing','nothing',1,76,'2023-10-18 20:57:04'),(4,83,1,8,1,12,5,12,1,1,1,85,'2023-10-16 13:41:52','2023-10-11 15:04:51','2023-10-11 15:04:51','2023-10-11 15:04:51','jazzcash','nothing','nothing','nothing',1,1,'2023-10-11 15:04:51'),(5,76,1,8,83,12,11,11,1,76,83,85,'2023-10-11 14:16:14','2023-10-11 16:19:45',NULL,'2023-10-11 16:19:45','paypak','NOTHING','NOTHING','NOTHING',1,1,'2023-10-11 16:19:45'),(6,85,1,7,83,13,11,1,85,85,83,84,'2023-10-11 14:16:18','2023-10-23 16:19:45','2023-10-10 16:19:45','2023-10-13 16:19:45','easypasa','NOt','NOt','NOt',1,85,'2023-10-31 16:19:45'),(7,83,4,9,1,12,10,100,1,NULL,NULL,NULL,'2023-10-16 18:43:20',NULL,NULL,NULL,'Postman','asdfasdf','asdf','asdf',1,NULL,NULL),(8,84,1,1,89,13,5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,1,4,7,1,12,11,5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL),(13,1,4,7,1,12,11,5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL),(14,89,4,8,89,13,10,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nothing','nothing','nothing','nohting',1,NULL,NULL),(15,1,4,7,1,12,11,5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/F2/',NULL,NULL,1,NULL,NULL),(16,1,4,7,1,12,11,5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL),(17,1,4,7,1,12,11,5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL),(18,1,4,7,1,12,11,5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/F3/',NULL,1,NULL,NULL),(19,1,4,7,1,12,11,5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'F3','F1',1,NULL,NULL),(20,1,4,7,1,12,11,5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'F3','F1',1,NULL,NULL),(21,1,4,7,1,12,11,5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'F2','F3','F1',1,NULL,NULL),(22,1,4,7,1,12,11,5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'CashApp','F2','F3','F1',1,NULL,NULL),(23,1,4,7,1,12,11,5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'CashApp','F2','F3','F1',1,NULL,NULL),(24,1,4,7,1,12,11,5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'CashApp','F2','F3','F1',1,NULL,NULL),(25,1,4,7,1,12,11,5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'CashApp','F2','F3','F1',1,NULL,NULL);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_activity`
--

DROP TABLE IF EXISTS `user_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `last_login_time` datetime NOT NULL,
  `last_logout_time` datetime DEFAULT NULL,
  `last_login_platform` varchar(225) NOT NULL,
  `last_logout_platform` varchar(225) NOT NULL,
  `device_token` varchar(1000) DEFAULT NULL,
  `device_info` varchar(1000) DEFAULT NULL,
  `is_session_completed` tinyint(4) NOT NULL,
  `id_deleted` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_activity` (`user_id`),
  CONSTRAINT `user_activity` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=515 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_activity`
--

LOCK TABLES `user_activity` WRITE;
/*!40000 ALTER TABLE `user_activity` DISABLE KEYS */;
INSERT INTO `user_activity` VALUES (105,1,'2023-11-23 12:38:57','2023-11-23 12:39:11','android','FORCE','androiToken','asdjkfbajksdfbjasbdfasdf',1,0),(106,1,'2023-11-23 12:39:11','2023-11-23 12:39:42','android','FORCE','androiToken','asdjkfbajksdfbjasbdfasdf',1,0),(107,1,'2023-11-23 12:39:42','2023-11-23 12:40:09','android','android','androiToken','asdjkfbajksdfbjasbdfasdf',1,0),(108,1,'2023-11-23 12:41:44','2023-11-23 12:42:02','android','android','AsadToken','asdjkfbajksdfbjasbdfasdf',1,0),(109,76,'2023-12-02 09:13:52','2023-12-05 10:05:26','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(110,1,'2023-12-02 09:14:19','2023-12-04 10:26:30','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(111,1,'2023-12-04 10:26:30','2023-12-04 13:49:05','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(112,1,'2023-12-04 13:49:05','2023-12-28 09:23:50','android','android','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(113,76,'2023-12-05 10:05:26','2023-12-05 15:05:15','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(114,76,'2023-12-05 15:05:15','2023-12-05 15:08:09','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(115,76,'2023-12-05 15:08:09','2023-12-20 17:43:30','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(116,76,'2023-12-20 17:18:46','2023-12-20 17:36:15','web','FORCE','12345','Edge Browser',1,0),(117,76,'2023-12-20 17:36:15','2023-12-20 17:39:02','web','FORCE','12345','Edge Browser',1,0),(118,76,'2023-12-20 17:39:02','2023-12-20 17:39:23','web','FORCE','12345','Edge Browser',1,0),(119,76,'2023-12-20 17:39:23','2023-12-20 17:41:29','web','FORCE','12345','Edge Browser',1,0),(120,76,'2023-12-20 17:41:29','2023-12-20 17:41:40','web','FORCE','12345','Edge Browser',1,0),(121,76,'2023-12-20 17:41:40','2023-12-20 17:42:10','web','FORCE','12345','Edge Browser',1,0),(122,76,'2023-12-20 17:42:10','2023-12-20 17:42:47','web','FORCE','12345','Edge Browser',1,0),(123,76,'2023-12-20 17:42:47','2023-12-20 17:42:56','web','FORCE','12345','Edge Browser',1,0),(124,76,'2023-12-20 17:42:56','2023-12-20 17:43:58','web','FORCE','12345','Edge Browser',1,0),(125,76,'2023-12-20 17:43:30','2023-12-22 15:30:29','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(126,76,'2023-12-20 17:43:58','2023-12-20 17:55:22','web','FORCE','12345','Edge Browser',1,0),(127,76,'2023-12-20 17:55:22','2023-12-20 17:55:26','web','FORCE','12345','Edge Browser',1,0),(128,76,'2023-12-20 17:55:26','2023-12-20 17:55:27','web','FORCE','12345','Edge Browser',1,0),(129,76,'2023-12-20 17:55:27','2023-12-20 17:56:05','web','FORCE','12345','Edge Browser',1,0),(130,76,'2023-12-20 17:56:05','2023-12-20 17:56:49','web','FORCE','12345','Edge Browser',1,0),(131,76,'2023-12-20 17:56:49','2023-12-20 17:56:54','web','FORCE','12345','Edge Browser',1,0),(132,76,'2023-12-20 17:56:54','2023-12-20 18:00:55','web','FORCE','12345','Edge Browser',1,0),(133,76,'2023-12-20 18:00:55','2023-12-20 18:11:27','web','FORCE','12345','Edge Browser',1,0),(134,76,'2023-12-20 18:11:27','2023-12-20 18:11:54','web','FORCE','12345','Edge Browser',1,0),(135,76,'2023-12-20 18:11:54','2023-12-20 18:30:12','web','FORCE','12345','Edge Browser',1,0),(136,76,'2023-12-20 18:30:12','2023-12-20 18:30:44','web','FORCE','12345','Edge Browser',1,0),(137,76,'2023-12-20 18:30:44','2023-12-20 18:30:56','web','FORCE','12345','Edge Browser',1,0),(138,76,'2023-12-20 18:30:56','2023-12-20 18:31:20','web','FORCE','12345','Edge Browser',1,0),(139,76,'2023-12-20 18:31:20','2023-12-20 18:50:06','web','FORCE','12345','Edge Browser',1,0),(140,76,'2023-12-20 18:50:06','2023-12-21 14:03:21','web','FORCE','12345','Edge Browser',1,0),(141,76,'2023-12-21 14:03:21','2023-12-21 14:43:22','web','FORCE','12345','Edge Browser',1,0),(142,76,'2023-12-21 14:43:22','2023-12-21 14:58:30','web','FORCE','12345','Edge Browser',1,0),(143,76,'2023-12-21 14:58:30','2023-12-21 14:58:50','web','FORCE','12345','Edge Browser',1,0),(144,76,'2023-12-21 14:58:50','2023-12-21 14:59:52','web','FORCE','12345','Edge Browser',1,0),(145,76,'2023-12-21 14:59:52','2023-12-21 15:02:25','web','FORCE','12345','Edge Browser',1,0),(146,76,'2023-12-21 15:02:25','2023-12-21 15:13:33','web','FORCE','12345','Edge Browser',1,0),(147,76,'2023-12-21 15:13:33','2023-12-21 18:22:08','web','FORCE','12345','Edge Browser',1,0),(148,76,'2023-12-21 18:22:08','2023-12-22 14:05:34','web','FORCE','12345','Edge Browser',1,0),(149,76,'2023-12-22 14:05:34','2023-12-22 14:12:36','web','FORCE','12345','Edge Browser',1,0),(150,76,'2023-12-22 14:12:36','2023-12-22 14:20:04','web','FORCE','12345','Edge Browser',1,0),(151,76,'2023-12-22 14:20:04','2023-12-22 14:38:48','web','FORCE','12345','Edge Browser',1,0),(152,76,'2023-12-22 14:38:48','2023-12-22 15:16:45','web','FORCE','12345','Edge Browser',1,0),(153,76,'2023-12-22 15:16:45','2023-12-22 15:18:04','web','FORCE','12345','Edge Browser',1,0),(154,76,'2023-12-22 15:18:04','2023-12-22 15:21:46','web','FORCE','12345','Edge Browser',1,0),(155,76,'2023-12-22 15:21:46','2023-12-22 15:27:06','web','FORCE','12345','Edge Browser',1,0),(156,76,'2023-12-22 15:27:06','2023-12-22 15:27:36','web','FORCE','12345','Edge Browser',1,0),(157,76,'2023-12-22 15:27:36','2023-12-22 20:09:15','web','FORCE','12345','Edge Browser',1,0),(158,76,'2023-12-22 15:30:29','2023-12-28 08:57:14','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(159,76,'2023-12-22 20:09:15','2023-12-25 15:46:39','web','FORCE','12345','Edge Browser',1,0),(160,76,'2023-12-25 15:46:39','2023-12-25 15:47:26','web','FORCE','12345','Edge Browser',1,0),(161,76,'2023-12-25 15:47:26','2024-03-11 11:46:26','web','FORCE','12345','Edge Browser',1,0),(162,1,'2023-12-26 10:31:25','2023-12-26 10:33:11','web','FORCE','12345','Edge Browser',1,0),(163,1,'2023-12-26 10:33:11','2023-12-27 11:56:06','web','FORCE','12345','Edge Browser',1,0),(164,125,'2023-12-26 14:05:04',NULL,'web','','12345','Edge Browser',0,0),(165,126,'2023-12-26 15:22:31','2023-12-26 15:23:55','web','FORCE','12345','Edge Browser',1,0),(166,126,'2023-12-26 15:23:55','2023-12-26 15:29:33','web','FORCE','12345','Edge Browser',1,0),(167,126,'2023-12-26 15:29:33','2023-12-26 15:35:14','web','FORCE','12345','Edge Browser',1,0),(168,126,'2023-12-26 15:35:14','2023-12-26 16:08:51','web','FORCE','12345','Edge Browser',1,0),(169,126,'2023-12-26 16:08:51','2023-12-26 16:18:22','web','FORCE','12345','Edge Browser',1,0),(170,126,'2023-12-26 16:18:22','2023-12-26 16:44:05','web','FORCE','12345','Edge Browser',1,0),(171,126,'2023-12-26 16:44:05','2023-12-27 23:10:03','web','FORCE','12345','Edge Browser',1,0),(172,1,'2023-12-27 11:56:06','2023-12-27 16:22:00','web','FORCE','12345','Edge Browser',1,0),(173,1,'2023-12-27 16:22:00','2023-12-27 16:35:53','web','FORCE','12345','Edge Browser',1,0),(174,1,'2023-12-27 16:35:53','2023-12-28 05:48:39','web','FORCE','12345','Edge Browser',1,0),(175,126,'2023-12-27 23:10:03',NULL,'web','','12345','Edge Browser',0,0),(176,1,'2023-12-28 05:48:39','2023-12-28 09:23:06','web','FORCE','12345','Edge Browser',1,0),(177,76,'2023-12-28 08:57:14','2024-02-06 12:36:18','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(178,1,'2023-12-28 09:23:06','2023-12-28 15:37:58','web','FORCE','12345','Edge Browser',1,0),(179,1,'2023-12-28 10:43:55','2023-12-28 10:47:04','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(180,1,'2023-12-28 10:47:04','2023-12-28 10:51:44','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(181,1,'2023-12-28 10:51:44','2023-12-28 10:57:37','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(182,1,'2023-12-28 10:57:37','2023-12-29 14:56:10','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(183,128,'2023-12-28 11:33:07','2023-12-28 11:34:51','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(184,128,'2023-12-28 11:34:51',NULL,'android','','ghfffgh','asdjkfbajksdfbjasbdfasdf',0,0),(185,1,'2023-12-28 15:37:58','2023-12-28 15:38:34','web','FORCE','12345','Edge Browser',1,0),(186,1,'2023-12-28 15:38:34','2023-12-29 14:40:47','web','FORCE','12345','Edge Browser',1,0),(187,1,'2023-12-29 14:40:47','2023-12-29 14:41:28','web','FORCE','12345','Edge Browser',1,0),(188,1,'2023-12-29 14:41:28','2023-12-29 14:45:34','web','FORCE','12345','Edge Browser',1,0),(189,1,'2023-12-29 14:45:34','2023-12-29 14:46:13','web','FORCE','12345','Edge Browser',1,0),(190,1,'2023-12-29 14:46:13','2024-01-01 11:09:58','web','FORCE','12345','Edge Browser',1,0),(191,1,'2023-12-29 14:56:10','2024-01-30 12:38:15','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(192,1,'2024-01-01 11:09:58','2024-01-01 13:35:44','web','FORCE','12345','Edge Browser',1,0),(193,1,'2024-01-01 13:35:44','2024-01-01 13:59:29','web','FORCE','12345','Edge Browser',1,0),(194,1,'2024-01-01 13:59:29','2024-01-01 16:53:02','web','FORCE','12345','Edge Browser',1,0),(195,1,'2024-01-01 16:53:02','2024-01-01 16:53:08','web','FORCE','12345','Edge Browser',1,0),(196,1,'2024-01-01 16:53:08','2024-01-01 16:53:31','web','FORCE','12345','Edge Browser',1,0),(197,1,'2024-01-01 16:53:31','2024-01-01 16:54:45','web','FORCE','12345','Edge Browser',1,0),(198,1,'2024-01-01 16:54:45','2024-01-01 16:58:38','web','FORCE','12345','Edge Browser',1,0),(199,1,'2024-01-01 16:58:38','2024-01-01 17:08:04','web','FORCE','12345','Edge Browser',1,0),(200,1,'2024-01-01 17:08:04','2024-01-01 17:11:05','web','FORCE','12345','Edge Browser',1,0),(201,1,'2024-01-01 17:11:05','2024-01-01 17:11:39','web','FORCE','12345','Edge Browser',1,0),(202,1,'2024-01-01 17:11:39','2024-01-01 17:16:06','web','FORCE','12345','Edge Browser',1,0),(203,1,'2024-01-01 17:16:06','2024-01-01 17:17:27','web','FORCE','12345','Edge Browser',1,0),(204,1,'2024-01-01 17:17:27','2024-01-01 17:18:17','web','FORCE','12345','Edge Browser',1,0),(205,1,'2024-01-01 17:18:17','2024-01-01 17:18:33','web','FORCE','12345','Edge Browser',1,0),(206,1,'2024-01-01 17:18:33','2024-01-01 17:21:48','web','FORCE','12345','Edge Browser',1,0),(207,1,'2024-01-01 17:21:48','2024-01-02 07:13:53','web','FORCE','12345','Edge Browser',1,0),(208,1,'2024-01-02 07:13:53','2024-01-02 07:18:09','web','FORCE','12345','Edge Browser',1,0),(209,1,'2024-01-02 07:18:09','2024-01-02 08:06:21','web','FORCE','12345','Edge Browser',1,0),(210,1,'2024-01-02 08:06:21','2024-01-02 08:08:29','web','FORCE','12345','Edge Browser',1,0),(211,1,'2024-01-02 08:08:29','2024-01-02 08:08:55','web','FORCE','12345','Edge Browser',1,0),(212,1,'2024-01-02 08:08:55','2024-01-02 08:09:34','web','FORCE','12345','Edge Browser',1,0),(213,1,'2024-01-02 08:09:34','2024-01-02 08:19:41','web','FORCE','12345','Edge Browser',1,0),(214,1,'2024-01-02 08:19:41','2024-01-02 08:19:45','web','FORCE','12345','Edge Browser',1,0),(215,1,'2024-01-02 08:19:45','2024-01-02 08:19:46','web','FORCE','12345','Edge Browser',1,0),(216,1,'2024-01-02 08:19:46','2024-01-02 08:19:46','web','FORCE','12345','Edge Browser',1,0),(217,1,'2024-01-02 08:19:46','2024-01-02 08:19:46','web','FORCE','12345','Edge Browser',1,0),(218,1,'2024-01-02 08:19:46','2024-01-02 08:19:46','web','FORCE','12345','Edge Browser',1,0),(219,1,'2024-01-02 08:19:46','2024-01-02 08:19:46','web','FORCE','12345','Edge Browser',1,0),(220,1,'2024-01-02 08:19:46','2024-01-02 08:19:46','web','FORCE','12345','Edge Browser',1,0),(221,1,'2024-01-02 08:19:46','2024-01-02 08:19:47','web','FORCE','12345','Edge Browser',1,0),(222,1,'2024-01-02 08:19:47','2024-01-02 08:19:47','web','FORCE','12345','Edge Browser',1,0),(223,1,'2024-01-02 08:19:47','2024-01-02 08:19:47','web','FORCE','12345','Edge Browser',1,0),(224,1,'2024-01-02 08:19:47','2024-01-02 08:19:47','web','FORCE','12345','Edge Browser',1,0),(225,1,'2024-01-02 08:19:47','2024-01-02 08:19:47','web','FORCE','12345','Edge Browser',1,0),(226,1,'2024-01-02 08:19:47','2024-01-02 08:19:47','web','FORCE','12345','Edge Browser',1,0),(227,1,'2024-01-02 08:19:47','2024-01-02 08:19:48','web','FORCE','12345','Edge Browser',1,0),(228,1,'2024-01-02 08:19:48','2024-01-02 08:19:48','web','FORCE','12345','Edge Browser',1,0),(229,1,'2024-01-02 08:19:48','2024-01-02 08:19:48','web','FORCE','12345','Edge Browser',1,0),(230,1,'2024-01-02 08:19:48','2024-01-02 08:19:48','web','FORCE','12345','Edge Browser',1,0),(231,1,'2024-01-02 08:19:48','2024-01-02 08:19:48','web','FORCE','12345','Edge Browser',1,0),(232,1,'2024-01-02 08:19:48','2024-01-02 08:19:48','web','FORCE','12345','Edge Browser',1,0),(233,1,'2024-01-02 08:19:48','2024-01-02 08:19:49','web','FORCE','12345','Edge Browser',1,0),(234,1,'2024-01-02 08:19:49','2024-01-02 08:19:49','web','FORCE','12345','Edge Browser',1,0),(235,1,'2024-01-02 08:19:49','2024-01-02 08:19:49','web','FORCE','12345','Edge Browser',1,0),(236,1,'2024-01-02 08:19:49','2024-01-02 08:19:49','web','FORCE','12345','Edge Browser',1,0),(237,1,'2024-01-02 08:19:49','2024-01-02 08:19:49','web','FORCE','12345','Edge Browser',1,0),(238,1,'2024-01-02 08:19:49','2024-01-02 08:19:49','web','FORCE','12345','Edge Browser',1,0),(239,1,'2024-01-02 08:19:49','2024-01-02 08:19:50','web','FORCE','12345','Edge Browser',1,0),(240,1,'2024-01-02 08:19:50','2024-01-02 08:19:50','web','FORCE','12345','Edge Browser',1,0),(241,1,'2024-01-02 08:19:50','2024-01-02 08:19:50','web','FORCE','12345','Edge Browser',1,0),(242,1,'2024-01-02 08:19:50','2024-01-02 08:19:50','web','FORCE','12345','Edge Browser',1,0),(243,1,'2024-01-02 08:19:50','2024-01-02 08:19:50','web','FORCE','12345','Edge Browser',1,0),(244,1,'2024-01-02 08:19:50','2024-01-02 08:19:50','web','FORCE','12345','Edge Browser',1,0),(245,1,'2024-01-02 08:19:50','2024-01-02 08:19:51','web','FORCE','12345','Edge Browser',1,0),(246,1,'2024-01-02 08:19:51','2024-01-02 08:19:51','web','FORCE','12345','Edge Browser',1,0),(247,1,'2024-01-02 08:19:51','2024-01-02 08:19:51','web','FORCE','12345','Edge Browser',1,0),(248,1,'2024-01-02 08:19:51','2024-01-02 08:19:51','web','FORCE','12345','Edge Browser',1,0),(249,1,'2024-01-02 08:19:51','2024-01-02 08:19:51','web','FORCE','12345','Edge Browser',1,0),(250,1,'2024-01-02 08:19:51','2024-01-02 08:19:51','web','FORCE','12345','Edge Browser',1,0),(251,1,'2024-01-02 08:19:51','2024-01-02 08:19:52','web','FORCE','12345','Edge Browser',1,0),(252,1,'2024-01-02 08:19:52','2024-01-02 08:19:52','web','FORCE','12345','Edge Browser',1,0),(253,1,'2024-01-02 08:19:52','2024-01-02 08:19:52','web','FORCE','12345','Edge Browser',1,0),(254,1,'2024-01-02 08:19:52','2024-01-02 08:19:52','web','FORCE','12345','Edge Browser',1,0),(255,1,'2024-01-02 08:19:52','2024-01-02 08:19:52','web','FORCE','12345','Edge Browser',1,0),(256,1,'2024-01-02 08:19:52','2024-01-02 08:19:52','web','FORCE','12345','Edge Browser',1,0),(257,1,'2024-01-02 08:19:52','2024-01-02 08:19:52','web','FORCE','12345','Edge Browser',1,0),(258,1,'2024-01-02 08:19:52','2024-01-02 08:19:53','web','FORCE','12345','Edge Browser',1,0),(259,1,'2024-01-02 08:19:53','2024-01-02 08:19:53','web','FORCE','12345','Edge Browser',1,0),(260,1,'2024-01-02 08:19:53','2024-01-02 08:19:53','web','FORCE','12345','Edge Browser',1,0),(261,1,'2024-01-02 08:19:53','2024-01-02 08:19:53','web','FORCE','12345','Edge Browser',1,0),(262,1,'2024-01-02 08:19:53','2024-01-02 08:19:53','web','FORCE','12345','Edge Browser',1,0),(263,1,'2024-01-02 08:19:53','2024-01-02 08:19:53','web','FORCE','12345','Edge Browser',1,0),(264,1,'2024-01-02 08:19:53','2024-01-02 08:19:54','web','FORCE','12345','Edge Browser',1,0),(265,1,'2024-01-02 08:19:54','2024-01-02 08:19:54','web','FORCE','12345','Edge Browser',1,0),(266,1,'2024-01-02 08:19:54','2024-01-02 08:19:54','web','FORCE','12345','Edge Browser',1,0),(267,1,'2024-01-02 08:19:54','2024-01-02 08:19:54','web','FORCE','12345','Edge Browser',1,0),(268,1,'2024-01-02 08:19:54','2024-01-02 08:19:54','web','FORCE','12345','Edge Browser',1,0),(269,1,'2024-01-02 08:19:54','2024-01-02 08:19:54','web','FORCE','12345','Edge Browser',1,0),(270,1,'2024-01-02 08:19:54','2024-01-02 08:19:55','web','FORCE','12345','Edge Browser',1,0),(271,1,'2024-01-02 08:19:55','2024-01-02 08:19:55','web','FORCE','12345','Edge Browser',1,0),(272,1,'2024-01-02 08:19:55','2024-01-02 08:19:55','web','FORCE','12345','Edge Browser',1,0),(273,1,'2024-01-02 08:19:55','2024-01-02 08:19:55','web','FORCE','12345','Edge Browser',1,0),(274,1,'2024-01-02 08:19:55','2024-01-02 08:19:55','web','FORCE','12345','Edge Browser',1,0),(275,1,'2024-01-02 08:19:55','2024-01-02 08:19:56','web','FORCE','12345','Edge Browser',1,0),(276,1,'2024-01-02 08:19:56','2024-01-02 08:19:56','web','FORCE','12345','Edge Browser',1,0),(277,1,'2024-01-02 08:19:56','2024-01-02 08:19:56','web','FORCE','12345','Edge Browser',1,0),(278,1,'2024-01-02 08:19:56','2024-01-02 08:19:56','web','FORCE','12345','Edge Browser',1,0),(279,1,'2024-01-02 08:19:56','2024-01-02 08:19:56','web','FORCE','12345','Edge Browser',1,0),(280,1,'2024-01-02 08:19:56','2024-01-02 08:19:56','web','FORCE','12345','Edge Browser',1,0),(281,1,'2024-01-02 08:19:56','2024-01-02 08:19:57','web','FORCE','12345','Edge Browser',1,0),(282,1,'2024-01-02 08:19:57','2024-01-02 08:19:57','web','FORCE','12345','Edge Browser',1,0),(283,1,'2024-01-02 08:19:57','2024-01-02 08:19:57','web','FORCE','12345','Edge Browser',1,0),(284,1,'2024-01-02 08:19:57','2024-01-02 08:19:57','web','FORCE','12345','Edge Browser',1,0),(285,1,'2024-01-02 08:19:57','2024-01-02 08:19:57','web','FORCE','12345','Edge Browser',1,0),(286,1,'2024-01-02 08:19:57','2024-01-02 08:19:57','web','FORCE','12345','Edge Browser',1,0),(287,1,'2024-01-02 08:19:57','2024-01-02 08:19:58','web','FORCE','12345','Edge Browser',1,0),(288,1,'2024-01-02 08:19:58','2024-01-02 08:19:58','web','FORCE','12345','Edge Browser',1,0),(289,1,'2024-01-02 08:19:58','2024-01-02 08:19:58','web','FORCE','12345','Edge Browser',1,0),(290,1,'2024-01-02 08:19:58','2024-01-02 08:19:58','web','FORCE','12345','Edge Browser',1,0),(291,1,'2024-01-02 08:19:58','2024-01-02 08:19:58','web','FORCE','12345','Edge Browser',1,0),(292,1,'2024-01-02 08:19:58','2024-01-02 08:19:58','web','FORCE','12345','Edge Browser',1,0),(293,1,'2024-01-02 08:19:58','2024-01-02 08:19:59','web','FORCE','12345','Edge Browser',1,0),(294,1,'2024-01-02 08:19:59','2024-01-02 08:19:59','web','FORCE','12345','Edge Browser',1,0),(295,1,'2024-01-02 08:19:59','2024-01-02 08:19:59','web','FORCE','12345','Edge Browser',1,0),(296,1,'2024-01-02 08:19:59','2024-01-02 08:19:59','web','FORCE','12345','Edge Browser',1,0),(297,1,'2024-01-02 08:19:59','2024-01-02 08:19:59','web','FORCE','12345','Edge Browser',1,0),(298,1,'2024-01-02 08:19:59','2024-01-02 08:20:00','web','FORCE','12345','Edge Browser',1,0),(299,1,'2024-01-02 08:20:00','2024-01-02 08:20:00','web','FORCE','12345','Edge Browser',1,0),(300,1,'2024-01-02 08:20:00','2024-01-02 08:20:00','web','FORCE','12345','Edge Browser',1,0),(301,1,'2024-01-02 08:20:00','2024-01-02 08:20:00','web','FORCE','12345','Edge Browser',1,0),(302,1,'2024-01-02 08:20:00','2024-01-02 08:20:00','web','FORCE','12345','Edge Browser',1,0),(303,1,'2024-01-02 08:20:00','2024-01-02 08:20:01','web','FORCE','12345','Edge Browser',1,0),(304,1,'2024-01-02 08:20:01','2024-01-02 08:20:01','web','FORCE','12345','Edge Browser',1,0),(305,1,'2024-01-02 08:20:01','2024-01-02 08:20:01','web','FORCE','12345','Edge Browser',1,0),(306,1,'2024-01-02 08:20:01','2024-01-02 08:20:01','web','FORCE','12345','Edge Browser',1,0),(307,1,'2024-01-02 08:20:01','2024-01-02 08:20:01','web','FORCE','12345','Edge Browser',1,0),(308,1,'2024-01-02 08:20:01','2024-01-02 08:20:01','web','FORCE','12345','Edge Browser',1,0),(309,1,'2024-01-02 08:20:01','2024-01-02 08:20:02','web','FORCE','12345','Edge Browser',1,0),(310,1,'2024-01-02 08:20:02','2024-01-02 08:20:02','web','FORCE','12345','Edge Browser',1,0),(311,1,'2024-01-02 08:20:02','2024-01-02 08:20:02','web','FORCE','12345','Edge Browser',1,0),(312,1,'2024-01-02 08:20:02','2024-01-02 08:20:02','web','FORCE','12345','Edge Browser',1,0),(313,1,'2024-01-02 08:20:02','2024-01-02 08:20:02','web','FORCE','12345','Edge Browser',1,0),(314,1,'2024-01-02 08:20:02','2024-01-02 08:20:03','web','FORCE','12345','Edge Browser',1,0),(315,1,'2024-01-02 08:20:03','2024-01-02 08:20:03','web','FORCE','12345','Edge Browser',1,0),(316,1,'2024-01-02 08:20:03','2024-01-02 08:24:42','web','FORCE','12345','Edge Browser',1,0),(317,1,'2024-01-02 08:24:42','2024-01-02 08:32:56','web','FORCE','12345','Edge Browser',1,0),(318,1,'2024-01-02 08:32:56','2024-01-02 13:27:20','web','FORCE','12345','Edge Browser',1,0),(319,1,'2024-01-02 13:27:20','2024-01-02 13:27:28','web','FORCE','12345','Edge Browser',1,0),(320,1,'2024-01-02 13:27:28','2024-01-02 13:36:08','web','FORCE','12345','Edge Browser',1,0),(321,1,'2024-01-02 13:36:08','2024-01-02 13:45:38','web','FORCE','12345','Edge Browser',1,0),(322,1,'2024-01-02 13:45:38','2024-01-02 16:31:06','web','FORCE','12345','Edge Browser',1,0),(323,1,'2024-01-02 16:31:06','2024-01-02 16:32:28','web','FORCE','12345','Edge Browser',1,0),(324,1,'2024-01-02 16:32:28','2024-01-02 16:32:50','web','FORCE','12345','Edge Browser',1,0),(325,1,'2024-01-02 16:32:50','2024-01-05 06:53:59','web','FORCE','12345','Edge Browser',1,0),(326,1,'2024-01-05 06:53:59','2024-01-05 06:54:47','web','FORCE','12345','Edge Browser',1,0),(327,1,'2024-01-05 06:54:47','2024-01-08 10:46:16','web','FORCE','12345','Edge Browser',1,0),(328,1,'2024-01-08 10:46:16','2024-01-08 17:05:01','web','FORCE','12345','Edge Browser',1,0),(329,1,'2024-01-08 17:05:01','2024-01-09 09:06:12','web','FORCE','12345','Edge Browser',1,0),(330,1,'2024-01-09 09:06:12','2024-01-09 09:08:56','web','FORCE','12345','Edge Browser',1,0),(331,1,'2024-01-09 09:08:56','2024-01-09 10:27:47','web','FORCE','12345','Edge Browser',1,0),(332,1,'2024-01-09 10:27:47','2024-01-15 08:23:49','web','FORCE','12345','Edge Browser',1,0),(333,1,'2024-01-15 08:23:49','2024-01-15 12:58:22','web','FORCE','12345','Edge Browser',1,0),(334,1,'2024-01-15 12:58:22','2024-01-15 12:58:47','web','FORCE','12345','Edge Browser',1,0),(335,1,'2024-01-15 12:58:47','2024-01-16 12:12:17','web','FORCE','12345','Edge Browser',1,0),(336,1,'2024-01-16 12:12:17','2024-01-16 12:16:36','web','FORCE','12345','Edge Browser',1,0),(337,1,'2024-01-16 12:16:36','2024-01-19 08:11:32','web','FORCE','12345','Edge Browser',1,0),(338,1,'2024-01-19 08:11:32','2024-01-19 08:12:02','web','FORCE','12345','Edge Browser',1,0),(339,1,'2024-01-19 08:12:02','2024-01-22 10:52:14','web','FORCE','12345','Edge Browser',1,0),(340,136,'2024-01-19 08:16:54','2024-01-19 09:10:17','web','FORCE','12345','Edge Browser',1,0),(341,136,'2024-01-19 09:10:17',NULL,'web','','12345','Edge Browser',0,0),(342,1,'2024-01-22 10:52:14','2024-01-22 10:54:09','web','FORCE','12345','Edge Browser',1,0),(343,1,'2024-01-22 10:54:09','2024-01-29 14:31:47','web','FORCE','12345','Edge Browser',1,0),(344,1,'2024-01-29 14:31:47','2024-01-29 14:32:01','web','FORCE','12345','Edge Browser',1,0),(345,1,'2024-01-29 14:32:01','2024-01-29 14:36:13','web','FORCE','12345','Edge Browser',1,0),(346,1,'2024-01-29 14:36:13','2024-01-29 15:25:14','web','FORCE','12345','Edge Browser',1,0),(347,1,'2024-01-29 15:25:14','2024-01-29 15:25:30','web','FORCE','12345','Edge Browser',1,0),(348,1,'2024-01-29 15:25:30','2024-01-29 15:25:45','web','FORCE','12345','Edge Browser',1,0),(349,1,'2024-01-29 15:25:45','2024-01-29 15:26:13','web','FORCE','12345','Edge Browser',1,0),(350,1,'2024-01-29 15:26:13','2024-01-29 15:27:52','web','FORCE','12345','Edge Browser',1,0),(351,1,'2024-01-29 15:27:52','2024-01-29 15:31:55','web','FORCE','12345','Edge Browser',1,0),(352,1,'2024-01-29 15:31:55','2024-01-29 15:32:05','web','FORCE','12345','Edge Browser',1,0),(353,1,'2024-01-29 15:32:05','2024-01-29 15:32:22','web','FORCE','12345','Edge Browser',1,0),(354,1,'2024-01-29 15:32:22','2024-01-29 15:32:39','web','FORCE','12345','Edge Browser',1,0),(355,1,'2024-01-29 15:32:39','2024-01-30 07:47:53','web','FORCE','12345','Edge Browser',1,0),(356,1,'2024-01-30 07:47:53','2024-01-30 07:48:24','web','FORCE','12345','Edge Browser',1,0),(357,1,'2024-01-30 07:48:24','2024-01-30 07:49:30','web','FORCE','12345','Edge Browser',1,0),(358,1,'2024-01-30 07:48:24','2024-01-30 07:49:30','web','FORCE','12345','Edge Browser',1,0),(359,1,'2024-01-30 07:49:30','2024-01-30 07:49:52','web','FORCE','12345','Edge Browser',1,0),(360,1,'2024-01-30 07:49:52','2024-01-30 07:49:53','web','FORCE','12345','Edge Browser',1,0),(361,1,'2024-01-30 07:49:53','2024-01-30 07:56:53','web','FORCE','12345','Edge Browser',1,0),(362,1,'2024-01-30 07:56:53','2024-01-30 07:58:25','web','FORCE','12345','Edge Browser',1,0),(363,1,'2024-01-30 07:58:25','2024-01-30 07:58:52','web','FORCE','12345','Edge Browser',1,0),(364,1,'2024-01-30 07:58:52','2024-01-30 08:04:14','web','FORCE','12345','Edge Browser',1,0),(365,1,'2024-01-30 08:04:14','2024-01-30 08:04:36','web','FORCE','12345','Edge Browser',1,0),(366,1,'2024-01-30 08:04:36','2024-01-30 08:05:30','web','FORCE','12345','Edge Browser',1,0),(367,1,'2024-01-30 08:05:30','2024-01-30 08:11:00','web','FORCE','12345','Edge Browser',1,0),(368,1,'2024-01-30 08:11:00','2024-01-30 08:11:31','web','FORCE','12345','Edge Browser',1,0),(369,1,'2024-01-30 08:11:31','2024-01-30 08:11:44','web','FORCE','12345','Edge Browser',1,0),(370,1,'2024-01-30 08:11:44','2024-01-30 08:12:01','web','FORCE','12345','Edge Browser',1,0),(371,1,'2024-01-30 08:12:01','2024-01-30 08:12:56','web','FORCE','12345','Edge Browser',1,0),(372,1,'2024-01-30 08:12:56','2024-01-30 08:13:12','web','FORCE','12345','Edge Browser',1,0),(373,1,'2024-01-30 08:13:12','2024-01-30 14:59:46','web','FORCE','12345','Edge Browser',1,0),(374,139,'2024-01-30 10:51:05','2024-01-30 12:38:30','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(375,140,'2024-01-30 12:14:47','2024-01-30 12:19:15','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(376,140,'2024-01-30 12:19:15','2024-01-30 12:22:16','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(377,140,'2024-01-30 12:22:16','2024-01-30 12:23:03','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(378,140,'2024-01-30 12:23:03','2024-01-30 12:28:16','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(379,140,'2024-01-30 12:28:16','2024-01-30 12:28:35','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(380,140,'2024-01-30 12:28:35','2024-01-30 12:28:48','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(381,140,'2024-01-30 12:28:48','2024-01-30 12:28:57','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(382,140,'2024-01-30 12:28:57','2024-01-30 12:29:47','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(383,140,'2024-01-30 12:29:47','2024-01-30 12:30:31','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(384,140,'2024-01-30 12:30:31','2024-01-30 12:32:17','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(385,140,'2024-01-30 12:32:17','2024-02-02 12:23:35','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(386,1,'2024-01-30 12:38:15','2024-02-04 00:20:43','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(387,139,'2024-01-30 12:38:30',NULL,'android','','ghfffgh','asdjkfbajksdfbjasbdfasdf',0,0),(388,1,'2024-01-30 14:59:46','2024-01-30 15:03:39','web','FORCE','12345','Edge Browser',1,0),(389,1,'2024-01-30 15:03:39','2024-01-30 15:54:40','web','FORCE','12345','Edge Browser',1,0),(390,1,'2024-01-30 15:54:40','2024-01-30 15:55:02','web','FORCE','12345','Edge Browser',1,0),(391,1,'2024-01-30 15:55:02','2024-01-31 09:01:09','web','FORCE','12345','Edge Browser',1,0),(392,1,'2024-01-31 09:01:09','2024-01-31 09:04:40','web','FORCE','12345','Edge Browser',1,0),(393,1,'2024-01-31 09:04:40','2024-01-31 11:28:21','web','FORCE','12345','Edge Browser',1,0),(394,143,'2024-01-31 09:07:01',NULL,'web','','12345','Edge Browser',0,0),(395,144,'2024-01-31 09:15:52','2024-02-06 10:41:47','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(396,145,'2024-01-31 09:43:47',NULL,'android','','ghfffgh','asdjkfbajksdfbjasbdfasdf',0,0),(397,1,'2024-01-31 11:28:21','2024-01-31 11:30:20','web','FORCE','12345','Edge Browser',1,0),(398,1,'2024-01-31 11:30:20','2024-01-31 12:39:15','web','FORCE','12345','Edge Browser',1,0),(399,1,'2024-01-31 12:39:15','2024-01-31 12:39:17','web','FORCE','12345','Edge Browser',1,0),(400,1,'2024-01-31 12:39:17','2024-02-02 10:33:38','web','FORCE','12345','Edge Browser',1,0),(401,1,'2024-02-02 10:33:38','2024-02-02 11:06:29','web','FORCE','12345','Edge Browser',1,0),(402,1,'2024-02-02 11:06:29','2024-02-02 11:06:38','web','FORCE','12345','Edge Browser',1,0),(403,1,'2024-02-02 11:06:38','2024-02-02 13:09:58','web','FORCE','12345','Edge Browser',1,0),(404,83,'2024-02-02 12:06:22','2024-02-02 12:09:39','web','FORCE','12345','Edge Browser',1,0),(405,83,'2024-02-02 12:09:39','2024-02-02 12:35:57','web','FORCE','12345','Edge Browser',1,0),(406,140,'2024-02-02 12:23:35',NULL,'android','','ghfffgh','asdjkfbajksdfbjasbdfasdf',0,0),(407,83,'2024-02-02 12:35:57',NULL,'web','','12345','Edge Browser',0,0),(408,145,'2024-02-02 12:37:04',NULL,'web','','12345','Edge Browser',0,0),(409,1,'2024-02-02 13:09:58','2024-02-02 13:13:57','web','FORCE','12345','Edge Browser',1,0),(410,1,'2024-02-02 13:13:57','2024-02-02 13:24:31','web','FORCE','12345','Edge Browser',1,0),(411,1,'2024-02-02 13:24:31','2024-02-02 13:26:14','web','FORCE','12345','Edge Browser',1,0),(412,1,'2024-02-02 13:26:14','2024-02-14 12:38:57','web','FORCE','12345','Edge Browser',1,0),(413,95,'2024-02-03 07:12:03',NULL,'android','','ghfffgh','asdjkfbajksdfbjasbdfasdf',0,0),(414,1,'2024-02-04 00:20:43','2024-02-05 08:23:49','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(415,1,'2024-02-05 08:23:49','2024-02-05 09:12:32','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(416,1,'2024-02-05 09:12:32','2024-02-05 09:12:34','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(417,1,'2024-02-05 09:12:34','2024-02-05 09:18:54','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(418,1,'2024-02-05 09:18:54','2024-02-05 09:23:34','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(419,1,'2024-02-05 09:23:34','2024-02-06 12:09:49','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(420,144,'2024-02-06 10:41:47',NULL,'android','','ghfffgh','asdjkfbajksdfbjasbdfasdf',0,0),(421,148,'2024-02-06 10:53:34',NULL,'android','','ghfffgh','asdjkfbajksdfbjasbdfasdf',0,0),(422,1,'2024-02-06 12:09:49','2024-02-06 12:50:57','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(423,76,'2024-02-06 12:36:18','2024-03-11 08:05:43','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(424,1,'2024-02-06 12:50:57','2024-02-09 08:31:28','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(425,1,'2024-02-09 08:31:28','2024-02-09 08:32:44','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(426,1,'2024-02-09 08:32:44','2024-02-09 09:33:23','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(427,1,'2024-02-09 09:33:23','2024-02-09 09:34:28','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(428,1,'2024-02-09 09:34:28','2024-02-09 09:39:53','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(429,1,'2024-02-09 09:39:53','2024-02-14 12:41:03','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(430,1,'2024-02-14 12:38:57','2024-02-14 12:42:30','web','FORCE','12345','Edge Browser',1,0),(431,1,'2024-02-14 12:41:03','2024-03-04 10:49:54','android','FORCE','ghfffgh','asdjkfbajksdfbjasbdfasdf',1,0),(432,1,'2024-02-14 12:42:30','2024-02-23 12:37:53','web','FORCE','12345','Edge Browser',1,0),(433,149,'2024-02-14 12:47:10','2024-02-14 12:47:31','web','FORCE','12345','Edge Browser',1,0),(434,149,'2024-02-14 12:47:31','2024-02-15 15:29:19','web','FORCE','12345','Edge Browser',1,0),(435,149,'2024-02-15 15:29:19',NULL,'web','','12345','Edge Browser',0,0),(436,1,'2024-02-23 12:37:53','2024-02-23 12:39:04','web','FORCE','12345','Edge Browser',1,0),(437,1,'2024-02-23 12:39:04','2024-02-23 12:59:20','web','FORCE','12345','Edge Browser',1,0),(438,1,'2024-02-23 12:59:20','2024-02-23 13:21:36','web','FORCE','12345','Edge Browser',1,0),(439,1,'2024-02-23 13:21:36','2024-02-23 13:22:24','web','FORCE','12345','Edge Browser',1,0),(440,1,'2024-02-23 13:22:24','2024-02-23 13:23:08','web','FORCE','12345','Edge Browser',1,0),(441,1,'2024-02-23 13:23:08','2024-02-26 06:58:09','web','FORCE','12345','Edge Browser',1,0),(442,1,'2024-02-26 06:58:09','2024-03-11 11:33:31','web','FORCE','12345','Edge Browser',1,0),(443,1,'2024-02-26 06:58:09','2024-03-11 11:33:31','web','FORCE','12345','Edge Browser',1,0),(444,1,'2024-03-04 10:49:54',NULL,'undefined','','ghfffgh','asdjkfbajksdfbjasbdfasdf',0,0),(445,1,'2024-03-04 10:59:08',NULL,'undefined','','ghfffgh','asdjkfbajksdfbjasbdfasdf',0,0),(446,1,'2024-03-04 11:19:12',NULL,'undefined','','ghfffgh','asdjkfbajksdfbjasbdfasdf',0,0),(447,1,'2024-03-04 11:23:39',NULL,'undefined','','ghfffgh','asdjkfbajksdfbjasbdfasdf',0,0),(448,151,'2024-03-04 11:26:48',NULL,'undefined','','ghfffgh','asdjkfbajksdfbjasbdfasdf',0,0),(449,151,'2024-03-04 11:38:04',NULL,'undefined','','ghfffgh','asdjkfbajksdfbjasbdfasdf',0,0),(450,1,'2024-03-04 11:47:36',NULL,'undefined','','ghfffgh','asdjkfbajksdfbjasbdfasdf',0,0),(451,1,'2024-03-04 11:48:15',NULL,'undefined','','ghfffgh','asdjkfbajksdfbjasbdfasdf',0,0),(452,1,'2024-03-04 11:53:29',NULL,'undefined','','ghfffgh','asdjkfbajksdfbjasbdfasdf',0,0),(453,151,'2024-03-04 12:05:27',NULL,'undefined','','Dummy Token','{\"deviceId\":\"alioth\",\"userDeviceName\":{\"_h\":0,\"_i\":1,\"_j\":\"POCO F3\",\"_k\":null},\"deviceIPAdress\":\"192.168.1.46\",\"deviceMacAddress\":\"\",\"osName\":\"Android\",\"osVersion\":\"13\",\"uniqueDeviceId\":{\"_h\":0,\"_i\":1,\"_j\":\"3b15fa865b0a5df5\",\"_k\":null},\"isEmulator\":{\"_h\":0,\"_i\":1,\"_j\":false,\"_k\":null},\"isLocationAvailable\":false}',0,0),(454,151,'2024-03-04 12:40:15',NULL,'undefined','','Dummy Token','{\"deviceId\":\"alioth\",\"userDeviceName\":{\"_h\":0,\"_i\":1,\"_j\":\"POCO F3\",\"_k\":null},\"deviceIPAdress\":\"192.168.1.55\",\"deviceMacAddress\":\"\",\"osName\":\"Android\",\"osVersion\":\"13\",\"uniqueDeviceId\":{\"_h\":0,\"_i\":1,\"_j\":\"3b15fa865b0a5df5\",\"_k\":null},\"isEmulator\":{\"_h\":0,\"_i\":1,\"_j\":false,\"_k\":null},\"isLocationAvailable\":false}',0,0),(455,1,'2024-03-05 14:06:56',NULL,'undefined','','ghfffgh','asdjkfbajksdfbjasbdfasdf',0,0),(456,1,'2024-03-05 14:31:21',NULL,'undefined','','Dummy Token','{\"deviceId\":\"alioth\",\"userDeviceName\":{\"_h\":0,\"_i\":1,\"_j\":\"POCO F3\",\"_k\":null},\"deviceIPAdress\":\"192.168.1.24\",\"deviceMacAddress\":\"\",\"osName\":\"Android\",\"osVersion\":\"13\",\"uniqueDeviceId\":{\"_h\":0,\"_i\":1,\"_j\":\"3b15fa865b0a5df5\",\"_k\":null},\"isEmulator\":{\"_h\":0,\"_i\":1,\"_j\":false,\"_k\":null},\"isLocationAvailable\":false}',0,0),(457,1,'2024-03-06 09:53:02',NULL,'undefined','','Dummy Token','{\"deviceId\":\"alioth\",\"userDeviceName\":{\"_h\":0,\"_i\":1,\"_j\":\"POCO F3\",\"_k\":null},\"deviceIPAdress\":\"192.168.1.24\",\"deviceMacAddress\":\"\",\"osName\":\"Android\",\"osVersion\":\"13\",\"uniqueDeviceId\":{\"_h\":0,\"_i\":1,\"_j\":\"3b15fa865b0a5df5\",\"_k\":null},\"isEmulator\":{\"_h\":0,\"_i\":1,\"_j\":false,\"_k\":null},\"isLocationAvailable\":false}',0,0),(458,1,'2024-03-06 09:54:33',NULL,'undefined','','Dummy Token','{\"deviceId\":\"alioth\",\"userDeviceName\":{\"_h\":0,\"_i\":1,\"_j\":\"POCO F3\",\"_k\":null},\"deviceIPAdress\":\"192.168.1.24\",\"deviceMacAddress\":\"\",\"osName\":\"Android\",\"osVersion\":\"13\",\"uniqueDeviceId\":{\"_h\":0,\"_i\":1,\"_j\":\"3b15fa865b0a5df5\",\"_k\":null},\"isEmulator\":{\"_h\":0,\"_i\":1,\"_j\":false,\"_k\":null},\"isLocationAvailable\":false}',0,0),(459,1,'2024-03-06 09:54:52',NULL,'undefined','','Dummy Token','{\"deviceId\":\"alioth\",\"userDeviceName\":{\"_h\":0,\"_i\":1,\"_j\":\"POCO F3\",\"_k\":null},\"deviceIPAdress\":\"192.168.1.24\",\"deviceMacAddress\":\"\",\"osName\":\"Android\",\"osVersion\":\"13\",\"uniqueDeviceId\":{\"_h\":0,\"_i\":1,\"_j\":\"3b15fa865b0a5df5\",\"_k\":null},\"isEmulator\":{\"_h\":0,\"_i\":1,\"_j\":false,\"_k\":null},\"isLocationAvailable\":false}',0,0),(460,1,'2024-03-07 16:20:34',NULL,'undefined','','ghfffgh','asdjkfbajksdfbjasbdfasdf',0,0),(461,1,'2024-03-07 18:24:20',NULL,'undefined','','Dummy Token','{\"deviceId\":\"lahaina\",\"userDeviceName\":{\"_h\":0,\"_i\":1,\"_j\":\"OnePlus 9 5G\",\"_k\":null},\"deviceIPAdress\":\"192.168.1.2\",\"deviceMacAddress\":\"\",\"osName\":\"Android\",\"osVersion\":\"11\",\"uniqueDeviceId\":{\"_h\":0,\"_i\":1,\"_j\":\"8a72341ff7a31e0d\",\"_k\":null},\"isEmulator\":{\"_h\":0,\"_i\":1,\"_j\":false,\"_k\":null},\"isLocationAvailable\":false}',0,0),(462,1,'2024-03-08 11:44:23',NULL,'undefined','','Dummy Token','{\"deviceId\":\"alioth\",\"userDeviceName\":{\"_h\":0,\"_i\":1,\"_j\":\"POCO F3\",\"_k\":null},\"deviceIPAdress\":\"192.168.18.178\",\"deviceMacAddress\":\"\",\"osName\":\"Android\",\"osVersion\":\"13\",\"uniqueDeviceId\":{\"_h\":0,\"_i\":1,\"_j\":\"3b15fa865b0a5df5\",\"_k\":null},\"isEmulator\":{\"_h\":0,\"_i\":1,\"_j\":false,\"_k\":null},\"isLocationAvailable\":true}',0,0),(463,1,'2024-03-09 07:59:48',NULL,'undefined','','Dummy Token','{\"deviceId\":\"iPhone11,2\",\"userDeviceName\":{\"_h\":0,\"_i\":1,\"_j\":\"iPhone\",\"_k\":null},\"deviceIPAdress\":\"192.168.100.186\",\"deviceMacAddress\":\"02:00:00:00:00:00\",\"osName\":\"iOS\",\"osVersion\":\"17.3.1\",\"uniqueDeviceId\":{\"_h\":0,\"_i\":1,\"_j\":\"E96DB53A-6EC5-4779-947D-3A356176227D\",\"_k\":null},\"isEmulator\":{\"_h\":0,\"_i\":1,\"_j\":false,\"_k\":null},\"isLocationAvailable\":false}',0,0),(464,1,'2024-03-09 08:20:05',NULL,'undefined','','Dummy Token','{\"deviceId\":\"iPhone11,2\",\"userDeviceName\":{\"_h\":0,\"_i\":1,\"_j\":\"iPhone\",\"_k\":null},\"deviceIPAdress\":\"192.168.100.186\",\"deviceMacAddress\":\"02:00:00:00:00:00\",\"osName\":\"iOS\",\"osVersion\":\"17.3.1\",\"uniqueDeviceId\":{\"_h\":0,\"_i\":1,\"_j\":\"E96DB53A-6EC5-4779-947D-3A356176227D\",\"_k\":null},\"isEmulator\":{\"_h\":0,\"_i\":1,\"_j\":false,\"_k\":null},\"isLocationAvailable\":false}',0,0),(465,1,'2024-03-09 09:22:05',NULL,'undefined','','Dummy Token','{\"deviceId\":\"alioth\",\"userDeviceName\":{\"_h\":0,\"_i\":1,\"_j\":\"POCO F3\",\"_k\":null},\"deviceIPAdress\":\"192.168.100.77\",\"deviceMacAddress\":\"\",\"osName\":\"Android\",\"osVersion\":\"13\",\"uniqueDeviceId\":{\"_h\":0,\"_i\":1,\"_j\":\"3b7868ed496d35fa\",\"_k\":null},\"isEmulator\":{\"_h\":0,\"_i\":1,\"_j\":false,\"_k\":null},\"isLocationAvailable\":false}',0,0),(466,1,'2024-03-11 07:16:33',NULL,'undefined','','ghfffgh','asdjkfbajksdfbjasbdfasdf',0,0),(467,1,'2024-03-11 07:17:09',NULL,'undefined','','ghfffgh','asdjkfbajksdfbjasbdfasdf',0,0),(468,1,'2024-03-11 07:17:35',NULL,'undefined','','ghfffgh','asdjkfbajksdfbjasbdfasdf',0,0),(469,1,'2024-03-11 07:17:55',NULL,'undefined','','ghfffgh','asdjkfbajksdfbjasbdfasdf',0,0),(470,1,'2024-03-11 07:22:25',NULL,'undefined','','ghfffgh','asdjkfbajksdfbjasbdfasdf',0,0),(471,1,'2024-03-11 07:24:14',NULL,'undefined','','ghfffgh','asdjkfbajksdfbjasbdfasdf',0,0),(472,1,'2024-03-11 07:25:12',NULL,'undefined','','ghfffgh','asdjkfbajksdfbjasbdfasdf',0,0),(473,1,'2024-03-11 07:32:01',NULL,'undefined','','ghfffgh','asdjkfbajksdfbjasbdfasdf',0,0),(474,1,'2024-03-11 07:32:29',NULL,'undefined','','ghfffgh','asdjkfbajksdfbjasbdfasdf',0,0),(475,1,'2024-03-11 07:34:12',NULL,'undefined','','ghfffgh','asdjkfbajksdfbjasbdfasdf',0,0),(476,1,'2024-03-11 07:35:08',NULL,'undefined','','ghfffgh','asdjkfbajksdfbjasbdfasdf',0,0),(477,1,'2024-03-11 07:36:48',NULL,'undefined','','ghfffgh','asdjkfbajksdfbjasbdfasdf',0,0),(478,1,'2024-03-11 07:54:04',NULL,'undefined','','ghfffgh','asdjkfbajksdfbjasbdfasdf',0,0),(479,1,'2024-03-11 07:55:21',NULL,'undefined','','ghfffgh','asdjkfbajksdfbjasbdfasdf',0,0),(480,1,'2024-03-11 07:56:26',NULL,'undefined','','ezNiZnyiSYKJenINFQAOvT:APA91bFKQfob1USeI8wWkK9hauC331-yFGc5i9wdCwQyasUYJgbviaSEaybalXrZ_UEQp6Ev7ADqYldVVXriSm6orc6rfIrnPkX2HYhR7dvY9W_YPnJsHIWleolAgQKYxMkXzpdIMcQZ','asdjkfbajksdfbjasbdfasdf',0,0),(481,1,'2024-03-11 07:59:25',NULL,'undefined','','ezNiZnyiSYKJenINFQAOvT:APA91bFKQfob1USeI8wWkK9hauC331-yFGc5i9wdCwQyasUYJgbviaSEaybalXrZ_UEQp6Ev7ADqYldVVXriSm6orc6rfIrnPkX2HYhR7dvY9W_YPnJsHIWleolAgQKYxMkXzpdIMcQZ','',0,0),(482,1,'2024-03-11 07:59:42',NULL,'undefined','','ezNiZnyiSYKJenINFQAOvT:APA91bFKQfob1USeI8wWkK9hauC331-yFGc5i9wdCwQyasUYJgbviaSEaybalXrZ_UEQp6Ev7ADqYldVVXriSm6orc6rfIrnPkX2HYhR7dvY9W_YPnJsHIWleolAgQKYxMkXzpdIMcQZ','',0,0),(483,1,'2024-03-11 08:00:09',NULL,'undefined','','ezNiZnyiSYKJenINFQAOvT:APA91bFKQfob1USeI8wWkK9hauC331-yFGc5i9wdCwQyasUYJgbviaSEaybalXrZ_UEQp6Ev7ADqYldVVXriSm6orc6rfIrnPkX2HYhR7dvY9W_YPnJsHIWleolAgQKYxMkXzpdIMcQZ','',0,0),(484,1,'2024-03-11 08:00:09',NULL,'undefined','','ezNiZnyiSYKJenINFQAOvT:APA91bFKQfob1USeI8wWkK9hauC331-yFGc5i9wdCwQyasUYJgbviaSEaybalXrZ_UEQp6Ev7ADqYldVVXriSm6orc6rfIrnPkX2HYhR7dvY9W_YPnJsHIWleolAgQKYxMkXzpdIMcQZ','',0,0),(485,76,'2024-03-11 08:05:43',NULL,'undefined','','ezNiZnyiSYKJenINFQAOvT:APA91bFKQfob1USeI8wWkK9hauC331-yFGc5i9wdCwQyasUYJgbviaSEaybalXrZ_UEQp6Ev7ADqYldVVXriSm6orc6rfIrnPkX2HYhR7dvY9W_YPnJsHIWleolAgQKYxMkXzpdIMcQZ','',0,0),(486,76,'2024-03-11 08:12:08',NULL,'undefined','','ezNiZnyiSYKJenINFQAOvT:APA91bFKQfob1USeI8wWkK9hauC331-yFGc5i9wdCwQyasUYJgbviaSEaybalXrZ_UEQp6Ev7ADqYldVVXriSm6orc6rfIrnPkX2HYhR7dvY9W_YPnJsHIWleolAgQKYxMkXzpdIMcQZ','',0,0),(487,76,'2024-03-11 08:22:58',NULL,'undefined','','ezNiZnyiSYKJenINFQAOvT:APA91bFKQfob1USeI8wWkK9hauC331-yFGc5i9wdCwQyasUYJgbviaSEaybalXrZ_UEQp6Ev7ADqYldVVXriSm6orc6rfIrnPkX2HYhR7dvY9W_YPnJsHIWleolAgQKYxMkXzpdIMcQZ','',0,0),(488,76,'2024-03-11 08:24:50',NULL,'undefined','','ezNiZnyiSYKJenINFQAOvT:APA91bFKQfob1USeI8wWkK9hauC331-yFGc5i9wdCwQyasUYJgbviaSEaybalXrZ_UEQp6Ev7ADqYldVVXriSm6orc6rfIrnPkX2HYhR7dvY9W_YPnJsHIWleolAgQKYxMkXzpdIMcQZ','',0,0),(489,76,'2024-03-11 08:25:26',NULL,'undefined','','ezNiZnyiSYKJenINFQAOvT:APA91bFKQfob1USeI8wWkK9hauC331-yFGc5i9wdCwQyasUYJgbviaSEaybalXrZ_UEQp6Ev7ADqYldVVXriSm6orc6rfIrnPkX2HYhR7dvY9W_YPnJsHIWleolAgQKYxMkXzpdIMcQZ','',0,0),(490,76,'2024-03-11 08:26:12',NULL,'undefined','','ezNiZnyiSYKJenINFQAOvT:APA91bFKQfob1USeI8wWkK9hauC331-yFGc5i9wdCwQyasUYJgbviaSEaybalXrZ_UEQp6Ev7ADqYldVVXriSm6orc6rfIrnPkX2HYhR7dvY9W_YPnJsHIWleolAgQKYxMkXzpdIMcQZ','',0,0),(491,76,'2024-03-11 08:28:20',NULL,'undefined','','ezNiZnyiSYKJenINFQAOvT:APA91bFKQfob1USeI8wWkK9hauC331-yFGc5i9wdCwQyasUYJgbviaSEaybalXrZ_UEQp6Ev7ADqYldVVXriSm6orc6rfIrnPkX2HYhR7dvY9W_YPnJsHIWleolAgQKYxMkXzpdIMcQZ','',0,0),(492,76,'2024-03-11 08:28:58',NULL,'undefined','','ezNiZnyiSYKJenINFQAOvT:APA91bFKQfob1USeI8wWkK9hauC331-yFGc5i9wdCwQyasUYJgbviaSEaybalXrZ_UEQp6Ev7ADqYldVVXriSm6orc6rfIrnPkX2HYhR7dvY9W_YPnJsHIWleolAgQKYxMkXzpdIMcQZ','',0,0),(493,76,'2024-03-11 08:30:04',NULL,'undefined','','ezNiZnyiSYKJenINFQAOvT:APA91bFKQfob1USeI8wWkK9hauC331-yFGc5i9wdCwQyasUYJgbviaSEaybalXrZ_UEQp6Ev7ADqYldVVXriSm6orc6rfIrnPkX2HYhR7dvY9W_YPnJsHIWleolAgQKYxMkXzpdIMcQZ','',0,0),(494,76,'2024-03-11 08:30:13',NULL,'undefined','','ezNiZnyiSYKJenINFQAOvT:APA91bFKQfob1USeI8wWkK9hauC331-yFGc5i9wdCwQyasUYJgbviaSEaybalXrZ_UEQp6Ev7ADqYldVVXriSm6orc6rfIrnPkX2HYhR7dvY9W_YPnJsHIWleolAgQKYxMkXzpdIMcQZ','',0,0),(495,76,'2024-03-11 08:30:36',NULL,'undefined','','ezNiZnyiSYKJenINFQAOvT:APA91bFKQfob1USeI8wWkK9hauC331-yFGc5i9wdCwQyasUYJgbviaSEaybalXrZ_UEQp6Ev7ADqYldVVXriSm6orc6rfIrnPkX2HYhR7dvY9W_YPnJsHIWleolAgQKYxMkXzpdIMcQZ','',0,0),(496,76,'2024-03-11 08:31:29',NULL,'undefined','','ezNiZnyiSYKJenINFQAOvT:APA91bFKQfob1USeI8wWkK9hauC331-yFGc5i9wdCwQyasUYJgbviaSEaybalXrZ_UEQp6Ev7ADqYldVVXriSm6orc6rfIrnPkX2HYhR7dvY9W_YPnJsHIWleolAgQKYxMkXzpdIMcQZ','',0,0),(497,76,'2024-03-11 08:33:05',NULL,'undefined','','ezNiZnyiSYKJenINFQAOvT:APA91bFKQfob1USeI8wWkK9hauC331-yFGc5i9wdCwQyasUYJgbviaSEaybalXrZ_UEQp6Ev7ADqYldVVXriSm6orc6rfIrnPkX2HYhR7dvY9W_YPnJsHIWleolAgQKYxMkXzpdIMcQZ','',0,0),(498,76,'2024-03-11 08:37:33',NULL,'undefined','','ezNiZnyiSYKJenINFQAOvT:APA91bFKQfob1USeI8wWkK9hauC331-yFGc5i9wdCwQyasUYJgbviaSEaybalXrZ_UEQp6Ev7ADqYldVVXriSm6orc6rfIrnPkX2HYhR7dvY9W_YPnJsHIWleolAgQKYxMkXzpdIMcQZ','',0,0),(499,76,'2024-03-11 08:37:57',NULL,'undefined','','ezNiZnyiSYKJenINFQAOvT:APA91bFKQfob1USeI8wWkK9hauC331-yFGc5i9wdCwQyasUYJgbviaSEaybalXrZ_UEQp6Ev7ADqYldVVXriSm6orc6rfIrnPkX2HYhR7dvY9W_YPnJsHIWleolAgQKYxMkXzpdIMcQZ','',0,0),(500,76,'2024-03-11 08:38:25',NULL,'undefined','','ezNiZnyiSYKJenINFQAOvT:APA91bFKQfob1USeI8wWkK9hauC331-yFGc5i9wdCwQyasUYJgbviaSEaybalXrZ_UEQp6Ev7ADqYldVVXriSm6orc6rfIrnPkX2HYhR7dvY9W_YPnJsHIWleolAgQKYxMkXzpdIMcQZ','',0,0),(501,76,'2024-03-11 08:40:16',NULL,'undefined','','ezNiZnyiSYKJenINFQAOvT:APA91bFKQfob1USeI8wWkK9hauC331-yFGc5i9wdCwQyasUYJgbviaSEaybalXrZ_UEQp6Ev7ADqYldVVXriSm6orc6rfIrnPkX2HYhR7dvY9W_YPnJsHIWleolAgQKYxMkXzpdIMcQZ','',0,0),(502,76,'2024-03-11 08:46:35',NULL,'undefined','','ezNiZnyiSYKJenINFQAOvT:APA91bFKQfob1USeI8wWkK9hauC331-yFGc5i9wdCwQyasUYJgbviaSEaybalXrZ_UEQp6Ev7ADqYldVVXriSm6orc6rfIrnPkX2HYhR7dvY9W_YPnJsHIWleolAgQKYxMkXzpdIMcQZ','',0,0),(503,76,'2024-03-11 08:56:30',NULL,'undefined','','ezNiZnyiSYKJenINFQAOvT:APA91bFKQfob1USeI8wWkK9hauC331-yFGc5i9wdCwQyasUYJgbviaSEaybalXrZ_UEQp6Ev7ADqYldVVXriSm6orc6rfIrnPkX2HYhR7dvY9W_YPnJsHIWleolAgQKYxMkXzpdIMcQZ','',0,0),(504,76,'2024-03-11 08:57:50',NULL,'undefined','','ezNiZnyiSYKJenINFQAOvT:APA91bFKQfob1USeI8wWkK9hauC331-yFGc5i9wdCwQyasUYJgbviaSEaybalXrZ_UEQp6Ev7ADqYldVVXriSm6orc6rfIrnPkX2HYhR7dvY9W_YPnJsHIWleolAgQKYxMkXzpdIMcQZ','',0,0),(505,76,'2024-03-11 09:00:55',NULL,'undefined','','ezNiZnyiSYKJenINFQAOvT:APA91bFKQfob1USeI8wWkK9hauC331-yFGc5i9wdCwQyasUYJgbviaSEaybalXrZ_UEQp6Ev7ADqYldVVXriSm6orc6rfIrnPkX2HYhR7dvY9W_YPnJsHIWleolAgQKYxMkXzpdIMcQZ','',0,0),(506,1,'2024-03-11 11:31:51',NULL,'undefined','','ezNiZnyiSYKJenINFQAOvT:APA91bFKQfob1USeI8wWkK9hauC331-yFGc5i9wdCwQyasUYJgbviaSEaybalXrZ_UEQp6Ev7ADqYldVVXriSm6orc6rfIrnPkX2HYhR7dvY9W_YPnJsHIWleolAgQKYxMkXzpdIMcQZ','',0,0),(507,1,'2024-03-11 11:33:31',NULL,'undefined','','12345','Edge Browser',0,0),(508,76,'2024-03-11 11:46:26',NULL,'undefined','','12345','Edge Browser',0,0),(509,1,'2024-03-11 11:46:41',NULL,'undefined','','12345','Edge Browser',0,0),(510,1,'2024-03-11 11:48:47',NULL,'undefined','','12345','Edge Browser',0,0),(511,1,'2024-03-11 11:50:14',NULL,'undefined','','12345','Edge Browser',0,0),(512,1,'2024-03-11 11:51:14',NULL,'undefined','','12345','Edge Browser',0,0),(513,1,'2024-03-14 08:30:37',NULL,'undefined','','Dummy Token','{\"deviceId\":\"iPhone14,5\",\"userDeviceName\":{\"_h\":0,\"_i\":1,\"_j\":\"iPhone\",\"_k\":null},\"deviceIPAdress\":\"192.168.1.6\",\"deviceMacAddress\":\"02:00:00:00:00:00\",\"osName\":\"iOS\",\"osVersion\":\"17.1\",\"uniqueDeviceId\":{\"_h\":0,\"_i\":1,\"_j\":\"C8A05008-545A-48D6-9A4B-674963677650\",\"_k\":null},\"isEmulator\":{\"_h\":0,\"_i\":1,\"_j\":false,\"_k\":null},\"isLocationAvailable\":true}',0,0),(514,1,'2024-03-14 14:34:45',NULL,'undefined','','Dummy Token','{\"deviceId\":\"iPhone16,2\",\"userDeviceName\":{\"_h\":0,\"_i\":1,\"_j\":\"iPhone 15 Pro Max\",\"_k\":null},\"deviceIPAdress\":\"192.168.18.179\",\"deviceMacAddress\":\"02:00:00:00:00:00\",\"osName\":\"iOS\",\"osVersion\":\"17.0.1\",\"uniqueDeviceId\":{\"_h\":0,\"_i\":1,\"_j\":\"9E56D7A7-5446-4CE0-88C4-B6FAC2DD60B4\",\"_k\":null},\"isEmulator\":{\"_h\":0,\"_i\":1,\"_j\":true,\"_k\":null},\"isLocationAvailable\":true}',0,0);
/*!40000 ALTER TABLE `user_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_attendances`
--

DROP TABLE IF EXISTS `user_attendances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_attendances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `deny_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `user_attendance_id` (`user_id`),
  KEY `user_attendance_shift_id` (`shift_id`),
  KEY `user_attendance_team_id` (`team_id`),
  KEY `user_attendance_status` (`status`),
  KEY `created _by` (`created_by`),
  KEY `deleted_by` (`deleted_by`),
  KEY `approved_by` (`approved_by`),
  KEY `modify_by` (`modify_by`),
  CONSTRAINT `approved_by` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `created _by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `deleted_by` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `modify_by` FOREIGN KEY (`modify_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `user_attendance_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `user_attendance_shift_id` FOREIGN KEY (`shift_id`) REFERENCES `lookups` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `user_attendance_status` FOREIGN KEY (`status`) REFERENCES `attendance_status` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `user_attendance_team_id` FOREIGN KEY (`team_id`) REFERENCES `lookups` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_attendances`
--

LOCK TABLES `user_attendances` WRITE;
/*!40000 ALTER TABLE `user_attendances` DISABLE KEYS */;
INSERT INTO `user_attendances` VALUES (1,'2024-02-29 09:17:01','2024-02-29 12:17:01',1,1,2,0,'Testing 123',7,1,1,NULL,NULL,NULL,'2024-03-02 10:18:02',NULL,NULL,NULL,0,'0000-00-00 00:00:00'),(2,'2024-03-01 08:32:21','2024-03-01 13:32:21',1,1,1,0,'Testing 123',8,1,1,NULL,NULL,NULL,'2024-03-02 10:32:43',NULL,NULL,NULL,0,'0000-00-00 00:00:00'),(3,'2024-03-02 11:49:48','2024-03-02 15:49:00',1,1,1,0,'Testing 123',7,1,1,NULL,NULL,NULL,'2024-03-02 11:49:59',NULL,NULL,NULL,0,'0000-00-00 00:00:00'),(4,'2024-03-03 18:47:05','2024-03-03 00:47:00',1,1,1,0,'Testing 123',8,1,1,NULL,NULL,NULL,'2024-03-03 18:47:17',NULL,NULL,NULL,0,'0000-00-00 00:00:00'),(5,'2024-03-07 04:36:00','2024-03-07 13:37:00',1,149,1,0,'Testing 123',7,4,149,NULL,NULL,NULL,'2024-03-11 09:37:12',NULL,NULL,NULL,0,'0000-00-00 00:00:00'),(6,'2024-03-11 14:27:35','2024-03-13 14:27:00',1,1,1,0,'Testing 123',8,1,1,NULL,NULL,NULL,'2024-03-11 14:27:46',NULL,NULL,NULL,0,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `user_attendances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `flags` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_index` (`user_id`) USING BTREE,
  CONSTRAINT `user_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details`
--

LOCK TABLES `user_details` WRITE;
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
INSERT INTO `user_details` VALUES (18,1,0),(21,144,1),(22,115,1),(23,88,1),(25,148,1),(27,84,1),(28,86,1),(29,87,1),(30,89,1),(31,90,1),(32,91,1),(33,92,1),(34,93,1),(35,94,1),(36,95,1),(37,96,1),(38,97,1),(39,83,1),(40,103,1),(41,112,1),(42,113,1),(43,114,0),(44,116,1),(45,117,1),(46,118,1),(47,119,1),(48,120,1),(49,121,1),(50,122,1),(51,123,1),(52,124,1),(53,125,1),(54,126,1),(55,127,1),(56,128,1),(57,129,1),(58,130,1),(59,131,1),(60,132,1),(61,133,1),(62,134,1),(63,135,1),(64,136,1),(65,137,1),(66,138,1),(67,139,1),(68,140,1),(69,141,1),(70,142,1),(71,143,1),(72,145,1),(73,146,1),(74,85,1),(75,76,1),(90,149,1),(91,150,1),(92,151,0),(93,152,1),(94,153,1);
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_leaves`
--

DROP TABLE IF EXISTS `user_leaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_leaves` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `is_active` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `shift_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `approved_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modify_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deny_by` int(11) DEFAULT NULL,
  `deny_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `created -by` (`created_by`),
  KEY `approved-by` (`approved_by`),
  KEY `deleted-by` (`deleted_by`),
  KEY `modify-by` (`modify_by`),
  KEY `user-leaves-id` (`user_id`),
  KEY `user-leaves-status` (`status`),
  KEY `user-status-shift_id` (`shift_id`),
  KEY `user-leaves-team_id` (`team_id`),
  CONSTRAINT `approved-by` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `created -by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `deleted-by` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `modify-by` FOREIGN KEY (`modify_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `user-leaves-id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `user-leaves-status` FOREIGN KEY (`status`) REFERENCES `attendance_status` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `user-leaves-team_id` FOREIGN KEY (`team_id`) REFERENCES `lookups` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `user-status-shift_id` FOREIGN KEY (`shift_id`) REFERENCES `lookups` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_leaves`
--

LOCK TABLES `user_leaves` WRITE;
/*!40000 ALTER TABLE `user_leaves` DISABLE KEYS */;
INSERT INTO `user_leaves` VALUES (1,'2024-02-05 15:15:46','2023-09-16 00:00:00',1,1,1,8,4,1,NULL,NULL,NULL,'2024-02-05 15:16:33','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'0000-00-00 00:00:00'),(2,'2024-02-05 15:17:21','2023-09-15 13:17:36',1,1,1,7,4,1,NULL,NULL,NULL,'2024-02-05 15:18:04','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'0000-00-00 00:00:00'),(3,'2024-02-05 15:19:35','2023-09-15 13:17:36',1,1,1,9,1,1,NULL,NULL,NULL,'2024-02-05 15:20:02','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00'),(4,'2024-02-06 07:53:41','0000-00-00 00:00:00',0,1,1,8,1,NULL,NULL,NULL,NULL,'2024-02-06 07:54:05','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `user_leaves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_lookups`
--

DROP TABLE IF EXISTS `user_lookups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_lookups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(4) NOT NULL,
  `lookup_id` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_lookups_constraints` (`lookup_id`),
  KEY `user_lookups_id` (`user_id`),
  CONSTRAINT `user_lookups_constraints` FOREIGN KEY (`lookup_id`) REFERENCES `lookups` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `user_lookups_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_lookups`
--

LOCK TABLES `user_lookups` WRITE;
/*!40000 ALTER TABLE `user_lookups` DISABLE KEYS */;
INSERT INTO `user_lookups` VALUES (1,83,4,1),(2,83,1,1),(3,1,11,1),(5,1,8,1),(6,1,1,1),(7,1,4,1),(8,76,5,0),(9,76,9,1),(10,76,10,1),(11,85,4,1),(12,85,7,1),(13,85,11,1),(14,85,1,1),(15,85,5,1),(16,128,5,1),(17,149,4,1),(18,149,7,1);
/*!40000 ALTER TABLE `user_lookups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_permissions`
--

DROP TABLE IF EXISTS `user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_constraints` (`user_id`),
  KEY `permission_id_constraint` (`permission_id`),
  CONSTRAINT `permission_id_constraint` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `user_id_constraints` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_permissions`
--

LOCK TABLES `user_permissions` WRITE;
/*!40000 ALTER TABLE `user_permissions` DISABLE KEYS */;
INSERT INTO `user_permissions` VALUES (1,1,2,1),(3,1,4,1),(4,1,1,1),(5,76,2,1),(6,76,3,1),(7,83,4,1),(8,1,5,1),(9,83,5,0),(10,85,2,1),(11,85,6,1),(12,1,7,1),(23,112,7,1),(24,112,2,1),(25,113,7,1),(26,113,2,1),(27,114,7,1),(28,114,2,1),(29,115,7,1),(30,115,2,1),(31,1,6,1),(32,117,7,1),(33,117,2,1),(34,118,7,1),(35,118,2,1),(36,119,7,1),(37,119,2,1),(38,120,7,1),(39,120,2,1),(40,121,7,1),(41,121,2,1),(42,122,7,1),(43,122,2,1),(44,123,7,1),(45,123,2,1),(46,124,7,1),(47,124,2,1),(48,125,7,1),(49,125,2,1),(50,126,7,1),(51,126,2,1),(52,127,7,1),(53,127,2,1),(54,128,7,1),(55,128,2,1),(56,129,7,1),(57,129,2,1),(58,130,7,1),(59,130,2,1),(60,131,7,1),(61,131,2,1),(62,132,7,1),(63,132,2,1),(64,133,7,1),(65,133,2,1),(66,134,7,1),(67,134,2,1),(68,135,7,1),(69,135,2,1),(70,136,7,1),(71,136,2,1),(72,137,7,1),(73,137,2,1),(74,138,7,1),(75,138,2,1),(76,139,7,1),(77,139,2,1),(78,140,7,1),(79,140,2,1),(80,141,7,1),(81,141,2,1),(82,142,7,1),(83,142,2,1),(84,143,7,1),(85,143,2,1),(86,144,7,1),(87,144,2,1),(88,145,7,1),(89,145,2,1),(90,146,7,1),(91,146,2,1),(92,149,7,1),(93,149,2,1),(94,150,7,1),(95,150,2,1),(96,151,7,1),(97,151,2,1),(98,151,3,1),(99,152,7,1),(100,152,2,1),(101,153,7,1),(102,153,2,1);
/*!40000 ALTER TABLE `user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `new_user_req` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `unique_user_name` (`user_name`),
  KEY `role_constraint` (`role`),
  CONSTRAINT `role_constraint` FOREIGN KEY (`role`) REFERENCES `roles` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Fahad Ibrahim','fib','123456','','web','fahad@gmail.com','030045788888','1993-11-29',1,'uploads/file_1706879972138_.png',3,NULL,NULL,0),(76,'Waleed Ibrahim','wib','123456','aefg','web','test342@gmail.com','030045788888',NULL,0,'uploads/file_1703515972023_.jpg',3,NULL,NULL,0),(83,'Jillani','tuqeer','123456','','','meerasads636@gmail.com','302232952',NULL,0,NULL,1,NULL,NULL,0),(84,'ali','has','123456','Dummy Token','android','','',NULL,0,NULL,NULL,'2023-12-30 14:39:06',1,0),(85,'umer','UMER','123456','','','umer123@gmail.com','09836353533','2023-10-12',0,'ejdnejdn',2,NULL,NULL,0),(86,'Ahmad Mustafah','ahmad','123456','Dummy Token','android','ahmad@gmail.com','',NULL,0,NULL,NULL,'2023-12-30 14:41:24',1,0),(87,'Ahmad Mustafah','Ll','123456','AND_44','Android','ahmad@gmail.com','',NULL,0,NULL,NULL,NULL,NULL,0),(88,'Ahmad Mustafah','Fah1','123456','','','ahmad@gmail.com','',NULL,0,NULL,NULL,NULL,NULL,0),(89,'Ahmad Mustafah','Uuuu','123456','AND_44','Android','ahmad@gmail.com','',NULL,0,NULL,NULL,NULL,NULL,0),(90,'Fahad ibrahim','fib1','123456','AND_44','Android','fahadibrahimbutt@gmail.com','',NULL,0,NULL,NULL,NULL,NULL,0),(91,'Asad Butt','asad1','123456','AND_44','Android','asad1@gmail.com','',NULL,0,NULL,NULL,NULL,NULL,0),(92,'Ahmad Mustafah','aliu','123456','AND_44','Android','ahmadmustafahbutt@gmail.com','',NULL,0,NULL,NULL,NULL,NULL,0),(93,'ali','hassan','123456','aefg','web','','',NULL,0,NULL,NULL,NULL,NULL,0),(94,'Shaban ','sahb','123456','AND_44','Android','ahmadbutt1404@gmail.com','',NULL,0,NULL,NULL,NULL,NULL,0),(95,'Fahad','ff1','123456','AND_44','Android','ff@gmail.com','',NULL,0,NULL,NULL,NULL,NULL,0),(96,'Shaban','shaban1','123456','AND_44','Android','sh@gma','',NULL,0,NULL,NULL,NULL,NULL,0),(97,'ali','ahmedAli','123456','aefg','web','','',NULL,0,NULL,NULL,NULL,NULL,0),(103,'hassan','ahmeh1','123456','aefg','web','','',NULL,0,NULL,1,NULL,NULL,0),(112,'hassan','A','123456','aefg','web','','',NULL,0,NULL,1,NULL,NULL,0),(113,'ali','ASAD','123456','aefg','web','fahad@gmai.com','030045788888',NULL,0,'uploads/file_1698845010110_.jpeg',1,NULL,NULL,0),(114,'ali','alibutt','qwerty','DUMMY TOKEN','android','alalalar11@gmail.com','',NULL,0,NULL,1,NULL,NULL,0),(115,'ahaha','dndjdjndn','qwerty','','','zkzkzar11@gmail.com','',NULL,0,NULL,1,NULL,NULL,0),(116,'Test User1','ts1','123456','','','asdfasdf@gmail.com','92112233','2023-11-15',NULL,'ht: /as/d/asdf',1,NULL,NULL,0),(117,'ali','hassan1','123456','aefg','web','','',NULL,0,NULL,1,NULL,NULL,0),(118,'ali','hassan2','123456','aefg','web','','',NULL,0,NULL,1,NULL,NULL,0),(119,'ali','hassan3','123456','aefg','web','','',NULL,0,NULL,1,NULL,NULL,0),(120,'Ahmi','ali','qwerty','Dummy Token','ios','ali@gmail.com','',NULL,0,NULL,1,NULL,NULL,0),(121,'abdul wahab','abdultest','123456','Dummy Token','ios','haji19216811@gmail.com','',NULL,0,NULL,1,NULL,NULL,0),(122,'Saqib Syed','saqib1','123456','Dummy Token','ios','saqib@gmail.com','',NULL,0,NULL,1,NULL,NULL,0),(123,'ali','hassan38','123456','aefg','web','','',NULL,0,NULL,1,NULL,NULL,0),(124,'test','test123','123','test','web','test@gmail.com','',NULL,0,NULL,1,NULL,NULL,0),(125,'test9','test9','123','test','web','test@gmail.com','',NULL,0,'uploads/file_1703604104729_.png',1,NULL,NULL,0),(126,'Saqib Syed','saqib123','12345','test','web','saqib123@gmail.com','',NULL,0,'uploads/file_1703719076106_.webp',1,NULL,NULL,0),(127,'Cncjf gigig','appless','Apple123','Dummy Token','ios','bradbach76@icloud.com','',NULL,0,NULL,1,NULL,NULL,0),(128,'M ibrahim','mib','123456','Dummy Token','android','mib@yopmail.com','',NULL,0,NULL,1,NULL,NULL,0),(129,'Muhammad Abdullah','Abdullah10','mabDullah@5775','Dummy Token','android','abdullahbutt695@gmail.com','03009465775',NULL,0,NULL,1,NULL,NULL,0),(130,'Ahmi','ahmadbu','1234567','Dummy Token','android','ahmadmustafahbutt@gmail.com','',NULL,0,NULL,1,'2023-12-30 13:44:17',1,0),(131,'Ahabab','alibuttaa','123456','Dummy Token','android','ahmadmustafahbutt@gmail.com','',NULL,0,NULL,1,'2023-12-30 14:12:01',1,0),(132,'Ahmad Mustafah','fibb','123456','Dummy Token','android','ahmadmustafahbutt@gmail.com','',NULL,0,NULL,1,'2023-12-30 14:20:52',1,0),(133,'Shsbs','fin','123456','Dummy Token','android','ahmadmustafahbutt@gmail.com','',NULL,0,NULL,1,'2023-12-30 14:36:53',1,0),(134,'Aaaaa','hhh','123456','Dummy Token','android','ahmadmustafahbutt@gmail.com','',NULL,0,NULL,1,'2023-12-30 15:09:13',1,0),(135,'Aaaaa','ggg','123456','Dummy Token','android','ahmadmustafahbutt@gmail.com','',NULL,0,NULL,1,NULL,NULL,0),(136,'asad','as1','1234567','test','web','meerasas636q@gmail.com','',NULL,0,NULL,1,NULL,NULL,0),(137,'ali','ha','123456','aefg','web','','',NULL,0,NULL,1,NULL,NULL,0),(138,'h','meerasas636q@gmail.com','hallo','test','web','meerasas636q@gmail.com','',NULL,0,NULL,1,NULL,NULL,0),(139,'ali','testing','123456','aefg','web','','',NULL,0,NULL,1,NULL,NULL,0),(140,'ali','testing1','123456','aefg','web','','',NULL,0,NULL,1,NULL,NULL,1),(141,'ali','testing2','123456','aefg','web','','',NULL,0,NULL,1,NULL,NULL,1),(142,'ali','testing3','123456','aefg','web','','',NULL,0,NULL,1,NULL,NULL,1),(143,'testing','test','12345678','test','web','meerasads636@gmail.com','',NULL,0,NULL,1,NULL,NULL,0),(144,'ali','testing4','123456','aefg','web','','',NULL,0,NULL,1,NULL,NULL,0),(145,'ali','testing5','123456','aefg','web','','',NULL,0,'uploads/file_1706879326414_.png',1,NULL,NULL,0),(146,'h','meerasads636@gmail.com','1234567','test','web','meerasads636@gmail.com','',NULL,0,NULL,1,NULL,NULL,0),(148,'trigger','tri','tri1234567',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(149,'Saqib','saqib999','123456','test','web','saqibsyed1014@gmail.com','',NULL,0,NULL,1,NULL,NULL,0),(151,'Ahmad Mustafah','amb','123456','DUMMY TOKEN','android','ahmadmustafahbutt@gmail.com','',NULL,0,NULL,1,NULL,NULL,0),(152,'ali','fib10','123456','aefg','web','','',NULL,0,NULL,1,NULL,NULL,1),(153,'Asad','asd','123456','DUMMY TOKEN','android','ahmadmustafahbutt@gmail.com','',NULL,0,NULL,1,NULL,NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`thundertechsol`@`localhost`*/ /*!50003 TRIGGER add_user_details AFTER INSERT ON users
FOR EACH ROW
BEGIN
    INSERT INTO user_details (user_id, flags)
    VALUES (NEW.id, 1);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-15 12:57:28
