-- MySQL dump 10.15  Distrib 10.0.36-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: TA_server
-- ------------------------------------------------------
-- Server version	10.0.34-MariaDB-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`),
  CONSTRAINT `activations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` VALUES (4,7,'z3RausXJwxArt1trgBe4TN52DHxLFgZrzaQxlNqBUOsrQsCRgpvANDKuyuINGMo8','45.56.153.2','2018-04-06 08:44:48','2018-04-06 08:44:48'),(10,21,'i6WetqBraaJ39wQjA5HMq7VBR0mDUTDNGXpXAF9VKxiPwBs3gDWIjSr8bqfiD8IN','114.124.166.68','2018-07-15 05:40:04','2018-07-15 05:40:04'),(18,26,'hc9JsU62gOF4qiNy0uCo4hCzWZUmqVEtcNvCCXaTF6BpsGGH644aMDMzw5Pf45VJ','114.124.234.135','2018-07-18 05:43:26','2018-07-18 05:43:26');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `devicename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `onoff` tinyint(1) DEFAULT '1',
  `project_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `devices_project_id_foreign` (`project_id`),
  KEY `devices_user_id_foreign` (`user_id`),
  CONSTRAINT `devices_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `devices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
INSERT INTO `devices` VALUES (28,'aaa',1,31,25,'2018-07-18 06:20:43','2018-07-18 06:20:43'),(29,'aaa',0,33,25,'2018-07-18 06:21:28','2018-07-18 06:21:28'),(32,'Sensor Suhu',0,21,19,'2018-08-13 15:57:16','2018-09-09 14:11:40'),(36,'Sensor tinggi',1,40,30,'2018-09-06 10:42:48','2018-09-06 10:42:48'),(38,'cobain',1,21,19,'2018-09-10 02:50:22','2018-09-10 02:50:22'),(39,'motion sensor',1,41,33,'2018-09-10 02:50:32','2018-09-10 02:50:32'),(40,'Cold Sensor',1,43,32,'2018-09-10 02:50:39','2018-09-10 02:50:39'),(41,'Soil Moisture',1,44,34,'2018-09-10 02:50:55','2018-09-10 02:50:55'),(42,'heart sensor',1,45,31,'2018-09-10 02:50:58','2018-09-10 02:50:58'),(43,'PIR sensor',1,42,35,'2018-09-10 02:51:30','2018-09-10 02:51:30'),(44,'temperature',1,46,36,'2018-09-10 02:51:40','2018-09-10 02:51:40'),(46,'Sensor Suhu',1,49,38,'2018-09-26 03:35:09','2018-09-26 03:35:09'),(47,'Light Sensor',1,50,39,'2018-10-06 15:56:56','2018-10-06 15:56:56'),(48,'Temperature Sensor',1,50,39,'2018-10-06 15:57:13','2018-10-06 15:57:13');
/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laravel2step`
--

DROP TABLE IF EXISTS `laravel2step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laravel2step` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(10) unsigned NOT NULL,
  `authCode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authCount` int(11) NOT NULL,
  `authStatus` tinyint(1) NOT NULL DEFAULT '0',
  `authDate` datetime DEFAULT NULL,
  `requestDate` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `laravel2step_userid_index` (`userId`),
  CONSTRAINT `laravel2step_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laravel2step`
--

LOCK TABLES `laravel2step` WRITE;
/*!40000 ALTER TABLE `laravel2step` DISABLE KEYS */;
/*!40000 ALTER TABLE `laravel2step` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laravel_logger_activity`
--

DROP TABLE IF EXISTS `laravel_logger_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laravel_logger_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `userType` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `route` longtext COLLATE utf8mb4_unicode_ci,
  `ipAddress` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userAgent` text COLLATE utf8mb4_unicode_ci,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` longtext COLLATE utf8mb4_unicode_ci,
  `methodType` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3494 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laravel_logger_activity`
--

LOCK TABLES `laravel_logger_activity` WRITE;
/*!40000 ALTER TABLE `laravel_logger_activity` DISABLE KEYS */;
INSERT INTO `laravel_logger_activity` VALUES (3354,'Viewed account/fikrinaufalf/edit','Registered',37,'http://skripsweet.tk/account/fikrinaufalf/edit','125.163.89.199','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9','http://skripsweet.tk/home','GET','2018-09-12 13:09:23','2018-09-12 13:09:23',NULL),(3355,'Viewed projects','Registered',37,'http://skripsweet.tk/projects','125.163.89.199','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9','http://skripsweet.tk/account/fikrinaufalf/edit','GET','2018-09-12 13:09:26','2018-09-12 13:09:26',NULL),(3356,'Viewed projects/create','Registered',37,'http://skripsweet.tk/projects/create','125.163.89.199','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9','http://skripsweet.tk/projects','GET','2018-09-12 13:09:27','2018-09-12 13:09:27',NULL),(3357,'Created projects','Registered',37,'http://skripsweet.tk/projects','125.163.89.199','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9','http://skripsweet.tk/projects/create','POST','2018-09-12 13:13:14','2018-09-12 13:13:14',NULL),(3358,'Viewed projects','Registered',37,'http://skripsweet.tk/projects','125.163.89.199','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9','http://skripsweet.tk/projects/create','GET','2018-09-12 13:13:14','2018-09-12 13:13:14',NULL),(3359,'Viewed projects/48','Registered',37,'http://skripsweet.tk/projects/48','125.163.89.199','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9','http://skripsweet.tk/projects','GET','2018-09-12 13:13:22','2018-09-12 13:13:22',NULL),(3360,'Viewed devices/created/48','Registered',37,'http://skripsweet.tk/devices/created/48','125.163.89.199','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9','http://skripsweet.tk/projects/48','GET','2018-09-12 13:13:31','2018-09-12 13:13:31',NULL),(3361,'Viewed account/fikrinaufalf/edit','Registered',37,'http://skripsweet.tk/account/fikrinaufalf/edit','125.163.89.199','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9','http://skripsweet.tk/projects/48','GET','2018-09-12 13:13:36','2018-09-12 13:13:36',NULL),(3362,'Logged In','Registered',38,'http://skripsweet.tk/login','36.71.233.155','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/login','POST','2018-09-13 15:40:59','2018-09-13 15:40:59',NULL),(3363,'Viewed home','Registered',38,'http://skripsweet.tk/home','36.71.233.155','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/login','GET','2018-09-13 15:40:59','2018-09-13 15:40:59',NULL),(3364,'Viewed projects/47','Registered',38,'http://skripsweet.tk/projects/47','36.71.233.155','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/home','GET','2018-09-13 15:41:25','2018-09-13 15:41:25',NULL),(3365,'Viewed devices/45','Registered',38,'http://skripsweet.tk/devices/45','36.71.233.155','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/projects/47','GET','2018-09-13 15:41:30','2018-09-13 15:41:30',NULL),(3366,'Logged In','Registered',36,'http://skripsweet.tk/login','36.71.233.184','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9','http://skripsweet.tk/login','POST','2018-09-13 15:41:56','2018-09-13 15:41:56',NULL),(3367,'Viewed home','Registered',36,'http://skripsweet.tk/home','36.71.233.184','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9','http://skripsweet.tk/login','GET','2018-09-13 15:41:56','2018-09-13 15:41:56',NULL),(3368,'Viewed projects/47','Registered',38,'http://skripsweet.tk/projects/47','36.71.233.155','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/devices/45','GET','2018-09-13 15:45:43','2018-09-13 15:45:43',NULL),(3369,'Viewed projects','Registered',38,'http://skripsweet.tk/projects','36.71.233.155','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/projects/47','GET','2018-09-13 15:45:46','2018-09-13 15:45:46',NULL),(3370,'Viewed account/mustofa_l/edit','Registered',38,'http://skripsweet.tk/account/mustofa_l/edit','36.71.233.155','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/projects','GET','2018-09-13 15:45:50','2018-09-13 15:45:50',NULL),(3371,'Logged Out','Registered',38,'http://skripsweet.tk/logout','36.71.233.155','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/account/mustofa_l/edit','POST','2018-09-13 15:46:01','2018-09-13 15:46:01',NULL),(3372,'Viewed projects/46','Registered',36,'http://skripsweet.tk/projects/46','36.71.233.184','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9','http://skripsweet.tk/home','GET','2018-09-13 15:47:38','2018-09-13 15:47:38',NULL),(3373,'Viewed devices/44','Registered',36,'http://skripsweet.tk/devices/44','36.71.233.184','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9','http://skripsweet.tk/projects/46','GET','2018-09-13 15:47:47','2018-09-13 15:47:47',NULL),(3374,'Logged In','Registered',38,'http://skripsweet.tk/login','36.71.233.235','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/login','POST','2018-09-14 03:33:49','2018-09-14 03:33:49',NULL),(3375,'Viewed home','Registered',38,'http://skripsweet.tk/home','36.71.233.235','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/login','GET','2018-09-14 03:33:49','2018-09-14 03:33:49',NULL),(3376,'Viewed account/mustofa_l/edit','Registered',38,'http://skripsweet.tk/account/mustofa_l/edit','36.71.233.235','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/home','GET','2018-09-14 03:33:57','2018-09-14 03:33:57',NULL),(3377,'Viewed projects','Registered',38,'http://skripsweet.tk/projects','36.71.233.235','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/account/mustofa_l/edit','GET','2018-09-14 03:34:21','2018-09-14 03:34:21',NULL),(3378,'Viewed projects/create','Registered',38,'http://skripsweet.tk/projects/create','36.71.233.235','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/projects','GET','2018-09-14 03:34:54','2018-09-14 03:34:54',NULL),(3379,'Viewed projects','Registered',38,'http://skripsweet.tk/projects','36.71.233.235','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/projects/create','GET','2018-09-14 03:35:28','2018-09-14 03:35:28',NULL),(3380,'Viewed projects/47','Registered',38,'http://skripsweet.tk/projects/47','36.71.233.235','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/projects','GET','2018-09-14 03:35:30','2018-09-14 03:35:30',NULL),(3381,'Viewed devices/45','Registered',38,'http://skripsweet.tk/devices/45','36.71.233.235','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/projects/47','GET','2018-09-14 03:35:33','2018-09-14 03:35:33',NULL),(3382,'Failed Login Attempt','Guest',NULL,'http://skripsweet.tk/login','36.71.233.243','Mozilla/5.0 (Linux; Android 8.0.0; SM-G935F Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.91 Mobile Safari/537.36','en-US,en;q=0.9,id-ID;q=0.8,id;q=0.7','http://skripsweet.tk/login','POST','2018-09-14 23:38:03','2018-09-14 23:38:03',NULL),(3383,'Logged In','Registered',39,'http://skripsweet.tk/login','36.71.233.243','Mozilla/5.0 (Linux; Android 8.0.0; SM-G935F Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.91 Mobile Safari/537.36','en-US,en;q=0.9,id-ID;q=0.8,id;q=0.7','http://skripsweet.tk/login','POST','2018-09-14 23:38:13','2018-09-14 23:38:13',NULL),(3384,'Viewed activate/QDyioYffMxhDGb5bK1oGYJFoJyFD7lesRjwuoBCFGbCgfhK15GXHO3NSrw2EN1hH','Registered',39,'http://skripsweet.tk/activate/QDyioYffMxhDGb5bK1oGYJFoJyFD7lesRjwuoBCFGbCgfhK15GXHO3NSrw2EN1hH','36.71.233.243','Mozilla/5.0 (Linux; Android 8.0.0; SM-G935F Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.91 Mobile Safari/537.36','en-US,en;q=0.9,id-ID;q=0.8,id;q=0.7','http://skripsweet.tk/login','GET','2018-09-14 23:38:13','2018-09-14 23:38:13',NULL),(3385,'Viewed home','Registered',39,'http://skripsweet.tk/home','36.71.233.243','Mozilla/5.0 (Linux; Android 8.0.0; SM-G935F Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.91 Mobile Safari/537.36','en-US,en;q=0.9,id-ID;q=0.8,id;q=0.7','http://skripsweet.tk/login','GET','2018-09-14 23:38:13','2018-09-14 23:38:13',NULL),(3386,'Logged In','Registered',38,'http://skripsweet.tk','36.71.235.180','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9,id;q=0.8',NULL,'GET','2018-09-18 03:33:54','2018-09-18 03:33:54',NULL),(3387,'Logged In','Registered',2,'http://skripsweet.tk/login','103.233.100.252','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7','http://skripsweet.tk/login','POST','2018-09-18 12:28:39','2018-09-18 12:28:39',NULL),(3388,'Viewed home','Registered',2,'http://skripsweet.tk/home','103.233.100.252','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7','http://skripsweet.tk/login','GET','2018-09-18 12:28:39','2018-09-18 12:28:39',NULL),(3389,'Viewed account/blake.boehm/edit','Registered',2,'http://skripsweet.tk/account/blake.boehm/edit','103.233.100.252','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7','http://skripsweet.tk/home','GET','2018-09-18 12:30:10','2018-09-18 12:30:10',NULL),(3390,'Viewed projects','Registered',2,'http://skripsweet.tk/projects','103.233.100.252','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7','http://skripsweet.tk/account/blake.boehm/edit','GET','2018-09-18 12:30:14','2018-09-18 12:30:14',NULL),(3391,'Logged Out','Registered',2,'http://skripsweet.tk/logout','103.233.100.252','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7','http://skripsweet.tk/projects','POST','2018-09-18 12:30:21','2018-09-18 12:30:21',NULL),(3392,'Logged In','Registered',38,'http://skripsweet.tk','103.233.100.251','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9,id;q=0.8',NULL,'GET','2018-09-19 02:37:47','2018-09-19 02:37:47',NULL),(3393,'Viewed home','Registered',38,'http://skripsweet.tk/home','103.233.100.251','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/','GET','2018-09-19 02:40:43','2018-09-19 02:40:43',NULL),(3394,'Logged Out','Registered',38,'http://skripsweet.tk/logout','103.233.100.251','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/home','POST','2018-09-19 02:40:56','2018-09-19 02:40:56',NULL),(3395,'Failed Login Attempt','Guest',NULL,'http://skripsweet.tk/login','103.233.100.250','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9','http://skripsweet.tk/login','POST','2018-09-19 03:32:17','2018-09-19 03:32:17',NULL),(3396,'Logged In','Registered',36,'http://skripsweet.tk/login','103.233.100.250','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9','http://skripsweet.tk/login','POST','2018-09-19 03:32:32','2018-09-19 03:32:32',NULL),(3397,'Viewed home','Registered',36,'http://skripsweet.tk/home','103.233.100.250','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9','http://skripsweet.tk/login','GET','2018-09-19 03:32:32','2018-09-19 03:32:32',NULL),(3398,'Failed Login Attempt','Guest',NULL,'http://skripsweet.tk/login','222.124.118.145','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9','http://skripsweet.tk/login','POST','2018-09-19 07:55:18','2018-09-19 07:55:18',NULL),(3399,'Failed Login Attempt','Guest',NULL,'http://skripsweet.tk/login','222.124.118.145','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9','http://skripsweet.tk/login','POST','2018-09-19 07:56:20','2018-09-19 07:56:20',NULL),(3400,'Failed Login Attempt','Guest',NULL,'http://skripsweet.tk/login','222.124.118.145','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9','http://skripsweet.tk/login','POST','2018-09-19 07:56:27','2018-09-19 07:56:27',NULL),(3401,'Failed Login Attempt','Guest',NULL,'http://skripsweet.tk/login','222.124.118.145','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9','http://skripsweet.tk/login','POST','2018-09-19 07:56:31','2018-09-19 07:56:31',NULL),(3402,'Logged In','Registered',36,'http://skripsweet.tk/login','222.124.118.145','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9','http://skripsweet.tk/login','POST','2018-09-19 07:56:37','2018-09-19 07:56:37',NULL),(3403,'Viewed home','Registered',36,'http://skripsweet.tk/home','222.124.118.145','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9','http://skripsweet.tk/login','GET','2018-09-19 07:56:37','2018-09-19 07:56:37',NULL),(3404,'Viewed projects/46','Registered',36,'http://skripsweet.tk/projects/46','222.124.118.145','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9','http://skripsweet.tk/home','GET','2018-09-19 07:56:41','2018-09-19 07:56:41',NULL),(3405,'Viewed devices/44','Registered',36,'http://skripsweet.tk/devices/44','222.124.118.145','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9','http://skripsweet.tk/projects/46','GET','2018-09-19 07:56:56','2018-09-19 07:56:56',NULL),(3406,'Viewed account/ndiputri/edit','Registered',36,'http://skripsweet.tk/account/ndiputri/edit','222.124.118.145','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9','http://skripsweet.tk/devices/44','GET','2018-09-19 07:57:08','2018-09-19 07:57:08',NULL),(3407,'Viewed projects','Registered',36,'http://skripsweet.tk/projects','222.124.118.145','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9','http://skripsweet.tk/account/ndiputri/edit','GET','2018-09-19 07:57:55','2018-09-19 07:57:55',NULL),(3408,'Logged In','Registered',38,'http://skripsweet.tk/login','36.71.234.145','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/login','POST','2018-09-19 16:28:29','2018-09-19 16:28:29',NULL),(3409,'Viewed home','Registered',38,'http://skripsweet.tk/home','36.71.234.145','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/login','GET','2018-09-19 16:28:29','2018-09-19 16:28:29',NULL),(3410,'Logged Out','Registered',38,'http://skripsweet.tk/logout','36.71.234.145','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/home','POST','2018-09-19 16:38:17','2018-09-19 16:38:17',NULL),(3411,'Logged In','Registered',1,'http://skripsweet.tk/login','36.85.232.246','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/login','POST','2018-09-26 03:08:23','2018-09-26 03:08:23',NULL),(3412,'Viewed home','Registered',1,'http://skripsweet.tk/home','36.85.232.246','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/login','GET','2018-09-26 03:08:23','2018-09-26 03:08:23',NULL),(3413,'Viewed users','Registered',1,'http://skripsweet.tk/users','36.85.232.246','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/home','GET','2018-09-26 03:08:42','2018-09-26 03:08:42',NULL),(3414,'Viewed users/38','Registered',1,'http://skripsweet.tk/users/38','36.85.232.246','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/users','GET','2018-09-26 03:08:57','2018-09-26 03:08:57',NULL),(3415,'Logged Out','Registered',1,'http://skripsweet.tk/logout','36.85.232.246','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/users/38','POST','2018-09-26 03:09:23','2018-09-26 03:09:23',NULL),(3416,'Logged In','Registered',38,'http://skripsweet.tk/login','36.85.232.246','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/login','POST','2018-09-26 03:15:02','2018-09-26 03:15:02',NULL),(3417,'Viewed profile/mustofa_l','Registered',38,'http://skripsweet.tk/profile/mustofa_l','36.85.232.246','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/login','GET','2018-09-26 03:15:03','2018-09-26 03:15:03',NULL),(3418,'Viewed home','Registered',38,'http://skripsweet.tk/home','36.85.232.246','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/','GET','2018-09-26 03:17:31','2018-09-26 03:17:31',NULL),(3419,'Viewed projects/47','Registered',38,'http://skripsweet.tk/projects/47','36.85.232.246','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/home','GET','2018-09-26 03:17:36','2018-09-26 03:17:36',NULL),(3420,'Viewed devices/45','Registered',38,'http://skripsweet.tk/devices/45','36.85.232.246','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/projects/47','GET','2018-09-26 03:17:40','2018-09-26 03:17:40',NULL),(3421,'Viewed projects','Registered',38,'http://skripsweet.tk/projects','36.85.232.246','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/devices/45','GET','2018-09-26 03:17:53','2018-09-26 03:17:53',NULL),(3422,'Viewed projects/create','Registered',38,'http://skripsweet.tk/projects/create','36.85.232.246','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/projects','GET','2018-09-26 03:18:04','2018-09-26 03:18:04',NULL),(3423,'Created projects','Registered',38,'http://skripsweet.tk/projects','36.85.232.246','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/projects/create','POST','2018-09-26 03:22:59','2018-09-26 03:22:59',NULL),(3424,'Viewed projects/create','Registered',38,'http://skripsweet.tk/projects/create','36.85.232.246','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/projects/create','GET','2018-09-26 03:22:59','2018-09-26 03:22:59',NULL),(3425,'Viewed projects','Registered',38,'http://skripsweet.tk/projects','36.85.232.246','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/projects/create','GET','2018-09-26 03:24:43','2018-09-26 03:24:43',NULL),(3426,'Viewed projects/47/edit','Registered',38,'http://skripsweet.tk/projects/47/edit','36.85.232.246','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/projects','GET','2018-09-26 03:24:45','2018-09-26 03:24:45',NULL),(3427,'Viewed projects','Registered',38,'http://skripsweet.tk/projects','36.85.232.246','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/projects/47/edit','GET','2018-09-26 03:24:49','2018-09-26 03:24:49',NULL),(3428,'Deleted projects/47','Registered',38,'http://skripsweet.tk/projects/47','36.85.232.246','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/projects','DELETE','2018-09-26 03:31:08','2018-09-26 03:31:08',NULL),(3429,'Viewed projects','Registered',38,'http://skripsweet.tk/projects','36.85.232.246','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/projects','GET','2018-09-26 03:31:08','2018-09-26 03:31:08',NULL),(3430,'Viewed projects/create','Registered',38,'http://skripsweet.tk/projects/create','36.85.232.246','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/projects','GET','2018-09-26 03:33:43','2018-09-26 03:33:43',NULL),(3431,'Created projects','Registered',38,'http://skripsweet.tk/projects','36.85.232.246','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/projects/create','POST','2018-09-26 03:34:50','2018-09-26 03:34:50',NULL),(3432,'Viewed projects','Registered',38,'http://skripsweet.tk/projects','36.85.232.246','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/projects/create','GET','2018-09-26 03:34:50','2018-09-26 03:34:50',NULL),(3433,'Viewed projects/49','Registered',38,'http://skripsweet.tk/projects/49','36.85.232.246','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/projects','GET','2018-09-26 03:34:57','2018-09-26 03:34:57',NULL),(3434,'Viewed devices/created/49','Registered',38,'http://skripsweet.tk/devices/created/49','36.85.232.246','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/projects/49','GET','2018-09-26 03:35:06','2018-09-26 03:35:06',NULL),(3435,'Created devices','Registered',38,'http://skripsweet.tk/devices','36.85.232.246','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/devices/created/49','POST','2018-09-26 03:35:09','2018-09-26 03:35:09',NULL),(3436,'Viewed projects/49','Registered',38,'http://skripsweet.tk/projects/49','36.85.232.246','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/devices/created/49','GET','2018-09-26 03:35:09','2018-09-26 03:35:09',NULL),(3437,'Viewed devices/46','Registered',38,'http://skripsweet.tk/devices/46','36.85.232.246','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/projects/49','GET','2018-09-26 03:35:14','2018-09-26 03:35:14',NULL),(3438,'Viewed home','Registered',38,'http://skripsweet.tk/home','36.85.232.246','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/devices/46','GET','2018-09-26 03:38:04','2018-09-26 03:38:04',NULL),(3439,'Viewed projects/49','Registered',38,'http://skripsweet.tk/projects/49','36.85.232.246','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/home','GET','2018-09-26 03:38:38','2018-09-26 03:38:38',NULL),(3440,'Viewed projects','Registered',38,'http://skripsweet.tk/projects','36.85.232.246','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/projects/49','GET','2018-09-26 03:42:32','2018-09-26 03:42:32',NULL),(3441,'Viewed projects/49','Registered',38,'http://skripsweet.tk/projects/49','36.85.232.246','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/projects','GET','2018-09-26 03:43:13','2018-09-26 03:43:13',NULL),(3442,'Viewed projects/49','Registered',38,'http://skripsweet.tk/projects/49','36.85.232.246','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/projects','GET','2018-09-26 03:43:13','2018-09-26 03:43:13',NULL),(3443,'Logged In','Registered',32,'http://skripsweet.tk/login','36.79.163.201','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9','http://skripsweet.tk/login','POST','2018-09-26 11:40:19','2018-09-26 11:40:19',NULL),(3444,'Viewed home','Registered',32,'http://skripsweet.tk/home','36.79.163.201','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9','http://skripsweet.tk/login','GET','2018-09-26 11:40:19','2018-09-26 11:40:19',NULL),(3445,'Viewed projects/43','Registered',32,'http://skripsweet.tk/projects/43','36.79.163.201','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9','http://skripsweet.tk/home','GET','2018-09-26 11:40:31','2018-09-26 11:40:31',NULL),(3446,'Viewed devices/40','Registered',32,'http://skripsweet.tk/devices/40','36.79.163.201','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9','http://skripsweet.tk/projects/43','GET','2018-09-26 11:40:46','2018-09-26 11:40:46',NULL),(3447,'Viewed account/donnygg/edit','Registered',32,'http://skripsweet.tk/account/donnygg/edit','36.79.163.201','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9','http://skripsweet.tk/devices/40','GET','2018-09-26 11:41:05','2018-09-26 11:41:05',NULL),(3448,'Viewed projects','Registered',32,'http://skripsweet.tk/projects','36.79.163.201','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9','http://skripsweet.tk/account/donnygg/edit','GET','2018-09-26 11:41:51','2018-09-26 11:41:51',NULL),(3449,'Viewed projects','Registered',32,'http://skripsweet.tk/projects','36.79.163.201','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9','http://skripsweet.tk/account/donnygg/edit','GET','2018-09-26 11:41:51','2018-09-26 11:41:51',NULL),(3450,'Viewed projects/43/edit','Registered',32,'http://skripsweet.tk/projects/43/edit','36.79.163.201','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9','http://skripsweet.tk/projects','GET','2018-09-26 11:41:57','2018-09-26 11:41:57',NULL),(3451,'Viewed projects','Registered',32,'http://skripsweet.tk/projects','36.79.163.201','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9','http://skripsweet.tk/projects/43/edit','GET','2018-09-26 11:42:01','2018-09-26 11:42:01',NULL),(3452,'Logged Out','Registered',32,'http://skripsweet.tk/logout','36.79.163.201','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9','http://skripsweet.tk/projects','POST','2018-09-26 11:45:18','2018-09-26 11:45:18',NULL),(3453,'Failed Login Attempt','Guest',NULL,'http://skripsweet.tk/login','103.233.100.254','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:62.0) Gecko/20100101 Firefox/62.0','en-US,en;q=0.5','http://skripsweet.tk/login','POST','2018-09-30 12:41:58','2018-09-30 12:41:58',NULL),(3454,'Logged In','Registered',19,'http://skripsweet.tk/login','103.233.100.254','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:62.0) Gecko/20100101 Firefox/62.0','en-US,en;q=0.5','http://skripsweet.tk/login','POST','2018-09-30 12:42:03','2018-09-30 12:42:03',NULL),(3455,'Viewed home','Registered',19,'http://skripsweet.tk/home','103.233.100.254','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:62.0) Gecko/20100101 Firefox/62.0','en-US,en;q=0.5','http://skripsweet.tk/login','GET','2018-09-30 12:42:03','2018-09-30 12:42:03',NULL),(3456,'Viewed projects/21','Registered',19,'http://skripsweet.tk/projects/21','103.233.100.254','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:62.0) Gecko/20100101 Firefox/62.0','en-US,en;q=0.5','http://skripsweet.tk/home','GET','2018-09-30 12:50:40','2018-09-30 12:50:40',NULL),(3457,'Viewed projects','Registered',19,'http://skripsweet.tk/projects','103.233.100.254','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:62.0) Gecko/20100101 Firefox/62.0','en-US,en;q=0.5','http://skripsweet.tk/projects/21','GET','2018-09-30 12:50:45','2018-09-30 12:50:45',NULL),(3458,'Viewed projects/create','Registered',19,'http://skripsweet.tk/projects/create','103.233.100.254','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:62.0) Gecko/20100101 Firefox/62.0','en-US,en;q=0.5','http://skripsweet.tk/projects','GET','2018-09-30 12:50:56','2018-09-30 12:50:56',NULL),(3459,'Viewed projects','Registered',19,'http://skripsweet.tk/projects','103.233.100.254','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:62.0) Gecko/20100101 Firefox/62.0','en-US,en;q=0.5','http://skripsweet.tk/projects/create','GET','2018-09-30 12:59:54','2018-09-30 12:59:54',NULL),(3460,'Viewed projects/21','Registered',19,'http://skripsweet.tk/projects/21','103.233.100.254','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:62.0) Gecko/20100101 Firefox/62.0','en-US,en;q=0.5','http://skripsweet.tk/projects','GET','2018-09-30 13:07:31','2018-09-30 13:07:31',NULL),(3461,'Viewed devices/created/21','Registered',19,'http://skripsweet.tk/devices/created/21','103.233.100.254','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:62.0) Gecko/20100101 Firefox/62.0','en-US,en;q=0.5','http://skripsweet.tk/projects/21','GET','2018-09-30 13:07:33','2018-09-30 13:07:33',NULL),(3462,'Failed Login Attempt','Guest',NULL,'http://skripsweet.tk/login','180.245.176.97','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/login','POST','2018-10-06 12:40:54','2018-10-06 12:40:54',NULL),(3463,'Failed Login Attempt','Guest',NULL,'http://skripsweet.tk/login','180.245.176.97','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/login','POST','2018-10-06 12:41:02','2018-10-06 12:41:02',NULL),(3464,'Failed Login Attempt','Guest',NULL,'http://skripsweet.tk/login','180.245.176.97','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/login','POST','2018-10-06 12:41:11','2018-10-06 12:41:11',NULL),(3465,'Failed Login Attempt','Guest',NULL,'http://skripsweet.tk/login','180.245.176.97','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/login','POST','2018-10-06 12:41:17','2018-10-06 12:41:17',NULL),(3466,'Failed Login Attempt','Guest',NULL,'http://skripsweet.tk/login','180.245.176.97','Mozilla/5.0 (Linux; Android 8.0.0; SM-G935F Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Mobile Safari/537.36','id-ID,id;q=0.9','http://skripsweet.tk/login','POST','2018-10-06 15:54:50','2018-10-06 15:54:50',NULL),(3467,'Logged In','Registered',39,'http://skripsweet.tk/login','180.245.176.97','Mozilla/5.0 (Linux; Android 8.0.0; SM-G935F Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Mobile Safari/537.36','id-ID,id;q=0.9','http://skripsweet.tk/login','POST','2018-10-06 15:55:04','2018-10-06 15:55:04',NULL),(3468,'Viewed home','Registered',39,'http://skripsweet.tk/home','180.245.176.97','Mozilla/5.0 (Linux; Android 8.0.0; SM-G935F Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Mobile Safari/537.36','id-ID,id;q=0.9','http://skripsweet.tk/login','GET','2018-10-06 15:55:04','2018-10-06 15:55:04',NULL),(3469,'Viewed projects/create','Registered',39,'http://skripsweet.tk/projects/create','180.245.176.97','Mozilla/5.0 (Linux; Android 8.0.0; SM-G935F Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Mobile Safari/537.36','id-ID,id;q=0.9','http://skripsweet.tk/home','GET','2018-10-06 15:55:10','2018-10-06 15:55:10',NULL),(3470,'Created projects','Registered',39,'http://skripsweet.tk/projects','180.245.176.97','Mozilla/5.0 (Linux; Android 8.0.0; SM-G935F Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Mobile Safari/537.36','id-ID,id;q=0.9','http://skripsweet.tk/projects/create','POST','2018-10-06 15:55:32','2018-10-06 15:55:32',NULL),(3471,'Viewed projects','Registered',39,'http://skripsweet.tk/projects','180.245.176.97','Mozilla/5.0 (Linux; Android 8.0.0; SM-G935F Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Mobile Safari/537.36','id-ID,id;q=0.9','http://skripsweet.tk/projects/create','GET','2018-10-06 15:55:32','2018-10-06 15:55:32',NULL),(3472,'Viewed projects/50','Registered',39,'http://skripsweet.tk/projects/50','180.245.176.97','Mozilla/5.0 (Linux; Android 8.0.0; SM-G935F Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Mobile Safari/537.36','id-ID,id;q=0.9','http://skripsweet.tk/projects','GET','2018-10-06 15:55:42','2018-10-06 15:55:42',NULL),(3473,'Viewed devices/created/50','Registered',39,'http://skripsweet.tk/devices/created/50','180.245.176.97','Mozilla/5.0 (Linux; Android 8.0.0; SM-G935F Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Mobile Safari/537.36','id-ID,id;q=0.9','http://skripsweet.tk/projects/50','GET','2018-10-06 15:55:53','2018-10-06 15:55:53',NULL),(3474,'Created devices','Registered',39,'http://skripsweet.tk/devices','180.245.176.97','Mozilla/5.0 (Linux; Android 8.0.0; SM-G935F Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Mobile Safari/537.36','id-ID,id;q=0.9','http://skripsweet.tk/devices/created/50','POST','2018-10-06 15:56:47','2018-10-06 15:56:47',NULL),(3475,'Viewed devices/created/50','Registered',39,'http://skripsweet.tk/devices/created/50','180.245.176.97','Mozilla/5.0 (Linux; Android 8.0.0; SM-G935F Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Mobile Safari/537.36','id-ID,id;q=0.9','http://skripsweet.tk/devices/created/50','GET','2018-10-06 15:56:47','2018-10-06 15:56:47',NULL),(3476,'Created devices','Registered',39,'http://skripsweet.tk/devices','180.245.176.97','Mozilla/5.0 (Linux; Android 8.0.0; SM-G935F Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Mobile Safari/537.36','id-ID,id;q=0.9','http://skripsweet.tk/devices/created/50','POST','2018-10-06 15:56:56','2018-10-06 15:56:56',NULL),(3477,'Viewed projects/50','Registered',39,'http://skripsweet.tk/projects/50','180.245.176.97','Mozilla/5.0 (Linux; Android 8.0.0; SM-G935F Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Mobile Safari/537.36','id-ID,id;q=0.9','http://skripsweet.tk/devices/created/50','GET','2018-10-06 15:56:56','2018-10-06 15:56:56',NULL),(3478,'Viewed devices/created/50','Registered',39,'http://skripsweet.tk/devices/created/50','180.245.176.97','Mozilla/5.0 (Linux; Android 8.0.0; SM-G935F Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Mobile Safari/537.36','id-ID,id;q=0.9','http://skripsweet.tk/projects/50','GET','2018-10-06 15:57:02','2018-10-06 15:57:02',NULL),(3479,'Created devices','Registered',39,'http://skripsweet.tk/devices','180.245.176.97','Mozilla/5.0 (Linux; Android 8.0.0; SM-G935F Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Mobile Safari/537.36','id-ID,id;q=0.9','http://skripsweet.tk/devices/created/50','POST','2018-10-06 15:57:13','2018-10-06 15:57:13',NULL),(3480,'Viewed projects/50','Registered',39,'http://skripsweet.tk/projects/50','180.245.176.97','Mozilla/5.0 (Linux; Android 8.0.0; SM-G935F Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Mobile Safari/537.36','id-ID,id;q=0.9','http://skripsweet.tk/devices/created/50','GET','2018-10-06 15:57:13','2018-10-06 15:57:13',NULL),(3481,'Created search-devices','Registered',39,'http://skripsweet.tk/search-devices','180.245.176.97','Mozilla/5.0 (Linux; Android 8.0.0; SM-G935F Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Mobile Safari/537.36','id-ID,id;q=0.9','http://skripsweet.tk/projects/50','POST','2018-10-06 15:58:36','2018-10-06 15:58:36',NULL),(3482,'Created search-devices','Registered',39,'http://skripsweet.tk/search-devices','180.245.176.97','Mozilla/5.0 (Linux; Android 8.0.0; SM-G935F Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Mobile Safari/537.36','id-ID,id;q=0.9','http://skripsweet.tk/projects/50','POST','2018-10-06 15:58:36','2018-10-06 15:58:36',NULL),(3483,'Viewed devices/48','Registered',39,'http://skripsweet.tk/devices/48','180.245.176.97','Mozilla/5.0 (Linux; Android 8.0.0; SM-G935F Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Mobile Safari/537.36','id-ID,id;q=0.9','http://skripsweet.tk/projects/50','GET','2018-10-06 16:00:29','2018-10-06 16:00:29',NULL),(3484,'Viewed home','Registered',39,'http://skripsweet.tk/home','180.245.176.97','Mozilla/5.0 (Linux; Android 8.0.0; SM-G935F Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Mobile Safari/537.36','id-ID,id;q=0.9','http://skripsweet.tk/devices/48','GET','2018-10-06 16:01:39','2018-10-06 16:01:39',NULL),(3485,'Viewed home','Registered',39,'http://skripsweet.tk/home','180.245.176.97','Mozilla/5.0 (Linux; Android 8.0.0; SM-G935F Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Mobile Safari/537.36','id-ID,id;q=0.9','http://skripsweet.tk/home','GET','2018-10-06 16:01:55','2018-10-06 16:01:55',NULL),(3486,'Viewed home','Registered',39,'http://skripsweet.tk/home','180.245.176.97','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','id-ID,id;q=0.9',NULL,'GET','2018-10-06 16:02:09','2018-10-06 16:02:09',NULL),(3487,'Viewed account/cendikadh/edit','Registered',39,'http://skripsweet.tk/account/cendikadh/edit','180.245.176.97','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','id-ID,id;q=0.9','http://skripsweet.tk/home','GET','2018-10-06 16:02:13','2018-10-06 16:02:13',NULL),(3488,'Logged In','Registered',2,'http://skripsweet.tk/login','36.72.1.94','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/login','POST','2018-10-25 13:25:00','2018-10-25 13:25:00',NULL),(3489,'Viewed home','Registered',2,'http://skripsweet.tk/home','36.72.1.94','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/login','GET','2018-10-25 13:25:00','2018-10-25 13:25:00',NULL),(3490,'Logged Out','Registered',2,'http://skripsweet.tk/logout','36.72.1.94','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/home','POST','2018-10-25 13:25:08','2018-10-25 13:25:08',NULL),(3491,'Logged In','Registered',1,'http://skripsweet.tk/login','36.72.1.94','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/login','POST','2018-10-25 13:25:18','2018-10-25 13:25:18',NULL),(3492,'Viewed home','Registered',1,'http://skripsweet.tk/home','36.72.1.94','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/login','GET','2018-10-25 13:25:18','2018-10-25 13:25:18',NULL),(3493,'Logged Out','Registered',1,'http://skripsweet.tk/logout','36.72.1.94','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','en-US,en;q=0.9,id;q=0.8','http://skripsweet.tk/home','POST','2018-10-25 13:25:44','2018-10-25 13:25:44',NULL);
/*!40000 ALTER TABLE `laravel_logger_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_01_15_105324_create_roles_table',1),(4,'2016_01_15_114412_create_role_user_table',1),(5,'2016_01_26_115212_create_permissions_table',1),(6,'2016_01_26_115523_create_permission_role_table',1),(7,'2016_02_09_132439_create_permission_user_table',1),(8,'2016_06_01_000001_create_oauth_auth_codes_table',1),(9,'2016_06_01_000002_create_oauth_access_tokens_table',1),(10,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(11,'2016_06_01_000004_create_oauth_clients_table',1),(12,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(13,'2017_03_09_082449_create_social_logins_table',1),(14,'2017_03_09_082526_create_activations_table',1),(15,'2017_03_20_213554_create_themes_table',1),(16,'2017_03_21_042918_create_profiles_table',1),(17,'2017_11_04_103444_create_laravel_logger_activity_table',1),(18,'2017_12_09_070937_create_two_step_auth_table',1),(19,'2018_03_22_032406_create_projects_table',1),(20,'2018_03_22_033345_create_devices_table',1),(21,'2018_03_22_035556_create_statuss_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` VALUES (1,'otsavianto.r@gmail.com','$2y$10$wEtXRPwkM3uh5XRAaoApPuGpchtx1PX1BQ2gnnSdDF9.rwMuDnelq','2018-05-23 04:07:20'),(3,'hartanta06@gmail.com','$2y$10$VWWObM7pxrP1/bVZRmLfC.M0abQ3uOgqfUE7eW5CA7xG5nn.4mDuG','2018-10-06 12:43:25');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,1,1,'2018-04-05 17:12:38','2018-04-05 17:12:38'),(2,2,1,'2018-04-05 17:12:38','2018-04-05 17:12:38'),(3,3,1,'2018-04-05 17:12:38','2018-04-05 17:12:38'),(4,4,1,'2018-04-05 17:12:38','2018-04-05 17:12:38');
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_user`
--

DROP TABLE IF EXISTS `permission_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_user_permission_id_index` (`permission_id`),
  KEY `permission_user_user_id_index` (`user_id`),
  CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_user`
--

LOCK TABLES `permission_user` WRITE;
/*!40000 ALTER TABLE `permission_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'Can View Users','view.users','Can view users','Permission','2018-04-05 17:12:38','2018-04-05 17:12:38'),(2,'Can Create Users','create.users','Can create new users','Permission','2018-04-05 17:12:38','2018-04-05 17:12:38'),(3,'Can Edit Users','edit.users','Can edit users','Permission','2018-04-05 17:12:38','2018-04-05 17:12:38'),(4,'Can Delete Users','delete.users','Can delete users','Permission','2018-04-05 17:12:38','2018-04-05 17:12:38');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `theme_id` int(10) unsigned NOT NULL DEFAULT '1',
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `twitter_username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `github_username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profiles_theme_id_foreign` (`theme_id`),
  KEY `profiles_user_id_index` (`user_id`),
  CONSTRAINT `profiles_theme_id_foreign` FOREIGN KEY (`theme_id`) REFERENCES `themes` (`id`),
  CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,1,1,NULL,NULL,NULL,NULL,NULL,0,'2018-04-05 17:12:38','2018-04-05 17:12:38'),(2,2,1,NULL,NULL,NULL,NULL,NULL,0,'2018-04-05 17:12:38','2018-04-05 17:12:38'),(3,12,1,NULL,NULL,NULL,NULL,NULL,0,'2018-05-04 16:52:33','2018-05-04 16:52:33'),(4,14,1,NULL,NULL,NULL,NULL,NULL,0,'2018-05-15 03:28:32','2018-05-15 03:28:32'),(5,17,1,NULL,NULL,NULL,NULL,NULL,0,'2018-06-27 17:49:25','2018-06-27 17:49:25'),(6,18,1,NULL,NULL,NULL,NULL,NULL,0,'2018-07-05 07:12:39','2018-07-05 07:12:39'),(7,19,1,NULL,NULL,NULL,NULL,NULL,0,'2018-07-11 09:13:09','2018-07-11 09:13:09'),(8,20,1,NULL,NULL,NULL,NULL,NULL,0,'2018-07-15 05:43:56','2018-07-15 05:43:56'),(9,24,1,NULL,NULL,NULL,NULL,NULL,0,'2018-07-17 02:45:10','2018-07-17 02:45:10'),(10,25,1,NULL,NULL,NULL,NULL,NULL,0,'2018-07-18 05:47:55','2018-07-18 05:47:55'),(12,29,1,NULL,NULL,NULL,NULL,NULL,0,'2018-08-14 02:11:28','2018-08-14 02:11:28'),(13,30,1,NULL,NULL,NULL,NULL,NULL,0,'2018-09-06 10:39:32','2018-09-06 10:39:32'),(14,32,1,NULL,NULL,NULL,NULL,NULL,0,'2018-09-10 02:46:47','2018-09-10 02:46:47'),(15,31,1,NULL,NULL,NULL,NULL,NULL,0,'2018-09-10 02:46:58','2018-09-10 02:46:58'),(16,33,1,NULL,NULL,NULL,NULL,NULL,0,'2018-09-10 02:47:02','2018-09-10 02:47:02'),(17,35,1,NULL,NULL,NULL,NULL,NULL,0,'2018-09-10 02:48:04','2018-09-10 02:48:04'),(18,34,1,NULL,NULL,NULL,NULL,NULL,0,'2018-09-10 02:48:06','2018-09-10 02:48:06'),(19,36,1,NULL,NULL,NULL,NULL,NULL,0,'2018-09-10 02:49:17','2018-09-10 02:49:17'),(20,37,1,NULL,NULL,NULL,NULL,NULL,0,'2018-09-10 02:59:01','2018-09-10 02:59:01'),(21,38,1,NULL,NULL,NULL,NULL,NULL,0,'2018-09-10 03:38:27','2018-09-10 03:38:27'),(22,39,1,NULL,NULL,NULL,NULL,NULL,0,'2018-09-14 23:38:13','2018-09-14 23:38:13');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `projectname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_user_id_foreign` (`user_id`),
  CONSTRAINT `projects_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (21,'Test Device','Sensor','Campus',19,'2018-07-11 09:13:37','2018-07-11 09:13:37'),(31,'aaa','aaa','aaa',25,'2018-07-18 05:59:18','2018-07-18 05:59:18'),(33,'bbb','bbb','bbb',25,'2018-07-18 06:21:19','2018-07-18 06:21:19'),(40,'CcTC','Sensor','Telkom',30,'2018-09-06 10:41:45','2018-09-06 10:41:45'),(41,'smarthome','sensor','homee',33,'2018-09-10 02:49:27','2018-09-10 02:49:27'),(42,'Smart Home','Sensor','Home',35,'2018-09-10 02:49:29','2018-09-10 02:49:29'),(43,'Smart Test1','Sensor','Home',32,'2018-09-10 02:49:29','2018-09-10 02:49:29'),(44,'Smart Agriculture','humadity','Telkom University',34,'2018-09-10 02:49:31','2018-09-10 02:49:31'),(45,'Smart test1','sensor','office',31,'2018-09-10 02:49:53','2018-09-10 02:49:53'),(46,'smartagriculture','sensor','home',36,'2018-09-10 02:51:14','2018-09-10 02:51:14'),(48,'SmartTA','Sensor','Home',37,'2018-09-12 13:13:14','2018-09-12 13:13:14'),(49,'Smart','Sensor','Telkom',38,'2018-09-26 03:34:50','2018-09-26 03:34:50'),(50,'SmartLamp','Sensor','Home',39,'2018-10-06 15:55:32','2018-10-06 15:55:32');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_role_id_index` (`role_id`),
  KEY `role_user_user_id_index` (`user_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_user`
--

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` VALUES (1,1,1,'2018-04-05 17:12:38','2018-04-05 17:12:38'),(2,2,2,'2018-04-05 17:12:38','2018-04-05 17:12:38'),(11,2,7,'2018-04-17 03:48:58','2018-04-17 03:48:58'),(13,2,12,'2018-05-04 16:52:33','2018-05-04 16:52:33'),(16,2,14,'2018-05-15 03:28:32','2018-05-15 03:28:32'),(20,2,17,'2018-06-27 17:49:25','2018-06-27 17:49:25'),(22,2,18,'2018-07-05 07:12:39','2018-07-05 07:12:39'),(24,2,19,'2018-07-11 09:13:09','2018-07-11 09:13:09'),(28,2,21,'2018-07-15 23:23:52','2018-07-15 23:23:52'),(30,2,20,'2018-07-16 08:17:02','2018-07-16 08:17:02'),(34,2,24,'2018-07-17 02:45:10','2018-07-17 02:45:10'),(36,3,26,'2018-07-18 05:43:26','2018-07-18 05:43:26'),(42,2,29,'2018-08-14 02:11:28','2018-08-14 02:11:28'),(44,2,30,'2018-09-06 10:39:32','2018-09-06 10:39:32'),(50,2,32,'2018-09-10 02:46:47','2018-09-10 02:46:47'),(51,2,31,'2018-09-10 02:46:58','2018-09-10 02:46:58'),(52,2,33,'2018-09-10 02:47:02','2018-09-10 02:47:02'),(53,2,35,'2018-09-10 02:48:04','2018-09-10 02:48:04'),(54,2,34,'2018-09-10 02:48:06','2018-09-10 02:48:06'),(56,2,36,'2018-09-10 02:49:17','2018-09-10 02:49:17'),(58,2,37,'2018-09-10 02:59:01','2018-09-10 02:59:01'),(60,2,38,'2018-09-10 03:38:27','2018-09-10 03:38:27'),(61,1,25,'2018-09-10 04:31:46','2018-09-10 04:31:46'),(63,2,39,'2018-09-14 23:38:13','2018-09-14 23:38:13');
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin','admin','Admin Role',5,'2018-04-05 17:12:38','2018-04-05 17:12:38'),(2,'User','user','User Role',1,'2018-04-05 17:12:38','2018-04-05 17:12:38'),(3,'Unverified','unverified','Unverified Role',0,'2018-04-05 17:12:38','2018-04-05 17:12:38');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_logins`
--

DROP TABLE IF EXISTS `social_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_logins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `provider` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `social_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `social_logins_user_id_index` (`user_id`),
  CONSTRAINT `social_logins_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_logins`
--

LOCK TABLES `social_logins` WRITE;
/*!40000 ALTER TABLE `social_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nilai` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `statuss_user_id_foreign` (`user_id`),
  KEY `statuss_device_id_foreign` (`device_id`),
  CONSTRAINT `statuss_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `statuss_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=426 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (134,'100','celcius',32,19,'2018-08-13 16:18:43','2018-08-13 16:18:43'),(135,'97','celcius',32,19,'2018-08-13 16:25:15','2018-08-13 16:25:15'),(136,'98','celcius',32,19,'2018-08-13 16:25:21','2018-08-13 16:25:21'),(137,'97','celcius',32,19,'2018-08-13 16:25:27','2018-08-13 16:25:27'),(138,'97','celcius',32,19,'2018-08-13 16:25:33','2018-08-13 16:25:33'),(139,'98','celcius',32,19,'2018-08-13 16:25:40','2018-08-13 16:25:40'),(140,'98','celcius',32,19,'2018-08-13 16:25:46','2018-08-13 16:25:46'),(141,'98','celcius',32,19,'2018-08-13 16:25:52','2018-08-13 16:25:52'),(142,'98','celcius',32,19,'2018-08-13 16:26:00','2018-08-13 16:26:00'),(143,'98','celcius',32,19,'2018-08-13 16:26:06','2018-08-13 16:26:06'),(144,'97','celcius',32,19,'2018-08-13 16:26:12','2018-08-13 16:26:12'),(145,'98','celcius',32,19,'2018-08-13 16:26:18','2018-08-13 16:26:18'),(146,'97','celcius',32,19,'2018-08-13 16:26:25','2018-08-13 16:26:25'),(147,'98','celcius',32,19,'2018-08-13 16:26:31','2018-08-13 16:26:31'),(148,'98','celcius',32,19,'2018-08-13 16:26:37','2018-08-13 16:26:37'),(149,'98','celcius',32,19,'2018-08-13 16:26:43','2018-08-13 16:26:43'),(150,'97','celcius',32,19,'2018-08-13 16:26:49','2018-08-13 16:26:49'),(151,'98','celcius',32,19,'2018-08-13 16:26:55','2018-08-13 16:26:55'),(152,'97','celcius',32,19,'2018-08-13 16:27:01','2018-08-13 16:27:01'),(153,'98','celcius',32,19,'2018-08-13 16:27:07','2018-08-13 16:27:07'),(154,'97','celcius',32,19,'2018-08-13 16:27:13','2018-08-13 16:27:13'),(155,'98','celcius',32,19,'2018-08-13 16:27:19','2018-08-13 16:27:19'),(156,'98','celcius',32,19,'2018-08-13 16:27:27','2018-08-13 16:27:27'),(157,'97','celcius',32,19,'2018-08-13 16:27:33','2018-08-13 16:27:33'),(158,'98','celcius',32,19,'2018-08-13 16:27:39','2018-08-13 16:27:39'),(159,'97','celcius',32,19,'2018-08-13 16:27:45','2018-08-13 16:27:45'),(160,'97','celcius',32,19,'2018-08-13 16:27:51','2018-08-13 16:27:51'),(161,'98','celcius',32,19,'2018-08-13 16:27:57','2018-08-13 16:27:57'),(162,'98','celcius',32,19,'2018-08-13 16:28:06','2018-08-13 16:28:06'),(163,'98','celcius',32,19,'2018-08-13 16:28:12','2018-08-13 16:28:12'),(164,'98','celcius',32,19,'2018-08-13 16:28:18','2018-08-13 16:28:18'),(165,'97','celcius',32,19,'2018-08-13 16:28:24','2018-08-13 16:28:24'),(166,'98','celcius',32,19,'2018-08-13 16:28:31','2018-08-13 16:28:31'),(167,'97','celcius',32,19,'2018-08-13 16:28:37','2018-08-13 16:28:37'),(168,'98','celcius',32,19,'2018-08-13 16:28:43','2018-08-13 16:28:43'),(169,'97','celcius',32,19,'2018-08-13 16:28:49','2018-08-13 16:28:49'),(170,'98','celcius',32,19,'2018-08-13 16:28:55','2018-08-13 16:28:55'),(171,'98','celcius',32,19,'2018-08-13 16:29:01','2018-08-13 16:29:01'),(172,'98','celcius',32,19,'2018-08-13 16:29:07','2018-08-13 16:29:07'),(173,'97','celcius',32,19,'2018-08-13 16:29:13','2018-08-13 16:29:13'),(174,'98','celcius',32,19,'2018-08-13 16:29:19','2018-08-13 16:29:19'),(175,'97','celcius',32,19,'2018-08-13 16:29:25','2018-08-13 16:29:25'),(176,'97','celcius',32,19,'2018-08-13 16:29:32','2018-08-13 16:29:32'),(177,'97','celcius',32,19,'2018-08-13 16:29:38','2018-08-13 16:29:38'),(178,'97','celcius',32,19,'2018-08-13 16:29:44','2018-08-13 16:29:44'),(179,'97','celcius',32,19,'2018-08-13 16:29:50','2018-08-13 16:29:50'),(180,'97','celcius',32,19,'2018-08-13 16:29:56','2018-08-13 16:29:56'),(181,'97','celcius',32,19,'2018-08-13 16:30:02','2018-08-13 16:30:02'),(182,'98','celcius',32,19,'2018-08-13 16:30:08','2018-08-13 16:30:08'),(183,'97','celcius',32,19,'2018-08-13 16:30:15','2018-08-13 16:30:15'),(184,'98','celcius',32,19,'2018-08-13 16:30:21','2018-08-13 16:30:21'),(185,'88','celcius',32,19,'2018-08-14 01:22:09','2018-08-14 01:22:09'),(186,'88','celcius',32,19,'2018-08-14 01:22:15','2018-08-14 01:22:15'),(187,'88','celcius',32,19,'2018-08-14 01:22:22','2018-08-14 01:22:22'),(188,'88','celcius',32,19,'2018-08-14 01:22:28','2018-08-14 01:22:28'),(189,'88','celcius',32,19,'2018-08-14 01:22:34','2018-08-14 01:22:34'),(190,'88','celcius',32,19,'2018-08-14 01:22:40','2018-08-14 01:22:40'),(191,'88','celcius',32,19,'2018-08-14 01:22:47','2018-08-14 01:22:47'),(192,'88','celcius',32,19,'2018-08-14 01:22:53','2018-08-14 01:22:53'),(193,'88','celcius',32,19,'2018-08-14 01:22:59','2018-08-14 01:22:59'),(194,'88','celcius',32,19,'2018-08-14 01:23:05','2018-08-14 01:23:05'),(195,'88','celcius',32,19,'2018-08-14 01:23:11','2018-08-14 01:23:11'),(196,'88','celcius',32,19,'2018-08-14 01:23:17','2018-08-14 01:23:17'),(197,'88','celcius',32,19,'2018-08-14 01:23:24','2018-08-14 01:23:24'),(198,'88','celcius',32,19,'2018-08-14 01:23:30','2018-08-14 01:23:30'),(199,'88','celcius',32,19,'2018-08-14 01:23:36','2018-08-14 01:23:36'),(200,'88','celcius',32,19,'2018-08-14 01:23:42','2018-08-14 01:23:42'),(201,'88','celcius',32,19,'2018-08-14 01:23:49','2018-08-14 01:23:49'),(202,'88','celcius',32,19,'2018-08-14 01:23:55','2018-08-14 01:23:55'),(203,'88','celcius',32,19,'2018-08-14 01:24:01','2018-08-14 01:24:01'),(204,'88','celcius',32,19,'2018-08-14 01:24:07','2018-08-14 01:24:07'),(205,'88','celcius',32,19,'2018-08-14 01:24:14','2018-08-14 01:24:14'),(208,'100','10',32,19,'2018-09-09 13:28:43','2018-09-09 13:28:43'),(209,'0','celcius',32,19,'2018-09-09 13:46:41','2018-09-09 13:46:41'),(210,'0','celcius',32,19,'2018-09-09 13:46:48','2018-09-09 13:46:48'),(211,'0','celcius',32,19,'2018-09-09 13:46:56','2018-09-09 13:46:56'),(212,'0','celcius',32,19,'2018-09-09 13:47:05','2018-09-09 13:47:05'),(213,'0','celcius',32,19,'2018-09-09 13:47:11','2018-09-09 13:47:11'),(214,'0','celcius',32,19,'2018-09-09 13:47:17','2018-09-09 13:47:17'),(215,'0','celcius',32,19,'2018-09-09 13:47:23','2018-09-09 13:47:23'),(216,'0','celcius',32,19,'2018-09-09 13:47:29','2018-09-09 13:47:29'),(217,'0','celcius',32,19,'2018-09-09 13:47:38','2018-09-09 13:47:38'),(218,'0','celcius',32,19,'2018-09-09 13:47:44','2018-09-09 13:47:44'),(219,'0','celcius',32,19,'2018-09-09 13:47:50','2018-09-09 13:47:50'),(220,'0','celcius',32,19,'2018-09-09 13:47:57','2018-09-09 13:47:57'),(221,'0','celcius',32,19,'2018-09-09 13:48:04','2018-09-09 13:48:04'),(222,'0','celcius',32,19,'2018-09-09 13:48:10','2018-09-09 13:48:10'),(223,'0','celcius',32,19,'2018-09-09 13:48:19','2018-09-09 13:48:19'),(224,'0','celcius',32,19,'2018-09-09 13:48:25','2018-09-09 13:48:25'),(225,'0','celcius',32,19,'2018-09-09 13:48:31','2018-09-09 13:48:31'),(226,'0','celcius',32,19,'2018-09-09 13:48:37','2018-09-09 13:48:37'),(227,'0','celcius',32,19,'2018-09-09 13:48:52','2018-09-09 13:48:52'),(228,'0','celcius',32,19,'2018-09-09 13:48:54','2018-09-09 13:48:54'),(229,'0','celcius',32,19,'2018-09-09 13:49:00','2018-09-09 13:49:00'),(230,'0','celcius',32,19,'2018-09-09 13:49:06','2018-09-09 13:49:06'),(231,'0','celcius',32,19,'2018-09-09 13:49:12','2018-09-09 13:49:12'),(232,'0','celcius',32,19,'2018-09-09 13:49:19','2018-09-09 13:49:19'),(233,'0','celcius',32,19,'2018-09-09 13:49:25','2018-09-09 13:49:25'),(234,'0','celcius',32,19,'2018-09-09 13:49:31','2018-09-09 13:49:31'),(235,'0','celcius',32,19,'2018-09-09 13:49:37','2018-09-09 13:49:37'),(236,'0','celcius',32,19,'2018-09-09 13:49:43','2018-09-09 13:49:43'),(237,'0','celcius',32,19,'2018-09-09 13:49:49','2018-09-09 13:49:49'),(238,'0','celcius',32,19,'2018-09-09 13:49:55','2018-09-09 13:49:55'),(239,'0','celcius',32,19,'2018-09-09 13:50:01','2018-09-09 13:50:01'),(240,'0','celcius',32,19,'2018-09-09 13:50:07','2018-09-09 13:50:07'),(241,'0','celcius',32,19,'2018-09-09 13:50:14','2018-09-09 13:50:14'),(242,'0','celcius',32,19,'2018-09-09 13:50:20','2018-09-09 13:50:20'),(243,'0','celcius',32,19,'2018-09-09 13:50:26','2018-09-09 13:50:26'),(244,'0','celcius',32,19,'2018-09-09 13:50:32','2018-09-09 13:50:32'),(245,'0','celcius',32,19,'2018-09-09 13:50:38','2018-09-09 13:50:38'),(246,'0','celcius',32,19,'2018-09-09 13:50:44','2018-09-09 13:50:44'),(247,'0','celcius',32,19,'2018-09-09 13:50:50','2018-09-09 13:50:50'),(248,'0','celcius',32,19,'2018-09-09 13:50:56','2018-09-09 13:50:56'),(249,'0','celcius',32,19,'2018-09-09 13:51:03','2018-09-09 13:51:03'),(250,'0','celcius',32,19,'2018-09-09 13:51:09','2018-09-09 13:51:09'),(251,'0','celcius',32,19,'2018-09-09 13:51:15','2018-09-09 13:51:15'),(252,'0','celcius',32,19,'2018-09-09 13:51:21','2018-09-09 13:51:21'),(253,'0','celcius',32,19,'2018-09-09 13:51:27','2018-09-09 13:51:27'),(254,'0','celcius',32,19,'2018-09-09 13:51:33','2018-09-09 13:51:33'),(255,'0','celcius',32,19,'2018-09-09 13:51:39','2018-09-09 13:51:39'),(256,'0','celcius',32,19,'2018-09-09 13:51:45','2018-09-09 13:51:45'),(257,'0','celcius',32,19,'2018-09-09 13:51:52','2018-09-09 13:51:52'),(258,'0','celcius',32,19,'2018-09-09 13:51:58','2018-09-09 13:51:58'),(259,'0','celcius',32,19,'2018-09-09 13:52:04','2018-09-09 13:52:04'),(260,'0','celcius',32,19,'2018-09-09 13:52:13','2018-09-09 13:52:13'),(261,'0','celcius',32,19,'2018-09-09 13:52:19','2018-09-09 13:52:19'),(262,'0','celcius',32,19,'2018-09-09 13:52:25','2018-09-09 13:52:25'),(263,'0','celcius',32,19,'2018-09-09 13:52:31','2018-09-09 13:52:31'),(264,'0','celcius',32,19,'2018-09-09 13:52:38','2018-09-09 13:52:38'),(265,'0','celcius',32,19,'2018-09-09 13:52:44','2018-09-09 13:52:44'),(266,'0','celcius',32,19,'2018-09-09 13:53:01','2018-09-09 13:53:01'),(267,'0','celcius',32,19,'2018-09-09 13:53:07','2018-09-09 13:53:07'),(268,'0','celcius',32,19,'2018-09-09 13:53:14','2018-09-09 13:53:14'),(269,'0','celcius',32,19,'2018-09-09 13:53:20','2018-09-09 13:53:20'),(270,'0','celcius',32,19,'2018-09-09 13:53:37','2018-09-09 13:53:37'),(271,'0','celcius',32,19,'2018-09-09 13:54:21','2018-09-09 13:54:21'),(272,'0','celcius',32,19,'2018-09-09 13:54:27','2018-09-09 13:54:27'),(273,'0','celcius',32,19,'2018-09-09 13:54:44','2018-09-09 13:54:44'),(274,'0','celcius',32,19,'2018-09-09 13:54:50','2018-09-09 13:54:50'),(275,'0','celcius',32,19,'2018-09-09 13:54:56','2018-09-09 13:54:56'),(276,'0','celcius',32,19,'2018-09-09 13:55:03','2018-09-09 13:55:03'),(277,'0','celcius',32,19,'2018-09-09 13:55:09','2018-09-09 13:55:09'),(278,'0','celcius',32,19,'2018-09-09 13:55:15','2018-09-09 13:55:15'),(279,'0','celcius',32,19,'2018-09-09 13:55:24','2018-09-09 13:55:24'),(280,'0','celcius',32,19,'2018-09-09 13:55:30','2018-09-09 13:55:30'),(281,'0','celcius',32,19,'2018-09-09 13:55:37','2018-09-09 13:55:37'),(282,'0','celcius',32,19,'2018-09-09 13:55:43','2018-09-09 13:55:43'),(283,'0','celcius',32,19,'2018-09-09 13:55:49','2018-09-09 13:55:49'),(284,'0','celcius',32,19,'2018-09-09 13:55:55','2018-09-09 13:55:55'),(285,'0','celcius',32,19,'2018-09-09 13:56:01','2018-09-09 13:56:01'),(286,'0','celcius',32,19,'2018-09-09 13:56:07','2018-09-09 13:56:07'),(287,'0','celcius',32,19,'2018-09-09 13:56:16','2018-09-09 13:56:16'),(288,'0','celcius',32,19,'2018-09-09 13:56:22','2018-09-09 13:56:22'),(289,'0','celcius',32,19,'2018-09-09 13:56:28','2018-09-09 13:56:28'),(290,'0','celcius',32,19,'2018-09-09 13:56:37','2018-09-09 13:56:37'),(291,'0','celcius',32,19,'2018-09-09 13:56:43','2018-09-09 13:56:43'),(292,'0','celcius',32,19,'2018-09-09 13:56:49','2018-09-09 13:56:49'),(293,'0','celcius',32,19,'2018-09-09 13:56:55','2018-09-09 13:56:55'),(294,'0','celcius',32,19,'2018-09-09 13:57:02','2018-09-09 13:57:02'),(295,'0','celcius',32,19,'2018-09-09 13:57:10','2018-09-09 13:57:10'),(296,'0','celcius',32,19,'2018-09-09 13:57:16','2018-09-09 13:57:16'),(297,'0','celcius',32,19,'2018-09-09 13:57:22','2018-09-09 13:57:22'),(298,'0','celcius',32,19,'2018-09-09 13:57:28','2018-09-09 13:57:28'),(299,'0','celcius',32,19,'2018-09-09 13:57:35','2018-09-09 13:57:35'),(300,'0','celcius',32,19,'2018-09-09 13:57:41','2018-09-09 13:57:41'),(301,'0','celcius',32,19,'2018-09-09 13:57:47','2018-09-09 13:57:47'),(302,'0','celcius',32,19,'2018-09-09 13:57:53','2018-09-09 13:57:53'),(303,'0','celcius',32,19,'2018-09-09 13:57:59','2018-09-09 13:57:59'),(304,'0','celcius',32,19,'2018-09-09 13:58:06','2018-09-09 13:58:06'),(305,'0','celcius',32,19,'2018-09-09 13:58:12','2018-09-09 13:58:12'),(306,'0','celcius',32,19,'2018-09-09 13:58:18','2018-09-09 13:58:18'),(307,'0','celcius',32,19,'2018-09-09 13:58:24','2018-09-09 13:58:24'),(308,'0','celcius',32,19,'2018-09-09 13:58:30','2018-09-09 13:58:30'),(309,'0','celcius',32,19,'2018-09-09 13:58:37','2018-09-09 13:58:37'),(310,'0','celcius',32,19,'2018-09-09 13:58:43','2018-09-09 13:58:43'),(311,'0','celcius',32,19,'2018-09-09 13:58:49','2018-09-09 13:58:49'),(312,'0','celcius',32,19,'2018-09-09 13:58:55','2018-09-09 13:58:55'),(313,'100','celcius',32,19,'2018-09-09 13:59:42','2018-09-09 13:59:42'),(314,'100','celcius',32,19,'2018-09-09 13:59:52','2018-09-09 13:59:52'),(315,'100','celcius',32,19,'2018-09-09 13:59:58','2018-09-09 13:59:58'),(316,'100','celcius',32,19,'2018-09-09 14:00:07','2018-09-09 14:00:07'),(317,'100','celcius',32,19,'2018-09-09 14:00:15','2018-09-09 14:00:15'),(318,'100','celcius',32,19,'2018-09-09 14:00:21','2018-09-09 14:00:21'),(319,'100','celcius',32,19,'2018-09-09 14:00:27','2018-09-09 14:00:27'),(320,'100','celcius',32,19,'2018-09-09 14:00:35','2018-09-09 14:00:35'),(321,'100','celcius',32,19,'2018-09-09 14:00:41','2018-09-09 14:00:41'),(322,'100','celcius',32,19,'2018-09-09 14:00:47','2018-09-09 14:00:47'),(323,'100','celcius',32,19,'2018-09-09 14:01:29','2018-09-09 14:01:29'),(324,'100','celcius',32,19,'2018-09-09 14:01:39','2018-09-09 14:01:39'),(325,'100','celcius',32,19,'2018-09-09 14:01:45','2018-09-09 14:01:45'),(326,'100','celcius',32,19,'2018-09-09 14:01:51','2018-09-09 14:01:51'),(327,'99','celcius',32,19,'2018-09-09 14:02:00','2018-09-09 14:02:00'),(328,'99','celcius',32,19,'2018-09-09 14:02:05','2018-09-09 14:02:05'),(329,'100','celcius',32,19,'2018-09-09 14:02:11','2018-09-09 14:02:11'),(330,'100','celcius',32,19,'2018-09-09 14:02:22','2018-09-09 14:02:22'),(331,'100','celcius',32,19,'2018-09-09 14:02:27','2018-09-09 14:02:27'),(332,'99','celcius',32,19,'2018-09-09 14:02:33','2018-09-09 14:02:33'),(333,'100','celcius',32,19,'2018-09-09 14:02:39','2018-09-09 14:02:39'),(334,'99','celcius',32,19,'2018-09-09 14:02:45','2018-09-09 14:02:45'),(335,'100','celcius',32,19,'2018-09-09 14:02:51','2018-09-09 14:02:51'),(336,'100','celcius',32,19,'2018-09-09 14:02:57','2018-09-09 14:02:57'),(337,'99','celcius',32,19,'2018-09-09 14:03:03','2018-09-09 14:03:03'),(338,'100','celcius',32,19,'2018-09-09 14:03:09','2018-09-09 14:03:09'),(339,'99','celcius',32,19,'2018-09-09 14:03:15','2018-09-09 14:03:15'),(340,'99','celcius',32,19,'2018-09-09 14:03:21','2018-09-09 14:03:21'),(341,'99','celcius',32,19,'2018-09-09 14:03:26','2018-09-09 14:03:26'),(342,'100','celcius',32,19,'2018-09-09 14:03:32','2018-09-09 14:03:32'),(343,'100','celcius',32,19,'2018-09-09 14:03:38','2018-09-09 14:03:38'),(344,'100','celcius',32,19,'2018-09-09 14:03:43','2018-09-09 14:03:43'),(345,'100','celcius',32,19,'2018-09-09 14:03:49','2018-09-09 14:03:49'),(346,'99','celcius',32,19,'2018-09-09 14:03:55','2018-09-09 14:03:55'),(347,'99','celcius',32,19,'2018-09-09 14:04:04','2018-09-09 14:04:04'),(348,'100','celcius',32,19,'2018-09-09 14:04:09','2018-09-09 14:04:09'),(349,'100','celcius',32,19,'2018-09-09 14:04:15','2018-09-09 14:04:15'),(350,'99','celcius',32,19,'2018-09-09 14:04:21','2018-09-09 14:04:21'),(351,'99','celcius',32,19,'2018-09-09 14:04:29','2018-09-09 14:04:29'),(352,'99','celcius',32,19,'2018-09-09 14:04:35','2018-09-09 14:04:35'),(353,'99','celcius',32,19,'2018-09-09 14:04:40','2018-09-09 14:04:40'),(354,'100','celcius',32,19,'2018-09-09 14:04:46','2018-09-09 14:04:46'),(355,'100','celcius',32,19,'2018-09-09 14:04:52','2018-09-09 14:04:52'),(356,'100','celcius',32,19,'2018-09-09 14:04:57','2018-09-09 14:04:57'),(357,'100','celcius',32,19,'2018-09-09 14:05:03','2018-09-09 14:05:03'),(358,'99','celcius',32,19,'2018-09-09 14:05:09','2018-09-09 14:05:09'),(359,'99','celcius',32,19,'2018-09-09 14:05:15','2018-09-09 14:05:15'),(360,'99','celcius',32,19,'2018-09-09 14:05:20','2018-09-09 14:05:20'),(361,'99','celcius',32,19,'2018-09-09 14:05:26','2018-09-09 14:05:26'),(362,'99','celcius',32,19,'2018-09-09 14:05:32','2018-09-09 14:05:32'),(363,'99','celcius',32,19,'2018-09-09 14:05:37','2018-09-09 14:05:37'),(364,'99','celcius',32,19,'2018-09-09 14:05:43','2018-09-09 14:05:43'),(365,'99','celcius',32,19,'2018-09-09 14:05:49','2018-09-09 14:05:49'),(366,'99','celcius',32,19,'2018-09-09 14:05:54','2018-09-09 14:05:54'),(367,'100','celcius',32,19,'2018-09-09 14:06:00','2018-09-09 14:06:00'),(368,'99','celcius',32,19,'2018-09-09 14:06:06','2018-09-09 14:06:06'),(369,'99','celcius',32,19,'2018-09-09 14:06:15','2018-09-09 14:06:15'),(370,'100','celcius',32,19,'2018-09-09 14:06:20','2018-09-09 14:06:20'),(371,'100','celcius',32,19,'2018-09-09 14:06:26','2018-09-09 14:06:26'),(372,'100','celcius',32,19,'2018-09-09 14:06:32','2018-09-09 14:06:32'),(373,'100','celcius',32,19,'2018-09-09 14:06:37','2018-09-09 14:06:37'),(374,'100','celcius',32,19,'2018-09-09 14:06:48','2018-09-09 14:06:48'),(375,'100','celcius',32,19,'2018-09-09 14:06:59','2018-09-09 14:06:59'),(376,'100','celcius',32,19,'2018-09-09 14:07:04','2018-09-09 14:07:04'),(377,'100','celcius',32,19,'2018-09-09 14:07:10','2018-09-09 14:07:10'),(378,'100','celcius',32,19,'2018-09-09 14:07:16','2018-09-09 14:07:16'),(379,'100','celcius',32,19,'2018-09-09 14:07:27','2018-09-09 14:07:27'),(380,'100','celcius',32,19,'2018-09-09 14:07:32','2018-09-09 14:07:32'),(381,'100','celcius',32,19,'2018-09-09 14:07:38','2018-09-09 14:07:38'),(382,'100','celcius',32,19,'2018-09-09 14:07:44','2018-09-09 14:07:44'),(383,'99','celcius',32,19,'2018-09-09 14:07:50','2018-09-09 14:07:50'),(384,'100','celcius',32,19,'2018-09-09 14:07:55','2018-09-09 14:07:55'),(385,'100','celcius',32,19,'2018-09-09 14:08:01','2018-09-09 14:08:01'),(386,'100','celcius',32,19,'2018-09-09 14:08:10','2018-09-09 14:08:10'),(387,'100','celcius',32,19,'2018-09-09 14:08:16','2018-09-09 14:08:16'),(388,'100','celcius',32,19,'2018-09-09 14:08:22','2018-09-09 14:08:22'),(389,'100','celcius',32,19,'2018-09-09 14:08:27','2018-09-09 14:08:27'),(390,'100','celcius',32,19,'2018-09-09 14:08:33','2018-09-09 14:08:33'),(391,'100','celcius',32,19,'2018-09-09 14:08:39','2018-09-09 14:08:39'),(392,'100','celcius',32,19,'2018-09-09 14:08:45','2018-09-09 14:08:45'),(393,'100','celcius',32,19,'2018-09-09 14:08:50','2018-09-09 14:08:50'),(394,'100','celcius',32,19,'2018-09-09 14:09:38','2018-09-09 14:09:38'),(395,'100','celcius',32,19,'2018-09-09 14:09:48','2018-09-09 14:09:48'),(396,'100','celcius',32,19,'2018-09-09 14:09:57','2018-09-09 14:09:57'),(397,'100','celcius',32,19,'2018-09-09 14:10:03','2018-09-09 14:10:03'),(398,'100','celcius',32,19,'2018-09-09 14:10:26','2018-09-09 14:10:26'),(399,'100','celcius',32,19,'2018-09-09 14:10:32','2018-09-09 14:10:32'),(400,'100','celcius',32,19,'2018-09-09 14:10:43','2018-09-09 14:10:43'),(401,'100','celcius',32,19,'2018-09-09 14:10:49','2018-09-09 14:10:49'),(402,'100','celcius',32,19,'2018-09-09 14:10:57','2018-09-09 14:10:57'),(403,'100','celcius',32,19,'2018-09-09 14:11:02','2018-09-09 14:11:02'),(404,'99','celcius',32,19,'2018-09-09 14:11:08','2018-09-09 14:11:08'),(405,'99','celcius',32,19,'2018-09-09 14:11:17','2018-09-09 14:11:17'),(406,'99','celcius',32,19,'2018-09-09 14:11:25','2018-09-09 14:11:25'),(407,'99','celcius',32,19,'2018-09-09 14:11:31','2018-09-09 14:11:31'),(408,'100','celcius',32,19,'2018-09-09 14:11:37','2018-09-09 14:11:37'),(409,'100','celcius',32,19,'2018-09-09 14:11:42','2018-09-09 14:11:42'),(410,'100','celcius',32,19,'2018-09-09 14:11:48','2018-09-09 14:11:48'),(411,'100','celcius',32,19,'2018-09-09 14:11:54','2018-09-09 14:11:54'),(412,'100','celcius',32,19,'2018-09-09 14:11:59','2018-09-09 14:11:59'),(413,'99','celcius',32,19,'2018-09-09 14:12:05','2018-09-09 14:12:05'),(414,'100','celcius',32,19,'2018-09-09 14:12:11','2018-09-09 14:12:11'),(415,'100','celcius',32,19,'2018-09-09 14:12:17','2018-09-09 14:12:17'),(417,'11','level',29,2,'2018-09-09 16:07:08','2018-09-09 16:07:08'),(423,'11','level',29,2,'2018-09-09 16:49:49','2018-09-09 16:49:49'),(424,'11','level',29,25,'2018-09-09 17:05:59','2018-09-09 17:05:59'),(425,'12','level',28,25,'2018-09-09 17:09:16','2018-09-09 17:09:16');
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `themes`
--

DROP TABLE IF EXISTS `themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `themes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `taggable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taggable_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `themes_name_unique` (`name`),
  UNIQUE KEY `themes_link_unique` (`link`),
  KEY `themes_taggable_type_taggable_id_index` (`taggable_type`,`taggable_id`),
  KEY `themes_id_index` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `themes`
--

LOCK TABLES `themes` WRITE;
/*!40000 ALTER TABLE `themes` DISABLE KEYS */;
INSERT INTO `themes` VALUES (1,'Default','null',NULL,1,'theme',1,'2018-04-05 17:12:38','2018-04-05 17:12:38',NULL),(2,'Darkly','https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/darkly/bootstrap.min.css',NULL,1,'theme',2,'2018-04-05 17:12:38','2018-04-05 17:12:38',NULL),(3,'Cyborg','https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/cyborg/bootstrap.min.css',NULL,1,'theme',3,'2018-04-05 17:12:38','2018-04-05 17:12:38',NULL),(4,'Cosmo','https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/cosmo/bootstrap.min.css',NULL,1,'theme',4,'2018-04-05 17:12:38','2018-04-05 17:12:38',NULL),(5,'Cerulean','https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/cerulean/bootstrap.min.css',NULL,1,'theme',5,'2018-04-05 17:12:38','2018-04-05 17:12:38',NULL),(6,'Flatly','https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/flatly/bootstrap.min.css',NULL,1,'theme',6,'2018-04-05 17:12:38','2018-04-05 17:12:38',NULL),(7,'Journal','https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/journal/bootstrap.min.css',NULL,1,'theme',7,'2018-04-05 17:12:38','2018-04-05 17:12:38',NULL),(8,'Lumen','https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/lumen/bootstrap.min.css',NULL,1,'theme',8,'2018-04-05 17:12:38','2018-04-05 17:12:38',NULL),(9,'Paper','https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/paper/bootstrap.min.css',NULL,1,'theme',9,'2018-04-05 17:12:38','2018-04-05 17:12:38',NULL),(10,'Readable','https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/readable/bootstrap.min.css',NULL,1,'theme',10,'2018-04-05 17:12:38','2018-04-05 17:12:38',NULL),(11,'Sandstone','https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/sandstone/bootstrap.min.css',NULL,1,'theme',11,'2018-04-05 17:12:38','2018-04-05 17:12:38',NULL),(12,'Simplex','https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/simplex/bootstrap.min.css',NULL,1,'theme',12,'2018-04-05 17:12:38','2018-04-05 17:12:38',NULL),(13,'Slate','https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/slate/bootstrap.min.css',NULL,1,'theme',13,'2018-04-05 17:12:38','2018-04-05 17:12:38',NULL),(14,'Spacelab','https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/spacelab/bootstrap.min.css',NULL,1,'theme',14,'2018-04-05 17:12:38','2018-04-05 17:12:38',NULL),(15,'Superhero','https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/superhero/bootstrap.min.css',NULL,1,'theme',15,'2018-04-05 17:12:38','2018-04-05 17:12:38',NULL),(16,'United','https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/united/bootstrap.min.css',NULL,1,'theme',16,'2018-04-05 17:12:38','2018-04-05 17:12:38',NULL),(17,'Yeti','https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/yeti/bootstrap.min.css',NULL,1,'theme',17,'2018-04-05 17:12:38','2018-04-05 17:12:38',NULL),(18,'Bootstrap 4.0.0 Alpha','https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css',NULL,1,'theme',18,'2018-04-05 17:12:38','2018-04-05 17:12:38',NULL),(19,'Materialize','https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css',NULL,1,'theme',19,'2018-04-05 17:12:38','2018-04-05 17:12:38',NULL),(20,'Bootstrap Material Design 0.3.0','https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.3.0/css/material-fullpalette.min.css',NULL,1,'theme',20,'2018-04-05 17:12:38','2018-04-05 17:12:38',NULL),(21,'Bootstrap Material Design 0.5.10','https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/css/bootstrap-material-design.min.css',NULL,1,'theme',21,'2018-04-05 17:12:38','2018-04-05 17:12:38',NULL),(22,'Bootstrap Material Design 4.0.0','https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/4.0.0/bootstrap-material-design.min.css',NULL,1,'theme',22,'2018-04-05 17:12:38','2018-04-05 17:12:38',NULL),(23,'Bootstrap Material Design 4.0.2','https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/4.0.2/bootstrap-material-design.min.css',NULL,1,'theme',23,'2018-04-05 17:12:38','2018-04-05 17:12:38',NULL),(24,'mdbootstrap','https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.3.1/css/mdb.min.css',NULL,1,'theme',24,'2018-04-05 17:12:38','2018-04-05 17:12:38',NULL),(25,'bootflat','https://cdnjs.cloudflare.com/ajax/libs/bootflat/2.0.4/css/bootflat.min.css',NULL,1,'theme',25,'2018-04-05 17:12:38','2018-04-05 17:12:38',NULL),(26,'flat-ui','https://cdnjs.cloudflare.com/ajax/libs/flat-ui/2.3.0/css/flat-ui.min.css',NULL,1,'theme',26,'2018-04-05 17:12:38','2018-04-05 17:12:38',NULL),(27,'m8tro-bootstrap','https://cdnjs.cloudflare.com/ajax/libs/m8tro-bootstrap/3.3.7/m8tro.min.css',NULL,1,'theme',27,'2018-04-05 17:12:38','2018-04-05 17:12:38',NULL);
/*!40000 ALTER TABLE `themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `signup_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signup_confirmation_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signup_sm_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_name_unique` (`name`),
  UNIQUE KEY `users_api_token_unique` (`api_token`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'clay123','Marguerite','Ebert','admin@admin.com','$2y$10$hwTlHrtSx/7zumGgVYzCM.4ZskshlKrP3tyTa.4PiJ7l2kc6SFhvG','aE6nmeRhLKcSGU2hf3qFsKovvYWv6r9gl6bUKcUyFgNLChBs2kJBXfKuWZHv',1,'1ncl0VwvWGG1iGL1K942ESeaYCqqYGmnvVuN9bK5vJbJcFRtN04tp3jki504ADn5',NULL,'236.125.27.227',NULL,'214.171.194.172','180.253.106.100',NULL,'Xq9mMz5XTEGHW7xOxf0lOlOEstBmZ5Thn1t3n4c9IZ3oTomnvmRSrQPOdDg5oJT2','2018-04-05 17:12:38','2018-04-25 01:16:41',NULL),(2,'blake.boehm','Moserrat','Doyle','user@user.com','$2y$10$LtGAn5jcj1s7zLUb0PdZl.751kAOpi/txi00uU7HkL3gUTkX5Xb7.','8WFRVSGhw9Jc4o0jo2HbkztfxpBsOePucInX5fxVkripFcrEeJjstGPleXUP',1,'eBKZvN1qlrDsqjhkazks61rBvG3PWWt9xbMGdulx369Zpy815TtAJJhQF3DOUHAJ','96.74.154.231','169.4.34.245',NULL,NULL,'36.71.233.165',NULL,'CsWrMbVYipAQUVrGyP7WyBoM4PthGgCZ0sMPAYLf786wO0bgqY4uVCcK8GwZ2VrY','2018-04-05 17:12:38','2018-06-25 07:20:42',NULL),(19,'testsensor','Test','Sensor','dummya795@gmail.com','$2y$10$88jkeoE/zT5tEP6bLAJb7ORbTIO9OafA9vS9FGcInYIAHjIPGahI.','qQH28o8xWzvLe39ffHvUL7vqm1KpDDgnhKGMSC4lyfUm3p1NDjmBUSUTv7Yq',1,'VpKPMWDC7R9wkIeifr3xIqsnDRd6agPqo0XZBFdCJVCGF85pvbX24xioFaLzKhpt','103.233.100.250','103.233.100.250',NULL,NULL,NULL,NULL,'3VCzCFDy6sLwhJTnCGgkZq0SUX1XXB94vhYM2lrHvqq0eJemIoIZZoE60io6vC4e','2018-07-11 09:12:40','2018-07-11 09:13:09',NULL),(25,'imamzidar','imam','zid','imamzidar@gmail.com','$2y$10$f/0VL4plWqTZyE7bpiY4ueUAV9kE93gzFxbEtbB.NpeQcLUxpkCMa','FiZamuQTPoNgy3fUS1PGCEyDhLJF1jogziYn8FaTKehG1fgAe9kZJhNqo2WU',1,'xrU0S9P0CrIzqK19yKtYA8ywE2CDv2XYccWSpVwZlbbVSScWWFwr1VPnSAWuxGZ3','114.124.203.22','114.124.234.135',NULL,NULL,'114.124.199.251',NULL,'iwPrdp5h3R82ebGLEZsmtodHMC5kwrMXfB9bW5j2bYmtu0yKcxfHwTE8ew0PGjSb','2018-07-18 05:38:43','2018-09-10 04:31:46',NULL),(26,'iamzidar','iam','zid','iamzidar@gmail.com','$2y$10$ybS3UaZ83l.dUxicprukTeIqy8qORCikCpCMzjD3Kj5BqxBt.Dt3C','fJE4GZG3U1QNvF3U5mBDUfOEbkD26uFOOVC9kvFJeVFMhjnLJkW7FDRhYOtt',0,'0QWBd9jIooxlSTMfOAc0HfE1vvyWygdi1wXfnMBXbDNoUFS4ZtUzEJwgQglqORPR','114.124.234.135',NULL,NULL,NULL,NULL,NULL,'U7kfxpSX3dSclqsCvZqkkD0dehC5KzVu8fRtD5SGXflB6DOOTgljYCyz2a27Vi6r','2018-07-18 05:43:26','2018-07-18 05:43:26',NULL),(29,'otsavianto','otsavianto','rukmananda','otsaviantorukmananda@student.telkomuniversity.ac.id','$2y$10$isnOAQiY7AW.ebY0A8pJpe1nMXInT/B0tNgz0BqI36Jmg.MRnugxy','qBlC6J6g4mzR5ZyWZ7Ukh4IlVEycL6i2h0IbB1JTw8hDlYgTboZtG0HdE2ov',1,'8z0AjlXH7kHUcp4fQHyw16HVEczc3pn0ilULYJjR4xaxSWkMlZ5dZgfKfu71Ap9V','114.124.177.144','114.124.177.144',NULL,NULL,NULL,NULL,'ceiBckmsCmXdMxGIcJKeX0ok80ICsOdSbbja45e9EKcVLEtDho7qHKgdlm6soSDD','2018-08-14 02:10:10','2018-08-14 02:11:28',NULL),(30,'irmaj','irmaj','peg','irmajpegundan4@gmail.com','$2y$10$rAp6Dlpul8yZCQlwntTIs.HXzMm1sBNkxcx8TSaA3C6KIsGhEsKhm','ED9edmjwEFu0D0fmYvGEE4Rh15DgNYRRYBPSb1tJwyKzi2CBwKH6BNfIX094',1,'rkWHUs1FyyMlpGE8UWMvoBJWfAYXk0cxxUsOy1zIoFHvbwR4Mq9cVF7vcrOoFwDY','103.233.100.250','103.233.100.250',NULL,NULL,NULL,NULL,'tqxCecvK7M9BnTYi2rX2MMM4A1sL16N4UJvoot8iBaqsZqofN5dJ8DVge0QCUAiv','2018-09-06 10:38:23','2018-09-06 10:39:32',NULL),(31,'agna','Agna','Bachrul Ilmi','agnabi90@gmail.com','$2y$10$hQH5Mh1ysd0ylLF3i3sot.OYrdx0cBSQebsdqQmwN/S2bcZarpuJO',NULL,1,'uOE8NdliXz3UvrxNQQZPzo4EBHSFLej72YpTy7wz6FyhXPI9pAmjt4tlbFlsqouY','115.178.216.203','115.178.216.203',NULL,NULL,NULL,NULL,'3SAfdTGQj6CWZwJ26hLhjLeWQYG8HBACZF2Be6trUA3mN4PPG2vt6dhYqn5WoB4H','2018-09-10 02:45:07','2018-09-10 02:46:58',NULL),(32,'donnygg','Donny','Gusmawan','donnygusmawans@gmail.com','$2y$10$WT.Mo64H38Zrr1fQMnmSGOEMVojpvqi8kW86ypr5uM5WZvWqufZ.q','apC6cK4UqHTZMpIohkY8t0dm6CGqsLay5I5w2Gcvs9HtRPF0TmBMnDkBtxpn',1,'4NiJiQmeN2XJmuoqveeTpZR0YOm5YhN2HYGSRJl3r6FssKrLAE6GvyJnxDijNOWU','115.178.216.203','115.178.216.203',NULL,NULL,NULL,NULL,'I11QMPTnO0UsID876EtR8k95yqy6Y9NvNFMuouGMEICax9KWp6XEsJp6C0n9j0yW','2018-09-10 02:45:38','2018-09-10 02:46:47',NULL),(33,'dimassputra','Dimas','surya putra','dimassputra8@gmail.com','$2y$10$yMqLUc3Cu6u1ZwaLq69dsudVyS6pvoppvDvruhrGL0hp0tQWGFk9W',NULL,1,'qiQ33Suh92OlS9pv8YTGlHTHANFyPh8irgo9T85Wl8C1faBuBTlAyLhRc80lqTw8','182.0.229.102','182.0.229.102',NULL,NULL,NULL,NULL,'4m1wiLFieBVnxXb7dFVEnFoUzcDJ2d9Q2jNSTFM22a0kXyMtGEwUXldqDSnj838g','2018-09-10 02:45:57','2018-09-10 02:47:02',NULL),(34,'renaldpputra','Renaldi','Permana','renaldipermana10@gmail.com','$2y$10$5RHWSh6bZc5dVFQbXWLfbuFR2M2LsdBllkf.RgowWNTYX1qu..V/a',NULL,1,'SANRef6gzEFoSZMCgfQG4eExUNWzkTn6E2jbNZDhwbzsCTGdA2kkDyccTXuU2bUQ','182.0.197.226','182.0.197.226',NULL,NULL,NULL,NULL,'08JBnHfHImDgrBCfi6Z4FOQchC7MfutkzDJBuQWBmfgsze9rf1fsAgjbELkW7sDJ','2018-09-10 02:46:04','2018-09-10 02:48:06',NULL),(35,'Nadya','Nadya Dwi','Aulia','nadyadwiaulia29@gmail.com','$2y$10$LIS5YeyD9CKQnZAt6GZaUuvigAQQiQ/gv8wKxnfXioOMdX1UEuaBS',NULL,1,'PaI0E7uwx01oDeMufplbspz976rXNbLtQ4UQJEuvaNV94ardHWJQ071ydV5lLhdg','114.124.238.20','114.124.206.52',NULL,NULL,NULL,NULL,'koLCui6DTsTeC4VbXxXPN9qcQW2Sv90jdimsTs24XUPod5SnjK5Ginq3g7GtmHJX','2018-09-10 02:46:11','2018-09-10 02:48:04',NULL),(36,'ndiputri','nindithia','putri','ndiputri24@gmail.com','$2y$10$EGZ7lhV9pFGOYks7uR8bx.5dwLYayazWRfRi2JDEaXG.I1bWaz3S6',NULL,1,'9P5K8fkrQur2Wbzp2ckJvgsBDfeHs0oigijwuUgzmZ2AIM2IXsZ7zsnPtc552B1A','140.213.21.23','140.213.21.23',NULL,NULL,NULL,NULL,'hwQgLJqnr0zlakoNQgUbm01IEONySX4IyjOY80Sxi91avTg7PlLuLBap5NTEnGig','2018-09-10 02:48:17','2018-09-10 02:49:17',NULL),(37,'fikrinaufalf','Fikri','Naufal Fathurrahman','fikrinaufalf@gmail.com','$2y$10$weavarwQ6Kykzcy0vS2Bu.CONr621.bR.mv0zaszzBvQKL0OewKc.','vIJ8S7bHV2x8Bco4xH9QpVgNqMteUWdYRABhxktXkgJ5U9g1TaPcSv7yeW09',1,'xV9HO9gxrwBEJnMf3w08loITBW91UfSlbLEJtrQWJgwVKDgS8PYhTE9ToAkWKkQz','182.0.164.13','182.0.166.70',NULL,NULL,NULL,NULL,'wQVMTAcYNx3LtBqM14MQSnImoYEIoX1nuERbwSnxjQHR3M8JHlvRyATc2567XNME','2018-09-10 02:57:46','2018-09-10 02:59:01',NULL),(38,'mustofa_l','Achmad','Mustofa','mustofa.luthfi@gmail.com','$2y$10$eoFFO8uZbWQtEzZuH9FTqu.PhtscnytiYsw7Y3yTWzqPuXaZw6hRy','PJtMV88wopHD5BuUMWNh7PFqpz6vyX2RVkcCLvR1T77SK4394GEmSVNPzQoH',1,'RzIVPUr0zS1EcyVliXqFGJgOrt2veFNK8ao2TRiFGsvlKD1O3x5jziGlO67faXdE','103.233.100.250','103.233.100.250',NULL,NULL,NULL,NULL,'JpU58AzNjGVPbPEptjf9vjdW7VWJJ7YHnzeK5zkLKugMgTUg82Rv02nUKWOez3bo','2018-09-10 03:38:04','2018-09-10 03:38:27',NULL),(39,'cendikadh','cendika','hartanta','hartanta06@gmail.com','$2y$10$I2yvVXYj2aM6xt8vCQgdSOmw8xgGDW4r62o8QsYLg4dYWqhC7ev8O',NULL,1,'Krwyp2CKP9YvEc7Ka7gcQ3oSSVI3aDtFvCZrvophgXwjRJsDgPPSMWUizAXjVRLY','10.32.192.170','36.71.233.243',NULL,NULL,NULL,NULL,'j8qqfJJrSVbyHYy1vZ6AC4r5dUynd0uyUflWLyxdAvVzphs2DdhDb5dvQ2xC3Y1y','2018-09-11 03:57:51','2018-09-14 23:38:13',NULL);
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

-- Dump completed on 2018-10-30 16:08:46