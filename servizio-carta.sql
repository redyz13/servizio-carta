-- MariaDB dump 10.18  Distrib 10.4.17-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: database_elaborato
-- ------------------------------------------------------
-- Server version	10.4.17-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `carta`
--

DROP TABLE IF EXISTS `carta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carta` (
  `codiceCarta` smallint(6) NOT NULL,
  `numero` varchar(20) NOT NULL,
  `pin` smallint(6) NOT NULL,
  `ccv` smallint(6) NOT NULL,
  `dataScadenza` date NOT NULL,
  `dataCreazione` date NOT NULL,
  `saldo` int(11) NOT NULL,
  `codiceTitolare` smallint(6) NOT NULL,
  PRIMARY KEY (`codiceCarta`),
  UNIQUE KEY `numero` (`numero`),
  UNIQUE KEY `pin` (`pin`),
  KEY `codiceTitolare` (`codiceTitolare`),
  CONSTRAINT `carta_ibfk_1` FOREIGN KEY (`codiceTitolare`) REFERENCES `titolare` (`codiceTitolare`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carta`
--

LOCK TABLES `carta` WRITE;
/*!40000 ALTER TABLE `carta` DISABLE KEYS */;
INSERT INTO `carta` VALUES (3573,'73358441392579955781',3062,552,'2028-06-11','2021-12-10',50,1552),(5226,'28732400416613786271',6711,707,'2028-06-04','2021-05-23',50,6319),(5551,'03257705261336663456',434,660,'2029-09-05','2021-10-30',20,2605),(7307,'02306124296072446888',3357,993,'2026-10-24','2021-10-07',3,38),(7980,'47786901635160297184',9973,912,'2026-07-27','2021-05-22',81,696);
/*!40000 ALTER TABLE `carta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esercente`
--

DROP TABLE IF EXISTS `esercente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esercente` (
  `codiceEsercente` smallint(6) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `pword` varchar(20) NOT NULL,
  PRIMARY KEY (`codiceEsercente`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esercente`
--

LOCK TABLES `esercente` WRITE;
/*!40000 ALTER TABLE `esercente` DISABLE KEYS */;
INSERT INTO `esercente` VALUES (1,'nome1','cognome1','username1','password1'),(424,'nome2','cognome2','username2','password2'),(9177,'nome3','cognome3','username3','password3');
/*!40000 ALTER TABLE `esercente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimenti`
--

DROP TABLE IF EXISTS `movimenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimenti` (
  `codiceMovimento` smallint(6) NOT NULL,
  `importoTransazione` int(11) NOT NULL,
  `dataTransazione` date NOT NULL,
  `descrizione` varchar(20) NOT NULL,
  `codiceCarta` smallint(6) NOT NULL,
  PRIMARY KEY (`codiceMovimento`),
  KEY `codiceCarta` (`codiceCarta`),
  CONSTRAINT `movimenti_ibfk_1` FOREIGN KEY (`codiceCarta`) REFERENCES `carta` (`codiceCarta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimenti`
--

LOCK TABLES `movimenti` WRITE;
/*!40000 ALTER TABLE `movimenti` DISABLE KEYS */;
INSERT INTO `movimenti` VALUES (25,100,'2021-05-24','Pagamento 1',7980),(26,50,'2021-05-27','Pagamento 2',7980),(27,30,'2021-06-01','Pagamento 3',7980),(320,50,'2021-12-10','480075',3573),(1596,2,'2021-10-07','Adesivi',7307),(2432,80,'2021-10-30','Smart Fake',5551),(4136,30,'2021-05-26','995771',7980),(5396,10,'2021-05-24','591642',7980),(7374,10,'2021-09-15','361631',7980),(9966,59,'2021-09-18','546534',7980);
/*!40000 ALTER TABLE `movimenti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagamento` (
  `codicePagamento` smallint(6) NOT NULL,
  `importo` int(11) NOT NULL,
  `codiceCarta` smallint(6) NOT NULL,
  `codiceEsercente` smallint(6) NOT NULL,
  PRIMARY KEY (`codicePagamento`),
  KEY `codiceCarta` (`codiceCarta`),
  KEY `codiceEsercente` (`codiceEsercente`),
  CONSTRAINT `pagamento_ibfk_1` FOREIGN KEY (`codiceCarta`) REFERENCES `carta` (`codiceCarta`),
  CONSTRAINT `pagamento_ibfk_2` FOREIGN KEY (`codiceEsercente`) REFERENCES `esercente` (`codiceEsercente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (1,100,7980,1),(2,50,7980,1),(3,30,7980,1),(1351,80,5551,1),(1943,8,7980,1),(2750,30,7980,1),(3830,10,7980,1),(4298,2,7307,1),(4659,59,7980,1),(6205,50,3573,1),(6549,10,7980,1);
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titolare`
--

DROP TABLE IF EXISTS `titolare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titolare` (
  `codiceTitolare` smallint(6) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `pword` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `indirizzo` varchar(20) NOT NULL,
  PRIMARY KEY (`codiceTitolare`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titolare`
--

LOCK TABLES `titolare` WRITE;
/*!40000 ALTER TABLE `titolare` DISABLE KEYS */;
INSERT INTO `titolare` VALUES (38,'rosa','carota','rosa_carota','123','rosa@gmail.com','Via Gesccal'),(696,'nome1','cognome1','username1','password1','email1','indirizzo1'),(1552,'Carlo','Mudae','carlo_mudae','123','ciao@gmail.com','Via Ciao'),(2605,'Carlo','Sorrentino','carlo_mafioso','123','carlomaf@gmail.com','Non Abito'),(6319,'nome2','cognome2','username2','password2','email2','indirizzo2');
/*!40000 ALTER TABLE `titolare` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-11 21:11:08
