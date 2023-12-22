-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: youtube
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
-- Table structure for table `channels`
--

DROP TABLE IF EXISTS `channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channels` (
  `ID_channel` int NOT NULL AUTO_INCREMENT,
  `ID_user` int NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` varchar(10000) DEFAULT NULL,
  `creation_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `ID_channel` (`ID_channel`),
  KEY `idUser_fk` (`ID_user`),
  CONSTRAINT `channels_ibfk_1` FOREIGN KEY (`ID_user`) REFERENCES `users` (`ID_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels`
--

LOCK TABLES `channels` WRITE;
/*!40000 ALTER TABLE `channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `ID_comment` int NOT NULL AUTO_INCREMENT,
  `ID_video` int NOT NULL,
  `ID_user` int NOT NULL,
  `comment_text` varchar(15000) DEFAULT NULL,
  `comment_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `ID_comment` (`ID_comment`),
  KEY `idVideo_fk` (`ID_video`),
  KEY `idUser_fk` (`ID_user`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`ID_video`) REFERENCES `videos` (`ID_video`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`ID_user`) REFERENCES `users` (`ID_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments_likes`
--

DROP TABLE IF EXISTS `comments_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments_likes` (
  `ID_comment` int NOT NULL,
  `ID_user` int NOT NULL,
  `type` enum('like','dislike') DEFAULT NULL,
  `reaction_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `idComment_fk` (`ID_comment`),
  KEY `idUser_fk` (`ID_user`),
  CONSTRAINT `comments_likes_ibfk_1` FOREIGN KEY (`ID_comment`) REFERENCES `comments` (`ID_comment`),
  CONSTRAINT `comments_likes_ibfk_2` FOREIGN KEY (`ID_user`) REFERENCES `users` (`ID_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments_likes`
--

LOCK TABLES `comments_likes` WRITE;
/*!40000 ALTER TABLE `comments_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labels`
--

DROP TABLE IF EXISTS `labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labels` (
  `ID_label` int NOT NULL AUTO_INCREMENT,
  `name` varchar(126) DEFAULT NULL,
  UNIQUE KEY `ID_label` (`ID_label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labels`
--

LOCK TABLES `labels` WRITE;
/*!40000 ALTER TABLE `labels` DISABLE KEYS */;
/*!40000 ALTER TABLE `labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `ID_video` int NOT NULL,
  `ID_user` int NOT NULL,
  `type_reaction` enum('like','dislike') DEFAULT NULL,
  `date_reaction` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `idUser_fk` (`ID_user`),
  KEY `idVideo_fk` (`ID_video`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`ID_user`) REFERENCES `users` (`ID_user`),
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`ID_video`) REFERENCES `videos` (`ID_video`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
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
  `playlist_name` varchar(256) NOT NULL,
  `creation_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `state` enum('public','private') DEFAULT NULL,
  UNIQUE KEY `ID_playlist` (`ID_playlist`),
  KEY `idUser_fk` (`ID_user`),
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
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `ID_user` int NOT NULL,
  `ID_channel` int NOT NULL,
  KEY `idUser_fk` (`ID_user`),
  KEY `idChannel_fk` (`ID_channel`),
  CONSTRAINT `subscriptions_ibfk_1` FOREIGN KEY (`ID_user`) REFERENCES `users` (`ID_user`),
  CONSTRAINT `subscriptions_ibfk_2` FOREIGN KEY (`ID_channel`) REFERENCES `channels` (`ID_channel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `ID_user` int NOT NULL AUTO_INCREMENT,
  `email` varchar(256) NOT NULL,
  `password_sha512` varchar(128) NOT NULL,
  `user_name` varchar(64) NOT NULL,
  `bith_date` date NOT NULL,
  `sex` enum('male','female','other') DEFAULT NULL,
  `country` varchar(128) DEFAULT NULL,
  `postal_code` varchar(32) DEFAULT NULL,
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
-- Table structure for table `video_labels`
--

DROP TABLE IF EXISTS `video_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video_labels` (
  `ID_video` int NOT NULL,
  `ID_label` int NOT NULL,
  KEY `idVideo_fk` (`ID_video`),
  KEY `idLabel_fk` (`ID_label`),
  CONSTRAINT `video_labels_ibfk_1` FOREIGN KEY (`ID_video`) REFERENCES `videos` (`ID_video`),
  CONSTRAINT `video_labels_ibfk_2` FOREIGN KEY (`ID_label`) REFERENCES `labels` (`ID_label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_labels`
--

LOCK TABLES `video_labels` WRITE;
/*!40000 ALTER TABLE `video_labels` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videos` (
  `ID_video` int NOT NULL AUTO_INCREMENT,
  `ID_user` int NOT NULL,
  `title` varchar(512) DEFAULT NULL,
  `description` varchar(10000) DEFAULT NULL,
  `resolution` varchar(64) DEFAULT NULL,
  `file_name` varchar(512) DEFAULT NULL,
  `length_video_s` int DEFAULT NULL,
  `thumbnail` varchar(1024) DEFAULT NULL,
  `times_played` int DEFAULT NULL,
  `likes_num` int DEFAULT NULL,
  `dislikes_num` int DEFAULT NULL,
  `publication_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `ID_video` (`ID_video`),
  KEY `idUser_fk` (`ID_user`),
  CONSTRAINT `videos_ibfk_1` FOREIGN KEY (`ID_user`) REFERENCES `users` (`ID_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'youtube'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-19 17:42:20
