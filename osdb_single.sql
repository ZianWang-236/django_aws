-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: osdb
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '????????????id',
  `shop_id` int DEFAULT NULL COMMENT '??????id',
  `name` varchar(50) DEFAULT NULL COMMENT '????????????',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '?????????1?????? 9??????',
  `create_at` datetime DEFAULT NULL COMMENT '????????????',
  `update_at` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,1,'????????????',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(2,1,'??????',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(3,1,'??????',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(4,1,'???/??????',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(5,2,'????????????',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(6,2,'??????',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(7,2,'??????',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(8,2,'???/??????',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(9,3,'??????',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(10,3,'????????????',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(13,1,'aa',1,'2022-12-03 14:12:01','2022-12-03 14:12:01'),(14,1,'aaaa',1,'2022-12-03 15:12:45','2022-12-03 15:12:45'),(15,1,'bbbb',1,'2022-12-03 15:12:59','2022-12-03 15:12:59'),(16,3,'pppp',1,'2022-12-03 15:12:04','2022-12-03 17:12:11'),(17,1,'dddd',9,'2022-12-03 15:12:09','2022-12-03 17:12:14');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-12-01 20:18:42.702006'),(2,'auth','0001_initial','2022-12-01 20:18:43.094737'),(3,'admin','0001_initial','2022-12-01 20:18:43.185162'),(4,'admin','0002_logentry_remove_auto_add','2022-12-01 20:18:43.200785'),(5,'admin','0003_logentry_add_action_flag_choices','2022-12-01 20:18:43.200785'),(6,'contenttypes','0002_remove_content_type_name','2022-12-01 20:18:43.267746'),(7,'auth','0002_alter_permission_name_max_length','2022-12-01 20:18:43.330241'),(8,'auth','0003_alter_user_email_max_length','2022-12-01 20:18:43.377113'),(9,'auth','0004_alter_user_username_opts','2022-12-01 20:18:43.392737'),(10,'auth','0005_alter_user_last_login_null','2022-12-01 20:18:43.439609'),(11,'auth','0006_require_contenttypes_0002','2022-12-01 20:18:43.439609'),(12,'auth','0007_alter_validators_add_error_messages','2022-12-01 20:18:43.455235'),(13,'auth','0008_alter_user_username_max_length','2022-12-01 20:18:43.502104'),(14,'auth','0009_alter_user_last_name_max_length','2022-12-01 20:18:43.548990'),(15,'auth','0010_alter_group_name_max_length','2022-12-01 20:18:43.595866'),(16,'auth','0011_update_proxy_permissions','2022-12-01 20:18:43.611486'),(17,'auth','0012_alter_user_first_name_max_length','2022-12-01 20:18:43.658358');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('poq4fas9i4d4zze5hp94e2pw57c45b78','.eJzdWtty20YM_RUNHxuHXSwWe9FX9L3ueJa3WK0taXRJJs343wvQEkWRFC2m7YMk2xyJxGpxFsDBZfwj2T6v1otltUrmP5JFkczhIVnG1zKZJ497R6ge914peNxTqTzfKaPmqyqd3Pcheai_oJa2DorHfbCILJ0ry1esZH1RVrI-OJbOV1_LzdN6kfMS0GjkL_1z_YUfZXG5bJ69fDncjUWxKbfbegdC4H1NGfNaH93ZEzGe72xKC3IFkQebsSRVhldprGQt8VMfXCUyaHy9TJRcP6-W5UFBss4HRQJ0F3f7bX1C-aaMu_Ip7lhIK60-K_dZqxmoOeg5Ghber4u-hJnVj-dkk7eH5HWVLV7K_bbcNGfv-PAX-V8HA-T77W71yo_5FL7GXWQ5XrQpl-l6KUfz_gWiJytKHlDDqJr6M_BvmGmo1bR9NXsSrCbba1F9z1eF7ERBy7JvZXamN_E38eeD3n8v4vJbrFVsoZE78kTON26331ab4uk5bp9l51ihwgqKShuVqcxYS1nuid-ZaFzZXrKNL6Ks9YRet-DaYbgKZuAEDPkLcEXCiwSQwM1Z4Mtq8_1lsd0JPhgKDMI8FzeqxLECsVOGAErUXBSsy-_NCgmOp8P74zc3n9uhQMiYndUqJePJqWNQnGKxE3mf-IMuS94_IyVaoPkkali-ZSlIZK43i5wXa0rVh94LMFNhrhX_XvJeEv9mCVR8Tu8I9VSEHkmnrCoQuWsQkuWQ9qg4aEOpJVxtnrWg6auhIfuzngANJ0NjUKn1yHSpu9Cs9yQ4itprLP4vAHGONAGgmQyQnEm1Nw4ddgF6FUkckrL_GJSdw0U6HXJI1UKFH6CyToH3yKiCdoB0oNUDqN_W8nPSOoQwrvY7mzDH25pvBtTuSbz9wYyjjwyj28FgC1uHc9FlFRqxmx60G9NBqoyxIfTsNuyYp43focMHyNsGc3MMEwxmJ6Px2qQYnCVFPTROcxIP3mUXcNircRhWdIrjuek4LKbWofbUw3GKpn9hCQNzhRMQ-MkIglVsCTKAvWxluTxj3WOUosoEqcgogyMddDD56zFpNsw1mCSu8BhX2M7cuareHb4bV2EEPw7hDwBG4kpx8fWRJ7bQXk9-xnDunmBBUJMhKEupC44jv5-OP2Bxcz0OmkbiMFY4XTBFcKnTCFpDF0dwpE8Wn6y7ZUqbovtYSTSsuyZMvTecgmxXd0IiaU4qaXL4xTiqyCTtuEiWFsh1m7Gjk11f8hkm7Ck0ocfqhi5Abs8UVwwAKWp0imu_sxRbd3EMxxYgcaKlr_OqEraweZz9MmOnc3nQrdJBXZGDwRzrIbjU4rQkaq4wR64w7SDOrfm1W1OfFfhjRaIZNDbyWXjOxKafi9sBJ6EmJyKcKWr8lOv6wQO47Lpjlr2AxpqU22NN0EeDPmtmB0a1nHNCEg7TkjCM1UbDCIizMHouJ4zvc3jI3_2P30dqIbg-uogT1pTogrF6aBiB5TqIyIJzPepzrpI5R54HuWLLi_B6BDgxCY1VQhcQeJ9y02uh3xOa0uTHKtXmBn4mDshwKExhuDEK7yKoewhOMSY1pDiJdvjt4P_17Emu_gTA8-v6hoLmeqCsPm8olDthmMJM7yyNzqfkgDx3d10UVVE2bFQqqU0tVK10oybQ8sgopi1R0zI0NRycirgYTzxcCzXkDaYl1BOj9rjqIJbxqy32JphWxT7fDc1_7naac9aD3t9E56wVuNepzlkNc0-THb7deOeNjXcekoZ07mVsk9gjotsf3STuiOWWxzeJP6K4qxHOQxKOuG55NJNAw163P59J4FQO3eSQJoGm0rnjSU2im1rg_sY13a7gHgYwnR7mVqcwnR7rVkcxHAgNjBuexyTg2v9YcqtDmUSfmtObnswkuuGtOxjPMJ7dahdfnl5Xy_J7Mldv_wDebpMn:1p83MJ:NXFKX3S7DgzM9SudBUjMWW2O9bCSO3Vmpk1hRr1llVA','2023-01-04 17:58:27.690625');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '?????????id',
  `nickname` varchar(50) DEFAULT NULL COMMENT '??????',
  `avatar` varchar(255) DEFAULT NULL COMMENT '??????',
  `mobile` varchar(50) DEFAULT NULL COMMENT '??????',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '??????:1??????/2??????/9??????',
  `create_at` datetime DEFAULT NULL COMMENT '????????????',
  `update_at` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'lixiaofeng','moren.png','11234567899',9,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(2,'jack','moren.png','12345678965',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(3,'wo879','moren.png','13456789522',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(4,'mt100','moren.png','13567895563',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(5,'??????','moren.png','12345678901',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(6,'??????','moren.png','12345678902',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(7,'??????','moren.png','12345678903',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(8,'??????','moren.png','12345678904',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(9,'??????','moren.png','12345678905',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(10,'??????','moren.png','12345678906',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(11,'??????','moren.png','12345678909',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(12,'??????','moren.png','18642805564',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(13,'??????','moren.png','13116051729',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(14,'??????','moren.png','13161485799',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(15,'??????','moren.png','11234567888',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(16,'??????','moren.png','19919940344',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(17,'customer','moren.png','1123581321',1,'2022-12-19 21:12:36','2022-12-19 21:12:36'),(18,'customer','moren.png','01123581321',1,'2022-12-20 10:12:10','2022-12-20 10:12:10');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '????????????id',
  `order_id` int unsigned DEFAULT NULL COMMENT '??????id',
  `product_id` int unsigned DEFAULT NULL COMMENT '??????id',
  `product_name` varchar(50) DEFAULT NULL COMMENT '????????????',
  `price` double(6,2) unsigned DEFAULT NULL COMMENT '??????',
  `quantity` int unsigned NOT NULL DEFAULT '1' COMMENT '??????',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '??????:1??????/9??????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb3 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='?????????????????????';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (36,16,1,'?????????+?????????+??????',25.00,1,1),(37,16,14,'?????????',6.00,1,1),(38,16,12,'????????????????????????',15.00,1,1),(39,17,11,'??????',4.00,1,1),(40,17,5,'???????????????',19.00,1,1),(41,17,22,'?????????8',8888.00,1,1),(42,20,1,'?????????+?????????+??????',25.00,1,1),(43,20,20,'PpPpPp',999.00,1,1),(44,20,8,'??????????????????',18.00,1,1),(45,20,10,'????????????',4.00,1,1),(46,20,14,'?????????',6.00,1,1),(47,21,17,'?????????',4.00,1,1),(48,22,1,'?????????+?????????+??????',25.00,1,1),(49,22,5,'???????????????',19.00,1,1),(50,22,24,'??????????????? * 1???',20.00,1,1),(51,22,23,'????????????',100.00,1,1),(52,23,1,'?????????+?????????+??????',25.00,1,1),(53,23,2,'?????????+????????????',22.00,1,1),(54,23,5,'???????????????',19.00,1,1),(55,24,4,'??????+????????????',22.00,2,1),(56,24,3,'????????????+????????????',22.00,3,1),(57,24,2,'?????????+????????????',22.00,1,1),(58,25,15,'?????????',5.00,1,1),(59,25,14,'?????????',6.00,1,1),(60,25,13,'???????????????',4.00,1,1),(61,25,7,'?????????',19.00,1,1),(62,26,2,'?????????+????????????',22.00,1,1),(63,26,20,'PpPpPp',999.00,1,1),(64,26,24,'??????????????? * 1???',20.00,1,1);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '?????????id',
  `shop_id` int unsigned DEFAULT NULL COMMENT '??????id???',
  `member_id` int unsigned DEFAULT NULL COMMENT '??????id',
  `user_id` int unsigned DEFAULT NULL COMMENT '?????????id',
  `money` double(8,2) DEFAULT NULL COMMENT '??????',
  `status` tinyint unsigned DEFAULT NULL COMMENT '????????????:1?????????/2??????/3?????????',
  `payment_status` tinyint unsigned DEFAULT NULL COMMENT '????????????:1?????????/2?????????/3?????????',
  `create_at` datetime DEFAULT NULL COMMENT '????????????',
  `update_at` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (16,1,0,15,46.00,2,2,'2022-12-13 17:12:31','2022-12-13 17:12:31'),(17,1,0,15,8911.00,3,2,'2022-12-13 17:12:21','2022-12-13 17:12:21'),(18,1,0,14,900.00,2,2,'2022-12-13 18:12:12','2022-12-13 18:12:12'),(19,1,0,13,900.00,3,2,'2022-12-13 18:12:12','2022-12-13 18:12:12'),(20,1,0,15,1052.00,3,2,'2022-12-13 21:12:28','2022-12-13 21:12:28'),(21,1,0,15,4.00,2,2,'2022-12-13 21:12:16','2022-12-13 21:12:16'),(22,1,0,15,164.00,1,2,'2022-12-14 09:12:45','2022-12-14 09:12:45'),(23,1,0,15,66.00,1,2,'2022-12-19 15:12:38','2022-12-19 15:12:38'),(24,1,17,0,132.00,1,2,'2022-12-20 21:12:15','2022-12-20 21:12:15'),(25,1,17,0,34.00,1,2,'2022-12-21 11:12:38','2022-12-21 11:12:38'),(26,1,17,0,1041.00,3,2,'2022-12-21 11:12:49','2022-12-21 11:12:49');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '?????????id',
  `order_id` int unsigned DEFAULT NULL COMMENT '??????id',
  `member_id` int unsigned DEFAULT NULL COMMENT '??????id',
  `money` double(8,2) unsigned DEFAULT NULL COMMENT '????????????',
  `type` tinyint unsigned DEFAULT NULL COMMENT '???????????????1????????????/2????????????',
  `bank` tinyint unsigned DEFAULT NULL COMMENT '??????????????????:1??????/2??????/3??????/4?????????',
  `status` tinyint unsigned DEFAULT NULL COMMENT '????????????:1?????????/2?????????/3?????????',
  `create_at` datetime DEFAULT NULL COMMENT '????????????',
  `update_at` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (14,16,0,46.00,2,2,2,'2022-12-13 17:12:31','2022-12-13 17:12:31'),(15,17,0,8911.00,2,3,2,'2022-12-13 17:12:21','2022-12-13 17:12:21'),(16,20,0,1052.00,2,3,2,'2022-12-13 21:12:28','2022-12-13 21:12:28'),(17,21,0,4.00,2,1,2,'2022-12-13 21:12:16','2022-12-13 21:12:16'),(18,22,0,164.00,2,1,2,'2022-12-14 09:12:45','2022-12-14 09:12:45'),(19,23,0,66.00,2,1,2,'2022-12-19 15:12:38','2022-12-19 15:12:38'),(20,24,17,132.00,2,4,2,'2022-12-20 21:12:15','2022-12-20 21:12:15'),(21,25,17,34.00,2,4,2,'2022-12-21 11:12:38','2022-12-21 11:12:38'),(22,26,17,1041.00,2,4,2,'2022-12-21 11:12:49','2022-12-21 11:12:49');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '??????id',
  `shop_id` int DEFAULT NULL COMMENT '??????id',
  `category_id` int DEFAULT NULL COMMENT '????????????id',
  `cover_pic` varchar(50) DEFAULT NULL COMMENT '????????????',
  `name` varchar(50) DEFAULT NULL COMMENT '????????????',
  `price` double(6,2) DEFAULT NULL COMMENT '??????',
  `status` tinyint DEFAULT NULL COMMENT '?????????1:??????  2:??????  9:??????',
  `create_at` datetime DEFAULT NULL COMMENT '????????????',
  `update_at` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,1,'1536657620.5485704.jpg','?????????+?????????+??????',25.00,1,'2020-07-11 09:20:20','2020-07-25 10:20:30'),(2,1,1,'1536658352.9341557.jpg','?????????+????????????',22.00,1,'2020-07-11 09:32:32','2020-07-25 10:20:30'),(3,1,1,'1536658415.6838002.jpg','????????????+????????????',22.00,1,'2020-07-11 09:33:35','2020-07-25 10:20:30'),(4,1,1,'1536658574.2847373.jpg','??????+????????????',22.00,1,'2020-07-11 09:36:14','2020-07-25 10:20:30'),(5,1,2,'1536658659.0446993.jpg','???????????????',19.00,1,'2020-07-11 09:37:39','2020-07-25 10:20:30'),(6,1,2,'1536658824.3976505.jpg','????????????',16.00,1,'2020-07-11 09:40:24','2020-07-25 10:20:30'),(7,1,2,'1536658863.6732855.jpg','?????????',19.00,1,'2020-07-11 09:41:03','2020-07-25 10:20:30'),(8,1,2,'1536658960.3954134.jpg','??????????????????',18.00,1,'2020-07-11 09:42:40','2020-07-25 10:20:30'),(9,1,3,'1536659114.0440235.jpg','?????????',12.00,1,'2020-07-11 09:44:25','2020-07-25 10:20:30'),(10,1,3,'1536659065.7972637.jpg','????????????',4.00,1,'2020-07-11 09:45:14','2020-07-25 10:20:30'),(11,1,3,'1536659197.7231221.jpg','??????',4.00,1,'2020-07-11 09:46:37','2020-07-25 10:20:30'),(12,1,3,'1536659253.8842716.jpg','????????????????????????',15.00,1,'2020-07-11 09:47:33','2020-07-25 10:20:30'),(13,1,4,'1536659311.8699493.jpg','???????????????',4.00,1,'2020-07-11 09:48:31','2020-07-25 10:20:30'),(14,1,4,'1536659364.7892513.jpg','?????????',6.00,1,'2020-07-11 09:49:24','2020-07-25 10:20:30'),(15,1,4,'1536659563.3897648.jpg','?????????',5.00,1,'2020-07-11 09:52:43','2020-07-25 10:20:30'),(16,1,4,'1536659605.5561771.jpg','?????????',3.00,1,'2020-07-11 09:53:25','2020-07-25 10:20:30'),(17,1,4,'1536659688.4856157.jpg','?????????',4.00,1,'2020-07-11 09:54:48','2020-07-25 10:20:30'),(18,2,7,'1536659065.7972636.jpg','????????????',4.00,1,'2020-07-04 06:17:18','2020-07-25 10:20:30'),(19,3,10,'1536658666.8341557.jpg','?????????+???????????????',24.00,1,'2020-07-06 08:46:28','2020-07-25 07:34:07'),(20,3,1,'1670188374.927135.png','PpPpPp',999.00,1,'2022-12-04 16:12:54','2022-12-04 16:12:54'),(21,3,1,'1670188403.4816966.png','PpPpPp',999.00,9,'2022-12-04 16:13:23','2022-12-04 16:12:50'),(22,1,4,'1670189754.45037.png','?????????8',8888.00,1,'2022-12-04 16:15:29','2022-12-04 16:12:07'),(23,1,4,'1671028378.5715873.png','????????????',100.00,1,'2022-12-14 09:32:58','2022-12-14 09:32:58'),(24,1,3,'1671028411.3237052.png','??????????????? * 1???',20.00,1,'2022-12-14 09:33:31','2022-12-14 09:33:31');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop`
--

DROP TABLE IF EXISTS `shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '??????id',
  `name` varchar(255) NOT NULL COMMENT '????????????',
  `cover_pic` varchar(255) DEFAULT NULL COMMENT '????????????',
  `banner_pic` varchar(255) DEFAULT NULL COMMENT '??????Logo',
  `address` varchar(255) DEFAULT NULL COMMENT '????????????',
  `phone` varchar(255) DEFAULT NULL COMMENT '????????????',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '?????????1:?????? 2:?????? 9:??????',
  `create_at` datetime DEFAULT NULL COMMENT '????????????',
  `update_at` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop`
--

LOCK TABLES `shop` WRITE;
/*!40000 ALTER TABLE `shop` DISABLE KEYS */;
INSERT INTO `shop` VALUES (1,'??????????????????-??????????????????','12341234.jpg','lg.jpg','????????????????????????????????????????????????8???','12345678905',1,'2020-07-20 10:12:34','2020-07-24 12:34:56'),(2,'??????????????????-??????????????????','57892456.jpg','lg.jpg','??????????????????????????????????????????A???10???','13456789209',1,'2020-07-21 12:23:45','2020-07-22 20:42:16'),(3,'??????????????????-??????????????????','23454567.jpg','lg.jpg','????????????????????????????????????123???','12345677654',1,'2020-07-24 08:20:32','2020-07-25 06:06:07');
/*!40000 ALTER TABLE `shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '????????????id',
  `username` varchar(50) DEFAULT NULL COMMENT '????????????',
  `nickname` varchar(50) DEFAULT NULL COMMENT '??????',
  `password_hash` varchar(100) DEFAULT NULL COMMENT '??????',
  `password_salt` varchar(50) DEFAULT NULL COMMENT '???????????????',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '??????:1??????/2??????/9??????',
  `create_at` datetime DEFAULT NULL COMMENT '????????????',
  `update_at` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'zhangsan','??????','1e191d851b3b49a248f4ea62f6b06410','123456',6,'2020-07-08 18:18:18','2020-07-22 08:06:55'),(2,'lisi','??????','1e191d851b3b49a248f4ea62f6b06410','123456',1,'2020-07-18 08:08:18','2020-07-22 16:21:18'),(3,'xiaoli','?????????','c8a7ca8b274f29cf2c1147a8e0f685a4','639776',6,'2020-07-07 07:53:57','2020-07-08 20:18:18'),(4,'zhangwuji','?????????','cbb748964d243e38f032b78886db824c','437809',9,'2020-02-18 09:06:54','2020-01-14 03:36:25'),(5,'zhaomin','??????','27c744b428b997675c4383e7eae974c3','486570',2,'2020-02-18 09:07:40','2020-02-18 09:07:40'),(6,'cuihua','??????','b5a7379148116549de083f5076233bef','810418',2,'2020-02-18 09:08:35','2020-03-08 20:18:09'),(7,'zhangle','??????','7177bd35ad232f0830fe5c10dcc24b1c','350013',2,'2020-02-19 06:11:16','2020-02-19 12:33:19'),(8,'uu01','??????','a0811c52452216c63e52da04337e9216','268818',1,'2020-01-03 10:27:04','2020-01-03 10:27:04'),(9,'uu02','??????2','56322ead3e2371636ac2395c8399297f','112245',1,'2020-01-03 10:37:37','2020-01-03 10:37:37'),(10,'uu03','??????3','8e7d0c4077c73ad60c23367625d4346f','238764',1,'2020-01-03 11:24:48','2020-01-03 11:24:48'),(11,'uu04','??????4','5eec167b09ea13497843274969460d67','642960',1,'2020-01-03 11:27:00','2020-01-03 11:27:00'),(12,'uu123','??????','5c2e9f69b05413b806dc6951b0f86e51','102905',1,'2020-01-13 23:51:01','2020-01-13 23:51:01'),(13,'uu666','??????3','99e89e8245d9f6f0628b5a59299bd9f7','673778',9,'2020-01-13 23:52:13','2022-12-01 18:12:57'),(14,'mm','??????','05775bb481d11f0648b158cd40a7929c','627985',1,'2020-01-14 01:25:57','2020-01-14 01:25:57'),(15,'zianwang','wangzian','2af303f1df240b0b4665bc850b44a47e','685382',6,'2022-12-01 17:12:58','2022-12-01 18:12:15'),(16,'mingze','andrevvdog','119907d86fde8992745d4b3e46a9be20','209022',1,'2022-12-01 18:12:30','2022-12-01 18:12:41'),(17,'753159','andong','19415ef9f935a0116b9a1f80822f8d49','845061',6,'2022-12-03 20:12:47','2022-12-03 20:12:02');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-25 10:15:06
