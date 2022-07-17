-- MariaDB dump 10.19  Distrib 10.5.12-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_23
-- ------------------------------------------------------
-- Server version	10.5.12-MariaDB-cll-lve

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
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_user_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `communities_name_idx` (`name`),
  KEY `admin_user_id` (`admin_user_id`),
  CONSTRAINT `communities_ibfk_1` FOREIGN KEY (`admin_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'ipsam',1),(2,'ut',2),(3,'cum',3),(4,'mollitia',4),(5,'voluptate',5),(6,'expedita',6),(7,'maxime',7),(8,'laboriosam',8),(9,'quia',9),(10,'doloremque',10),(11,'adipisci',11),(12,'sit',12),(13,'exercitationem',13),(14,'quia',14),(15,'earum',15);
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  `status` enum('requested','approved','declined','unfriended') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
INSERT INTO `friend_requests` VALUES (1,14,'declined','1972-10-17 02:19:11','1988-03-27 12:39:49'),(1,15,'declined','1978-08-17 17:19:16','1979-01-06 05:53:11'),(2,8,'unfriended','2015-04-15 08:34:54','1989-04-13 02:14:46'),(3,12,'requested','1977-11-21 20:12:54','1982-11-10 07:27:14'),(3,15,'unfriended','2019-07-10 09:37:42','1997-06-24 02:17:44'),(4,9,'declined','1973-10-26 15:06:38','2000-03-02 04:02:18'),(4,11,'requested','1997-12-11 00:48:16','1992-02-23 04:56:00'),(4,13,'declined','2001-03-15 18:12:52','1992-02-26 16:57:34'),(5,9,'approved','2009-07-07 03:03:06','1980-02-01 16:28:28'),(5,10,'declined','1981-12-24 08:52:25','2011-03-11 09:09:09'),(6,9,'requested','1998-06-14 07:16:38','2004-01-25 16:03:45'),(7,9,'approved','2005-09-28 16:58:19','1985-05-18 02:28:23'),(7,10,'unfriended','2004-02-15 23:15:15','1996-12-16 20:54:36');
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,1,1,'2013-09-12 15:08:36'),(2,2,2,'1997-11-17 13:58:37'),(3,3,3,'2001-03-08 00:06:19'),(4,4,4,'1981-06-10 22:44:55'),(5,5,5,'2015-03-13 12:16:08'),(6,6,6,'1995-08-16 01:09:38'),(7,7,7,'1973-08-05 08:45:59'),(8,8,8,'2000-09-11 04:26:07'),(9,9,9,'1986-01-19 03:19:31'),(10,10,10,'1972-06-23 15:57:59'),(11,11,11,'1993-09-21 19:28:02'),(12,12,12,'1985-07-27 05:35:09'),(13,13,13,'2015-11-25 13:38:20'),(14,14,14,'1972-03-31 05:41:55'),(15,15,15,'1974-06-13 11:07:03'),(16,1,1,'2013-12-09 21:00:03'),(17,2,2,'1973-05-13 09:44:50'),(18,3,3,'1986-11-23 10:41:47'),(19,4,4,'2022-05-13 21:33:23');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,1,'Incidunt id alias distinctio repellat delectus consequuntur vitae hic. Possimus dolor et voluptas vel expedita ratione eaque eligendi. Officia in nemo quia soluta. Culpa aut hic rerum est libero.','quia',13542,NULL,'2009-05-22 19:09:20','1986-11-26 05:41:02'),(2,2,2,'Magni inventore dicta sit nam officia corporis. Non minus sunt tempore nemo quos aut. Id ut ea voluptatem et qui iusto est sequi. Inventore in dolore perferendis ut et.','voluptas',6554,NULL,'2017-06-10 16:22:53','1998-03-20 03:52:48'),(3,3,3,'Aliquam quia distinctio tempore eius ea nulla laudantium. Mollitia nesciunt similique non id.','tenetur',0,NULL,'2014-04-07 20:52:09','1978-10-06 18:10:33'),(4,4,4,'Ab quia ad magnam omnis. Esse quo numquam facere illo animi qui et ut. Corrupti tenetur beatae optio voluptas corrupti pariatur dolor autem. Quasi est pariatur et et. Voluptas illum qui consequatur sint eveniet.','iure',0,NULL,'1989-11-25 19:35:52','2010-05-09 10:41:51'),(5,1,5,'Quia qui et voluptas at autem qui. Soluta consectetur minima molestias error. Sunt eos recusandae optio voluptatem. Fugiat at deserunt reprehenderit aut.','praesentium',49,NULL,'2000-02-12 11:13:53','1998-08-27 03:17:13'),(6,2,6,'Dolores ea quae quia autem. Maxime commodi veniam occaecati occaecati at nihil consequatur. Non ea hic temporibus voluptatem delectus beatae.','magnam',870,NULL,'2010-11-19 22:21:41','2000-12-26 22:55:04'),(7,3,7,'Commodi adipisci distinctio aut fuga et similique. Inventore ut optio laudantium. Possimus accusantium unde aut molestias. Facere sit laudantium qui qui ut hic quidem.','assumenda',6,NULL,'2018-12-31 14:28:08','2015-04-21 08:54:31'),(8,4,8,'In veritatis omnis est. Commodi accusantium qui et voluptatibus quis sed sint. Unde qui ea consequatur quisquam.','dolore',7791399,NULL,'2021-04-23 02:14:37','2017-06-20 22:11:08'),(9,1,9,'Qui nesciunt vero repellendus repellat quas iure quaerat. Fugiat iste vel voluptas impedit. Quis et dolor perferendis eos. Porro praesentium autem veritatis autem rerum.','exercitationem',0,NULL,'1994-11-01 07:22:29','1991-02-07 22:05:10'),(10,2,10,'Id deleniti id error nesciunt nam est ducimus explicabo. Totam officiis sed aliquid itaque iste non quia et. Cum delectus qui illum nobis.','est',23,NULL,'1994-07-11 02:10:28','1980-05-26 02:40:22'),(11,3,11,'Enim id temporibus fuga nihil. Ex id omnis officiis sit reprehenderit omnis et. Et unde est laborum harum consectetur.','quae',1,NULL,'1987-10-03 20:08:20','1972-12-12 14:52:07'),(12,4,12,'Explicabo magni sunt libero aliquid delectus. Et omnis quia quia dicta qui repudiandae blanditiis. Id eius blanditiis eaque nobis quis aliquid nisi. Perspiciatis similique et voluptatem eos.','velit',265,NULL,'1983-10-25 17:00:24','1993-09-04 01:13:42'),(13,1,13,'Facere recusandae voluptas delectus. Natus assumenda deleniti autem similique non.','iste',0,NULL,'2000-07-30 14:54:26','2013-10-30 11:43:17'),(14,2,14,'Eaque sit molestias nihil qui at voluptate. Voluptatibus autem illum et est molestias eos. Et et nisi qui et et. Fugiat est eveniet alias quod quia consequatur vitae.','nemo',877431,NULL,'2019-10-28 22:16:18','1990-06-07 01:57:22'),(15,3,15,'Aut similique numquam animi aut. Consequatur rem eveniet sed repellendus. Doloribus accusantium magnam est qui magnam.','in',93,NULL,'1994-04-19 09:54:15','1993-10-11 15:37:26');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'aliquam','2008-10-31 04:10:46','1997-11-15 22:18:12'),(2,'vel','2006-12-13 03:45:48','1991-10-24 06:35:16'),(3,'ipsam','1979-07-14 00:01:30','1982-06-09 19:07:06'),(4,'corporis','2006-09-15 15:23:24','2002-10-12 12:29:55');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,1,1,'Et nihil deleniti aut eos iure quia. Vitae a totam iure ipsum.','1973-04-12 01:39:18'),(2,2,2,'Facere facilis vitae autem ratione. Odio distinctio et eveniet consequatur. Voluptatem enim et voluptates possimus facilis suscipit. Qui rerum nostrum voluptatem autem facilis rerum inventore.','2008-07-26 19:23:05'),(3,3,3,'Dolorem necessitatibus totam recusandae accusamus illum. Velit harum ullam consectetur nihil voluptatem illum. Deserunt perferendis accusantium nam officiis porro. In tempore occaecati necessitatibus voluptas tempore.','2006-05-22 14:07:35'),(4,4,4,'Debitis porro error aut. Et dignissimos et distinctio expedita odio cum.','1981-04-22 21:52:37'),(5,5,5,'Eveniet quia impedit provident cumque qui provident. Corporis nihil minima non non nam alias et. Asperiores voluptatem harum et id exercitationem voluptatem deserunt. Nemo repellat quae suscipit sit placeat ea. Corrupti et atque sunt et sunt culpa et.','2018-07-15 10:29:33'),(6,6,6,'Vel ullam voluptatem inventore laboriosam. Autem iste nostrum cumque recusandae eaque repudiandae. Fugit eos dolores ab minima. Et quae quis eum saepe odio dolorem.','2000-11-05 15:11:51'),(7,7,7,'Ab dolorum sequi quidem et ut ut. Doloremque eum accusamus quia. Qui praesentium quas id.','2002-02-23 08:14:20'),(8,8,8,'Non qui asperiores consectetur ipsum libero. Sit quia quibusdam rerum autem aut.','1970-06-26 03:42:05'),(9,9,9,'Natus in harum aliquam sequi. Commodi et repudiandae vel provident sequi ut. Corrupti consequatur dolorem eligendi blanditiis nihil praesentium illum magni. Nihil sed odio enim accusantium necessitatibus architecto iure laboriosam.','1973-12-12 10:32:28'),(10,10,10,'Odio dolor a aut voluptatem cupiditate sit. Aspernatur qui nam in eius et omnis ab. Sit expedita porro ut.','1987-01-24 04:44:30'),(11,11,11,'Et illum voluptate in vel expedita repudiandae a veniam. Magni hic praesentium occaecati alias impedit ea. Aspernatur qui accusamus voluptas quo dolorem provident facere quidem.','2009-10-18 18:26:28'),(12,12,12,'Velit labore corrupti est tempora et. Et quia quod inventore facilis voluptatem. Aut nihil iure animi adipisci. Nihil error doloribus qui sint aut minus eligendi. Saepe sunt maiores deleniti consequatur ut necessitatibus libero.','2016-04-27 06:54:16'),(13,13,13,'Animi dignissimos quibusdam nobis consequatur. Facere quo fugiat libero voluptatibus aliquid. Numquam illum beatae eaque ut. Ab modi eius eos incidunt neque.','1975-05-22 07:57:05'),(14,14,14,'Est rerum et mollitia reprehenderit aut. Illum distinctio enim enim. Id beatae ipsa laudantium consequatur ea officia. Dolores vitae voluptatem deserunt.','1988-01-10 11:59:01'),(15,15,15,'Ea voluptas aliquam incidunt corporis sit. Sunt sit fugiat non velit. Voluptatem et omnis nulla nam nobis aut voluptatem.','2012-03-30 00:13:51');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_albums`
--

DROP TABLE IF EXISTS `photo_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_albums` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photo_albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_albums`
--

LOCK TABLES `photo_albums` WRITE;
/*!40000 ALTER TABLE `photo_albums` DISABLE KEYS */;
INSERT INTO `photo_albums` VALUES (1,'deleniti',1),(2,'dicta',2),(3,'maxime',3),(4,'enim',4),(5,'vel',5),(6,'accusantium',6),(7,'nemo',7),(8,'maiores',8),(9,'enim',9),(10,'odit',10),(11,'consequatur',11),(12,'nam',12),(13,'neque',13),(14,'qui',14),(15,'unde',15);
/*!40000 ALTER TABLE `photo_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) unsigned DEFAULT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `album_id` (`album_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`),
  CONSTRAINT `photos_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),(11,11,11),(12,12,12),(13,13,13),(14,14,14),(15,15,15);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `photo_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `hometown` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'f','1996-01-05',1,'2007-05-27 05:04:06','West Leannaland'),(2,'f','2001-10-17',2,'1999-01-21 00:28:12','Bergnaummouth'),(3,'m','2005-08-03',3,'2008-12-17 23:13:30','Port Libbieview'),(4,'f','2021-03-28',4,'2009-04-15 14:37:42','Port Karina'),(5,'m','1982-11-08',5,'1979-04-10 04:43:50','Lilyanberg'),(6,'f','1974-11-14',6,'2019-08-08 11:53:20','East Dellaland'),(7,'n','2003-07-06',7,'1980-08-10 20:27:55','Arnaldotown'),(8,'m','2008-05-25',8,'2015-12-01 13:53:52','West Salvatorebury'),(9,'f','1976-09-03',9,'2010-04-21 10:24:21','East Quincyfurt'),(10,'n','2004-01-11',10,'1992-05-31 15:51:04','Port Raphaelle'),(11,'m','2001-06-10',11,'1972-03-11 05:28:47','Wilkinsonhaven'),(12,'f','2013-01-30',12,'1995-01-18 06:23:02','Kutchberg'),(13,'m','1990-07-22',13,'1974-12-17 19:36:51','South Gracieville'),(14,'n','1982-12-04',14,'2018-02-14 12:34:59','North Melissaside'),(15,'n','2015-09-22',15,'2019-11-03 20:02:22','Bednarbury');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Фамиль',
  `email` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_hash` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `users_firstname_lastname_idx` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='юзеры';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Houston','Mohr','hagenes.abdiel@example.org','56acb500d854fc97b7e60547c9a4e10aafba9bd8',89627669147),(2,'Jamarcus','Shanahan','qdietrich@example.org','01ae8354cffc299396c99a8284802faceed1d309',89116195323),(3,'Georgiana','Gottlieb','friedrich57@example.org','58d242913e6b840b76d2e47df66c2ebc2961fcc0',89584281330),(4,'Adella','Altenwerth','pgoodwin@example.com','84cc67fd709c38fe2004ae49b1fe567c839226a0',89246634125),(5,'Erich','Schultz','wfadel@example.net','5a112e3512ccc2fa8c0a03bd66fb4f386f1eeebd',89566851043),(6,'Grace','Mayert','nstoltenberg@example.com','c5067e6577766d1c73e683c81d9c8191186130d5',89033783887),(7,'Jayson','Wehner','lincoln.ortiz@example.net','dbd9ddb0ab1d9ac0fdb01ca4ae72521fe09f5f1e',89740405792),(8,'Alejandra','Lesch','hyatt.toby@example.com','1350477c25ce4523859cf15e4cd88416e08cb978',89683184563),(9,'Vada','Bartoletti','matilde27@example.org','282e92e9577ada03e5f4846df9af2543b8977680',89795250959),(10,'Emerald','McClure','darion.legros@example.org','780be32c120679891ef20358c2056ce3a34192b5',89250015598),(11,'Dawn','Fahey','harvey60@example.net','7ee09b1ac96af77f7dad04d4bfe40cd660dad389',89565417226),(12,'Natasha','Lesch','whilll@example.net','836a07e2934e6202cefac0de2429b0e41c7ab3f2',89783459649),(13,'Geoffrey','Gerhold','demetrius.heidenreich@example.net','5267c661ca9b848fc8955ae4588a15dd18591c2a',89338148390),(14,'Veronica','Kessler','bernard.hirthe@example.com','34fbe2675f7743b09eaba6a4ba9fdf5052e2f015',89454580587),(15,'Nico','Wisoky','gregory76@example.net','d7206e60adc6d77cdd690f1755e32e80f55839e4',89920818797);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_communities`
--

DROP TABLE IF EXISTS `users_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_communities` (
  `user_id` bigint(20) unsigned NOT NULL,
  `community_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_communities`
--

LOCK TABLES `users_communities` WRITE;
/*!40000 ALTER TABLE `users_communities` DISABLE KEYS */;
INSERT INTO `users_communities` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15);
/*!40000 ALTER TABLE `users_communities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-17  8:16:09