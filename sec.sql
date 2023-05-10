-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: sec
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `br`
--

DROP TABLE IF EXISTS `br`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `br` (
  `id_br` int NOT NULL AUTO_INCREMENT,
  `name_br` varchar(45) NOT NULL,
  PRIMARY KEY (`id_br`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `br`
--

LOCK TABLES `br` WRITE;
/*!40000 ALTER TABLE `br` DISABLE KEYS */;
INSERT INTO `br` VALUES (1,'Молекула');
/*!40000 ALTER TABLE `br` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prob`
--

DROP TABLE IF EXISTS `prob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prob` (
  `id_prob` int NOT NULL AUTO_INCREMENT,
  `name_prob` varchar(45) NOT NULL,
  `nomer` varchar(45) NOT NULL,
  `id_br` int DEFAULT NULL,
  PRIMARY KEY (`id_prob`),
  KEY `id_br_idx` (`id_br`),
  CONSTRAINT `id_br` FOREIGN KEY (`id_br`) REFERENCES `secur2`.`br` (`id_br`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prob`
--

LOCK TABLES `prob` WRITE;
/*!40000 ALTER TABLE `prob` DISABLE KEYS */;
INSERT INTO `prob` VALUES (1,'Проба фтора','23',1);
/*!40000 ALTER TABLE `prob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_1`
--

DROP TABLE IF EXISTS `user_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_1` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `flag` int NOT NULL,
  `password` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_bnsyvownwbmn0572d5i5rl0o3` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_1`
--

LOCK TABLES `user_1` WRITE;
/*!40000 ALTER TABLE `user_1` DISABLE KEYS */;
INSERT INTO `user_1` VALUES (3,'Lisa@mail.ru','Anastasia',0,'zxcvbnm'),(4,'eremeeva09.99@mail.ru','Nastle',0,'zxcvbnm');
/*!40000 ALTER TABLE `user_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_active`
--

DROP TABLE IF EXISTS `user_active`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_active` (
  `user_id` int NOT NULL,
  `flags` varchar(255) DEFAULT NULL,
  KEY `FKou3oadbw87i5bts2t338v0kts` (`user_id`),
  CONSTRAINT `FKou3oadbw87i5bts2t338v0kts` FOREIGN KEY (`user_id`) REFERENCES `user_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_active`
--

LOCK TABLES `user_active` WRITE;
/*!40000 ALTER TABLE `user_active` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_active` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_id` bigint NOT NULL,
  `roles` varchar(255) DEFAULT NULL,
  KEY `FKj345gk1bovqvfame88rcx7yyx` (`user_id`),
  CONSTRAINT `FKj345gk1bovqvfame88rcx7yyx` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'ROLE_ADMIN'),(7,'ROLE_USER'),(8,'ROLE_USER'),(9,'ROLE_USER'),(10,'ROLE_USER'),(12,'ROLE_USER'),(13,'ROLE_USER');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` bit(1) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,_binary '','eremeeva09.99@mail.ru','Anastasia','$2a$08$.scWNb7jDqsiCcIGOA3Jh.lmI1fFZ9MAXZNs9QFzjXkB4jZObP.EO'),(7,_binary '\0','q@mail.ru','q','zxcvbnm'),(8,_binary '\0','petrov@mail.ru','Ivan','zxcvbnm'),(9,_binary '\0','qwerty@mail.ru','Lisa','zxcvbnm'),(10,_binary '\0','Lisa@mail.ru','Lisa','zxcvbnm'),(12,_binary '\0','tr@mail.ru','kljhgffd','zxcvbnm'),(13,_binary '','polina@mail.ru','polina','zxcvbnm');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sec'
--

--
-- Dumping routines for database 'sec'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-06 19:15:40
