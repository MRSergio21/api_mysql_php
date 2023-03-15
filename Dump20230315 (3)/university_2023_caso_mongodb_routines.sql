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

--
-- Dumping events for database 'university_2023_caso_mongodb'
--

--
-- Dumping routines for database 'university_2023_caso_mongodb'
--
/*!50003 DROP FUNCTION IF EXISTS `build_tables` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `build_tables`(`name_schema` VARCHAR(64), `name_table` VARCHAR(64)) RETURNS json
    NO SQL
BEGIN                       
SET @fields = JSON_OBJECT( 'fields',(SELECT JSON_ARRAYAGG(JSON_OBJECT('column_name', `COLUMN_NAME`, 'is_null', `IS_NULLABLE`, 'data_type',`DATA_TYPE`, 'character_max_lenght',`CHARACTER_MAXIMUM_LENGTH`,'character_octet_lenght', `CHARACTER_OCTET_LENGTH`, 'column_key',`COLUMN_KEY`, 'privileges',`PRIVILEGES`)) FROM information_schema.`COLUMNS` WHERE TABLE_SCHEMA = name_schema AND TABLE_NAME = name_table));
/*SELECT @fields;*/
RETURN @fields;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `build_advisor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `build_advisor`()
    NO SQL
BEGIN
SET @i_ID=JSON_OBJECT("i_ID",(SELECT JSON_ARRAYAGG(i_ID) FROM `advisor`));
SELECT @i_ID;
SET @s_ID=JSON_OBJECT("s_ID",(SELECT JSON_ARRAYAGG(s_ID) FROM `advisor`));
SELECT @s_ID;
SET @advisor=JSON_OBJECT("advisor",JSON_MERGE(@i_ID,@s_ID));
SELECT @advisor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `build_mongo_db_object_advisor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `build_mongo_db_object_advisor`()
    NO SQL
BEGIN
TRUNCATE mongodb_objects;
INSERT INTO `mongodb_objects`(`object_mongodb`) SELECT JSON_OBJECT ( 's_ID', d.s_ID, 'i_ID', d.i_ID)  "mongo_objects" FROM advisor d;
(SELECT JSON_ARRAYAGG(`object_mongodb`) INTO OUTFILE 'E:/backup_mongo/mongo_objects/advisor.txt' FROM mongodb_objects);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `build_mongo_db_object_classroom` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `build_mongo_db_object_classroom`()
    NO SQL
BEGIN
TRUNCATE mongodb_objects;
INSERT INTO `mongodb_objects`(`object_mongodb`) SELECT JSON_OBJECT ( 'building',`building`,'room_number', `room_number`,'capacity',`capacity`)  "mongo_objects" FROM classroom d;

(SELECT JSON_ARRAYAGG(`object_mongodb`) INTO OUTFILE 'E:/backup_mongo/mongo_objects/classroom.txt' FROM mongodb_objects);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `build_mongo_db_object_course` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `build_mongo_db_object_course`()
    NO SQL
BEGIN
/*TRUNCATE mongodb_objects;*/
INSERT INTO `mongodb_objects`(`object_mongodb`) SELECT JSON_OBJECT ( 'course_id',`course_id`,'title', `title`,'dept_name', `dept_name`,'credits', `credits`)  "mongo_objects" FROM course d;

(SELECT JSON_ARRAYAGG(`object_mongodb`) INTO OUTFILE 'E:/backup_mongo/mongo_objects/course.txt' FROM mongodb_objects);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `build_mongo_db_object_department` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `build_mongo_db_object_department`()
    NO SQL
BEGIN
TRUNCATE mongodb_objects;
INSERT INTO `mongodb_objects`(`object_mongodb`) SELECT JSON_OBJECT ('dept_name', `dept_name`,'building', `building`, 'budget',`budget`)  "mongo_objects" FROM department d;
(SELECT JSON_ARRAYAGG(`object_mongodb`) INTO OUTFILE 'E:/backup_mongo/mongo_objects/department.txt' FROM mongodb_objects);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `build_mongo_db_object_instructor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `build_mongo_db_object_instructor`()
    NO SQL
BEGIN
TRUNCATE mongodb_objects;
INSERT INTO `mongodb_objects`(`object_mongodb`) SELECT JSON_OBJECT ('ID',`ID`, 'name',`name`,'dept_name',`dept_name`,'salary', `salary`)  "mongo_objects" FROM instructor d;

(SELECT JSON_ARRAYAGG(`object_mongodb`) INTO OUTFILE 'E:/backup_mongo/mongo_objects/instructor.txt' FROM mongodb_objects);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `build_mongo_db_object_prereq` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `build_mongo_db_object_prereq`()
    NO SQL
BEGIN
TRUNCATE mongodb_objects;
INSERT INTO `mongodb_objects`(`object_mongodb`) SELECT JSON_OBJECT ( 'course_id',`course_id`, 'prereq_id',`prereq_id`)  "mongo_objects" FROM prereq d;

(SELECT JSON_ARRAYAGG(`object_mongodb`) INTO OUTFILE 'E:/backup_mongo/mongo_objects/prereq.txt' FROM mongodb_objects);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `build_mongo_db_object_section` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `build_mongo_db_object_section`()
    NO SQL
BEGIN
TRUNCATE mongodb_objects;
INSERT INTO `mongodb_objects`(`object_mongodb`) SELECT JSON_OBJECT ('course_id', `course_id`, 'sec_id', `sec_id`,'semester',  `semester`,'year',  `year`,'building',  `building`,'room_number',  `room_number`,'time_slot_id',  `time_slot_id`)  "mongo_objects" FROM section d;

(SELECT JSON_ARRAYAGG(`object_mongodb`) INTO OUTFILE 'E:/backup_mongo/mongo_objects/section.txt' FROM mongodb_objects);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `build_mongo_db_object_student` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `build_mongo_db_object_student`()
    NO SQL
BEGIN
TRUNCATE mongodb_objects;
INSERT INTO `mongodb_objects`(`object_mongodb`) SELECT JSON_OBJECT ('ID', `ID`, 'name',`name`, 'dept_name',`dept_name`, 'tot_cred',`tot_cred`)  "mongo_objects" FROM student d;

(SELECT JSON_ARRAYAGG(`object_mongodb`) INTO OUTFILE 'E:/backup_mongo/mongo_objects/student.txt' FROM mongodb_objects);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `build_mongo_db_object_takes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `build_mongo_db_object_takes`()
    NO SQL
BEGIN
TRUNCATE mongodb_objects;
INSERT INTO `mongodb_objects`(`object_mongodb`) SELECT JSON_OBJECT ('ID',`ID`,'course_id', `course_id`,'sec_id', `sec_id`,'semester', `semester`, 'year',`year`,'grade', `grade`)  "mongo_objects" FROM takes d;

(SELECT JSON_ARRAYAGG(`object_mongodb`) INTO OUTFILE 'E:/backup_mongo/mongo_objects/takes.txt' FROM mongodb_objects);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `build_mongo_db_object_teaches` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `build_mongo_db_object_teaches`()
    NO SQL
BEGIN
TRUNCATE mongodb_objects;
INSERT INTO `mongodb_objects`(`object_mongodb`) SELECT JSON_OBJECT ('ID', `ID`, 'course_id',`course_id`,'sec_id', `sec_id`, 'semester',`semester`,'year', `year`)  "mongo_objects" FROM teaches d;

(SELECT JSON_ARRAYAGG(`object_mongodb`) INTO OUTFILE 'E:/backup_mongo/mongo_objects/teaches.txt' FROM mongodb_objects);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `build_mongo_db_object_time_slot` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `build_mongo_db_object_time_slot`()
    NO SQL
BEGIN
TRUNCATE mongodb_objects;
INSERT INTO `mongodb_objects`(`object_mongodb`) SELECT JSON_OBJECT ('time_slot_id',`time_slot_id`,'day', `day`,'start_hr', `start_hr`, 'start_min',`start_min`,'end_hr', `end_hr`,'end_min', `end_min`)  "mongo_objects" FROM time_slot d;

(SELECT JSON_ARRAYAGG(`object_mongodb`) INTO OUTFILE 'E:/backup_mongo/mongo_objects/time_slot.txt' FROM mongodb_objects);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `build_values` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `build_values`(IN `name_schema` VARCHAR(50), IN `name_table` VARCHAR(50), IN `name_column` VARCHAR(50))
    NO SQL
BEGIN
 CREATE TABLE IF NOT EXISTS `mytables` (
  `id` int NOT NULL AUTO_INCREMENT,
  `myvalues` json NOT NULL,
  PRIMARY KEY (`id`)
);
SET @mybuild = CONCAT('INSERT INTO mytables(myvalues) SELECT JSON_ARRAYAGG(',name_column,') FROM',' ',name_table,'');
PREPARE stmt FROM @mybuild;
EXECUTE stmt; 
DEALLOCATE PREPARE stmt;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generate_excel_file_by_table_for_neo4j` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_excel_file_by_table_for_neo4j`()
    NO SQL
BEGIN
(SELECT 's_ID', 'i_ID') UNION ALL
(SELECT * INTO OUTFILE 'c:/wamp64/tmp/neo4j/advisor.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM advisor);

(SELECT 'building', 'room_number', 'capacity') UNION ALL 
(SELECT * INTO OUTFILE 'c:/wamp64/tmp/neo4j/classroom.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM `classroom`);

(SELECT 'course_id', 'title', 'dept_name', 'credits')
UNION ALL (SELECT * INTO OUTFILE 'c:/wamp64/tmp/neo4j/course.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM `course`);

(SELECT 'dept_name', 'building', 'budget') UNION ALL (SELECT * INTO OUTFILE 'c:/wamp64/tmp/neo4j/department.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM `department`);

(SELECT 'ID', 'name', 'dept_name', 'salary') UNION ALL (SELECT * INTO OUTFILE 'c:/wamp64/tmp/neo4j/instructor.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM `instructor`);

(SELECT 'course_id', 'prereq_id') UNION ALL (SELECT * INTO OUTFILE 'c:/wamp64/tmp/neo4j/prereq.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM `prereq`);

(SELECT 'course_id', 'sec_id', 'semester', 'year', 'building', 'room_number', 'time_slot_id') UNION ALL (SELECT * INTO OUTFILE 'c:/wamp64/tmp/neo4j/section.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM `section`);

(SELECT 'ID', 'name', 'dept_name', 'tot_cred') UNION ALL (SELECT * INTO OUTFILE 'c:/wamp64/tmp/neo4j/student.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM `student`);

(SELECT 'ID', 'course_id', 'sec_id', 'semester', 'year', 'grade') UNION ALL (SELECT * INTO OUTFILE 'c:/wamp64/tmp/neo4j/takes.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM `takes`);

(SELECT 'ID', 'course_id', 'sec_id', 'semester', 'year') UNION ALL (SELECT * INTO OUTFILE 'c:/wamp64/tmp/neo4j/teaches.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM  `teaches` );

(SELECT 'time_slot_id', 'day', 'start_hr', 'start_min', 'end_hr', 'end_min') UNION ALL (SELECT * INTO OUTFILE 'c:/wamp64/tmp/neo4j/time_slot.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM `time_slot`);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generate_excel_file_by_table_for_neo4j_cast_text` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_excel_file_by_table_for_neo4j_cast_text`()
    NO SQL
BEGIN
(SELECT 's_ID', 'i_ID') UNION ALL
(SELECT CAST(s_ID AS CHAR),CAST(i_ID AS CHAR ) INTO OUTFILE 'c:/wamp64/tmp/neo4j/advisor.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM advisor);

(SELECT 'building', 'room_number', 'capacity') UNION ALL 
(SELECT CAST(building AS CHAR),CAST( room_number AS CHAR),CAST(capacity AS CHAR) INTO OUTFILE 'c:/wamp64/tmp/neo4j/classroom.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM `classroom`);

(SELECT 'course_id', 'title', 'dept_name', 'credits')
UNION ALL (SELECT CAST( course_id AS CHAR), CAST(title AS CHAR), CAST(dept_name AS CHAR), CAST(credits AS CHAR) INTO OUTFILE 'c:/wamp64/tmp/neo4j/course.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM `course`);

(SELECT 'dept_name', 'building', 'budget') UNION ALL (SELECT CAST(dept_name AS CHAR), CAST(building AS CHAR),CAST(budget AS CHAR) INTO OUTFILE 'c:/wamp64/tmp/neo4j/department.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM `department`);

(SELECT 'ID', 'name', 'dept_name', 'salary') UNION ALL (SELECT CAST(ID AS CHAR), CAST(name AS CHAR), CAST(dept_name AS CHAR), CAST(salary AS CHAR) INTO OUTFILE 'c:/wamp64/tmp/neo4j/instructor.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM `instructor`);

(SELECT 'course_id', 'prereq_id') UNION ALL (SELECT CAST(course_id AS CHAR), CAST(prereq_id AS CHAR) INTO OUTFILE 'c:/wamp64/tmp/neo4j/prereq.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM `prereq`);

(SELECT 'course_id', 'sec_id', 'semester', 'year', 'building', 'room_number', 'time_slot_id') UNION ALL (SELECT CAST(course_id AS CHAR), CAST(sec_id AS CHAR), CAST(semester AS CHAR), CAST(year AS CHAR), CAST(building AS CHAR), CAST(room_number AS CHAR), CAST(time_slot_id AS CHAR) INTO OUTFILE 'c:/wamp64/tmp/neo4j/section.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM `section`);

(SELECT 'ID', 'name', 'dept_name', 'tot_cred') UNION ALL (SELECT CAST(ID AS CHAR), CAST(name AS CHAR), CAST(dept_name AS CHAR), CAST(tot_cred AS CHAR) INTO OUTFILE 'c:/wamp64/tmp/neo4j/student.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM `student`);

(SELECT 'ID', 'course_id', 'sec_id', 'semester', 'year', 'grade') UNION ALL (SELECT CAST(ID AS CHAR), CAST(course_id AS CHAR), CAST(sec_id AS CHAR), CAST(semester AS CHAR), CAST( year AS CHAR), CAST(grade AS CHAR) INTO OUTFILE 'c:/wamp64/tmp/neo4j/takes.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM `takes`);

(SELECT 'ID', 'course_id', 'sec_id', 'semester', 'year') UNION ALL (SELECT CAST(ID AS CHAR), CAST(course_id AS CHAR), CAST(sec_id AS CHAR), CAST(semester AS CHAR), CAST(year AS CHAR) INTO OUTFILE 'c:/wamp64/tmp/neo4j/teaches.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM  `teaches` );

(SELECT 'time_slot_id', 'day', 'start_hr', 'start_min', 'end_hr', 'end_min') UNION ALL (SELECT CAST(time_slot_id AS CHAR), CAST(day AS CHAR), CAST(start_hr AS CHAR), CAST(start_min AS CHAR), CAST(end_hr AS CHAR), CAST(end_min AS CHAR) INTO OUTFILE 'c:/wamp64/tmp/neo4j/time_slot.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '
' FROM `time_slot`);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generate_mongodb_dbref` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_mongodb_dbref`()
    NO SQL
BEGIN
/* Algoritmo:
verificar que una tabla mysql está relacionada.
verificar qué campos están relacionados. 
generar el json con el patrón dbref
*/

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generate_txt_for_mongo_collection` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_txt_for_mongo_collection`()
    NO SQL
BEGIN
call build_mongo_db_object_advisor;
call build_mongo_db_object_classroom;
call build_mongo_db_object_course;
call build_mongo_db_object_department;
call build_mongo_db_object_instructor;
call build_mongo_db_object_prereq;
call build_mongo_db_object_section;
call build_mongo_db_object_student;
call build_mongo_db_object_teaches;
call build_mongo_db_object_takes;
call build_mongo_db_object_time_slot;
TRUNCATE mongodb_objects;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `jugando_con relaciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `jugando_con relaciones`()
    NO SQL
BEGIN
-- relaciones course, department and 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mongo_tables_cursor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mongo_tables_cursor`(IN `schema_in` VARCHAR(100))
    NO SQL
BEGIN
  DECLARE name_schema varchar(64) ;
  DECLARE name_table varchar(64) ; 
 /* DECLARE name_column varchar(64) ; */
  DECLARE fin INTEGER DEFAULT 0;
  DECLARE sch_cursor CURSOR FOR SELECT DISTINCT TABLE_SCHEMA, TABLE_NAME FROM information_schema.TABLES WHERE TABLE_SCHEMA=schema_in;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin=1;
  
  OPEN sch_cursor;
  get_cursor: LOOP
  FETCH sch_cursor INTO name_schema,name_table;

 IF fin = TRUE 
    THEN
    	LEAVE get_cursor;
    END IF;
call uni_fields_cursor(name_schema,name_table);
Select name_schema,name_table;
  END LOOP get_cursor;
  CLOSE sch_cursor; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `playing_with_joins` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `playing_with_joins`()
    NO SQL
BEGIN
-- Demostramos que Snow no ha matriculado ninguna asignatura.
-- SELECT * FROM `takes` WHERE `ID`=70557;

-- Querys

 -- SELECT * FROM student NATURAL JOIN course;
-- Create Table t_join SELECT student.ID, student.name,student.dept_name,student.tot_cred,course.course_id,course.title,course.dept_name as dpt, course.credits FROM student JOIN course;
-- Create Table cross_join SELECT student.ID, student.name,student.dept_name,student.tot_cred,course.course_id,course.title,course.dept_name as dpt, course.credits FROM student CROSS JOIN course;
-- Create Table left_join SELECT student.ID, student.name,student.dept_name,student.tot_cred,course.course_id,course.title,course.dept_name as dpt, course.credits FROM student CROSS JOIN course;
-- Create Table right_join SELECT student.ID, student.name,student.dept_name,student.tot_cred,course.course_id,course.title,course.dept_name as dpt, course.credits FROM student CROSS JOIN course;
--  SELECT * FROM takes UNION SELECT * from student;
 -- SELECT * FROM student NATURAL LEFT OUTER JOIN course;
-- SELECT * FROM student NATURAL JOIN takes;
 SELECT * FROM student NATURAL LEFT OUTER JOIN takes;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reunion_natural` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reunion_natural`()
    NO SQL
BEGIN
SELECT * FROM student JOIN instructor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `searchs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `searchs`()
    NO SQL
BEGIN
-- Patrones LIKE. wildcard %
-- las que terminan
 -- SELECT * FROM `student` WHERE `dept_name` LIKE '%y';
 -- las que empiezan
 -- SELECT * FROM `student` WHERE `dept_name` LIKE 'y%';
 -- las que están en el medio
 -- SELECT * FROM `student` WHERE `dept_name` LIKE '%y%';
-- wilcard 


-- NOT LIKE
-- true
-- SELECT * FROM `student` WHERE `dept_name` NOT LIKE '%y%';
-- SELECT * FROM `student` WHERE `dept_name` NOT LIKE 'y%';
-- SELECT * FROM `student` WHERE `dept_name` NOT LIKE '%y';
-- no devuelve nada
-- SELECT * FROM `student` WHERE `dept_name` NOT LIKE 'y';

-- Guión bajo
-- SELECT * FROM `student` WHERE `dept_name` LIKE '';
-- Escape

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `trabajo_partial_cursor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `trabajo_partial_cursor`()
    NO SQL
BEGIN
TRUNCATE mongodb_objects;
  CAll build_mongo_db_object_advisor;
  CALL build_mongo_db_object_classroom;
  CALL build_mongo_db_object_course;
  CALL build_mongo_db_object_department;
  CALL build_mongo_db_object_instructor;
  CALL build_mongo_db_object_prereq;
  CALL build_mongo_db_object_section;
  CALL build_mongo_db_object_student;
  CALL build_mongo_db_object_takes;
  CALL build_mongo_db_object_teaches;
  CALL build_mongo_db_object_time_slot;


/*SET @uni_partial_json=JSON_OBJECT('uni_partial_json',(SELECT JSON_ARRAYAGG(`object_mongodb`) FROM mongodb_objects));
SELECT @uni_partial_json;
                                  
SELECT JSON_ARRAYAGG(`object_mongodb`) INTO OUTFILE 'c:/wamp64/tmp/mongodb/uni.txt' FROM mongodb_objects;*/
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `union` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `union`()
    NO SQL
BEGIN
-- Caso 1: Cardinalidad diferente. Se ha agregado la columna sexo en la tabla instructor
-- SELECT * FROM student UNION SELECT * FROM instructor;
-- Se elimina la columna sexo de la tabla instructor.
-- Caso 2.a: Atributos diferentes con student primero
-- SELECT * FROM student UNION SELECT * FROM instructor;
-- SELECT * FROM instructor UNION SELECT * FROM student;
-- SELECT * FROM student UNION SELECT * FROM student as s;
SELECT * FROM student as s WHERE s.dept_name= 'Music' UNION SELECT * FROM instructor as i  WHERE i.dept_name = 'Music';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uni_department_test_cursor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uni_department_test_cursor`()
    NO SQL
BEGIN
  DECLARE department_json json;
  DECLARE building varchar (50);
  DECLARE fin INTEGER DEFAULT 0;
  
  DECLARE json_cursor CURSOR FOR SELECT DISTINCT JSON_OBJECT('department',JSON_OBJECT('course', JSON_OBJECT('course_id',c.course_id,'title',c.title,'credits',c.credits),'instructor',JSON_OBJECT('i_ID',i.ID, 'i_name',i.name,'i_salary',i.salary),'dept_name',d.dept_name,'building', d.building, 'budget',d.budget,'student', JSON_OBJECT('s-ID',s.ID,'s_name', s.name, 's_tot_cred',s.tot_cred))) FROM `department` d INNER JOIN course c INNER JOIN instructor i  INNER JOIN student s WHERE d.dept_name = c.dept_name AND d.dept_name= i.dept_name AND d.dept_name = s.dept_name;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin=1;
  OPEN json_cursor;
  get_cursor: LOOP
  FETCH json_cursor INTO department_json;
 IF fin = TRUE 
    THEN
    	LEAVE get_cursor;
    END IF;
   
    INSERT INTO `mongodb_objects`(`object_mongodb`) VALUES (department_json);
   SELECT department_json;
  END LOOP get_cursor;
  CLOSE json_cursor; 
   
   (SELECT JSON_ARRAYAGG(`object_mongodb`) INTO OUTFILE 'c:/wamp64/tmp/mongodb/mongo_collection.txt' FROM mongodb_objects);
   TRUNCATE `mongodb_objects`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uni_fields_cursor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uni_fields_cursor`(IN `schema_in` VARCHAR(64), IN `table_in` VARCHAR(64))
    NO SQL
BEGIN
  DECLARE name_schema varchar(64) ; 
  DECLARE name_table varchar(64) ; 
  DECLARE name_column varchar(64) ; 
  DECLARE fin INTEGER DEFAULT 0;
  DECLARE tab_cursor CURSOR FOR SELECT TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME FROM information_schema.COLUMNS WHERE TABLE_SCHEMA =schema_in AND TABLE_NAME =table_in;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin=1;
  OPEN tab_cursor;
  get_cursor: LOOP
  FETCH tab_cursor INTO name_schema,name_table,name_column;
  SELECT name_schema;
 IF fin = TRUE 
    THEN
    	LEAVE get_cursor;
   END IF;
   TRUNCATE mytables;
/*call build_values(name_schema,name_table,name_column);*/
-- Paso necesario para tomar los valores desde una tabla y convertirlos en json.

SET @mybuild = CONCAT('INSERT INTO mytables(myvalues) SELECT JSON_ARRAYAGG(',name_column,') FROM',' ',name_table,'');
PREPARE stmt FROM @mybuild;
EXECUTE stmt; 
DEALLOCATE PREPARE stmt;
SET @values=JSON_OBJECT("field",name_column
,"values",(SELECT myvalues FROM mytables));
SELECT @values;
TRUNCATE `mytables`;
INSERT INTO `tables_in`(`fields_`) VALUES (@values);

  END LOOP get_cursor;
  CLOSE tab_cursor; 
 -- tomar los valores de la tabla
SET @fields=JSON_OBJECT('fields',(SELECT JSON_ARRAYAGG(fields_) FROM tables_in));
SET @table=JSON_OBJECT("table_name",name_table);
SET @tables=JSON_OBJECT(name_table,JSON_MERGE(@table,@fields));
/*SELECT @tables;*/
TRUNCATE tables_in;
INSERT INTO `tables_out`(`tables_`) VALUES (@tables);
/*  DROP TABLE `mytables`;*/
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uni_json_final` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uni_json_final`()
    NO SQL
BEGIN
SET @dictionary =JSON_OBJECT('dictionary',(SELECT JSON_ARRAYAGG(JSON_OBJECT('tables',json)) FROM tables));
SELECT @dictionary;
TRUNCATE `dictionary`;
INSERT INTO `dictionary`(`dictionary`) VALUES (@dictionary);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uni_partial_json_relations_view` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uni_partial_json_relations_view`(IN `schema_in` VARCHAR(70))
    NO SQL
BEGIN
SET @test=CONCAT('%',schema_in,'%');
SELECT @test;
CREATE VIEW relations AS SELECT DISTINCT ifb.`ID`, ifb.`FOR_NAME`, ifb.`REF_NAME`, ifb.`N_COLS`, ifb.`TYPE`, ifc.`FOR_COL_NAME`, ifc.`REF_COL_NAME`, ifc.`POS` FROM information_schema.INNODB_FOREIGN ifb  join information_schema.INNODB_FOREIGN_COLS ifc WHERE ifb.ID LIKE "%uni_partial_json%" AND ifb.ID = ifc.ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uni_tables_cursor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uni_tables_cursor`(IN `schema_in` VARCHAR(100))
    NO SQL
BEGIN
  DECLARE name_schema varchar(64) ;
  DECLARE name_table varchar(64) ; 
 /* DECLARE name_column varchar(64) ; */
  DECLARE fin INTEGER DEFAULT 0;
  DECLARE sch_cursor CURSOR FOR SELECT DISTINCT TABLE_SCHEMA, TABLE_NAME FROM information_schema.TABLES WHERE TABLE_SCHEMA=schema_in;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin=1;
  
  OPEN sch_cursor;
  get_cursor: LOOP
  FETCH sch_cursor INTO name_schema,name_table;

 IF fin = TRUE 
    THEN
    	LEAVE get_cursor;
    END IF;
call uni_fields_cursor(name_schema,name_table);
Select name_schema,name_table;
  END LOOP get_cursor;
  CLOSE sch_cursor; 
END ;;
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

-- Dump completed on 2023-03-15 18:04:33
