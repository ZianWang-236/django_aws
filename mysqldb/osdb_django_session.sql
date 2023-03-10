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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-25  9:54:45
