CREATE DATABASE  IF NOT EXISTS `ecommerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ecommerce`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `logo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (14,'JarviS','/post/images/POS1568366148288.jpg'),(16,'RADIANCE','/post/images/POS1568400935408.jpg'),(17,'SHADOW FIEND','/post/images/POS1568459349036.jpg');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `productid` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `totalprice` int(11) NOT NULL,
  `isdeleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,'admin3',11,5,9000,45000,0),(2,'admin3',10,5,9000,45000,0),(3,'admin3',9,5,60000,300000,0),(4,'baha',11,1,9000,9000,0),(5,'haikal1223456',11,1,9000,9000,0),(6,'bahayagan',11,1,9000,9000,0),(7,'rezapenolongku',11,5,9000,45000,0),(8,'admin5',11,5,9000,45000,0),(9,'admin5',10,2,9000,18000,0);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Headset'),(2,'Keyboard'),(3,'Mousee'),(4,'Mousepadd');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connect_users_product`
--

DROP TABLE IF EXISTS `connect_users_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connect_users_product` (
  `idusers` int(11) DEFAULT NULL,
  `idproduct` int(11) DEFAULT NULL,
  KEY `Fk_users_idx` (`idusers`),
  KEY `Fk_product_idx` (`idproduct`),
  CONSTRAINT `Fk_product` FOREIGN KEY (`idproduct`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Fk_users` FOREIGN KEY (`idusers`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connect_users_product`
--

LOCK TABLES `connect_users_product` WRITE;
/*!40000 ALTER TABLE `connect_users_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `connect_users_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jumbo_slider`
--

DROP TABLE IF EXISTS `jumbo_slider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jumbo_slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jumbo_slider`
--

LOCK TABLES `jumbo_slider` WRITE;
/*!40000 ALTER TABLE `jumbo_slider` DISABLE KEYS */;
INSERT INTO `jumbo_slider` VALUES (1,'https://www.google.com/imgres?imgurl=http%3A%2F%2Floadcentral.com.ph%2Fwp-content%2Fuploads%2F2017%2F07%2FRace-for-Razer-banner.gif&imgrefurl=http%3A%2F%2Floadcentral.com.ph%2Frace4razer_original%2Frace-for-razer-banner%2F&docid=DbLfmXjUNn-dgM&tbnid=lESK4mHOj4fx7M%3A&vet=10ahUKEwjCoIabw6jkAhVUbn0KHUj_Bk4QMwhDKAEwAQ..i&w=1380&h=500&safe=strict&bih=667&biw=1366&q=razer%20banners&ved=0ahUKEwjCoIabw6jkAhVUbn0KHUj_Bk4QMwhDKAEwAQ&iact=mrc&uact=8'),(2,'https://buyhome.hk/media/brand/2/4/246.razer_banner.jpg'),(3,'https://area51gaming.com/media/steelseries-general-news_fDVGOCG.jpg');
/*!40000 ALTER TABLE `jumbo_slider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pictures`
--

DROP TABLE IF EXISTS `pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pictures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productid` int(11) NOT NULL,
  `images` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pictures`
--

LOCK TABLES `pictures` WRITE;
/*!40000 ALTER TABLE `pictures` DISABLE KEYS */;
/*!40000 ALTER TABLE `pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `discount` int(11) NOT NULL DEFAULT '0',
  `categoryid` int(11) NOT NULL,
  `brandid` int(11) NOT NULL,
  `isdeleted` int(11) NOT NULL DEFAULT '1',
  `stock` int(11) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'G502',500000,'GG',0,2,2,1,10,NULL),(4,'Goliath',555555,'GGG',0,2,14,1,10,'keke.jpg'),(5,'Black Widow Chroma',5555,'gggg',0,3,14,1,10,'keke.jpg'),(6,'Cloud xtreme',199999,'hehe',0,1,4,1,10,NULL),(8,'TEST',900000,'TEST PLS ',10,2,14,1,10,'/post/images/POS1568400731594.jpg'),(9,'ALCHEMIST ITEM',60000,'MAKE ENEMY DEAD',0,1,16,1,10,'/post/images/POS1568401033326.jpg'),(10,'HAHA',9000,'TEST',100,1,16,1,10,'/post/images/POS1568401250574.jpg'),(11,'PLS WORK',9000,'Test modal close on save',10,1,14,1,10,'/post/images/POS1568401313369.jpg');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin'),(2,'User');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `userid` int(11) NOT NULL,
  `totalharga` int(11) NOT NULL,
  `totalbayaran` int(11) NOT NULL,
  `expired_payment` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_item`
--

DROP TABLE IF EXISTS `transaction_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productid` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `transactionid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_item`
--

LOCK TABLES `transaction_item` WRITE;
/*!40000 ALTER TABLE `transaction_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_status`
--

DROP TABLE IF EXISTS `user_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_status`
--

LOCK TABLES `user_status` WRITE;
/*!40000 ALTER TABLE `user_status` DISABLE KEYS */;
INSERT INTO `user_status` VALUES (1,'Unverified'),(2,'Verified'),(3,'Banned');
/*!40000 ALTER TABLE `user_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `email` varchar(45) NOT NULL,
  `roleid` int(11) NOT NULL DEFAULT '2',
  `lastLogin` datetime NOT NULL,
  `statusid` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'haikal1223','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-03 15:24:28',1),(3,'test123','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-07 17:26:40',1),(4,'haha','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','abc123',2,'2019-09-11 11:06:50',1),(5,'hahaaaa','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','abc123',2,'2019-09-11 11:07:37',1),(6,'hakial1223','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-11 11:10:21',1),(7,'haaaaa','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','haikal507@gmail.com',2,'2019-09-11 11:15:11',1),(8,'test123456','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-11 11:18:13',2),(9,'abc123','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-11 11:20:33',2),(10,'testing123','54068dbc8467a51717a4e8c76d1032c2c094ae89df11b87ef433f65d4db340ed','muhammadhaikal507@gmail.com',2,'2019-09-12 10:33:52',2),(11,'abc123456','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-12 10:47:45',1),(12,'abccccc','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmai',2,'2019-09-12 10:52:57',2),(13,'abccccccccc','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmai',2,'2019-09-12 10:57:18',1),(14,'abcxas','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmai',2,'2019-09-12 12:21:12',1),(15,'testes','54068dbc8467a51717a4e8c76d1032c2c094ae89df11b87ef433f65d4db340ed','muhammadhaikal507@gmai',2,'2019-09-12 12:22:30',1),(16,'sddsf','d16131c6588e9f6e80a8058ae262d4d77a4ec0f9dd11ebe841ff72930c3d5a9c','muhammadhaikal507@gmai',2,'2019-09-12 12:24:17',1),(17,'adsadsa','54068dbc8467a51717a4e8c76d1032c2c094ae89df11b87ef433f65d4db340ed','muhammadhaikal507@gmai',2,'2019-09-12 12:25:47',1),(18,'ancv123','54068dbc8467a51717a4e8c76d1032c2c094ae89df11b87ef433f65d4db340ed','muhammadhaikal507@gmai',2,'2019-09-12 12:26:34',1),(19,'abcsad','54068dbc8467a51717a4e8c76d1032c2c094ae89df11b87ef433f65d4db340ed','muhammadhaikal507@gmai',2,'2019-09-12 12:29:41',1),(20,'abc1234','9eff489f1b49bd6bf1d011efe1fb86f434d4ade59b75275898113cf5bc0338d0','muhammadhaikal507@gmai',2,'2019-09-12 12:33:05',1),(21,'abc123asdsa','d8758ebc4187e510148df295f242c08a942eb5db920a45bfd34899018a2e6cf0','muhammadhaikal507@gmai',2,'2019-09-12 12:33:52',1),(22,'abcdefg','54068dbc8467a51717a4e8c76d1032c2c094ae89df11b87ef433f65d4db340ed','muhammadhaikal507@gmai',2,'2019-09-12 13:01:16',1),(23,'admin','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmai',2,'2019-09-12 14:03:59',1),(24,'admin1','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','haikal594@gmail.com',2,'2019-09-12 14:06:32',1),(25,'admin2','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmai',2,'2019-09-12 14:09:03',1),(26,'admin3','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',1,'2019-09-12 14:10:34',2),(27,'admin4','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-12 14:27:57',1),(28,'gaada123','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 17:04:19',1),(29,'adalah','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 17:06:09',2),(30,'adada','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 17:09:18',1),(31,'abcdefghijklmn','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 17:10:03',1),(32,'gege123456','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 17:10:45',1),(33,'pleasework','54068dbc8467a51717a4e8c76d1032c2c094ae89df11b87ef433f65d4db340ed','muhammadhaikal507@gmail.com',2,'2019-09-14 17:11:51',1),(34,'nananana','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 17:16:14',1),(35,'adalahahaha','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 17:19:40',1),(36,'ahahahahaha','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 17:21:14',1),(37,'dahdahdah','54068dbc8467a51717a4e8c76d1032c2c094ae89df11b87ef433f65d4db340ed','muhammadhaikal507@gmail.com',2,'2019-09-14 17:22:09',1),(38,'dendi1223','54068dbc8467a51717a4e8c76d1032c2c094ae89df11b87ef433f65d4db340ed','muhammadhaikal507@gmail.com',2,'2019-09-14 17:25:26',1),(39,'pleaseeeee','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 17:30:09',1),(40,'baha','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 17:54:22',1),(41,'haikal1223456','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 17:56:07',1),(42,'bahayagan','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 17:58:52',1),(43,'pleaseworkplease','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 18:18:43',1),(44,'abcgilagua','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 18:20:40',1),(45,'pleasepleaseplease','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 18:25:41',1),(46,'pleaseblyatworkplease','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 18:43:38',1),(47,'PleaseWorkLAAAAA','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 18:44:05',1),(48,'woyyyyyyyy','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 18:45:30',1),(49,'woyyyyyyyyyyyyyyyyyyyyyyyyyyy','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 18:48:59',1),(50,'pleasemaupulangnihguaplease','57f277ea23e9ca9b7f2a404085018017bcd69ff445efcd22cf74e392f95e4311','muhammadhaikal507@gmail.com',2,'2019-09-14 18:50:35',1),(51,'maupulangplease','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 18:51:46',1),(52,'rezapenolongku','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 18:52:43',1),(53,'testbearer','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 19:00:09',1),(54,'admin5','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 19:00:55',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-14 20:22:52
