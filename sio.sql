-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: sio
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
-- Table structure for table `accesso`
--

DROP TABLE IF EXISTS `accesso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `accesso` (
  `id_accesso` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `pass` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `id_dipendente` int(11) NOT NULL,
  `id_privilegio` int(11) NOT NULL,
  PRIMARY KEY (`id_accesso`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `fk_accesso_dipendente_idx` (`id_dipendente`),
  KEY `fk_accesso_privilegio_idx` (`id_privilegio`),
  CONSTRAINT `fk_accesso_dipendente` FOREIGN KEY (`id_dipendente`) REFERENCES `dipendenti` (`id_dipendente`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_accesso_privilegio` FOREIGN KEY (`id_privilegio`) REFERENCES `privilegio` (`id_privilegio`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accesso`
--

LOCK TABLES `accesso` WRITE;
/*!40000 ALTER TABLE `accesso` DISABLE KEYS */;
INSERT INTO `accesso` VALUES (1,'primay_admin','admin',1,1),(2,'capo_reparto','capo',2,2),(3,'sportellista','sport',3,3);
/*!40000 ALTER TABLE `accesso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratto`
--

DROP TABLE IF EXISTS `contratto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `contratto` (
  `id_contratto` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_contratto` int(11) NOT NULL,
  `durata` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `stipendio` double NOT NULL,
  `id_dipendente` int(11) NOT NULL,
  `id_tipo_ruolo` int(11) NOT NULL,
  PRIMARY KEY (`id_contratto`),
  KEY `fk_contratto_tipo_contratto_idx` (`id_tipo_contratto`),
  KEY `fk_contratto_dipendente_idx` (`id_dipendente`),
  KEY `fk_contratto_tipo_ruolo_idx` (`id_tipo_ruolo`),
  CONSTRAINT `fk_contratto_dipendente` FOREIGN KEY (`id_dipendente`) REFERENCES `dipendenti` (`id_dipendente`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_contratto_tipo_contratto` FOREIGN KEY (`id_tipo_contratto`) REFERENCES `tipo_contratto` (`id_tipo_contratto`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_contratto_tipo_ruolo` FOREIGN KEY (`id_tipo_ruolo`) REFERENCES `tipo_ruolo` (`id_tipo_ruolo`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratto`
--

LOCK TABLES `contratto` WRITE;
/*!40000 ALTER TABLE `contratto` DISABLE KEYS */;
/*!40000 ALTER TABLE `contratto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dimissione`
--

DROP TABLE IF EXISTS `dimissione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dimissione` (
  `id_dimissione` int(11) NOT NULL AUTO_INCREMENT,
  `id_ricovero` int(11) NOT NULL,
  `data_dimissione` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_dimissione`),
  KEY `fk_dimissione_ricovero_idx` (`id_ricovero`),
  CONSTRAINT `fk_dimissione_ricovero` FOREIGN KEY (`id_ricovero`) REFERENCES `ricovero` (`id_ricovero`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimissione`
--

LOCK TABLES `dimissione` WRITE;
/*!40000 ALTER TABLE `dimissione` DISABLE KEYS */;
/*!40000 ALTER TABLE `dimissione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dipendenti`
--

DROP TABLE IF EXISTS `dipendenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dipendenti` (
  `id_dipendente` int(11) NOT NULL AUTO_INCREMENT,
  `id_reparto` int(11) NOT NULL,
  `nome` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cognome` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cod_fis` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `telefono` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `indirizzo` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `id_tipo_ruolo` int(11) NOT NULL,
  PRIMARY KEY (`id_dipendente`),
  UNIQUE KEY `cod_fis_UNIQUE` (`cod_fis`),
  KEY `fk_dipendenti_reparto_idx` (`id_reparto`),
  KEY `fk_dipendenti_tipo_ruolo_idx` (`id_tipo_ruolo`),
  CONSTRAINT `fk_dipendenti_reparto` FOREIGN KEY (`id_reparto`) REFERENCES `reparto` (`id_reparto`),
  CONSTRAINT `fk_dipendenti_tipo_ruolo` FOREIGN KEY (`id_tipo_ruolo`) REFERENCES `tipo_ruolo` (`id_tipo_ruolo`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dipendenti`
--

LOCK TABLES `dipendenti` WRITE;
/*!40000 ALTER TABLE `dipendenti` DISABLE KEYS */;
INSERT INTO `dipendenti` VALUES (1,10,'Sergio','Mattarella','xxx','666','sergio_666@hell.dio','da qualche parte in Ontario',1),(2,10,'Michel','Jackson','yyy','333','michel_white_man@jack.dio','da qualche parte in Purgatorio',2),(3,10,'Gino','Paoli','zzz','111','giggino@p.dio','da qualche parte in Molise',3);
/*!40000 ALTER TABLE `dipendenti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fascia_oraria`
--

DROP TABLE IF EXISTS `fascia_oraria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fascia_oraria` (
  `id_fascia_oraria` int(11) NOT NULL AUTO_INCREMENT,
  `fascia` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_fascia_oraria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fascia_oraria`
--

LOCK TABLES `fascia_oraria` WRITE;
/*!40000 ALTER TABLE `fascia_oraria` DISABLE KEYS */;
INSERT INTO `fascia_oraria` VALUES (1,'9:00'),(2,'11:00'),(3,'13:00'),(4,'15:00'),(5,'17:00');
/*!40000 ALTER TABLE `fascia_oraria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornitore`
--

DROP TABLE IF EXISTS `fornitore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fornitore` (
  `id_fornitore` int(11) NOT NULL AUTO_INCREMENT,
  `ragione_sociale` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `p.iva` varchar(13) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `id_tipo_fornitore` int(11) NOT NULL,
  `telefono` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sede` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `catalogo` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_fornitore`),
  KEY `fk_fornitore_tipo_fornitorre_idx` (`id_tipo_fornitore`),
  CONSTRAINT `fk_fornitore_tipo_fornitorre` FOREIGN KEY (`id_tipo_fornitore`) REFERENCES `tipo_fornitore` (`id_tipo_fornitore`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornitore`
--

LOCK TABLES `fornitore` WRITE;
/*!40000 ALTER TABLE `fornitore` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornitore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_attesa`
--

DROP TABLE IF EXISTS `lista_attesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lista_attesa` (
  `id_lista_attesa` int(11) NOT NULL AUTO_INCREMENT,
  `id_paziente` int(11) NOT NULL,
  `id_reparto` int(11) NOT NULL,
  PRIMARY KEY (`id_lista_attesa`),
  KEY `fk_lista_attesa_paziente_idx` (`id_paziente`),
  KEY `fk_lista_attesa_reparto_idx` (`id_reparto`),
  CONSTRAINT `fk_lista_attesa_paziente` FOREIGN KEY (`id_paziente`) REFERENCES `paziente` (`id_paziente`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_lista_attesa_reparto` FOREIGN KEY (`id_reparto`) REFERENCES `reparto` (`id_reparto`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_attesa`
--

LOCK TABLES `lista_attesa` WRITE;
/*!40000 ALTER TABLE `lista_attesa` DISABLE KEYS */;
/*!40000 ALTER TABLE `lista_attesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paziente`
--

DROP TABLE IF EXISTS `paziente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `paziente` (
  `id_paziente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cognome` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cod_fis` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `data_nascita` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `residenza` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `telefono` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id_paziente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paziente`
--

LOCK TABLES `paziente` WRITE;
/*!40000 ALTER TABLE `paziente` DISABLE KEYS */;
/*!40000 ALTER TABLE `paziente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilegio`
--

DROP TABLE IF EXISTS `privilegio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `privilegio` (
  `id_privilegio` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `descr` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_privilegio`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilegio`
--

LOCK TABLES `privilegio` WRITE;
/*!40000 ALTER TABLE `privilegio` DISABLE KEYS */;
INSERT INTO `privilegio` VALUES (1,'1','Admin Supremo'),(2,'2','Capo reparto'),(3,'3','Sportellista');
/*!40000 ALTER TABLE `privilegio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reparto`
--

DROP TABLE IF EXISTS `reparto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reparto` (
  `id_reparto` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `n_posti_tot` int(11) NOT NULL,
  `n_post_disp` int(11) NOT NULL,
  PRIMARY KEY (`id_reparto`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reparto`
--

LOCK TABLES `reparto` WRITE;
/*!40000 ALTER TABLE `reparto` DISABLE KEYS */;
INSERT INTO `reparto` VALUES (1,'Ginecologia',30,30),(2,'Cardiologia',30,30),(3,'Neurologia',30,30),(4,'Radiologia',30,30),(5,'Odontoiatria',30,30),(6,'Oftalmologia',30,30),(7,'Pronto Soccorso',30,30),(8,'Chirurgia',30,30),(9,'Andrologia',30,30),(10,'Pediatria',30,30),(11,'Psichiatria',30,30),(12,'Terapia Intensiva',5,5),(13,'Oncologia',30,30),(14,'Dermatologia',30,30),(15,'Gastroentorologia',30,30),(16,'Malattie Infettive',5,5);
/*!40000 ALTER TABLE `reparto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ricetta`
--

DROP TABLE IF EXISTS `ricetta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ricetta` (
  `id_ricetta` int(11) NOT NULL AUTO_INCREMENT,
  `num_ricetta` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cod_fis` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cod_esenzione` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `data` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `id_esame` int(11) NOT NULL,
  `id_medico` int(11) NOT NULL,
  PRIMARY KEY (`id_ricetta`),
  KEY `fk_ricetta_esame_idx` (`id_esame`),
  KEY `fk_ricetta_medico_idx` (`id_medico`),
  CONSTRAINT `fk_ricetta_esame` FOREIGN KEY (`id_esame`) REFERENCES `tipo_esame` (`id_tipo_esame`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_ricetta_medico` FOREIGN KEY (`id_medico`) REFERENCES `tipo_medico` (`id_medico`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ricetta`
--

LOCK TABLES `ricetta` WRITE;
/*!40000 ALTER TABLE `ricetta` DISABLE KEYS */;
/*!40000 ALTER TABLE `ricetta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ricovero`
--

DROP TABLE IF EXISTS `ricovero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ricovero` (
  `id_ricovero` int(11) NOT NULL AUTO_INCREMENT,
  `id_paziente` int(11) NOT NULL,
  `id_reparto` int(11) NOT NULL,
  `data_ricovero` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `diagnosi` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_ricovero`),
  KEY `fk_ricovero_paziente_idx` (`id_paziente`),
  KEY `fk_ricovero_reparto_idx` (`id_reparto`),
  CONSTRAINT `fk_ricovero_paziente` FOREIGN KEY (`id_paziente`) REFERENCES `paziente` (`id_paziente`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_ricovero_reparto` FOREIGN KEY (`id_reparto`) REFERENCES `reparto` (`id_reparto`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ricovero`
--

LOCK TABLES `ricovero` WRITE;
/*!40000 ALTER TABLE `ricovero` DISABLE KEYS */;
/*!40000 ALTER TABLE `ricovero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_contratto`
--

DROP TABLE IF EXISTS `tipo_contratto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tipo_contratto` (
  `id_tipo_contratto` int(11) NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_tipo_contratto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_contratto`
--

LOCK TABLES `tipo_contratto` WRITE;
/*!40000 ALTER TABLE `tipo_contratto` DISABLE KEYS */;
INSERT INTO `tipo_contratto` VALUES (1,'Tirocinio'),(2,'Indeterminato'),(3,'Determinato'),(4,'Progetto');
/*!40000 ALTER TABLE `tipo_contratto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_esame`
--

DROP TABLE IF EXISTS `tipo_esame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tipo_esame` (
  `id_tipo_esame` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_tipo_esame`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_esame`
--

LOCK TABLES `tipo_esame` WRITE;
/*!40000 ALTER TABLE `tipo_esame` DISABLE KEYS */;
INSERT INTO `tipo_esame` VALUES (1,'PEV'),(2,'Analisi del Sangue'),(3,'Tac'),(4,'RX'),(5,'Urine'),(6,'Allergico'),(7,'Biopsia'),(8,'Colonscopia'),(9,'Ecografia'),(10,'Ecocardio'),(11,'Elettrocardiogramma'),(12,'Pap Test'),(13,'Elettromiografia'),(14,'Fertilità'),(15,'Prostata'),(16,'Spilometria'),(17,'Lomboscopia'),(18,'Risonanza Magnetica'),(19,'Urografia'),(20,'Oculistico'),(21,'Angiografia');
/*!40000 ALTER TABLE `tipo_esame` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_fornitore`
--

DROP TABLE IF EXISTS `tipo_fornitore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tipo_fornitore` (
  `id_tipo_fornitore` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_tipo_fornitore`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_fornitore`
--

LOCK TABLES `tipo_fornitore` WRITE;
/*!40000 ALTER TABLE `tipo_fornitore` DISABLE KEYS */;
INSERT INTO `tipo_fornitore` VALUES (1,'Servizi Alimentari'),(2,'Farmaceutico'),(3,'Strumenti Medicali'),(4,'Apparecchiature'),(5,'Indumenti'),(6,'Servizi Igenici'),(7,'Servizi Informatici'),(8,'Manutenzione'),(9,'Fornitura Elettrica'),(10,'Fornitura Acqua');
/*!40000 ALTER TABLE `tipo_fornitore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_medico`
--

DROP TABLE IF EXISTS `tipo_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tipo_medico` (
  `id_medico` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_medico`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_medico`
--

LOCK TABLES `tipo_medico` WRITE;
/*!40000 ALTER TABLE `tipo_medico` DISABLE KEYS */;
INSERT INTO `tipo_medico` VALUES (1,'Allergologo'),(2,'Pediatra'),(3,'Dermatologo'),(4,'Radiologo'),(5,'Oftalmologo'),(6,'Cardiolgo'),(7,'Neurologo'),(8,'Odontoiatra'),(9,'Ortopedico'),(10,'Ginecologo'),(11,'Andrologo'),(12,'Pneumologo'),(13,'Oncologo'),(14,'Otorino'),(15,'Psichiatra'),(16,'Chirurgo'),(17,'Gastroenterologo');
/*!40000 ALTER TABLE `tipo_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_ruolo`
--

DROP TABLE IF EXISTS `tipo_ruolo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tipo_ruolo` (
  `id_tipo_ruolo` int(11) NOT NULL AUTO_INCREMENT,
  `ruolo` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_tipo_ruolo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_ruolo`
--

LOCK TABLES `tipo_ruolo` WRITE;
/*!40000 ALTER TABLE `tipo_ruolo` DISABLE KEYS */;
INSERT INTO `tipo_ruolo` VALUES (1,'Capo Reparto'),(2,'Sportellista'),(3,'Primario'),(4,'Infermiere'),(5,'Specialista'),(6,'Anestesista'),(7,'Inserviente'),(8,'Security'),(9,'Ristoratore');
/*!40000 ALTER TABLE `tipo_ruolo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visita`
--

DROP TABLE IF EXISTS `visita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `visita` (
  `id_visita` int(11) NOT NULL AUTO_INCREMENT,
  `id_paziente` int(11) NOT NULL,
  `id_reparto` int(11) NOT NULL,
  `id_ricetta` int(11) DEFAULT NULL,
  `data` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `id_fascia_oraria` int(11) NOT NULL,
  `esito` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id_visita`),
  KEY `fk_visita_paziente_idx` (`id_paziente`),
  KEY `fk_visita_reparto_idx` (`id_reparto`),
  KEY `fk_visita_ricetta_idx` (`id_ricetta`),
  KEY `fk_visita_fascia_oraria_idx` (`id_fascia_oraria`),
  CONSTRAINT `fk_visita_fascia_oraria` FOREIGN KEY (`id_fascia_oraria`) REFERENCES `fascia_oraria` (`id_fascia_oraria`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_visita_paziente` FOREIGN KEY (`id_paziente`) REFERENCES `paziente` (`id_paziente`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_visita_reparto` FOREIGN KEY (`id_reparto`) REFERENCES `reparto` (`id_reparto`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_visita_ricetta` FOREIGN KEY (`id_ricetta`) REFERENCES `ricetta` (`id_ricetta`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visita`
--

LOCK TABLES `visita` WRITE;
/*!40000 ALTER TABLE `visita` DISABLE KEYS */;
/*!40000 ALTER TABLE `visita` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-26 14:02:17
