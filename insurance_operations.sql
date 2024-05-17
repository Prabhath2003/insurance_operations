-- MySQL dump 10.13  Distrib 8.0.37, for Win64 (x86_64)
--
-- Host: localhost    Database: insurance_operations
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (12,'vechie','vechile insurance');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerapplications`
--

DROP TABLE IF EXISTS `customerapplications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerapplications` (
  `application_id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) DEFAULT NULL,
  `policy_id` int DEFAULT NULL,
  `application_date` date DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `address` text,
  `average_income` decimal(10,2) DEFAULT NULL,
  `health` enum('Excellent','Good','Fair','Poor') DEFAULT NULL,
  `health_problems` text,
  `email` varchar(255) DEFAULT NULL,
  `policy_name` varchar(255) DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`application_id`),
  UNIQUE KEY `unique_email` (`email`),
  KEY `policy_id` (`policy_id`),
  KEY `c_id` (`category_id`),
  CONSTRAINT `c_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `customerapplications_ibfk_2` FOREIGN KEY (`policy_id`) REFERENCES `policies` (`policy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerapplications`
--

LOCK TABLES `customerapplications` WRITE;
/*!40000 ALTER TABLE `customerapplications` DISABLE KEYS */;
INSERT INTO `customerapplications` VALUES (24,'PANCHAKARLA PRABHATH KUMAR',12,'2002-05-05','09063040918','uhwuuef\r\n',15000.00,'Excellent','no','panchakarlaprabhathkumar794@gmail.com','vechile','vechie',12);
/*!40000 ALTER TABLE `customerapplications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerregistrations`
--

DROP TABLE IF EXISTS `customerregistrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerregistrations` (
  `cid` varchar(255) NOT NULL,
  `name` varchar(70) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` text,
  `password` varchar(30) DEFAULT NULL,
  `reply` text,
  `reply_date` date DEFAULT NULL,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerregistrations`
--

LOCK TABLES `customerregistrations` WRITE;
/*!40000 ALTER TABLE `customerregistrations` DISABLE KEYS */;
INSERT INTO `customerregistrations` VALUES ('iruyrwq','76gdsaguads','manasanaidu2209@gmail.com','08143604037','vijayawada','admin@123',NULL,NULL),('lucky','prabhath','panchakarlaprabhathkumar794@gmail.com','09063040918','vijayawada','1234',NULL,NULL),('lucky1','ppk','prabhathkumar20@gmail.com','2262727','vijayawada','admin@123',NULL,NULL),('naidu','naidu','prabhathpanchakarla@gmail.com','6364232463','vijayawad','1234',NULL,NULL),('raj1','raj','manasanaidu1022@gmail.com','9573538060','vijayawada','msanaidu02',NULL,NULL);
/*!40000 ALTER TABLE `customerregistrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquiries`
--

DROP TABLE IF EXISTS `inquiries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inquiries` (
  `inquiry_id` int NOT NULL AUTO_INCREMENT,
  `message` text,
  `inquiry_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `reply` text,
  `customer_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`inquiry_id`),
  KEY `fk_customer_id` (`customer_id`),
  CONSTRAINT `fk_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customerregistrations` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiries`
--

LOCK TABLES `inquiries` WRITE;
/*!40000 ALTER TABLE `inquiries` DISABLE KEYS */;
INSERT INTO `inquiries` VALUES (4,'i have a doubt','2024-05-15 05:26:17','dyytu',NULL),(5,'i have a doubt','2024-05-15 05:26:33','atseys',NULL),(6,'i have a doubt','2024-05-16 03:54:39',NULL,NULL),(7,'nbashf','2024-05-16 03:56:09','uakgs',NULL),(8,'i have a doubt','2024-05-16 04:00:27',NULL,NULL),(9,'hjkh','2024-05-16 04:08:28',NULL,NULL),(10,'i have no doubt','2024-05-16 05:38:11','ok then',NULL),(11,'ivbiu','2024-05-16 20:59:40',NULL,NULL),(12,'afssfdas','2024-05-16 21:06:36',NULL,NULL),(13,'dgsdgas','2024-05-16 21:15:34',NULL,NULL),(14,'dgsdg','2024-05-16 21:15:43',NULL,NULL),(15,'sdfs','2024-05-16 21:16:09',NULL,NULL),(16,'dgsds','2024-05-16 21:16:16',NULL,NULL),(17,'wfewe','2024-05-16 21:18:12',NULL,NULL),(18,'dwefe','2024-05-16 21:18:20',NULL,NULL),(19,'affafs','2024-05-16 21:19:37',NULL,NULL),(20,'jljeulefw','2024-05-16 21:19:44',NULL,NULL),(21,'ERW3','2024-05-17 03:27:51',NULL,NULL),(22,'ASRTW4T','2024-05-17 03:27:59',NULL,NULL),(23,'ggkghhl','2024-05-17 03:41:11',NULL,NULL),(24,'i have a doubt','2024-05-17 05:33:55',NULL,NULL),(25,'nbashf','2024-05-17 05:34:43',NULL,NULL),(26,'i have no doubts','2024-05-17 05:36:27',NULL,'naidu');
/*!40000 ALTER TABLE `inquiries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policies`
--

DROP TABLE IF EXISTS `policies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `policies` (
  `policy_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `coverage_area` varchar(255) DEFAULT NULL,
  `premium` decimal(10,2) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`policy_id`),
  KEY `pc_id` (`category_id`),
  CONSTRAINT `pc_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policies`
--

LOCK TABLES `policies` WRITE;
/*!40000 ALTER TABLE `policies` DISABLE KEYS */;
INSERT INTO `policies` VALUES (12,'vechie','vechile insurance','vechile',122413.00,12);
/*!40000 ALTER TABLE `policies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-17 12:23:37
