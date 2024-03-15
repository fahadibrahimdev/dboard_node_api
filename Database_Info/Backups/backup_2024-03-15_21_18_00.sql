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
