-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: scommesse
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `evento` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `quota1` float NOT NULL,
  `tipologiaeventi` varchar(45) NOT NULL,
  `quotaX` float DEFAULT NULL,
  `quota2` float NOT NULL,
  `live` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES (1,'LOb,arda Csta',1,'Bicicletta',1,10,'no'),(2,'Irlavnada vs mirnia',3,'Calcio',3,20,'no'),(3,'Liyca end strug',50,'Calcioa',50,10000,'no'),(4,'Michela va in passago',1,'Tennis',0,2,'si'),(5,'Mircolino',2,'Calcio',22,2,'si'),(6,'Sabatino',1,'Tennis',0,2,'si'),(7,'Paloconsemaforo',2,'Calcio',0,3,'si'),(8,'Mandarancio',1,'Tennis',0,50,'si'),(9,'Ghigliottina',3,'Killer',0,25,'no'),(10,'ComputerSize',25,'Bicicletta',0,22,'no'),(11,'Michela va in passago',1,'Tennis',0,2,'no'),(12,'Mircolino',2,'Calcio',22,2,'no'),(13,'Sabatino',1,'Tennis',0,2,'no'),(14,'Paloconsemaforo',2,'Calcio',0,3,'no'),(15,'Mandarancio',1,'Tennis',0,50,'no'),(16,'Ghigliottina',3,'Killer',0,25,'no'),(17,'ComputerSize',25,'Bicicletta',0,22,'no'),(18,'Michela va in passago',1,'Tennis',0,2,'no'),(19,'Mircolino',2,'Calcio',22,2,'no'),(20,'Sabatino',1,'Tennis',0,2,'no'),(21,'Paloconsemaforo',2,'Calcio',22,3,'no'),(22,'Mandarancio',1,'Tennis',0,50,'no'),(23,'Ghigliottina',3,'Killer',0,25,'no'),(24,'ComputerSize',25,'Bicicletta',0,10,'no'),(25,'Michela va in passago',1,'Tennis',0,2,'no'),(26,'Mircolino',2,'Calcio',1,2,'no'),(27,'Sabatino',1,'Tennis',0,2,'no'),(28,'Paloconsemaforo',2,'Calcio',11,3,'no'),(29,'Mandarancio',1,'Tennis',0,50,'no'),(30,'Ghigliottina',3,'Killer',0,25,'no'),(31,'ComputerSize',25,'Bicicletta',0,22,'no'),(32,'Michela va in passago',1,'Tennis',0,2,'no'),(33,'Mircolino',2,'Calcio',22,2,'no'),(34,'Sabatino',1,'Tennis',0,2,'no'),(35,'Paloconsemaforo',2,'Calcio',11,3,'no'),(36,'Mandarancio',1,'Tennis',0,50,'no'),(37,'Ghigliottina',3,'Killer',0,25,'no'),(38,'ComputerSize',25,'Bicicletta',0,23,'no'),(39,'Michela va in passago',1,'Tennis',0,2,'no'),(40,'Mircolino',2,'Calcio',3,2,'no'),(41,'Sabatino',1,'Tennis',0,2,'no'),(42,'Paloconsemaforo',2,'Calcio',2,3,'no'),(43,'Mandarancio',1,'Tennis',0,50,'no'),(44,'Ghigliottina',3,'Killer',0,25,'no'),(45,'ComputerSize',25,'Bicicletta',0,23,'no'),(46,'dsds',1,'Killer',0,23,'no');
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-17 17:20:47
