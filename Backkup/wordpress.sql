-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: wordpress
-- ------------------------------------------------------
-- Server version	5.7.24

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
-- Table structure for table `wp_abc_booking_extras`
--

DROP TABLE IF EXISTS `wp_abc_booking_extras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_abc_booking_extras` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `booking_id` int(32) NOT NULL,
  `extra_id` int(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_abc_booking_extras`
--

LOCK TABLES `wp_abc_booking_extras` WRITE;
/*!40000 ALTER TABLE `wp_abc_booking_extras` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_abc_booking_extras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_abc_bookings`
--

DROP TABLE IF EXISTS `wp_abc_bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_abc_bookings` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `calendar_id` int(255) NOT NULL,
  `persons` int(32) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `county` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `price` float NOT NULL,
  `state` varchar(32) NOT NULL,
  `room_id` int(11) NOT NULL,
  `payment` varchar(255) NOT NULL,
  `payment_reference` varchar(255) NOT NULL,
  `created` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_abc_bookings`
--

LOCK TABLES `wp_abc_bookings` WRITE;
/*!40000 ALTER TABLE `wp_abc_bookings` DISABLE KEYS */;
INSERT INTO `wp_abc_bookings` VALUES (1,'2019-05-25','2019-05-26',1,1,'Hannah','Wild','Hannah.Wild@live.de','123','A','123','Aichhalden','','Deutschland','',1,'canceled',1,'n/a','','2019-04-28'),(2,'2019-05-25','2019-05-26',1,1,'Markus','Wild','mwild@gmx.net','123','','','','','','test',1,'canceled',1,'n/a','','2019-04-28'),(3,'2019-04-28','2019-04-30',1,1,'asfd','asfd','mwild@gmx.net','asf','','','','','','asfd',2,'canceled',1,'n/a','','2019-04-28'),(4,'2019-05-01','2019-05-05',1,1,'Benedikt Gabriel','Wild','benedikt.wild@live.de','0176827209896','','','','','','',4,'confirmed',1,'n/a','','2019-04-28'),(5,'2019-05-01','2019-05-05',1,1,'Benedikt Gabriel','Wild','benedikt.wild@live.de','0176827209896','','','','','','',4,'rejected',1,'n/a','','2019-04-28'),(6,'2019-04-29','2019-05-01',1,1,'Jona','Wild','jona.emma.wild@gmail.com','017639400398','','','','','','Hallo',2,'rejected',1,'n/a','','2019-04-29'),(7,'2019-05-23','2019-05-24',1,1,'Hannah Sophia','Wild','hannah.wild@live.de','017639880327','','','','','','Apple flower and Sunshine Expected',1,'confirmed',1,'n/a','','2019-04-29'),(8,'2019-05-06','2019-05-07',1,1,'Charlotte','Wild','mwild@gmx.net','07444956995','','','','','','Ich will auch rein!',1,'confirmed',1,'n/a','','2019-05-01'),(9,'2019-05-26','2019-05-27',1,1,'Charlotte','Wild','Charlotte.Wild@outlook.com','956995','','','','','','',1,'confirmed',1,'n/a','','2019-05-25');
/*!40000 ALTER TABLE `wp_abc_bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_abc_calendars`
--

DROP TABLE IF EXISTS `wp_abc_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_abc_calendars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `maxUnits` int(11) NOT NULL,
  `maxAvailabilities` int(11) NOT NULL,
  `pricePreset` double NOT NULL,
  `minimumStayPreset` int(16) NOT NULL,
  `partlyBooked` int(16) NOT NULL,
  `infoPage` int(11) NOT NULL,
  `infoText` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_abc_calendars`
--

LOCK TABLES `wp_abc_calendars` WRITE;
/*!40000 ALTER TABLE `wp_abc_calendars` DISABLE KEYS */;
INSERT INTO `wp_abc_calendars` VALUES (1,'NewBeeHome',5,1,1,1,1,77,'Collaboration in the house, on the field around in the forest is possible at any time and is rewarded with free food and lodging.\n\nThe price below is a bookkeeping price.');
/*!40000 ALTER TABLE `wp_abc_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_abc_extras`
--

DROP TABLE IF EXISTS `wp_abc_extras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_abc_extras` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `explanation` text NOT NULL,
  `calculation` text NOT NULL,
  `mandatory` text NOT NULL,
  `price` double NOT NULL,
  `persons` int(32) NOT NULL,
  `order` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_abc_extras`
--

LOCK TABLES `wp_abc_extras` WRITE;
/*!40000 ALTER TABLE `wp_abc_extras` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_abc_extras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_abc_requests`
--

DROP TABLE IF EXISTS `wp_abc_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_abc_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `current_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `persons` int(10) NOT NULL,
  `successful` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_abc_requests`
--

LOCK TABLES `wp_abc_requests` WRITE;
/*!40000 ALTER TABLE `wp_abc_requests` DISABLE KEYS */;
INSERT INTO `wp_abc_requests` VALUES (1,'2019-04-28 16:03:49','2019-05-25','2019-05-26',1,1),(2,'2019-04-28 16:18:33','2019-05-25','2019-05-26',1,0),(3,'2019-04-28 16:19:24','2019-05-25','2019-05-26',1,1),(4,'2019-04-28 16:39:42','2019-04-28','2019-04-30',1,1),(5,'2019-04-28 18:22:19','2019-05-23','2019-05-27',1,1),(6,'2019-04-28 18:26:55','2019-04-28','2019-04-30',1,1),(7,'2019-04-28 20:25:38','2019-05-01','2019-05-05',1,1),(8,'2019-04-28 20:27:03','2019-05-01','2019-05-05',1,1),(9,'2019-04-28 20:27:46','2019-05-01','2019-05-05',1,1),(10,'2019-04-28 20:28:40','2019-05-01','2019-05-05',1,1),(11,'2019-04-28 20:29:05','2019-07-27','2019-09-30',1,1),(12,'2019-04-29 16:53:34','2019-04-29','2019-05-01',1,1),(13,'2019-04-29 21:14:33','2019-05-23','2019-05-24',1,1),(14,'2019-04-29 21:19:01','2019-05-28','2019-06-03',1,1),(15,'2019-05-01 18:56:05','2019-05-06','2019-05-07',1,1),(16,'2019-05-08 13:12:25','2019-05-10','2019-05-11',1,1),(17,'2019-05-25 11:28:52','2019-05-26','2019-05-27',1,1);
/*!40000 ALTER TABLE `wp_abc_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_abc_rooms`
--

DROP TABLE IF EXISTS `wp_abc_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_abc_rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendar_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  UNIQUE KEY `id_2` (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_abc_rooms`
--

LOCK TABLES `wp_abc_rooms` WRITE;
/*!40000 ALTER TABLE `wp_abc_rooms` DISABLE KEYS */;
INSERT INTO `wp_abc_rooms` VALUES (1,1,'MainRoom');
/*!40000 ALTER TABLE `wp_abc_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_abc_seasons`
--

DROP TABLE IF EXISTS `wp_abc_seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_abc_seasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `lastminute` int(11) NOT NULL,
  `minimumStay` int(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_abc_seasons`
--

LOCK TABLES `wp_abc_seasons` WRITE;
/*!40000 ALTER TABLE `wp_abc_seasons` DISABLE KEYS */;
INSERT INTO `wp_abc_seasons` VALUES (1,'Summer',1,0,1);
/*!40000 ALTER TABLE `wp_abc_seasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_abc_seasons_assignment`
--

DROP TABLE IF EXISTS `wp_abc_seasons_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_abc_seasons_assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendar_id` int(11) NOT NULL,
  `season_id` int(11) NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_abc_seasons_assignment`
--

LOCK TABLES `wp_abc_seasons_assignment` WRITE;
/*!40000 ALTER TABLE `wp_abc_seasons_assignment` DISABLE KEYS */;
INSERT INTO `wp_abc_seasons_assignment` VALUES (1,1,1,'2019-05-01','2019-09-30');
/*!40000 ALTER TABLE `wp_abc_seasons_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_belegung_config`
--

DROP TABLE IF EXISTS `wp_belegung_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_belegung_config` (
  `bc_id` int(11) NOT NULL AUTO_INCREMENT,
  `bc_name` varchar(50) NOT NULL,
  `bc_wert` varchar(250) NOT NULL,
  `bc_objekt_id` int(4) NOT NULL,
  PRIMARY KEY (`bc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_belegung_config`
--

LOCK TABLES `wp_belegung_config` WRITE;
/*!40000 ALTER TABLE `wp_belegung_config` DISABLE KEYS */;
INSERT INTO `wp_belegung_config` VALUES (1,'color_def','#4B5D67',1),(2,'color_tabborder','#b7ccdf',1),(3,'color_tabinner','#e7ecf0',1),(4,'color_tabinnerDays','#F7Fcf0',1),(5,'color_tabhead','#b7ccdf',1),(6,'color_holiday','#ff0000',1),(7,'color_today','#ff0000',1),(8,'color_nildays','#e7ecf0',1),(9,'color_assigned','#FFCCCC',1),(10,'main_with','507px',1),(11,'heading','Change Name',1),(12,'number_month','12',1),(13,'view_columns','3',1),(14,'view_past','1',1);
/*!40000 ALTER TABLE `wp_belegung_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_belegung_daten`
--

DROP TABLE IF EXISTS `wp_belegung_daten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_belegung_daten` (
  `bd_datum` date NOT NULL,
  `bd_objekt_id` int(4) NOT NULL,
  PRIMARY KEY (`bd_datum`,`bd_objekt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_belegung_daten`
--

LOCK TABLES `wp_belegung_daten` WRITE;
/*!40000 ALTER TABLE `wp_belegung_daten` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_belegung_daten` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_belegung_objekte`
--

DROP TABLE IF EXISTS `wp_belegung_objekte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_belegung_objekte` (
  `bo_objekt_id` int(4) NOT NULL AUTO_INCREMENT,
  `bo_description` varchar(100) NOT NULL,
  PRIMARY KEY (`bo_objekt_id`),
  UNIQUE KEY `idx_bo_description` (`bo_description`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_belegung_objekte`
--

LOCK TABLES `wp_belegung_objekte` WRITE;
/*!40000 ALTER TABLE `wp_belegung_objekte` DISABLE KEYS */;
INSERT INTO `wp_belegung_objekte` VALUES (1,'occupancy_plan');
/*!40000 ALTER TABLE `wp_belegung_objekte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_commentmeta`
--

LOCK TABLES `wp_commentmeta` WRITE;
/*!40000 ALTER TABLE `wp_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_comments`
--

LOCK TABLES `wp_comments` WRITE;
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_links`
--

LOCK TABLES `wp_links` WRITE;
/*!40000 ALTER TABLE `wp_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5993 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_options`
--

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;
INSERT INTO `wp_options` VALUES (1,'siteurl','http://newbeehive.org:8080','yes'),(2,'home','http://newbeehive.org:8080','yes'),(3,'blogname','New Bee Hive','yes'),(4,'blogdescription','Under Construction','yes'),(5,'users_can_register','0','yes'),(6,'admin_email','Markus.Wild@live.de','yes'),(7,'start_of_week','1','yes'),(8,'use_balanceTags','0','yes'),(9,'use_smilies','1','yes'),(10,'require_name_email','1','yes'),(11,'comments_notify','1','yes'),(12,'posts_per_rss','10','yes'),(13,'rss_use_excerpt','0','yes'),(14,'mailserver_url','mail.example.com','yes'),(15,'mailserver_login','login@example.com','yes'),(16,'mailserver_pass','password','yes'),(17,'mailserver_port','110','yes'),(18,'default_category','1','yes'),(19,'default_comment_status','open','yes'),(20,'default_ping_status','open','yes'),(21,'default_pingback_flag','0','yes'),(22,'posts_per_page','10','yes'),(23,'date_format','jS F Y','yes'),(24,'time_format','g:i a','yes'),(25,'links_updated_date_format','jS F Y g:i a','yes'),(26,'comment_moderation','0','yes'),(27,'moderation_notify','1','yes'),(28,'permalink_structure','/%year%/%monthnum%/%day%/%postname%/','yes'),(29,'rewrite_rules','a:91:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:38:\"index.php?&page_id=8&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:53:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:61:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:53:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}','yes'),(30,'hack_file','0','yes'),(31,'blog_charset','UTF-8','yes'),(32,'moderation_keys','','no'),(33,'active_plugins','a:1:{i:0;s:55:\"advanced-booking-calendar/advanced-booking-calendar.php\";}','yes'),(34,'category_base','','yes'),(35,'ping_sites','http://rpc.pingomatic.com/','yes'),(36,'comment_max_links','2','yes'),(37,'gmt_offset','','yes'),(38,'default_email_category','1','yes'),(39,'recently_edited','a:2:{i:0;s:57:\"/var/www/html/wp-content/themes/twentyseventeen/style.css\";i:1;s:0:\"\";}','no'),(40,'template','twentyseventeen','yes'),(41,'stylesheet','twentyseventeen','yes'),(42,'comment_whitelist','1','yes'),(43,'blacklist_keys','','no'),(44,'comment_registration','0','yes'),(45,'html_type','text/html','yes'),(46,'use_trackback','0','yes'),(47,'default_role','subscriber','yes'),(48,'db_version','38590','yes'),(49,'uploads_use_yearmonth_folders','1','yes'),(50,'upload_path','','yes'),(51,'blog_public','0','yes'),(52,'default_link_category','2','yes'),(53,'show_on_front','page','yes'),(54,'tag_base','','yes'),(55,'show_avatars','1','yes'),(56,'avatar_rating','G','yes'),(57,'upload_url_path','','yes'),(58,'thumbnail_size_w','150','yes'),(59,'thumbnail_size_h','150','yes'),(60,'thumbnail_crop','1','yes'),(61,'medium_size_w','300','yes'),(62,'medium_size_h','300','yes'),(63,'avatar_default','mystery','yes'),(64,'large_size_w','1024','yes'),(65,'large_size_h','1024','yes'),(66,'image_default_link_type','none','yes'),(67,'image_default_size','','yes'),(68,'image_default_align','','yes'),(69,'close_comments_for_old_posts','0','yes'),(70,'close_comments_days_old','14','yes'),(71,'thread_comments','1','yes'),(72,'thread_comments_depth','5','yes'),(73,'page_comments','0','yes'),(74,'comments_per_page','50','yes'),(75,'default_comments_page','newest','yes'),(76,'comment_order','asc','yes'),(77,'sticky_posts','a:0:{}','yes'),(78,'widget_categories','a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(79,'widget_text','a:5:{i:2;a:4:{s:5:\"title\";s:7:\"Find Us\";s:4:\"text\";s:74:\"<strong>Address</strong>\r\nBee Home\r\n\r\n<strong>Hours</strong>\r\nMy Bee Hours\";s:6:\"filter\";b:1;s:6:\"visual\";b:1;}i:3;a:4:{s:5:\"title\";s:15:\"About This Site\";s:4:\"text\";s:85:\"This may be a good place to introduce yourself and your site or include some credits.\";s:6:\"filter\";b:1;s:6:\"visual\";b:1;}i:4;a:4:{s:5:\"title\";s:7:\"Find Us\";s:4:\"text\";s:50:\"<strong>Address</strong>\r\n\r\n<strong>Hours</strong>\";s:6:\"filter\";b:1;s:6:\"visual\";b:1;}i:5;a:4:{s:5:\"title\";s:15:\"About This Site\";s:4:\"text\";s:24:\"We are ... (coming soon)\";s:6:\"filter\";b:1;s:6:\"visual\";b:1;}s:12:\"_multiwidget\";i:1;}','yes'),(80,'widget_rss','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),(81,'uninstall_plugins','a:1:{s:55:\"advanced-booking-calendar/advanced-booking-calendar.php\";s:35:\"advanced_booking_calendar_uninstall\";}','no'),(82,'timezone_string','Europe/Berlin','yes'),(83,'page_for_posts','11','yes'),(84,'page_on_front','8','yes'),(85,'default_post_format','0','yes'),(86,'link_manager_enabled','0','yes'),(87,'finished_splitting_shared_terms','1','yes'),(88,'site_icon','67','yes'),(89,'medium_large_size_w','768','yes'),(90,'medium_large_size_h','0','yes'),(91,'wp_page_for_privacy_policy','3','yes'),(92,'show_comments_cookies_opt_in','0','yes'),(93,'initial_db_version','38590','yes'),(94,'wp_user_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','yes'),(95,'fresh_site','0','yes'),(96,'WPLANG','en_GB','yes'),(97,'widget_search','a:4:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;i:3;a:1:{s:5:\"title\";s:6:\"Search\";}i:4;a:1:{s:5:\"title\";s:6:\"Search\";}}','yes'),(98,'widget_recent-posts','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(99,'widget_recent-comments','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(100,'widget_archives','a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(101,'widget_meta','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(102,'sidebars_widgets','a:5:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:6:\"text-2\";i:1;s:8:\"search-3\";i:2;s:6:\"text-3\";}s:9:\"sidebar-2\";a:1:{i:0;s:6:\"text-4\";}s:9:\"sidebar-3\";a:2:{i:0;s:6:\"text-5\";i:1;s:8:\"search-4\";}s:13:\"array_version\";i:3;}','yes'),(103,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(104,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(105,'widget_media_audio','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(106,'widget_media_image','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(107,'widget_media_gallery','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(108,'widget_media_video','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(109,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(110,'widget_nav_menu','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(111,'widget_custom_html','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(112,'cron','a:6:{i:1561356178;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1561377778;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1561377806;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1561387668;a:1:{s:26:\"clearWaitingBookings_event\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1561391707;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}','yes'),(113,'theme_mods_twentyseventeen','a:10:{s:18:\"custom_css_post_id\";i:-1;s:18:\"nav_menu_locations\";a:2:{s:3:\"top\";i:2;s:6:\"social\";i:3;}s:7:\"panel_1\";i:12;s:7:\"panel_2\";i:40;s:7:\"panel_3\";i:47;s:7:\"panel_4\";i:10;s:11:\"custom_logo\";i:15;s:12:\"header_image\";s:77:\"http://newbeehive.org:8080/wp-content/uploads/2018/11/cropped-The-Dawn-...jpg\";s:17:\"header_image_data\";O:8:\"stdClass\":5:{s:13:\"attachment_id\";i:17;s:3:\"url\";s:77:\"http://newbeehive.org:8080/wp-content/uploads/2018/11/cropped-The-Dawn-...jpg\";s:13:\"thumbnail_url\";s:77:\"http://newbeehive.org:8080/wp-content/uploads/2018/11/cropped-The-Dawn-...jpg\";s:6:\"height\";i:1200;s:5:\"width\";i:2000;}s:11:\"page_layout\";s:10:\"two-column\";}','yes'),(129,'can_compress_scripts','0','no'),(150,'nav_menu_options','a:1:{s:8:\"auto_add\";a:0:{}}','yes'),(175,'new_admin_email','Markus.Wild@live.de','yes'),(403,'recently_activated','a:1:{s:40:\"occupancyplan/occupancy_plan_options.php\";i:1556465505;}','yes'),(1018,'auto_core_update_notified','a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:19:\"Markus.Wild@live.de\";s:7:\"version\";s:6:\"4.9.10\";s:9:\"timestamp\";i:1552448499;}','no'),(4488,'occupancy_plan_db_version','1.0.2.0','yes'),(4489,'widget_occupancy-plan','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(4503,'abc_pluginversion','159','yes'),(4504,'abc_email','markus.wild@live.de','yes'),(4505,'abc_bookingpage','77','yes'),(4506,'abc_dateformat','Y-m-d','yes'),(4507,'abc_priceformat','.','yes'),(4508,'abc_cookies','0','yes'),(4509,'abc_googleanalytics','0','yes'),(4510,'abc_currency','€','yes'),(4511,'abc_newsletter_10th_asked','0','yes'),(4512,'abc_newsletter_100th_asked','0','yes'),(4513,'abc_newsletter_20000revenue_asked','0','yes'),(4514,'abc_subject_unconfirmed','Your booking at New Bee Hive - [abc_checkin_date] - [abc_checkout_date]','yes'),(4515,'abc_text_unconfirmed','Hi [abc_first_name]!\nThank you for booking at New Bee Hive. Your booking has not yet been confirmed. Please wait for an additional confirmation email.\n\nYour details:\nRoom type: [abc_calendar_name]\nRoom price: [abc_room_price]\nCheckin - Checkout: [abc_checkin_date] - [abc_checkout_date]\nNumber of guests: [abc_person_count]\nFull Name: [abc_first_name] - [abc_last_name]\nEmail: [abc_email]\nPhone: [abc_phone]\nAddress: [abc_address], [abc_zip] [abc_city], [abc_county], [abc_country]\nYour message to us: [abc_message]\n\nYour New Bee Hive-Team','yes'),(4516,'abc_subject_confirmed','Confirming your booking at New Bee Hive - [abc_checkin_date] - [abc_checkout_date]','yes'),(4517,'abc_text_confirmed','Hi [abc_first_name]!\nWe are happy to confirm your booking!\n\nYour details:\nRoom type: [abc_calendar_name]\nRoom price: [abc_room_price]\nSelected extras: [abc_optional_extras]\nAdditional costs: [abc_mandatory_extras]\nDiscount: [abc_discount]\nTotal price: [abc_total_price]\nCheckin - Checkout: [abc_checkin_date] - [abc_checkout_date]\nNumber of guests: [abc_person_count]\nFull Name: [abc_first_name] - [abc_last_name]\nEmail: [abc_email]\nPhone: [abc_phone]\nAddress: [abc_address], [abc_zip] [abc_city], [abc_county], [abc_country]\nYour message to us: [abc_message]\n\nIf you have any questions regard your stay, feel free to contact us.\n\nYour New Bee Hive-Team','yes'),(4518,'abc_subject_canceled','Canceling your booking at New Bee Hive','yes'),(4519,'abc_text_canceled','Hi [abc_first_name]!\nWe are very sorry to cancel your booking! We already had another reservation for your requested travel period.\nPlease check our website at http://newbeehive.org:8080 for an alternative. We would be very happy to welcome you any time soon.\n\nYour New Bee Hive-Team','yes'),(4520,'abc_subject_rejected','Rejecting your booking at New Bee Hive','yes'),(4521,'abc_text_rejected','Hi [abc_first_name]!\nWe are very sorry to reject your booking! We already had another reservation for your requested travel period.\nPlease check our website at http://newbeehive.org:8080 for an alternative. We would be very happy to welcome you any time soon.\n\nYour New Bee Hive-Team','yes'),(4522,'abc_installdate','2019-04-28','yes'),(4523,'abc_poweredby','0','yes'),(4524,'abc_feedbackModal01','1','yes'),(4525,'abc_currencyPosition','1','yes'),(4526,'abc_customCss','','yes'),(4527,'abc_personcount','2','yes'),(4528,'abc_bookingform','a:11:{s:9:\"firstname\";i:2;s:8:\"lastname\";i:2;s:5:\"phone\";i:2;s:6:\"street\";i:0;s:3:\"zip\";i:0;s:4:\"city\";i:0;s:6:\"county\";i:0;s:7:\"country\";i:0;s:7:\"message\";i:1;s:13:\"optincheckbox\";i:0;s:6:\"inputs\";i:4;}','yes'),(4529,'abc_bookingformvalidated','1','yes'),(4530,'abc_deletion','0','yes'),(4531,'abc_accessLevel','Administrator','yes'),(4532,'abc_emailcopy','1','yes'),(4533,'abc_textCustomization','s:353:\"a:1:{s:5:\"en_GB\";a:14:{s:19:\"checkAvailabilities\";s:0:\"\";s:10:\"selectRoom\";s:0:\"\";s:12:\"selectedRoom\";s:0:\"\";s:10:\"otherRooms\";s:0:\"\";s:6:\"noRoom\";s:0:\"\";s:10:\"availRooms\";s:0:\"\";s:8:\"roomType\";s:0:\"\";s:8:\"yourStay\";s:0:\"\";s:7:\"checkin\";s:0:\"\";s:8:\"checkout\";s:0:\"\";s:7:\"bookNow\";s:0:\"\";s:8:\"thankYou\";s:0:\"\";s:9:\"roomPrice\";s:0:\"\";s:5:\"optin\";s:0:\"\";}}\";','yes'),(4534,'abc_paymentSettings','s:135:\"a:2:{s:4:\"cash\";a:2:{s:8:\"activate\";s:5:\"false\";s:4:\"text\";s:0:\"\";}s:9:\"onInvoice\";a:2:{s:8:\"activate\";s:5:\"false\";s:4:\"text\";s:0:\"\";}}\";','yes'),(4535,'widget_abcavailabilityformwidget','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(4551,'abc_unconfirmed','0','yes'),(4552,'abc_newsletter','0','yes'),(4553,'abc_usage','0','yes'),(5293,'abc_usageModal01','1','yes'),(5296,'_transient_is_multi_author','0','yes'),(5939,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:7:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/en_GB/wordpress-5.2.2.zip\";s:6:\"locale\";s:5:\"en_GB\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/en_GB/wordpress-5.2.2.zip\";s:10:\"no_content\";b:0;s:11:\"new_bundled\";b:0;s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.2.2\";s:7:\"version\";s:5:\"5.2.2\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.0\";s:15:\"partial_version\";s:0:\"\";}i:1;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.2.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.2.2.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.2.2-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.2.2-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.2.2\";s:7:\"version\";s:5:\"5.2.2\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.0\";s:15:\"partial_version\";s:0:\"\";}i:2;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.2.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.2.2.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.2.2-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.2.2-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.2.2\";s:7:\"version\";s:5:\"5.2.2\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.0\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}i:3;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.2.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.2.1.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.2.1-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.2.1-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.2.1\";s:7:\"version\";s:5:\"5.2.1\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.0\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}i:4;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:57:\"https://downloads.wordpress.org/release/wordpress-5.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:57:\"https://downloads.wordpress.org/release/wordpress-5.2.zip\";s:10:\"no_content\";s:68:\"https://downloads.wordpress.org/release/wordpress-5.2-no-content.zip\";s:11:\"new_bundled\";s:69:\"https://downloads.wordpress.org/release/wordpress-5.2-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:3:\"5.2\";s:7:\"version\";s:3:\"5.2\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.0\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}i:5;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.1.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.1.1.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.1.1-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.1.1-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.1.1\";s:7:\"version\";s:5:\"5.1.1\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.0\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}i:6;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.0.4.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.0.4.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.0.4-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.0.4-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.0.4\";s:7:\"version\";s:5:\"5.0.4\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.0\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}}s:12:\"last_checked\";i:1561339577;s:15:\"version_checked\";s:6:\"4.9.10\";s:12:\"translations\";a:0:{}}','no'),(5989,'_site_transient_timeout_theme_roots','1561341377','no'),(5990,'_site_transient_theme_roots','a:3:{s:13:\"twentyfifteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:13:\"twentysixteen\";s:7:\"/themes\";}','no'),(5991,'_site_transient_update_themes','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1561339578;s:7:\"checked\";a:3:{s:13:\"twentyfifteen\";s:3:\"2.0\";s:15:\"twentyseventeen\";s:3:\"1.7\";s:13:\"twentysixteen\";s:3:\"1.5\";}s:8:\"response\";a:3:{s:13:\"twentyfifteen\";a:6:{s:5:\"theme\";s:13:\"twentyfifteen\";s:11:\"new_version\";s:3:\"2.5\";s:3:\"url\";s:43:\"https://wordpress.org/themes/twentyfifteen/\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/theme/twentyfifteen.2.5.zip\";s:8:\"requires\";s:3:\"4.1\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:15:\"twentyseventeen\";a:6:{s:5:\"theme\";s:15:\"twentyseventeen\";s:11:\"new_version\";s:3:\"2.2\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentyseventeen/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentyseventeen.2.2.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:13:\"twentysixteen\";a:6:{s:5:\"theme\";s:13:\"twentysixteen\";s:11:\"new_version\";s:3:\"2.0\";s:3:\"url\";s:43:\"https://wordpress.org/themes/twentysixteen/\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/theme/twentysixteen.2.0.zip\";s:8:\"requires\";s:3:\"4.4\";s:12:\"requires_php\";s:5:\"5.2.4\";}}s:12:\"translations\";a:0:{}}','no'),(5992,'_site_transient_update_plugins','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1561339579;s:7:\"checked\";a:3:{s:55:\"advanced-booking-calendar/advanced-booking-calendar.php\";s:5:\"1.5.9\";s:19:\"akismet/akismet.php\";s:5:\"4.0.8\";s:9:\"hello.php\";s:3:\"1.7\";}s:8:\"response\";a:2:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.1.2\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.1.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.2.2\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:9:\"hello.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/hello-dolly.1.7.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.2.2\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:1:{s:55:\"advanced-booking-calendar/advanced-booking-calendar.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:39:\"w.org/plugins/advanced-booking-calendar\";s:4:\"slug\";s:25:\"advanced-booking-calendar\";s:6:\"plugin\";s:55:\"advanced-booking-calendar/advanced-booking-calendar.php\";s:11:\"new_version\";s:5:\"1.5.9\";s:3:\"url\";s:56:\"https://wordpress.org/plugins/advanced-booking-calendar/\";s:7:\"package\";s:74:\"https://downloads.wordpress.org/plugin/advanced-booking-calendar.1.5.9.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:78:\"https://ps.w.org/advanced-booking-calendar/assets/icon-256x256.png?rev=1402357\";s:2:\"1x\";s:78:\"https://ps.w.org/advanced-booking-calendar/assets/icon-128x128.png?rev=1402701\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:80:\"https://ps.w.org/advanced-booking-calendar/assets/banner-772x250.jpg?rev=1623528\";}s:11:\"banners_rtl\";a:0:{}}}}','no');
/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_postmeta`
--

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
INSERT INTO `wp_postmeta` VALUES (1,2,'_wp_page_template','default'),(2,3,'_wp_page_template','default'),(3,5,'_wp_attached_file','2018/11/espresso.jpg'),(4,5,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:2000;s:6:\"height\";i:1200;s:4:\"file\";s:20:\"2018/11/espresso.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"espresso-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"espresso-300x180.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:180;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:20:\"espresso-768x461.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:461;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:21:\"espresso-1024x614.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:614;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:20:\"espresso-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(5,5,'_starter_content_theme','twentyseventeen'),(7,6,'_wp_attached_file','2018/11/sandwich.jpg'),(8,6,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:2000;s:6:\"height\";i:1200;s:4:\"file\";s:20:\"2018/11/sandwich.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"sandwich-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"sandwich-300x180.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:180;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:20:\"sandwich-768x461.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:461;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:21:\"sandwich-1024x614.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:614;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:20:\"sandwich-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(9,6,'_starter_content_theme','twentyseventeen'),(11,7,'_wp_attached_file','2018/11/coffee.jpg'),(12,7,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:2000;s:6:\"height\";i:1200;s:4:\"file\";s:18:\"2018/11/coffee.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:18:\"coffee-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:18:\"coffee-300x180.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:180;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:18:\"coffee-768x461.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:461;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:19:\"coffee-1024x614.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:614;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:18:\"coffee-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(13,7,'_starter_content_theme','twentyseventeen'),(16,8,'_customize_changeset_uuid','f930626f-ac51-4ede-a456-434a59833609'),(17,9,'_thumbnail_id','14'),(19,9,'_customize_changeset_uuid','f930626f-ac51-4ede-a456-434a59833609'),(20,10,'_thumbnail_id','14'),(22,10,'_customize_changeset_uuid','f930626f-ac51-4ede-a456-434a59833609'),(23,11,'_thumbnail_id','14'),(25,11,'_customize_changeset_uuid','f930626f-ac51-4ede-a456-434a59833609'),(26,12,'_thumbnail_id','35'),(28,12,'_customize_changeset_uuid','f930626f-ac51-4ede-a456-434a59833609'),(30,14,'_wp_attached_file','2018/11/NewBeeHive.jpg'),(31,14,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:2016;s:6:\"height\";i:1512;s:4:\"file\";s:22:\"2018/11/NewBeeHive.jpg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"NewBeeHive-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:22:\"NewBeeHive-300x225.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:22:\"NewBeeHive-768x576.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:23:\"NewBeeHive-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:30:\"twentyseventeen-featured-image\";a:4:{s:4:\"file\";s:24:\"NewBeeHive-2000x1200.jpg\";s:5:\"width\";i:2000;s:6:\"height\";i:1200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:22:\"NewBeeHive-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(32,14,'_wp_attachment_image_alt','We are just starting'),(33,15,'_wp_attached_file','2018/11/cropped-NewBeeHive.jpg'),(34,15,'_wp_attachment_context','custom-logo'),(35,15,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:250;s:6:\"height\";i:250;s:4:\"file\";s:30:\"2018/11/cropped-NewBeeHive.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:30:\"cropped-NewBeeHive-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:30:\"cropped-NewBeeHive-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(36,16,'_wp_attached_file','2018/11/The-Dawn-...jpg'),(37,16,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:2016;s:6:\"height\";i:1512;s:4:\"file\";s:23:\"2018/11/The-Dawn-...jpg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:23:\"The-Dawn-..-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:23:\"The-Dawn-..-300x225.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:23:\"The-Dawn-..-768x576.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:24:\"The-Dawn-..-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:30:\"twentyseventeen-featured-image\";a:4:{s:4:\"file\";s:25:\"The-Dawn-..-2000x1200.jpg\";s:5:\"width\";i:2000;s:6:\"height\";i:1200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:23:\"The-Dawn-..-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(38,16,'_wp_attachment_image_alt',''),(39,17,'_wp_attached_file','2018/11/cropped-The-Dawn-...jpg'),(40,17,'_wp_attachment_context','custom-header'),(41,17,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:2000;s:6:\"height\";i:1200;s:4:\"file\";s:31:\"2018/11/cropped-The-Dawn-...jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:31:\"cropped-The-Dawn-..-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:31:\"cropped-The-Dawn-..-300x180.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:180;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:31:\"cropped-The-Dawn-..-768x461.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:461;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:32:\"cropped-The-Dawn-..-1024x614.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:614;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:31:\"cropped-The-Dawn-..-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:17:\"attachment_parent\";i:16;}'),(42,17,'_wp_attachment_custom_header_last_used_twentyseventeen','1541938592'),(43,17,'_wp_attachment_is_custom_header','twentyseventeen'),(44,23,'_menu_item_type','custom'),(45,23,'_menu_item_menu_item_parent','0'),(46,23,'_menu_item_object_id','23'),(47,23,'_menu_item_object','custom'),(48,23,'_menu_item_target',''),(49,23,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(50,23,'_menu_item_xfn',''),(51,23,'_menu_item_url','http://newbeehive.org:8080/'),(52,24,'_menu_item_type','post_type'),(53,24,'_menu_item_menu_item_parent','0'),(54,24,'_menu_item_object_id','9'),(55,24,'_menu_item_object','page'),(56,24,'_menu_item_target',''),(57,24,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(58,24,'_menu_item_xfn',''),(59,24,'_menu_item_url',''),(60,25,'_menu_item_type','post_type'),(61,25,'_menu_item_menu_item_parent','0'),(62,25,'_menu_item_object_id','11'),(63,25,'_menu_item_object','page'),(64,25,'_menu_item_target',''),(65,25,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(66,25,'_menu_item_xfn',''),(67,25,'_menu_item_url',''),(68,26,'_menu_item_type','post_type'),(69,26,'_menu_item_menu_item_parent','0'),(70,26,'_menu_item_object_id','10'),(71,26,'_menu_item_object','page'),(72,26,'_menu_item_target',''),(73,26,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(74,26,'_menu_item_xfn',''),(75,26,'_menu_item_url',''),(76,27,'_menu_item_type','custom'),(77,27,'_menu_item_menu_item_parent','0'),(78,27,'_menu_item_object_id','27'),(79,27,'_menu_item_object','custom'),(80,27,'_menu_item_target',''),(81,27,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(82,27,'_menu_item_xfn',''),(83,27,'_menu_item_url','https://www.yelp.com'),(84,28,'_menu_item_type','custom'),(85,28,'_menu_item_menu_item_parent','0'),(86,28,'_menu_item_object_id','28'),(87,28,'_menu_item_object','custom'),(88,28,'_menu_item_target',''),(89,28,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(90,28,'_menu_item_xfn',''),(91,28,'_menu_item_url','https://www.facebook.com/wordpress'),(92,29,'_menu_item_type','custom'),(93,29,'_menu_item_menu_item_parent','0'),(94,29,'_menu_item_object_id','29'),(95,29,'_menu_item_object','custom'),(96,29,'_menu_item_target',''),(97,29,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(98,29,'_menu_item_xfn',''),(99,29,'_menu_item_url','https://twitter.com/wordpress'),(100,30,'_menu_item_type','custom'),(101,30,'_menu_item_menu_item_parent','0'),(102,30,'_menu_item_object_id','30'),(103,30,'_menu_item_object','custom'),(104,30,'_menu_item_target',''),(105,30,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(106,30,'_menu_item_xfn',''),(107,30,'_menu_item_url','https://www.instagram.com/explore/tags/wordcamp/'),(108,31,'_menu_item_type','custom'),(109,31,'_menu_item_menu_item_parent','0'),(110,31,'_menu_item_object_id','31'),(111,31,'_menu_item_object','custom'),(112,31,'_menu_item_target',''),(113,31,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(114,31,'_menu_item_xfn',''),(115,31,'_menu_item_url','mailto:wordpress@example.com'),(118,8,'_edit_lock','1556475066:1'),(119,8,'_edit_last','1'),(120,12,'_edit_lock','1543692847:1'),(121,35,'_wp_attached_file','2018/11/newbee-IoT.jpg'),(122,35,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:2016;s:6:\"height\";i:1512;s:4:\"file\";s:22:\"2018/11/newbee-IoT.jpg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"newbee-IoT-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:22:\"newbee-IoT-300x225.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:22:\"newbee-IoT-768x576.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:23:\"newbee-IoT-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:30:\"twentyseventeen-featured-image\";a:4:{s:4:\"file\";s:24:\"newbee-IoT-2000x1200.jpg\";s:5:\"width\";i:2000;s:6:\"height\";i:1200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:22:\"newbee-IoT-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(123,35,'_wp_attachment_image_alt','nobody is perfect - my name is nobody'),(124,12,'_edit_last','1'),(125,9,'_edit_lock','1542661500:1'),(126,40,'_edit_last','1'),(127,40,'_edit_lock','1541955569:1'),(128,2,'_edit_lock','1542661534:1'),(129,43,'_menu_item_type','post_type'),(130,43,'_menu_item_menu_item_parent','0'),(131,43,'_menu_item_object_id','40'),(132,43,'_menu_item_object','page'),(133,43,'_menu_item_target',''),(134,43,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(135,43,'_menu_item_xfn',''),(136,43,'_menu_item_url',''),(138,44,'_wp_attached_file','2018/11/newbehave.jpg'),(139,44,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:274;s:6:\"height\";i:184;s:4:\"file\";s:21:\"2018/11/newbehave.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:21:\"newbehave-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:21:\"newbehave-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(140,40,'_thumbnail_id','14'),(143,47,'_customize_changeset_uuid','509d7e2f-6fc3-4e1b-97d0-90d2d716ea67'),(144,48,'_menu_item_type','post_type'),(145,48,'_menu_item_menu_item_parent','23'),(146,48,'_menu_item_object_id','12'),(147,48,'_menu_item_object','page'),(148,48,'_menu_item_target',''),(149,48,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(150,48,'_menu_item_xfn',''),(151,48,'_menu_item_url',''),(152,50,'_menu_item_type','post_type'),(153,50,'_menu_item_menu_item_parent','23'),(154,50,'_menu_item_object_id','40'),(155,50,'_menu_item_object','page'),(156,50,'_menu_item_target',''),(157,50,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(158,50,'_menu_item_xfn',''),(159,50,'_menu_item_url',''),(160,51,'_menu_item_type','post_type'),(161,51,'_menu_item_menu_item_parent','23'),(162,51,'_menu_item_object_id','47'),(163,51,'_menu_item_object','page'),(164,51,'_menu_item_target',''),(165,51,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(166,51,'_menu_item_xfn',''),(167,51,'_menu_item_url',''),(175,54,'_wp_attached_file','2018/11/newbehave-1.jpg'),(176,54,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:328;s:6:\"height\";i:154;s:4:\"file\";s:23:\"2018/11/newbehave-1.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:23:\"newbehave-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:23:\"newbehave-1-300x141.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:141;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:23:\"newbehave-1-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(177,55,'_wp_attached_file','2018/11/newbehave-2.jpg'),(178,55,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:229;s:6:\"height\";i:220;s:4:\"file\";s:23:\"2018/11/newbehave-2.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:23:\"newbehave-2-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:23:\"newbehave-2-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(179,47,'_edit_lock','1541955682:1'),(180,56,'_wp_attached_file','2018/11/newbiehive.jpg'),(181,56,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:299;s:6:\"height\";i:168;s:4:\"file\";s:22:\"2018/11/newbiehive.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"newbiehive-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:22:\"newbiehive-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(182,47,'_edit_last','1'),(183,47,'_thumbnail_id','14'),(184,10,'_edit_lock','1542661481:1'),(185,10,'_edit_last','1'),(186,11,'_edit_lock','1541955103:1'),(187,11,'_edit_last','1'),(188,9,'_edit_last','1'),(189,3,'_edit_lock','1541954646:1'),(202,66,'_wp_attached_file','2018/11/cropped-newbiehive.jpg'),(203,66,'_wp_attachment_context','site-icon'),(204,66,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:512;s:6:\"height\";i:512;s:4:\"file\";s:30:\"2018/11/cropped-newbiehive.jpg\";s:5:\"sizes\";a:7:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:30:\"cropped-newbiehive-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:30:\"cropped-newbiehive-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:30:\"cropped-newbiehive-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"site_icon-270\";a:4:{s:4:\"file\";s:30:\"cropped-newbiehive-270x270.jpg\";s:5:\"width\";i:270;s:6:\"height\";i:270;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"site_icon-192\";a:4:{s:4:\"file\";s:30:\"cropped-newbiehive-192x192.jpg\";s:5:\"width\";i:192;s:6:\"height\";i:192;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"site_icon-180\";a:4:{s:4:\"file\";s:30:\"cropped-newbiehive-180x180.jpg\";s:5:\"width\";i:180;s:6:\"height\";i:180;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"site_icon-32\";a:4:{s:4:\"file\";s:28:\"cropped-newbiehive-32x32.jpg\";s:5:\"width\";i:32;s:6:\"height\";i:32;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(205,67,'_wp_attached_file','2018/11/cropped-NewBeeHive-1.jpg'),(206,67,'_wp_attachment_context','site-icon'),(207,67,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:512;s:6:\"height\";i:512;s:4:\"file\";s:32:\"2018/11/cropped-NewBeeHive-1.jpg\";s:5:\"sizes\";a:7:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:32:\"cropped-NewBeeHive-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:32:\"cropped-NewBeeHive-1-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:32:\"cropped-NewBeeHive-1-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"site_icon-270\";a:4:{s:4:\"file\";s:32:\"cropped-NewBeeHive-1-270x270.jpg\";s:5:\"width\";i:270;s:6:\"height\";i:270;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"site_icon-192\";a:4:{s:4:\"file\";s:32:\"cropped-NewBeeHive-1-192x192.jpg\";s:5:\"width\";i:192;s:6:\"height\";i:192;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:13:\"site_icon-180\";a:4:{s:4:\"file\";s:32:\"cropped-NewBeeHive-1-180x180.jpg\";s:5:\"width\";i:180;s:6:\"height\";i:180;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"site_icon-32\";a:4:{s:4:\"file\";s:30:\"cropped-NewBeeHive-1-32x32.jpg\";s:5:\"width\";i:32;s:6:\"height\";i:32;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(214,71,'_wp_attached_file','2018/11/NewBeeSense.jpg'),(215,71,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:203;s:6:\"height\";i:116;s:4:\"file\";s:23:\"2018/11/NewBeeSense.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:23:\"NewBeeSense-150x116.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:116;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:23:\"NewBeeSense-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(216,77,'_edit_last','1'),(217,77,'_edit_lock','1556564970:1'),(218,87,'_menu_item_type','post_type'),(219,87,'_menu_item_menu_item_parent','0'),(220,87,'_menu_item_object_id','77'),(221,87,'_menu_item_object','page'),(222,87,'_menu_item_target',''),(223,87,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(224,87,'_menu_item_xfn',''),(225,87,'_menu_item_url','');
/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_posts`
--

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
INSERT INTO `wp_posts` VALUES (2,1,'2018-11-11 12:02:58','2018-11-11 12:02:58','This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Leicester City, XYZ employs over 2,000 people and does all kinds of awesome things for the Leicester community.</blockquote>\n\nAs a new WordPress user, you should go to <a href=\"http://newbeehive.org:8080/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!','Sample Page','','publish','closed','open','','sample-page','','','2018-11-11 12:02:58','2018-11-11 12:02:58','',0,'http://newbeehive.org:8080/?page_id=2',0,'page','',0),(3,1,'2018-11-11 12:02:58','2018-11-11 12:02:58','<h2>Who we are</h2><p>Our website address is: http://newbeehive.org:8080.</p><h2>What personal data we collect and why we collect it</h2><h3>Comments</h3><p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><p>An anonymised string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><h3>Media</h3><p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><h3>Contact forms</h3><h3>Cookies</h3><p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><p>If you have an account and you log in to this site, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><h3>Embedded content from other websites</h3><p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><h3>Analytics</h3><h2>Who we share your data with</h2><h2>How long we retain your data</h2><p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognise and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><h2>What rights you have over your data</h2><p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><h2>Where we send your data</h2><p>Visitor comments may be checked through an automated spam detection service.</p><h2>Your contact information</h2><h2>Additional information</h2><h3>How we protect your data</h3><h3>What data breach procedures we have in place</h3><h3>What third parties we receive data from</h3><h3>What automated decision making and/or profiling we do with user data</h3><h3>Industry regulatory disclosure requirements</h3>','Privacy Policy','','draft','closed','open','','privacy-policy','','','2018-11-11 12:02:58','2018-11-11 12:02:58','',0,'http://newbeehive.org:8080/?page_id=3',0,'page','',0),(5,1,'2018-11-11 12:16:31','2018-11-11 12:16:31','','Espresso','','inherit','open','closed','','espresso','','','2018-11-11 12:16:31','2018-11-11 12:16:31','',0,'http://newbeehive.org:8080/wp-content/uploads/2018/11/espresso.jpg',0,'attachment','image/jpeg',0),(6,1,'2018-11-11 12:16:31','2018-11-11 12:16:31','','Sandwich','','inherit','open','closed','','sandwich','','','2018-11-11 12:16:31','2018-11-11 12:16:31','',0,'http://newbeehive.org:8080/wp-content/uploads/2018/11/sandwich.jpg',0,'attachment','image/jpeg',0),(7,1,'2018-11-11 12:16:31','2018-11-11 12:16:31','','Coffee','','inherit','open','closed','','coffee','','','2018-11-11 12:16:31','2018-11-11 12:16:31','',0,'http://newbeehive.org:8080/wp-content/uploads/2018/11/coffee.jpg',0,'attachment','image/jpeg',0),(8,1,'2018-11-11 12:16:31','2018-11-11 12:16:31','<p style=\"text-align: center;\">For the first time in history, the physical survival of humanity depends on a radical change of heart.</p>\r\n<p style=\"text-align: right;\">Erich Fromm</p>\r\n\r\n<blockquote>Think about \"New Bee Hive\" as\r\n<ul>\r\n 	<li>New Beehive\r\n<ul>\r\n 	<li>An IoT controlled Beehive</li>\r\n 	<li>100 % Open Source</li>\r\n 	<li>On Edge or in the Cloud</li>\r\n 	<li>100 % Transparent</li>\r\n</ul>\r\n</li>\r\n 	<li></li>\r\n 	<li>New beha(e)ve\r\n<ul>\r\n 	<li>A new model of beekeeping</li>\r\n 	<li>Not just only for beekeepers</li>\r\n 	<li>A sustainable approach</li>\r\n 	<li>An economical  Eco System</li>\r\n</ul>\r\n</li>\r\n 	<li></li>\r\n 	<li>Newbi(e)e Hive\r\n<ul>\r\n 	<li>Everybody can join</li>\r\n 	<li>Everybody can participate</li>\r\n 	<li>Everybody can profit</li>\r\n 	<li>Everybody can copy</li>\r\n</ul>\r\n</li>\r\n</ul>\r\n</blockquote>\r\n&nbsp;','NEW BEE HIVE','','publish','closed','closed','','home','','','2018-11-11 15:51:50','2018-11-11 15:51:50','',0,'http://newbeehive.org:8080/?page_id=8',0,'page','',0),(9,1,'2018-11-11 12:16:31','2018-11-11 12:16:31','All about our Open Source activity (coming soon)','About','','publish','closed','closed','','about','','','2018-11-11 17:44:21','2018-11-11 16:44:21','',0,'http://newbeehive.org:8080/?page_id=9',0,'page','',0),(10,1,'2018-11-11 12:16:31','2018-11-11 12:16:31','Basic contact (under Construction)','Contact','','publish','closed','closed','','contact','','','2018-11-11 17:44:53','2018-11-11 16:44:53','',0,'http://newbeehive.org:8080/?page_id=10',0,'page','',0),(11,1,'2018-11-11 12:16:31','2018-11-11 12:16:31','','Blog','','publish','closed','closed','','blog','','','2018-11-11 17:43:18','2018-11-11 16:43:18','',0,'http://newbeehive.org:8080/?page_id=11',0,'page','',0),(12,1,'2018-11-11 12:16:31','2018-11-11 12:16:31','New<img class=\"size-full wp-image-71 alignleft\" style=\"font-size: 1rem;\" src=\"http://newbeehive.org:8080/wp-content/uploads/2018/11/NewBeeSense.jpg\" alt=\"\" width=\"203\" height=\"116\" /><span style=\"font-size: 1rem;\"> Beehives are IoT Beehives</span>\r\n\r\nVisit us at <a href=\"https://github.com/NewBeeHive\">gitub</a> and view our github <a href=\"https://newbeehive.github.io/\">website</a>.\r\n\r\n<a href=\"http://newbeehive.org:58080/habpanel/index.html#/\">Demo Sensor</a>','New Beehive','','publish','closed','closed','','newbeehive-2','','','2018-12-01 20:33:47','2018-12-01 19:33:47','',0,'http://newbeehive.org:8080/?page_id=12',0,'page','',0),(14,1,'2018-11-11 12:09:03','2018-11-11 12:09:03','Everything starts small!','NewBeeHive','The Newbe\'s Bee Hive','inherit','open','closed','','newbeehive','','','2018-11-11 12:09:47','2018-11-11 12:09:47','',0,'http://newbeehive.org:8080/wp-content/uploads/2018/11/NewBeeHive.jpg',0,'attachment','image/jpeg',0),(15,1,'2018-11-11 12:09:56','2018-11-11 12:09:56','http://newbeehive.org:8080/wp-content/uploads/2018/11/cropped-NewBeeHive.jpg','cropped-NewBeeHive.jpg','','inherit','open','closed','','cropped-newbeehive-jpg','','','2018-11-11 12:09:56','2018-11-11 12:09:56','',0,'http://newbeehive.org:8080/wp-content/uploads/2018/11/cropped-NewBeeHive.jpg',0,'attachment','image/jpeg',0),(16,1,'2018-11-11 12:14:38','2018-11-11 12:14:38','','Stay and Bee','Bee or not to bee that is the question','inherit','open','closed','','the-dawn','','','2019-04-28 18:08:36','2019-04-28 16:08:36','',77,'http://newbeehive.org:8080/wp-content/uploads/2018/11/The-Dawn-...jpg',0,'attachment','image/jpeg',0),(17,1,'2018-11-11 12:15:37','2018-11-11 12:15:37','','cropped-The-Dawn-...jpg','','inherit','open','closed','','cropped-the-dawn-jpg','','','2018-11-11 12:15:37','2018-11-11 12:15:37','',0,'http://newbeehive.org:8080/wp-content/uploads/2018/11/cropped-The-Dawn-...jpg',0,'attachment','image/jpeg',0),(18,1,'2018-11-11 12:16:31','2018-11-11 12:16:31','Welcome to your site! This is your homepage, which is what most visitors will see when they come to your site for the first time.','Home','','inherit','closed','closed','','8-revision-v1','','','2018-11-11 12:16:31','2018-11-11 12:16:31','',8,'http://newbeehive.org:8080/2018/11/11/8-revision-v1/',0,'revision','',0),(19,1,'2018-11-11 12:16:31','2018-11-11 12:16:31','You might be an artist who would like to introduce yourself and your work here or maybe you&rsquo;re a business with a mission to describe.','About','','inherit','closed','closed','','9-revision-v1','','','2018-11-11 12:16:31','2018-11-11 12:16:31','',9,'http://newbeehive.org:8080/2018/11/11/9-revision-v1/',0,'revision','',0),(20,1,'2018-11-11 12:16:31','2018-11-11 12:16:31','This is a page with some basic contact information, such as an address and phone number. You might also try a plugin to add a contact form.','Contact','','inherit','closed','closed','','10-revision-v1','','','2018-11-11 12:16:31','2018-11-11 12:16:31','',10,'http://newbeehive.org:8080/2018/11/11/10-revision-v1/',0,'revision','',0),(21,1,'2018-11-11 12:16:31','2018-11-11 12:16:31','','Blog','','inherit','closed','closed','','11-revision-v1','','','2018-11-11 12:16:31','2018-11-11 12:16:31','',11,'http://newbeehive.org:8080/2018/11/11/11-revision-v1/',0,'revision','',0),(22,1,'2018-11-11 12:16:31','2018-11-11 12:16:31','This is an example of a homepage section. Homepage sections can be any page other than the homepage itself, including the page that shows your latest blog posts.','A homepage section','','inherit','closed','closed','','12-revision-v1','','','2018-11-11 12:16:31','2018-11-11 12:16:31','',12,'http://newbeehive.org:8080/2018/11/11/12-revision-v1/',0,'revision','',0),(23,1,'2018-11-11 12:16:31','2018-11-11 12:16:31','','Home','','publish','closed','closed','','home','','','2018-11-11 12:16:31','2018-11-11 12:16:31','',0,'http://newbeehive.org:8080/2018/11/11/home/',0,'nav_menu_item','',0),(24,1,'2018-11-11 12:16:32','2018-11-11 12:16:32',' ','','','publish','closed','closed','','24','','','2018-11-11 17:20:01','2018-11-11 16:20:01','',0,'http://newbeehive.org:8080/2018/11/11/24/',6,'nav_menu_item','',0),(25,1,'2018-11-11 12:16:32','2018-11-11 12:16:32',' ','','','publish','closed','closed','','25','','','2018-11-11 17:20:01','2018-11-11 16:20:01','',0,'http://newbeehive.org:8080/2018/11/11/25/',7,'nav_menu_item','',0),(26,1,'2018-11-11 12:16:32','2018-11-11 12:16:32',' ','','','publish','closed','closed','','26','','','2018-11-11 17:20:01','2018-11-11 16:20:01','',0,'http://newbeehive.org:8080/2018/11/11/26/',8,'nav_menu_item','',0),(27,1,'2018-11-11 12:16:32','2018-11-11 12:16:32','','Yelp','','publish','closed','closed','','yelp','','','2018-11-11 16:05:18','2018-11-11 16:05:18','',0,'http://newbeehive.org:8080/2018/11/11/yelp/',1,'nav_menu_item','',0),(28,1,'2018-11-11 12:16:32','2018-11-11 12:16:32','','Facebook','','publish','closed','closed','','facebook','','','2018-11-11 16:05:18','2018-11-11 16:05:18','',0,'http://newbeehive.org:8080/2018/11/11/facebook/',2,'nav_menu_item','',0),(29,1,'2018-11-11 12:16:32','2018-11-11 12:16:32','','Twitter','','publish','closed','closed','','twitter','','','2018-11-11 16:05:18','2018-11-11 16:05:18','',0,'http://newbeehive.org:8080/2018/11/11/twitter/',3,'nav_menu_item','',0),(30,1,'2018-11-11 12:16:32','2018-11-11 12:16:32','','Instagram','','publish','closed','closed','','instagram','','','2018-11-11 16:05:18','2018-11-11 16:05:18','',0,'http://newbeehive.org:8080/2018/11/11/instagram/',4,'nav_menu_item','',0),(31,1,'2018-11-11 12:16:32','2018-11-11 12:16:32','','Email','','publish','closed','closed','','email','','','2018-11-11 16:05:18','2018-11-11 16:05:18','',0,'http://newbeehive.org:8080/2018/11/11/email/',5,'nav_menu_item','',0),(32,1,'2018-11-11 15:49:30','2018-11-11 15:49:30','<p style=\"text-align: center;\">For the first time in history, the physical survival of humanity depends on a radical change of heart.</p>\n<p style=\"text-align: right;\">Erich Fromm</p>\n\n<blockquote>Think about \"New Bee Hive\" as\n<ul>\n 	<li> \"New Beehive\"\n<ul>\n 	<li>An IoT controlled Beehive</li>\n 	<li>100 % Open Source</li>\n 	<li>On Edge or in the Cloud</li>\n 	<li>100 % Transparent - you decide</li>\n</ul>\n</li>\n 	<li></li>\n 	<li>\"New beha(e)ve\"\n<ul>\n 	<li>A new model of beekeeping</li>\n 	<li>Not just only for beekeepers</li>\n 	<li>A sustainable approach</li>\n 	<li>An economical  Eco System</li>\n</ul>\n</li>\n 	<li></li>\n 	<li>\"Newbi(e)e Hive\"\n<ul>\n 	<li>Everybody can join</li>\n 	<li>Everybody can participate</li>\n 	<li>Everybody can profit</li>\n 	<li>Everybody can copy</li>\n</ul>\n</li>\n</ul>\n</blockquote>\n&nbsp;','NEW BEE HIVE','','inherit','closed','closed','','8-autosave-v1','','','2018-11-11 15:49:30','2018-11-11 15:49:30','',8,'http://newbeehive.org:8080/2018/11/11/8-autosave-v1/',0,'revision','',0),(33,1,'2018-11-11 12:23:13','2018-11-11 12:23:13','For the first time in history, the physical survival of humanity depends on a radical change of heart.','New beha(i)ve','','inherit','closed','closed','','8-revision-v1','','','2018-11-11 12:23:13','2018-11-11 12:23:13','',8,'http://newbeehive.org:8080/2018/11/11/8-revision-v1/',0,'revision','',0),(34,1,'2018-11-28 23:12:01','2018-11-28 22:12:01','New<img class=\"size-full wp-image-71 alignleft\" style=\"font-size: 1rem;\" src=\"http://newbeehive.org:8080/wp-content/uploads/2018/11/NewBeeSense.jpg\" alt=\"\" width=\"203\" height=\"116\" /><span style=\"font-size: 1rem;\"> Beehives are IoT Beehives</span>\n\nVisit us at gitub and','New Beehive','','inherit','closed','closed','','12-autosave-v1','','','2018-11-28 23:12:01','2018-11-28 22:12:01','',12,'http://newbeehive.org:8080/2018/11/11/12-autosave-v1/',0,'revision','',0),(35,1,'2018-11-11 12:58:41','2018-11-11 12:58:41','','newbee IoT','Newbe at work - hope we get many newbees ','inherit','open','closed','','newbee-iot','','','2018-11-11 13:00:02','2018-11-11 13:00:02','',12,'http://newbeehive.org:8080/wp-content/uploads/2018/11/newbee-IoT.jpg',0,'attachment','image/jpeg',0),(36,1,'2018-11-11 13:00:28','2018-11-11 13:00:28','New Beehives are IoT Beehives','New Beehive','','inherit','closed','closed','','12-revision-v1','','','2018-11-11 13:00:28','2018-11-11 13:00:28','',12,'http://newbeehive.org:8080/2018/11/11/12-revision-v1/',0,'revision','',0),(37,1,'2018-11-11 13:07:42','2018-11-11 13:07:42','A swarm of newbi(e)e\'s my change the world','Newbi(e)es','','inherit','closed','closed','','9-autosave-v1','','','2018-11-11 13:07:42','2018-11-11 13:07:42','',9,'http://newbeehive.org:8080/2018/11/11/9-autosave-v1/',0,'revision','',0),(38,1,'2018-11-11 15:50:44','2018-11-11 15:50:44','<p style=\"text-align: center;\">For the first time in history, the physical survival of humanity depends on a radical change of heart.</p>\r\n<p style=\"text-align: right;\">Erich Fromm</p>\r\n\r\n<blockquote>Think about \"New Bee Hive\" as\r\n<ul>\r\n 	<li> \"New Beehive\"\r\n<ul>\r\n 	<li>An IoT controlled Beehive</li>\r\n 	<li>100 % Open Source</li>\r\n 	<li>On Edge or in the Cloud</li>\r\n 	<li>100 % Transparent</li>\r\n</ul>\r\n</li>\r\n 	<li></li>\r\n 	<li>\"New beha(e)ve\"\r\n<ul>\r\n 	<li>A new model of beekeeping</li>\r\n 	<li>Not just only for beekeepers</li>\r\n 	<li>A sustainable approach</li>\r\n 	<li>An economical  Eco System</li>\r\n</ul>\r\n</li>\r\n 	<li></li>\r\n 	<li>\"Newbi(e)e Hive\"\r\n<ul>\r\n 	<li>Everybody can join</li>\r\n 	<li>Everybody can participate</li>\r\n 	<li>Everybody can profit</li>\r\n 	<li>Everybody can copy</li>\r\n</ul>\r\n</li>\r\n</ul>\r\n</blockquote>\r\n&nbsp;','NEW BEE HIVE','','inherit','closed','closed','','8-revision-v1','','','2018-11-11 15:50:44','2018-11-11 15:50:44','',8,'http://newbeehive.org:8080/2018/11/11/8-revision-v1/',0,'revision','',0),(39,1,'2018-11-11 15:51:50','2018-11-11 15:51:50','<p style=\"text-align: center;\">For the first time in history, the physical survival of humanity depends on a radical change of heart.</p>\r\n<p style=\"text-align: right;\">Erich Fromm</p>\r\n\r\n<blockquote>Think about \"New Bee Hive\" as\r\n<ul>\r\n 	<li>New Beehive\r\n<ul>\r\n 	<li>An IoT controlled Beehive</li>\r\n 	<li>100 % Open Source</li>\r\n 	<li>On Edge or in the Cloud</li>\r\n 	<li>100 % Transparent</li>\r\n</ul>\r\n</li>\r\n 	<li></li>\r\n 	<li>New beha(e)ve\r\n<ul>\r\n 	<li>A new model of beekeeping</li>\r\n 	<li>Not just only for beekeepers</li>\r\n 	<li>A sustainable approach</li>\r\n 	<li>An economical  Eco System</li>\r\n</ul>\r\n</li>\r\n 	<li></li>\r\n 	<li>Newbi(e)e Hive\r\n<ul>\r\n 	<li>Everybody can join</li>\r\n 	<li>Everybody can participate</li>\r\n 	<li>Everybody can profit</li>\r\n 	<li>Everybody can copy</li>\r\n</ul>\r\n</li>\r\n</ul>\r\n</blockquote>\r\n&nbsp;','NEW BEE HIVE','','inherit','closed','closed','','8-revision-v1','','','2018-11-11 15:51:50','2018-11-11 15:51:50','',8,'http://newbeehive.org:8080/2018/11/11/8-revision-v1/',0,'revision','',0),(40,1,'2018-11-11 15:55:36','2018-11-11 15:55:36','New beha(e)v(e)iour will be fair and sustainable','New beha(i)ve','','publish','closed','closed','','new-behaive','','','2018-11-11 17:48:26','2018-11-11 16:48:26','',0,'http://newbeehive.org:8080/?page_id=40',0,'page','',0),(41,1,'2018-11-11 15:55:36','2018-11-11 15:55:36','','New beha(i)ve','','inherit','closed','closed','','40-revision-v1','','','2018-11-11 15:55:36','2018-11-11 15:55:36','',40,'http://newbeehive.org:8080/2018/11/11/40-revision-v1/',0,'revision','',0),(42,1,'2018-11-11 15:59:55','2018-11-11 15:59:55','New beha(e)veiour will be fair and sustainable','New beha(i)ve','','inherit','closed','closed','','40-revision-v1','','','2018-11-11 15:59:55','2018-11-11 15:59:55','',40,'http://newbeehive.org:8080/2018/11/11/40-revision-v1/',0,'revision','',0),(43,1,'2018-11-11 16:05:18','2018-11-11 16:05:18',' ','','','publish','closed','closed','','43','','','2018-11-11 16:05:18','2018-11-11 16:05:18','',0,'http://newbeehive.org:8080/?p=43',6,'nav_menu_item','',0),(44,1,'2018-11-11 16:13:21','2018-11-11 16:13:21','','newbehave','','inherit','open','closed','','newbehave','','','2018-11-11 16:13:21','2018-11-11 16:13:21','',40,'http://newbeehive.org:8080/wp-content/uploads/2018/11/newbehave.jpg',0,'attachment','image/jpeg',0),(47,1,'2018-11-11 17:20:01','2018-11-11 16:20:01','We are all newbies - lets build up a hive (swarm) ...','Newbi(e)e Hive','','publish','closed','closed','','newbiee-hive','','','2018-11-11 18:02:46','2018-11-11 17:02:46','',0,'http://newbeehive.org:8080/?page_id=47',0,'page','',0),(48,1,'2018-11-11 17:20:01','2018-11-11 16:20:01',' ','','','publish','closed','closed','','48','','','2018-11-11 17:20:35','2018-11-11 16:20:35','',0,'http://newbeehive.org:8080/2018/11/11/48/',1,'nav_menu_item','',0),(49,1,'2018-11-11 17:20:01','2018-11-11 16:20:01','','Newbi(e)e Hive','','inherit','closed','closed','','47-revision-v1','','','2018-11-11 17:20:01','2018-11-11 16:20:01','',47,'http://newbeehive.org:8080/2018/11/11/47-revision-v1/',0,'revision','',0),(50,1,'2018-11-11 17:20:01','2018-11-11 16:20:01',' ','','','publish','closed','closed','','50','','','2018-11-11 17:20:35','2018-11-11 16:20:35','',0,'http://newbeehive.org:8080/2018/11/11/50/',2,'nav_menu_item','',0),(51,1,'2018-11-11 17:20:01','2018-11-11 16:20:01',' ','','','publish','closed','closed','','51','','','2018-11-11 17:20:35','2018-11-11 16:20:35','',0,'http://newbeehive.org:8080/2018/11/11/51/',3,'nav_menu_item','',0),(54,1,'2018-11-11 17:27:15','2018-11-11 16:27:15','','newbehave','','inherit','open','closed','','newbehave-2','','','2018-11-11 17:27:15','2018-11-11 16:27:15','',40,'http://newbeehive.org:8080/wp-content/uploads/2018/11/newbehave-1.jpg',0,'attachment','image/jpeg',0),(55,1,'2018-11-11 17:31:24','2018-11-11 16:31:24','','newbehave','','inherit','open','closed','','newbehave-3','','','2018-11-11 17:31:24','2018-11-11 16:31:24','',40,'http://newbeehive.org:8080/wp-content/uploads/2018/11/newbehave-2.jpg',0,'attachment','image/jpeg',0),(56,1,'2018-11-11 17:40:44','2018-11-11 16:40:44','','newbiehive','','inherit','open','closed','','newbiehive','','','2018-11-11 17:40:44','2018-11-11 16:40:44','',47,'http://newbeehive.org:8080/wp-content/uploads/2018/11/newbiehive.jpg',0,'attachment','image/jpeg',0),(57,1,'2018-11-11 17:43:41','2018-11-11 16:43:41','You might be an artist who would like to introduce yourself and your work here or maybe you’re a business with a mission to describe.','About','','inherit','closed','closed','','9-revision-v1','','','2018-11-11 17:43:41','2018-11-11 16:43:41','',9,'http://newbeehive.org:8080/2018/11/11/9-revision-v1/',0,'revision','',0),(58,1,'2018-11-11 17:44:21','2018-11-11 16:44:21','All about our Open Source activity (coming soon)','About','','inherit','closed','closed','','9-revision-v1','','','2018-11-11 17:44:21','2018-11-11 16:44:21','',9,'http://newbeehive.org:8080/2018/11/11/9-revision-v1/',0,'revision','',0),(59,1,'2018-11-11 17:44:53','2018-11-11 16:44:53','Basic contact (under Construction)','Contact','','inherit','closed','closed','','10-revision-v1','','','2018-11-11 17:44:53','2018-11-11 16:44:53','',10,'http://newbeehive.org:8080/2018/11/11/10-revision-v1/',0,'revision','',0),(60,1,'2018-11-11 17:48:26','2018-11-11 16:48:26','New beha(e)v(e)iour will be fair and sustainable','New beha(i)ve','','inherit','closed','closed','','40-revision-v1','','','2018-11-11 17:48:26','2018-11-11 16:48:26','',40,'http://newbeehive.org:8080/2018/11/11/40-revision-v1/',0,'revision','',0),(63,1,'2018-11-11 18:02:46','2018-11-11 17:02:46','We are all newbies - lets build up a hive (swarm) ...','Newbi(e)e Hive','','inherit','closed','closed','','47-revision-v1','','','2018-11-11 18:02:46','2018-11-11 17:02:46','',47,'http://newbeehive.org:8080/2018/11/11/47-revision-v1/',0,'revision','',0),(66,1,'2018-11-20 21:52:32','2018-11-20 20:52:32','http://newbeehive.org:8080/wp-content/uploads/2018/11/cropped-newbiehive.jpg','cropped-newbiehive.jpg','','inherit','open','closed','','cropped-newbiehive-jpg','','','2018-11-20 21:52:32','2018-11-20 20:52:32','',0,'http://newbeehive.org:8080/wp-content/uploads/2018/11/cropped-newbiehive.jpg',0,'attachment','image/jpeg',0),(67,1,'2018-11-20 21:53:06','2018-11-20 20:53:06','http://newbeehive.org:8080/wp-content/uploads/2018/11/cropped-NewBeeHive-1.jpg','cropped-NewBeeHive-1.jpg','','inherit','open','closed','','cropped-newbeehive-1-jpg','','','2018-11-20 21:53:06','2018-11-20 20:53:06','',0,'http://newbeehive.org:8080/wp-content/uploads/2018/11/cropped-NewBeeHive-1.jpg',0,'attachment','image/jpeg',0),(71,1,'2018-11-23 01:51:11','2018-11-23 00:51:11','','NewBeeSense','','inherit','open','closed','','newbeesense','','','2018-11-23 01:51:38','2018-11-23 00:51:38','',12,'http://newbeehive.org:8080/wp-content/uploads/2018/11/NewBeeSense.jpg',0,'attachment','image/jpeg',0),(72,1,'2018-11-23 01:52:21','2018-11-23 00:52:21','New<img class=\"size-full wp-image-71 alignleft\" style=\"font-size: 1rem;\" src=\"http://newbeehive.org:8080/wp-content/uploads/2018/11/NewBeeSense.jpg\" alt=\"\" width=\"203\" height=\"116\" /><span style=\"font-size: 1rem;\"> Beehives are IoT Beehives</span>','New Beehive','','inherit','closed','closed','','12-revision-v1','','','2018-11-23 01:52:21','2018-11-23 00:52:21','',12,'http://newbeehive.org:8080/2018/11/23/12-revision-v1/',0,'revision','',0),(74,1,'2018-11-28 23:12:57','2018-11-28 22:12:57','New<img class=\"size-full wp-image-71 alignleft\" style=\"font-size: 1rem;\" src=\"http://newbeehive.org:8080/wp-content/uploads/2018/11/NewBeeSense.jpg\" alt=\"\" width=\"203\" height=\"116\" /><span style=\"font-size: 1rem;\"> Beehives are IoT Beehives</span>\r\n\r\nVisit us at <a href=\"https://github.com/NewBeeHive\">gitub</a> and view our github <a href=\"https://newbeehive.github.io/\">website</a>.','New Beehive','','inherit','closed','closed','','12-revision-v1','','','2018-11-28 23:12:57','2018-11-28 22:12:57','',12,'http://newbeehive.org:8080/2018/11/28/12-revision-v1/',0,'revision','',0),(75,1,'2018-12-01 20:33:47','2018-12-01 19:33:47','New<img class=\"size-full wp-image-71 alignleft\" style=\"font-size: 1rem;\" src=\"http://newbeehive.org:8080/wp-content/uploads/2018/11/NewBeeSense.jpg\" alt=\"\" width=\"203\" height=\"116\" /><span style=\"font-size: 1rem;\"> Beehives are IoT Beehives</span>\r\n\r\nVisit us at <a href=\"https://github.com/NewBeeHive\">gitub</a> and view our github <a href=\"https://newbeehive.github.io/\">website</a>.\r\n\r\n<a href=\"http://newbeehive.org:58080/habpanel/index.html#/\">Demo Sensor</a>','New Beehive','','inherit','closed','closed','','12-revision-v1','','','2018-12-01 20:33:47','2018-12-01 19:33:47','',12,'http://newbeehive.org:8080/2018/12/01/12-revision-v1/',0,'revision','',0),(77,1,'2019-04-28 16:27:52','2019-04-28 14:27:52','<h1 style=\"text-align: center;\"><strong>BeeHome availablity</strong></h1>\r\n<img class=\"alignleft wp-image-16\" style=\"font-weight: bold; color: #666666; font-size: 0.8125rem; font-style: italic;\" src=\"http://newbeehive.org:8080/wp-content/uploads/2018/11/The-Dawn-..-300x225.jpg\" alt=\"\" width=\"419\" height=\"314\" />\r\n<p style=\"text-align: right;\"><span style=\"text-align: right; color: #333333; font-size: 1rem;\">[abc-bookingform]</span></p>\r\n<p style=\"text-align: center;\"> [abc-single calendar=\"1\" legend=\"1\"]</p>\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;','Booking','','publish','closed','closed','','occupancy','','','2019-04-28 20:33:14','2019-04-28 18:33:14','',0,'http://newbeehive.org:8080/?page_id=77',0,'page','',0),(78,1,'2019-04-28 16:26:37','2019-04-28 14:26:37','','Occupancy','','inherit','closed','closed','','77-revision-v1','','','2019-04-28 16:26:37','2019-04-28 14:26:37','',77,'http://newbeehive.org:8080/2019/04/28/77-revision-v1/',0,'revision','',0),(79,1,'2019-04-28 16:27:52','2019-04-28 14:27:52','&lt;!-- Belegungsplan1 --!&gt;','Occupancy','','inherit','closed','closed','','77-revision-v1','','','2019-04-28 16:27:52','2019-04-28 14:27:52','',77,'http://newbeehive.org:8080/2019/04/28/77-revision-v1/',0,'revision','',0),(80,1,'2019-04-28 16:29:12','2019-04-28 14:29:12','&lt;!-- Belegungsplan1 --&gt;','Occupancy','','inherit','closed','closed','','77-revision-v1','','','2019-04-28 16:29:12','2019-04-28 14:29:12','',77,'http://newbeehive.org:8080/2019/04/28/77-revision-v1/',0,'revision','',0),(82,1,'2019-04-28 18:06:26','2019-04-28 16:06:26','[abc-overview]\r\n\r\n&nbsp;\r\n\r\n[abc-bookingform]','Occupancy','','inherit','closed','closed','','77-revision-v1','','','2019-04-28 18:06:26','2019-04-28 16:06:26','',77,'http://newbeehive.org:8080/2019/04/28/77-revision-v1/',0,'revision','',0),(85,1,'2019-04-28 18:18:05','2019-04-28 16:18:05','[caption id=\"attachment_16\" align=\"alignnone\" width=\"300\"]<img class=\"size-medium wp-image-16\" src=\"http://newbeehive.org:8080/wp-content/uploads/2018/11/The-Dawn-..-300x225.jpg\" alt=\"\" width=\"300\" height=\"225\" /> Bee or not to bee that is the question[/caption]\r\n\r\n[abc-overview]\r\n\r\n&nbsp;\r\n\r\n[abc-bookingform]','You can book the NewBeeHome here!','','inherit','closed','closed','','77-revision-v1','','','2019-04-28 18:18:05','2019-04-28 16:18:05','',77,'http://newbeehive.org:8080/2019/04/28/77-revision-v1/',0,'revision','',0),(87,1,'2019-04-28 19:45:00','2019-04-28 17:45:00',' ','','','publish','closed','closed','','87','','','2019-04-28 19:45:00','2019-04-28 17:45:00','',0,'http://newbeehive.org:8080/2019/04/28/87/',8,'nav_menu_item','',0),(89,1,'2019-04-28 19:47:46','2019-04-28 17:47:46','You can book the BeeHome here:\r\n\r\n[caption id=\"attachment_16\" align=\"alignleft\" width=\"300\"]<img class=\"size-medium wp-image-16\" src=\"http://newbeehive.org:8080/wp-content/uploads/2018/11/The-Dawn-..-300x225.jpg\" alt=\"\" width=\"300\" height=\"225\" /> Bee or not to bee that is the question[/caption]\r\n<p style=\"text-align: right;\">[abc-overview]</p>\r\n&nbsp;\r\n<p style=\"text-align: right;\">[abc-bookingform]</p>','Booking','','inherit','closed','closed','','77-revision-v1','','','2019-04-28 19:47:46','2019-04-28 17:47:46','',77,'http://newbeehive.org:8080/2019/04/28/77-revision-v1/',0,'revision','',0),(90,1,'2019-04-28 19:48:19','2019-04-28 17:48:19','<h1>You can book the BeeHome here:</h1>\r\n[caption id=\"attachment_16\" align=\"alignleft\" width=\"300\"]<img class=\"size-medium wp-image-16\" src=\"http://newbeehive.org:8080/wp-content/uploads/2018/11/The-Dawn-..-300x225.jpg\" alt=\"\" width=\"300\" height=\"225\" /> Bee or not to bee that is the question[/caption]\r\n<p style=\"text-align: right;\">[abc-overview]</p>\r\n&nbsp;\r\n<p style=\"text-align: right;\">[abc-bookingform]</p>','Booking','','inherit','closed','closed','','77-revision-v1','','','2019-04-28 19:48:19','2019-04-28 17:48:19','',77,'http://newbeehive.org:8080/2019/04/28/77-revision-v1/',0,'revision','',0),(92,1,'2019-04-28 19:49:41','2019-04-28 17:49:41','<h1>You can book the BeeHome here:</h1>\r\n[caption id=\"attachment_16\" align=\"alignleft\" width=\"300\"]<img class=\"size-medium wp-image-16\" src=\"http://newbeehive.org:8080/wp-content/uploads/2018/11/The-Dawn-..-300x225.jpg\" alt=\"\" width=\"300\" height=\"225\" /> Bee or not to bee that is the question[/caption]\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n<p style=\"text-align: left;\">[abc-overview]</p>\r\n<p style=\"text-align: left;\">[abc-bookingform]</p>','Booking','','inherit','closed','closed','','77-revision-v1','','','2019-04-28 19:49:41','2019-04-28 17:49:41','',77,'http://newbeehive.org:8080/2019/04/28/77-revision-v1/',0,'revision','',0),(93,1,'2019-04-28 19:50:14','2019-04-28 17:50:14','<h1><strong>You can book the BeeHome here</strong></h1>\r\n[caption id=\"attachment_16\" align=\"alignleft\" width=\"300\"]<img class=\"size-medium wp-image-16\" src=\"http://newbeehive.org:8080/wp-content/uploads/2018/11/The-Dawn-..-300x225.jpg\" alt=\"\" width=\"300\" height=\"225\" /> Bee or not to bee that is the question[/caption]\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n<p style=\"text-align: left;\">[abc-overview]</p>\r\n<p style=\"text-align: left;\">[abc-bookingform]</p>','Booking','','inherit','closed','closed','','77-revision-v1','','','2019-04-28 19:50:14','2019-04-28 17:50:14','',77,'http://newbeehive.org:8080/2019/04/28/77-revision-v1/',0,'revision','',0),(94,1,'2019-04-28 19:50:41','2019-04-28 17:50:41','<h1><strong>You can book the BeeHome here</strong></h1>\r\n[caption id=\"attachment_16\" align=\"alignleft\" width=\"300\"]<img class=\"size-medium wp-image-16\" src=\"http://newbeehive.org:8080/wp-content/uploads/2018/11/The-Dawn-..-300x225.jpg\" alt=\"\" width=\"300\" height=\"225\" /> Bee or not to bee that is the question[/caption]\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n<p style=\"text-align: left;\">[abc-overview]</p>\r\n&nbsp;\r\n<p style=\"text-align: left;\">[abc-bookingform]</p>','Booking','','inherit','closed','closed','','77-revision-v1','','','2019-04-28 19:50:41','2019-04-28 17:50:41','',77,'http://newbeehive.org:8080/2019/04/28/77-revision-v1/',0,'revision','',0),(99,1,'2019-04-28 19:59:26','2019-04-28 17:59:26','<h1><strong>You can book the BeeHome here</strong></h1>\r\n[caption id=\"attachment_16\" align=\"alignleft\" width=\"300\"]<img class=\"size-medium wp-image-16\" src=\"http://newbeehive.org:8080/wp-content/uploads/2018/11/The-Dawn-..-300x225.jpg\" alt=\"\" width=\"300\" height=\"225\" /> Bee or not to bee that is the question[/caption]\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n<p style=\"text-align: left;\">[abc-single calendar=\"1\" legend=\"1\"]</p>\r\n&nbsp;\r\n<p style=\"text-align: left;\">[abc-bookingform]</p>\r\n&nbsp;\r\n\r\n&nbsp;','Booking','','inherit','closed','closed','','77-revision-v1','','','2019-04-28 19:59:26','2019-04-28 17:59:26','',77,'http://newbeehive.org:8080/2019/04/28/77-revision-v1/',0,'revision','',0),(102,1,'2019-04-28 20:09:28','2019-04-28 18:09:28','<h1 style=\"text-align: center;\"><strong>BeeHome availablity</strong></h1>\r\n<img class=\"wp-image-16 alignleft\" style=\"font-weight: bold; color: #666666; font-size: 0.8125rem; font-style: italic;\" src=\"http://newbeehive.org:8080/wp-content/uploads/2018/11/The-Dawn-..-300x225.jpg\" alt=\"\" width=\"377\" height=\"283\" />\r\n<p style=\"text-align: right;\"><span style=\"text-align: right; color: #333333; font-size: 1rem;\">[abc-bookingform]</span></p>\r\n\r\nBee or not to bee that is the question&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n<p style=\"text-align: center;\">[abc-single calendar=\"1\" legend=\"1\"]</p>\r\n&nbsp;\r\n<p style=\"text-align: left;\"></p>\r\n&nbsp;\r\n\r\n&nbsp;','Booking','','inherit','closed','closed','','77-revision-v1','','','2019-04-28 20:09:28','2019-04-28 18:09:28','',77,'http://newbeehive.org:8080/2019/04/28/77-revision-v1/',0,'revision','',0),(103,1,'2019-04-28 20:11:33','2019-04-28 18:11:33','<h1 style=\"text-align: center;\"><strong>BeeHome availablity</strong></h1>\r\n<img class=\"alignleft wp-image-16\" style=\"font-weight: bold; color: #666666; font-size: 0.8125rem; font-style: italic;\" src=\"http://newbeehive.org:8080/wp-content/uploads/2018/11/The-Dawn-..-300x225.jpg\" alt=\"\" width=\"419\" height=\"314\" />\r\n<p style=\"text-align: right;\"><span style=\"text-align: right; color: #333333; font-size: 1rem;\">[abc-bookingform]</span></p>\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n<p style=\"text-align: center;\">[abc-single calendar=\"1\" legend=\"1\"]</p>\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;','Booking','','inherit','closed','closed','','77-revision-v1','','','2019-04-28 20:11:33','2019-04-28 18:11:33','',77,'http://newbeehive.org:8080/2019/04/28/77-revision-v1/',0,'revision','',0),(104,1,'2019-04-28 20:12:15','2019-04-28 18:12:15','<h1 style=\"text-align: center;\"><strong>BeeHome availablity</strong></h1>\r\n<img class=\"alignleft wp-image-16\" style=\"font-weight: bold; color: #666666; font-size: 0.8125rem; font-style: italic;\" src=\"http://newbeehive.org:8080/wp-content/uploads/2018/11/The-Dawn-..-300x225.jpg\" alt=\"\" width=\"419\" height=\"314\" />\r\n<p style=\"text-align: right;\"><span style=\"text-align: right; color: #333333; font-size: 1rem;\">[abc-bookingform]</span></p>\r\n<p style=\"text-align: center;\">[abc-single calendar=\"1\" legend=\"1\"]</p>\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;','Booking','','inherit','closed','closed','','77-revision-v1','','','2019-04-28 20:12:15','2019-04-28 18:12:15','',77,'http://newbeehive.org:8080/2019/04/28/77-revision-v1/',0,'revision','',0),(106,1,'2019-04-28 20:33:14','2019-04-28 18:33:14','<h1 style=\"text-align: center;\"><strong>BeeHome availablity</strong></h1>\r\n<img class=\"alignleft wp-image-16\" style=\"font-weight: bold; color: #666666; font-size: 0.8125rem; font-style: italic;\" src=\"http://newbeehive.org:8080/wp-content/uploads/2018/11/The-Dawn-..-300x225.jpg\" alt=\"\" width=\"419\" height=\"314\" />\r\n<p style=\"text-align: right;\"><span style=\"text-align: right; color: #333333; font-size: 1rem;\">[abc-bookingform]</span></p>\r\n<p style=\"text-align: center;\"> [abc-single calendar=\"1\" legend=\"1\"]</p>\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;','Booking','','inherit','closed','closed','','77-revision-v1','','','2019-04-28 20:33:14','2019-04-28 18:33:14','',77,'http://newbeehive.org:8080/2019/04/28/77-revision-v1/',0,'revision','',0);
/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_relationships`
--

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;
INSERT INTO `wp_term_relationships` VALUES (23,2,0),(24,2,0),(25,2,0),(26,2,0),(27,3,0),(28,3,0),(29,3,0),(30,3,0),(31,3,0),(43,3,0),(48,2,0),(50,2,0),(51,2,0),(87,2,0);
/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_taxonomy`
--

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` VALUES (1,1,'category','',0,0),(2,2,'nav_menu','',0,8),(3,3,'nav_menu','',0,6);
/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_termmeta`
--

DROP TABLE IF EXISTS `wp_termmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_termmeta`
--

LOCK TABLES `wp_termmeta` WRITE;
/*!40000 ALTER TABLE `wp_termmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_termmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_terms`
--

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
INSERT INTO `wp_terms` VALUES (1,'Uncategorised','uncategorised',0),(2,'Top Menu','top-menu',0),(3,'Social Links Menu','social-links-menu',0);
/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_usermeta`
--

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;
INSERT INTO `wp_usermeta` VALUES (1,1,'nickname','Markus Wild'),(2,1,'first_name',''),(3,1,'last_name',''),(4,1,'description',''),(5,1,'rich_editing','true'),(6,1,'syntax_highlighting','true'),(7,1,'comment_shortcuts','false'),(8,1,'admin_color','fresh'),(9,1,'use_ssl','0'),(10,1,'show_admin_bar_front','true'),(11,1,'locale',''),(12,1,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}'),(13,1,'wp_user_level','10'),(14,1,'dismissed_wp_pointers','wp496_privacy,theme_editor_notice'),(15,1,'show_welcome_panel','1'),(17,1,'wp_dashboard_quick_press_last_post_id','107'),(18,1,'community-events-location','a:1:{s:2:\"ip\";s:12:\"80.143.188.0\";}'),(19,1,'wp_user-settings','libraryContent=browse&mfold=o&hidetb=0&editor=tinymce'),(20,1,'wp_user-settings-time','1541952886'),(21,1,'nav_menu_recently_edited','3'),(22,1,'managenav-menuscolumnshidden','a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),(23,1,'metaboxhidden_nav-menus','a:2:{i:0;s:12:\"add-post_tag\";i:1;s:15:\"add-post_format\";}'),(24,1,'closedpostboxes_page','a:0:{}'),(25,1,'metaboxhidden_page','a:6:{i:0;s:12:\"revisionsdiv\";i:1;s:10:\"postcustom\";i:2;s:16:\"commentstatusdiv\";i:3;s:11:\"commentsdiv\";i:4;s:7:\"slugdiv\";i:5;s:9:\"authordiv\";}'),(26,1,'session_tokens','a:1:{s:64:\"785c0cdd7b2e625b29fca6ec9bbd062d1549f871a81d44c0933d9b8a8b3e9e39\";a:4:{s:10:\"expiration\";i:1558956669;s:2:\"ip\";s:14:\"80.143.188.146\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36\";s:5:\"login\";i:1558783869;}}');
/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_users`
--

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;
INSERT INTO `wp_users` VALUES (1,'Markus Wild','$P$B6MzoKdK/9q6aWZSCZxbjWuXJ9Z48o1','markus-wild','Markus.Wild@live.de','','2018-11-11 12:02:57','1541955597:$P$BHsYeIlspCwujaJI2mUBILewG3My/u1',0,'Markus Wild');
/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-03 14:36:30
