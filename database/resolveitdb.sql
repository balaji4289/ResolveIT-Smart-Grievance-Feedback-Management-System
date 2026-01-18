CREATE DATABASE  IF NOT EXISTS `resolveitdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `resolveitdb`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: resolveitdb
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `complaint_id` bigint NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uploaded_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `complaint_id` (`complaint_id`),
  CONSTRAINT `attachments_ibfk_1` FOREIGN KEY (`complaint_id`) REFERENCES `complaints` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
INSERT INTO `attachments` VALUES (1,5,'Screenshot 2025-08-09 181511.png','uploads\\50ec085d-e1fb-409f-b2bb-055a66071383_Screenshot 2025-08-09 181511.png','2026-01-03 15:54:53'),(2,11,'Screenshot 2025-08-09 102245.png','uploads\\0f625ff5-a3b4-4b40-8a3b-5749d04cd9b6_Screenshot 2025-08-09 102245.png','2026-01-03 16:05:27'),(3,12,'Screenshot 2025-08-09 102903.png','uploads\\c67418fe-e52e-403c-8877-76ce8c3a3c50_Screenshot 2025-08-09 102903.png','2026-01-08 16:10:27'),(4,7,NULL,'1768099841066_Screenshot 2025-08-09 102245.png','2026-01-11 02:50:41'),(5,7,NULL,'1768099876106_Screenshot 2025-08-09 102245.png','2026-01-11 02:51:16'),(6,13,'Screenshot 2025-08-09 104349.png','uploads\\7bc49363-eb21-46d3-a6fc-9ebd78a9ceed_Screenshot 2025-08-09 104349.png','2026-01-12 08:14:26'),(7,13,'Screenshot 2025-08-09 181511.png','uploads\\b70ea30d-f7cb-4b9a-9924-4698390b470e_Screenshot 2025-08-09 181511.png','2026-01-12 08:14:26'),(8,11,'Screenshot 2025-08-09 104349.png','uploads\\207932ec-c804-4fed-b44d-5dcd0aa4249a_Screenshot 2025-08-09 104349.png','2026-01-12 08:54:46'),(9,11,'Screenshot 2025-08-09 181511.png','uploads\\86250ac2-8eea-44da-825e-3e872ddbd40e_Screenshot 2025-08-09 181511.png','2026-01-12 08:54:46'),(10,13,'Screenshot 2025-08-09 104349.png','uploads\\dc352e99-9478-4646-934f-e6a16166f83a_Screenshot 2025-08-09 104349.png','2026-01-12 09:05:10'),(11,13,'Screenshot 2025-08-09 181511.png','uploads\\1b1914e2-df51-464a-beec-a4e442134019_Screenshot 2025-08-09 181511.png','2026-01-12 09:05:10'),(12,13,'Screenshot 2025-08-09 104349.png','uploads\\6031abd5-a488-4dca-89dc-19b6cbfec987_Screenshot 2025-08-09 104349.png','2026-01-12 09:06:02'),(13,13,'Screenshot 2025-08-09 181511.png','uploads\\4029d535-75d7-4d38-bee0-ee406f9fa5d2_Screenshot 2025-08-09 181511.png','2026-01-12 09:06:02'),(14,11,'Screenshot 2025-08-09 104349.png','uploads\\4eceab8b-8ed6-4c5a-8187-f6e25c875a7a_Screenshot 2025-08-09 104349.png','2026-01-12 10:56:19'),(15,11,'Screenshot 2025-08-09 181511.png','uploads\\18dce577-97b0-4fbf-8a80-3890bb69dcc7_Screenshot 2025-08-09 181511.png','2026-01-12 10:56:19'),(16,11,'Screenshot 2025-08-09 104349.png','uploads\\1fbbddaf-7957-4dfb-ad3a-31fc340ace95_Screenshot 2025-08-09 104349.png','2026-01-12 13:22:34'),(17,11,'Screenshot 2025-08-09 181511.png','uploads\\506c89d9-375d-4774-ba2c-2bd75b3737da_Screenshot 2025-08-09 181511.png','2026-01-12 13:22:35'),(18,9,'Screenshot 2025-08-09 104349.png','uploads\\fa4ed126-c0a8-4ef1-84d7-caa8b999a831_Screenshot 2025-08-09 104349.png','2026-01-12 14:02:39'),(19,11,'Screenshot 2025-08-09 181511.png','uploads\\57cd8f4e-bf86-4f14-972e-ee43db2c8610_Screenshot 2025-08-09 181511.png','2026-01-12 14:17:13'),(20,9,'Screenshot 2025-08-09 104349.png','uploads\\6dab5d82-f69f-4de9-85dd-b9d8efb28a2e_Screenshot 2025-08-09 104349.png','2026-01-12 14:22:51'),(21,10,'Screenshot 2025-08-09 104349.png','uploads\\5fa1f4f0-e163-4946-a71b-dde1cff5e4a9_Screenshot 2025-08-09 104349.png','2026-01-12 14:22:59'),(22,4,'Screenshot 2025-08-09 181511.png','uploads\\d6d8fc99-e726-496e-a07c-f01a1c2a45b3_Screenshot 2025-08-09 181511.png','2026-01-12 16:19:23'),(23,4,'Screenshot 2025-08-09 104349.png','uploads\\1012195d-0b7e-443a-8e63-6d5d64d2871b_Screenshot 2025-08-09 104349.png','2026-01-12 16:26:06'),(24,7,'Screenshot 2025-08-09 104349.png','uploads\\e9b7f816-8ec7-4e57-acb0-49e38252eb7a_Screenshot 2025-08-09 104349.png','2026-01-12 16:46:13'),(25,4,'Screenshot 2025-08-09 104349.png','uploads\\364d619a-22f3-41ac-98df-70b811be49f6_Screenshot 2025-08-09 104349.png','2026-01-12 16:47:36'),(26,7,'Screenshot 2025-08-09 104349.png','uploads\\262ce50f-fb83-4297-b251-5444b331d982_Screenshot 2025-08-09 104349.png','2026-01-12 16:47:54'),(27,4,'Screenshot 2025-08-09 104349.png','uploads\\dd8f816f-17c0-471f-891d-8c46f2ed095c_Screenshot 2025-08-09 104349.png','2026-01-12 17:08:51'),(28,4,'Screenshot 2025-08-09 104349.png','uploads\\21bfe7d3-f7a5-47e5-a3eb-c592fef203bc_Screenshot 2025-08-09 104349.png','2026-01-12 17:21:56'),(29,6,'Screenshot 2025-08-09 104349.png','uploads\\348d1e44-0d6d-40e2-b52f-c7f2af243210_Screenshot 2025-08-09 104349.png','2026-01-12 17:22:06'),(30,6,'Screenshot 2025-08-09 104349.png','uploads\\8c239990-d697-4f90-a366-353c1493725d_Screenshot 2025-08-09 104349.png','2026-01-12 17:30:01'),(31,8,'Screenshot 2025-08-09 104349.png','uploads\\349775fc-e72d-4f86-b81f-cbd262703b3a_Screenshot 2025-08-09 104349.png','2026-01-12 17:30:29'),(32,12,'Screenshot 2025-08-09 104349.png','uploads\\aa8633ac-79ca-44a9-8918-296846d9f778_Screenshot 2025-08-09 104349.png','2026-01-12 17:30:56'),(33,13,'Screenshot 2025-08-09 104349.png','uploads\\60893190-6770-4216-89d9-1c92f2bf1627_Screenshot 2025-08-09 104349.png','2026-01-12 17:31:02'),(34,10,'Screenshot 2025-08-09 181511.png','uploads\\ff28345e-a0d3-4636-b282-e61e0e996026_Screenshot 2025-08-09 181511.png','2026-01-12 17:33:07'),(35,10,'Screenshot 2025-08-09 181511.png','uploads\\28595413-ae7c-40cd-b235-b611df531fd9_Screenshot 2025-08-09 181511.png','2026-01-12 17:39:30'),(36,10,'Screenshot 2025-08-09 181511.png','uploads\\8b54d805-156e-4bb5-a1ec-59bb73e09e15_Screenshot 2025-08-09 181511.png','2026-01-12 17:46:22'),(37,9,'Screenshot 2025-08-09 104349.png','uploads\\8f32c2e1-6a66-495e-b7cc-9dfb7e0ca185_Screenshot 2025-08-09 104349.png','2026-01-13 02:42:09'),(38,15,'Screenshot 2025-08-09 104349.png','uploads\\a4880fdf-7bba-4e3c-b56d-0df43d8c111f_Screenshot 2025-08-09 104349.png','2026-01-13 03:54:23'),(39,10,'Screenshot 2025-08-09 181511.png','uploads\\e6db2700-184e-4887-982e-0e98156182a1_Screenshot 2025-08-09 181511.png','2026-01-13 04:11:04'),(40,14,'Screenshot 2025-08-09 181511.png','uploads\\ff3d4eb1-97dc-49de-981f-3f4a1b0b2ea2_Screenshot 2025-08-09 181511.png','2026-01-13 04:11:13'),(41,15,'Screenshot 2025-08-09 104349.png','uploads\\43cf8f2a-baae-49aa-bd5a-c45a31929af6_Screenshot 2025-08-09 104349.png','2026-01-13 04:11:50'),(42,4,'Screenshot 2025-08-09 104349.png','uploads\\801d4e1e-c561-45cc-9014-27a245f71e31_Screenshot 2025-08-09 104349.png','2026-01-13 04:12:43'),(43,14,'Screenshot 2025-08-09 181511.png','uploads\\e525303e-2e15-43c5-a103-cc5150ca831f_Screenshot 2025-08-09 181511.png','2026-01-13 05:13:07'),(44,4,'Screenshot 2025-08-09 181511.png','uploads\\6cfc3e26-fc7a-4830-8d89-95562f1504da_Screenshot 2025-08-09 181511.png','2026-01-13 05:13:12'),(45,14,'Screenshot 2025-08-09 181511.png','uploads\\48879ce1-7380-44b5-8c7c-ac386511eaf9_Screenshot 2025-08-09 181511.png','2026-01-13 07:02:41'),(46,14,'Screenshot 2025-08-09 181511.png','uploads\\dddd7009-e6ed-4ee5-9616-fd6c6604e295_Screenshot 2025-08-09 181511.png','2026-01-14 11:12:07'),(47,16,'Screenshot 2025-08-09 181511.png','uploads\\c5d98dde-659d-46ae-878a-d971419a8d26_Screenshot 2025-08-09 181511.png','2026-01-14 14:36:31'),(48,16,'Screenshot 2025-08-09 181511.png','uploads\\81d93a48-7a80-4cff-b702-735c92bc196b_Screenshot 2025-08-09 181511.png','2026-01-14 14:48:12'),(49,16,'Screenshot 2025-08-09 181511.png','uploads\\07a3f3b8-d454-40e6-9ec6-fe748490e692_Screenshot 2025-08-09 181511.png','2026-01-14 15:40:58'),(50,4,'Screenshot 2025-08-09 181511.png','uploads\\0f3ff8b1-5e2b-4e5b-9bc1-c44bec2f41f8_Screenshot 2025-08-09 181511.png','2026-01-14 15:41:11'),(51,13,'Screenshot 2025-08-09 181511.png','uploads\\33e39b2e-d697-461d-b5d3-c70e90034ff9_Screenshot 2025-08-09 181511.png','2026-01-14 16:10:00'),(52,13,'Screenshot 2025-08-09 181511.png','uploads\\97dcd7d8-55f5-4a2a-99f9-071e9ff98b9b_Screenshot 2025-08-09 181511.png','2026-01-14 16:33:07'),(53,11,'Screenshot 2025-08-09 181511.png','uploads\\f53c1aae-9c9f-4c09-ad04-c95c02608171_Screenshot 2025-08-09 181511.png','2026-01-14 16:50:20'),(54,6,'Screenshot 2025-08-09 181511.png','uploads\\2529444c-601c-468b-a99c-902ae4ee4d0a_Screenshot 2025-08-09 181511.png','2026-01-14 17:01:03'),(55,7,'Screenshot 2025-08-09 181511.png','uploads\\25da0475-c9f1-4e46-af66-cc8d3f844f80_Screenshot 2025-08-09 181511.png','2026-01-14 17:01:09'),(56,12,'Screenshot 2025-08-09 181511.png','uploads\\781d8350-6d35-41f6-8020-9da6c8679ed4_Screenshot 2025-08-09 181511.png','2026-01-15 16:07:40'),(57,4,'Screenshot 2025-08-09 102245.png','uploads\\328d5ab3-88a1-49ad-a08e-a0f57299f929_Screenshot 2025-08-09 102245.png','2026-01-18 13:56:46'),(58,4,'Screenshot 2025-08-09 102245.png','uploads\\e7ef2c15-4ea3-4530-a836-aca655dbd4ab_Screenshot 2025-08-09 102245.png','2026-01-18 13:57:26');
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `complaint_id` bigint NOT NULL,
  `author_id` bigint DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `is_private` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FKn2na60ukhs76ibtpt9burkm27` (`author_id`),
  KEY `FKsve5ujlohy2v8yvonev3od655` (`complaint_id`),
  CONSTRAINT `FKn2na60ukhs76ibtpt9burkm27` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKsve5ujlohy2v8yvonev3od655` FOREIGN KEY (`complaint_id`) REFERENCES `complaints` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaint_status`
--

DROP TABLE IF EXISTS `complaint_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complaint_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint_status`
--

LOCK TABLES `complaint_status` WRITE;
/*!40000 ALTER TABLE `complaint_status` DISABLE KEYS */;
INSERT INTO `complaint_status` VALUES (1,'NEW','New'),(2,'UNDER_REVIEW','Under Review'),(3,'IN_PROGRESS','In Progress'),(4,'RESOLVED','Resolved'),(5,'ESCALATED','Escalated'),(6,'OPEN','Open');
/*!40000 ALTER TABLE `complaint_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaint_status_history`
--

DROP TABLE IF EXISTS `complaint_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complaint_status_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `complaint_id` bigint NOT NULL,
  `from_status_id` int NOT NULL,
  `to_status_id` int NOT NULL,
  `changed_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `changed_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_csh_complaint` (`complaint_id`),
  KEY `fk_csh_from_status` (`from_status_id`),
  KEY `fk_csh_to_status` (`to_status_id`),
  CONSTRAINT `fk_csh_complaint` FOREIGN KEY (`complaint_id`) REFERENCES `complaints` (`id`),
  CONSTRAINT `fk_csh_from_status` FOREIGN KEY (`from_status_id`) REFERENCES `complaint_status` (`id`),
  CONSTRAINT `fk_csh_to_status` FOREIGN KEY (`to_status_id`) REFERENCES `complaint_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint_status_history`
--

LOCK TABLES `complaint_status_history` WRITE;
/*!40000 ALTER TABLE `complaint_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `complaint_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaints`
--

DROP TABLE IF EXISTS `complaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complaints` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `category` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_anonymous` tinyint(1) DEFAULT '0',
  `user_id` bigint DEFAULT NULL,
  `status_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `priority` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status_id` (`status_id`),
  KEY `fk_complaints_user` (`user_id`),
  CONSTRAINT `complaints_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `complaint_status` (`id`),
  CONSTRAINT `fk_complaints_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaints`
--

LOCK TABLES `complaints` WRITE;
/*!40000 ALTER TABLE `complaints` DISABLE KEYS */;
INSERT INTO `complaints` VALUES (4,'Internet not working','No connectivity since morning','Network',0,23,4,'2025-12-25 10:04:50','2026-01-18 14:16:12','HIGH'),(5,'Internet not working','No connectivity since morning','Network',0,19,4,'2025-12-31 14:55:44','2026-01-11 18:55:13','HIGH'),(6,'no classrooms','no enough classrooms available','',0,23,6,'2025-12-31 16:34:13','2025-12-31 16:34:13','MEDIUM'),(7,'bad food','bad food in canteen','Infrastructure',1,23,6,'2025-12-31 16:47:28','2025-12-31 16:47:28','HIGH'),(8,'asd','asd','Academic',0,23,6,'2025-12-31 16:56:34','2025-12-31 16:56:34','LOW'),(9,'lack of dustbins','lack of dustbins','Infrastructure',0,21,6,'2026-01-01 10:55:05','2026-01-01 10:55:05','MEDIUM'),(10,'power out','no power since morning','Infrastructure',0,21,6,'2026-01-02 13:51:13','2026-01-18 14:23:19','MEDIUM'),(11,'asdf','asdf','Academic',0,23,6,'2026-01-03 16:05:27','2026-01-03 16:05:27','LOW'),(12,'qjdnc','hdbce','Academic',1,23,6,'2026-01-08 16:10:26','2026-01-08 16:10:26','LOW'),(13,'Internet not working','Connection drops frequently','Network',0,23,3,'2026-01-12 03:45:02','2026-01-14 13:09:54','HIGH'),(14,'Network issue','Internet not working in lab','IT',0,21,3,'2026-01-13 02:10:59','2026-01-15 16:07:52','HIGH'),(15,'Internet not working','No connectivity since morning','IT',0,21,6,'2026-01-13 03:53:12','2026-01-13 03:53:12','HIGH'),(16,'Internet not working','No connectivity since morning','IT',0,23,3,'2026-01-14 11:10:42','2026-01-14 13:09:34','HIGH'),(17,'Internet not working','No connectivity since morning','IT',0,23,3,'2026-01-14 14:48:40','2026-01-18 13:51:26','HIGH'),(18,'Internet not working','No connectivity since morning','IT',0,23,6,'2026-01-14 15:42:16','2026-01-14 15:42:16','HIGH'),(19,'Internet not working','No connectivity since morning','IT',0,23,6,'2026-01-14 16:36:40','2026-01-14 16:36:40','HIGH'),(20,'Internet not working','No connectivity since morning','IT',0,23,6,'2026-01-14 16:50:58','2026-01-14 16:50:58','HIGH'),(21,'Internet not working','No connectivity since morning','IT',0,23,6,'2026-01-14 17:01:39','2026-01-14 17:01:39','HIGH'),(22,'dfgh','jkl','Infrastructure',1,23,6,'2026-01-15 05:44:48','2026-01-15 05:44:48','LOW'),(23,'tyu','t','Academic',NULL,23,6,'2026-01-15 05:48:35','2026-01-15 05:48:35','MEDIUM'),(24,'qwe','qwe','adminstration',1,23,6,'2026-01-15 05:57:45','2026-01-15 05:57:45','MEDIUM'),(25,'qwe','awe','adminstration',1,23,6,'2026-01-15 05:57:57','2026-01-15 05:57:57','MEDIUM'),(26,'rty','rty','Academic',NULL,23,6,'2026-01-15 06:02:36','2026-01-15 06:02:36','MEDIUM'),(27,'qwe','op','Academic',NULL,23,6,'2026-01-15 15:28:27','2026-01-15 15:28:27','MEDIUM');
/*!40000 ALTER TABLE `complaints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escalations`
--

DROP TABLE IF EXISTS `escalations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escalations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `complaint_id` bigint NOT NULL,
  `escalated_to_role` int NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `escalated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `resolved` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `complaint_id` (`complaint_id`),
  KEY `escalated_to_role` (`escalated_to_role`),
  CONSTRAINT `escalations_ibfk_1` FOREIGN KEY (`complaint_id`) REFERENCES `complaints` (`id`),
  CONSTRAINT `escalations_ibfk_2` FOREIGN KEY (`escalated_to_role`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escalations`
--

LOCK TABLES `escalations` WRITE;
/*!40000 ALTER TABLE `escalations` DISABLE KEYS */;
/*!40000 ALTER TABLE `escalations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (8,'ROLE_ADMIN'),(9,'ROLE_SUPERVISOR'),(7,'ROLE_USER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` bigint NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `fk_user_roles_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (25,8),(26,8);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (15,'balaji06','balaji06@gmail.com','$2a$10$3WYuo1Ap6WcvthCN/Wy09.xJwK9d4LORwCgFnOj2HdrPQlJXCUb6.','Balaji Pechetti',1,'2025-12-19 08:38:52',NULL),(16,'rama','rama@gmail.com','$2a$10$VcaJIJAkTU7MzY04B7.LgOfTo1z6jMUP5x4z0saiWDQleEelA5PwS','rama p',1,'2025-12-19 08:49:40',NULL),(17,'suresh','suresh@gmail.com','$2a$10$8.xqWkE/SLPf85xiVS9Wxe2NEtOeSH5y78HLd7IbuNbYd.H.76zYy','suresh',1,'2025-12-19 09:03:18',NULL),(18,'ramana','ramana@gmail.com','$2a$10$ebvnvHUts4z06sFXqf8LaeIWb4ExQRDRvQf2mUnj9i6NlsNWVNvUG','ramana p',1,'2025-12-19 11:30:53',NULL),(19,'ramana2','ramana2@gmail.com','$2a$10$fvDzMdwFZf6WbW3zdUIdIuPlQ2Ag4HmCejgRqlJTCBvai9DA/6A0C','ramana p',1,'2025-12-22 09:42:06',NULL),(20,'harsha','harsha@gmail.com','$2a$10$iw2Hozenjjc8danYVzCEKOuTDutkIeeXU3wwLqbIGjHn23IoR.FSa','harsha p',1,'2025-12-22 09:53:11',NULL),(21,'balaji','balaji@gmail.com','$2a$10$eBRQ47T5Gg.vnoA6qVyTDube2cul.TMU9sUJUjgyLMpESG1QCSkmG','balaji p',1,'2025-12-22 10:19:46',NULL),(22,'siva','siva@gmail.com','$2a$10$A.2s2ROVtfAHcayMwEEl/OIxSSRd6tnqgSwihSooMcJ5nx/S70DSq','siva p',1,'2025-12-22 10:28:10',NULL),(23,'rahul','rahul@gmail.com','$2a$10$3LhKb7QbM8enIM/IRWPhOub1aeI7TfQg0/fn0kJdwTo/bcnmHztHS','rahul',1,'2025-12-24 17:08:36',NULL),(24,'rahul2','rahul2@gmail.com','$2a$10$30tx47BKxuKOTet2g1WyHuaiOU2aFTOUWrfYWC7BOY6/a.xplBAQq','rahul2',1,'2025-12-25 07:07:59',NULL),(25,'admin','admin@example.com','$2a$10$2yY9lVhHqG8c0J8jYzZD7e1m4y8kYcJg1AGQn1a8XKcYQGgkWzD9a','Admin User',1,'2026-01-07 14:32:07',NULL),(26,'admin1','admin1@example.com','$2a$10$EvxOFnJ6QOiV99kXckhDRumnAktjQfDfREO4TVjStROlTmnb5L3FG','admin1',1,'2026-01-08 16:17:23',NULL),(27,'user1','user1@test.com','$2a$10$T.z.j5fXElW.wmcsP4DBKen1WG2BrBOZAqiqO0L2Hfjag04ZjiWcO','User One',1,'2026-01-11 18:29:39',NULL),(28,'admin2','admin2@gmail.com','$2a$10$6vDk72V0qoXM4sV5LBhyCeb/4rHiCppfi9d100XQa/z7W3htBH3xm','admin2',1,'2026-01-15 15:55:28',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-18 20:40:48
