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
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '订单详情id',
  `order_id` int unsigned DEFAULT NULL COMMENT '订单id',
  `product_id` int unsigned DEFAULT NULL COMMENT '菜品id',
  `product_name` varchar(50) DEFAULT NULL COMMENT '菜品名称',
  `price` double(6,2) unsigned DEFAULT NULL COMMENT '单价',
  `quantity` int unsigned NOT NULL DEFAULT '1' COMMENT '数量',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态:1正常/9删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb3 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='订单详情信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (36,16,1,'红烧肉+狮子头+饮料',25.00,1,1),(37,16,14,'王老吉',6.00,1,1),(38,16,12,'单份香辣笋干烧肉',15.00,1,1),(39,17,11,'青菜',4.00,1,1),(40,17,5,'梅菜扣肉饭',19.00,1,1),(41,17,22,'老八八8',8888.00,1,1),(42,20,1,'红烧肉+狮子头+饮料',25.00,1,1),(43,20,20,'PpPpPp',999.00,1,1),(44,20,8,'无骨咖喱鸡饭',18.00,1,1),(45,20,10,'番茄鸡蛋',4.00,1,1),(46,20,14,'王老吉',6.00,1,1),(47,21,17,'乌梅汁',4.00,1,1),(48,22,1,'红烧肉+狮子头+饮料',25.00,1,1),(49,22,5,'梅菜扣肉饭',19.00,1,1),(50,22,24,'布洛芬胶囊 * 1粒',20.00,1,1),(51,22,23,'连花清瘟',100.00,1,1),(52,23,1,'红烧肉+狮子头+饮料',25.00,1,1),(53,23,2,'红烧肉+番茄鸡蛋',22.00,1,1),(54,23,5,'梅菜扣肉饭',19.00,1,1),(55,24,4,'肥牛+番茄鸡蛋',22.00,2,1),(56,24,3,'梅菜扣肉+番茄鸡蛋',22.00,3,1),(57,24,2,'红烧肉+番茄鸡蛋',22.00,1,1),(58,25,15,'果粒橙',5.00,1,1),(59,25,14,'王老吉',6.00,1,1),(60,25,13,'番茄蛋花汤',4.00,1,1),(61,25,7,'肥牛饭',19.00,1,1),(62,26,2,'红烧肉+番茄鸡蛋',22.00,1,1),(63,26,20,'PpPpPp',999.00,1,1),(64,26,24,'布洛芬胶囊 * 1粒',20.00,1,1);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-25  9:54:44
