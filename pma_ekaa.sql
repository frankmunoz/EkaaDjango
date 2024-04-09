-- MySQL dump 10.16  Distrib 10.1.30-MariaDB, for osx10.6 (i386)
--
-- Host: localhost    Database: pma_ekaa
-- ------------------------------------------------------
-- Server version	10.1.30-MariaDB

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
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194_fk_auth_user_id` (`user_id`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
INSERT INTO `account_emailaddress` VALUES (1,'francisco.a.munoz@gmail.com',0,1,2);
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance_attendance`
--

DROP TABLE IF EXISTS `attendance_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registration_date` datetime(6) NOT NULL,
  `beneficiary_id` int(11) DEFAULT NULL,
  `institution_id` int(11) DEFAULT NULL,
  `modality_id` int(11) DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attendance_attendanc_beneficiary_id_c2126584_fk_beneficia` (`beneficiary_id`),
  KEY `attendance_attendanc_institution_id_1dc21240_fk_instituti` (`institution_id`),
  KEY `attendance_attendanc_modality_id_742e79a0_fk_modality_` (`modality_id`),
  KEY `attendance_attendance_person_id_1e5e1bdb_fk_person_person_id` (`person_id`),
  CONSTRAINT `attendance_attendanc_beneficiary_id_c2126584_fk_beneficia` FOREIGN KEY (`beneficiary_id`) REFERENCES `beneficiary_beneficiary` (`id`),
  CONSTRAINT `attendance_attendanc_institution_id_1dc21240_fk_instituti` FOREIGN KEY (`institution_id`) REFERENCES `institution_institution` (`id`),
  CONSTRAINT `attendance_attendanc_modality_id_742e79a0_fk_modality_` FOREIGN KEY (`modality_id`) REFERENCES `modality_modality` (`id`),
  CONSTRAINT `attendance_attendance_person_id_1e5e1bdb_fk_person_person_id` FOREIGN KEY (`person_id`) REFERENCES `person_person` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_attendance`
--

LOCK TABLES `attendance_attendance` WRITE;
/*!40000 ALTER TABLE `attendance_attendance` DISABLE KEYS */;
INSERT INTO `attendance_attendance` VALUES (1,'2019-08-30 12:04:23.594235',1,1,1,1);
/*!40000 ALTER TABLE `attendance_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Token',7,'add_token'),(26,'Can change Token',7,'change_token'),(27,'Can delete Token',7,'delete_token'),(28,'Can view Token',7,'view_token'),(29,'Can add rol',8,'add_rol'),(30,'Can change rol',8,'change_rol'),(31,'Can delete rol',8,'delete_rol'),(32,'Can view rol',8,'view_rol'),(33,'Can add person',9,'add_person'),(34,'Can change person',9,'change_person'),(35,'Can delete person',9,'delete_person'),(36,'Can view person',9,'view_person'),(37,'Can add partner',10,'add_partner'),(38,'Can change partner',10,'change_partner'),(39,'Can delete partner',10,'delete_partner'),(40,'Can view partner',10,'view_partner'),(41,'Can add document type',11,'add_documenttype'),(42,'Can change document type',11,'change_documenttype'),(43,'Can delete document type',11,'delete_documenttype'),(44,'Can view document type',11,'view_documenttype'),(45,'Can add gender',12,'add_gender'),(46,'Can change gender',12,'change_gender'),(47,'Can delete gender',12,'delete_gender'),(48,'Can view gender',12,'view_gender'),(49,'Can add nationality',13,'add_nationality'),(50,'Can change nationality',13,'change_nationality'),(51,'Can delete nationality',13,'delete_nationality'),(52,'Can view nationality',13,'view_nationality'),(53,'Can add beneficiary',14,'add_beneficiary'),(54,'Can change beneficiary',14,'change_beneficiary'),(55,'Can delete beneficiary',14,'delete_beneficiary'),(56,'Can view beneficiary',14,'view_beneficiary'),(57,'Can add modality type',15,'add_modalitytype'),(58,'Can change modality type',15,'change_modalitytype'),(59,'Can delete modality type',15,'delete_modalitytype'),(60,'Can view modality type',15,'view_modalitytype'),(61,'Can add modality',16,'add_modality'),(62,'Can change modality',16,'change_modality'),(63,'Can delete modality',16,'delete_modality'),(64,'Can view modality',16,'view_modality'),(65,'Can add institution type',17,'add_institutiontype'),(66,'Can change institution type',17,'change_institutiontype'),(67,'Can delete institution type',17,'delete_institutiontype'),(68,'Can view institution type',17,'view_institutiontype'),(69,'Can add institution',18,'add_institution'),(70,'Can change institution',18,'change_institution'),(71,'Can delete institution',18,'delete_institution'),(72,'Can view institution',18,'view_institution'),(73,'Can add attendance',19,'add_attendance'),(74,'Can change attendance',19,'change_attendance'),(75,'Can delete attendance',19,'delete_attendance'),(76,'Can view attendance',19,'view_attendance'),(77,'Can add site',20,'add_site'),(78,'Can change site',20,'change_site'),(79,'Can delete site',20,'delete_site'),(80,'Can view site',20,'view_site'),(81,'Can add email address',21,'add_emailaddress'),(82,'Can change email address',21,'change_emailaddress'),(83,'Can delete email address',21,'delete_emailaddress'),(84,'Can view email address',21,'view_emailaddress'),(85,'Can add email confirmation',22,'add_emailconfirmation'),(86,'Can change email confirmation',22,'change_emailconfirmation'),(87,'Can delete email confirmation',22,'delete_emailconfirmation'),(88,'Can view email confirmation',22,'view_emailconfirmation'),(89,'Can add social account',23,'add_socialaccount'),(90,'Can change social account',23,'change_socialaccount'),(91,'Can delete social account',23,'delete_socialaccount'),(92,'Can view social account',23,'view_socialaccount'),(93,'Can add social application',24,'add_socialapp'),(94,'Can change social application',24,'change_socialapp'),(95,'Can delete social application',24,'delete_socialapp'),(96,'Can view social application',24,'view_socialapp'),(97,'Can add social application token',25,'add_socialtoken'),(98,'Can change social application token',25,'change_socialtoken'),(99,'Can delete social application token',25,'delete_socialtoken'),(100,'Can view social application token',25,'view_socialtoken');
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
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$cKrgOIBDthSA$fezF8m8dPUppABrC0Cw7xHP71c2rBSUmgB3uLRdRkjs=','2019-09-03 10:53:20.756792',1,'franciscomunoz','','','ingeniero.frank@gmail.com',1,1,'2019-08-30 12:03:04.070896'),(2,'pbkdf2_sha256$150000$KL7Gn5zOKrgQ$7kdR7qK/lP86JXhAF3cVj9S9Q/KdcVG2a83XF+oIEfo=','2019-09-01 17:14:49.181220',0,'1','','','francisco.a.munoz@gmail.com',0,1,'2019-09-01 17:14:45.658136');
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
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('17c81aa8e595fa8f23a54fc79639813ebc845fd3','2019-09-01 17:14:45.792524',2),('9310c223313e1316b5b42c992de4345f1003cb6b','2019-08-30 12:03:44.644931',1);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beneficiary_beneficiary`
--

DROP TABLE IF EXISTS `beneficiary_beneficiary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beneficiary_beneficiary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `geolocation` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `second_name` varchar(50) DEFAULT NULL,
  `surname` varchar(50) NOT NULL,
  `second_surname` varchar(50) DEFAULT NULL,
  `document` varchar(50) NOT NULL,
  `birth_date` varchar(10) NOT NULL,
  `pregnant` varchar(3) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `aditional_information` varchar(150) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `household_code` varchar(15) NOT NULL,
  `agreement` varchar(200) DEFAULT NULL,
  `registration_date` datetime(6) NOT NULL,
  `document_type_id` int(11) DEFAULT NULL,
  `gender_id` int(11) DEFAULT NULL,
  `nationality_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `beneficiary_benefici_document_type_id_461d8062_fk_document_` (`document_type_id`),
  KEY `beneficiary_beneficiary_gender_id_3a2ac2e0_fk_gender_gender_id` (`gender_id`),
  KEY `beneficiary_benefici_nationality_id_b2b7727e_fk_nationali` (`nationality_id`),
  CONSTRAINT `beneficiary_benefici_document_type_id_461d8062_fk_document_` FOREIGN KEY (`document_type_id`) REFERENCES `document_type_documenttype` (`id`),
  CONSTRAINT `beneficiary_benefici_nationality_id_b2b7727e_fk_nationali` FOREIGN KEY (`nationality_id`) REFERENCES `nationality_nationality` (`id`),
  CONSTRAINT `beneficiary_beneficiary_gender_id_3a2ac2e0_fk_gender_gender_id` FOREIGN KEY (`gender_id`) REFERENCES `gender_gender` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beneficiary_beneficiary`
--

LOCK TABLES `beneficiary_beneficiary` WRITE;
/*!40000 ALTER TABLE `beneficiary_beneficiary` DISABLE KEYS */;
INSERT INTO `beneficiary_beneficiary` VALUES (1,'1','Frank','','Munoz','','80065187','19/10/1978','','','','','','1','2019-08-30 12:04:00.290292',1,1,1),(2,'1','frank','','munoz','THANKS','8000','2019/8/3','1','231','12',NULL,'','1','2019-09-03 10:59:08.122937',NULL,1,1),(3,'1','Nichole','Donovan','Marquez','Hobbs','22325848','06/09/2018','1','03 90 79 04 33','Lorem ipsum dolor','semper rutrum.','0','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-09-21 14:37:42.000000',1,2,2),(4,'1','Tad','Harper','Dixon','Johns','6878580','07/09/2018','1','01 11 47 13 96','Lorem ipsum dolor sit','Nullam feugiat placerat velit.','1','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-01-23 03:15:37.000000',1,1,1),(5,'1','Finn','Brynne','Hyde','Owens','35353651','03/09/2018','0','03 39 73 82 86','Lorem ipsum dolor','ut quam','1','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-02-20 08:12:53.000000',1,2,2),(6,'1','Raja','Connor','Haynes','Holcomb','50718293','04/09/2018','1','09 89 27 03 10','Lorem ipsum dolor','eu augue','2','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-08-17 15:11:27.000000',1,2,2),(7,'1','Brielle','Wade','Brock','Russo','9489375','07/09/2018','0','01 78 31 27 03','Lorem ipsum dolor','primis in faucibus orci luctus','4','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-06-25 05:56:33.000000',1,2,1),(8,'1','Vivien','Cyrus','Mcfadden','Donaldson','14620748','03/09/2018','1','03 33 98 72 65','Lorem ipsum dolor sit','nulla ante,','4','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-08-01 15:25:13.000000',1,1,2),(9,'1','Elliott','Lionel','Stephens','Morin','24450257','06/09/2018','1','01 54 76 55 27','Lorem ipsum dolor sit amet,','lorem.','3','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-05-29 09:34:15.000000',1,2,2),(10,'1','Ursula','Tanek','Berg','Mcdowell','39701510','05/09/2018','1','07 60 17 99 71','Lorem ipsum dolor sit amet,','pharetra,','7','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-10-01 23:51:42.000000',1,2,1),(11,'1','Rowan','Harrison','Glass','Franks','35205792','06/09/2018','0','04 00 89 73 26','Lorem ipsum dolor sit amet,','sed libero. Proin sed','7','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-10-31 13:06:34.000000',1,2,2),(12,'1','Oprah','Catherine','Doyle','Morris','48459418','07/09/2018','1','09 28 65 24 89','Lorem','amet luctus vulputate, nisi','8','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-10-01 07:02:40.000000',1,2,1),(13,'1','Zachery','Evelyn','Carlson','Munoz','9472219','05/09/2018','1','01 80 91 43 36','Lorem ipsum','non,','8','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-06-17 06:26:42.000000',1,1,1),(14,'1','Kylan','Dane','Patterson','Hoffman','42999423','06/09/2018','1','04 42 60 34 44','Lorem','malesuada ut, sem. Nulla','9','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-01-23 11:08:16.000000',1,1,1),(15,'1','Cora','Honorato','Gay','Zimmerman','44019594','06/09/2018','0','09 97 86 60 91','Lorem ipsum dolor sit amet,','nulla. In','9','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-05-11 14:04:40.000000',1,1,2),(16,'1','Derek','Zachery','Hatfield','Bradshaw','21183653','03/09/2018','1','08 24 75 93 11','Lorem ipsum','semper egestas, urna','12','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-10-03 14:25:17.000000',1,2,2),(17,'1','Hiram','Heather','Greer','Lambert','29992153','05/09/2018','1','09 11 58 56 65','Lorem ipsum','erat neque non quam.','5','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-08-09 07:46:14.000000',1,2,2),(18,'1','Rosalyn','Zeph','Golden','Nichols','14429429','03/09/2018','1','02 96 09 89 89','Lorem ipsum','molestie orci tincidunt adipiscing.','10','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-12-30 04:00:13.000000',1,2,2),(19,'1','Margaret','Indira','Evans','Walters','17804071','04/09/2018','1','07 69 66 50 07','Lorem','dignissim. Maecenas ornare','2','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-09-17 16:15:03.000000',1,1,2),(20,'1','Graham','Jana','Salas','Andrews','31450677','05/09/2018','0','02 03 80 85 57','Lorem ipsum dolor','nec, mollis','3','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-10-18 01:39:49.000000',1,1,2),(21,'1','Rashad','Eugenia','Brooks','Velez','21550346','06/09/2018','0','07 20 59 15 57','Lorem ipsum dolor sit','Aliquam rutrum','12','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-03-06 11:28:44.000000',1,2,2),(22,'1','Alfonso','Louis','Stephenson','Kramer','8659053','06/09/2018','1','08 73 49 59 78','Lorem ipsum dolor','Integer aliquam adipiscing lacus.','11','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-11-16 10:32:47.000000',1,2,1),(23,'1','Kennan','Finn','Crane','Carr','6043692','07/09/2018','0','09 94 64 38 07','Lorem ipsum dolor','feugiat. Lorem ipsum dolor sit','17','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-01-22 21:49:24.000000',1,2,2),(24,'1','Hayden','Reece','Buckner','Baird','20982569','03/09/2018','1','07 29 68 89 73','Lorem ipsum dolor sit amet,','sollicitudin a,','11','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-07-16 17:05:02.000000',1,1,2),(25,'1','John','Mannix','Bell','Dale','34581545','07/09/2018','0','05 51 05 41 30','Lorem ipsum','natoque penatibus et magnis dis','5','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-11-02 15:32:00.000000',1,1,1),(26,'1','Cally','Kristen','Patton','Cameron','6397100','05/09/2018','1','03 58 39 26 31','Lorem','Duis sit amet diam','10','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-09-30 14:11:01.000000',1,1,1),(27,'1','Violet','Mikayla','Vasquez','Vargas','16680578','04/09/2018','0','08 21 87 76 14','Lorem','id sapien. Cras','16','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-05-21 12:12:41.000000',1,2,1),(28,'1','Preston','Sydnee','Bridges','Hebert','21974676','04/09/2018','0','03 51 21 10 86','Lorem ipsum','nibh. Phasellus nulla. Integer vulputate,','18','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-06-17 02:48:13.000000',1,2,1),(29,'1','Perry','Rowan','Kemp','Benjamin','10576813','04/09/2018','1','09 99 20 56 67','Lorem ipsum dolor','gravida sagittis. Duis gravida. Praesent','16','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-08-02 01:14:04.000000',1,1,2),(30,'1','Caleb','Stephanie','Schwartz','Holder','31330790','05/09/2018','0','03 62 95 09 23','Lorem ipsum dolor sit amet,','tristique pellentesque, tellus sem mollis','20','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-10-30 04:54:08.000000',1,1,2),(31,'1','Harper','Laith','Briggs','Benjamin','9980289','03/09/2018','0','05 11 38 91 11','Lorem ipsum dolor','accumsan laoreet ipsum.','13','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-07-18 08:14:28.000000',1,2,2),(32,'1','Serina','Jemima','Clayton','Abbott','48043833','05/09/2018','0','08 09 87 97 95','Lorem ipsum dolor sit amet,','sodales. Mauris','27','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-07-26 22:24:20.000000',1,2,1),(33,'1','Savannah','Caldwell','Compton','Ellis','12161383','07/09/2018','0','06 98 51 59 58','Lorem','et, eros. Proin','18','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-07-17 14:43:26.000000',1,1,1),(34,'1','Hope','Shelby','Butler','Morris','9289570','03/09/2018','1','07 91 78 62 49','Lorem','dictum eleifend, nunc risus varius','20','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-02-27 20:55:52.000000',1,2,2),(35,'1','Remedios','Colton','Sharpe','Vang','48242716','04/09/2018','1','01 66 58 87 78','Lorem ipsum dolor','sit amet luctus vulputate, nisi','27','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-07-14 17:53:32.000000',1,1,2),(36,'1','Melodie','Xerxes','Morton','Farrell','33637967','04/09/2018','1','04 33 48 38 62','Lorem ipsum','et magnis','22','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-11-08 07:23:56.000000',1,1,2),(37,'1','Katell','Tashya','Hudson','Murray','33403498','07/09/2018','0','06 56 96 39 45','Lorem ipsum dolor sit amet,','consequat','21','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-09-28 00:49:00.000000',1,1,2),(38,'1','Donna','Fritz','Alvarado','Hines','41738590','05/09/2018','0','01 41 61 55 88','Lorem ipsum dolor sit','quam, elementum','24','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-07-31 14:13:05.000000',1,1,1),(39,'1','Carissa','Felix','Reese','Donovan','28349489','04/09/2018','0','02 27 51 93 59','Lorem ipsum dolor sit','ante bibendum ullamcorper. Duis','19','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-10-09 22:03:09.000000',1,2,1),(40,'1','Colleen','Jennifer','Miles','Wallace','15950924','04/09/2018','1','06 87 50 53 15','Lorem ipsum dolor sit amet,','felis','32','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-06-06 01:04:00.000000',1,2,1),(41,'1','Ariana','Hayes','Cannon','Conrad','12843371','06/09/2018','1','05 41 93 53 00','Lorem ipsum dolor sit','consequat dolor','6','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-08-17 07:30:50.000000',1,1,1),(42,'1','Carolyn','Ian','Howell','Colon','6272213','03/09/2018','1','06 89 08 86 64','Lorem ipsum dolor sit','dapibus','28','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-08-28 15:43:58.000000',1,1,1),(43,'1','Jack','Leo','Richardson','Finley','31017133','04/09/2018','1','08 59 66 24 09','Lorem ipsum dolor sit','Mauris quis turpis vitae purus','19','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-06-13 23:01:40.000000',1,1,2),(44,'1','Wynter','Remedios','Hardin','Bridges','5194305','07/09/2018','0','05 96 63 83 25','Lorem ipsum dolor','dictum eleifend,','24','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-04-14 19:00:05.000000',1,2,1),(45,'1','Veda','Maryam','Stout','Gilmore','30169620','05/09/2018','0','05 68 06 64 87','Lorem ipsum dolor sit amet,','ac, fermentum vel, mauris. Integer','38','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-07-07 04:36:24.000000',1,1,2),(46,'1','Rylee','Xantha','Shannon','Justice','38764732','06/09/2018','1','01 78 26 95 84','Lorem ipsum dolor sit amet,','nec, eleifend non,','30','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-04-08 10:26:34.000000',1,2,1),(47,'1','Rashad','Signe','Bowers','Wiggins','30563121','06/09/2018','1','01 85 26 44 95','Lorem ipsum','hendrerit consectetuer, cursus et, magna.','13','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-09-24 02:47:04.000000',1,1,1),(48,'1','Eve','Aaron','Chaney','Horn','36187467','06/09/2018','0','02 40 81 48 94','Lorem ipsum dolor sit amet,','Curabitur','22','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-12-26 12:34:05.000000',1,2,2),(49,'1','Lawrence','Germaine','Hurley','Kelley','26748799','03/09/2018','0','05 25 49 05 64','Lorem ipsum dolor sit amet,','hendrerit consectetuer, cursus','40','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-08-25 19:57:36.000000',1,2,2),(50,'1','Arden','Donna','Stuart','Clemons','48805803','03/09/2018','0','04 03 05 94 46','Lorem','interdum.','35','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-06-25 03:17:17.000000',1,2,1),(51,'1','Ora','Norman','Johnson','Mcclure','17220395','06/09/2018','0','03 58 04 94 56','Lorem ipsum dolor sit amet,','ornare','21','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-03-30 03:15:19.000000',1,2,1),(52,'1','Dustin','Dara','Harvey','Blackburn','33161168','07/09/2018','0','08 34 81 39 49','Lorem ipsum','ultrices a,','29','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-02-22 14:58:15.000000',1,2,1),(53,'1','Lillith','Beck','Carroll','Howe','30974952','06/09/2018','0','04 10 72 62 61','Lorem','nonummy','30','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-09-29 21:21:20.000000',1,1,2),(54,'1','Martena','Troy','Cleveland','Blair','40526985','03/09/2018','1','03 13 44 83 06','Lorem ipsum dolor sit','aliquet magna a neque.','45','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-12-12 19:12:23.000000',1,2,1),(55,'1','Lester','Theodore','Taylor','Hamilton','17205157','04/09/2018','1','07 42 90 80 94','Lorem ipsum','ac','28','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-09-08 12:54:31.000000',1,1,2),(56,'1','Keefe','Addison','Payne','Bradford','12424369','07/09/2018','1','01 31 80 88 27','Lorem ipsum dolor sit amet,','consectetuer adipiscing elit.','45','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-06-02 20:00:09.000000',1,2,2),(57,'1','Anjolie','Ishmael','Joseph','Ortega','27472129','05/09/2018','0','09 81 23 45 57','Lorem ipsum dolor sit','Aenean eget metus.','53','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-10-23 04:35:05.000000',1,1,1),(58,'1','Wesley','Xander','Gregory','Dickson','21829431','04/09/2018','1','08 15 09 52 62','Lorem','placerat, augue.','38','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-12-24 11:49:18.000000',1,2,2),(59,'1','Kermit','Rinah','Palmer','Woods','10318516','05/09/2018','1','01 09 73 79 51','Lorem ipsum dolor sit amet,','gravida non,','56','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-04-20 04:39:25.000000',1,1,2),(60,'1','Jescie','Uma','Stuart','Calderon','37868203','06/09/2018','0','02 67 10 35 94','Lorem ipsum','nibh. Donec est mauris,','14','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-01-20 21:11:18.000000',1,2,1),(61,'1','Kyle','Calista','Pearson','Joyner','34769807','04/09/2018','1','02 96 41 11 94','Lorem ipsum','Donec luctus','15','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-09-12 15:00:54.000000',1,1,2),(62,'1','Hermione','Arsenio','Orr','Gutierrez','33408778','06/09/2018','1','05 51 23 67 78','Lorem ipsum dolor sit','amet massa. Quisque','41','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-05-09 12:08:01.000000',1,2,1),(63,'1','Callum','Kyla','Cox','Romero','21090481','06/09/2018','0','09 33 46 19 75','Lorem ipsum','vel arcu. Curabitur ut odio','47','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-02-16 03:17:19.000000',1,1,1),(64,'1','Shelly','Lane','Stevenson','Ball','14433212','06/09/2018','1','06 60 46 56 88','Lorem','elit, pellentesque a, facilisis non,','39','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-08-02 08:19:40.000000',1,1,2),(65,'1','Noble','Dolan','Ingram','Buck','20007857','03/09/2018','0','09 21 47 87 04','Lorem ipsum','accumsan neque et nunc.','48','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-03-20 10:13:54.000000',1,1,1),(66,'1','Jessamine','Sharon','Chase','Hansen','24227051','07/09/2018','1','08 07 48 83 35','Lorem ipsum dolor sit','elit','23','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-03-17 07:41:09.000000',1,2,1),(67,'1','Lucas','Martena','Campbell','Cummings','10418991','06/09/2018','1','08 52 26 65 32','Lorem ipsum dolor sit','lorem','56','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-08-12 05:31:20.000000',1,2,2),(68,'1','Karyn','Lane','Valencia','Bullock','29801588','07/09/2018','0','09 16 02 52 36','Lorem ipsum dolor','at pretium aliquet, metus urna','55','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-02-29 09:10:40.000000',1,1,2),(69,'1','Alma','Diana','Singleton','Frank','7017328','05/09/2018','0','09 78 34 04 15','Lorem','Integer vitae nibh.','52','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-04-16 14:10:44.000000',1,1,1),(70,'1','Gretchen','Clinton','Caldwell','Flores','50897699','06/09/2018','0','06 75 07 50 01','Lorem ipsum','luctus et ultrices posuere cubilia','55','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-06-30 14:28:31.000000',1,2,2),(71,'1','Leroy','Thane','Schroeder','Martin','28296804','06/09/2018','0','06 71 11 28 12','Lorem ipsum dolor sit','Suspendisse','39','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-07-06 16:34:21.000000',1,1,2),(72,'1','Ross','Laura','Pennington','Estes','35562735','03/09/2018','0','09 66 62 26 47','Lorem','malesuada vel, venenatis vel, faucibus','15','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-01-12 00:25:43.000000',1,1,1),(73,'1','Boris','Indira','Carr','Norris','44627494','07/09/2018','0','04 57 80 27 02','Lorem ipsum dolor','fringilla purus','52','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-08-25 22:38:19.000000',1,1,1),(74,'1','Myles','Clark','William','Holman','11807855','03/09/2018','0','04 80 84 76 00','Lorem ipsum dolor','egestas. Aliquam nec','48','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-07-24 04:06:27.000000',1,1,2),(75,'1','Hector','Cole','Combs','Craig','50577521','05/09/2018','1','06 46 96 88 33','Lorem ipsum dolor','egestas','54','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-12-17 12:21:52.000000',1,1,2),(76,'1','Arsenio','Castor','Drake','Woodward','50874852','05/09/2018','1','09 54 47 05 79','Lorem ipsum dolor sit amet,','et','26','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-08-26 00:33:06.000000',1,2,2),(77,'1','India','August','Maldonado','Lancaster','39197290','05/09/2018','1','02 68 75 66 26','Lorem ipsum dolor sit amet,','lectus. Cum','63','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-09-30 21:17:24.000000',1,2,1),(78,'1','Kadeem','Cameron','England','Oliver','32614441','06/09/2018','0','04 15 14 67 81','Lorem ipsum dolor','Curabitur','37','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-11-13 08:57:41.000000',1,2,1),(79,'1','Preston','Lance','Gomez','Larsen','7763994','06/09/2018','1','07 24 75 20 20','Lorem','Donec','42','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-11-26 18:39:19.000000',1,1,1),(80,'1','Haley','Kareem','Grant','Daniels','43334864','03/09/2018','0','04 41 99 21 37','Lorem','ut, molestie','40','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-02-08 16:26:59.000000',1,2,1),(81,'1','Fulton','Kaitlin','Britt','Holden','5843715','06/09/2018','1','06 72 36 05 80','Lorem ipsum dolor sit','Cras interdum. Nunc','31','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-01-07 00:12:27.000000',1,2,2),(82,'1','Natalie','Sawyer','Blanchard','Hendrix','30406574','07/09/2018','1','09 84 61 17 82','Lorem ipsum dolor','interdum ligula eu enim.','44','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-08-07 10:02:32.000000',1,1,1),(83,'1','Kadeem','Timon','Lindsey','Velez','49376391','03/09/2018','0','02 63 10 45 99','Lorem ipsum dolor','Curae; Phasellus ornare.','37','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-12-07 21:08:09.000000',1,1,1),(84,'1','Basil','Zenia','Hinton','Kidd','49003531','06/09/2018','0','01 34 72 30 62','Lorem ipsum','rutrum, justo. Praesent luctus.','75','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-01-13 14:14:05.000000',1,1,2),(85,'1','Stewart','Amena','Erickson','Harper','34534387','04/09/2018','1','07 97 52 03 80','Lorem ipsum dolor','enim diam vel arcu.','61','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-05-17 19:12:51.000000',1,1,2),(86,'1','Hillary','Kimberley','Harrell','Foreman','10646851','06/09/2018','1','01 24 16 80 97','Lorem','malesuada. Integer id magna','34','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-02-18 15:58:32.000000',1,2,2),(87,'1','Chadwick','Madeson','Tucker','Stevens','18933044','05/09/2018','0','06 43 14 71 32','Lorem ipsum dolor sit amet,','Phasellus libero','29','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-02-18 11:02:59.000000',1,1,1),(88,'1','Rafael','Kelsey','Warren','Petty','50722277','03/09/2018','1','03 51 72 04 11','Lorem','purus, in molestie tortor nibh','59','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-08-08 21:32:55.000000',1,2,1),(89,'1','Gail','Hedley','West','Hamilton','33204437','03/09/2018','0','09 85 84 94 13','Lorem ipsum dolor','bibendum.','66','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-01-25 03:44:54.000000',1,1,1),(90,'1','Regina','Ulric','Harvey','Cooper','30123159','04/09/2018','0','02 19 00 22 51','Lorem ipsum dolor sit','Phasellus nulla. Integer vulputate, risus','42','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-03-16 10:57:48.000000',1,1,2),(91,'1','Charles','Kasper','Leonard','Pittman','20555203','04/09/2018','0','04 10 93 75 72','Lorem ipsum dolor sit amet,','molestie dapibus ligula.','66','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-03-10 13:37:14.000000',1,2,2),(92,'1','Olivia','Unity','Townsend','Molina','27610352','07/09/2018','0','03 68 28 16 52','Lorem ipsum dolor sit','lacus. Quisque purus sapien,','77','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-08-27 02:23:10.000000',1,2,2),(93,'1','Denise','Hollee','Oneill','Bryant','49365421','04/09/2018','0','09 12 95 37 44','Lorem ipsum dolor sit amet,','eu, eleifend','46','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-12-04 13:51:40.000000',1,1,1),(94,'1','Demetria','Oren','Rivers','Black','49710561','07/09/2018','0','09 69 61 15 60','Lorem ipsum dolor sit','eros nec tellus. Nunc','6','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-09-22 01:51:22.000000',1,1,1),(95,'1','Zena','Kevin','Valdez','Sykes','50788230','07/09/2018','0','09 31 02 85 67','Lorem ipsum dolor','sodales','23','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-05-18 04:39:34.000000',1,1,2),(96,'1','Kadeem','Leila','York','Whitley','50169500','03/09/2018','1','03 11 29 63 15','Lorem ipsum dolor','nec','74','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-12-21 23:20:45.000000',1,1,2),(97,'1','Mercedes','Destiny','Mejia','Glenn','39159470','05/09/2018','1','01 75 83 13 32','Lorem ipsum dolor','cubilia Curae; Phasellus ornare. Fusce','71','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2019-08-23 02:07:13.000000',1,2,2),(98,'1','Bruce','Suki','Chen','Stark','5169177','03/09/2018','1','02 47 93 62 98','Lorem','ut, pellentesque','50','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-05-11 07:26:28.000000',1,1,1),(99,'1','Maite','Moana','Stanley','Lowe','46032656','06/09/2018','1','01 32 37 78 75','Lorem ipsum dolor sit','dictum magna. Ut','76','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-01-26 09:47:47.000000',1,1,2),(100,'1','Benjamin','Kimberley','Dyer','Carson','26570336','05/09/2018','0','01 59 31 16 10','Lorem ipsum dolor sit','tincidunt congue turpis. In','83','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-02-01 18:59:31.000000',1,2,1),(101,'1','Owen','Noel','Snider','Howard','33690442','06/09/2018','1','02 91 58 54 73','Lorem ipsum dolor','non, dapibus rutrum,','62','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-09-03 17:07:11.000000',1,1,1),(102,'1','Cleo','Yuri','Peck','Flowers','44849250','06/09/2018','1','05 51 48 06 02','Lorem ipsum dolor','natoque penatibus et magnis','17','{\"agreement1\":\"1\",\"agreement2\":\"0\",\"agreement3\":\"1\",\"agreement4\":\"0\"}','2020-04-08 01:03:45.000000',1,1,1);
/*!40000 ALTER TABLE `beneficiary_beneficiary` ENABLE KEYS */;
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
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (21,'account','emailaddress'),(22,'account','emailconfirmation'),(1,'admin','logentry'),(19,'attendance','attendance'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'authtoken','token'),(14,'beneficiary','beneficiary'),(5,'contenttypes','contenttype'),(11,'document_type','documenttype'),(12,'gender','gender'),(18,'institution','institution'),(17,'institution','institutiontype'),(16,'modality','modality'),(15,'modality','modalitytype'),(13,'nationality','nationality'),(10,'partner','partner'),(9,'person','person'),(8,'rol','rol'),(6,'sessions','session'),(20,'sites','site'),(23,'socialaccount','socialaccount'),(24,'socialaccount','socialapp'),(25,'socialaccount','socialtoken');
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-08-30 12:02:43.778165'),(2,'auth','0001_initial','2019-08-30 12:02:43.925811'),(3,'account','0001_initial','2019-08-30 12:02:44.170178'),(4,'account','0002_email_max_length','2019-08-30 12:02:44.249067'),(5,'admin','0001_initial','2019-08-30 12:02:44.283992'),(6,'admin','0002_logentry_remove_auto_add','2019-08-30 12:02:44.345473'),(7,'admin','0003_logentry_add_action_flag_choices','2019-08-30 12:02:44.355028'),(8,'rol','0001_initial','2019-08-30 12:02:44.376241'),(9,'partner','0001_initial','2019-08-30 12:02:44.398895'),(10,'person','0001_initial','2019-08-30 12:02:44.431841'),(11,'modality','0001_initial','2019-08-30 12:02:44.543980'),(12,'institution','0001_initial','2019-08-30 12:02:44.618368'),(13,'nationality','0001_initial','2019-08-30 12:02:44.689132'),(14,'gender','0001_initial','2019-08-30 12:02:44.716347'),(15,'document_type','0001_initial','2019-08-30 12:02:44.743345'),(16,'beneficiary','0001_initial','2019-08-30 12:02:44.786824'),(17,'attendance','0001_initial','2019-08-30 12:02:44.909693'),(18,'contenttypes','0002_remove_content_type_name','2019-08-30 12:02:45.048914'),(19,'auth','0002_alter_permission_name_max_length','2019-08-30 12:02:45.074526'),(20,'auth','0003_alter_user_email_max_length','2019-08-30 12:02:45.111434'),(21,'auth','0004_alter_user_username_opts','2019-08-30 12:02:45.128104'),(22,'auth','0005_alter_user_last_login_null','2019-08-30 12:02:45.153029'),(23,'auth','0006_require_contenttypes_0002','2019-08-30 12:02:45.157113'),(24,'auth','0007_alter_validators_add_error_messages','2019-08-30 12:02:45.178675'),(25,'auth','0008_alter_user_username_max_length','2019-08-30 12:02:45.227053'),(26,'auth','0009_alter_user_last_name_max_length','2019-08-30 12:02:45.262523'),(27,'auth','0010_alter_group_name_max_length','2019-08-30 12:02:45.297470'),(28,'auth','0011_update_proxy_permissions','2019-08-30 12:02:45.319906'),(29,'authtoken','0001_initial','2019-08-30 12:02:45.350994'),(30,'authtoken','0002_auto_20160226_1747','2019-08-30 12:02:45.505230'),(31,'sessions','0001_initial','2019-08-30 12:02:45.530521'),(32,'sites','0001_initial','2019-08-30 12:02:45.558859'),(33,'sites','0002_alter_domain_unique','2019-08-30 12:02:45.567823'),(34,'socialaccount','0001_initial','2019-08-30 12:02:45.705554'),(35,'socialaccount','0002_token_max_lengths','2019-08-30 12:02:45.986419'),(36,'socialaccount','0003_extra_data_default_dict','2019-08-30 12:02:45.999650');
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
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0rg0813ktlh1mqtzmad6k5h90aees1i5','YmVmODQ2MDU0MWZkNjI5MTEwYTgxYTNhNTliNDg0NjZiMWQ3YWU2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5Mjc2MGFkMGQwYmVlZDUxYWFmNDM3MGI5ZmIyMWYzNmU3NjhjZDg2In0=','2019-09-14 22:36:17.500237'),('14rme919h9zu2dg9bahf9rwhvub3skyk','YmVmODQ2MDU0MWZkNjI5MTEwYTgxYTNhNTliNDg0NjZiMWQ3YWU2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5Mjc2MGFkMGQwYmVlZDUxYWFmNDM3MGI5ZmIyMWYzNmU3NjhjZDg2In0=','2019-09-15 17:43:37.065117'),('26oqnhepzr42a1kft48xlw9yy1lffhin','YmVmODQ2MDU0MWZkNjI5MTEwYTgxYTNhNTliNDg0NjZiMWQ3YWU2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5Mjc2MGFkMGQwYmVlZDUxYWFmNDM3MGI5ZmIyMWYzNmU3NjhjZDg2In0=','2019-09-15 18:09:27.558957'),('29y92dve5d6azcid8emwd8ktfs343r7e','YmVmODQ2MDU0MWZkNjI5MTEwYTgxYTNhNTliNDg0NjZiMWQ3YWU2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5Mjc2MGFkMGQwYmVlZDUxYWFmNDM3MGI5ZmIyMWYzNmU3NjhjZDg2In0=','2019-09-14 20:55:14.142189'),('38zpaph0h6iz5crzi0haa7i9otq0kv91','YmVmODQ2MDU0MWZkNjI5MTEwYTgxYTNhNTliNDg0NjZiMWQ3YWU2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5Mjc2MGFkMGQwYmVlZDUxYWFmNDM3MGI5ZmIyMWYzNmU3NjhjZDg2In0=','2019-09-14 22:28:03.463419'),('4d0bbt2yupngwdsh32xn4wgidprcmsko','YmVmODQ2MDU0MWZkNjI5MTEwYTgxYTNhNTliNDg0NjZiMWQ3YWU2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5Mjc2MGFkMGQwYmVlZDUxYWFmNDM3MGI5ZmIyMWYzNmU3NjhjZDg2In0=','2019-09-14 21:11:09.547081'),('58vh7mvg1zj1wvass2zrgfxy41mxb0qd','YmVmODQ2MDU0MWZkNjI5MTEwYTgxYTNhNTliNDg0NjZiMWQ3YWU2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5Mjc2MGFkMGQwYmVlZDUxYWFmNDM3MGI5ZmIyMWYzNmU3NjhjZDg2In0=','2019-09-15 17:56:23.340882'),('5yrt0hz7oiv9qf6nk0a4i2858p78jn2a','YmVmODQ2MDU0MWZkNjI5MTEwYTgxYTNhNTliNDg0NjZiMWQ3YWU2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5Mjc2MGFkMGQwYmVlZDUxYWFmNDM3MGI5ZmIyMWYzNmU3NjhjZDg2In0=','2019-09-14 22:32:19.071871'),('6htt1cjils9pu261797ymtsgoc532utv','YmVmODQ2MDU0MWZkNjI5MTEwYTgxYTNhNTliNDg0NjZiMWQ3YWU2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5Mjc2MGFkMGQwYmVlZDUxYWFmNDM3MGI5ZmIyMWYzNmU3NjhjZDg2In0=','2019-09-15 17:42:46.785508'),('6jntas5xbg50upqlthattnsdg77pf1td','YmVmODQ2MDU0MWZkNjI5MTEwYTgxYTNhNTliNDg0NjZiMWQ3YWU2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5Mjc2MGFkMGQwYmVlZDUxYWFmNDM3MGI5ZmIyMWYzNmU3NjhjZDg2In0=','2019-09-14 22:38:36.710142'),('74u8zovgiiywdr68bdlu4e8mqzb4h2e5','YmVmODQ2MDU0MWZkNjI5MTEwYTgxYTNhNTliNDg0NjZiMWQ3YWU2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5Mjc2MGFkMGQwYmVlZDUxYWFmNDM3MGI5ZmIyMWYzNmU3NjhjZDg2In0=','2019-09-15 16:54:58.664814'),('8wdla0730gkqbmk0oxmauk10lndj3yhg','YmVmODQ2MDU0MWZkNjI5MTEwYTgxYTNhNTliNDg0NjZiMWQ3YWU2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5Mjc2MGFkMGQwYmVlZDUxYWFmNDM3MGI5ZmIyMWYzNmU3NjhjZDg2In0=','2019-09-14 22:23:35.448692'),('9nuk7fdsv5v8hif7u5iqdllfsdr24w32','YmVmODQ2MDU0MWZkNjI5MTEwYTgxYTNhNTliNDg0NjZiMWQ3YWU2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5Mjc2MGFkMGQwYmVlZDUxYWFmNDM3MGI5ZmIyMWYzNmU3NjhjZDg2In0=','2019-09-15 18:30:06.721930'),('a96q9w4kzu9kmj3e5sh59hc298sig93t','YmVmODQ2MDU0MWZkNjI5MTEwYTgxYTNhNTliNDg0NjZiMWQ3YWU2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5Mjc2MGFkMGQwYmVlZDUxYWFmNDM3MGI5ZmIyMWYzNmU3NjhjZDg2In0=','2019-09-14 20:56:52.467951'),('aaxbvtgu7q60hodaf7l2lc7k2sxtxv1e','YmVmODQ2MDU0MWZkNjI5MTEwYTgxYTNhNTliNDg0NjZiMWQ3YWU2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5Mjc2MGFkMGQwYmVlZDUxYWFmNDM3MGI5ZmIyMWYzNmU3NjhjZDg2In0=','2019-09-15 19:04:30.552616'),('alvexasx01um9farmiec6zc45k8g4a72','YmVmODQ2MDU0MWZkNjI5MTEwYTgxYTNhNTliNDg0NjZiMWQ3YWU2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5Mjc2MGFkMGQwYmVlZDUxYWFmNDM3MGI5ZmIyMWYzNmU3NjhjZDg2In0=','2019-09-15 17:44:26.855981'),('aq6wxev3hkunl0hbrd5sh9dv5pbmfmdw','YmVmODQ2MDU0MWZkNjI5MTEwYTgxYTNhNTliNDg0NjZiMWQ3YWU2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5Mjc2MGFkMGQwYmVlZDUxYWFmNDM3MGI5ZmIyMWYzNmU3NjhjZDg2In0=','2019-09-15 18:51:52.896313'),('arxoinf488m1tq1kwt60n5rlpyaoj531','YmVmODQ2MDU0MWZkNjI5MTEwYTgxYTNhNTliNDg0NjZiMWQ3YWU2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5Mjc2MGFkMGQwYmVlZDUxYWFmNDM3MGI5ZmIyMWYzNmU3NjhjZDg2In0=','2019-09-15 18:54:55.267168'),('bml5zalvypq77ipjmsmpls7k1qswnma7','YmVmODQ2MDU0MWZkNjI5MTEwYTgxYTNhNTliNDg0NjZiMWQ3YWU2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5Mjc2MGFkMGQwYmVlZDUxYWFmNDM3MGI5ZmIyMWYzNmU3NjhjZDg2In0=','2019-09-15 16:55:32.098323'),('ch2wtnadudr7uw7j18e17voqbo8oz824','YmVmODQ2MDU0MWZkNjI5MTEwYTgxYTNhNTliNDg0NjZiMWQ3YWU2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5Mjc2MGFkMGQwYmVlZDUxYWFmNDM3MGI5ZmIyMWYzNmU3NjhjZDg2In0=','2019-09-13 22:45:20.584301'),('gbjksdwozwto87j7yd3q5tcg8juh3631','YmVmODQ2MDU0MWZkNjI5MTEwYTgxYTNhNTliNDg0NjZiMWQ3YWU2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5Mjc2MGFkMGQwYmVlZDUxYWFmNDM3MGI5ZmIyMWYzNmU3NjhjZDg2In0=','2019-09-15 18:22:51.628379'),('gwdwu0t2c674lc4o2vud6wz8i0o0f69c','YmVmODQ2MDU0MWZkNjI5MTEwYTgxYTNhNTliNDg0NjZiMWQ3YWU2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5Mjc2MGFkMGQwYmVlZDUxYWFmNDM3MGI5ZmIyMWYzNmU3NjhjZDg2In0=','2019-09-15 17:21:06.217390'),('ikvzkwdf4i7ildlyu3e8a52fj0ajgl4i','YmVmODQ2MDU0MWZkNjI5MTEwYTgxYTNhNTliNDg0NjZiMWQ3YWU2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5Mjc2MGFkMGQwYmVlZDUxYWFmNDM3MGI5ZmIyMWYzNmU3NjhjZDg2In0=','2019-09-14 21:12:00.800017'),('jzopqxbizjhzdmeicajhta0mrfvj6e2k','YmVmODQ2MDU0MWZkNjI5MTEwYTgxYTNhNTliNDg0NjZiMWQ3YWU2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5Mjc2MGFkMGQwYmVlZDUxYWFmNDM3MGI5ZmIyMWYzNmU3NjhjZDg2In0=','2019-09-15 18:01:46.933910'),('l1pwpdep5n2w2nfeec82dkii7q3aq4ra','YmVmODQ2MDU0MWZkNjI5MTEwYTgxYTNhNTliNDg0NjZiMWQ3YWU2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5Mjc2MGFkMGQwYmVlZDUxYWFmNDM3MGI5ZmIyMWYzNmU3NjhjZDg2In0=','2019-09-14 22:24:58.012923'),('mgytjql422tf0xbkfymug2n9yi4howip','YmVmODQ2MDU0MWZkNjI5MTEwYTgxYTNhNTliNDg0NjZiMWQ3YWU2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5Mjc2MGFkMGQwYmVlZDUxYWFmNDM3MGI5ZmIyMWYzNmU3NjhjZDg2In0=','2019-09-13 12:03:44.665423'),('nc07odtywh6qpbwp83y4p30kybi0mln1','YmVmODQ2MDU0MWZkNjI5MTEwYTgxYTNhNTliNDg0NjZiMWQ3YWU2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5Mjc2MGFkMGQwYmVlZDUxYWFmNDM3MGI5ZmIyMWYzNmU3NjhjZDg2In0=','2019-09-14 22:20:07.642970'),('nglqmfmf8vv7tcczedq8vf0blnz37l7x','YmVmODQ2MDU0MWZkNjI5MTEwYTgxYTNhNTliNDg0NjZiMWQ3YWU2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5Mjc2MGFkMGQwYmVlZDUxYWFmNDM3MGI5ZmIyMWYzNmU3NjhjZDg2In0=','2019-09-14 22:08:11.102545'),('p56tukzklfs4ukw12c24ae1pncrfp4ty','YmVmODQ2MDU0MWZkNjI5MTEwYTgxYTNhNTliNDg0NjZiMWQ3YWU2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5Mjc2MGFkMGQwYmVlZDUxYWFmNDM3MGI5ZmIyMWYzNmU3NjhjZDg2In0=','2019-09-14 22:04:15.163023'),('qi59jgpplnwdjp7jxrlgbbqiiwahst42','YmVmODQ2MDU0MWZkNjI5MTEwYTgxYTNhNTliNDg0NjZiMWQ3YWU2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5Mjc2MGFkMGQwYmVlZDUxYWFmNDM3MGI5ZmIyMWYzNmU3NjhjZDg2In0=','2019-09-17 10:53:20.802661'),('ru081f3rzkmysnmibtx4acof6kxkkwmn','ZDA4ZjMyZTkwZmQ2YzAxYTlmNjVjYWE1ZTBjNTM5Y2QzYTdmYjIyNzp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsImFjY291bnRfdXNlciI6IjIiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjczMTdiNjExNzVhM2I1OGVlYjc0ZjYyNDI2ODI1OTA3MjFhOTIzNCJ9','2019-09-15 17:14:49.204327'),('sn3imvls8n9mkg2wzaqx5csvyarvp2do','YmVmODQ2MDU0MWZkNjI5MTEwYTgxYTNhNTliNDg0NjZiMWQ3YWU2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5Mjc2MGFkMGQwYmVlZDUxYWFmNDM3MGI5ZmIyMWYzNmU3NjhjZDg2In0=','2019-09-15 18:56:44.765474'),('tgdf5ano5zq2oc1zcsq3wba9d7rm2704','YmVmODQ2MDU0MWZkNjI5MTEwYTgxYTNhNTliNDg0NjZiMWQ3YWU2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5Mjc2MGFkMGQwYmVlZDUxYWFmNDM3MGI5ZmIyMWYzNmU3NjhjZDg2In0=','2019-09-15 17:45:23.468494'),('w1qdlo9tzc59xh3iaxkmlrgxfxgxnf4p','YmVmODQ2MDU0MWZkNjI5MTEwYTgxYTNhNTliNDg0NjZiMWQ3YWU2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5Mjc2MGFkMGQwYmVlZDUxYWFmNDM3MGI5ZmIyMWYzNmU3NjhjZDg2In0=','2019-09-14 22:21:54.429189'),('ynvsdzvgk470ila9u6o2fc1v4dlfmaa4','YmVmODQ2MDU0MWZkNjI5MTEwYTgxYTNhNTliNDg0NjZiMWQ3YWU2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5Mjc2MGFkMGQwYmVlZDUxYWFmNDM3MGI5ZmIyMWYzNmU3NjhjZDg2In0=','2019-09-15 17:46:28.163507'),('zho8boqwjnhpyj6zviyo7ac5f05nko63','YmVmODQ2MDU0MWZkNjI5MTEwYTgxYTNhNTliNDg0NjZiMWQ3YWU2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5Mjc2MGFkMGQwYmVlZDUxYWFmNDM3MGI5ZmIyMWYzNmU3NjhjZDg2In0=','2019-09-14 22:11:48.370093'),('zpwelh6gdjny7sj0106mps1a30ixzbb4','YmVmODQ2MDU0MWZkNjI5MTEwYTgxYTNhNTliNDg0NjZiMWQ3YWU2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5Mjc2MGFkMGQwYmVlZDUxYWFmNDM3MGI5ZmIyMWYzNmU3NjhjZDg2In0=','2019-09-14 22:23:53.156691');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_type_documenttype`
--

DROP TABLE IF EXISTS `document_type_documenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_type_documenttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_type_documenttype`
--

LOCK TABLES `document_type_documenttype` WRITE;
/*!40000 ALTER TABLE `document_type_documenttype` DISABLE KEYS */;
INSERT INTO `document_type_documenttype` VALUES (1,'CC');
/*!40000 ALTER TABLE `document_type_documenttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gender_gender`
--

DROP TABLE IF EXISTS `gender_gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gender_gender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender_gender`
--

LOCK TABLES `gender_gender` WRITE;
/*!40000 ALTER TABLE `gender_gender` DISABLE KEYS */;
INSERT INTO `gender_gender` VALUES (1,'FEMENINO'),(2,'MASCULINO');
/*!40000 ALTER TABLE `gender_gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institution_institution`
--

DROP TABLE IF EXISTS `institution_institution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institution_institution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `institution_type_id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `institution_institut_institution_type_id_8ff9b09d_fk_instituti` (`institution_type_id`),
  KEY `institution_institut_partner_id_b8ca1f41_fk_partner_p` (`partner_id`),
  CONSTRAINT `institution_institut_institution_type_id_8ff9b09d_fk_instituti` FOREIGN KEY (`institution_type_id`) REFERENCES `institution_institutiontype` (`id`),
  CONSTRAINT `institution_institut_partner_id_b8ca1f41_fk_partner_p` FOREIGN KEY (`partner_id`) REFERENCES `partner_partner` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution_institution`
--

LOCK TABLES `institution_institution` WRITE;
/*!40000 ALTER TABLE `institution_institution` DISABLE KEYS */;
INSERT INTO `institution_institution` VALUES (1,'CC 1',3,1),(2,'CC 1',3,1),(3,'CC 1',3,1),(4,'CC 1',3,1);
/*!40000 ALTER TABLE `institution_institution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institution_institutiontype`
--

DROP TABLE IF EXISTS `institution_institutiontype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institution_institutiontype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution_institutiontype`
--

LOCK TABLES `institution_institutiontype` WRITE;
/*!40000 ALTER TABLE `institution_institutiontype` DISABLE KEYS */;
INSERT INTO `institution_institutiontype` VALUES (1,'Centro Atención al Migrante'),(2,'Institucion Educativa'),(3,'Comedor Comunitario'),(4,'Bodega');
/*!40000 ALTER TABLE `institution_institutiontype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modality_modality`
--

DROP TABLE IF EXISTS `modality_modality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modality_modality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `modality_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `modality_modality_modality_type_id_d07ed2f9_fk_modality_` (`modality_type_id`),
  CONSTRAINT `modality_modality_modality_type_id_d07ed2f9_fk_modality_` FOREIGN KEY (`modality_type_id`) REFERENCES `modality_modalitytype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modality_modality`
--

LOCK TABLES `modality_modality` WRITE;
/*!40000 ALTER TABLE `modality_modality` DISABLE KEYS */;
INSERT INTO `modality_modality` VALUES (1,'Complemento AM',1),(2,'Almuerzo',1),(3,'Complemento PM',1);
/*!40000 ALTER TABLE `modality_modality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modality_modalitytype`
--

DROP TABLE IF EXISTS `modality_modalitytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modality_modalitytype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modality_modalitytype`
--

LOCK TABLES `modality_modalitytype` WRITE;
/*!40000 ALTER TABLE `modality_modalitytype` DISABLE KEYS */;
INSERT INTO `modality_modalitytype` VALUES (1,'Comedores Comunitarios'),(2,'Caminantes'),(3,'Comedores Estudiantiles'),(4,'Canasta Familiar');
/*!40000 ALTER TABLE `modality_modalitytype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nationality_nationality`
--

DROP TABLE IF EXISTS `nationality_nationality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nationality_nationality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nationality_nationality`
--

LOCK TABLES `nationality_nationality` WRITE;
/*!40000 ALTER TABLE `nationality_nationality` DISABLE KEYS */;
INSERT INTO `nationality_nationality` VALUES (1,'COLOMBIA'),(2,'VENEZUELA');
/*!40000 ALTER TABLE `nationality_nationality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_partner`
--

DROP TABLE IF EXISTS `partner_partner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner_partner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_partner`
--

LOCK TABLES `partner_partner` WRITE;
/*!40000 ALTER TABLE `partner_partner` DISABLE KEYS */;
INSERT INTO `partner_partner` VALUES (1,'Socio 1');
/*!40000 ALTER TABLE `partner_partner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_person`
--

DROP TABLE IF EXISTS `person_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partner_id` int(11) DEFAULT NULL,
  `rol_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `person_person_partner_id_f30b2bfe_fk_partner_partner_id` (`partner_id`),
  KEY `person_person_rol_id_d9c7bc22_fk_rol_rol_id` (`rol_id`),
  CONSTRAINT `person_person_partner_id_f30b2bfe_fk_partner_partner_id` FOREIGN KEY (`partner_id`) REFERENCES `partner_partner` (`id`),
  CONSTRAINT `person_person_rol_id_d9c7bc22_fk_rol_rol_id` FOREIGN KEY (`rol_id`) REFERENCES `rol_rol` (`id`),
  CONSTRAINT `person_person_user_id_da0d911e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_person`
--

LOCK TABLES `person_person` WRITE;
/*!40000 ALTER TABLE `person_person` DISABLE KEYS */;
INSERT INTO `person_person` VALUES (1,NULL,NULL,1),(2,NULL,NULL,2);
/*!40000 ALTER TABLE `person_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_rol`
--

DROP TABLE IF EXISTS `rol_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol_rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_rol`
--

LOCK TABLES `rol_rol` WRITE;
/*!40000 ALTER TABLE `rol_rol` DISABLE KEYS */;
INSERT INTO `rol_rol` VALUES (1,'Rol 1');
/*!40000 ALTER TABLE `rol_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`),
  CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

LOCK TABLES `socialaccount_socialapp_sites` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-03 19:47:44
