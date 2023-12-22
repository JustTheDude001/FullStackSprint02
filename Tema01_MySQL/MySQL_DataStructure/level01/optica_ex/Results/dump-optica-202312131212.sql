-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: optica
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `ID_address` int NOT NULL AUTO_INCREMENT,
  `street` varchar(256) DEFAULT NULL,
  `street_number` varchar(16) DEFAULT NULL,
  `floor` varchar(8) DEFAULT NULL,
  `door` varchar(8) DEFAULT NULL,
  `city` varchar(126) NOT NULL,
  `postal_code` varchar(64) DEFAULT NULL,
  `country` varchar(128) NOT NULL,
  UNIQUE KEY `ID_address` (`ID_address`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'Street 1','Apt 101','Block 5','Area XYZ','City1','12345','Country1'),(2,'Street 2','Apt 202','Block 8','Area ABC','City2','67890','Country2'),(3,'Street 3','Apt 303','Block 10','Area DEF','City3','24680','Country3'),(4,'Street 4','Apt 404','Block 12','Area GHI','City4','13579','Country4'),(5,'Street 5','Apt 505','Block 15','Area JKL','City5','98765','Country5'),(6,'Street 6','Apt 606','Block 18','Area MNO','City6','54321','Country6'),(7,'Street 7','Apt 707','Block 20','Area PQR','City7','13579','Country7'),(8,'Street 8','Apt 808','Block 22','Area STU','City8','97531','Country8'),(9,'Street 9','Apt 909','Block 25','Area VWX','City9','86420','Country9'),(10,'Street 10','Apt 1010','Block 28','Area YZA','City10','24680','Country10'),(11,'Street 11','Apt 1111','Block 30','Area BCD','City11','75319','Country11'),(12,'Street 12','Apt 1212','Block 32','Area EFG','City12','80246','Country12'),(13,'Street 13','Apt 1313','Block 35','Area HIJ','City13','97531','Country13'),(14,'Street 14','Apt 1414','Block 38','Area KLM','City14','64208','Country14'),(15,'Street 15','Apt 1515','Block 40','Area NOP','City15','12345','Country15'),(16,'Street 16','Apt 1616','Block 42','Area QRS','City16','54321','Country16'),(17,'Street 17','Apt 1717','Block 45','Area TUV','City17','97531','Country17'),(18,'Street 18','Apt 1818','Block 48','Area WXY','City18','80246','Country18'),(19,'Street 19','Apt 1919','Block 50','Area ZAB','City19','24680','Country19'),(20,'Street 20','Apt 2020','Block 52','Area BCD','City20','86420','Country20'),(21,'Street 21','Apt 2121','Block 55','Area CDE','City21','97531','Country21'),(22,'Street 22','Apt 2222','Block 58','Area EFG','City22','12345','Country22'),(23,'Street 23','Apt 2323','Block 60','Area GHI','City23','80246','Country23'),(24,'Street 24','Apt 2424','Block 62','Area IJK','City24','54321','Country24'),(25,'Street 25','Apt 2525','Block 65','Area KLM','City25','86420','Country25');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `ID_client` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `ID_address` int NOT NULL,
  `telephone` varchar(64) NOT NULL,
  `email` varchar(128) NOT NULL,
  `registration_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ID_recommendation` int DEFAULT NULL,
  UNIQUE KEY `ID_client` (`ID_client`),
  KEY `address_fk` (`ID_address`),
  KEY `recommendation_fk` (`ID_recommendation`),
  CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`ID_address`) REFERENCES `addresses` (`ID_address`),
  CONSTRAINT `clients_ibfk_2` FOREIGN KEY (`ID_recommendation`) REFERENCES `clients` (`ID_client`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'SomeoneWithNotGoodSight',4,'+34 780 123 764','fakeemailOne@fake.com','2023-12-13 11:08:41',NULL),(2,'AnotherClient',4,'+34 780 987 654','fakeemailTwo@fake.com','2023-12-13 11:08:42',NULL),(3,'ClientXYZ',4,'+34 780 456 123','fakeemailThree@fake.com','2023-12-13 11:08:42',NULL),(4,'ClientABC',4,'+34 780 789 012','fakeemailFour@fake.com','2023-12-13 11:08:42',NULL),(5,'ClientPQR',4,'+34 780 345 678','fakeemailFive@fake.com','2023-12-13 11:08:42',NULL),(6,'ClientLMN',4,'+34 780 567 890','fakeemailSix@fake.com','2023-12-13 11:08:42',4),(7,'ClientEFG',4,'+34 780 234 567','fakeemailSeven@fake.com','2023-12-13 11:08:42',4),(8,'ClientHIJ',4,'+34 780 901 234','fakeemailEight@fake.com','2023-12-13 11:08:42',4),(9,'ClientUVW',4,'+34 780 678 901','fakeemailNine@fake.com','2023-12-13 11:08:43',4),(10,'ClientRST',4,'+34 780 123 456','fakeemailTen@fake.com','2023-12-13 11:08:43',4),(11,'ClientOPQ',4,'+34 780 890 123','fakeemailEleven@fake.com','2023-12-13 11:08:43',4),(12,'ClientXYZ',4,'+34 780 567 890','fakeemailTwelve@fake.com','2023-12-13 11:08:43',4),(13,'ClientGHI',4,'+34 780 234 567','fakeemailThirteen@fake.com','2023-12-13 11:08:43',4),(14,'ClientMNO',4,'+34 780 901 234','fakeemailFourteen@fake.com','2023-12-13 11:08:43',4),(15,'ClientDEF',4,'+34 780 678 901','fakeemailFifteen@fake.com','2023-12-13 11:08:43',4),(16,'ClientJKL',4,'+34 780 123 456','fakeemailSixteen@fake.com','2023-12-13 11:08:43',4),(17,'ClientTUV',4,'+34 780 890 123','fakeemailSeventeen@fake.com','2023-12-13 11:08:44',4),(18,'ClientQRS',4,'+34 780 567 890','fakeemailEighteen@fake.com','2023-12-13 11:08:44',4),(19,'ClientABC',4,'+34 780 234 567','fakeemailNineteen@fake.com','2023-12-13 11:08:44',4),(20,'ClientVWX',4,'+34 780 901 234','fakeemailTwenty@fake.com','2023-12-13 11:08:44',4),(21,'ClientIJK',4,'+34 780 678 901','fakeemailTwentyOne@fake.com','2023-12-13 11:08:45',4),(22,'ClientUVW',4,'+34 780 123 456','fakeemailTwentyTwo@fake.com','2023-12-13 11:08:45',4),(23,'ClientEFG',4,'+34 780 890 123','fakeemailTwentyThree@fake.com','2023-12-13 11:08:46',4),(24,'ClientRST',4,'+34 780 567 890','fakeemailTwentyFour@fake.com','2023-12-13 11:08:46',4),(25,'ClientXYZ',4,'+34 780 234 567','fakeemailTwentyFive@fake.com','2023-12-13 11:08:46',4);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `ID_marca` int NOT NULL AUTO_INCREMENT,
  `ID_proveidor` int DEFAULT NULL,
  `brand` varchar(64) NOT NULL,
  UNIQUE KEY `ID_marca` (`ID_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,4,'Rayban'),(2,7,'Oakley'),(3,2,'Prada'),(4,9,'Tom Ford'),(5,6,'Persol'),(6,1,'Gucci'),(7,3,'Bvlgari'),(8,8,'Chanel'),(9,5,'Dior'),(10,10,'Versace'),(11,1,'Prada'),(12,7,'Rayban'),(13,3,'Oakley'),(14,9,'Gucci'),(15,6,'Chanel'),(16,2,'Versace'),(17,8,'Dolce & Gabbana'),(18,4,'Emporio Armani'),(19,10,'Fendi'),(20,5,'Burberry'),(21,1,'Maui Jim'),(22,7,'Carrera'),(23,3,'Michael Kors'),(24,9,'Tiffany & Co.'),(25,6,'Rayban');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveidor`
--

DROP TABLE IF EXISTS `proveidor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveidor` (
  `ID_proveidor` int NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `ID_address` int NOT NULL,
  `telephone` varchar(64) NOT NULL,
  `fax` varchar(64) NOT NULL,
  `NIF` varchar(64) NOT NULL,
  UNIQUE KEY `ID_proveidor` (`ID_proveidor`),
  KEY `address_fk` (`ID_address`),
  CONSTRAINT `proveidor_ibfk_1` FOREIGN KEY (`ID_address`) REFERENCES `addresses` (`ID_address`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveidor`
--

LOCK TABLES `proveidor` WRITE;
/*!40000 ALTER TABLE `proveidor` DISABLE KEYS */;
INSERT INTO `proveidor` VALUES (1,'Supplier1',1,'111111111','222222222','AAA111'),(2,'VendorA',2,'333333333','444444444','BBB222'),(3,'CompanyX',3,'555555555','666666666','CCC333'),(4,'SupplierZ',4,'777777777','888888888','DDD444'),(5,'TestSupplier',5,'999999999','000000000','EEE555'),(6,'NewSupplier',6,'123456789','987654321','XYZ123'),(7,'VendorB',7,'135792468','864297531','ABCDEF'),(8,'CompanyY',8,'987654321','123456789','ZYX987'),(9,'SupplierX',9,'246813579','987654321','PQRS789'),(10,'TestCompany',10,'555444333','333444555','LMN123'),(11,'SupplierAA',11,'111222333','444555666','XYZ123'),(12,'VendorCC',12,'777888999','333222111','ABCDEF'),(13,'CompanyZZ',13,'999888777','666555444','ZYX987'),(14,'SupplierXY',14,'444555666','777888999','PQRS789'),(15,'TestOrg',15,'888777666','555444333','LMN123'),(16,'SupplierAB',16,'222333444','555666777','ZZZ999'),(17,'VendorDD',17,'444555666','777888999','HHH777'),(18,'CompanyWW',18,'666777888','999000111','UUU333'),(19,'SupplierYZ',19,'777888999','111222333','PPP111'),(20,'TestCorp',20,'888999000','222333444','GGG444'),(21,'SupplierBC',21,'333444555','666777888','RRR222'),(22,'VendorEE',22,'555666777','888999000','JJJ888'),(23,'CompanyVV',23,'222333444','555666777','SSS111'),(24,'SupplierZW',24,'111222333','444555666','TTT999'),(25,'TestFirm',25,'888777666','555444333','OOO777');
/*!40000 ALTER TABLE `proveidor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ulleres`
--

DROP TABLE IF EXISTS `ulleres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ulleres` (
  `ID_glasses` int NOT NULL AUTO_INCREMENT,
  `ID_marca` int DEFAULT NULL,
  `brand` varchar(64) DEFAULT NULL,
  `graduation_glass_1` float DEFAULT NULL,
  `graduation_glass_2` float DEFAULT NULL,
  `mount_type` enum('flotant','pasta','metal·lica') DEFAULT NULL,
  `mount_color` varchar(128) DEFAULT NULL,
  `color_glass_1` varchar(128) DEFAULT NULL,
  `color_glass_2` varchar(128) DEFAULT NULL,
  `price_eu` float DEFAULT NULL,
  UNIQUE KEY `ID_glasses` (`ID_glasses`),
  KEY `marca_fk` (`ID_marca`),
  CONSTRAINT `ulleres_ibfk_1` FOREIGN KEY (`ID_marca`) REFERENCES `marca` (`ID_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ulleres`
--

LOCK TABLES `ulleres` WRITE;
/*!40000 ALTER TABLE `ulleres` DISABLE KEYS */;
INSERT INTO `ulleres` VALUES (1,9,'NewValue4',4.567,-2.1,'metal·lica','green','white','black',5.67),(2,6,'NewValue5',9.012,3.7,'pasta','blue','black','red',9.12),(3,1,'NewValue6',5.678,-0.9,'flotant','purple','yellow','orange',6.78),(4,3,'NewValue7',1.234,5.4,'metal·lica','white','green','brown',3.21),(5,8,'NewValue8',8.901,-3.2,'pasta','black','red','blue',7.89),(6,5,'NewValue9',6.543,1.8,'flotant','yellow','cyan','gray',1.23),(7,10,'NewValue10',2.109,6.5,'pasta','red','orange','purple',10.98),(8,1,'NewValue11',9.876,-5.6,'metal·lica','blue','brown','white',4.32),(9,7,'NewValue12',3.21,2.1,'flotant','orange','black','red',2.76),(10,3,'NewValue13',5.432,-1.3,'metal·lica','gray','purple','cyan',7.89),(11,9,'NewValue14',7.89,4.2,'pasta','green','yellow','blue',5.43),(12,6,'NewValue15',1.234,-3.7,'flotant','red','brown','orange',9.01),(13,2,'NewValue16',4.567,0.9,'metal·lica','cyan','white','black',3.45),(14,8,'NewValue17',8.901,-2.5,'pasta','purple','gray','green',6.78),(15,4,'NewValue18',6.543,3.4,'flotant','black','orange','yellow',2.34),(16,10,'NewValue19',2.109,-0.8,'metal·lica','brown','blue','red',8.76),(17,5,'NewValue20',9.876,5.1,'pasta','white','green','purple',4.32),(18,1,'NewValue21',3.21,-4.2,'flotant','yellow','red','brown',7.89),(19,7,'NewValue22',5.432,1.3,'metal·lica','orange','cyan','gray',5.43),(20,3,'NewValue23',7.89,-3.4,'pasta','black','green','blue',9.01),(21,9,'NewValue24',1.234,0.8,'flotant','red','purple','white',3.45),(22,6,'NewValue25',4.567,-5.1,'metal·lica','gray','blue','orange',2.34);
/*!40000 ALTER TABLE `ulleres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventes`
--

DROP TABLE IF EXISTS `ventes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventes` (
  `ID_venta` int NOT NULL AUTO_INCREMENT,
  `ID_glasses` int NOT NULL,
  `ID_worker` int NOT NULL,
  `ID_client` int NOT NULL,
  `sell_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `ID_venta` (`ID_venta`),
  KEY `glasses_fk` (`ID_glasses`),
  KEY `worker_fk` (`ID_worker`),
  KEY `clients_fk` (`ID_client`),
  CONSTRAINT `ventes_ibfk_1` FOREIGN KEY (`ID_glasses`) REFERENCES `ulleres` (`ID_glasses`),
  CONSTRAINT `ventes_ibfk_2` FOREIGN KEY (`ID_worker`) REFERENCES `workers` (`ID_worker`),
  CONSTRAINT `ventes_ibfk_3` FOREIGN KEY (`ID_client`) REFERENCES `clients` (`ID_client`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventes`
--

LOCK TABLES `ventes` WRITE;
/*!40000 ALTER TABLE `ventes` DISABLE KEYS */;
INSERT INTO `ventes` VALUES (1,5,7,9,'2023-10-15 06:30:00'),(2,1,6,8,'2023-08-20 10:45:00'),(3,9,2,4,'2023-05-27 14:20:00'),(4,3,8,5,'2023-03-10 08:55:00'),(5,7,4,1,'2023-12-01 17:10:00'),(6,2,9,6,'2023-09-05 08:25:00'),(7,8,3,7,'2023-06-18 12:50:00'),(8,4,5,2,'2023-04-22 18:15:00'),(9,6,1,9,'2023-11-13 05:40:00'),(10,3,7,4,'2023-02-28 15:55:00'),(11,9,4,8,'2023-07-09 10:30:00'),(12,2,8,5,'2023-04-03 06:45:00'),(13,6,3,1,'2023-12-24 18:00:00'),(14,7,5,2,'2023-01-15 08:15:00'),(15,5,2,6,'2023-10-31 13:20:00'),(16,3,6,9,'2023-08-12 15:35:00'),(17,8,1,4,'2023-05-06 09:50:00'),(18,4,9,7,'2023-02-19 20:05:00'),(19,1,7,3,'2023-11-20 12:40:00'),(20,6,2,5,'2023-03-01 07:55:00'),(21,9,5,8,'2023-10-07 12:10:00'),(22,2,8,4,'2023-07-02 07:25:00'),(23,5,1,7,'2023-04-14 16:40:00'),(24,7,3,6,'2023-01-23 10:55:00'),(25,4,6,2,'2023-12-05 15:20:00');
/*!40000 ALTER TABLE `ventes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workers`
--

DROP TABLE IF EXISTS `workers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workers` (
  `ID_worker` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `ID_address` int NOT NULL,
  `telephone` varchar(64) NOT NULL,
  `email` varchar(128) NOT NULL,
  `registration_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `ID_worker` (`ID_worker`),
  KEY `address_fk` (`ID_address`),
  CONSTRAINT `workers_ibfk_1` FOREIGN KEY (`ID_address`) REFERENCES `addresses` (`ID_address`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workers`
--

LOCK TABLES `workers` WRITE;
/*!40000 ALTER TABLE `workers` DISABLE KEYS */;
INSERT INTO `workers` VALUES (1,'WorkerNameOne',4,'9123850123','workerFakeEmail@fake.fake','2014-12-12 22:05:23'),(2,'WorkerNameTwo',4,'9123850123','workerFakeEmail2@fake.fake','2014-12-12 22:05:23'),(3,'WorkerNameThree',4,'9123850123','workerFakeEmail3@fake.fake','2014-12-12 22:05:23'),(4,'WorkerNameFour',4,'9123850123','workerFakeEmail4@fake.fake','2014-12-12 22:05:23'),(5,'WorkerNameFive',4,'9123850123','workerFakeEmail5@fake.fake','2014-12-12 22:05:23'),(6,'WorkerNameSix',4,'9123850123','workerFakeEmail6@fake.fake','2014-12-12 22:05:23'),(7,'WorkerNameSeven',4,'9123850123','workerFakeEmail7@fake.fake','2014-12-12 22:05:23'),(8,'WorkerNameEight',4,'9123850123','workerFakeEmail8@fake.fake','2014-12-12 22:05:23'),(9,'WorkerNameNine',4,'9123850123','workerFakeEmail9@fake.fake','2014-12-12 22:05:23'),(10,'WorkerNameTen',4,'9123850123','workerFakeEmail10@fake.fake','2014-12-12 22:05:23'),(11,'WorkerNameEleven',4,'9123850123','workerFakeEmail11@fake.fake','2014-12-12 22:05:23'),(12,'WorkerNameTwelve',4,'9123850123','workerFakeEmail12@fake.fake','2014-12-12 22:05:23'),(13,'WorkerNameThirteen',4,'9123850123','workerFakeEmail13@fake.fake','2014-12-12 22:05:23'),(14,'WorkerNameFourteen',4,'9123850123','workerFakeEmail14@fake.fake','2014-12-12 22:05:23'),(15,'WorkerNameFifteen',4,'9123850123','workerFakeEmail15@fake.fake','2014-12-12 22:05:23'),(16,'WorkerNameSixteen',4,'9123850123','workerFakeEmail16@fake.fake','2014-12-12 22:05:23'),(17,'WorkerNameSeventeen',4,'9123850123','workerFakeEmail17@fake.fake','2014-12-12 22:05:23'),(18,'WorkerNameEighteen',4,'9123850123','workerFakeEmail18@fake.fake','2014-12-12 22:05:23'),(19,'WorkerNameNineteen',4,'9123850123','workerFakeEmail19@fake.fake','2014-12-12 22:05:23'),(20,'WorkerNameTwenty',4,'9123850123','workerFakeEmail20@fake.fake','2014-12-12 22:05:23'),(21,'WorkerNameTwentyOne',4,'9123850123','workerFakeEmail21@fake.fake','2014-12-12 22:05:23'),(22,'WorkerNameTwentyTwo',4,'9123850123','workerFakeEmail22@fake.fake','2014-12-12 22:05:23'),(23,'WorkerNameTwentyThree',4,'9123850123','workerFakeEmail23@fake.fake','2014-12-12 22:05:23'),(24,'WorkerNameTwentyFour',4,'9123850123','workerFakeEmail24@fake.fake','2014-12-12 22:05:23'),(25,'WorkerNameTwentyFive',4,'9123850123','workerFakeEmail25@fake.fake','2014-12-12 22:05:23');
/*!40000 ALTER TABLE `workers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'optica'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-13 12:12:03
