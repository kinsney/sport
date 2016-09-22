-- MySQL dump 10.13  Distrib 5.6.30, for Linux (x86_64)
--
-- Host: localhost    Database: sport
-- ------------------------------------------------------
-- Server version	5.6.30

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
-- Table structure for table `advertisement_advertisement`
--

DROP TABLE IF EXISTS `advertisement_advertisement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertisement_advertisement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `image` varchar(100) NOT NULL,
  `link` varchar(200) NOT NULL,
  `position` varchar(32) NOT NULL,
  `show` tinyint(1) NOT NULL,
  `order` smallint(6) NOT NULL,
  `text` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement_advertisement`
--

LOCK TABLES `advertisement_advertisement` WRITE;
/*!40000 ALTER TABLE `advertisement_advertisement` DISABLE KEYS */;
INSERT INTO `advertisement_advertisement` VALUES (1,'欢迎各位单车旅行爱好者加入骑客租车！','advertisement/banner_Cc2BrM0.jpg','http://www.baidu.com','carousel',1,0,'123');
/*!40000 ALTER TABLE `advertisement_advertisement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can change config',1,'change_config'),(2,'Can add log entry',2,'add_logentry'),(3,'Can change log entry',2,'change_logentry'),(4,'Can delete log entry',2,'delete_logentry'),(5,'Can add permission',3,'add_permission'),(6,'Can change permission',3,'change_permission'),(7,'Can delete permission',3,'delete_permission'),(8,'Can add group',4,'add_group'),(9,'Can change group',4,'change_group'),(10,'Can delete group',4,'delete_group'),(11,'Can add user',5,'add_user'),(12,'Can change user',5,'change_user'),(13,'Can delete user',5,'delete_user'),(14,'Can add content type',6,'add_contenttype'),(15,'Can change content type',6,'change_contenttype'),(16,'Can delete content type',6,'delete_contenttype'),(17,'Can add session',7,'add_session'),(18,'Can change session',7,'change_session'),(19,'Can delete session',7,'delete_session'),(20,'Can add constance',8,'add_constance'),(21,'Can change constance',8,'change_constance'),(22,'Can delete constance',8,'delete_constance'),(23,'Can add 品牌',9,'add_brand'),(24,'Can change 品牌',9,'change_brand'),(25,'Can delete 品牌',9,'delete_brand'),(26,'Can add 分类',10,'add_category'),(27,'Can change 分类',10,'change_category'),(28,'Can delete 分类',10,'delete_category'),(29,'Can add 型号',11,'add_version'),(30,'Can change 型号',11,'change_version'),(31,'Can delete 型号',11,'delete_version'),(32,'Can add 属性',12,'add_attribute'),(33,'Can change 属性',12,'change_attribute'),(34,'Can delete 属性',12,'delete_attribute'),(35,'Can add 地理位置',13,'add_address'),(36,'Can change 地理位置',13,'change_address'),(37,'Can delete 地理位置',13,'delete_address'),(38,'Can add 自行车',14,'add_bike'),(39,'Can change 自行车',14,'change_bike'),(40,'Can delete 自行车',14,'delete_bike'),(41,'Can add 缩略图',15,'add_photo'),(42,'Can change 缩略图',15,'change_photo'),(43,'Can delete 缩略图',15,'delete_photo'),(44,'Can add order',16,'add_order'),(45,'Can change order',16,'change_order'),(46,'Can delete order',16,'delete_order'),(47,'Can add 省级行政区',17,'add_province'),(48,'Can change 省级行政区',17,'change_province'),(49,'Can delete 省级行政区',17,'delete_province'),(50,'Can add 市级行政区',18,'add_city'),(51,'Can change 市级行政区',18,'change_city'),(52,'Can delete 市级行政区',18,'delete_city'),(53,'Can add 学校',19,'add_university'),(54,'Can change 学校',19,'change_university'),(55,'Can delete 学校',19,'delete_university'),(56,'Can add 扩展用户',20,'add_participator'),(57,'Can change 扩展用户',20,'change_participator'),(58,'Can delete 扩展用户',20,'delete_participator'),(59,'Can add 验证附件类别',21,'add_verifycategory'),(60,'Can change 验证附件类别',21,'change_verifycategory'),(61,'Can delete 验证附件类别',21,'delete_verifycategory'),(62,'Can add 验证附件',22,'add_verifyattachment'),(63,'Can change 验证附件',22,'change_verifyattachment'),(64,'Can delete 验证附件',22,'delete_verifyattachment'),(65,'查看验证文件',22,'view_owner_attachment'),(66,'Can add 广告',23,'add_advertisement'),(67,'Can change 广告',23,'change_advertisement'),(68,'Can delete 广告',23,'delete_advertisement'),(69,'Can add 消息',24,'add_message'),(70,'Can change 消息',24,'change_message'),(71,'Can delete 消息',24,'delete_message'),(72,'Can add ip record',25,'add_iprecord'),(73,'Can change ip record',25,'change_iprecord'),(74,'Can delete ip record',25,'delete_iprecord'),(75,'Can add 验证码',26,'add_verificationcode'),(76,'Can change 验证码',26,'change_verificationcode'),(77,'Can delete 验证码',26,'delete_verificationcode'),(78,'Can add comments',27,'add_comments'),(79,'Can change comments',27,'change_comments'),(80,'Can delete comments',27,'delete_comments');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$24000$LeLk1ZWTl8JD$k5UoDRf15QZQNftccVwqTkP2zbV0EsmT/FzAYtNtx2I=','2016-06-19 20:01:33.859142',1,'kinsney','','','584252009@qq.com',1,1,'2016-04-10 08:52:14.114797'),(2,'pbkdf2_sha256$24000$2iHy7HSGpNxj$LwNRX2VqB1gmwPP637HUShNrosc6h4r7jc5eCyzg1Oc=','2016-06-19 20:03:04.591950',0,'17801034941','','','',0,1,'2016-04-10 08:58:52.599983'),(3,'pbkdf2_sha256$24000$nhZgoBLsVwMx$vX6Cf1tz1sz9Vpga01X0UsIRGcr3f6WgkY023KzRhGg=','2016-04-22 20:22:12.174772',0,'13577777777','','','',0,1,'2016-04-12 01:41:54.144577'),(4,'pbkdf2_sha256$24000$SFZPlYLgPgbr$aUPHOlAkHlnZXX5RYkIMejT4eZTgyV2K7cRCi23iXwc=','2016-04-19 18:57:12.696820',0,'13521913746','','','',0,1,'2016-04-19 18:57:12.556476'),(5,'pbkdf2_sha256$24000$sp97z96Iq48E$SxrZOcDML8Zhp+b3ADzDgwhPZDbsQVOozZAt/7hQuio=','2016-06-19 20:03:59.727293',0,'15117928812','','','',0,1,'2016-04-20 15:42:50.806944');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bike_address`
--

DROP TABLE IF EXISTS `bike_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bike_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `longitude` varchar(20) NOT NULL,
  `latitude` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bike_address`
--

LOCK TABLES `bike_address` WRITE;
/*!40000 ALTER TABLE `bike_address` DISABLE KEYS */;
INSERT INTO `bike_address` VALUES (19,'学十462','116.371175','39.970876'),(20,'液晶大楼','116.328999','40.004385'),(21,'能科楼','116.330724','40.003556'),(22,'学二十九','116.366674','39.967876'),(23,'学十公寓','121.58595','38.949075'),(24,'12312313','116.360501','39.968762'),(25,'12312313','116.360501','39.968762'),(26,'12312313','116.367165','39.968154');
/*!40000 ALTER TABLE `bike_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bike_attribute`
--

DROP TABLE IF EXISTS `bike_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bike_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` int(11) NOT NULL,
  `speedChange` varchar(10) NOT NULL,
  `wheelSize` varchar(10) NOT NULL,
  `brakeType` varchar(10) NOT NULL,
  `handlebar` varchar(10) NOT NULL,
  `suspension` varchar(10) NOT NULL,
  `quickRelease` tinyint(1) NOT NULL,
  `version_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bike_attribute_316e8552` (`version_id`),
  CONSTRAINT `bike_attribute_version_id_81172b52_fk_bike_version_name` FOREIGN KEY (`version_id`) REFERENCES `bike_version` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bike_attribute`
--

LOCK TABLES `bike_attribute` WRITE;
/*!40000 ALTER TABLE `bike_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `bike_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bike_bike`
--

DROP TABLE IF EXISTS `bike_bike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bike_bike` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `status` varchar(10) NOT NULL,
  `hourRent` decimal(6,2) NOT NULL,
  `dayRent` decimal(6,2) NOT NULL,
  `weekRent` decimal(6,2) NOT NULL,
  `deposit` int(11) DEFAULT NULL,
  `studentDeposit` tinyint(1) NOT NULL,
  `pledge` varchar(10) DEFAULT NULL,
  `suitHeight` varchar(10) DEFAULT NULL,
  `howOld` int(11) DEFAULT NULL,
  `sexualFix` varchar(15) DEFAULT NULL,
  `equipment` varchar(100) DEFAULT NULL,
  `maxDuration` bigint(20) DEFAULT NULL,
  `minDuration` bigint(20) DEFAULT NULL,
  `added` datetime(6) NOT NULL,
  `beginTime` datetime(6) DEFAULT NULL,
  `endTime` datetime(6) DEFAULT NULL,
  `description` longtext,
  `address_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `version_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bike_bike_address_id_00ab8ddf_fk_bike_address_id` (`address_id`),
  KEY `bike_bike_5e7b1936` (`owner_id`),
  KEY `bike_bike_316e8552` (`version_id`),
  CONSTRAINT `bike_bike_address_id_00ab8ddf_fk_bike_address_id` FOREIGN KEY (`address_id`) REFERENCES `bike_address` (`id`),
  CONSTRAINT `bike_bike_owner_id_4c9e71aa_fk_participator_participator_user_id` FOREIGN KEY (`owner_id`) REFERENCES `participator_participator` (`user_id`),
  CONSTRAINT `bike_bike_version_id_5a4b36af_fk_bike_version_name` FOREIGN KEY (`version_id`) REFERENCES `bike_version` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bike_bike`
--

LOCK TABLES `bike_bike` WRITE;
/*!40000 ALTER TABLE `bike_bike` DISABLE KEYS */;
INSERT INTO `bike_bike` VALUES (19,'北邮学十奔驰','181655246',1,'deleted',12.00,50.00,300.00,200,1,'noPledge','155以下',70,'man','phoneHolder,kettleHolder,backseat',604800000000,28800000000,'2016-04-11 04:35:41.845014',NULL,NULL,'这车特别屌',19,2,'x1'),(20,'北邮大表哥','286644956',1,'deleted',30.00,200.00,1000.00,0,1,'noPledge','165-175',100,'female','glove,phoneHolder,kettleHolder',604800000000,28800000000,'2016-04-12 01:35:24.650724',NULL,NULL,'',20,2,'x2'),(21,'清华大学大表哥','953772504',1,'Renting',20.00,40.00,300.00,0,0,'campusId','165-175',90,'heterosexual','helmet,glove,phoneHolder',604800000000,28800000000,'2016-04-12 01:43:17.247097',NULL,NULL,'就是屌',21,3,'a4'),(22,'北师小表哥','1460806493008',1,'Renting',133.00,0.10,133.00,0,1,'campusId','155以下',70,'heterosexual','glove,phoneHolder,kettleHolder',604800000000,28800000000,'2016-04-16 11:34:54.891942',NULL,NULL,'123333',22,2,'a3'),(23,'北师小表哥2','0146080866975',1,'Renting',12.00,33.00,444.00,0,1,'campusId','155以下',70,'female','helmet,phoneHolder',604800000000,28800000000,'2016-04-16 12:11:07.525331',NULL,NULL,'123',23,2,'a4'),(24,'电磁阀控制柜','0014640091541',1,'checking',12.00,12.00,12.00,200,1,'campusId','155以下',70,'heterosexual','phoneHolder,kettleHolder,bag',604800000000,28800000000,'2016-05-23 21:12:36.276493',NULL,NULL,'123123',26,2,'x1');
/*!40000 ALTER TABLE `bike_bike` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bike_brand`
--

DROP TABLE IF EXISTS `bike_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bike_brand` (
  `name` varchar(32) NOT NULL,
  `thumbnail` varchar(128) NOT NULL,
  `order` smallint(6) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bike_brand`
--

LOCK TABLES `bike_brand` WRITE;
/*!40000 ALTER TABLE `bike_brand` DISABLE KEYS */;
INSERT INTO `bike_brand` VALUES ('刘德华','brand/iamowner.png',0),('结案提','brand/bannersmall.jpg',0);
/*!40000 ALTER TABLE `bike_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bike_category`
--

DROP TABLE IF EXISTS `bike_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bike_category` (
  `name` varchar(32) NOT NULL,
  `order` smallint(6) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bike_category`
--

LOCK TABLES `bike_category` WRITE;
/*!40000 ALTER TABLE `bike_category` DISABLE KEYS */;
INSERT INTO `bike_category` VALUES ('公路车',0),('其他',0),('山地车',0),('折叠车',0),('死飞',0);
/*!40000 ALTER TABLE `bike_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bike_photo`
--

DROP TABLE IF EXISTS `bike_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bike_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(10) NOT NULL,
  `content` varchar(100) NOT NULL,
  `bike_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bike_photo_bike_id_fd12850f_fk_bike_bike_id` (`bike_id`),
  CONSTRAINT `bike_photo_bike_id_fd12850f_fk_bike_bike_id` FOREIGN KEY (`bike_id`) REFERENCES `bike_bike` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bike_photo`
--

LOCK TABLES `bike_photo` WRITE;
/*!40000 ALTER TABLE `bike_photo` DISABLE KEYS */;
INSERT INTO `bike_photo` VALUES (6,'缩略图1','user/17801034941/bigthumb2pZDP613121918152_G3fedT0.jpeg',19),(7,'缩略图2','user/17801034941/bigthumb2pZDP613121918152_po1kfma.jpeg',19),(8,'缩略图1','user/17801034941/bigthumbaRXkO217718300440.jpeg',20),(9,'缩略图2','user/17801034941/bigthumbaRXkO217718300440_VPQM5mr.jpeg',20),(10,'缩略图1','user/13577777777/bigthumb9xHK2d13269489022.jpeg',21),(11,'缩略图2','user/13577777777/bigthumb9xHK2d13269489022_zW2bRmO.jpeg',21),(12,'缩略图1','user/17801034941/banner_Cc2BrM0.jpg',22),(13,'缩略图1','user/17801034941/bigthumbdHFK6Z13121919937.jpeg',23),(14,'缩略图1','user/17801034941/1.jpg',24);
/*!40000 ALTER TABLE `bike_photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bike_version`
--

DROP TABLE IF EXISTS `bike_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bike_version` (
  `name` varchar(32) NOT NULL,
  `order` smallint(6) NOT NULL,
  `brand_id` varchar(32) NOT NULL,
  `category_id` varchar(32) NOT NULL,
  PRIMARY KEY (`name`),
  KEY `bike_version_brand_id_25acd84c_fk_bike_brand_name` (`brand_id`),
  KEY `bike_version_category_id_7bfae59d_fk_bike_category_name` (`category_id`),
  CONSTRAINT `bike_version_brand_id_25acd84c_fk_bike_brand_name` FOREIGN KEY (`brand_id`) REFERENCES `bike_brand` (`name`),
  CONSTRAINT `bike_version_category_id_7bfae59d_fk_bike_category_name` FOREIGN KEY (`category_id`) REFERENCES `bike_category` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bike_version`
--

LOCK TABLES `bike_version` WRITE;
/*!40000 ALTER TABLE `bike_version` DISABLE KEYS */;
INSERT INTO `bike_version` VALUES ('a3',0,'结案提','公路车'),('a4',0,'结案提','山地车'),('a5',0,'结案提','其他'),('x1',0,'刘德华','其他'),('x2',0,'刘德华','死飞'),('x3',0,'刘德华','折叠车');
/*!40000 ALTER TABLE `bike_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `constance_config`
--

DROP TABLE IF EXISTS `constance_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `constance_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constance_config`
--

LOCK TABLES `constance_config` WRITE;
/*!40000 ALTER TABLE `constance_config` DISABLE KEYS */;
INSERT INTO `constance_config` VALUES (1,'IPMessageLimit','gAJLZC4='),(2,'VerificationCodeLength','gAJLBi4='),(3,'VerificationCodeTemplate','gAJYCAAAAOOAkCVz44CRcQAu'),(4,'VerificationAvailableMinutes','gAJLBS4='),(5,'bikeNumberLength','gAJLDS4='),(6,'orderNumberLength','gAJLDS4='),(7,'withdrawRate','gAJHP7mZmZmZmZou');
/*!40000 ALTER TABLE `constance_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-04-10 08:52:51.323078','1','欢迎各位单车旅行爱好者加入骑客租车！',1,'Added.',23,1),(2,'2016-04-10 08:54:07.623273','山地车','山地车',1,'Added.',10,1),(3,'2016-04-10 08:54:14.107987','公路车','公路车',1,'Added.',10,1),(4,'2016-04-10 08:54:18.372169','折叠车','折叠车',1,'Added.',10,1),(5,'2016-04-10 08:54:21.864219','死飞','死飞',1,'Added.',10,1),(6,'2016-04-10 08:54:24.581625','其他','其他',1,'Added.',10,1),(7,'2016-04-10 08:54:47.072691','结案提','结案提',1,'Added. 已添加 型号 \"a3\". 已添加 型号 \"a4\". 已添加 型号 \"a5\".',9,1),(8,'2016-04-10 08:55:01.694412','刘德华','刘德华',1,'Added. 已添加 型号 \"x1\".',9,1),(9,'2016-04-10 08:55:09.618207','刘德华','刘德华',2,'已添加 型号 \"x2\".',9,1),(10,'2016-04-10 08:55:17.364639','刘德华','刘德华',2,'已添加 型号 \"x3\".',9,1),(11,'2016-04-10 08:55:42.442288','北京市','北京市',1,'Added. 已添加 市级行政区 \"北京市\".',17,1),(12,'2016-04-10 08:55:56.311164','辽宁省','辽宁省',1,'Added. 已添加 市级行政区 \"大连市\".',17,1),(13,'2016-04-10 08:56:06.284303','辽宁省','辽宁省',2,'已添加 市级行政区 \"瓦房店市\".',17,1),(14,'2016-04-10 08:56:34.188541','北京市','北京市',2,'已添加 学校 \"北京邮电大学\". 已添加 学校 \"清华大学\". 已添加 学校 \"北京大学\".',18,1),(15,'2016-04-10 08:56:48.763335','大连市','大连市',2,'已添加 学校 \"大连理工大学\". 已添加 学校 \"大连师范大学\".',18,1),(16,'2016-04-10 08:57:00.744354','瓦房店市','瓦房店市',3,'',18,1),(17,'2016-04-10 08:57:24.290132','身份证前面','身份证前面',1,'Added.',21,1),(18,'2016-04-10 08:57:36.299601','身份证后面','身份证后面',1,'Added.',21,1),(19,'2016-04-10 08:57:56.314653','学生证','学生证',1,'Added.',21,1),(20,'2016-04-10 09:16:03.296350','14','123',3,'',14,1),(21,'2016-04-10 09:16:03.298617','13','123',3,'',14,1),(22,'2016-04-10 09:16:03.300136','12','123',3,'',14,1),(23,'2016-04-10 09:16:03.301504','11','123',3,'',14,1),(24,'2016-04-10 09:16:03.302557','10','123',3,'',14,1),(25,'2016-04-10 09:16:03.303522','9','123',3,'',14,1),(26,'2016-04-10 09:16:03.304443','8','123',3,'',14,1),(27,'2016-04-10 09:16:03.305455','7','123',3,'',14,1),(28,'2016-04-10 09:16:03.306359','6','123',3,'',14,1),(29,'2016-04-10 09:16:03.307386','5','123',3,'',14,1),(30,'2016-04-10 09:16:03.308237','4','123',3,'',14,1),(31,'2016-04-10 09:16:03.309012','3','123',3,'',14,1),(32,'2016-04-10 09:16:03.309757','2','123',3,'',14,1),(33,'2016-04-10 09:16:03.310524','1','123',3,'',14,1),(34,'2016-04-10 09:24:26.329614','15','123',3,'',14,1),(35,'2016-04-10 09:25:34.864933','15','123',3,'',13,1),(36,'2016-04-10 09:25:34.866845','14','123',3,'',13,1),(37,'2016-04-10 09:25:34.868223','13','123',3,'',13,1),(38,'2016-04-10 09:25:34.869545','12','123',3,'',13,1),(39,'2016-04-10 09:25:34.870632','11','123',3,'',13,1),(40,'2016-04-10 09:25:34.871654','10','123',3,'',13,1),(41,'2016-04-10 09:25:34.872707','9','123',3,'',13,1),(42,'2016-04-10 09:25:34.873704','8','123',3,'',13,1),(43,'2016-04-10 09:25:34.874838','7','123',3,'',13,1),(44,'2016-04-10 09:25:34.875821','6','123',3,'',13,1),(45,'2016-04-10 09:25:34.876829','5','123',3,'',13,1),(46,'2016-04-10 09:25:34.877864','4','123',3,'',13,1),(47,'2016-04-10 09:25:34.878701','3','123',3,'',13,1),(48,'2016-04-10 09:25:34.879499','2','123',3,'',13,1),(49,'2016-04-10 09:25:34.880277','1','123',3,'',13,1),(50,'2016-04-10 13:40:09.222703','16','北邮奔驰',2,'已修改 howOld 。',14,1),(51,'2016-04-10 13:40:35.851141','16','北邮奔驰',3,'',14,1),(52,'2016-04-10 14:42:15.984960','17','北邮学十奔驰',3,'',14,1),(53,'2016-04-11 02:19:38.128830','17','学十462',3,'',13,1),(54,'2016-04-11 02:19:38.131530','16','学十462',3,'',13,1),(55,'2016-04-11 04:13:50.859802','18','北邮学十奔驰',3,'',14,1),(56,'2016-04-12 01:00:16.526737','19','北邮学十奔驰',2,'已修改 status, howOld, beginTime 和 endTime 。',14,1),(57,'2016-04-12 01:00:40.593595','19','北邮学十奔驰',2,'没有字段被修改。',14,1),(58,'2016-04-12 01:40:51.567955','20','清华大学大表哥',2,'已修改 status 。',14,1),(59,'2016-04-12 01:43:49.186960','21','清华大学大表哥',2,'已修改 status 。',14,1),(60,'2016-04-14 14:16:38.506707','4','146064258766019',3,'',16,1),(61,'2016-04-14 14:16:42.597534','5','146064261193852',3,'',16,1),(62,'2016-04-14 14:16:42.601754','6','146064273171094',3,'',16,1),(63,'2016-04-14 14:19:51.520655','7','146064276085078',2,'没有字段被修改。',16,1),(64,'2016-04-15 05:21:25.571587','20','北邮大表哥',2,'已修改 name 。',14,1),(65,'2016-04-15 08:16:26.959348','8','146070186982995',3,'',16,1),(66,'2016-04-16 04:11:06.378710','9','146077487868372',3,'',16,1),(67,'2016-04-16 04:12:41.415684','10','146077488867372',2,'已修改 equipments 。',16,1),(68,'2016-04-16 11:29:47.667762','21','清华大学大表哥',2,'已修改 number 。',14,1),(69,'2016-04-16 11:30:13.382768','20','北邮大表哥',2,'已修改 number 。',14,1),(70,'2016-04-16 11:30:35.008410','19','北邮学十奔驰',2,'已修改 number 。',14,1),(71,'2016-04-20 15:50:59.552125','5','Doer(北京市 北京市 北京邮电大学 15117928812)',2,'已修改 email 和 status 。',20,1),(72,'2016-04-20 16:31:29.293862','5','Doer(北京市 北京市 北京邮电大学 15117928812)',2,'已修改 status 。',20,1),(73,'2016-04-20 17:09:16.014713','22','北师小表哥',2,'已修改 status 。',14,1),(74,'2016-04-20 21:48:35.157345','2','kinsne(北京市 北京市 北京邮电大学 17801034941)',2,'已修改 status 。',20,1),(75,'2016-04-20 21:50:03.384451','4','戴博( 13521913746)',2,'已修改 status 。',20,1),(76,'2016-04-20 21:50:08.057208','3','清华大表哥(北京市 北京市 清华大学 13577777777)',2,'已修改 status 。',20,1),(77,'2016-04-20 22:25:53.607688','32','北邮ferrari',3,'',14,1),(78,'2016-04-20 22:25:53.609484','31','北邮ferrari',3,'',14,1),(79,'2016-04-20 22:25:53.610633','30','北邮ferrari',3,'',14,1),(80,'2016-04-20 22:25:53.611677','29','北邮ferrari',3,'',14,1),(81,'2016-04-20 22:25:53.612767','28','北邮ferrari',3,'',14,1),(82,'2016-04-20 22:25:53.613845','27','北邮ferrari',3,'',14,1),(83,'2016-04-20 22:25:53.614924','26','北邮ferrari',3,'',14,1),(84,'2016-04-20 22:25:53.616034','25','北邮ferrari',3,'',14,1),(85,'2016-04-20 22:25:53.616990','24','北邮ferrari',3,'',14,1),(86,'2016-04-23 18:24:03.432684','32','学十',3,'',13,1),(87,'2016-04-23 18:24:03.434155','31','学十',3,'',13,1),(88,'2016-04-23 18:24:03.434991','30','学十',3,'',13,1),(89,'2016-04-23 18:24:03.435810','29','学十',3,'',13,1),(90,'2016-04-23 18:24:03.436605','28','学十',3,'',13,1),(91,'2016-04-23 18:24:03.437372','27','学十公寓',3,'',13,1),(92,'2016-04-23 18:24:03.438166','26','学十公寓',3,'',13,1),(93,'2016-04-23 18:24:03.438909','25','学十公寓',3,'',13,1),(94,'2016-04-23 18:24:03.439689','24','学十公寓',3,'',13,1),(95,'2016-04-23 18:25:28.607558','23','北师小表哥2',2,'已修改 status 。',14,1),(96,'2016-04-23 18:25:37.275692','22','北师小表哥',2,'已修改 status 。',14,1),(97,'2016-04-26 19:37:29.790705','53','0146150356587',2,'已修改 payMoney 和 payed 。',16,1),(98,'2016-04-26 22:06:53.702851','54','0146167937827',2,'已修改 payMoney 和 payed 。',16,1),(99,'2016-04-26 22:07:25.971390','54','0146167937827',2,'已修改 payed 。',16,1),(100,'2016-04-27 13:56:27.535631','54','0146167937827',2,'已修改 payed 。',16,1),(101,'2016-04-27 13:59:17.189915','54','0146167937827',2,'已修改 receiveTime 和 status 。',16,1),(102,'2016-05-04 06:01:42.807285','5','15117928812',2,'已修改 password 。',5,1),(103,'2016-05-23 21:46:54.922306','22','北师小表哥',2,'已修改 number 。',14,1),(104,'2016-06-19 19:33:05.513374','56','0146633465161',2,'已修改 payMoney 和 payed 。',16,1),(105,'2016-06-19 19:34:04.801167','56','0146633465161',2,'没有字段被修改。',16,1),(106,'2016-06-19 19:35:01.312810','57','0146633607360',2,'已修改 payMoney 和 payed 。',16,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (2,'admin','logentry'),(23,'advertisement','advertisement'),(4,'auth','group'),(3,'auth','permission'),(5,'auth','user'),(13,'bike','address'),(12,'bike','attribute'),(14,'bike','bike'),(9,'bike','brand'),(10,'bike','category'),(15,'bike','photo'),(11,'bike','version'),(1,'constance','config'),(6,'contenttypes','contenttype'),(8,'database','constance'),(25,'message','iprecord'),(24,'message','message'),(26,'message','verificationcode'),(27,'order','comments'),(16,'order','order'),(18,'participator','city'),(20,'participator','participator'),(17,'participator','province'),(19,'participator','university'),(22,'participator','verifyattachment'),(21,'participator','verifycategory'),(7,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-04-10 08:51:37.582000'),(2,'auth','0001_initial','2016-04-10 08:51:37.836310'),(3,'admin','0001_initial','2016-04-10 08:51:37.884912'),(4,'admin','0002_logentry_remove_auto_add','2016-04-10 08:51:37.906694'),(5,'advertisement','0001_initial','2016-04-10 08:51:37.922827'),(6,'advertisement','0002_auto_20160410_1651','2016-04-10 08:51:37.966322'),(7,'contenttypes','0002_remove_content_type_name','2016-04-10 08:51:38.041466'),(8,'auth','0002_alter_permission_name_max_length','2016-04-10 08:51:38.066463'),(9,'auth','0003_alter_user_email_max_length','2016-04-10 08:51:38.088446'),(10,'auth','0004_alter_user_username_opts','2016-04-10 08:51:38.097411'),(11,'auth','0005_alter_user_last_login_null','2016-04-10 08:51:38.126335'),(12,'auth','0006_require_contenttypes_0002','2016-04-10 08:51:38.128583'),(13,'auth','0007_alter_validators_add_error_messages','2016-04-10 08:51:38.138650'),(14,'participator','0001_initial','2016-04-10 08:51:38.428846'),(15,'bike','0001_initial','2016-04-10 08:51:38.565435'),(16,'bike','0002_auto_20160410_1651','2016-04-10 08:51:38.764282'),(17,'database','0001_initial','2016-04-10 08:51:38.777810'),(18,'message','0001_initial','2016-04-10 08:51:38.908384'),(19,'order','0001_initial','2016-04-10 08:51:38.953916'),(20,'order','0002_order_renter','2016-04-10 08:51:39.023710'),(21,'sessions','0001_initial','2016-04-10 08:51:39.051537'),(22,'bike','0003_auto_20160410_2117','2016-04-10 13:17:10.145969'),(23,'bike','0004_auto_20160410_2138','2016-04-10 13:38:29.414717'),(24,'bike','0005_auto_20160411_1107','2016-04-11 03:07:56.466147'),(25,'bike','0006_auto_20160411_1111','2016-04-11 03:11:28.059880'),(26,'bike','0007_auto_20160411_1112','2016-04-11 03:12:19.235741'),(27,'bike','0008_auto_20160411_1113','2016-04-11 03:13:21.354443'),(28,'bike','0009_auto_20160412_0937','2016-04-12 01:37:31.120485'),(29,'order','0003_auto_20160412_1948','2016-04-12 11:48:13.209831'),(30,'order','0004_auto_20160414_2030','2016-04-14 12:31:01.237956'),(31,'order','0005_auto_20160414_2135','2016-04-14 13:35:58.563899'),(32,'order','0006_order_equipments','2016-04-14 13:39:13.702774'),(33,'order','0007_auto_20160414_2154','2016-04-14 13:55:01.737884'),(34,'order','0008_auto_20160414_2219','2016-04-14 14:19:47.585927'),(35,'order','0009_order_amount','2016-04-15 08:12:42.509583'),(36,'order','0010_auto_20160417_1955','2016-04-17 11:55:15.369330'),(37,'order','0011_auto_20160417_2009','2016-04-17 12:09:36.978043'),(38,'order','0012_auto_20160418_1522','2016-04-18 07:22:27.076685'),(39,'order','0013_auto_20160418_1530','2016-04-18 07:30:56.650044'),(40,'order','0014_auto_20160418_1532','2016-04-18 07:32:57.479997'),(41,'order','0015_auto_20160418_1747','2016-04-18 17:47:47.025146'),(42,'order','0016_auto_20160418_1825','2016-04-18 18:26:03.595125'),(43,'order','0017_auto_20160419_1222','2016-04-19 12:22:20.124224'),(44,'order','0018_remove_comments_parent','2016-04-19 12:39:19.601036'),(45,'message','0002_message_template_code','2016-04-19 17:42:40.555330'),(46,'participator','0002_auto_20160420_1550','2016-04-20 15:50:32.386314'),(47,'order','0019_auto_20160420_1717','2016-04-20 17:17:54.530299'),(48,'participator','0003_auto_20160420_2148','2016-04-20 21:48:20.166686'),(49,'order','0020_order_payed','2016-04-21 18:46:37.385893'),(50,'order','0021_auto_20160424_1755','2016-04-24 17:55:46.489158'),(51,'bike','0010_auto_20160426_1522','2016-04-26 15:50:49.498791'),(52,'order','0022_order_receivetime','2016-04-26 21:57:36.304743'),(53,'bike','0011_auto_20160530_1534','2016-05-30 15:34:22.800738'),(54,'participator','0004_participator_money','2016-05-30 15:34:23.668313'),(55,'order','0023_order_out_trade_no','2016-06-19 18:31:30.943121');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('01ho04uu7jzj1mqgeztd8fou3jtf8gex','ZGUwMzM0N2YyNjA5MmNiOWMzYjg4MGE1YjU1OTU4OTEzMjc1NDZhZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1YjI2ZGFiZmIyMjY3NzkxOWUzODExNGNiMDhmOThlM2UwYjAxODA2In0=','2016-05-03 10:53:55.770586'),('18k2g8yfg6cp95ah4m5e2ne6bne0rnn5','ZTU1MjMxYjIzYmEzODFhMzQ3OTE3MWZhNTMwZTJjYjU3NGU2NzgzNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjViMjZkYWJmYjIyNjc3OTE5ZTM4MTE0Y2IwOGY5OGUzZTBiMDE4MDYiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-05-18 06:00:33.723776'),('26brnau3k5sej6e8xo83vk48g9mfybkq','YTY1MzA5ZjFkMzgyMWZjZWM3NmRiYjJiZDRhZjc1YTBiYjUxN2MzODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmQ0NDcwMDdkZDY0NDQ4YWZkZjQwZDE2ZWE0ZTEwMTQ4YzE2ZTI4NiIsIl9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9pZCI6IjIifQ==','2016-04-27 14:47:08.444946'),('8dpi13twf5uaujgdqgz8fuvghbqjrnld','MTQ4MTQ3ZjBkZjU1MGUzZTllZjliOTAzODE2YjQ5NWJhMDQ2ZTE3Yzp7Il9hdXRoX3VzZXJfaGFzaCI6ImRjZDllN2JlZTdhZTg5YjE1YzJmYTFmOTM0ODhjNGEzOGQ5MWZhM2IiLCJfYXV0aF91c2VyX2lkIjoiNSIsIl9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==','2016-05-18 06:01:48.846242'),('8j467vnjdlhyl3fypa63eqo85pdstp0s','YTY1MzA5ZjFkMzgyMWZjZWM3NmRiYjJiZDRhZjc1YTBiYjUxN2MzODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmQ0NDcwMDdkZDY0NDQ4YWZkZjQwZDE2ZWE0ZTEwMTQ4YzE2ZTI4NiIsIl9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9pZCI6IjIifQ==','2016-06-07 20:47:40.557815'),('99fggbabpu5v2sxle4phdnli79aogval','NmQ5YzEzNDNlMWVhNDAxMmY4ZmMzODQ5Nzg1N2ZkYTYwYWMyM2VkMzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX3Nlc3Npb25fZXhwaXJ5IjowLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjJkNDQ3MDA3ZGQ2NDQ0OGFmZGY0MGQxNmVhNGUxMDE0OGMxNmUyODYifQ==','2016-04-30 14:40:37.433350'),('bbetua2i6lm438pr6wxxb5byhep2ynvr','MjA0NDMyNTI2NjhmNjhkYTJhYmMwM2M2NDY1NTA1ODA3YTRmODQxMTp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfaGFzaCI6IjJkNDQ3MDA3ZGQ2NDQ0OGFmZGY0MGQxNmVhNGUxMDE0OGMxNmUyODYifQ==','2016-04-24 10:13:17.926789'),('c3mxva8pi3gjkvql64qs9hupkg6eoxo3','ZTU1MjMxYjIzYmEzODFhMzQ3OTE3MWZhNTMwZTJjYjU3NGU2NzgzNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjViMjZkYWJmYjIyNjc3OTE5ZTM4MTE0Y2IwOGY5OGUzZTBiMDE4MDYiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-07-03 19:18:40.857206'),('ccrtqs0o24z91xawwi36bf8kvbgs84ww','MGZhMjZlOTJjMDM4ODRkYWVkNGM5ZWE2M2ZlMThhMmVhYzE3ZGY1MDp7Il9hdXRoX3VzZXJfaGFzaCI6IjJkNDQ3MDA3ZGQ2NDQ0OGFmZGY0MGQxNmVhNGUxMDE0OGMxNmUyODYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2016-04-28 07:23:58.346954'),('fg0cgn1ycgwv2qv88po46gi10rsdzxmz','ODQ2MjQ4ZGYwYjNjYmZjODZiZGM3ZjQ3MjQ5MjgyZTdlMGJlODUyYTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX3Nlc3Npb25fZXhwaXJ5IjowLCJfYXV0aF91c2VyX2hhc2giOiIyZDQ0NzAwN2RkNjQ0NDhhZmRmNDBkMTZlYTRlMTAxNDhjMTZlMjg2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==','2016-04-25 11:32:55.794742'),('hvevbmvztc545nfx7pdvn4fnizlv7psa','YTY1MzA5ZjFkMzgyMWZjZWM3NmRiYjJiZDRhZjc1YTBiYjUxN2MzODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmQ0NDcwMDdkZDY0NDQ4YWZkZjQwZDE2ZWE0ZTEwMTQ4YzE2ZTI4NiIsIl9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9pZCI6IjIifQ==','2016-06-07 19:24:02.541172'),('i88gmnzhesjnqe78l8z157sfbeysqlwo','NDIwOGZhZDE4MTg3YjYyZDFhOTMxODcwZWQzM2ZhMjlkZWViYmRhMzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2hhc2giOiIyZDQ0NzAwN2RkNjQ0NDhhZmRmNDBkMTZlYTRlMTAxNDhjMTZlMjg2IiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2016-04-29 10:22:01.595981'),('ivsevedm9m6qo8qhivt63p6ecbb7j0zg','MmJkOWNmN2E0YWZkOGVkYTY3NTAwN2YyMDk4ZWEwOGFkZTE5YTUwNDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZDQ0NzAwN2RkNjQ0NDhhZmRmNDBkMTZlYTRlMTAxNDhjMTZlMjg2In0=','2016-04-24 08:58:52.740022'),('l41y5h9hsm851djxmp79rt1wbf7vpyxv','OTc0NWEzZmQ0ZDRkODkxNWJhYzUzOTBiMjkxOTg2YzVlN2U4ZGFhMTp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZDQ0NzAwN2RkNjQ0NDhhZmRmNDBkMTZlYTRlMTAxNDhjMTZlMjg2IiwiX2F1dGhfdXNlcl9pZCI6IjIifQ==','2016-04-29 07:48:51.302195'),('lntz72q92dkist4gxnc1db3m2lh7ercm','ZTI5ZDhkZDc5MDJkZGI0NjNkZGQ4OTNiMjZhOTVmN2Y4Mzk3YTYxYzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2hhc2giOiIyZDQ0NzAwN2RkNjQ0NDhhZmRmNDBkMTZlYTRlMTAxNDhjMTZlMjg2In0=','2016-05-05 13:43:35.343189'),('mjspibs2gz3dakf63oa8qcf63g1iio0r','MjM1NDQ2NDgwNDk2NDRlNTEzMTQ0NWMxNGQwNTY0NWE1ZmYzN2NiYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNWIyNmRhYmZiMjI2Nzc5MTllMzgxMTRjYjA4Zjk4ZTNlMGIwMTgwNiIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-06-08 18:21:09.920189'),('mwv1tfbof6vh4lctxkwl5ieivkr9xrdy','MGZhMjZlOTJjMDM4ODRkYWVkNGM5ZWE2M2ZlMThhMmVhYzE3ZGY1MDp7Il9hdXRoX3VzZXJfaGFzaCI6IjJkNDQ3MDA3ZGQ2NDQ0OGFmZGY0MGQxNmVhNGUxMDE0OGMxNmUyODYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2016-05-04 21:43:50.999649'),('o8szca73xw7v6g35usgajlm7nr21n5j0','MjA0NDMyNTI2NjhmNjhkYTJhYmMwM2M2NDY1NTA1ODA3YTRmODQxMTp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfaGFzaCI6IjJkNDQ3MDA3ZGQ2NDQ0OGFmZGY0MGQxNmVhNGUxMDE0OGMxNmUyODYifQ==','2016-04-24 11:34:05.195615'),('oy4y9h6yrx381f277okwkqq5h4xm8bmb','ZGUwMzM0N2YyNjA5MmNiOWMzYjg4MGE1YjU1OTU4OTEzMjc1NDZhZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1YjI2ZGFiZmIyMjY3NzkxOWUzODExNGNiMDhmOThlM2UwYjAxODA2In0=','2016-07-03 20:01:33.864747'),('u1pzzaobi9crqr9dfqtmj2y1sm52jmup','YTY1MzA5ZjFkMzgyMWZjZWM3NmRiYjJiZDRhZjc1YTBiYjUxN2MzODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmQ0NDcwMDdkZDY0NDQ4YWZkZjQwZDE2ZWE0ZTEwMTQ4YzE2ZTI4NiIsIl9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9pZCI6IjIifQ==','2016-06-06 19:53:47.414849'),('u2kh5aon28svyjqixkmphjozjdwrh5c4','NGM0NTE3NjkxZTJiNGQwMjAxNzhmZmJjNzE0NmYzZmM3ZDc2MWU5Nzp7Il9hdXRoX3VzZXJfaGFzaCI6ImRjZDllN2JlZTdhZTg5YjE1YzJmYTFmOTM0ODhjNGEzOGQ5MWZhM2IiLCJfYXV0aF91c2VyX2lkIjoiNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2016-07-03 15:02:56.952976'),('ug1816eap9z3zogaq1wd016vpwvi8rvk','YjE0MmExNjM0YzA1ZTAzZGIwZDViYTMxZDVkNWQzOTk4YzVkZGI1NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjdlZjAyMjQ3ZTAzOTIzYjVkNjk3MWE2MTdkOWJkYTI4NjViOTNlNDYiLCJfc2Vzc2lvbl9leHBpcnkiOjAsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjUifQ==','2016-05-05 18:46:01.629163'),('xs33bzd1gokr20imfg7zn3icj5pv8vuq','NWUyMmU3YjNlOWMxYTc3MDY2NmNmZWJlZDExOGY5MmY5ZDI5NTRhNDp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfc2Vzc2lvbl9leHBpcnkiOjAsIl9hdXRoX3VzZXJfaGFzaCI6ImRjZDllN2JlZTdhZTg5YjE1YzJmYTFmOTM0ODhjNGEzOGQ5MWZhM2IifQ==','2016-07-03 20:03:59.732446'),('zsj83zbmis6numzup9o6bweb761oogho','YTc1NDQzZTRjYzA3MGY0ZmZlMmY1ZjY2NTA4ZDQ2ZmFkNDAyNDU0YTp7Il9hdXRoX3VzZXJfaGFzaCI6ImUxNzNlZTc2MjE1OTViNjk5YTRkZWEwMmYzY2E1Mjc1NGUwOWMzNzkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==','2016-04-27 12:53:03.071883');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_iprecord`
--

DROP TABLE IF EXISTS `message_iprecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_iprecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` char(39) NOT NULL,
  `date` date NOT NULL,
  `message_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `message_id` (`message_id`),
  KEY `message_iprecord_957b527b` (`ip`),
  KEY `message_iprecord_5fc73231` (`date`),
  CONSTRAINT `message_iprecord_message_id_432711da_fk_message_message_id` FOREIGN KEY (`message_id`) REFERENCES `message_message` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_iprecord`
--

LOCK TABLES `message_iprecord` WRITE;
/*!40000 ALTER TABLE `message_iprecord` DISABLE KEYS */;
INSERT INTO `message_iprecord` VALUES (1,'127.0.0.1','2016-04-10',1),(2,'127.0.0.1','2016-04-12',2),(3,'127.0.0.1','2016-04-14',3),(4,'127.0.0.1','2016-04-19',4),(5,'127.0.0.1','2016-04-19',5),(6,'127.0.0.1','2016-04-19',6),(7,'127.0.0.1','2016-04-19',7),(8,'127.0.0.1','2016-04-19',8),(9,'127.0.0.1','2016-04-19',9),(10,'127.0.0.1','2016-04-19',10),(11,'127.0.0.1','2016-04-19',11),(12,'127.0.0.1','2016-04-19',12),(13,'127.0.0.1','2016-04-19',13),(14,'127.0.0.1','2016-04-19',14),(15,'127.0.0.1','2016-04-19',15),(16,'127.0.0.1','2016-04-19',16),(17,'127.0.0.1','2016-04-19',17),(18,'127.0.0.1','2016-04-20',18),(19,'127.0.0.1','2016-04-24',75);
/*!40000 ALTER TABLE `message_iprecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_message`
--

DROP TABLE IF EXISTS `message_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target` varchar(11) NOT NULL,
  `content` varchar(500) NOT NULL,
  `sentTime` datetime(6) NOT NULL,
  `response` longtext NOT NULL,
  `template_code` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_message`
--

LOCK TABLES `message_message` WRITE;
/*!40000 ALTER TABLE `message_message` DISABLE KEYS */;
INSERT INTO `message_message` VALUES (1,'17801034941','【466797】','2016-04-10 08:58:20.655751','','SMS_6812186'),(2,'13577777777','【776397】','2016-04-12 01:41:29.622058','','SMS_6812186'),(3,'13577777778','【557844】','2016-04-14 07:22:55.691191','','SMS_6812186'),(4,'13521913746','{\"number\":\"687466\"}','2016-04-19 18:23:10.263064','','SMS_7000038'),(5,'13521913746','{\"number\":\"179033\"}','2016-04-19 18:24:33.328666','','SMS_7000038'),(6,'13521913746','{\"number\":\"131597\"}','2016-04-19 18:27:16.371466','','SMS_7000038'),(7,'13521913746','{\"number\":\"619836\"}','2016-04-19 18:30:54.763810','','SMS_7000038'),(8,'13521913746','{\"number\":\"945011\"}','2016-04-19 18:32:24.167012','','SMS_7000038'),(9,'13521913746','{\"number\":\"254289\"}','2016-04-19 18:32:59.787558','','SMS_7000038'),(10,'13521913746','{\"number\":\"546059\"}','2016-04-19 18:34:46.290473','','SMS_7000038'),(11,'13521913746','{\"number\":\"262291\"}','2016-04-19 18:40:22.677856','','SMS_7000038'),(12,'13521913746','{\"number\":\"334483\"}','2016-04-19 18:46:24.197063','','SMS_7000038'),(13,'15116983736','{\"number\":\"366173\"}','2016-04-19 18:48:39.950948','','SMS_7000038'),(14,'13521913746','{\"number\":\"342424\"}','2016-04-19 18:52:20.865727','','SMS_7000038'),(15,'13521913746','{\"number\":\"269784\"}','2016-04-19 18:55:53.509389','','SMS_7000038'),(16,'13521913746','{\"number\":\"316197\"}','2016-04-19 18:56:31.582520','','SMS_7000038'),(17,'15116983736','{\"number\":\"745924\"}','2016-04-19 20:10:57.217852','','SMS_7000038'),(18,'15117928812','{\"number\":\"836069\"}','2016-04-20 15:42:29.804851','','SMS_7000038'),(19,'17801034941','{\"address\":\"www.qikezuche.com\"}','2016-04-20 16:43:27.153308','','SMS_6975097'),(20,'17801034941','{\"address\":\"www.qikezuche.com/participator/orderManage\",\"tell\":\"15117928812\"}','2016-04-20 16:51:00.860160','','SMS_7000039'),(21,'15117928812','{}','2016-04-20 17:01:50.617198','','SMS_7225689'),(22,'17801034941','{\"address\":\"www.qikezuche.com/participator/orderManage\",\"tell\":\"15117928812\"}','2016-04-20 17:02:58.136528','','SMS_7000039'),(23,'15117928812','{\"tell\":\"17801034941\"}','2016-04-20 17:03:18.662316','','SMS_7220735'),(24,'17801034941','{}','2016-04-20 17:09:26.814635','','SMS_7280632'),(25,'17801034941','{\"oid\":\"0146114297475\"\",reason\":\"蛋疼:123\"}','2016-04-20 21:23:28.210984','','SMS_6930124'),(26,'17801034941','{\"address\":\"www.qikezuche.com/participator/orderManage\",\"tell\":\"15117928812\"}','2016-04-20 21:33:25.317042','','SMS_7000039'),(27,'17801034941','{\"oid\":\"0146115920363\"\",reason\":\"信息填写错误:dfgdsg\"}','2016-04-20 21:34:53.467304','','SMS_6930124'),(28,'17801034941','{\"address\":\"www.qikezuche.com/participator/orderManage\",\"tell\":\"15117928812\"}','2016-04-20 21:36:51.297845','','SMS_7000039'),(29,'17801034941','{\"address\":\"www.qikezuche.com/participator/orderManage\",\"tell\":\"15117928812\"}','2016-04-20 21:43:42.932554','','SMS_7000039'),(30,'15117928812','{\"reason\":\"蛋疼:1231223\"}','2016-04-20 21:44:00.486522','','SMS_7010034'),(31,'17801034941','{\"address\":\"www.qikezuche.com\"}','2016-04-20 21:49:12.529370','','SMS_6975097'),(32,'17801034941','{}','2016-04-20 22:21:55.774749','','SMS_7285673'),(33,'17801034941','{}','2016-04-20 22:26:59.592548','','SMS_7280632'),(34,'17801034941','{\"address\":\"www.qikezuche.com/participator/orderManage\",\"tell\":\"15117928812\"}','2016-04-21 10:48:32.804879','','SMS_7000039'),(35,'15117928812','{\"tell\":\"17801034941\"}','2016-04-21 13:44:19.209375','','SMS_7220735'),(36,'13577777777','{\"address\":\"www.qikezuche.com/participator/orderManage\",\"tell\":\"15117928812\"}','2016-04-21 19:15:24.476125','','SMS_7000039'),(37,'13577777777','{\"oid\":\"0146123732382\",\"reason\":\"蛋疼:123\"}','2016-04-21 19:16:59.139487','','SMS_6930124'),(38,'13577777777','{\"oid\":\"0146123711876\",\"reason\":\"信息填写错误:123\"}','2016-04-21 19:17:26.388516','','SMS_6930124'),(39,'17801034941','{\"oid\":\"0146120691279\",\"reason\":\"蛋疼:123\"}','2016-04-21 19:20:27.378386','','SMS_6930124'),(40,'17801034941','{\"address\":\"www.qikezuche.com/participator/orderManage\",\"tell\":\"15117928812\"}','2016-04-21 19:21:11.777247','','SMS_7000039'),(41,'17801034941','{\"oid\":\"0146123767396\",\"reason\":\"信息填写错误:123\"}','2016-04-21 19:22:26.746771','','SMS_6930124'),(42,'17801034941','{\"address\":\"www.qikezuche.com/participator/orderManage\",\"tell\":\"15117928812\"}','2016-04-21 19:22:49.314893','','SMS_7000039'),(43,'17801034941','{\"oid\":\"0146123776882\",\"reason\":\"信息填写错误:123\"}','2016-04-21 19:29:10.274788','','SMS_6930124'),(44,'17801034941','{\"address\":\"www.qikezuche.com/participator/orderManage\",\"tell\":\"15117928812\"}','2016-04-21 19:29:21.584345','','SMS_7000039'),(45,'17801034941','{\"oid\":\"0146123816124\",\"reason\":\"蛋疼:123\"}','2016-04-21 19:32:30.583377','','SMS_6930124'),(46,'17801034941','{\"address\":\"www.qikezuche.com/participator/orderManage\",\"tell\":\"15117928812\"}','2016-04-21 19:32:42.206918','','SMS_7000039'),(47,'17801034941','{\"oid\":\"0146123836217\",\"reason\":\"蛋疼:123\"}','2016-04-21 21:55:23.481361','','SMS_6930124'),(48,'17801034941','{\"address\":\"www.qikezuche.com/participator/orderManage\",\"tell\":\"15117928812\"}','2016-04-21 22:00:03.986168','','SMS_7000039'),(49,'17801034941','{\"oid\":\"0146124720850\",\"reason\":\"蛋疼:123\"}','2016-04-21 22:03:49.020419','','SMS_6930124'),(50,'17801034941','{\"address\":\"www.qikezuche.com/participator/orderManage\",\"tell\":\"15117928812\"}','2016-04-21 22:12:18.040005','','SMS_7000039'),(51,'15117928812','{\"tell\":\"17801034941\"}','2016-04-22 17:17:45.556461','','SMS_7220735'),(52,'15117928812','{}','2016-04-22 17:17:48.712885','','SMS_7225689'),(53,'17801034941','{\"address\":\"www.qikezuche.com/participator/orderManage\",\"tell\":\"15117928812\"}','2016-04-23 18:25:51.023401','','SMS_7000039'),(54,'17801034941','{\"oid\":\"0014614071592\",\"reason\":\"信息填写错误:12331\"}','2016-04-23 18:50:21.300272','','SMS_6930124'),(55,'17801034941','{\"address\":\"www.qikezuche.com/participator/orderManage\",\"tell\":\"15117928812\"}','2016-04-23 18:51:11.146150','','SMS_7000039'),(56,'17801034941','{\"address\":\"www.qikezuche.com/participator/orderManage\",\"tell\":\"15117928812\"}','2016-04-24 16:30:16.804803','','SMS_7000039'),(57,'17801034941','{\"oid\":\"0146148661921\",\"reason\":\"蛋疼:cvcv\"}','2016-04-24 16:37:07.419471','','SMS_6930124'),(58,'17801034941','{\"address\":\"www.qikezuche.com/participator/orderManage\",\"tell\":\"15117928812\"}','2016-04-24 16:37:26.883678','','SMS_7000039'),(59,'17801034941','{\"oid\":\"0146148704443\",\"reason\":\"蛋疼:ghfgh\"}','2016-04-24 16:39:13.087879','','SMS_6930124'),(60,'17801034941','{\"oid\":\"0146140867468\",\"reason\":\"蛋疼:ghfgh\"}','2016-04-24 16:39:18.882691','','SMS_6930124'),(61,'17801034941','{\"address\":\"www.qikezuche.com/participator/orderManage\",\"tell\":\"15117928812\"}','2016-04-24 16:39:42.904852','','SMS_7000039'),(62,'17801034941','{\"oid\":\"0146148718720\",\"reason\":\"信息填写错误:fff\"}','2016-04-24 16:52:16.150002','','SMS_6930124'),(63,'17801034941','{\"address\":\"www.qikezuche.com/participator/orderManage\",\"tell\":\"15117928812\"}','2016-04-24 16:52:25.591584','','SMS_7000039'),(64,'17801034941','{\"oid\":\"0146148794842\",\"reason\":\"蛋疼:的施工方的\"}','2016-04-24 17:27:12.898698','','SMS_6930124'),(65,'17801034941','{\"address\":\"www.qikezuche.com/participator/orderManage\",\"tell\":\"15117928812\"}','2016-04-24 17:27:29.605837','','SMS_7000039'),(66,'17801034941','{\"oid\":\"0146149004956\",\"reason\":\":\"}','2016-04-24 17:28:36.972374','','SMS_6930124'),(67,'17801034941','{\"address\":\"www.qikezuche.com/participator/orderManage\",\"tell\":\"15117928812\"}','2016-04-24 17:28:59.703877','','SMS_7000039'),(68,'17801034941','{\"oid\":\"0014614901387\",\"reason\":\"蛋疼:f\"}','2016-04-24 17:35:07.761993','','SMS_6930124'),(69,'17801034941','{\"address\":\"www.qikezuche.com/participator/orderManage\",\"tell\":\"15117928812\"}','2016-04-24 17:35:15.432304','','SMS_7000039'),(70,'17801034941','{\"address\":\"www.qikezuche.com/participator/orderManage\",\"tell\":\"15117928812\"}','2016-04-24 17:58:24.240935','','SMS_7000039'),(71,'17801034941','{\"oid\":\"0146149190884\",\"reason\":\"蛋疼:fsd\"}','2016-04-24 20:16:32.517768','','SMS_6930124'),(72,'17801034941','{\"oid\":\"0146149190884\",\"reason\":\"信息填写错误:fsd\"}','2016-04-24 20:16:40.549814','','SMS_6930124'),(73,'17801034941','{\"oid\":\"0146149190884\",\"reason\":\"信息填写错误:fsd\"}','2016-04-24 20:17:00.906449','','SMS_6930124'),(74,'17801034941','{\"address\":\"www.qikezuche.com/participator/orderManage\",\"tell\":\"15117928812\"}','2016-04-24 21:12:42.217570','','SMS_7000039'),(75,'13577777778','{\"number\":\"443909\"}','2016-04-24 21:24:14.022205','','SMS_7000038'),(76,'15117928812','{\"tell\":\"17801034941\"}','2016-04-26 19:37:40.958227','','SMS_7220735'),(77,'15117928812','{}','2016-04-26 21:11:41.734831','','SMS_7225689'),(78,'15117928812','{\"tell\":\"17801034941\"}','2016-04-27 13:58:01.408979','','SMS_7220735'),(79,'15117928812','{\"tell\":\"17801034941\"}','2016-04-27 14:00:01.541504','','SMS_7220735'),(80,'15117928812','{}','2016-05-04 05:58:47.519251','','SMS_7225689'),(81,'17801034941','{\"oid\":\"0146633465161\",\"reason\":\"蛋疼:33\"}','2016-06-19 19:34:10.177335','','SMS_6930124'),(82,'17801034941','{\"oid\":\"0146633607360\",\"reason\":\":\"}','2016-06-19 20:02:50.837577','','SMS_6930124');
/*!40000 ALTER TABLE `message_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_verificationcode`
--

DROP TABLE IF EXISTS `message_verificationcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_verificationcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target` varchar(11) NOT NULL,
  `code` decimal(31,0) NOT NULL,
  `added` datetime(6) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `message_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `message_id` (`message_id`),
  KEY `message_verificationcode_42aefbae` (`target`),
  CONSTRAINT `message_verificationco_message_id_8f5687c5_fk_message_message_id` FOREIGN KEY (`message_id`) REFERENCES `message_message` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_verificationcode`
--

LOCK TABLES `message_verificationcode` WRITE;
/*!40000 ALTER TABLE `message_verificationcode` DISABLE KEYS */;
INSERT INTO `message_verificationcode` VALUES (1,'17801034941',466797,'2016-04-10 08:58:20.659734',0,1),(2,'13577777777',776397,'2016-04-12 01:41:29.625427',0,2),(3,'13577777778',557844,'2016-04-14 07:22:55.695032',1,3),(4,'13521913746',687466,'2016-04-19 18:23:10.265551',1,4),(5,'13521913746',179033,'2016-04-19 18:24:33.331326',1,5),(6,'13521913746',131597,'2016-04-19 18:27:16.373278',1,6),(7,'13521913746',619836,'2016-04-19 18:30:54.765585',1,7),(8,'13521913746',945011,'2016-04-19 18:32:24.168604',1,8),(9,'13521913746',254289,'2016-04-19 18:32:59.788737',1,9),(10,'13521913746',546059,'2016-04-19 18:34:46.292047',1,10),(11,'13521913746',262291,'2016-04-19 18:40:22.679401',1,11),(12,'13521913746',334483,'2016-04-19 18:46:24.199047',1,12),(13,'15116983736',366173,'2016-04-19 18:48:39.952601',1,13),(14,'13521913746',342424,'2016-04-19 18:52:20.867353',1,14),(15,'13521913746',269784,'2016-04-19 18:55:53.510859',1,15),(16,'13521913746',316197,'2016-04-19 18:56:31.585117',0,16),(17,'15116983736',745924,'2016-04-19 20:10:57.219783',1,17),(18,'15117928812',836069,'2016-04-20 15:42:29.807224',0,18),(19,'13577777778',443909,'2016-04-24 21:24:14.023856',1,75);
/*!40000 ALTER TABLE `message_verificationcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_comments`
--

DROP TABLE IF EXISTS `order_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `order_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `added` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_comments_69dfcb07` (`order_id`),
  KEY `order_comments_5e7b1936` (`owner_id`),
  CONSTRAINT `order_com_owner_id_e843df2c_fk_participator_participator_user_id` FOREIGN KEY (`owner_id`) REFERENCES `participator_participator` (`user_id`),
  CONSTRAINT `order_comments_order_id_d01f57d4_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_comments`
--

LOCK TABLES `order_comments` WRITE;
/*!40000 ALTER TABLE `order_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_order`
--

DROP TABLE IF EXISTS `order_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `added` datetime(6) NOT NULL,
  `status` varchar(20) NOT NULL,
  `status_modified` datetime(6) DEFAULT NULL,
  `ScoreOnRenter` smallint(5) unsigned DEFAULT NULL,
  `ScoreOnOwner` smallint(5) unsigned DEFAULT NULL,
  `bike_id` int(11) NOT NULL,
  `renter_id` int(11) NOT NULL,
  `beginTime` datetime(6) DEFAULT NULL,
  `endTime` datetime(6) DEFAULT NULL,
  `deposit` int(11) DEFAULT NULL,
  `pledge` varchar(10) DEFAULT NULL,
  `rentMoney` decimal(6,2) NOT NULL,
  `equipments` varchar(100) DEFAULT NULL,
  `number` varchar(16) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `rejectReason` varchar(100) DEFAULT NULL,
  `withdrawReason` varchar(100) DEFAULT NULL,
  `payed` datetime(6) DEFAULT NULL,
  `payMoney` decimal(6,2) DEFAULT NULL,
  `receiveTime` bigint(20) DEFAULT NULL,
  `out_trade_no` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`),
  KEY `order_order_bike_id_55f9eacf_fk_bike_bike_id` (`bike_id`),
  KEY `order_order_ba1e8400` (`renter_id`),
  CONSTRAINT `order_or_renter_id_276e7dfe_fk_participator_participator_user_id` FOREIGN KEY (`renter_id`) REFERENCES `participator_participator` (`user_id`),
  CONSTRAINT `order_order_bike_id_55f9eacf_fk_bike_bike_id` FOREIGN KEY (`bike_id`) REFERENCES `bike_bike` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_order`
--

LOCK TABLES `order_order` WRITE;
/*!40000 ALTER TABLE `order_order` DISABLE KEYS */;
INSERT INTO `order_order` VALUES (52,'2016-04-24 17:58:24.227800','withdraw','2016-04-24 20:16:32.513783',NULL,NULL,23,5,'2016-04-24 17:50:00.000000','2016-04-25 17:50:00.000000',0,'campusId',22.00,'','0146149190884',1,NULL,'信息填写错误:fsd',NULL,NULL,NULL,NULL),(53,'2016-04-24 21:12:42.209687','completed','2016-04-26 21:11:41.730148',NULL,NULL,22,5,'2016-04-24 21:10:00.000000','2016-04-25 21:10:00.000000',0,'campusId',23.00,'','0146150356587',1,'','','2016-04-26 19:37:27.000000',23.00,NULL,NULL),(54,'2016-04-26 22:02:57.087357','completed','2016-05-04 05:58:47.513992',NULL,NULL,22,5,'2016-04-26 22:02:00.000000','2016-04-27 22:02:00.000000',0,'campusId',23.00,'','0146167937827',1,'','','2016-04-27 13:56:25.000000',23.00,216533434,NULL),(55,'2016-06-19 15:03:16.649362','withdraw','2016-06-19 19:10:44.893775',NULL,NULL,22,5,'2016-06-19 15:02:00.000000','2016-06-20 15:02:00.000000',0,'campusId',23.00,'','0014663197929',1,NULL,NULL,NULL,NULL,NULL,NULL),(56,'2016-06-19 19:10:53.359061','withdraw','2016-06-19 19:34:10.172575',NULL,NULL,22,5,'2016-06-19 19:10:00.000000','2016-06-20 19:10:00.000000',0,'campusId',23.00,'','0146633465161',1,'','蛋疼:33','2016-06-19 19:32:56.000000',23.00,NULL,''),(57,'2016-06-19 19:34:39.614950','withdraw','2016-06-19 20:02:50.823253',NULL,NULL,22,5,'2016-06-19 19:34:00.000000','2016-06-20 19:34:00.000000',0,'campusId',23.00,'','0146633607360',1,'',':','2016-06-19 19:34:59.000000',23.00,NULL,''),(58,'2016-06-19 20:04:17.356919','confirming','2016-06-19 20:04:17.357084',NULL,NULL,22,5,'2016-06-19 20:04:00.000000','2016-06-20 20:04:00.000000',0,'campusId',0.10,'','0146633785932',1,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `order_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participator_city`
--

DROP TABLE IF EXISTS `participator_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participator_city` (
  `name` varchar(16) NOT NULL,
  `order` smallint(5) unsigned NOT NULL,
  `province_id` varchar(16) NOT NULL,
  PRIMARY KEY (`name`),
  KEY `participator_city_4a5754ed` (`province_id`),
  CONSTRAINT `participator__province_id_32b62f43_fk_participator_province_name` FOREIGN KEY (`province_id`) REFERENCES `participator_province` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participator_city`
--

LOCK TABLES `participator_city` WRITE;
/*!40000 ALTER TABLE `participator_city` DISABLE KEYS */;
INSERT INTO `participator_city` VALUES ('北京市',0,'北京市'),('大连市',0,'辽宁省');
/*!40000 ALTER TABLE `participator_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participator_participator`
--

DROP TABLE IF EXISTS `participator_participator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participator_participator` (
  `user_id` int(11) NOT NULL,
  `nickname` varchar(16) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `realname` varchar(16) NOT NULL,
  `male` tinyint(1) DEFAULT NULL,
  `PersonId` varchar(18) NOT NULL,
  `studentId` varchar(18) NOT NULL,
  `added` datetime(6) NOT NULL,
  `enrol` varchar(4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `checked_email` tinyint(1) DEFAULT NULL,
  `level` smallint(5) unsigned NOT NULL,
  `lastLogin` datetime(6) NOT NULL,
  `memo` longtext NOT NULL,
  `avatar` varchar(128) NOT NULL,
  `school_id` varchar(32) DEFAULT NULL,
  `money` decimal(8,2) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `participator_participator_5fc7164b` (`school_id`),
  CONSTRAINT `participator__school_id_8dd20280_fk_participator_university_name` FOREIGN KEY (`school_id`) REFERENCES `participator_university` (`name`),
  CONSTRAINT `participator_participator_user_id_415d568a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participator_participator`
--

LOCK TABLES `participator_participator` WRITE;
/*!40000 ALTER TABLE `participator_participator` DISABLE KEYS */;
INSERT INTO `participator_participator` VALUES (1,'骑客',NULL,'',NULL,'','','2016-06-19 15:00:50.613609','','notYet',NULL,0,'2016-06-19 15:00:50.613643','','',NULL,0.00),(2,'kinsney','','冯广宇',NULL,'429005199407310019','2015010180','2016-04-10 08:58:52.733105','','verified',NULL,0,'2016-04-10 08:58:52.733161','','user/17801034941/bigthumb1hNF9U13121918152.jpeg','北京邮电大学',0.00),(3,'清华大表哥','','',NULL,'','','2016-04-12 01:41:54.274666','','notYet',NULL,0,'2016-04-12 01:41:54.274734','','user/13577777777/bigthumbiycn6u15117928812.jpeg','清华大学',0.00),(4,'戴博','','',NULL,'','','2016-04-19 18:57:12.690177','','notYet',NULL,0,'2016-04-19 18:57:12.690218','','',NULL,0.00),(5,'Doer','sdfsdfsd@qq.com','吴春京',NULL,'429005199407310666','131242144','2016-04-20 15:42:50.939942','','verified',NULL,0,'2016-04-20 15:42:50.939986','','','北京邮电大学',46.00);
/*!40000 ALTER TABLE `participator_participator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participator_province`
--

DROP TABLE IF EXISTS `participator_province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participator_province` (
  `name` varchar(16) NOT NULL,
  `order` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participator_province`
--

LOCK TABLES `participator_province` WRITE;
/*!40000 ALTER TABLE `participator_province` DISABLE KEYS */;
INSERT INTO `participator_province` VALUES ('北京市',0),('辽宁省',0);
/*!40000 ALTER TABLE `participator_province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participator_university`
--

DROP TABLE IF EXISTS `participator_university`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participator_university` (
  `name` varchar(32) NOT NULL,
  `order` smallint(5) unsigned NOT NULL,
  `city_id` varchar(16) NOT NULL,
  PRIMARY KEY (`name`),
  KEY `participator_universi_city_id_6b75a0d9_fk_participator_city_name` (`city_id`),
  CONSTRAINT `participator_universi_city_id_6b75a0d9_fk_participator_city_name` FOREIGN KEY (`city_id`) REFERENCES `participator_city` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participator_university`
--

LOCK TABLES `participator_university` WRITE;
/*!40000 ALTER TABLE `participator_university` DISABLE KEYS */;
INSERT INTO `participator_university` VALUES ('北京大学',0,'北京市'),('北京邮电大学',0,'北京市'),('大连师范大学',0,'大连市'),('大连理工大学',0,'大连市'),('清华大学',0,'北京市');
/*!40000 ALTER TABLE `participator_university` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participator_verifyattachment`
--

DROP TABLE IF EXISTS `participator_verifyattachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participator_verifyattachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attachment` varchar(100) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `title_id` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `participa_owner_id_58771e08_fk_participator_participator_user_id` (`owner_id`),
  KEY `participator_verifyattachment_1f38f0e7` (`title_id`),
  CONSTRAINT `participa_owner_id_58771e08_fk_participator_participator_user_id` FOREIGN KEY (`owner_id`) REFERENCES `participator_participator` (`user_id`),
  CONSTRAINT `participa_title_id_0c8fc284_fk_participator_verifycategory_title` FOREIGN KEY (`title_id`) REFERENCES `participator_verifycategory` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participator_verifyattachment`
--

LOCK TABLES `participator_verifyattachment` WRITE;
/*!40000 ALTER TABLE `participator_verifyattachment` DISABLE KEYS */;
INSERT INTO `participator_verifyattachment` VALUES (1,'user/15117928812/bigthumb2pZDP613121918152.jpeg',5,'学生证'),(2,'user/15117928812/bigthumb2xljZC15650712173.jpeg',5,'身份证前面'),(3,'user/15117928812/bigthumb2xljZC15650712173_0AEN0B1.jpeg',5,'身份证后面'),(4,'user/17801034941/bigthumb5vHuYK13121918152.jpeg',2,'学生证'),(5,'user/17801034941/bigthumb1hNF9U13121918152_uo7C7Fu.jpeg',2,'身份证前面'),(6,'user/17801034941/bigthumb2xljZC15650712173.jpeg',2,'身份证后面');
/*!40000 ALTER TABLE `participator_verifyattachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participator_verifycategory`
--

DROP TABLE IF EXISTS `participator_verifycategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participator_verifycategory` (
  `title` varchar(16) NOT NULL,
  `hint` varchar(100) NOT NULL,
  PRIMARY KEY (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participator_verifycategory`
--

LOCK TABLES `participator_verifycategory` WRITE;
/*!40000 ALTER TABLE `participator_verifycategory` DISABLE KEYS */;
INSERT INTO `participator_verifycategory` VALUES ('学生证','./schoolcard.jpg'),('身份证前面','./idfront.jpg'),('身份证后面','./idback.jpg');
/*!40000 ALTER TABLE `participator_verifycategory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-19 20:09:55
