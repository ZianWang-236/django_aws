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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '菜品分类id',
  `shop_id` int DEFAULT NULL COMMENT '店铺id',
  `name` varchar(50) DEFAULT NULL COMMENT '分类名称',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态：1正常 9删除',
  `create_at` datetime DEFAULT NULL COMMENT '添加时间',
  `update_at` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,1,'双拼套餐',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(2,1,'盖饭',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(3,1,'小菜',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(4,1,'汤/饮料',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(5,2,'双拼套餐',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(6,2,'盖饭',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(7,2,'小菜',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(8,2,'汤/饮料',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(9,3,'盖饭',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(10,3,'双拼套餐',1,'2020-07-25 10:20:30','2020-07-25 10:20:30'),(13,1,'aa',1,'2022-12-03 14:12:01','2022-12-03 14:12:01'),(14,1,'aaaa',1,'2022-12-03 15:12:45','2022-12-03 15:12:45'),(15,1,'bbbb',1,'2022-12-03 15:12:59','2022-12-03 15:12:59'),(16,3,'pppp',1,'2022-12-03 15:12:04','2022-12-03 17:12:11'),(17,1,'dddd',9,'2022-12-03 15:12:09','2022-12-03 17:12:14');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
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
