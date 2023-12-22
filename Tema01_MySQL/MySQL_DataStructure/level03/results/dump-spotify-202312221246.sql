-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: spotify
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
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albums` (
  `ID_album` int NOT NULL AUTO_INCREMENT,
  `ID_artist` int NOT NULL,
  `album_title` varchar(512) DEFAULT NULL,
  `artist_name` varchar(512) DEFAULT NULL,
  `publication_year` timestamp NULL DEFAULT NULL,
  `cover_img` varchar(2562) DEFAULT NULL,
  UNIQUE KEY `ID_album` (`ID_album`),
  KEY `artist_fk` (`ID_artist`),
  CONSTRAINT `albums_ibfk_1` FOREIGN KEY (`ID_artist`) REFERENCES `artists` (`ID_artist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists` (
  `ID_artist` int NOT NULL AUTO_INCREMENT,
  `name` varchar(512) DEFAULT NULL,
  `artist_img` varchar(5126) DEFAULT NULL,
  UNIQUE KEY `ID_artist` (`ID_artist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists_relations`
--

DROP TABLE IF EXISTS `artists_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists_relations` (
  `ID_artist_1` int NOT NULL,
  `ID_artist_2` int NOT NULL,
  KEY `artistOne_fk` (`ID_artist_1`),
  KEY `artistTwo_fk` (`ID_artist_2`),
  CONSTRAINT `artists_relations_ibfk_1` FOREIGN KEY (`ID_artist_1`) REFERENCES `artists` (`ID_artist`),
  CONSTRAINT `artists_relations_ibfk_2` FOREIGN KEY (`ID_artist_2`) REFERENCES `artists` (`ID_artist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists_relations`
--

LOCK TABLES `artists_relations` WRITE;
/*!40000 ALTER TABLE `artists_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `artists_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditcards`
--

DROP TABLE IF EXISTS `creditcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creditcards` (
  `ID_creditcard` int NOT NULL AUTO_INCREMENT,
  `card_number` varchar(64) DEFAULT NULL,
  `expire_month` varchar(4) DEFAULT NULL,
  `expire_year` varchar(6) DEFAULT NULL,
  `security_code` varchar(16) DEFAULT NULL,
  UNIQUE KEY `ID_creditcard` (`ID_creditcard`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditcards`
--

LOCK TABLES `creditcards` WRITE;
/*!40000 ALTER TABLE `creditcards` DISABLE KEYS */;
/*!40000 ALTER TABLE `creditcards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `ID_payment` int NOT NULL AUTO_INCREMENT,
  `ID_user` int NOT NULL,
  `date_payment` timestamp NULL DEFAULT NULL,
  `total_amount` float DEFAULT NULL,
  UNIQUE KEY `ID_payment` (`ID_payment`),
  KEY `user_fk` (`ID_user`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`ID_user`) REFERENCES `users` (`ID_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypals`
--

DROP TABLE IF EXISTS `paypals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paypals` (
  `ID_paypal` int NOT NULL AUTO_INCREMENT,
  `paypap_username` varchar(256) DEFAULT NULL,
  UNIQUE KEY `ID_paypal` (`ID_paypal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypals`
--

LOCK TABLES `paypals` WRITE;
/*!40000 ALTER TABLE `paypals` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists` (
  `ID_playlist` int NOT NULL AUTO_INCREMENT,
  `ID_user` int NOT NULL,
  `title` varchar(128) DEFAULT NULL,
  `songs_amount` int DEFAULT NULL,
  `creation_date` timestamp NULL DEFAULT NULL,
  `status` enum('active','deleted') DEFAULT NULL,
  `deletion_date` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `ID_playlist` (`ID_playlist`),
  KEY `user_fk` (`ID_user`),
  CONSTRAINT `playlists_ibfk_1` FOREIGN KEY (`ID_user`) REFERENCES `users` (`ID_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists`
--

LOCK TABLES `playlists` WRITE;
/*!40000 ALTER TABLE `playlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared_playlists`
--

DROP TABLE IF EXISTS `shared_playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shared_playlists` (
  `ID_playlist` int NOT NULL,
  `ID_user` int DEFAULT NULL,
  `ID_added_song` int DEFAULT NULL,
  `added_song_title` varchar(256) DEFAULT NULL,
  `operation_date` timestamp NULL DEFAULT NULL,
  KEY `playlist_fk` (`ID_playlist`),
  KEY `user_fk` (`ID_user`),
  KEY `songs_fk` (`ID_added_song`),
  CONSTRAINT `shared_playlists_ibfk_1` FOREIGN KEY (`ID_playlist`) REFERENCES `playlists` (`ID_playlist`),
  CONSTRAINT `shared_playlists_ibfk_2` FOREIGN KEY (`ID_user`) REFERENCES `users` (`ID_user`),
  CONSTRAINT `shared_playlists_ibfk_3` FOREIGN KEY (`ID_added_song`) REFERENCES `songs` (`ID_song`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared_playlists`
--

LOCK TABLES `shared_playlists` WRITE;
/*!40000 ALTER TABLE `shared_playlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `shared_playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `songs` (
  `ID_song` int NOT NULL AUTO_INCREMENT,
  `ID_artist` int NOT NULL,
  `ID_album` int NOT NULL,
  `song_title` varchar(512) DEFAULT NULL,
  `song_lenght_s` float DEFAULT NULL,
  `reproduction_times` int DEFAULT NULL,
  UNIQUE KEY `ID_song` (`ID_song`),
  KEY `artist_fk` (`ID_artist`),
  KEY `album_fk` (`ID_album`),
  CONSTRAINT `songs_ibfk_1` FOREIGN KEY (`ID_artist`) REFERENCES `artists` (`ID_artist`),
  CONSTRAINT `songs_ibfk_2` FOREIGN KEY (`ID_album`) REFERENCES `albums` (`ID_album`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription` (
  `ID_subscription` int NOT NULL AUTO_INCREMENT,
  `ID_user` int NOT NULL,
  `begin_date` timestamp NULL DEFAULT NULL,
  `renew_date` timestamp NULL DEFAULT NULL,
  `payment_method` enum('credit_card','paypal') DEFAULT NULL,
  `ID_creditcard` int DEFAULT NULL,
  `ID_paypal` int DEFAULT NULL,
  UNIQUE KEY `ID_subscription` (`ID_subscription`),
  KEY `user_fk` (`ID_user`),
  KEY `creditcard_fk` (`ID_creditcard`),
  KEY `paypal_fk` (`ID_paypal`),
  CONSTRAINT `subscription_ibfk_1` FOREIGN KEY (`ID_user`) REFERENCES `users` (`ID_user`),
  CONSTRAINT `subscription_ibfk_2` FOREIGN KEY (`ID_creditcard`) REFERENCES `creditcards` (`ID_creditcard`),
  CONSTRAINT `subscription_ibfk_3` FOREIGN KEY (`ID_paypal`) REFERENCES `paypals` (`ID_paypal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription`
--

LOCK TABLES `subscription` WRITE;
/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_fav_albums`
--

DROP TABLE IF EXISTS `user_fav_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_fav_albums` (
  `ID_user` int NOT NULL,
  `ID_album` int NOT NULL,
  KEY `user_fk` (`ID_user`),
  KEY `album_fk` (`ID_album`),
  CONSTRAINT `user_fav_albums_ibfk_1` FOREIGN KEY (`ID_user`) REFERENCES `users` (`ID_user`),
  CONSTRAINT `user_fav_albums_ibfk_2` FOREIGN KEY (`ID_album`) REFERENCES `albums` (`ID_album`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_fav_albums`
--

LOCK TABLES `user_fav_albums` WRITE;
/*!40000 ALTER TABLE `user_fav_albums` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_fav_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_fav_songs`
--

DROP TABLE IF EXISTS `user_fav_songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_fav_songs` (
  `ID_user` int NOT NULL,
  `ID_song` int NOT NULL,
  KEY `user_fk` (`ID_user`),
  KEY `song_fk` (`ID_song`),
  CONSTRAINT `user_fav_songs_ibfk_1` FOREIGN KEY (`ID_user`) REFERENCES `users` (`ID_user`),
  CONSTRAINT `user_fav_songs_ibfk_2` FOREIGN KEY (`ID_song`) REFERENCES `songs` (`ID_song`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_fav_songs`
--

LOCK TABLES `user_fav_songs` WRITE;
/*!40000 ALTER TABLE `user_fav_songs` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_fav_songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_follows`
--

DROP TABLE IF EXISTS `user_follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_follows` (
  `ID_user` int NOT NULL,
  `ID_artist` int NOT NULL,
  KEY `user_fk` (`ID_user`),
  KEY `artist_fk` (`ID_artist`),
  CONSTRAINT `user_follows_ibfk_1` FOREIGN KEY (`ID_user`) REFERENCES `users` (`ID_user`),
  CONSTRAINT `user_follows_ibfk_2` FOREIGN KEY (`ID_artist`) REFERENCES `artists` (`ID_artist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_follows`
--

LOCK TABLES `user_follows` WRITE;
/*!40000 ALTER TABLE `user_follows` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_follows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `ID_user` int NOT NULL AUTO_INCREMENT,
  `email` varchar(256) DEFAULT NULL,
  `password_sha512` varchar(512) DEFAULT NULL,
  `name_user` varchar(256) DEFAULT NULL,
  `birth_data` timestamp NULL DEFAULT NULL,
  `sex` enum('male','female','other') DEFAULT NULL,
  `country` varchar(256) DEFAULT NULL,
  `postal_code` varchar(128) DEFAULT NULL,
  `user_type` enum('free','premium') DEFAULT NULL,
  UNIQUE KEY `ID_user` (`ID_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'spotify'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-22 12:47:02
