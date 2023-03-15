CREATE DATABASE  IF NOT EXISTS `university_2023_caso_mongodb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `university_2023_caso_mongodb`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: university_2023_caso_mongodb
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `advisor`
--

DROP TABLE IF EXISTS `advisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advisor` (
  `s_ID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `i_ID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `i_ID` (`i_ID`),
  KEY `s_ID` (`s_ID`),
  CONSTRAINT `advisor_ibfk_2` FOREIGN KEY (`s_ID`) REFERENCES `student` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `advisor_ibfk_3` FOREIGN KEY (`i_ID`) REFERENCES `instructor` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advisor`
--

LOCK TABLES `advisor` WRITE;
/*!40000 ALTER TABLE `advisor` DISABLE KEYS */;
INSERT INTO `advisor` VALUES ('00128','45565'),('12345','10101'),('23121','76543'),('44553','22222'),('45678','22222'),('76543','45565'),('76653','98345'),('98765','98345'),('98988','76766');
/*!40000 ALTER TABLE `advisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classroom`
--

DROP TABLE IF EXISTS `classroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classroom` (
  `building` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_number` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` decimal(4,0) DEFAULT NULL,
  PRIMARY KEY (`building`,`room_number`),
  CONSTRAINT `classroom_ibfk_1` FOREIGN KEY (`building`) REFERENCES `department` (`building`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `classroom_ibfk_2` FOREIGN KEY (`building`) REFERENCES `department` (`building`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classroom`
--

LOCK TABLES `classroom` WRITE;
/*!40000 ALTER TABLE `classroom` DISABLE KEYS */;
INSERT INTO `classroom` VALUES ('Packard','101',500),('Painter','514',10),('Taylor','3128',70),('Watson','100',30),('Watson','120',50);
/*!40000 ALTER TABLE `classroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dept_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credits` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `dept_name` (`dept_name`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('BIO-101','Intro. to Biology','Biology',4),('BIO-301','Genetics','Biology',4),('BIO-399','Computational Biology','Biology',3),('CS-101','Intro. to Computer Science','Comp. Sci.',4),('CS-190','Game Design','Comp. Sci.',4),('CS-315','Robotics','Comp. Sci.',3),('CS-319','Image Processing','Comp. Sci.',3),('CS-347','Database System Concepts','Comp. Sci.',3),('EE-181','Intro. to Digital Systems','Elec. Eng.',3),('FIN-201','Investment Banking','Finance',3),('HIS-351','World History','History',3),('MU-199','Music Video Production','Music',3),('PHY-101','Physical Principles','Physics',4);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `dept_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `building` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `budget` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`dept_name`),
  KEY `building` (`building`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('Biology','Watson',90000.00),('Comp. Sci.','Taylor',100000.00),('Elec. Eng.','Taylor',85000.00),('Finance','Painter',120000.00),('History','Painter',50000.00),('Music','Packard',80000.00),('Physics','Watson',70000.00);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `field` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_json` json NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor` (
  `ID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dept_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` decimal(8,2) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `dept_name` (`dept_name`),
  CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES ('10101','Srinivasan','Comp. Sci.',65000.00,0),('12121','Wu','Finance',90000.00,1),('15151','Mozart','Music',40000.00,0),('22222','Einstein','Physics',95000.00,0),('32343','El Said','History',60000.00,1),('33456','Gold','Physics',87000.00,0),('45565','Katz','Comp. Sci.',75000.00,1),('58583','Califieri','History',62000.00,1),('76543','Singh','Finance',80000.00,0),('76766','Crick','Biology',72000.00,0),('83821','Brandt','Comp. Sci.',92000.00,1),('98345','Kim','Elec. Eng.',80000.00,1);
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mongodb_objects`
--

DROP TABLE IF EXISTS `mongodb_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mongodb_objects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `object_mongodb` json NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mongodb_objects`
--

LOCK TABLES `mongodb_objects` WRITE;
/*!40000 ALTER TABLE `mongodb_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `mongodb_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mytables`
--

DROP TABLE IF EXISTS `mytables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mytables` (
  `id` int NOT NULL AUTO_INCREMENT,
  `myvalues` json NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mytables`
--

LOCK TABLES `mytables` WRITE;
/*!40000 ALTER TABLE `mytables` DISABLE KEYS */;
/*!40000 ALTER TABLE `mytables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prereq`
--

DROP TABLE IF EXISTS `prereq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prereq` (
  `course_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prereq_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`course_id`,`prereq_id`),
  KEY `prereq_id` (`prereq_id`),
  CONSTRAINT `prereq_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `prereq_ibfk_2` FOREIGN KEY (`prereq_id`) REFERENCES `course` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prereq`
--

LOCK TABLES `prereq` WRITE;
/*!40000 ALTER TABLE `prereq` DISABLE KEYS */;
INSERT INTO `prereq` VALUES ('BIO-301','BIO-101'),('BIO-399','BIO-101'),('CS-190','CS-101'),('CS-315','CS-101'),('CS-319','CS-101'),('CS-347','CS-101'),('EE-181','PHY-101');
/*!40000 ALTER TABLE `prereq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!50001 DROP VIEW IF EXISTS `relations`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `relations` AS SELECT 
 1 AS `ID`,
 1 AS `FOR_NAME`,
 1 AS `REF_NAME`,
 1 AS `N_COLS`,
 1 AS `TYPE`,
 1 AS `FOR_COL_NAME`,
 1 AS `REF_COL_NAME`,
 1 AS `POS`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section` (
  `course_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sec_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` decimal(4,0) NOT NULL,
  `building` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_number` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_slot_id` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`course_id`,`sec_id`,`semester`,`year`,`building`,`room_number`,`time_slot_id`),
  KEY `building` (`building`,`room_number`),
  KEY `time_slot_id` (`time_slot_id`),
  CONSTRAINT `section_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `section_ibfk_2` FOREIGN KEY (`building`, `room_number`) REFERENCES `classroom` (`building`, `room_number`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `section_ibfk_3` FOREIGN KEY (`time_slot_id`) REFERENCES `time_slot` (`time_slot_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES ('BIO-101','1','Summer',2017,'Packard','101','A'),('BIO-301','1','Summer',2018,'Painter','514','A'),('CS-190','1','Spring',2017,'Taylor','3128','A'),('CS-347','1','Fall',2017,'Taylor','3128','A'),('PHY-101','1','Fall',2017,'Watson','100','A'),('BIO-101','1','Summer',2017,'Painter','514','B'),('CS-319','1','Spring',2018,'Watson','100','B'),('FIN-201','1','Spring',2018,'Packard','101','B'),('CS-319','2','Spring',2018,'Taylor','3128','C'),('EE-181','1','Spring',2017,'Taylor','3128','C'),('HIS-351','1','Spring',2018,'Painter','514','C'),('CS-315','1','Spring',2018,'Watson','120','D'),('MU-199','1','Spring',2018,'Packard','101','D'),('CS-190','2','Spring',2017,'Taylor','3128','E'),('CS-101','1','Spring',2018,'Packard','101','F'),('CS-101','1','Fall',2017,'Packard','101','H');
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `ID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dept_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tot_cred` decimal(3,0) DEFAULT NULL,
  `picture` longblob NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `dept_name` (`dept_name`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('00128','Zhang','Comp. Sci.',102,''),('12345','Shankar','Comp. Sci.',32,''),('19991','Brandt','History',80,''),('23121','Chavez','Finance',110,''),('44553','Peltier','Physics',56,''),('45678','Levy','Physics',46,''),('54321','Williams','Comp. Sci.',54,''),('55739','Sanchez','Music',38,''),('70557','Snow','Physics',56,''),('76543','Brown','Comp. Sci.',58,''),('76653','Aoi','Elec. Eng.',60,''),('98765','Bourikas','Elec. Eng.',98,''),('98988','Tanaka','Biology',120,'');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_image`
--

DROP TABLE IF EXISTS `student_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_image` (
  `ID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dept_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tot_cred` decimal(3,0) DEFAULT NULL,
  `picture` longblob NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `dept_name` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_image`
--

LOCK TABLES `student_image` WRITE;
/*!40000 ALTER TABLE `student_image` DISABLE KEYS */;
INSERT INTO `student_image` VALUES ('00128','Zhang','Comp. Sci.',102,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0H\0H\0\0ÿ\á\0€Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0J\0\0\0\0\0\0\0R(\0\0\0\0\0\0\0‡i\0\0\0\0\0\0\0Z\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0\0 \0\0\0\0\0\0\0H \0\0\0\0\0\0\0H\0\0\0\0ÿ\í\08Photoshop 3.0\08BIM\0\0\0\0\0\08BIM%\0\0\0\0\0\ÔŒÙ\0²\é€	˜\ìøB~ÿ\â ICC_PROFILE\0\0\0lcms0\0\0mntrRGB XYZ \İ\0\0\0\0\0\0&acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\08cprt\0\0@\0\0\0Nwtpt\0\0\0\0\0chad\0\0¤\0\0\0,rXYZ\0\0\Ğ\0\0\0bXYZ\0\0\ä\0\0\0gXYZ\0\0ø\0\0\0rTRC\0\0\0\0\0 gTRC\0\0,\0\0\0 bTRC\0\0L\0\0\0 chrm\0\0l\0\0\0$mluc\0\0\0\0\0\0\0\0\0\0enUS\0\0\0\0\0\0\0s\0R\0G\0B\0 \0b\0u\0i\0l\0t\0-\0i\0n\0\0mluc\0\0\0\0\0\0\0\0\0\0enUS\0\0\02\0\0\0\0N\0o\0 \0c\0o\0p\0y\0r\0i\0g\0h\0t\0,\0 \0u\0s\0e\0 \0f\0r\0e\0e\0l\0y\0\0\0\0XYZ \0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-sf32\0\0\0\0\0J\0\0\ãÿÿó*\0\0›\0\0ı‡ÿÿû¢ÿÿı£\0\0\Ø\0\0À”XYZ \0\0\0\0\0\0o”\0\08\î\0\0XYZ \0\0\0\0\0\0$\0\0ƒ\0\0¶¾XYZ \0\0\0\0\0\0b¥\0\0·\0\0\Şpara\0\0\0\0\0\0\0\0ff\0\0ò§\0\0\rY\0\0\Ğ\0\0\n[para\0\0\0\0\0\0\0\0ff\0\0ò§\0\0\rY\0\0\Ğ\0\0\n[para\0\0\0\0\0\0\0\0ff\0\0ò§\0\0\rY\0\0\Ğ\0\0\n[chrm\0\0\0\0\0\0\0\0\0£\×\0\0T{\0\0L\Í\0\0™š\0\0&f\0\0\\ÿÀ\0\0H\0H\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùúÿ\Ä\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3Rğbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿ\Û\0C\0	\Z!\Z\"$\"$ÿ\Û\0Cÿ\İ\0\0	ÿ\Ú\0\0\0?\0\çu\ÈÔ£q´®\í¼õ\à*Ìş\"–F\ÈO1X/\á^\\c\îË—½cK›6_¼o[#\è\ÄQ`¢19¼r?Ú¬\Ú\Ö\å_K,>zkw²¤\ç\Éû2ŒŒ\Üık:\â\í\"ñ4°I\Ö[Pq\Ô\ÔÛ¨\Ó\è\r8–\á¥T	\Æ~kUMsZÕ“@ğÆ™5õ\ân’\à \ÂÇŒm\Ş\Ç\îõ?_Îª0”\ÉD\é¼9\ZZ\Û_\åY\'\Ìjz±8rš7\Ã/Š­v÷i¤\Åh:4s\İ\í\r\î\æ\äu\Ï£¢¿˜h\ïª;=Jo0\Æd\0IÕˆp:W;¤hš¼şñ…º\Å~\Ñ\í¥\r¹fC\è{\ãŸ\ë\Û9ºrE\Æqh<#7\Úô\é\ÙpwI&\â¼\à\î\Íix\0[\"\ív·™ ooJ™-FŸr?H‡\î\n1G \ç5_\ÆXº!0y\ã¥·Ş‡qá¿´-\"{­¾{*\ä¨ş§§\ĞÀşÎ°N\åH¸\ÏN*’Õ™\Í\İ#ÿ\Ğ\äua\åj°û¬‹Ú¨¼TB\ßXª¶\î•\ç\ÓW‰\ëM\ÚFôL>Xü\àØ¸Ü€|¤÷üsP\é1\îšä±—¯\âx¬šH\Ò\å\İb\"|ih¡ˆf·\rŸÎ¤ñJüW¦\ÊF\ì@€{‚jW\ÂÁnmü*\Õ5o^xûTƒO{\Ó&¥n#B…û:’\ç;{}kcÂ,‹Dš\æ\×\Éy¡,›‡\Ë#)\é\îpG\åC«h­lm\n1n\ë[ô7ÿ\0\á7ñ„¾	M~/Â“\ÊJ9;¼ƒÆ¸©ş x\ÜK¸Z\\‹Â‹0.3‚rs·8ü(Fõ\æ\ÓõU…[\æKñYµmpø\Ä7?fº‹Q–\ÚX\Ìd\ÄÏ¿©À\Ê\É\êkNÿ\0\ÆI¯‹k)Su\ÄP¤T\ác.¸]Àúrq\ëôªUt\îsÎ„T½\í=\'Áò‘ı£\0N\á\Éü¿•E\à\â\"¾\Õb?\Åp\ßS\ĞñJ¢\Ñ\é\êM\ã¿ğJ\Çn^\Õ\Æ)|Uµ¼<S\Ë\Än \ãó©¤µ*{‡‡%“\ì\Ñ	:˜bp3\Ç\İT^—~›£°Kl»ˆüh×¼c\Ğÿ\Ñóıjv[«s\'\Î\ÒI³q\ì7GÒ“\ÄH\rİ¤\Ìx©?‹Š\à†\Ìõj]4uZ20X§pAƒNqOƒP‚4\É<QÅ\Ò;vô¬un\É\Z¶’»6\Ú¾\×\íK”b?ñÖ®VñÌŞ™ô”1\ÉÄ³.O ¨;?\Z\è†´–\Ö9e£§q«Xi÷·\Ñi³]9\îãµŸ\Ì’p¹R;v\Ç\ãŠğ\İ[P¿¾Ô¥¹º¾’Y\Ãnó¤‘ó•û¹ö\ÆJ\Ûû=¨\êõ2ci]-LŸ\Ä~8´\×úF‹&ª‰öu\ÔÍ©22ÿ\0xZË³ø‹y?‚/®L°\Û\ê°…só·\Ï\Â8\Ï$s\îµÈ°õT¹9W©\é}r—\'2“·c²’M?\Ã/¤hò]\Çq¬jY\ï\åwal\r…‡e8`·Ö¼29$œ	\ç½{›‰™w•[xl2~÷\0qÚ»©\å\é\Æ\Òzel\Åóû«C\Öü8\Øñ.¦œ\0\Ó\ç\İV¼ÿ\0@\Öu-:x¥‚u[fùÁ2{ş´O/›VL˜f¿¼H\×M§È»·l\ŞEs±kI¨\Ù\É¡‚f\Ü\Ê3ò°öÿ\0\n\æxZ”ß¼¨\âi\ÕV‹=Â·\nt#\ÜYm\ä\n\Ïğ©)\áı\äÉ‚v½¸¬eñ¶?ÿ\Òó½MY\íU\Î	G‹õ\ÅCªJ\é§H3œ+\í†¸ µg«U\è/Š.fLZ³²„ˆ\Ùß§>ÕŸ\â+¿ôÛ?\å1p\Äûó^’„y\'Y\Ê\\«c\îœ1\ê@}G\ëZš·…|Oo¤\ßj÷š=Å¬6l8•JÊ±¸Nı\è†@.¤\í\'H\ŞU÷0Teo„Îœ\ïL\';\É\Èa\È\ãüóP\Â\ÎFx\ÏNGBx¦™Ÿ\ì\Én\êöp3¹’SŸ25\ä/l7\Ï÷F)+v³–w½ˆK\ÂF¶\ÅÌ™WS÷B®9“(²UŒùyP¤ ä“’}ñI¿\Í\Â+(r@ã¡«V¨÷,4Õˆ\á{dõÿ\0\Z¤\âYƒ\ä*¼{•.]#N\Â\è_<ğ?\Z\Ö%@¤rH\È\Ï\ëô«M\ÛR%£º=sAvO\Ød+\ç<døN\è\\x?\ËrKCrS=$:ğñT½V»\î¯´‚}ÿ\Óò\ÍI\ÒŠ‘¹A\ë\ïúRj¿òo÷Oş…\\°ø™\è\Ô~\ê3\îZšm\à–w3±9ö÷¨.ÿ\0\×\Ïÿ\0]¨¯^ƒ÷,xõW¾\Ïyğ—Æ<\'gk\âHo\îu%‹Ê»³#«€6\îùp¸a\Øù\áPÿ\0¨o¯ø\Ô<-9>c_¯UŒZ\ì&µkk¿¨»\èÿ\0h/d²\0®¨@*ŒM¤•Àw§[©“şü\ëof–‡3¨\å©J\Ú\Õ\Õd22‚Çı?•[o»\'ù\î(\åH\\Í•V\Ñ\Ï\Ûo\\¾_O×š’\ßı{ÿ\0¸h\åAv%Îª\é\Úf­]D?²u6u·$s)!‘—ª·\Êxö\ëÚº\ïÿ\0\Éğ\'ı…n¿ô)«Š5_´q\ìuÎšT”R6aoSÁ tÇ±¤¶ÿ\0\Çú\×r\Õgi\à9‰\ÑoóŸ´«†¢ğ7ü‚¯¿\ë²\è5\æc¾4zyÀ\Ïÿ\Ù'),('12345','Shankar','Comp. Sci.',32,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0H\0H\0\0ÿ\á\0€Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0J\0\0\0\0\0\0\0R(\0\0\0\0\0\0\0‡i\0\0\0\0\0\0\0Z\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0\0 \0\0\0\0\0\0\0H \0\0\0\0\0\0\0H\0\0\0\0ÿ\í\08Photoshop 3.0\08BIM\0\0\0\0\0\08BIM%\0\0\0\0\0\ÔŒÙ\0²\é€	˜\ìøB~ÿ\â ICC_PROFILE\0\0\0lcms0\0\0mntrRGB XYZ \Ş\0\0\0\0\04acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\08cprt\0\0@\0\0\0Nwtpt\0\0\0\0\0chad\0\0¤\0\0\0,rXYZ\0\0\Ğ\0\0\0bXYZ\0\0\ä\0\0\0gXYZ\0\0ø\0\0\0rTRC\0\0\0\0\0 gTRC\0\0,\0\0\0 bTRC\0\0L\0\0\0 chrm\0\0l\0\0\0$mluc\0\0\0\0\0\0\0\0\0\0enUS\0\0\0\0\0\0\0s\0R\0G\0B\0 \0b\0u\0i\0l\0t\0-\0i\0n\0\0mluc\0\0\0\0\0\0\0\0\0\0enUS\0\0\02\0\0\0\0N\0o\0 \0c\0o\0p\0y\0r\0i\0g\0h\0t\0,\0 \0u\0s\0e\0 \0f\0r\0e\0e\0l\0y\0\0\0\0XYZ \0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-sf32\0\0\0\0\0J\0\0\ãÿÿó*\0\0›\0\0ı‡ÿÿû¢ÿÿı£\0\0\Ø\0\0À”XYZ \0\0\0\0\0\0o”\0\08\î\0\0XYZ \0\0\0\0\0\0$\0\0ƒ\0\0¶¾XYZ \0\0\0\0\0\0b¥\0\0·\0\0\Şpara\0\0\0\0\0\0\0\0ff\0\0ò§\0\0\rY\0\0\Ğ\0\0\n[para\0\0\0\0\0\0\0\0ff\0\0ò§\0\0\rY\0\0\Ğ\0\0\n[para\0\0\0\0\0\0\0\0ff\0\0ò§\0\0\rY\0\0\Ğ\0\0\n[chrm\0\0\0\0\0\0\0\0\0£\×\0\0T{\0\0L\Í\0\0™š\0\0&f\0\0\\ÿÀ\0\0H\0H\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùúÿ\Ä\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3Rğbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿ\Û\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿ\Û\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿ\İ\0\0	ÿ\Ú\0\0\0?\0\ëş(øt_\Ék›n\ïAppU?¿.>¦¼\Ã\â?ˆm¼C­¥Í‘‘­\Ò%wŒw$?*òh\Ò\Öò;›±\Ã\É;¹Â€\Ç#\Ğv¦Cˆ\äw#<š\î²\èb\Ûd¿fòT7.\ç¹\íP½\ÃJœ³c ÚI\ĞQ8‰\É$tâ©œK·\â*’A\ÌZ[³œ’NIª\ÈÊ½>jm!\\·\"y„?jj\Ê\Î@ô\è+\â8u g“‚qW\ã´i6pw\Ğu&¦\è¥’B<\Ûr\Ê@ûÇ’k©\Ñü4\ëi4³\0®c`23+	VI\Ø\Ú4[Gb\\$x-Ÿ—š-\Ó&¡k+€\ä|\Ç=ø­\çx¦e¤\Ò?ÿ\Ğ\à4ı?ûCTµµ\Ú8¶H\ìÀg\nµ\áé…·ˆ´ùg”\äwI	\èi}zWW%\Ñ\ÛO—š\Ì\Ç\Ô4ôµŒI	cm‡pük\Õ\ï4\İ6ø[E4+$*şh\ÇËœş}+›j\Í\ëQı\Ó\È#°¾+\Î\ÖqŠ÷¥\ÛK	\n€}qöÂ®§Œ.‘v\î‡>À\×m\â-	£“ÍW…sÔŒ¨«†%\È->¸±–,m™c·¯\å]\r\ÄS\Ùé¥¤ºóg}\ÔQ°§cõö®…6`\é£7EÑ¥¾ù )Áõ·¢Y\İ\\’\Ş3-ƒ€k)\Ö\Ö\×4…\è\èôŸ-©\\¨2wcTuoI¦¸¶P¤øÁ\É\èOL\ÖN3™­\á‡Wt¢\Ò\ÎY€©ô\Åy\î©>»ı‹<\Ó_Gqo\"r‡‘»”•\rw_M7F;µ;5\ÇRµ>€¡5u–E;bbO×¥wÕ—º\ìp\Ò^úlÿ\Ñ\Æ>‚\Ë_¶†D\rÀ®?zA\Ã~¸5±t\Zr~aÊŸC^lù\Ú\ĞíƒŠz“‰¤\á<\Ç$ ­b\éú€k÷\Ş\Ø%Ö¹¥‘Ôš“;kK\è\Ãr1Xrüªò.Y”ck›^\ËS§¼¹±{fól\Ç9¯0S¸\Õ.\ÌS\åcò\Ìq\Ål¨4¯rUX\Ş\Æú\Øh·¬ ‰\\¯,UrTMx\è«\Çf­|²)\ë\ÇB(p“Zš+s¶\Ót›h\">\\`)S4½n\ÛT·I­\Ûh=Tö¬¹\ì\ÊRV8mCAX¼Uq}\ä;f]\Ê\è3b?\n\êã¼‹û~[fe`\à:‘ùş}kª5\'de*q–\ç/w¢¬’¹K‰LŒ¬\0\Ç½9­jv\Ğj°Ø’t{\Ëv<ùV´T§«9q\rA%€\Õ4ÿ\0³±X,‰\éü_şº\×\Ô\Î\ÆN}\Ó\×>\Ç\ëúVœ­=\ãV-YŸÿ\Ò\Èı®Aı\Ñú\Ö5…\é¶ù\äv®^SnbmMZ\Îñ.\Ğp\Ş\Çÿ\0¯V\ä¸š	†U\Æ2)J)\èËŒ\Úz\Z6Z‰3\Ç)Š\æmg’\Âô[LH¾ö~ğõ®YP¶¨\ë…d÷;T\Ò-.)\Z4qxzZö‚\îÁ<—¯\Í\Ì\Ö\ì\è\ÑêˆŸ\Ã\ÖW„¡Ÿ\É$\åK\È\Çm­ÿ\0×¬{‹[M˜\Å$X‰\ãr\ä\Z\Ş	\Ú\é‘\'\Ün§\á\á¢*,w\ÒHÒ¶\Ó2t\ÎO°\éR]j0\ÚYıª[U…ÛŒ/;hœ›±›\åJì§£¥Å¤{z\â+k`N\æ<\ãÒ°5V\ãR‹\Ëa²\0~X\Çs\ê}kUFRø´0u\ã‡Q59Î¥s5Ì™/#g\é\è*¬¡O–\Ã\å<s]I(­II\ÉİŠşhq¨dQÀõ§ÿ\00Á8\äQd÷\Ïÿ\Óó\Åq\"\ä\Ã\ÔT6u«8nSg\Ì@a\ßÖ³ÿ\0\å—\áI¢“4onm\ï 2Œ\ÒÄƒŒP\î%!¦\ît\Z^¹s¤…\åóPŒ€Ì£\ÜV<¿òõ\ÄV>\Êz£¡Ô”‡kt÷]’H£\×p\äW˜7ú÷úšŸaØ¥^v¹\×\ë÷¯ª¢]B¥l\Õ\Ìc#›\ÍB?\äPş¾ş‚kZpPvFS›š»1A\àc=h_õc\ë[\ì@y\ã®E8©5Hğ\\o„e¸ª­¯ú£ş\éşt˜\Ñÿ\Ù'),('19991','Brandt','History',80,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0H\0H\0\0ÿ\á\0ŒExif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0J\0\0\0\0\0\0\0R(\0\0\0\0\0\0\0‡i\0\0\0\0\0\0\0Z\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0H \0\0\0\0\0\0\0H\0\0\0\0ÿ\í\08Photoshop 3.0\08BIM\0\0\0\0\0\08BIM%\0\0\0\0\0\ÔŒÙ\0²\é€	˜\ìøB~ÿÀ\0\0H\0H\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùúÿ\Ä\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3Rğbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿ\Û\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿ\Û\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿ\İ\0\0	ÿ\Ú\0\0\0?\0œs “]“\ÛCO\"\Äc5\ç{U\Ñ\rc\î\ì¢q¾Y•;¾•\Ø\ÛG\Ô)3\ÄzbŸ¶ò±ÜºI—’Jd©\ÇÒ¦ñ®±>™¡\İ\Çm\É\å+N8Û»«p3Ui\ËD\\qr—\Ù3e¹±Š_)\î!Y?º\\f¼¼[I\æ\î•İ™»k«\Ùy–\ëù•u©YÙ…\ß b\İ9?Z\å¬tK÷Y£X\Ã \ífü?Æš¤º±:\ï¢;+»{\ä\ß\î¨#}EröZÍ…òN–p\Ê!‡qÁ¨•±.’;ûr\0•?:«€\Ã#8#}j#7\Z5pŒµ.µ«±\Ê\àƒ\ïHhnü¨n/t\n\ë¨É­Œq’ÇŸJ‘Q®%\n\Ç4´z$;µ«gÿ\Ğô;X\î\î\"“u»S·º‘°6\àÃ“\\\Ë\r\Zm\İ+ŒjR\Ü\ìkB‘§S‘\Ílø¢óR´\Ğ.gĞ¾\Ìú„`4qN¤‰\0<¨Á‘\Ó\'ªú¼\éE«X\â|a¤ı«\É\Z‰0[ÃºQó¼ô\äö5\å+ñ·ˆ|Cs:¬Q†€\"KI Q’	\Èc’z}*\éS=Š4´F\Ó\ëzNœ\niöª\ì:²Œÿ\0<š?]Ei÷\nU@\r\'EAš~\Ú(\èXi½JxşbLqF‡³’?:\ì´\r¦H¥\Óx~\ëH\á\Ã}0j^!.…\Ç\n\ßS“³ñ&©oŒÊ„´£\è·\Úu¨¶Y\Û$„d3H«Ÿ \Ç5?Xò+\ê\Ù\ÎYø\æ\É_\í¶|‚«\n/øv«º\æ•Ï´ÿ\0´[‡G³w\Ú:F\0üz®\Ö\Æs¤\á³7|5ªb)e6/*p!\\Ú®\Ø/’¡B…AÀ ­\"È’*\Ï/ğ¿/9¢õ¿Ò‰S\ÍsN\ÊGD~ÿ\Ñİ›Qº¢\\Ë–ë†¨‘˜õÊ•\ÏA¤\Ç=\Ì\ÏWšB}\Zd\ß|Ğ›ad‹CO·\×,|›\Ûe¹x\äWYü\Ñ`˜}z~5­\ÍÍœ¢\â\İö° Œ‚=\ÅMµÑ—u\Ëf¶\ëM¶¿VTB 7AUc•\î\ìm§s‡töñ\Ïÿ\0®¢Z6:>§\Ï_%/\İ!böWÿ\0­L\Zcˆ12\Ï;„‡\×9ˆ\Å¹w-¾“¦\\js$.ù+»ƒøUg\Óşk;\r¿p9c1(j\Å7¥‰5¥†\Ú,\"\ìjÀt\0\ä\Ö~«?™v\"V\Ê\Ä1ÿ\0=¥T0“¯·ª8Ïµk¯s7aD›d\Üü\ÒN¸\íPÔ¢\î]\ÓV?ÿ\Ò\ÚOõ\ÍMeHY{\×\ÕXô¬=ğg\0\Õõ+[YX\Ïp›Óª“T£.„¹%»4XŒ\é\\f©\âYo#{x—Ê‰²§x­ThK©2­±\ê³øz\ÙÕ¶¸İµ½FO\éY^ñm–¹¤\Çe‘¡l%¸$\Ë\ê½>\ê*E­Ë§4ö#›Sñ=„ò*\ÚGyn\Ç\å\Ø\0`?\Z\ÜwQ\Ç²R4pW¹Šnõ\é\àg»\Ù\Û ÈH.\Üğ8\è(ñL\×\Ğør\ê\ãMn\'„	J7ñ\"œ¸ø\Î*\ãyh‰•£«*†ù³Xš&»±VŠxğ%…ú¯¡÷Ö­\Ş;­-…««R\çK`\ä,\É\'ËŠ®[ƒR\æ\Ø\ÔR?ÿÓ¯\â-fKl[[LclfGL€g¥bx‹şB—\ï\åJ8ò\Ş\ÇMi\ÉJ\Æ,\×s£™C@ä£Ÿ½ø\ÔR}\ÖúV\Æ‘®P\ÈJœ\èJ¤?\Ö\Û\èbOCoHµûuÏ“j\ïo©‰¶·H\Ç „Ç®{d\ç#\"­x3şF›?©şF“Z™­Q\èñ \Ô.¿±5µ6:\Êd]¢b=3ß¾;Fk\Õ?\ä·\Øÿ\0\×\êè–®z”ak›Â¬Z‹Ocp<÷Š¿\'QõşµŒbe6ÏŸ¼SŸª\\^i05²Z\êF\Å<®\Å\åı v\0\â“\Ä\ßò\Ôÿ\0\ì=\'ò®µğ£•üNÆ•\â_=\Ò¥ù\Éd^ÿ\0Q\\Ö™ÿ\0°¾¿Î¢t£kØºue{Š\ÒñŒ\Ô\'­s¨£¥¶ÿ\Ù'),('23121','Chavez','Finance',110,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0H\0H\0\0ÿ\á\0€Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0J\0\0\0\0\0\0\0R(\0\0\0\0\0\0\0‡i\0\0\0\0\0\0\0Z\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0\0 \0\0\0\0\0\0\0H \0\0\0\0\0\0\0H\0\0\0\0ÿ\í\08Photoshop 3.0\08BIM\0\0\0\0\0\08BIM%\0\0\0\0\0\ÔŒÙ\0²\é€	˜\ìøB~ÿ\â ICC_PROFILE\0\0\0lcms0\0\0mntrRGB XYZ \Ş\0\0\0\0\0\'acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\08cprt\0\0@\0\0\0Nwtpt\0\0\0\0\0chad\0\0¤\0\0\0,rXYZ\0\0\Ğ\0\0\0bXYZ\0\0\ä\0\0\0gXYZ\0\0ø\0\0\0rTRC\0\0\0\0\0 gTRC\0\0,\0\0\0 bTRC\0\0L\0\0\0 chrm\0\0l\0\0\0$mluc\0\0\0\0\0\0\0\0\0\0enUS\0\0\0\0\0\0\0s\0R\0G\0B\0 \0b\0u\0i\0l\0t\0-\0i\0n\0\0mluc\0\0\0\0\0\0\0\0\0\0enUS\0\0\02\0\0\0\0N\0o\0 \0c\0o\0p\0y\0r\0i\0g\0h\0t\0,\0 \0u\0s\0e\0 \0f\0r\0e\0e\0l\0y\0\0\0\0XYZ \0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-sf32\0\0\0\0\0J\0\0\ãÿÿó*\0\0›\0\0ı‡ÿÿû¢ÿÿı£\0\0\Ø\0\0À”XYZ \0\0\0\0\0\0o”\0\08\î\0\0XYZ \0\0\0\0\0\0$\0\0ƒ\0\0¶¾XYZ \0\0\0\0\0\0b¥\0\0·\0\0\Şpara\0\0\0\0\0\0\0\0ff\0\0ò§\0\0\rY\0\0\Ğ\0\0\n[para\0\0\0\0\0\0\0\0ff\0\0ò§\0\0\rY\0\0\Ğ\0\0\n[para\0\0\0\0\0\0\0\0ff\0\0ò§\0\0\rY\0\0\Ğ\0\0\n[chrm\0\0\0\0\0\0\0\0\0£\×\0\0T{\0\0L\Í\0\0™š\0\0&f\0\0\\ÿÀ\0\0H\0H\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùúÿ\Ä\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3Rğbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿ\Û\0C\0	\Z!\Z\"$\"$ÿ\Û\0Cÿ\İ\0\0	ÿ\Ú\0\0\0?\0Ş†Û\ÅnEk\í\\&ö3cµ\é[q\Û\0:P2E¨ô®Gã‡fğ›m§\éeF«~¤„gÈ‰x/\ä’\0SÚ´§JUºD\ç-K\Ş4ñ>‡\áKU—U¹kŒ\Åm2\Éô_Os\Å|\É4—z•ô—73Ous)\Ë\É+—vú“üº\Õ\Õ$W\Ä\Îw^O\áG¢\ê¿õ9¥e\ÒôkKx¿…®¤\ÄÖ¸«/\ê·}\ÆYr…sW\ËB;\Ø9kË£:½7\âÎ¶·+öû;9¢\Ï\"4(qùš\Æÿ\0„#\ÄBT\Ù3\åˆ\nÔ¿«µĞ¥Kº3Ü´[\ë-sJ‹Q\Ó\ß|RA£ª}\Åy\çÂ­Iü3­\Şh!\ìõ+\"\ÍÀ.8ú\å\\õ)%¬5F©µ¤´g£Om\ÇJÙš\Ü2n\\FA¬\n9[›~¼V½İ·ŠjB±ÿ\Ğõ…´\Çj\İû0ô®+\Ü\Æ\ŞÕ²m\è°\\ù3ö¤\Ü>\"\ÛG\ÎM‹\0ô\åŞ·ÿ\0jM:+ˆº\"\Ç:»½ƒ$ñƒóE‰2‡Œÿ\0\ß5Û†šŒ]\ÎzÔœŞ‡™xr\Äm%¹&µ\"[ˆeh´\ÛU“\É]\Ò;¸DA\îÆ¢S”ö:©S5±\ë4\åkeV_\âº\n\Äøe\ãY\íu˜t\İ[MˆE;I\à˜:ƒ\Ø\Zó«Òš\Ôõ(Wƒ÷V\ç½i–Qò\Ñ\Ö.¹¯Ë¢\Â×¶zuŞ©!À[x\0O®O\0{š\æŒy‘¤—8\Ï\ÚKÁp\ê^¸\Ö-\à_µ\é\Ã\Í;W&H¿O¯şÕŸ/ˆô¹ô½KD\Ôti\ï-¤X’\í¬Ÿ)Ê‡RËœsŒú\×E)ÊŒ\×cšµ8×ƒL\ãş\Í&¡ğ\ãGšV\Ş\é’Íœ\î\ØJ\ç\ë\ÇJ\ÕøS¡ÿ\0bü7\Ñ,X\æO³	¥>®ÿ\03~¦º«4\æ\ìyRQJD·vü+R\ê¼VeXÿ\Ñú$\Â=*óGXrš\\\Îh½±W)4\Í‰ºø™=¬–Ì¢\Ö\Â9G{ƒ÷}G<û\×wû@\è\Ö\ëie\â2\Î$‡u¤Š\ÊQù÷\àÖ¡\İt¦šHñ¡\á›}kNn+\à\ÌZ·¼=º\ÈcšEU\r\Ï„\ç(lwBœ\'º1¾%\İ[\r*\Ö\Ş š\Æ5Š9 \Ë ?\Ş5\ÄxN³\â¨m´wK¼¦\È\áCŸœ­\íZQwNR3®’´`o\Òô[xCÃ³]\Ü\ÍQ47G»ûpvIªH\äw\ïW¼&£•\äZ|N‘\0«nH\É‚¸#¶#¯=+‘Ë–W‰\Ğ\ãx\êt\è\Zmµ\ÅÔ¶±C2°•m\ã\'Œ¨\íŸj»t\É™,‡„$\ç\éC\Õ\Ü\Êüª\Ç2–‘\Û\ÚEo\Z…H£TP;\0\0«’¦;\âºR²<Ù¾i6c\Ü\Å×Š³p½h±\'ÿ\Òú”TYØ¢³­9ûÒ°\\\ã>.i2jÿ\0õKh¤š8¼ø\ÔX§Í\Ä^Yñ»\ã\İÖƒ\â9¼)\à»;+»\Ûw\İ\Ş\\ƒ$i!\ÆcDn#8,X\0x\ç©6®\n¢Œ¬xÖ›©Û£±’f08… Ş±¼o¦Im¨\Ëqd­öYº…\ä&y#\é\éDiÂ¢\Ü\ŞUªR\èv¶kK\ç\Õá¸¿6e‹;[….3Óœg5\Èø\Æ3è“ªÈ­,!²S<~UZ-e©¾J÷z3\ê6?\í¯ùÉ¨\êvY\\\Ä\×qF7L×‘¯Ä­kÄ–q\è>\Ón$½˜„\Î\ï•O©#;G_§½q<<\Öúr\ÅFOG‘\îgQkÇµÒ–_5\Ìjòº6F\Õ#q?Sø×Ÿ|6ñ¤ø\ÛQø{ª[I–5½\Îa»o)dò\ÔuŒ€\Ç\0ı\ìœ’Ã¸®m\ÎJ¸›·¡\ê3Št\ÇÒ¨\ç3\îƒN¸¤ÿ\Óõ\ï|køw\áDš;~\rJş<°i¬.&\İ\è\Ø;S\ê\Ä\nøg\Æ_òW<Gşóÿ\0\ìµj	‘)»\\õïˆŸ´wŒu\ã%¯†\Ñ<7`\Ã\Ól\×l=\Üü©ôPŞ¯?vº#J)\\\ç•Y[Nbº[Œ’\Êû\Éf\É\'9$“\ÎO9=òj¹ÿ\0V\ßCNÉ¦J“O˜÷\Ï\n\éö\ÚÅ¬i2‡XÀR*\×\Â\ïøó´ÿ\0€ÿ\0\è\"¼:\ÍÅ¶£ ùâ¹‡\è\ßl\áñ\0[½:\ËrÀ\íq\Õ‘¯M³ÿ\0´_\î\Ö~\Ú|»—\ì`\Æ\î\á\í+LDM3M·³…;cŒ/?…m\Úÿ\0ªo÷k+¹n6”]‘ò\ß\íMio¥üE\Ò5-=„\Z„ö\Æ\æg†Y\"‘<§úq\ë´u\Åµ·ü”}7şÁKÿ\0£\rzùz¼úV`\ï$\\ğ\íª[²\Ûx·LMB.Ÿk±9Wı\è\É\Ú\ßU ÿ\0³^#ÿ\0-t\ËN]×š>\Ìğ¿¼1\âÈ™´-^™TfKv\ÊMÿ\0j6\ÃÊ¾ı–?\ä¤k\ßõ\ïõ®\Z´”v;)Tr\Üÿ\Ù'),('44553','Peltier','Physics',56,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0H\0H\0\0ÿ\á\0€Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0J\0\0\0\0\0\0\0R(\0\0\0\0\0\0\0‡i\0\0\0\0\0\0\0Z\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0\0 \0\0\0\0\0\0\0H \0\0\0\0\0\0\0H\0\0\0\0ÿ\í\08Photoshop 3.0\08BIM\0\0\0\0\0\08BIM%\0\0\0\0\0\ÔŒÙ\0²\é€	˜\ìøB~ÿ\â ICC_PROFILE\0\0\0lcms0\0\0mntrRGB XYZ \Ş\0\0\0\0\0\'acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\08cprt\0\0@\0\0\0Nwtpt\0\0\0\0\0chad\0\0¤\0\0\0,rXYZ\0\0\Ğ\0\0\0bXYZ\0\0\ä\0\0\0gXYZ\0\0ø\0\0\0rTRC\0\0\0\0\0 gTRC\0\0,\0\0\0 bTRC\0\0L\0\0\0 chrm\0\0l\0\0\0$mluc\0\0\0\0\0\0\0\0\0\0enUS\0\0\0\0\0\0\0s\0R\0G\0B\0 \0b\0u\0i\0l\0t\0-\0i\0n\0\0mluc\0\0\0\0\0\0\0\0\0\0enUS\0\0\02\0\0\0\0N\0o\0 \0c\0o\0p\0y\0r\0i\0g\0h\0t\0,\0 \0u\0s\0e\0 \0f\0r\0e\0e\0l\0y\0\0\0\0XYZ \0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-sf32\0\0\0\0\0J\0\0\ãÿÿó*\0\0›\0\0ı‡ÿÿû¢ÿÿı£\0\0\Ø\0\0À”XYZ \0\0\0\0\0\0o”\0\08\î\0\0XYZ \0\0\0\0\0\0$\0\0ƒ\0\0¶¾XYZ \0\0\0\0\0\0b¥\0\0·\0\0\Şpara\0\0\0\0\0\0\0\0ff\0\0ò§\0\0\rY\0\0\Ğ\0\0\n[para\0\0\0\0\0\0\0\0ff\0\0ò§\0\0\rY\0\0\Ğ\0\0\n[para\0\0\0\0\0\0\0\0ff\0\0ò§\0\0\rY\0\0\Ğ\0\0\n[chrm\0\0\0\0\0\0\0\0\0£\×\0\0T{\0\0L\Í\0\0™š\0\0&f\0\0\\ÿÀ\0\0H\0H\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùúÿ\Ä\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3Rğbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿ\Û\0C\0	\Z!\Z\"$\"$ÿ\Û\0Cÿ\İ\0\0	ÿ\Ú\0\0\0?\0Ş†Û\ÅnEk\í\\&ö3cµ\é[q\Û\0:P2E¨ô®Gã‡fğ›m§\éeF«~¤„gÈ‰x/\ä’\0SÚ´§JUºD\ç-K\Ş4ñ>‡\áKU—U¹kŒ\Åm2\Éô_Os\Å|\É4—z•ô—73Ous)\Ë\É+—vú“üº\Õ\Õ$W\Ä\Îw^O\áG¢\ê¿õ9¥e\ÒôkKx¿…®¤\ÄÖ¸«/\ê·}\ÆYr…sW\ËB;\Ø9kË£:½7\âÎ¶·+öû;9¢\Ï\"4(qùš\Æÿ\0„#\ÄBT\Ù3\åˆ\nÔ¿«µĞ¥Kº3Ü´[\ë-sJ‹Q\Ó\ß|RA£ª}\Åy\çÂ­Iü3­\Şh!\ìõ+\"\ÍÀ.8ú\å\\õ)%¬5F©µ¤´g£Om\ÇJÙš\Ü2n\\FA¬\n9[›~¼V½İ·ŠjB±ÿ\Ğõ…´\Çj\İû0ô®+\Ü\Æ\ŞÕ²m\è°\\ù3ö¤\Ü>\"\ÛG\ÎM‹\0ô\åŞ·ÿ\0jM:+ˆº\"\Ç:»½ƒ$ñƒóE‰2‡Œÿ\0\ß5Û†šŒ]\ÎzÔœŞ‡™xr\Äm%¹&µ\"[ˆeh´\ÛU“\É]\Ò;¸DA\îÆ¢S”ö:©S5±\ë4\åkeV_\âº\n\Äøe\ãY\íu˜t\İ[MˆE;I\à˜:ƒ\Ø\Zó«Òš\Ôõ(Wƒ÷V\ç½i–Qò\Ñ\Ö.¹¯Ë¢\Â×¶zuŞ©!À[x\0O®O\0{š\æŒy‘¤—8\Ï\ÚKÁp\ê^¸\Ö-\à_µ\é\Ã\Í;W&H¿O¯şÕŸ/ˆô¹ô½KD\Ôti\ï-¤X’\í¬Ÿ)Ê‡RËœsŒú\×E)ÊŒ\×cšµ8×ƒL\ãş\Í&¡ğ\ãGšV\Ş\é’Íœ\î\ØJ\ç\ë\ÇJ\ÕøS¡ÿ\0bü7\Ñ,X\æO³	¥>®ÿ\03~¦º«4\æ\ìyRQJD·vü+R\ê¼VeXÿ\Ñú$\Â=*óGXrš\\\Îh½±W)4\Í‰ºø™=¬–Ì¢\Ö\Â9G{ƒ÷}G<û\×wû@\è\Ö\ëie\â2\Î$‡u¤Š\ÊQù÷\àÖ¡\İt¦šHñ¡\á›}kNn+\à\ÌZ·¼=º\ÈcšEU\r\Ï„\ç(lwBœ\'º1¾%\İ[\r*\Ö\Ş š\Æ5Š9 \Ë ?\Ş5\ÄxN³\â¨m´wK¼¦\È\áCŸœ­\íZQwNR3®’´`o\Òô[xCÃ³]\Ü\ÍQ47G»ûpvIªH\äw\ïW¼&£•\äZ|N‘\0«nH\É‚¸#¶#¯=+‘Ë–W‰\Ğ\ãx\êt\è\Zmµ\ÅÔ¶±C2°•m\ã\'Œ¨\íŸj»t\É™,‡„$\ç\éC\Õ\Ü\Êüª\Ç2–‘\Û\ÚEo\Z…H£TP;\0\0«’¦;\âºR²<Ù¾i6c\Ü\Å×Š³p½h±\'ÿ\Òú”TYØ¢³­9ûÒ°\\\ã>.i2jÿ\0õKh¤š8¼ø\ÔX§Í\Ä^Yñ»\ã\İÖƒ\â9¼)\à»;+»\Ûw\İ\Ş\\ƒ$i!\ÆcDn#8,X\0x\ç©6®\n¢Œ¬xÖ›©Û£±’f08… Ş±¼o¦Im¨\Ëqd­öYº…\ä&y#\é\éDiÂ¢\Ü\ŞUªR\èv¶kK\ç\Õá¸¿6e‹;[….3Óœg5\Èø\Æ3è“ªÈ­,!²S<~UZ-e©¾J÷z3\ê6?\í¯ùÉ¨\êvY\\\Ä\×qF7L×‘¯Ä­kÄ–q\è>\Ón$½˜„\Î\ï•O©#;G_§½q<<\Öúr\ÅFOG‘\îgQkÇµÒ–_5\Ìjòº6F\Õ#q?Sø×Ÿ|6ñ¤ø\ÛQø{ª[I–5½\Îa»o)dò\ÔuŒ€\Ç\0ı\ìœ’Ã¸®m\ÎJ¸›·¡\ê3Št\ÇÒ¨\ç3\îƒN¸¤ÿ\Óõ\ï|køw\áDš;~\rJş<°i¬.&\İ\è\Ø;S\ê\Ä\nøg\Æ_òW<Gşóÿ\0\ìµj	‘)»\\õïˆŸ´wŒu\ã%¯†\Ñ<7`\Ã\Ól\×l=\Üü©ôPŞ¯?vº#J)\\\ç•Y[Nbº[Œ’\Êû\Éf\É\'9$“\ÎO9=òj¹ÿ\0V\ßCNÉ¦J“O˜÷\Ï\n\éö\ÚÅ¬i2‡XÀR*\×\Â\ïøó´ÿ\0€ÿ\0\è\"¼:\ÍÅ¶£ ùâ¹‡\è\ßl\áñ\0[½:\ËrÀ\íq\Õ‘¯M³ÿ\0´_\î\Ö~\Ú|»—\ì`\Æ\î\á\í+LDM3M·³…;cŒ/?…m\Úÿ\0ªo÷k+¹n6”]‘ò\ß\íMio¥üE\Ò5-=„\Z„ö\Æ\æg†Y\"‘<§úq\ë´u\Åµ·ü”}7şÁKÿ\0£\rzùz¼úV`\ï$\\ğ\íª[²\Ûx·LMB.Ÿk±9Wı\è\É\Ú\ßU ÿ\0³^#ÿ\0-t\ËN]×š>\Ìğ¿¼1\âÈ™´-^™TfKv\ÊMÿ\0j6\ÃÊ¾ı–?\ä¤k\ßõ\ïõ®\Z´”v;)Tr\Üÿ\Ù'),('45678','Levy','Physics',46,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0H\0H\0\0ÿ\á\0ŒExif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0J\0\0\0\0\0\0\0R(\0\0\0\0\0\0\0‡i\0\0\0\0\0\0\0Z\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0H \0\0\0\0\0\0\0H\0\0\0\0ÿ\í\08Photoshop 3.0\08BIM\0\0\0\0\0\08BIM%\0\0\0\0\0\ÔŒÙ\0²\é€	˜\ìøB~ÿÀ\0\0H\0H\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùúÿ\Ä\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3Rğbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿ\Û\0C\0	\n\n			\n\n		\r\r\nÿ\Û\0C	ÿ\İ\0\0	ÿ\Ú\0\0\0?\0üª¢€\n(\0«VS\ßN°@…‰\É>À“@\ìW«3\Â\Ñˆ™TË‘\É§ò4ŠûX\ÍJ#\Ï$>õ±ui\îòC“ŒúPt}(\0¢€\n(ÿ\Ğüª¢€\n(\Ô~x=¼A\í\Â`K$±\Ù@\Æ=\ê†rG \×yû8x\Åw6š6²È°hú»-¼2³“™`„<¤®0\0E`¤ñ\Ç>^e\Zœš’ºW±\íe8bªE8»7k»{û$xk\ÅÖ¶ó[½ÕŒ[\"H\Ğ c+\âlı\ë\êÏ‡b\Ô\ìw\éºÅš†\Şt\nŞz\æ¾&†cM\ÉNVg\ßb2ü½\Ú2§¯\ë¡ğş½û\Û\èòM(ñl\æ%‰v+[.ZS\ÙŒw<\ä\×\Û\Ú\ï„õmRk…¼³‰QSš%]‡ô\êgy„_»7÷/ò\nyX\Õ\åMk\æÿ\0\Ìüªøğ\ÛRğ}ÑIc–\áXpBß¶k\Új\í9tO8\Ãwe$r\Ê!dI”È§¯\İ\Îk\é2|\Ï‹÷jkò±ó™\ŞQ\ÂAÎ–Ÿ;Ÿ-H¨¿p“ÀÏ±§MŒ…\È\ä>•ô»Ÿ\â\ÑPÿ\Ñüª¥\Çj\0J\\P\èw\ì}e¦øƒ\àN‰\Zys3\Åw‚\ès¹\ZX\Ø*ús€ı+\æ_\Ù\âˆ|\'ñw\Ãú=¦¹wo¤k7\Ëo}f®L7\ÆşQd\é•p˜a‚\Å|¶}—Tª&œ´KU\ß\Ğú\ìƒ5§C—UZ\ïG\ÚıÏ¿|mğj÷]0›¹°G|÷\rj‘CS\Úyx\'r¥“c\á\Ë\î\Æ0+\Óoüa> öZe\Õ\ÒY\0†8m\â Kz\Ø\Ç\\GS´rq_/K8R´zùZ\éBu9¤¿\æ\ß\Ú\âûTğÀ>o\Ş\\Z«_¤7/­½íœ€è­3{W[ûX\è7\Ú\ß\Âğ‡</%ö­|É´¼èˆ‰»;²\Ø;”\àzV\ÙMá‹‹®—.»\éóÔœ\ÍBxI*\r\Ş\ëeşGŠüGøa\â\í/O\×ş\é\ëo ]\ÚZ\\¶Æ-a7³mg\ä\Ï\İ\'‚3š\Ïıœ¼uñ+\Ãşñ¿€õ\Ø\Öm\Â\ÖS_´ó–	§Æ™Ä²0”pvGL\ëbg\ÂUN””\ã-»e\à±T¥\íc\Ë(\ïıt>4ñ\r¥¥§=½Œ\í5¼r\ÉRÁuV =\èñ#k‹\âTmp»C#q\Û#ñ¯¯¡fœ·²>(N¬œv»üô2©\Årzõ­[\r¥*E?ÿ\Òü\éøyğK\âÄ°n<=¤ ³Vh\Í\İÔ¢wª	±õÀ8\îE}Ÿe¢­• ”±†\İ6Y\ÛDşZöTŸ—9õ\êO$W$±ìŸ’\â|C\Åb*r\à©\Æ1şö­ı\Í%øŸ67À-#ÁCK´ø&©.¯¨_4?b\Ò\Ê4qD8Wg#s\î=—õïº´PüN\Ó!³•¢¶ñ~Š\Ò.z\èP\\LŠw[N¿\Ã*\à‘»s\Î+ˆš\Üp\âl\Ã§Dù[Zr\égİ½]\á\'Á¿|2ñ>˜úv\Ô\î4\é\ïæ»‘\Úw\n±©rvœŒdŠ\è¼«¾­\â\ß\n\\:¼\rq\á»û;\Ëwt¸‰¡.§\èC{£Š\ä¯9\Ê\ïCÅ†/ˆRu\ëJN·¼\ß\Ìô	ø\Şq\áÛ»\İZq\é7\Ïkö˜rZ&FH\Ç!\Ê28õ\É\Åx§\Ã\ïYhuß…¿Y­ô¿\Z\Ûy0\\–)o\",\Ãñ¡¼ü\î3¨7V\İ{Û§™ıÀES9À,=yŞ¬6»ø—ù­¿§¿ø\Ï\ã\×\Äk¿\nN\Ú^\Î\'Š=Fk¸3+G”\×8¯ñ‡Áh\ÚuÎŸ¦|Gº\Ô4òHµ†Kfœ\á™\\ \0c¢\êNjc<4\íû\Õo;Ÿl\"•Ú¥¯—/\ê|‰\ãOˆ^4ğı—‰¼9>¹s8ñu\ÊÉ¨\Êò™<Ø£™¤«g\0l¸€k\Ğ<sû+øŒ\ÛEu¯yú¶¡>\Ûm:°¨	\0¹\É=\ÎIô8|\Ã/¼b¤›ZlÏ•\Ç\á³	Õªš†\ïU²>tµÓ¥¿Ø‘\Æ\Ò\Ï9$\É\'¯öO…?e\ë/Zg[—\íw‘BÌ©·	®}k\Òx¨·îŸ‘\ãø\Ó\rGı\İ9?¹}\çŠ|øgwy\â\Í\Ä#tn\Û\ËxU\Ôù-±\Ñ\Ãz‚}0Ez§\Ãı~[j\ZEŠ[k-\â;#N\İ÷I™D\Î\Ş\ág ŠiN¬¦\ì¶<^\"Í±ø\ÅõhZ4\ç\Êúhº\ë\Úÿ\0>‹s\Ì|mğÿ\0\Ã>)ñN«¢ü7ğÅ´œµ\å\ï\Ú ¶—\'tJAõ\n\Õ\íPøj\ËÃš$\Z—#2‚\Ò\ÜNÿ\0\ë.$\'2H\ä±\Éö\àbš«È¬\"Ÿ\Ï•\ÜùUœ\æÛ¿øcu§k\ë\èÿ\Óó½f¥·\Ù\Ïn_r\Ê\áVPxˆı¬ë”\Í_ş<¿şu\ä¦\Ï\åª5.[jŸG±\ç>)ñŒzŒ-mµ\Ãs£_\ër\Û^\Ê\è\n4ñ.û-B)U™Y7\ï÷r1×™ı¨?\äoğŸıxOÿ\0£º!(İŸ§\ä¸jxŒ¶X‰­bôòÛ½ôw\Õlû\\\íü}ñ\Åÿ\0gğ\Ä‡b5]j\Î\î\Í\à’1*Grğ~õv\ç”£:u¬m;şDO…_ö0_ÿ\0)«:qN\é¢04\é\àñ˜¨SŠq²vj\ë\âK\î\Ô\íü-.™ñ?Ãˆ²Á\â=\'\Ä6¯m‡¶Kv¶\ÔpıÛ \rB\ç ‘X¿\ä˜|4ÿ\0±Oıj\ZW‘Å™W­—\æU©\á¤\ãk´Ö5kmcsKø›ñW\àş½c\áŸO¿\à©õa¦\êw_ñò‘²¶rJ© 3gw–Äœ‘šß´\ßüŠÿ\0°ùÿ\0\Ğe¯/—\á±%9E)%{­\Ô|5\ãL\ß4Å¬.|\ÑK®ûÛ¹\ê>2ü=øp\×^ğœ\Ä?\Ö-\í\í­l\àR|8ı\Èß¨Ç€zŠù\Ó\â\ÏüÎ—ÿ\0]<;ÿ\0 G\\ù6[‡tV&Jòó\Ø÷¸¿9\ÅÖ|+—\î\áu}­/i=\ÚòMOÁ/	üB´Ms[øŸ­^jN\×kıô—&#-\æ¿,UrN0£½>\Óş=õ\ïû^\èf½\é\ÉÉ¤\Ï\ç<û9\Ä\ãùa;F1Z(«-\Ğ\á,laµ¼ğ»Æ¨#{-Nü\ìP£\íS:\Ş\äF\ì€úTğ}\ß\n\Ø2ı:g\'V®	=œ~\îŞB\ê]¥–NW8\ëş~”š·üx\İ¸?‘¬«IÁ]d\Øh\ãqt°óm)J\Î\Ûü·?ÿ\Ù'),('54321','Williams','Comp. Sci.',54,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0H\0H\0\0ÿ\á\0€Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0J\0\0\0\0\0\0\0R(\0\0\0\0\0\0\0‡i\0\0\0\0\0\0\0Z\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0\0 \0\0\0\0\0\0\0H \0\0\0\0\0\0\0H\0\0\0\0ÿ\í\08Photoshop 3.0\08BIM\0\0\0\0\0\08BIM%\0\0\0\0\0\ÔŒÙ\0²\é€	˜\ìøB~ÿ\â ICC_PROFILE\0\0\0lcms0\0\0mntrRGB XYZ \ß\0\0\0\0\Z\0(acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\08cprt\0\0@\0\0\0Nwtpt\0\0\0\0\0chad\0\0¤\0\0\0,rXYZ\0\0\Ğ\0\0\0bXYZ\0\0\ä\0\0\0gXYZ\0\0ø\0\0\0rTRC\0\0\0\0\0 gTRC\0\0,\0\0\0 bTRC\0\0L\0\0\0 chrm\0\0l\0\0\0$mluc\0\0\0\0\0\0\0\0\0\0enUS\0\0\0\0\0\0\0s\0R\0G\0B\0 \0b\0u\0i\0l\0t\0-\0i\0n\0\0mluc\0\0\0\0\0\0\0\0\0\0enUS\0\0\02\0\0\0\0N\0o\0 \0c\0o\0p\0y\0r\0i\0g\0h\0t\0,\0 \0u\0s\0e\0 \0f\0r\0e\0e\0l\0y\0\0\0\0XYZ \0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-sf32\0\0\0\0\0J\0\0\ãÿÿó*\0\0›\0\0ı‡ÿÿû¢ÿÿı£\0\0\Ø\0\0À”XYZ \0\0\0\0\0\0o”\0\08\î\0\0XYZ \0\0\0\0\0\0$\0\0ƒ\0\0¶¾XYZ \0\0\0\0\0\0b¥\0\0·\0\0\Şpara\0\0\0\0\0\0\0\0ff\0\0ò§\0\0\rY\0\0\Ğ\0\0\n[para\0\0\0\0\0\0\0\0ff\0\0ò§\0\0\rY\0\0\Ğ\0\0\n[para\0\0\0\0\0\0\0\0ff\0\0ò§\0\0\rY\0\0\Ğ\0\0\n[chrm\0\0\0\0\0\0\0\0\0£\×\0\0T{\0\0L\Í\0\0™š\0\0&f\0\0\\ÿÀ\0\0H\0H\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùúÿ\Ä\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3Rğbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿ\Û\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿ\Û\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿ\İ\0\0	ÿ\Ú\0\0\0?\0\à\'–Vˆ,n¾\äƒùõ¨\í-..\"š\á6°İ´+`“ù\×=­\Ô[\Z]$©f¡\â)d£F{\ç©Àü¸¬\é¬/bx¥™±œs\Æq\íM\ê+¥\á\Ëa¦y‚l\ËpJ*;\åDy\ã>œ’x¯2¶»}Ë—!{ŞµQ|£ZP\éúİªXÌ’º,Ö©™\"\Ü7+\æ]K[•nÏ—3ù›B‡\'\æükD\î]Hñ\Ç\Ä\rOÌµ´Hœ8V2—\nr¬98\ç=F×Œ4\ê\ì\Ï#±9\Éb^i°\å;K\Ûù\Ñ\í\äı\ç”p_`ëŸ¼8õ¬\Í#K×®\í\ŞKK)nmH\é\å\áX{dÿ\0*\Î\É‘­\âU\Õü%ad\Çiµ#<·`AüNF>•\Ë\ÜG$!”•UnG<Œõ8\Å;’\ÓBOx\âv`ª3`\Ãõüj­\Ã<\æ+x\ìJ–\"e¸w™6€$óŞ«\Æ\â	ù@¬ÿ\Ğ\ãV$*\Z5r›w¡Ç±\ã¹÷\Í;P·tœyk\'\ÙWœ°\0ŸÏ§OÖ¹T”µ\îZµº]\ËÇ·Œ³Â²¡\Ïr±¤XT;Hú\Ğ\Ò\Üş\Ë ¾—\0¼‘·$õ\İ\ÚGnm¢\Ú\är»yÏ¹¬e‰q\Ñ#9M­8\İ.\Òñ>\íDm·¶·ó$Ş¾¼\ë]Åg.¯3\İJv\Ü\Û,#\áX÷ÿ\0V´\êó\Æ\ç^9+³\'B>‹SX`Ò®\î&\\l7\n\Äq\è\rvzG…´][·»M\Ş`%³+\äô\Çz¦Î¥\ävô¨.\ZÍ´Û¨\Õ\İñB\\Ë¥:\èww\Ò^y’«o,\Æ	p	Ï¨¥¢Cqgš\ëq½ÏˆuO² hšQpF\Ö>\Z\ëµkXu×»\Ûo•\rŸE\É\ÍMJÜ‘\Ğ\â\Ä\Ş:£„L“†•HÀü\ë»\Z­jn¤)\ä;r@<óŒ}+ˆ¯mNyœ\\6qÜ’„„ù~ñ\Õ\Ò>œA\Ì`0\ìOÊ§\ë\r\ìò?ÿ\Ñ\åe7ñUr€\0\Äı~÷Ò­\Év\ÛA0J–S\Ãı}+‚6\Ä+Dv›m\r³G\æyhñ¶AA\Èÿ\09ª2K¹9*H\êªG\îHü(¼›3lô\×AƒK[©\ç’\æTÀha`\â:c\×\ß5\Éh\×PA¥J—Rª–y\ÉbOJ\Ñ8[cX\Î/s£¹ŸMK˜ş\Í\ç®OTP9\ÆA\ëÇ¥a$‹©\Ï$²| \çn\Ğ2I®x©\çƒ\ÑN¬odkê™»!§H–%?»É´=”š\ç_\ÅzD†\ŞşÁœ\'(BUÀ\ï\íô«\ågjš[~\æ\Ö\ÙcH`[2„\ç\æ\'\'°\ë\\ö›­\Üø_³\Ãföö˜ù\æ*TŸeÿ\0\ZRM+‰\Ô]w²¬\"€^/3\å\0¸5E\æšpcn6•Q¸®\n“m\Øò«Tsz“,Kş¯\r\åõ ÷÷6#frYœ¨\Şsÿ\0]JN\Ö\")±\É‰™.c\Ç\àõ¾”²FfFŠR\Ã\'#ip=»\ÕF6Ü®Tÿ\ÒÉ‘,™—t%\n\æ\àõ\ãñ¬ûû\Ój…¹”¬\0\ã\éŞ¹ğø,F!\İ+.\ì\åMM+_±Ê‰¶1÷·rq\á=ı=k™øÎ…\Õñ¸qZõVF­\ïNÿ\0#\'VMššõŒe¢HÈ¡I`\İ:Ÿj\ç­b>V@ë–­ğùM/ysz“)³°ğ¶µk\ì‹y²6˜Brç‘“\ë\Ç\å\\¿XrƒEo[-£8¤•½\r(b)]jz&©H1Ú¹û\ØÈ¯;†{\ØË·¿¸<ıÀ\Ùğ<\n\à–S4ô‘Ü³õG¨Y\\\Ù\éV)ss2\Ç\0<¶:ıs\í^c3\Ï \ß4\Ò\Ì@ùw¾qô­!”<‰aü¨\èˆ„·²H\ÖÁa’F`ª\Ø`¤ñ“\Ü\â¹\ØfS2{\ä\×d²\Ì,â“‰À\êM»˜¼µuWIUnWneKF\'“´~&¸\ŞE‡½\â\Úùÿ\0Àµ‘\Ú,ñ˜÷@bf=~^3ş5\Í\ÙŞ¼s9\Ú\00?a[\"\Òô¥÷Whÿ\Ó\ân\ï¹\'‡<U+øù?\îWÔ­4[g*Ü‚v%™û\Ø÷\Í6O¼¿\ï\çI²\ÏA\Ğ ğ·…¦›U6s\êXÑ”¼±;\ã\Ş=‡j\âşBŸğ\n\ÂTù§ñ?¼ìš±\ê:×Œ¼7{¢ê––PIoq{h,\Úal~\â¹	¢1o©\ÇZó®\Çü÷¤ğp‹RM\Ş\åûWe¡\×\éz§…Æ¹ks4+\r½¼Bc%\"_—÷mF\ì\äs\ÎMp7Ÿ\êşº§ş„+%ƒ>h©=|\Ç\Z®{¤zµo \ëº…İ…«A5¾—m¨+\Ä\Ê7\ïù]$@6†\íÁ\Éü+3Dÿ\0Gˆ¿\ì\0Ÿú6„9E\'öšùh9Ù§¡\Ê\Ä{Ó¦ÿ\0X\Ş?Î½¬\Înƒ%è¾ƒšI¾\ç\çPö*%e»\ÉG\İ\Õ5I>\àÿ\0®b°\çfÜ¨ÿ\Ù'),('55739','Sanchez','Music',38,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0H\0H\0\0ÿ\á\0ŒExif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0J\0\0\0\0\0\0\0R(\0\0\0\0\0\0\0‡i\0\0\0\0\0\0\0Z\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0H \0\0\0\0\0\0\0H\0\0\0\0ÿ\í\08Photoshop 3.0\08BIM\0\0\0\0\0\08BIM%\0\0\0\0\0\ÔŒÙ\0²\é€	˜\ìøB~ÿÀ\0\0H\0H\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùúÿ\Ä\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3Rğbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿ\Û\0C\0		\n\r	\n\n\r	\rÿ\Û\0C		ÿ\İ\0\0	ÿ\Ú\0\0\0?\0ü\ÈÒ´¸™1#ù\×\Ñ\rğ‘H‹G•>‚¿«¥^0\ÜşV\Ä\ç½¢s~ğ9™Ğ˜[ğ¯³<\àU1\ÄLD\çıšó+f0‚>n¦3]\ÙY |8f‰K[ƒïµö’hº7†|¨øƒ[¸‡L\Ò4\ÛGº½º¸p‘\ÃjY™‰\è\0óÕ³}l™Tğ8¬D”U\ÛgÈ¾1¶ğ—\Ão‡sx\Åú¾‘f\Ùf?=\Ô\ÛIX£^¬\ÇA’qŠñ\ß~\Î\ßloˆó|Pñ©\'üw,£B³š#,ööyı\Ú\Åª¤`³\\\äôÛ\Îó>;Ë²\êk$×«üûI\áV;EWÄ§g\ÓE÷·ú/™\â>7ı¨­£½–\×Àş·òhMKUvm\ç6!\\qœ\à—ü+\èŸÿ\0Á4õ-?\ÆB-\â›\Ã\Ş@s=Í‚™Ä\n\í\\/¾}:\æ¼ø…–×7\Ömòkô?G\Ãøa†¡%l2›\î\å\Í\Øø·Lı£<P/¯¹§\éúŒ©¬1}›\ì\í€-•H9>õ\ÛüZı>!ü:´[ı*Xü]c\ŞX<©\ãÿ\0€CpAö¯W\ÆZúQ\Å_\Õ\ëø¢ñœF”´Á¤—X¥ÿ\0¶³Ù´\Å\Ñ<Yğ\ßF\×m®­\ZK\ëP\ï3n1É´LuÊ“\Ïw¯\Ï\İ:\ãVğMoq§İ®xFb•Júóú\×\è\ØN r²’º\î\Ï\Êqü\r\ÉZu0õ\\×•­°õÿ\0…@q\é^Ï¦\ÙÉ®|5\Òõ‰-q\0f™X2	*Hü¯º¥‰…H\Ş\'\ä\Ó\Æc2\ìD¨\Õz§c\ãSF’\ŞV\Êµ\í¾&\Ğ„¬©ƒ’1Š\íSMYƒ\Îy¬¤ÿ\Ğ\Âğ†\Ğ\Ç1ŒW­ü?°C\0(\çÚ¿w\ÅbdÑ§\Îõ={\Â~ \ä\ÈúW¤øn\Í\Ú0|\'&}F­±óÿ\0\íq§\Ê?\àŸ&\Òí‘·\ëZ–—¤0E%Š\İ_\Ã(œ\Ø^•\î\ß< |g\à¯\nxivygÅš^§9f\Ã\ìo#ºlz\ä\Æ\ã_˜\æ\ÔrúNU%fÓ¶ı¿>\Ç\ë\Ü#“\Ö\Å\æ1­^0·7\Ïo]K¾±\Ñt}O\Ò?´,,\Â\Ö;V….Qv2 \0\Ïc\ÔW\ç\×\Åÿ\0xş\"Å¥h\ß4k«©õfaq¥pn<’s\æXŠ±$\ÙaNHÍ\ÊğùŒ\å‰u’¾º¸ÿ\0ÿ\0û>^Úœ#M\'òNß“ü\Ï\Ò\í[M†KY›\í$X\æG~¯>!\é*\Ób3G·\Õ¼L\Öj·¬J\àğ\×8¯\'‡\ÃU\Ä{/ie\Ü\Ò4\ë¦\Ô5±\Î|@ºğ‘¸™?\á&Ò®®\å0®¡İ—ƒÁö¯\Î\ë_x\Ä\í£\Çğ\ÓJ¸¾¸\ä.c†c+9\rB\èŒs¸r}+\ïVE„¥MT{ÿ\0\à?\ægv)\ÉÒœ5ô—ùXùö–\Ñ.\ìÿ\0hÕ’ö\×\ì¦\ê\Å\Z7º\äcŒÎ¾¿ıª¾\rk øğ“S\Ğtf›\Ä0]I \İZG\"’‹$¢,\Ä\à\0b\nNx÷¯Ó¸k1\Ã*S¢\å\î\Ã[³ó>#\ÂV©‰Œ\ãzZYk\èv_üucûx0\İü\Æ\ê\Ù\ï VB\nE+—E\ç¯ƒ\Ç\È\Í}+à²š\ì\Ñ\áˆ\İ\Ü\é\ÖK¦]3Å³|\Ö\ÃÉ‘”c\î–RAÀ\È \×\í˜Î\"*TdœWcø‹òü\Ã\rœTX\Únœû>\İ\Í!x—@	$Ë°gŠõ\ïiˆ‰v\Û{ñ\Å}¥,O5€§9Sgÿ\Ñô¿\0Ì‚2zc½q\0Ö“Êƒ-\Ûû†*„\âœ=e©ö\î*˜\ã9\\§†5exc†p8¯‘¯E­¯\ÃW‹\Ôõ=Z\å,m­5vÀ[@\å˜ÿ\0t¯O\Ä\ãò¬­f¬|4\Õ\ìUi\ä³ 	\àC\Û>õùw\åR\Æ\á}¤>(_N\ç\î¼\Är\Üw\Õ\ëÿ\0­“w\Û]\Ï<\Ö~,&¡wxºN‘s}¥é¶­6£<%\Ë%aˆ3’9#\è9\é\á>ñ\rßŒ|9­hş5\Ôü?\áU˜iºp%¸S\Ø\Ú9$Bkpc\È\Ç?‚B\Z¤lÚ‹\é\Ş\ï\ÓO\Ôş\ÏT\áOøpº}V¿©‡\âŸ\ÚR\Ë\Ä:Ö™¥\ê\Õ4ı&TÌ¹†\×sF\àğ y\èOAŠ\Ùø›\à/¿‚Vù|mñN»†E\Ã\Æ\ÚL‚SIl`Ÿn•õt0¹l¨ò¸Y÷»¡\ÍJ¥X\Î\Ô\Óÿ\0À\æt~ø½£^xV{[A³m*\Ò*\åÓ±\ÏcŒdõñİ‡‡u}.\ËYÔ¼[\â™üIò²\è¿m‚\æ†4¾P\nY¾n\Ç\'5\'‚„SŒ\Óo¤o¡P«R­F\ç½Oª\î5½?Å½¶ÿ\0‹k´a¶;dQ»2óƒ\Û\ÈüƒI×´meotø®\ì,‚,+4d\å²p}ˆ\ê1\È\í_M”\å1·¥Mò\é»?8\â#Àğô¡Š\ÄE\Ï]\Óó=\'FŠhş\ØIv¿\é3–f\nGš\Ç\n_nÛ»§z\Öñf¤‚)>~y¯Ş²<¹\å\ØXÑ½\ßsø‡Œ¸ñ.m,s‚‚j\Éod¶¿™ó‹\ÙE\ÅÊ…O¬_]7;cp;y¯Ò°ñ\Ñ”KYŸÿ\ÒñŸø  „y˜\íÖ¾hğ¿ŠŒM2Î¿©*a”\Ñüo‹\Ê\ëRwHıTğoŠ\Ñ\ã‹3Ç­|‰\á,Kù¶(å™›\0}k\çq9mõ<xU¯FJ6g\ê‹®«DŸ¼ğ×‚¾?Xx·\ãÇ†şü:„ø\Û\ÆúµÉË¶”­„h¥¥\æ\ã\"F ’3d¨\ÆXW\Âc©a°©Ê´\ÔQú[ƒ\ÎqšÒ¡&»\Ú\Ëñ>Ÿñ†±\á/	x\ß[¸M3LÔ£/?	ù\â $üÀw\É\ÇJw\Æ\Ë?¶\ß\ßAo©\Åk§‹}U\å\"\âwQ)l˜»}+ùS‰\'•W\Ì\Ôè¦¢÷q\Şı\ìup3\Ê\'³\Æ\Ê\í|7m\é\Ú\ç\Î>$¼ø7Qj±x’\âe™\ËR2F9\'!\r|S\ã/†––%\Ê\æ;‰ŠU‚\íún\àúŠõğ\Ø<-Z7yòŸmWŒ§+{5VzG~\"hš¾§o£øjs¨>ÿ\0|ax\Æ}pğî… €\Ñ0˜)¤\Ï;¾µĞ°¸\\4[¢œŸvg\í±uÿ\0Š\ÔWd}¡ğPJøg¬\ÙY\åC²0	%?|ù‹®ôu{Mw-t‹	Š,³±,6ª\Éb\Ø}Hİ’\æµr\ÌdªÕ4e§¡ñ\\g\ÂT¸Ÿ/…*UU9A\ŞöºùŸGø¿\Å\nY•\\zWñ\Æ\Ê…\ßğO{Ÿøñ\İ!Eš9Ê´\\\\\0¸+ˆ\Õö–\êvŸA_½e¼K•×’„£(¿D\×\çúÆ™—‡™\Í\n®4\êÂ¢]Skó_©\ä8ñ(d•Dœc¦k\âëZn¿[\Ûi´™\Ï÷›ÌŒÿ\0À‡#ñú^—\Ëj‹\ç§\çc\æ\éğmF½¤şZşGÿ\Óüh—\Æ\Øÿ\0,Ïº!3€¿Sı+\Î5où\Ïø*ı\×4\Íqxz¾Æ“Iw\ê|,ÁÕ‡5H\Ü\Ù\Õ<g\âMo0^j“gù~\Í”‹\ÅA\çñ\Írñ\Çô?\ï\ç_[‰«wRmú¶{°xJ*ô\é¥\è‘ûÿ\0\Ûøeg\ào†WŸµ—·“[ñ=·\ØôtòÁ’\Ê\Å%m\Î±Â’£ø#<\æ½?öGÿ\0“\nøQÿ\0`tÿ\0Ñ_g5\êÖ­\É7¢>š…8ª|\Éks;\ãö¡«\'\í\ã;›&8sk{\ÎC#\Û\"6?\àQ=Iñ\ËşK†«ÿ\0`;?ı­_˜c-R²Z¥ù³öş\\ùf½_‘ğ_Š.õ]G\ÅsZ+:\Â%Ï–½\Ï~1W\ï?\ä£\\\×Vş•ö\Øf©aÔ¢«RŒ\æ\Ó8\ík»9\Ú	§¬yÜ™ô¬O\È^û\é\'ò5ô”£\ZM£ÃœygÊ™÷\ìÿ\0\àõÓ¼ˆ+ƒe\È\Ë\è6wz%#jpz1ùk\Ø\Ç€=+Aÿ\0’C\á\ßûZÿ\0è¥¢t)ocó¼vcŠ«VT\ïh®‹¯©ñ\ç\íùñ\ïü/\à¯A>\åš\êmN\è$£_* }~i¾©\í^3ûlÿ\0\ÉfğŸı_ÿ\0GW\Ñeta\Í\Ôùº\éQ_Zrÿ\Ù'),('70557','Snow','Physics',56,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0H\0H\0\0ÿ\á\0ŒExif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0J\0\0\0\0\0\0\0R(\0\0\0\0\0\0\0‡i\0\0\0\0\0\0\0Z\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0H \0\0\0\0\0\0\0H\0\0\0\0ÿ\í\08Photoshop 3.0\08BIM\0\0\0\0\0\08BIM%\0\0\0\0\0\ÔŒÙ\0²\é€	˜\ìøB~ÿÀ\0\0H\0H\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùúÿ\Ä\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3Rğbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿ\Û\0C\0	\n\n			\n\n		\r\r\nÿ\Û\0C	ÿ\İ\0\0	ÿ\Ú\0\0\0?\0ú—N·8ZÓ²‡\Å|Ÿ)õH¹k0j\í´@”š) ‹Ò¸¿|ğ#\Ãpk\"\İs{/\Ù\ì,\"‘VIŸ–$Ÿ–5\Ç\Ìİº\0N]5LCå¦®©\nk\Şg£ı›‘šø’\ïş\n#qu$V’X\éz–0\í=º½ó)Á\Ê|ÁT0>¢º¿²±/¡E\è™÷-¬„n&¾ø(¼º,\Û\ÊMªdgÈš\Î(†\ï÷ô>Ù£û#-‘2\ÆQ\ìıµ´Yayt‰«?ñ=«\äÁC>k·º~ƒ\â-4½U\ã2_¬„­¹“F\Ã dcp$jq\ËjA~ò:“<G;¼‡Ö“\ÚG’\î	Gû\rC•\àiV\Úİ–§\\[^\Ä\'†X\âQ¹dV¹*a’\Øp®\ÓÔ£uhø<Uk\ßøtŸ\Ü[\İ[ÿ\0×½\ì\Ñÿ\0&®w†ofuFª\êej®3Á¨/¼\Zö_köş›o¼\Ì~+T,+]Jö±\êÿ\Ğû\ÑG4\ë\\`W\Ë\Øú‚ô\×\rieqt´­O\"¢õrªH\Üâ¦‹\æ\\g\ã9¦’¸ú_¾3ø³\â\ï%×¼Oh\Úe\Ü\ÈK-Ä‹Pú¾{ø\à‘[¾7øW7ˆi/x6\ê÷ËM\Ö.¤’]˜i¶J\0IG\åõõ\Ô%B…4¬Ñ¯‹¬\éCS\Â$¸Õ¿xsFzŠú¶\Ïösğj\Ûùr\é\ï+\íÁ‘œ\ç\ëPóZv\Ô\í\â\ä®\Ú>L»7´`WØš?À?\éO\Úh»i	o2aó\Ø~”óºz&iO†q2^ô’>L°\Õ\'¶Ûµ\Û¸`{\×\Ó(ø9\á3§\Ü\\[Ù­»\Ã0d\ïŞ”3z¬\\øsF<\ÊKC\ìŸø\'w\ÄI|cû<\rMI¥¾ğŞ©6–ùm\ÍLÁ\à=\0‰\×§\Ô\æ¼7ş	§¬Ÿøÿ\0\Ä\Ş3…·Ö¬Rş8³\Ökv ¶=v:Œú\\Y¦ªDÂ‚–±©º?@\î ½RB\ê \ãûö\ÃúOb · &¼†u#)’\á‘\Şy¡‘sµ|¸\Êó\ß94’K¶\Ö59\É\ãRZ?ÿ\ÑûÙºUkiºs_6\Ñõ\Ü.1Ua“8\ç­M€øS\ã¦…ğóö•ø\â\Íj\ïsj\Íguokn¦i\ßÌ·IX\×-Œ\ÂGLq^ƒñûÀ\Z‡\Å-WV¶f±½ñVĞ»yv¨•3ª›¸\rc\Ü\àu¯VUL<a7·C¯O÷®q²}\Î?\Âÿ\0~j¬,g\ïO¸\Ü\0KûG·\'?\ï^a¬ü.´7³}‚E»º½-\rÉ›.~Rûrpw9\'/jeG\r+Y³Ó‹\ÆF\îI5ùı\×=\Ã\Äÿ\0>øj\İ[Q\Ô\"–GBRq\æ\È\Ş\áWœ{ô¯#\ÕşxcÀW\Éc X¹\Ón¡„\Ü}ªG™~\Ñw<°G§\İz\×:¥…“ø›ü\r¢±j*-ù¶¾ı\rC\â‡üAk1O\ëP\ÙM«Ì°†zrªK9\éMğ¿€´\rà¾°½	$I¶C)’I‹6vu…PG‰G\î&X™B^\ÚK\ÓFuŸ±w5#öŒµñ“\\øtx{U+\æÂ«Nd·\"¤\îŞ¼õ\çòôO\Ù[\ÃSx_\â\Z´6q¼W\Z\\‰)Lş\áğNX‘¦´­ŠU#\ì\â\î&¶P¦\ë\Î\É\é¢ÿ\0‡>º¼—÷OLU[¹x:³\\M)‘İ®~\êU\î¥\íõ¬\Ú\Ïÿ\Òúš\Ò\è0\Ö5•\Î1\Í|\éõ_o7½e\Û\\†šC±ño\Ãöúß†ÿ\0´\İCK¤nT a\"?ü+­û4¶ò)t(\è\ËÁR0G\åU$mF»¡-ô\ê|¡¯Kö;9A†\Ú\ŞğŒ£´;\Õ[±*1»™Z¯ñKÁ²\é>\"¼\Ñ&¸y\Ï\rA)¡~T°`ñß¸È­¢\îı\çc\ë0s…tµĞ£µ«\ß\ë’]j2[\Éf\á|¥û9V‰†Ceóó\ãŒc©®*\×H¹7fX\ÛVT\á‹\Î\à‘\é×¥gVœR\ÒK\î=—Bœ!xM£uymm @\Ï\Æ@\ÅqRøƒaM*İŒ\Ó\íù÷G©=«Ï”dõ\èqÎÏ¬şøN\ËGğ¼>+2¼—º\Ô \Ø\Ûa÷\ç\0Ÿ¥xO…~#k‡J“Lñuğ€++i\í\"\Ë\ØHÛµ\Ç\îÔŸ”‡Ş»h\Óæºx˜œ³‹“jZ-¯·\Ş}q5\Îfwt%«\n\ÇX¶\Õ\í \Õ,¥W‚\æ\Ùf”\ä\ÃÖ¥­l|ô\éÊœœ%£F„\×Cœ÷¬=Bé£‚F’¤©â³›±<º\\ÿ\Óö\ëMV?—ydÿ\0yH¬\Éƒğ¯j\Ç\Ô\ÇS¢¹ñ=–•l³\ÜK“#\ây.\ç \Ô\×\âõzOı~ı\ÕÑ‚›\Ôö2œ<enJ·±§«|W—K\Ófº—Pš¶Àª3±ÀÚ§¶äŒÀó^[\ã¯ù\ì?ë¤Ÿ\Í+\ĞTâ•§©ƒ\Ã\áiJt©«¯#\Ìfñ-õ÷\ÅO!¿š\â\âò\Ú+—¸\róI2’\éò\0ô°tù+º—ı{·ò…o€ò\è\Å9]õ:F¸ñv¢\í\nŞ´q’r\æ<¿ZÜ±ÿ\0S/ûü\ë–\Ê\ëC¦-§c\ì\Ú\Ä\í†o\ßJI\ß#ÿ\0w=sü¾¤U«õ¯ÿ\0_¯ÿ\0²VÊ”7jç¡‡¦§O\ÚKWrÿ\0‡ôûMCPŒjl©i.É«µBGa}z}WMÿ\0{¿úö¸ÿ\0\ĞÚ·²Š\Ğ\î„U\ã\æ{\ï>!\Øiú=®”\Û~Ê€\Ål\Ø\Ñó‘Şƒ†s^m¡ÿ\0Ç´ö_ıV¥®scrœ-y9N:\ßsŞŸY¶¿\Z\Ş\á]ZER;Œ\à\İ+˜ğ\ïÜ“ş¾Oò5\ç\ÔVv>;2\ÂCW–şgÿ\Ù'),('76543','Brown','Comp. Sci.',58,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0H\0H\0\0ÿ\á\0ŒExif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0J\0\0\0\0\0\0\0R(\0\0\0\0\0\0\0‡i\0\0\0\0\0\0\0Z\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0\0H \0\0\0\0\0\0\0H\0\0\0\0ÿ\í\08Photoshop 3.0\08BIM\0\0\0\0\0\08BIM%\0\0\0\0\0\ÔŒÙ\0²\é€	˜\ìøB~ÿÀ\0\0H\0H\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùúÿ\Ä\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3Rğbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿ\Û\0C\0	\n\n			\n\n		\r\r\nÿ\Û\0C	ÿ\İ\0\0	ÿ\Ú\0\0\0?\0ù\Z\Şd’6FrSi\İ\ÇZP¨ñœ®£v=kÁOS©\ÅˆşVÁª\í¤j<™\çQ±H-\ê\Äs€;š\Ó\ÙûG`\çqEÛ›(\ä6¯+`$%\n¹-‘ôªZ¿‹\ì\íe0)o.ˆ\Ü-­¡i\æÇ©…^*°¹}-\ÚwlÒ¾&¾*\×V¶Å•°\ß2\Û[Y	$•\Ö8\Ô\r\Ì\î\Ä=I$\nµ¦h~>Ô¡K\ïøEWOBU\Ğ\\NVe9\È8Œ§¡\ë‘]\\\Ôb\ì\ÉX,\\\×2‹4<Iğƒâ¿‡!7Z\ç\ÃıR¹Ë‰&\é\Ôb&f‘Ú»\ÓûBüqğ\ìe\Ô5K=@GY¡§\Ç+²q\ÖD\Ø\Ù\à`\ç<\n×Ÿ%¡œ°õ©üqhò?\r\ßÁ\rØ HY˜$»\ä /\á‚U½vÿ\0~5h¼5¾¡\àX¬|OopŒ5kYP\Ç$Yù\Ñ\Æä€‚Á\Íyø\ì¿Œ†¦øleL,¯¨Eºµ’HÕ¶\å8$\ã?•u\Èu›QUg4ñJNO\Ë\Ã/\ê\ç_+ŒÉ¾¯$\ã±\ïas^.2Ü¥\â\ÛVK/\r\Èc ,ˆ£>£<ş¦¯|Zº‹Hğî¨ù@ıšU8éŸ˜Š\ß(£\ìñYœù°ö*¢dt¯:›\â…\ëemm£OO”“ú\×\Ö\Øù„\ìÿ\Ğøú\Ó\ç?&VBBœò9§Äº}±i´v’y‚Óšù˜b\è\ÊK_Á”°•’¿\ê†xT:N™=\Ìs\ÇXT÷=¿q[:„`ñÖ«¥Xı§÷/}\Èv§!A=\ÉJõ!ˆ¦\ï\ÈÉ­\ç©~\Ï?#µ\Ñ\ã\Ô/mü\ëÛ¼M<Ì¹i$=N\Î+Ù¼5y?„´K[»Ÿ\ì\ëQ\Ä_j™PºŒ×‘^}Z²¨Ï¥ÁÂ•\Ùöş\ri£XV\Õ2z|¹À®—Oñ™¨iSj–ò‡‚˜ˆq¸0{\ç5•¤\Õ\Ñ\Û\íc²<\ß\Å^\ĞU$MC\Ë,>ò„EN\Ë\âmB\î{­/N°$‚ü’œNp\0úÓŒg-Q•jŠ+c\Éu‚>ñ¯$V\é˜¬¢hX©\Î8<#^Ù§xz\ì\Å6£¯Gf.•0²\é\êÈŒ}\n z\ÔN­Z{2•]g\á}5õ…~9[-ryg“M¸;Ä€)•0Aú`ƒ\ÆEz?\í-á¥»ñÿ\0‡\çµe·]UV\Şyš=\É\Ã`7\Ôk¶…m¡\â\âğUª•%¹\ÎüTñ5·Š¼\rı¥¤±G\Ñ\Éo¸K6v«\Ş\ç¦jŠš>›\áO\Ë\àûM\È\Ös-\Ã\Î\ÎXÌ²CsÀ\Ç<\nÂ%8­5#N¥\ZR§S}\n*±ŸKCóİ³jönÿ\Ñø®\ÙÇ–\ÛB\ç1‚*kd†Hw†\Ãc\ã­xG¡Õ¾\ìö…\Ú_†¯m¼¨>£vº¥·‰öKojU\áe~\Ï\ã(B“·Š\Êø/©izjJn–D•.\àºF\0\ì\Äl	\ç\Ô\à\ÕO:V¡(§\ÖÚ¯™Î§\ì1Şºh^ü$ÓµMA¯“M†}Ã‰®Fñ¨\Ê8ô«?ş%[øk\Ã÷/—Ëzn\Éo\ÏF\Ë_¸úø\Æ2‡4\Úü\Ê\ÚG…´jPI«AlÖd\\tşñ‡úW‡h?ğ—|[ñ¡w¡]\ÄñJ\ë\édC„9\à7\Ôú\Ö5*¶¹\"’6¡8§Ì“ù\Ù/\Ä÷‡\Ş\"ğ\æ©[\Üù7k\åy\Ê\ë•\È*ÀxV§ğ¯Yğe\Å\Ç\Ú5›«½I\ÆR\Ê;²\Ó9=•\Èæ³§VT_/\èm4\ê®e\Äú[X>¾Ó\ãK–<(8‡\ÓÒ¾~ø/s®i-\Õt¯jp[Ìºr\Êmş\Ñ\æ!‘Ÿ¡cÔ¨\êxª©)\Õé¡<b¦ıœ‘\ÇşĞšd\ÂóC\×b4²¼\r\ã+\Ã \à\à\×SûI\êÿ\0„A\áK¸YÕ‹c“\Ïô\ÍcJ“ƒiõ0\Å\ÔRJ¥õG‚~\Ğğ›\í\'Rñ\Zˆö]*¢l06œ{sù\×?\ã{K\è~\r\Ã-Î¨ó‰†V&.~\è=O•	8bT\Ğòñ\Õzr¨Ö§Ï Ô»k\Ù>~\Çÿ\Òø®\Ù\Êd>q*;LP’ª\Åx7{ğ¾\çN{Mn\Öú9evµÿ\0C\n\ä\0ø<\ëÒ²|,–ğ_Im~\Ñ\Ëd†\éAQ\ÛÒ¼\ìu›‡Mtó91Wæ©\îş1ø¥\á¯ü\Òô\íuöÖ\"A4_\ÄÌ‹\Ãı\å\Å|ù\ã//-a»°f&8\Ú\â\àŒ®@İQšô°•¡]r\Ït{S©:PO¹ôß‚|a\á-\ÂQj¾ğ†œº\Ä\ê‹* \ne|pd\Ç\Ş#8\É\æ¾ø[ñ*\ËÃ¦TÔ§Vœ1\àô÷5\İ%(/tÒ†5\í&{¾·ñW\Æúmœú–§¡‹Sµ¼µP ®;W\Ï\Ş<ø\Ño©\é÷\ZmµÜ²G#V\ÎF3\Ğ{VN¨õ:j\ãÒ”™‡«|J\Öo¼Q%\êÜ»5Á\Æ\äm¿.:W+\à\ß\ë¾6\×\ÃK´r®\àK.X“®\æü+I\Ê\ãcÎƒ©VwGl—úŸÄ¯\Ù\è\r$¼R\\lrË´`·\ç\Óñ¯ ¼ğûÃ¿<)u\ãf\ê[KxÉ’úT\Ã\Ê½O<(Myµ±’—\îè«¶zÔ°vj¦\"VHğ4\Ï\rM\á\Èle‘¢`¤«‚z\ë\íY?¾\'_xú\í °¶ş\ÏĞ ô{l6l$˜ú\Ê8\ç§N)­kUY¿¼óóf\Şÿ\0#Áø\ë]\ËY\ÆPy\Ñ)\Ï?t\Zö>£.\ç‹Ìÿ\Óø‚\Ú\ã\n\Ç?1õ^«õ¯Ÿ7{·€\î\İm5¦hÏ™5›@¹\Æz’9¨üş§Pÿ\0®gù\Z\â\ÆEK‘¾\ç&-½=H¼I®]\è\Ú5¼ñG’Mi4-O]§\ÈVw\ä\raôı’´Ë½ê²¿s\×\Äü5¾\rø‹ºÆ¡¡\İ,p_GeöØš$ù™UÂ¸9\àœ2š\îÿ\0b\Ïù+Wöºÿ\0\Ğá¯¢\Ä\ÒT¨óGs—ı¥Wl[Ò¿e]6\ÙÄ#\Ö/®“o\r¹@\Ëü!³\Èü+\é-KşB³}¥x±uWSŞ¡ƒ£-Z8½\Â\Şøe\á\éu\ß­…¡\Â<\Ã¶\Ù.\îKŒ“\éY?µ\Çü‘‘ÿ\0_vŸú0V88}r²…V\ìk‹Ÿ\Ô\é9RJ\ç„ümø×«|\\\Õ\Ú¤\Ó|3§°û÷LŒ	e\Çñz/E\ç8Ÿ¨ÿ\0x:ûŒ.\n†8\ÓG\Æâ±•±•I^\ãR\Ü¦P>^¹\îji{ÿ\0½]6F7\Ğqoƒ\Øqıiÿ\0ò\Í>µ\\¨.\Ïÿ\Ù'),('76653','Aoi','Elec. Eng.',60,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0H\0H\0\0ÿ\á\0€Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0J\0\0\0\0\0\0\0R(\0\0\0\0\0\0\0‡i\0\0\0\0\0\0\0Z\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0\0 \0\0\0\0\0\0\0H \0\0\0\0\0\0\0H\0\0\0\0ÿ\í\08Photoshop 3.0\08BIM\0\0\0\0\0\08BIM%\0\0\0\0\0\ÔŒÙ\0²\é€	˜\ìøB~ÿ\â ICC_PROFILE\0\0\0lcms0\0\0mntrRGB XYZ \Ş\0\0\0\0\02acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\08cprt\0\0@\0\0\0Nwtpt\0\0\0\0\0chad\0\0¤\0\0\0,rXYZ\0\0\Ğ\0\0\0bXYZ\0\0\ä\0\0\0gXYZ\0\0ø\0\0\0rTRC\0\0\0\0\0 gTRC\0\0,\0\0\0 bTRC\0\0L\0\0\0 chrm\0\0l\0\0\0$mluc\0\0\0\0\0\0\0\0\0\0enUS\0\0\0\0\0\0\0s\0R\0G\0B\0 \0b\0u\0i\0l\0t\0-\0i\0n\0\0mluc\0\0\0\0\0\0\0\0\0\0enUS\0\0\02\0\0\0\0N\0o\0 \0c\0o\0p\0y\0r\0i\0g\0h\0t\0,\0 \0u\0s\0e\0 \0f\0r\0e\0e\0l\0y\0\0\0\0XYZ \0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-sf32\0\0\0\0\0J\0\0\ãÿÿó*\0\0›\0\0ı‡ÿÿû¢ÿÿı£\0\0\Ø\0\0À”XYZ \0\0\0\0\0\0o”\0\08\î\0\0XYZ \0\0\0\0\0\0$\0\0ƒ\0\0¶¾XYZ \0\0\0\0\0\0b¥\0\0·\0\0\Şpara\0\0\0\0\0\0\0\0ff\0\0ò§\0\0\rY\0\0\Ğ\0\0\n[para\0\0\0\0\0\0\0\0ff\0\0ò§\0\0\rY\0\0\Ğ\0\0\n[para\0\0\0\0\0\0\0\0ff\0\0ò§\0\0\rY\0\0\Ğ\0\0\n[chrm\0\0\0\0\0\0\0\0\0£\×\0\0T{\0\0L\Í\0\0™š\0\0&f\0\0\\ÿÀ\0\0H\0H\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùúÿ\Ä\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3Rğbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿ\Û\0C\0	\Z!\Z\"$\"$ÿ\Û\0Cÿ\İ\0\0	ÿ\Ú\0\0\0?\0û.«[\Ş\Ú\\ k{¨e\rĞ«ƒš`,\Ór(\æ®§©\Øi±«\ß\ŞAlŒp¦G>µò\ç\í—\ãkK\ÖN‹eª5Œj¹Xl®¯Ô–\Ï\İ8#t\îzd\ê»\Ù\ZÆ\ÕÍ¿~Ò—\ZŠ/´û]#L\Â\ŞV‘r\ì\Óp0q·ÿ\0\×_¾£.]CoŒôâš¹VŠ>±\Õ?k\rFXUlô˜­®Ode<Ü¬zc<\ZùK»–=	\0\çô#úÓ·˜Yv?Cşüv\Ñ<ht\í*ñ–\ßY¹–H\Ù…U,¬;z`w\Í|ğ\ïY—Oñ^›w,’ùit F\Ãp{\ë\Û9¥\'(« \äLıW+\Ãş#°¾\Ñ,\ïf¹‚\'šr¡ø8\ÏÖª3º¹‹Vzk-õ\Í5@?iBpEW0X\Ô\Ís·^)²Cˆ#yO®p)]ˆÿ\Ğ\êcñn;\"e\ç$\àÆ ‹á‹Q¾U\Ò\\ck¢Gşƒ^µ¥\äyß¼\ìtV~7ñ4Qù6ú¬Ì¤p0¦A4ÿ\0ü2Õ’G—RÖ­ô\ç]¾KY\È]‡¯P1ú\Ör«AtE\ÅT}Y\â´©¿Õ§\ÓõQ\ŞyŠKJ6’‘=\Íwÿ\0µ‡\'´ğ‘,¾%¹\Õ.­µ–%AuòœI†Qœ…;¹\ã\0×Ÿ‰©Õ’G£ƒ„\Ú}mø-\à‡\Ö:•„zøo%|¶\àš\í4;Ÿ\ì\Ú_\Ş\Ã5\Ä\Ó\Æ$}I<øW\í%)4z±¥¢µÇ†<;\rºtChÀÈª:Gˆõ?jOm\Ö\Ê!¤n×Š«\Ø\Ò+›b=GÂºW“-İ­š¥\Äq³\"Áa\ÏôªºT¾6»ñ\Ùcû-¢K´ª¨\å3ƒ’A\Ï´t9\ê+\ìz—„u)µ\è÷‚	\\Og™NNW¯\ì?\0´\ãağ“B±¾’öñ\É<õ+#³û\æ½\ZX¥\ÙDñ\ëÑ—6²<\Ê;½Bº¸ˆú¨jú#m¨\é,CğZ¿­ÿ\0t\Ç\Øÿ\0xù\ŞmWQt>d·ú–\"¾†x\ì¶òÁ´u%WŠ>´¿”~\É÷?ÿ\Ñ\í“ã¶Œ’Ì©spU-L±\æ\"Hú¿\å\ÏJò¸¼¦ƒûõ\Ôw2ÿ\0y`Qvsò\Èö7øó¤\"iÙšG7(\Zb‘ÿ\0¨8\äõæ¼šø}šS(»%>E>q\Ç\\¥	3ºñw\Å/ø»K]?VVò\Çsº\Ñ\Ú#¤m,H\è\n–¼\ÏÅºe¢iñ\ÜYZ\Í\'“ş°¼¤\å}3Û¯ZÂªŒÕš6¥R­	sE½•Îˆ4g[v†[hdh”!\Ê/r·?•p¹’KıF\Å`ò ‘7ù.ùÄŠ#<\à©ı+’tù\Ñ\éP\Å:²|Û›6> ´·ûU\ä(,T•„#\"4‡<·$qô\ëU\ít™4\Øú22M¸’ª‚}N\àp~•’zª\ïC2oÜr\ÔZ\Ç\å¥Êœ\ÂÀ’1\ÑÁ\Æ¦2j\Ã\Û^k«©\Û\Ï\ÔYIw\ïs€p£°úp3]¾\Ç5GÈš\Ü÷/|AÓ›HÓ´¡x‘ùp²gŞ§‘ù\æ¾_†\ÃX1-Å¬m*Ê¹\Û…#Ø«`‚\äWB”’\Øñª&\ÙôGŒ~4[hú\è¶Ó®m\ï\Ób¬€…;²NGt\×\Íw:e\äù\Ò\ÛÊ¡~ñòHHõ¬\åV]Œ\ì\ÏK¿ø·©\ÜK®\ÛD\îöš‹‡Œ3 ^\àzñó4bí‹¹m\Ø\çµC”·ÿÒ–ö\æ\Ê¨\ä»ó\æFF\nT““‘\×\ÓÒ™ik©º\ß\Û2\íÕ¢%	\Æx$\ã±ùŠˆ\ÊN5%ğ4¿öK¤÷’Nó7D²d±\ÈÀ¬\rrú1û¦“kg×¥5k\Êú±u¹¬Ï›+\Éu27[e\ÂD3G\Çÿ\0^²G‘06L§¨&Ÿ*,N—\Ã)j“\ŞM\åG³Dª¨\00\0«\í	\îs\èsq^\Ç«I\æÛºÀN\â:s\\õhs\ìuRª¡\Ğ\Òñ\r¬3\Å ş[9GWF\Ú÷¬û\ë¥\Ô\á\Ø\ÒF‡?1\'\nÂ¸ş¯8½•Z/©‡V+x\Â$†VI™K¯¥Eqz|JL¬\î9\nxQ\ßó®ªt\Ûf5e\îG+›†¶m¤ÜŸ‰$\ÓRR\ê\"·\Îñ“^„*8e«¹r\Ş\â[Uÿ\0^}\ÆxªS@Uw1iôW¹\r\"—\í­\ï­a\Ô\ãTIˆ¦*¸\ŞNúÆ£Õ‰›\Ãú„	’V%“¯÷X6!XW‡4n·\"P²?ÿÓK{kt\ëHf@¾¤\åª\Ëu“\è\ßÊ°Z#©Yh/\Õ.V\ëUŸ|Š«¼°$\àÉ¬\İGş>\î?\Üÿ\0Ù«U±,Ö¶¶²››k¢_ı–ª^ÿ\0Z\ßJh:\Z¦\Ş\æ%\ÇÚ‹G\\\ÕË•Ms&He,Fí»G•Z—\ï¥LDG\Ê$c\î\Ø9©OQT„\Éb\rHü±J¿\ĞUÉƒ\È\í“g\'\0\Óı[ÿ\0¸‘¦f÷9\rXûn¤VM¦’bpm\Î?\Öƒ¿\ã\æ\Ûıôş•Œ[nÆ^\'ÿ\Ù'),('98765','Bourikas','Elec. Eng.',98,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0H\0H\0\0ÿ\á\0€Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0J\0\0\0\0\0\0\0R(\0\0\0\0\0\0\0‡i\0\0\0\0\0\0\0Z\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0\0 \0\0\0\0\0\0\0H \0\0\0\0\0\0\0H\0\0\0\0ÿ\í\08Photoshop 3.0\08BIM\0\0\0\0\0\08BIM%\0\0\0\0\0\ÔŒÙ\0²\é€	˜\ìøB~ÿ\â ICC_PROFILE\0\0\0lcms0\0\0mntrRGB XYZ \Ş\0\0\0\0#\0 acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\08cprt\0\0@\0\0\0Nwtpt\0\0\0\0\0chad\0\0¤\0\0\0,rXYZ\0\0\Ğ\0\0\0bXYZ\0\0\ä\0\0\0gXYZ\0\0ø\0\0\0rTRC\0\0\0\0\0 gTRC\0\0,\0\0\0 bTRC\0\0L\0\0\0 chrm\0\0l\0\0\0$mluc\0\0\0\0\0\0\0\0\0\0enUS\0\0\0\0\0\0\0s\0R\0G\0B\0 \0b\0u\0i\0l\0t\0-\0i\0n\0\0mluc\0\0\0\0\0\0\0\0\0\0enUS\0\0\02\0\0\0\0N\0o\0 \0c\0o\0p\0y\0r\0i\0g\0h\0t\0,\0 \0u\0s\0e\0 \0f\0r\0e\0e\0l\0y\0\0\0\0XYZ \0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-sf32\0\0\0\0\0J\0\0\ãÿÿó*\0\0›\0\0ı‡ÿÿû¢ÿÿı£\0\0\Ø\0\0À”XYZ \0\0\0\0\0\0o”\0\08\î\0\0XYZ \0\0\0\0\0\0$\0\0ƒ\0\0¶¾XYZ \0\0\0\0\0\0b¥\0\0·\0\0\Şpara\0\0\0\0\0\0\0\0ff\0\0ò§\0\0\rY\0\0\Ğ\0\0\n[para\0\0\0\0\0\0\0\0ff\0\0ò§\0\0\rY\0\0\Ğ\0\0\n[para\0\0\0\0\0\0\0\0ff\0\0ò§\0\0\rY\0\0\Ğ\0\0\n[chrm\0\0\0\0\0\0\0\0\0£\×\0\0T{\0\0L\Í\0\0™š\0\0&f\0\0\\ÿÀ\0\0H\0H\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùúÿ\Ä\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3Rğbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿ\Û\0C\0	\Z!\Z\"$\"$ÿ\Û\0Cÿ\İ\0\0	ÿ\Ú\0\0\0?\0ú\Â\Í?uœÊ²¢\Ôo=Š\à¥d£\Z;³}v\äñ\\óOr\ã™ZX\Ø\ÔÊˆUT\çq\æ¼\Ëâ‡l<7bš2]\\Ë®_\ÂşDvñ\ä\ÛG¾s1\á\ÙI\ri’»\Z§)h‡|Dø§\àŸ\Ü-kU/¨•\röH\ÌÓ€z\îv WË3øyö•¼•g0\Ü\É\æI3»H\Ò}\çc\ËIÉ¦ªÁ›¼#J\ç©\İşÔ[Ÿ.x‚h³0=¸\Ï\Ğyœ\×\Ê\ÚÎ—se\"Á\ÚD\ÜYz\Ç\ëúV«•˜ºmmø3\ã/€|Us®¨ö²°H\íµŒ-#z+•\Ğ\×\ÅV:}ü‘+@&H\\m\Èühµ>\à©M\ì\Ğû„ù³\ë^?û0ø\Úh—\Õ.\ÍÖ¡¤x\åf\Ü^$\0Or¬úc5H%°Y­\ÏY+\ÍY1\Öv+P{vŒCo\æ\'s–Â õ5W^\×t\ë9ZÀ:O|\ÈYm\Ç$ıG¥KBº?ÿ\ĞúeR§U¨±¥\Æ©¶\Ó\Ä\î4\ÔñG\ÆK\É\ï¢[\éó,úaO~KÊº\Û$^<ñmÃ•X¡»°\0¡³ŸÏš\Æm»#º\ì\r\éğ\ÄL>Df0»€À\Ådø\Ã\â‚R&‚mm„•\È\È\ë\È\ÍZ—X\'­¤y?ˆü\á\ÍSYk§µd†\"U\à+¨k›9“Ï·•^\åu9zæ¹¹\ê-=%\no¡WÃÒ¬\í„YD±t<sù\Õ{xJ\Æ\å\íd\ÕH§\æ1\Âî«¹`1MB£\Õ\ÜÊ¤ ´G5ğ¦\Ö\ãÃŸ´ˆ\Òmw}–\â\Ş\â&\0avg\èTcı\ã\ë]×„\ì\ì\äı ,õ(g€\Åq¡\É<Dõ®\å=ø\rù×©No’\Ìò±¾¨õ?L\ÖzE\Å\ÊH±ùh[q+KRÓ£¾²–\Ú\áCE\"•a\íM«\èp³\å\ËmSR½}C\Æ\ë¨,7\Öû Œ*ü³ \'¨?¥zŞ¥ğOŸNš\Â\×P–\Ö	 *·>™¯O1•k\Òø}O©\É\ê\äğ§‹W}tgÿ\Ñú‘E8\n,UÀ`ÒŸ»\ÅCZ;œ¦•gM®Fl\ÄadH”:ÿ\0­U\\†#¾I?€\Ôjv©oq\Ê6>\Ñ{©®nN]S¹\ÖUl\Ö\èù\Ã\â\ïƒ|Ju>}Y¶±\İ\í1#fy\Æ\Ğ3‘¦+Øµ«¡§\êM\å4²<Q}=MDšcºYjÖ§)\âM\éş\Z\Ó-\æ†&\ÔZÙ¼ò‰µ]\Âó\ÇÖ¶¾ \êVr\\X•¶92Á\Æ\Ğ;\äıEgYE5b¨JRnM=øKÃ\'›\Ä÷——³\ÛÆ¨TFN~x;q÷@\ì9÷¯R±\Ûqr\Ì8 ö\èE/l\íÊªA?yš>³ˆx\çCH\ì•[\ß\Z\àG\å¹l@Å¿J\í|¥¢´š³¹fa\äF¸\áB““ø’kZt\Ûi½:®&0Œ¢·gL\Ø\ÛÒ&1]g™},BqAÿ\Òúš¾hñ‡Ç½~}B[\Ãocn¬lcóeaØÀŸL\Z\éXi¾„¹¤}%rg\Ê[¯8¯\ï¾\'x\Î\îøZ_ø«PY\ÎA	—qÀ\È@6\ç\Ü\Óú¤ŸPUö‰‹C‚\ëşx0,Oe#\ÔW\Ï³\İõ÷Š5]L\ë:\æ¯z¶\r¶\ÒŞ»Dû\ÙĞ–L\à\à/\æs\ØW.*²J\ïs§\ï6\Ñ\è\Ş\'¹\Ô\Úú\ì»Tœ•%\É`\n©8ü*†ªe\Ò/\Ô\\\ÌVĞ‚fƒ\ÊOğ·¿p+Î•\ï©\éA¤®#ø…¯6º º:¤\ÉXá¸Œ€sr9˜\Å^ñlšL>17GP¸\Äq\à‡¸ı\ÙıqC}‘\éÓ«O—\á/xFMV\Ñ&“TbZD©`=\ÊñT´»\Å\×oÕ­÷g«\îF˜<*úŒõ?…e®\ìÂ¤¹¶>ğj\íğ¶œH\Ã<\"FÕ‰\'ù×ƒüUÖ¼c¢\è÷\Z÷‡|Y{a\rŒY¬\ÎÆD»”•a\é\Ğûu®ú©\ÎĞ½™\ã\×\ÃTW´>Œ—ñ…—ÇŸ‰)	’=j\Ú\é†3\Ù+m>ûv× °’{3\ÔV\Øû(šùWIı¥¼Q¢j:‘|™\Ú7x\ê>ğ¥õZ\íÿ\Óñ\rs\Æ/¬vú&Vñ\ÉÈ \\uã©®6\ÃşB\ëş\àşU\ê\Êm¾S’:\ï²™šiKO+	$s)\Æ\îÀñ\Î9ü\ê-ş[ÿ\0¿]\â‘lôƒ>6ƒÁ–\ïPvM6ñ.\Ïe\Îw\ã¾\ÆÇ¡jó¿ÿ\0­ÿ\0·7ÿ\0\Ğ\Z²\ÄRX5.†”f\ã%n§\İ2\êS§°\Ü\Ú\\&\å`C#©\èA\èEr^ÿ\0‘Aÿ\0¯¿ô\nù‰;JÇ´•\ãsƒñV¡\ÂY3Ç§Úœ\Ã\ä\æ¡ñüŒ\Òı*Y\ß¹©cs6¢¯JÏ‡ı]a&\rkñû\Çi=¡ğÍŒ¥¼\Â\Z\í”ÿ\09	ø¾\Õ\æ¿?\ät¿ÿ\0x*ô°T —7S\Í\Ì+\Î6‚Ù™V÷³\ÚFe†y#eSÊ¶2I\ï\ê*¥\Çü{IôÎ½[µ±\å3u5+[†\Å\Ìf1,#‚}\ÓúÊ±—ıb}WúU\ÆlV?ÿ\Ù'),('98988','Tanaka','Biology',120,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0H\0H\0\0ÿ\á\0€Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0J\0\0\0\0\0\0\0R(\0\0\0\0\0\0\0‡i\0\0\0\0\0\0\0Z\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0\0 \0\0\0\0\0\0\0H \0\0\0\0\0\0\0H\0\0\0\0ÿ\í\08Photoshop 3.0\08BIM\0\0\0\0\0\08BIM%\0\0\0\0\0\ÔŒÙ\0²\é€	˜\ìøB~ÿ\â ICC_PROFILE\0\0\0lcms0\0\0mntrRGB XYZ \Ş\0\0\0\0!\0acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\08cprt\0\0@\0\0\0Nwtpt\0\0\0\0\0chad\0\0¤\0\0\0,rXYZ\0\0\Ğ\0\0\0bXYZ\0\0\ä\0\0\0gXYZ\0\0ø\0\0\0rTRC\0\0\0\0\0 gTRC\0\0,\0\0\0 bTRC\0\0L\0\0\0 chrm\0\0l\0\0\0$mluc\0\0\0\0\0\0\0\0\0\0enUS\0\0\0\0\0\0\0s\0R\0G\0B\0 \0b\0u\0i\0l\0t\0-\0i\0n\0\0mluc\0\0\0\0\0\0\0\0\0\0enUS\0\0\02\0\0\0\0N\0o\0 \0c\0o\0p\0y\0r\0i\0g\0h\0t\0,\0 \0u\0s\0e\0 \0f\0r\0e\0e\0l\0y\0\0\0\0XYZ \0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-sf32\0\0\0\0\0J\0\0\ãÿÿó*\0\0›\0\0ı‡ÿÿû¢ÿÿı£\0\0\Ø\0\0À”XYZ \0\0\0\0\0\0o”\0\08\î\0\0XYZ \0\0\0\0\0\0$\0\0ƒ\0\0¶¾XYZ \0\0\0\0\0\0b¥\0\0·\0\0\Şpara\0\0\0\0\0\0\0\0ff\0\0ò§\0\0\rY\0\0\Ğ\0\0\n[para\0\0\0\0\0\0\0\0ff\0\0ò§\0\0\rY\0\0\Ğ\0\0\n[para\0\0\0\0\0\0\0\0ff\0\0ò§\0\0\rY\0\0\Ğ\0\0\n[chrm\0\0\0\0\0\0\0\0\0£\×\0\0T{\0\0L\Í\0\0™š\0\0&f\0\0\\ÿÀ\0\0H\0H\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùúÿ\Ä\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3Rğbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿ\Û\0C\0	\Z!\Z\"$\"$ÿ\Û\0Cÿ\İ\0\0	ÿ\Ú\0\0\0?\0÷¦ñ^sûCx\ÄxOÁ&k\ãg¨\ê¬m­\äO¿\Z\ã2:ú8±aVB\Ô\ç~\"|aû¯.\áå‰–=\é%\ë\rÅx+û£\Í\éÓ½|\ä°\ß\êª,\"»–\Ò.8RylŸ\Ã<û÷¤\êB;³UJodkxQ¾\×u«‹\İY+\æ¯\î\æ“,\0GUqÿ\0×­á¾£®\éjˆò\Ü+\å$ˆc \à€=½+c(\Å\Ø\Ú8*\ÒW8\É&²†]\Ø\ÃF¸\êI\çp\è8\äW¤\ßü\Ö\Ô=¾©o\ã\î21}zƒPó\n[\\\Óû>ª9ß‡Ÿµ\\\Í>™!\Ù8_>9RF^2Ëœd¤`ğ1Ş°<]\àOxM|û\ÈR{rpd‰·õ\ÍiD\'³1©†œ>$}wğc\âÆ“ñÌ°’\Ûû3Z‚?1\í÷,©\Æ^&\ãp€A\0Œ\Äñ‡„üA¨h\Zå³¥L\Ñ]Y\Ê%ˆn*	T\ãøHÊŸc[\\\ÂPV\Ğı#‰k#\á×ˆ,ü_\á]3]±pc¼d\Æ0T \ÄŠ\ÑZ\ÇEÒ›i‹”’Mª0”\Ä\ËP\0zsNµ8‚Æ£nr@õ¤Æ‘ÿ\Ğ\ã?iøe\Õş<\ØiR;ù+alˆ¥² 3J\Ì@\íœ\0}vAZß´E³ÁûD\è7R!òn4È¼¶õh\Ú\\\Ãrşu5\ÛQv4Ã¤\ä®z\'€4M7EĞ’\Î\Ş%w\'tTe˜\×!ÿ\0+M°YYZ\Şj§\Ëo	h\Ğ÷ºgÚ¼w½Y\îFTÖˆõN²\Ó$™­\"‰X»€x\É\ïŠ\å/u«\İ_\Ã\ßiÒŸ\Ê-¹¸#?Ö³~f\É\'±\×\êRF4ª?\ÚlW„*\é«rc\Ô\à\ÖüMs,4’3\ÅŸ—!@\ÆqG°\æ\Ö\âu¹t=/\Å\Ú]¾¹£\\Y8S½x=~†¹\ï\r‰’•¶jÃ˜d\Ë\"{Œ>•š\\F^“š>mñ™&•®\İY9Ä9\éŸü%^7\Ó\'–Y%7Íº\åñ\Ç===º\nõ\èbc\Évö<Š\ØI{E·>„ı‰µu„QAnk-N\æl\ä\Í\æep+¦ı›ôña j1\áNo7	\0yk‚qÓ§ÒºhWU¢\Ú9q˜Ya¤“w¹\é„fV>¦ƒš\Ü\ã\nn\Ö\âP~$…X„r)ÿ\Ñ\êÿ\0i_É®hšg‰lQÿ\0‡\ç2£–·q‰^\ß+w\áO­uƒ\Æ\ZF¡e5ú<K<M•ù?Î»ª`kY®S*u¢¤ÏŸtŸkW6p\ÚZI$\Zd8X„\0(”c\Ì}ı9\ë]¿†ş\Íkksg\ç~\Ë#E@m¿Åqƒø\×\ÎWS¥\'E‡P«¡|3 \Èt\èB&Š\è=¼ \ä&\0\È\ç±9\×5©¨\\jwvV÷‘Ç§•Ä®f\Æ\ç€\ÙŸn•„¯(\èt\ÓQR¶\çcic¦\ÍrPX\Åo/V~ëšŸQkM*yüÖ\æY\ÃH\åqÀù\È?J\ÅE-\İ\ÄV\ÖhX:7AÀÀ®}z\æûÁ‹y<M®\í‘œ\ç®3¼ŒRK[9¦®Š^!½Šó\â&‹!Á†	\Ùw`nR+š¹…§¦i\ìU„\î±n-»r±\Ç¯\é]´ ¥¥G)v>­øuc{¡k7Z{¬& \ÖÁÑ²¤\Ç\Z)Áô\r¸~\Î~\Æ\ZgöWÁ‰`_\ík´	c)&\ÆñRG±\êĞ¥\ZpJ\'Š­*\Õ9¤{B\nrkc”š\Í>Ö“ÿ\Òç®µ×´‹~\ì\ÃÖ¸m_Q.e‘ˆ	\à\nú\éVQ\Öçœ©¶li+†/\Z·\Úe)c¨\'—??\ê\ßC~#•yM\Õ\ä…\Şlü\Å\Æ?S_7˜\Â§u¹\é\á*Ê‡¡\ï^µ\Óô=P\İjV\Ğê‘œ‹Cq÷b\ÆU±ƒ»®O5\çñ4‘\Û=\ç\İ\ê#~F\\W‡<=Hh\Ïf.\è{ü\Ş!>!•£’\êµŒ\æH c=ONÿ\0•x\å×\ì-­c‡K·K4PD\\n#‚N:ş5\Í,4\È\é2\Ø\ë¼Wwl·w0BBÅŸ1S8?7_ÇÎ¼\Î\ÚûVñ®\ZØƒß ŸóŠ=\"¼™Ÿ¶ö\ÑG_ğú)¼Cñ\0^º“gbC(+œ·a\Ï\ç^“ğ\ÇÃ£J\ÓD¸šNOËŒû\ÖU16\\°5†\ïšg¶ü}Oğ\ãh\Úz\Çisö™n&ˆœ^F,\Òõ\É=;We¦M<™qƒ\ç€?\Zè¥™¸¤¤Jùlg\'(»äƒœ`×œ\ÙM{kl‘>¡u.Ó¹K\ÈN· ®¥šAı“‰\å²_hõ\Ã\éş#\ÕVD„¼r‚q™Ÿ\ÌV\Ñ\ÆÓ™Œ°sGÿ\Óğ\r^\ç÷Pş#“Š«ª}ôÿ\0v½Z\Ó{ÓŠµ\Ì{±ó¢y³Kuÿ\0ş?\ÌW\'R\ätºVË™b\ÓMŒ—\ÓLÁ!·‚&y]¿\ÙU‰úzV\ÇÁ¿ù-\Şÿ\0°‚ÿ\0è·«G`Š:¹ş¯‡¯l\×\Äz{\Û\Ü\Ï\n\Ü5Œ—Vˆ\ád+\Æ\î3·\'\ë^\ÑûCÿ\0\ÉI?õ\Æı×…Œ›oMO“\İ>ğ\Ùe‹È²‚€˜@Evÿ\0|\îŠğ\êM\Üöc¢4ô­&t]ÿ\09±\Çÿ\0^´\íú\nÇ™É–\Ëğ¸Q´P?\Z\ÚV9§&´¾•¦\ÆOQa\Ê\ÈqƒJE\\{÷±ÿ\Ù');
/*!40000 ALTER TABLE `student_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables_in`
--

DROP TABLE IF EXISTS `tables_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tables_in` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fields_` json NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables_in`
--

LOCK TABLES `tables_in` WRITE;
/*!40000 ALTER TABLE `tables_in` DISABLE KEYS */;
/*!40000 ALTER TABLE `tables_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables_out`
--

DROP TABLE IF EXISTS `tables_out`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tables_out` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tables_` json NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables_out`
--

LOCK TABLES `tables_out` WRITE;
/*!40000 ALTER TABLE `tables_out` DISABLE KEYS */;
INSERT INTO `tables_out` VALUES (1,'{\"advisor\": {\"fields\": [{\"field\": \"i_ID\", \"values\": [\"10101\", \"22222\", \"22222\", \"45565\", \"45565\", \"76543\", \"76766\", \"98345\", \"98345\"]}, {\"field\": \"s_ID\", \"values\": [\"00128\", \"12345\", \"23121\", \"44553\", \"45678\", \"76543\", \"76653\", \"98765\", \"98988\"]}], \"table_name\": \"advisor\"}}'),(2,'{\"classroom\": {\"fields\": [{\"field\": \"building\", \"values\": [\"Packard\", \"Painter\", \"Taylor\", \"Watson\", \"Watson\"]}, {\"field\": \"capacity\", \"values\": [500, 10, 70, 30, 50]}, {\"field\": \"room_number\", \"values\": [\"101\", \"514\", \"3128\", \"100\", \"120\"]}], \"table_name\": \"classroom\"}}'),(3,'{\"course\": {\"fields\": [{\"field\": \"course_id\", \"values\": [\"BIO-101\", \"BIO-301\", \"BIO-399\", \"CS-101\", \"CS-190\", \"CS-315\", \"CS-319\", \"CS-347\", \"EE-181\", \"FIN-201\", \"HIS-351\", \"MU-199\", \"PHY-101\"]}, {\"field\": \"credits\", \"values\": [4, 4, 3, 4, 4, 3, 3, 3, 3, 3, 3, 3, 4]}, {\"field\": \"dept_name\", \"values\": [\"Biology\", \"Biology\", \"Biology\", \"Comp. Sci.\", \"Comp. Sci.\", \"Comp. Sci.\", \"Comp. Sci.\", \"Comp. Sci.\", \"Elec. Eng.\", \"Finance\", \"History\", \"Music\", \"Physics\"]}, {\"field\": \"title\", \"values\": [\"Intro. to Biology\", \"Genetics\", \"Computational Biology\", \"Intro. to Computer Science\", \"Game Design\", \"Robotics\", \"Image Processing\", \"Database System Concepts\", \"Intro. to Digital Systems\", \"Investment Banking\", \"World History\", \"Music Video Production\", \"Physical Principles\"]}], \"table_name\": \"course\"}}'),(4,'{\"department\": {\"fields\": [{\"field\": \"budget\", \"values\": [90000.0, 100000.0, 85000.0, 120000.0, 50000.0, 80000.0, 70000.0]}, {\"field\": \"building\", \"values\": [\"Watson\", \"Taylor\", \"Taylor\", \"Painter\", \"Painter\", \"Packard\", \"Watson\"]}, {\"field\": \"dept_name\", \"values\": [\"Biology\", \"Comp. Sci.\", \"Elec. Eng.\", \"Finance\", \"History\", \"Music\", \"Physics\"]}], \"table_name\": \"department\"}}'),(5,'{\"instructor\": {\"fields\": [{\"field\": \"dept_name\", \"values\": [\"Biology\", \"Comp. Sci.\", \"Comp. Sci.\", \"Comp. Sci.\", \"Elec. Eng.\", \"Finance\", \"Finance\", \"History\", \"History\", \"Music\", \"Physics\", \"Physics\"]}, {\"field\": \"ID\", \"values\": [\"10101\", \"12121\", \"15151\", \"22222\", \"32343\", \"33456\", \"45565\", \"58583\", \"76543\", \"76766\", \"83821\", \"98345\"]}, {\"field\": \"name\", \"values\": [\"Srinivasan\", \"Wu\", \"Mozart\", \"Einstein\", \"El Said\", \"Gold\", \"Katz\", \"Califieri\", \"Singh\", \"Crick\", \"Brandt\", \"Kim\"]}, {\"field\": \"salary\", \"values\": [65000.0, 90000.0, 40000.0, 95000.0, 60000.0, 87000.0, 75000.0, 62000.0, 80000.0, 72000.0, 92000.0, 80000.0]}], \"table_name\": \"instructor\"}}'),(6,'{\"mytables\": {\"fields\": [{\"field\": \"id\", \"values\": null}, {\"field\": \"myvalues\", \"values\": null}], \"table_name\": \"mytables\"}}'),(7,'{\"prereq\": {\"fields\": [{\"field\": \"course_id\", \"values\": [\"BIO-301\", \"BIO-399\", \"CS-190\", \"CS-315\", \"CS-319\", \"CS-347\", \"EE-181\"]}, {\"field\": \"prereq_id\", \"values\": [\"BIO-101\", \"BIO-101\", \"CS-101\", \"CS-101\", \"CS-101\", \"CS-101\", \"PHY-101\"]}], \"table_name\": \"prereq\"}}'),(8,'{\"section\": {\"fields\": [{\"field\": \"building\", \"values\": [null, \"Packard\", \"Packard\", \"Packard\", \"Packard\", \"Painter\", \"Painter\", \"Painter\", \"Taylor\", \"Taylor\", \"Taylor\", \"Taylor\", \"Taylor\", \"Watson\", \"Watson\", \"Watson\"]}, {\"field\": \"course_id\", \"values\": [\"BIO-101\", \"BIO-101\", \"BIO-301\", \"CS-101\", \"CS-101\", \"CS-190\", \"CS-190\", \"CS-315\", \"CS-319\", \"CS-319\", \"CS-347\", \"EE-181\", \"FIN-201\", \"HIS-351\", \"MU-199\", \"PHY-101\"]}, {\"field\": \"room_number\", \"values\": [null, \"101\", \"101\", \"101\", \"101\", \"514\", \"514\", \"514\", \"3128\", \"3128\", \"3128\", \"3128\", \"3128\", \"100\", \"100\", \"120\"]}, {\"field\": \"sec_id\", \"values\": [\"1\", \"1\", \"1\", \"1\", \"1\", \"1\", \"2\", \"1\", \"1\", \"2\", \"1\", \"1\", \"1\", \"1\", \"1\", \"1\"]}, {\"field\": \"semester\", \"values\": [\"Summer\", \"Summer\", \"Summer\", \"Fall\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Fall\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Fall\"]}, {\"field\": \"time_slot_id\", \"values\": [\"B\", \"A\", \"H\", \"F\", \"E\", \"A\", \"D\", \"B\", \"C\", \"A\", \"C\", \"B\", \"C\", \"D\", \"A\", null]}, {\"field\": \"year\", \"values\": [2017, 2019, 2018, 2017, 2018, 2017, 2017, 2018, 2018, 2018, 2017, 2017, 2018, 2018, 2018, 2017]}], \"table_name\": \"section\"}}'),(9,'{\"student\": {\"fields\": [{\"field\": \"dept_name\", \"values\": [\"Biology\", \"Comp_Sdfghji.\", \"Comp. Sbi.\", \"Comp. Sci.\", \"Comp. Sci.\", \"Elec_ Eng.\", \"Elec. Eng.\", \"History\", \"Music\", \"Physics\", \"Physics\", \"Physics\", \"Yinance\"]}, {\"field\": \"ID\", \"values\": [\"00128\", \"12345\", \"19991\", \"23121\", \"44553\", \"45678\", \"54321\", \"55739\", \"70557\", \"76543\", \"76653\", \"98765\", \"98988\"]}, {\"field\": \"name\", \"values\": [\"Zhang\", \"Shankar\", \"Brandt\", \"Chavez\", \"Peltier\", \"Levy\", \"Williams\", \"Sanchez\", \"Snow\", \"Brown\", \"Aoi\", \"Bourikas\", \"Tanaka\"]}, {\"field\": \"tot_cred\", \"values\": [102, 32, 80, 110, 56, 46, 54, 38, 56, 58, 60, 98, 120]}], \"table_name\": \"student\"}}'),(10,'{\"tables_in\": {\"fields\": [{\"field\": \"fields_\", \"values\": null}, {\"field\": \"id\", \"values\": [1]}], \"table_name\": \"tables_in\"}}'),(11,'{\"tables_out\": {\"fields\": [{\"field\": \"id\", \"values\": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]}, {\"field\": \"tables_\", \"values\": [{\"advisor\": {\"fields\": [{\"field\": \"i_ID\", \"values\": [\"10101\", \"22222\", \"22222\", \"45565\", \"45565\", \"76543\", \"76766\", \"98345\", \"98345\"]}, {\"field\": \"s_ID\", \"values\": [\"00128\", \"12345\", \"23121\", \"44553\", \"45678\", \"76543\", \"76653\", \"98765\", \"98988\"]}], \"table_name\": \"advisor\"}}, {\"classroom\": {\"fields\": [{\"field\": \"building\", \"values\": [\"Packard\", \"Painter\", \"Taylor\", \"Watson\", \"Watson\"]}, {\"field\": \"capacity\", \"values\": [500, 10, 70, 30, 50]}, {\"field\": \"room_number\", \"values\": [\"101\", \"514\", \"3128\", \"100\", \"120\"]}], \"table_name\": \"classroom\"}}, {\"course\": {\"fields\": [{\"field\": \"course_id\", \"values\": [\"BIO-101\", \"BIO-301\", \"BIO-399\", \"CS-101\", \"CS-190\", \"CS-315\", \"CS-319\", \"CS-347\", \"EE-181\", \"FIN-201\", \"HIS-351\", \"MU-199\", \"PHY-101\"]}, {\"field\": \"credits\", \"values\": [4, 4, 3, 4, 4, 3, 3, 3, 3, 3, 3, 3, 4]}, {\"field\": \"dept_name\", \"values\": [\"Biology\", \"Biology\", \"Biology\", \"Comp. Sci.\", \"Comp. Sci.\", \"Comp. Sci.\", \"Comp. Sci.\", \"Comp. Sci.\", \"Elec. Eng.\", \"Finance\", \"History\", \"Music\", \"Physics\"]}, {\"field\": \"title\", \"values\": [\"Intro. to Biology\", \"Genetics\", \"Computational Biology\", \"Intro. to Computer Science\", \"Game Design\", \"Robotics\", \"Image Processing\", \"Database System Concepts\", \"Intro. to Digital Systems\", \"Investment Banking\", \"World History\", \"Music Video Production\", \"Physical Principles\"]}], \"table_name\": \"course\"}}, {\"department\": {\"fields\": [{\"field\": \"budget\", \"values\": [90000.0, 100000.0, 85000.0, 120000.0, 50000.0, 80000.0, 70000.0]}, {\"field\": \"building\", \"values\": [\"Watson\", \"Taylor\", \"Taylor\", \"Painter\", \"Painter\", \"Packard\", \"Watson\"]}, {\"field\": \"dept_name\", \"values\": [\"Biology\", \"Comp. Sci.\", \"Elec. Eng.\", \"Finance\", \"History\", \"Music\", \"Physics\"]}], \"table_name\": \"department\"}}, {\"instructor\": {\"fields\": [{\"field\": \"dept_name\", \"values\": [\"Biology\", \"Comp. Sci.\", \"Comp. Sci.\", \"Comp. Sci.\", \"Elec. Eng.\", \"Finance\", \"Finance\", \"History\", \"History\", \"Music\", \"Physics\", \"Physics\"]}, {\"field\": \"ID\", \"values\": [\"10101\", \"12121\", \"15151\", \"22222\", \"32343\", \"33456\", \"45565\", \"58583\", \"76543\", \"76766\", \"83821\", \"98345\"]}, {\"field\": \"name\", \"values\": [\"Srinivasan\", \"Wu\", \"Mozart\", \"Einstein\", \"El Said\", \"Gold\", \"Katz\", \"Califieri\", \"Singh\", \"Crick\", \"Brandt\", \"Kim\"]}, {\"field\": \"salary\", \"values\": [65000.0, 90000.0, 40000.0, 95000.0, 60000.0, 87000.0, 75000.0, 62000.0, 80000.0, 72000.0, 92000.0, 80000.0]}], \"table_name\": \"instructor\"}}, {\"mytables\": {\"fields\": [{\"field\": \"id\", \"values\": null}, {\"field\": \"myvalues\", \"values\": null}], \"table_name\": \"mytables\"}}, {\"prereq\": {\"fields\": [{\"field\": \"course_id\", \"values\": [\"BIO-301\", \"BIO-399\", \"CS-190\", \"CS-315\", \"CS-319\", \"CS-347\", \"EE-181\"]}, {\"field\": \"prereq_id\", \"values\": [\"BIO-101\", \"BIO-101\", \"CS-101\", \"CS-101\", \"CS-101\", \"CS-101\", \"PHY-101\"]}], \"table_name\": \"prereq\"}}, {\"section\": {\"fields\": [{\"field\": \"building\", \"values\": [null, \"Packard\", \"Packard\", \"Packard\", \"Packard\", \"Painter\", \"Painter\", \"Painter\", \"Taylor\", \"Taylor\", \"Taylor\", \"Taylor\", \"Taylor\", \"Watson\", \"Watson\", \"Watson\"]}, {\"field\": \"course_id\", \"values\": [\"BIO-101\", \"BIO-101\", \"BIO-301\", \"CS-101\", \"CS-101\", \"CS-190\", \"CS-190\", \"CS-315\", \"CS-319\", \"CS-319\", \"CS-347\", \"EE-181\", \"FIN-201\", \"HIS-351\", \"MU-199\", \"PHY-101\"]}, {\"field\": \"room_number\", \"values\": [null, \"101\", \"101\", \"101\", \"101\", \"514\", \"514\", \"514\", \"3128\", \"3128\", \"3128\", \"3128\", \"3128\", \"100\", \"100\", \"120\"]}, {\"field\": \"sec_id\", \"values\": [\"1\", \"1\", \"1\", \"1\", \"1\", \"1\", \"2\", \"1\", \"1\", \"2\", \"1\", \"1\", \"1\", \"1\", \"1\", \"1\"]}, {\"field\": \"semester\", \"values\": [\"Summer\", \"Summer\", \"Summer\", \"Fall\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Fall\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Fall\"]}, {\"field\": \"time_slot_id\", \"values\": [\"B\", \"A\", \"H\", \"F\", \"E\", \"A\", \"D\", \"B\", \"C\", \"A\", \"C\", \"B\", \"C\", \"D\", \"A\", null]}, {\"field\": \"year\", \"values\": [2017, 2019, 2018, 2017, 2018, 2017, 2017, 2018, 2018, 2018, 2017, 2017, 2018, 2018, 2018, 2017]}], \"table_name\": \"section\"}}, {\"student\": {\"fields\": [{\"field\": \"dept_name\", \"values\": [\"Biology\", \"Comp_Sdfghji.\", \"Comp. Sbi.\", \"Comp. Sci.\", \"Comp. Sci.\", \"Elec_ Eng.\", \"Elec. Eng.\", \"History\", \"Music\", \"Physics\", \"Physics\", \"Physics\", \"Yinance\"]}, {\"field\": \"ID\", \"values\": [\"00128\", \"12345\", \"19991\", \"23121\", \"44553\", \"45678\", \"54321\", \"55739\", \"70557\", \"76543\", \"76653\", \"98765\", \"98988\"]}, {\"field\": \"name\", \"values\": [\"Zhang\", \"Shankar\", \"Brandt\", \"Chavez\", \"Peltier\", \"Levy\", \"Williams\", \"Sanchez\", \"Snow\", \"Brown\", \"Aoi\", \"Bourikas\", \"Tanaka\"]}, {\"field\": \"tot_cred\", \"values\": [102, 32, 80, 110, 56, 46, 54, 38, 56, 58, 60, 98, 120]}], \"table_name\": \"student\"}}, {\"tables_in\": {\"fields\": [{\"field\": \"fields_\", \"values\": null}, {\"field\": \"id\", \"values\": [1]}], \"table_name\": \"tables_in\"}}]}], \"table_name\": \"tables_out\"}}'),(12,'{\"takes\": {\"fields\": [{\"field\": \"course_id\", \"values\": [\"BIO-101\", \"BIO-301\", \"CS-101\", \"CS-101\", \"CS-101\", \"CS-101\", \"CS-101\", \"CS-101\", \"CS-101\", \"CS-190\", \"CS-190\", \"CS-315\", \"CS-315\", \"CS-319\", \"CS-319\", \"CS-347\", \"CS-347\", \"EE-181\", \"FIN-201\", \"HIS-351\", \"MU-199\", \"PHY-101\"]}, {\"field\": \"grade\", \"values\": [\"A\", \"A-\", \"C\", \"A\", \"A\", \"A\", \"B\", \"C+\", \"B-\", \"F\", \"B+\", \"B\", \"A-\", \"B+\", \"A-\", \"A\", \"A\", \"C\", \"C-\", \"B\", \"A\", null]}, {\"field\": \"ID\", \"values\": [\"00128\", \"00128\", \"12345\", \"12345\", \"12345\", \"12345\", \"19991\", \"23121\", \"44553\", \"45678\", \"45678\", \"45678\", \"54321\", \"54321\", \"55739\", \"76543\", \"76543\", \"76653\", \"98765\", \"98765\", \"98988\", \"98988\"]}, {\"field\": \"sec_id\", \"values\": [\"1\", \"1\", \"1\", \"1\", \"1\", \"1\", \"1\", \"1\", \"1\", \"2\", \"2\", \"1\", \"1\", \"1\", \"2\", \"1\", \"1\", \"1\", \"1\", \"1\", \"1\", \"1\"]}, {\"field\": \"semester\", \"values\": [\"Summer\", \"Summer\", \"Fall\", \"Fall\", \"Fall\", \"Fall\", \"Fall\", \"Fall\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Fall\", \"Fall\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Fall\"]}, {\"field\": \"year\", \"values\": [2017, 2018, 2017, 2017, 2017, 2017, 2017, 2017, 2018, 2017, 2017, 2018, 2018, 2018, 2018, 2017, 2017, 2017, 2018, 2018, 2018, 2017]}], \"table_name\": \"takes\"}}'),(13,'{\"teaches\": {\"fields\": [{\"field\": \"course_id\", \"values\": [\"BIO-101\", \"BIO-301\", \"CS_101\", \"CS-101\", \"CS-190\", \"CS-190\", \"CS-315\", \"CS-319\", \"CS-319\", \"CS-347\", \"EE-181\", \"FIN-201\", \"HIS-351\", \"MU-199\", \"PHY-101\"]}, {\"field\": \"ID\", \"values\": [\"76766\", \"76766\", \"10101\", \"45565\", \"83821\", \"83821\", \"10101\", \"45565\", \"83821\", \"10101\", \"98345\", \"12121\", \"32343\", \"15151\", \"22222\"]}, {\"field\": \"sec_id\", \"values\": [\"1\", \"1\", \"1\", \"1\", \"1\", \"2\", \"1\", \"1\", \"2\", \"1\", \"1\", \"1\", \"1\", \"1\", \"1\"]}, {\"field\": \"semester\", \"values\": [\"Summer\", \"Summer\", \"Fall\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Fall\", \"Spring\", \"Spring\", \"Spring\", \"Spring\", \"Fall\"]}, {\"field\": \"year\", \"values\": [2017, 2018, 2017, 2018, 2017, 2017, 2018, 2018, 2018, 2017, 2017, 2018, 2018, 2018, 2017]}], \"table_name\": \"teaches\"}}'),(14,'{\"time_slot\": {\"fields\": [{\"field\": \"day\", \"values\": [\"F\", \"M\", \"W\", \"F\", \"M\", \"W\", \"F\", \"M\", \"W\", \"F\", \"M\", \"W\", \"R\", \"T\", \"R\", \"T\", \"F\", \"M\", \"W\", \"W\"]}, {\"field\": \"end_hr\", \"values\": [8, 8, 8, 9, 9, 9, 11, 11, 11, 13, 13, 13, 11, 11, 15, 15, 16, 16, 16, 12]}, {\"field\": \"end_min\", \"values\": [50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 45, 45, 45, 45, 50, 50, 50, 30]}, {\"field\": \"start_hr\", \"values\": [8, 8, 8, 9, 9, 9, 11, 11, 11, 13, 13, 13, 10, 10, 14, 14, 16, 16, 16, 10]}, {\"field\": \"start_min\", \"values\": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 30, 30, 30, 0, 0, 0, 0]}, {\"field\": \"time_slot_id\", \"values\": [\"A\", \"A\", \"A\", \"B\", \"B\", \"B\", \"C\", \"C\", \"C\", \"D\", \"D\", \"D\", \"E\", \"E\", \"F\", \"F\", \"G\", \"G\", \"G\", \"H\"]}], \"table_name\": \"time_slot\"}}');
/*!40000 ALTER TABLE `tables_out` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `takes`
--

DROP TABLE IF EXISTS `takes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `takes` (
  `ID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sec_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` decimal(4,0) NOT NULL,
  `grade` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update` date NOT NULL,
  PRIMARY KEY (`ID`,`course_id`,`sec_id`,`semester`,`year`),
  KEY `course_id` (`course_id`,`sec_id`,`semester`,`year`),
  CONSTRAINT `takes_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `student` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `takes_ibfk_2` FOREIGN KEY (`course_id`, `sec_id`, `semester`, `year`) REFERENCES `section` (`course_id`, `sec_id`, `semester`, `year`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `takes`
--

LOCK TABLES `takes` WRITE;
/*!40000 ALTER TABLE `takes` DISABLE KEYS */;
INSERT INTO `takes` VALUES ('00128','CS-101','1','Fall',2017,'A','2023-03-22'),('00128','CS-347','1','Fall',2017,'A-','2023-03-22'),('12345','CS-101','1','Fall',2017,'C','2023-03-22'),('12345','CS-190','2','Spring',2017,'A','2023-03-22'),('12345','CS-315','1','Spring',2018,'A','2023-03-22'),('12345','CS-347','1','Fall',2017,'A','2023-03-22'),('19991','HIS-351','1','Spring',2018,'B','2023-03-22'),('23121','FIN-201','1','Spring',2018,'C+','2023-03-22'),('44553','PHY-101','1','Fall',2017,'B-','2023-03-22'),('45678','CS-101','1','Fall',2017,'F','2023-03-22'),('45678','CS-101','1','Spring',2018,'B+','2023-03-22'),('45678','CS-319','1','Spring',2018,'B','2023-03-22'),('54321','CS-101','1','Fall',2017,'A-','2023-03-22'),('54321','CS-190','2','Spring',2017,'B+','2023-03-22'),('55739','MU-199','1','Spring',2018,'A-','2023-03-22'),('76543','CS-101','1','Fall',2017,'A','2023-03-22'),('76543','CS-319','2','Spring',2018,'A','2023-03-22'),('76653','EE-181','1','Spring',2017,'C','2023-03-22'),('98765','CS-101','1','Fall',2017,'C-','2023-03-22'),('98765','CS-315','1','Spring',2018,'B','2023-03-22'),('98988','BIO-101','1','Summer',2017,'A','2023-03-22'),('98988','BIO-301','1','Summer',2018,NULL,'2023-03-22');
/*!40000 ALTER TABLE `takes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teaches`
--

DROP TABLE IF EXISTS `teaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teaches` (
  `ID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sec_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` decimal(4,0) NOT NULL,
  `update` date NOT NULL,
  PRIMARY KEY (`ID`,`course_id`,`sec_id`,`semester`,`year`),
  KEY `course_id` (`course_id`,`sec_id`,`semester`,`year`),
  CONSTRAINT `teaches_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `instructor` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `teaches_ibfk_3` FOREIGN KEY (`course_id`, `sec_id`, `semester`, `year`) REFERENCES `section` (`course_id`, `sec_id`, `semester`, `year`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teaches`
--

LOCK TABLES `teaches` WRITE;
/*!40000 ALTER TABLE `teaches` DISABLE KEYS */;
INSERT INTO `teaches` VALUES ('10101','CS-101','1','Fall',2017,'2023-03-22'),('10101','CS-315','1','Spring',2018,'2023-03-22'),('10101','CS-347','1','Fall',2017,'2023-03-22'),('12121','FIN-201','1','Spring',2018,'2023-03-22'),('15151','MU-199','1','Spring',2018,'2023-03-22'),('22222','PHY-101','1','Fall',2017,'2023-03-22'),('32343','HIS-351','1','Spring',2018,'2023-03-22'),('45565','CS-101','1','Spring',2018,'2023-03-22'),('45565','CS-319','1','Spring',2018,'2023-03-22'),('76766','BIO-101','1','Summer',2017,'2023-03-22'),('76766','BIO-301','1','Summer',2018,'2023-03-22'),('83821','CS-190','1','Spring',2017,'2023-03-22'),('83821','CS-190','2','Spring',2017,'2023-03-22'),('83821','CS-319','2','Spring',2018,'2023-03-22'),('98345','EE-181','1','Spring',2017,'2023-03-22');
/*!40000 ALTER TABLE `teaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_slot`
--

DROP TABLE IF EXISTS `time_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_slot` (
  `time_slot_id` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_hr` decimal(2,0) NOT NULL,
  `start_min` decimal(2,0) NOT NULL,
  `end_hr` decimal(2,0) DEFAULT NULL,
  `end_min` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`time_slot_id`,`day`,`start_hr`,`start_min`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_slot`
--

LOCK TABLES `time_slot` WRITE;
/*!40000 ALTER TABLE `time_slot` DISABLE KEYS */;
INSERT INTO `time_slot` VALUES ('A','F',8,0,8,50),('A','M',8,0,8,50),('A','W',8,0,8,50),('B','F',9,0,9,50),('B','M',9,0,9,50),('B','W',9,0,9,50),('C','F',11,0,11,50),('C','M',11,0,11,50),('C','W',11,0,11,50),('D','F',13,0,13,50),('D','M',13,0,13,50),('D','W',13,0,13,50),('E','R',10,30,11,45),('E','T',10,30,11,45),('F','R',14,30,15,45),('F','T',14,30,15,45),('G','F',16,0,16,50),('G','M',16,0,16,50),('G','W',16,0,16,50),('H','W',10,0,12,30);
/*!40000 ALTER TABLE `time_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `relations`
--

/*!50001 DROP VIEW IF EXISTS `relations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `relations` AS select distinct `information_schema`.`ifb`.`ID` AS `ID`,`information_schema`.`ifb`.`FOR_NAME` AS `FOR_NAME`,`information_schema`.`ifb`.`REF_NAME` AS `REF_NAME`,`information_schema`.`ifb`.`N_COLS` AS `N_COLS`,`information_schema`.`ifb`.`TYPE` AS `TYPE`,`information_schema`.`ifc`.`FOR_COL_NAME` AS `FOR_COL_NAME`,`information_schema`.`ifc`.`REF_COL_NAME` AS `REF_COL_NAME`,`information_schema`.`ifc`.`POS` AS `POS` from (`information_schema`.`INNODB_FOREIGN` `ifb` join `information_schema`.`INNODB_FOREIGN_COLS` `ifc`) where ((`information_schema`.`ifb`.`ID` like '%uni_partial_json%') and (`information_schema`.`ifb`.`ID` = `information_schema`.`ifc`.`ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-15 18:10:51
