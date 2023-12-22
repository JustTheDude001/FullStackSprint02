-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: pizzeria
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
  `province` varchar(64) DEFAULT NULL,
  `country` varchar(128) NOT NULL,
  UNIQUE KEY `ID_address` (`ID_address`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'C. Gipuzcuoa','18','3rd','2A','Barcelona','091234','Barcelona','Spain'),(2,'C. Gipuzcuoa','18','3rd','2A','Barcelona','091234','Barcelona','Spain'),(3,'D. Granada','25','5th','1B','Madrid','045678','Madrid','Spain'),(4,'E. Toledo','32','2nd','3C','Seville','078901','Seville','Spain'),(5,'F. Valencia','45','7th','4D','Valencia','012345','Valencia','Spain'),(6,'G. Malaga','53','1st','5E','Malaga','098765','Malaga','Spain'),(7,'H. Zaragoza','61','4th','6F','Zaragoza','067890','Zaragoza','Spain'),(8,'I. Bilbao','74','6th','7G','Bilbao','034567','Bilbao','Spain'),(9,'J. Murcia','86','3rd','8H','Murcia','056789','Murcia','Spain'),(10,'K. Palma','97','5th','9I','Palma','023456','Palma','Spain'),(11,'L. Tarragona','103','2nd','10J','Tarragona','045678','Tarragona','Spain'),(12,'M. Cordoba','115','7th','11K','Cordoba','012345','Cordoba','Spain'),(13,'N. Valladolid','123','1st','12L','Valladolid','098765','Valladolid','Spain'),(14,'O. Alicante','134','4th','13M','Alicante','067890','Alicante','Spain'),(15,'P. Salamanca','142','6th','14N','Salamanca','034567','Salamanca','Spain'),(16,'Q. Girona','155','3rd','15O','Girona','056789','Girona','Spain'),(17,'R. Almeria','167','5th','16P','Almeria','023456','Almeria','Spain'),(18,'S. Castellon','175','2nd','17Q','Castellon','045678','Castellon','Spain'),(19,'T. Badajoz','184','7th','18R','Badajoz','012345','Badajoz','Spain'),(20,'U. Huelva','197','1st','19S','Huelva','098765','Huelva','Spain'),(21,'V. Lleida','205','4th','20T','Lleida','067890','Lleida','Spain'),(22,'W. Ourense','213','6th','21U','Ourense','034567','Ourense','Spain'),(23,'X. Jaen','224','3rd','22V','Jaen','056789','Jaen','Spain'),(24,'Y. Caceres','236','5th','23W','Caceres','023456','Caceres','Spain'),(25,'Z. Pontevedra','245','2nd','24X','Pontevedra','045678','Pontevedra','Spain'),(26,'AA. Zamora','254','7th','25Y','Zamora','012345','Zamora','Spain');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `botigues`
--

DROP TABLE IF EXISTS `botigues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `botigues` (
  `ID_botiga` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(128) DEFAULT NULL,
  `ID_address` int DEFAULT NULL,
  UNIQUE KEY `ID_botiga` (`ID_botiga`),
  KEY `address_fk` (`ID_address`),
  CONSTRAINT `botigues_ibfk_1` FOREIGN KEY (`ID_address`) REFERENCES `addresses` (`ID_address`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `botigues`
--

LOCK TABLES `botigues` WRITE;
/*!40000 ALTER TABLE `botigues` DISABLE KEYS */;
INSERT INTO `botigues` VALUES (1,'Le Pizzeria',1),(2,'Le Pizzeria',1),(3,'La Trattoria',2),(4,'Il Ristorante',3),(5,'Pizza Express',4),(6,'Pasta Palace',5),(7,'Mamma Mia Pizzeria',6),(8,'The Pizza Spot',7),(9,'Italian Delights',8),(10,'Pizza Haven',9),(11,'Rustic Pizzeria',10),(12,'Gourmet Pizza Co.',11),(13,'Mozzarella Magic',12),(14,'Pizzeria Paradiso',13),(15,'Sicilian Slice',14),(16,'Napoli Nights',15),(17,'Cheese Lovers\' Corner',16),(18,'Pizza Passion',17),(19,'Pizzaiolo\'s Pride',18),(20,'Crust & Crumble',19),(21,'Mozzarella Munch',20),(22,'Slice of Italy',21),(23,'Pasta and Pesto',22),(24,'Pizzamania',23),(25,'The Dough House',24),(26,'Flavors of Florence',25);
/*!40000 ALTER TABLE `botigues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `ID_categoria` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(512) DEFAULT NULL,
  UNIQUE KEY `ID_categoria` (`ID_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Pizzes Italianes'),(2,'Burgers'),(3,'Vegetarian'),(4,'Chicken Delights'),(5,'Cheese Lovers'),(6,'Seafood Specials'),(7,'Vegan Options'),(8,'BBQ Specialties'),(9,'Sweet and Spicy'),(10,'Mushroom Madness');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `ID_client` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(256) DEFAULT NULL,
  `cognom_1` varchar(256) DEFAULT NULL,
  `cognom_2` varchar(256) DEFAULT NULL,
  `ID_address` int DEFAULT NULL,
  `telephone` varchar(64) DEFAULT NULL,
  UNIQUE KEY `ID_client` (`ID_client`),
  KEY `address_fk` (`ID_address`),
  CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`ID_address`) REFERENCES `addresses` (`ID_address`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Perico','Gonzalez','Picaso',1,'987123582'),(2,'Perico','Gonzalez','Picaso',1,'987123582'),(3,'Juan','Martinez','Lopez',2,'654789321'),(4,'Maria','Rodriguez','Sanchez',3,'123456789'),(5,'Antonio','Fernandez','Gomez',4,'876543210'),(6,'Isabel','Lopez','Garcia',5,'345678912'),(7,'Manuel','Diaz','Perez',6,'789012345'),(8,'Carmen','Gutierrez','Hernandez',7,'210987654'),(9,'Francisco','Vazquez','Jimenez',8,'543219876'),(10,'Laura','Moreno','Molina',9,'901234567'),(11,'Pedro','Sanchez','Ramirez',10,'432109876'),(12,'Rosa','Jimenez','Gomez',11,'678901234'),(13,'Javier','Ruiz','Alvarez',12,'123450987'),(14,'Sofia','Perez','Fernandez',13,'567890123'),(15,'Miguel','Alonso','Torres',14,'890123456'),(16,'Ana','Herrera','Navarro',15,'234567890'),(17,'David','Castro','Serrano',16,'678901234'),(18,'Elena','Ortega','Mendez',17,'012345678'),(19,'Adrian','Cabrera','Ibanez',18,'345678901'),(20,'Natalia','Vidal','Luna',19,'789012345'),(21,'Roberto','Fuentes','Dominguez',20,'123456789'),(22,'Lucia','Reyes','Cruz',21,'543210987'),(23,'Diego','Guerrero','Santos',22,'987654321'),(24,'Rocio','Rivas','Garrido',23,'210987654'),(25,'Oscar','Navarro','Ferrer',24,'876543210'),(26,'Eva','Gomez','Salgado',25,'654321098');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comandes`
--

DROP TABLE IF EXISTS `comandes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comandes` (
  `ID_comanda` int NOT NULL AUTO_INCREMENT,
  `ID_botiga` int NOT NULL,
  `ID_client` int NOT NULL,
  `ID_repartidor` int NOT NULL,
  `comanda_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deliver_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `tipus` enum('domicili','recollida') DEFAULT NULL,
  `preu_total` float DEFAULT NULL,
  UNIQUE KEY `ID_comanda` (`ID_comanda`),
  KEY `botiga_fk` (`ID_botiga`),
  KEY `client_fk` (`ID_client`),
  KEY `repartidor_fk` (`ID_repartidor`),
  CONSTRAINT `comandes_ibfk_1` FOREIGN KEY (`ID_botiga`) REFERENCES `botigues` (`ID_botiga`),
  CONSTRAINT `comandes_ibfk_2` FOREIGN KEY (`ID_client`) REFERENCES `clients` (`ID_client`),
  CONSTRAINT `comandes_ibfk_3` FOREIGN KEY (`ID_repartidor`) REFERENCES `empleats` (`ID_empleat`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comandes`
--

LOCK TABLES `comandes` WRITE;
/*!40000 ALTER TABLE `comandes` DISABLE KEYS */;
INSERT INTO `comandes` VALUES (1,1,1,1,'2023-09-05 08:25:00','2023-09-05 10:25:00','domicili',24.98),(2,2,5,3,'2022-08-15 07:45:00','2022-08-15 09:45:00','domicili',35.75),(3,3,12,2,'2023-03-20 13:30:00','2023-03-20 15:30:00','recollida',19.99),(4,4,18,4,'2022-11-10 17:15:00','2022-11-10 19:15:00','domicili',42.5),(5,5,8,7,'2023-07-02 10:00:00','2023-07-02 12:00:00','recollida',28.45),(6,6,14,5,'2022-09-27 17:20:00','2022-09-27 19:20:00','domicili',49.99),(7,7,23,1,'2023-01-08 14:50:00','2023-01-08 16:50:00','recollida',15.75),(8,8,4,6,'2022-12-05 07:30:00','2022-12-05 09:30:00','domicili',37.25),(9,9,10,8,'2023-04-18 14:45:00','2023-04-18 16:45:00','recollida',23.5),(10,10,20,9,'2022-10-12 09:15:00','2022-10-12 11:15:00','domicili',32.99),(11,11,16,11,'2023-06-25 18:05:00','2023-06-25 20:05:00','recollida',18.75),(12,12,9,13,'2022-05-30 11:40:00','2022-05-30 13:40:00','domicili',45.5),(13,13,6,15,'2023-02-14 16:10:00','2023-02-14 18:10:00','recollida',21.99),(14,14,21,17,'2022-07-08 08:55:00','2022-07-08 10:55:00','domicili',39.25),(15,15,3,19,'2023-09-01 12:25:00','2023-09-01 14:25:00','recollida',26.5),(16,16,11,21,'2022-11-22 17:45:00','2022-11-22 19:45:00','domicili',29.99),(17,17,7,23,'2023-03-05 10:30:00','2023-03-05 12:30:00','recollida',14.75),(18,18,24,25,'2022-09-14 17:00:00','2022-09-14 19:00:00','domicili',40.5),(19,19,15,2,'2023-04-28 13:15:00','2023-04-28 15:15:00','recollida',17.99),(20,20,17,4,'2022-12-30 09:40:00','2022-12-30 11:40:00','domicili',34.25),(21,21,25,6,'2023-06-10 11:05:00','2023-06-10 13:05:00','recollida',22.5),(22,22,13,8,'2022-04-15 15:35:00','2022-04-15 17:35:00','domicili',47.99),(23,23,19,10,'2023-01-22 19:20:00','2023-01-22 21:20:00','recollida',19.75),(24,24,5,12,'2022-08-03 12:55:00','2022-08-03 14:55:00','domicili',36.5),(25,25,22,14,'2023-02-18 07:10:00','2023-02-18 09:10:00','recollida',31.99);
/*!40000 ALTER TABLE `comandes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleats`
--

DROP TABLE IF EXISTS `empleats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleats` (
  `ID_empleat` int NOT NULL AUTO_INCREMENT,
  `ID_botiga` int NOT NULL,
  `nom` varchar(128) DEFAULT NULL,
  `cognom_1` varchar(128) DEFAULT NULL,
  `cognom_2` varchar(128) DEFAULT NULL,
  `NIF` varchar(32) DEFAULT NULL,
  `telefon` varchar(32) DEFAULT NULL,
  `types` enum('cuiner','repartidor') DEFAULT NULL,
  UNIQUE KEY `ID_empleat` (`ID_empleat`),
  KEY `botiga_fk` (`ID_botiga`),
  CONSTRAINT `empleats_ibfk_1` FOREIGN KEY (`ID_botiga`) REFERENCES `botigues` (`ID_botiga`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleats`
--

LOCK TABLES `empleats` WRITE;
/*!40000 ALTER TABLE `empleats` DISABLE KEYS */;
INSERT INTO `empleats` VALUES (1,1,'TheCookingGuy','Pizzerio','Saez','7123991203-a','8129391823','cuiner'),(2,1,'TheCookingGuy','Pizzerio','Saez','7123991203-a','8129391823','cuiner'),(3,2,'SpeedyDelivery','FastFoodCo','Gomez','6123456789-b','9223344556','repartidor'),(4,3,'ChefMaster','GourmetCuisine','Rodriguez','5123456789-c','7328492013','cuiner'),(5,4,'PizzaExpresso','QuickBites','Martinez','4123456789-d','6427382910','repartidor'),(6,5,'FoodCourier','TastyEats','Lopez','3123456789-e','5629384721','repartidor'),(7,6,'DeliveryNinja','SushiPalace','Fernandez','2123456789-f','8829103847','cuiner'),(8,7,'CulinarySpeed','FineDining','Hernandez','1123456789-g','9928374651','repartidor'),(9,8,'PizzaPro','FlavorFusion','Gonzalez','0123456789-h','7738192837','cuiner'),(10,9,'FastAndFresh','QuickBites','Sanchez','9123456789-i','6637382910','cuiner'),(11,10,'DeliveryDynamo','StreetBites','Perez','8123456789-j','5239384721','repartidor'),(12,11,'GastronomyGuru','GourmetCuisine','Ramirez','7123456789-k','4338283746','cuiner'),(13,12,'ExpressEateries','QuickBites','Torres','6123456789-l','9938273746','repartidor'),(14,13,'SwiftServings','FastFoodCo','Diaz','5123456789-m','7738192736','cuiner'),(15,14,'TasteTrailblazer','CulinaryCraft','Martinez','4123456789-n','5539182736','repartidor'),(16,15,'CuisineComet','GourmetCuisine','Rodriguez','3123456789-o','6638192736','cuiner'),(17,16,'QuickQuisine','QuickBites','Gomez','2123456789-p','7738192736','repartidor'),(18,17,'RapidRations','StreetEats','Fernandez','1123456789-q','9938272736','cuiner'),(19,18,'FreshFare','GourmetCuisine','Lopez','0123456789-r','6638192636','repartidor'),(20,19,'DeliveryDazzle','QuickBites','Hernandez','9123456789-s','7738192536','cuiner'),(21,20,'SpeedySpices','FineDining','Martinez','8123456789-t','5539182536','repartidor'),(22,21,'SwiftSustenance','FastFoodCo','Sanchez','7123456789-u','9938272536','cuiner'),(23,22,'GourmetGo','GourmetCuisine','Perez','6123456789-v','6638192436','repartidor'),(24,23,'ExpressEats','QuickBites','Ramirez','5123456789-w','7738192336','repartidor'),(25,24,'CulinaryCruise','StreetBites','Torres','4123456789-x','5539182336','cuiner'),(26,25,'FastFlavors','GourmetCuisine','Diaz','3123456789-y','9938272236','repartidor');
/*!40000 ALTER TABLE `empleats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza_categories`
--

DROP TABLE IF EXISTS `pizza_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizza_categories` (
  `ID_pizza` int NOT NULL,
  `ID_categoria` int NOT NULL,
  UNIQUE KEY `ID_pizza` (`ID_pizza`),
  KEY `categoria_fk` (`ID_categoria`),
  CONSTRAINT `pizza_categories_ibfk_1` FOREIGN KEY (`ID_categoria`) REFERENCES `categories` (`ID_categoria`),
  CONSTRAINT `pizza_categories_ibfk_2` FOREIGN KEY (`ID_pizza`) REFERENCES `productes` (`ID_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza_categories`
--

LOCK TABLES `pizza_categories` WRITE;
/*!40000 ALTER TABLE `pizza_categories` DISABLE KEYS */;
INSERT INTO `pizza_categories` VALUES (1,1),(11,1),(2,2),(12,2),(3,3),(13,3),(4,4),(14,4),(5,5),(15,5),(6,6),(16,6),(7,7),(17,7),(8,8),(18,8),(9,9),(19,9),(10,10),(20,10);
/*!40000 ALTER TABLE `pizza_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productes`
--

DROP TABLE IF EXISTS `productes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productes` (
  `ID_product` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(256) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `image_path` varchar(2048) DEFAULT NULL,
  `product_type` enum('pizza','hamburguesa','beguda') DEFAULT NULL,
  `preu` double DEFAULT NULL,
  UNIQUE KEY `ID_product` (`ID_product`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productes`
--

LOCK TABLES `productes` WRITE;
/*!40000 ALTER TABLE `productes` DISABLE KEYS */;
INSERT INTO `productes` VALUES (1,'Big Cheese','Classic Cheeseburger','./imgs/bigcheese2.png','hamburguesa',10.25),(2,'Pizza Supreme','Classic Cheeseburger','./imgs/pizzasupreme.png','pizza',8.75),(3,'Soda Splash','Classic Cheeseburger','./imgs/sodasplash.png','beguda',5.5),(4,'Big Cheese','Classic Cheeseburger','./imgs/bigcheese2.png','pizza',8.75),(5,'Hamburguer Deluxe','Classic Cheeseburger','./imgs/hamburguerdeluxe.png','hamburguesa',11),(6,'Fizzy Fusion','Classic Cheeseburger','./imgs/fizzyfusion.png','beguda',4.99),(7,'Big Cheese','Classic Cheeseburger','./imgs/bigcheese2.png','pizza',8.75),(8,'Spicy Stack','Classic Cheeseburger','./imgs/spicystack.png','hamburguesa',10.75),(9,'Chill Quencher','Classic Cheeseburger','./imgs/chillquencher.png','beguda',3.99),(10,'Mighty Melt','Sizzling Cheese Melt','./imgs/mightymelt.png','hamburguesa',9.95),(11,'Pepperoni Paradise','Pepperoni Pizza','./imgs/pepperoniparadise.png','pizza',10.5),(12,'Lemon Lime Burst','Citrus Burst Soda','./imgs/lemonlimeburst.png','beguda',4.25),(13,'Spicy BBQ Bliss','BBQ Chicken Burger','./imgs/spicybbqbliss.png','pizza',11.25),(14,'Veggie Delight','Vegetarian Delight Burger','./imgs/veggiedelight.png','hamburguesa',9.75),(15,'Berry Bliss','Mixed Berry Smoothie','./imgs/berrybliss.png','beguda',5.99),(16,'Double Trouble','Double Cheeseburger','./imgs/doubletrouble.png','pizza',12),(17,'Hot And Spicy','Spicy Chicken Burger','./imgs/hotnspicy.png','hamburguesa',10.5),(18,'Tropical Twist','Tropical Fruit Punch','./imgs/tropicaltwist.png','beguda',4.75),(19,'Mushroom Marvel','Mushroom Swiss Burger','./imgs/mushroommarvel.png','pizza',10.75),(20,'Classic Crunch','Classic Chicken Burger','./imgs/classiccrunch.png','hamburguesa',10.25),(21,'Mango Tango','Mango Tango Smoothie','./imgs/mangotango.png','beguda',5.5),(22,'Pesto Perfection','Pesto Chicken Burger','./imgs/pestoperfection.png','pizza',11.5),(23,'Cheesy Chick','Cheesy Chicken Burger','./imgs/cheesychick.png','hamburguesa',9.99),(24,'Cucumber Cooler','Cucumber Mint Cooler','./imgs/cucumbercooler.png','beguda',4.5),(25,'Savory Supreme','Supreme Sausage Pizza','./imgs/savorysupreme.png','pizza',12.25),(26,'Beyond Burger','Beyond Meat Burger','./imgs/beyondburger.png','hamburguesa',11.75),(27,'Peachy Pleasure','Peach Passion Smoothie','./imgs/peachypleasure.png','beguda',5.25);
/*!40000 ALTER TABLE `productes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productes_comanda`
--

DROP TABLE IF EXISTS `productes_comanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productes_comanda` (
  `ID_comanda` int NOT NULL,
  `ID_producte` int NOT NULL,
  `amount` int NOT NULL,
  KEY `comanda_fk` (`ID_comanda`),
  KEY `producte_fk` (`ID_producte`),
  CONSTRAINT `productes_comanda_ibfk_1` FOREIGN KEY (`ID_comanda`) REFERENCES `comandes` (`ID_comanda`),
  CONSTRAINT `productes_comanda_ibfk_2` FOREIGN KEY (`ID_producte`) REFERENCES `productes` (`ID_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productes_comanda`
--

LOCK TABLES `productes_comanda` WRITE;
/*!40000 ALTER TABLE `productes_comanda` DISABLE KEYS */;
INSERT INTO `productes_comanda` VALUES (1,1,2),(2,2,4),(3,3,6),(4,4,1),(5,5,5),(6,6,3),(7,7,7),(8,8,2),(9,9,1),(10,10,4),(11,11,6),(12,12,3),(13,13,7),(14,14,5),(15,15,2),(16,16,4),(17,17,1),(18,18,6),(19,19,3),(20,20,5);
/*!40000 ALTER TABLE `productes_comanda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'pizzeria'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-14 19:06:41
