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
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '会员表id',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `mobile` varchar(50) DEFAULT NULL COMMENT '电话',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态:1正常/2禁用/9删除',
  `create_at` datetime DEFAULT NULL COMMENT '添加时间',
  `update_at` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'lixiaofeng','moren.png','11234567899',9,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(2,'jack','moren.png','12345678965',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(3,'wo879','moren.png','13456789522',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(4,'mt100','moren.png','13567895563',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(5,'顾客','moren.png','12345678901',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(6,'顾客','moren.png','12345678902',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(7,'顾客','moren.png','12345678903',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(8,'顾客','moren.png','12345678904',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(9,'顾客','moren.png','12345678905',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(10,'顾客','moren.png','12345678906',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(11,'顾客','moren.png','12345678909',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(12,'顾客','moren.png','18642805564',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(13,'顾客','moren.png','13116051729',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(14,'顾客','moren.png','13161485799',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(15,'顾客','moren.png','11234567888',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(16,'顾客','moren.png','19919940344',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(17,'customer','moren.png','1123581321',1,'2022-12-19 21:12:36','2022-12-19 21:12:36'),(18,'customer','moren.png','01123581321',1,'2022-12-20 10:12:10','2022-12-20 10:12:10');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-25  9:54:45
