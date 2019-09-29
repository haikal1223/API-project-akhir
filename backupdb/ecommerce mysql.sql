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
  `isdeleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'SteelSeries','/post/images/POS1568793387591.png',0),(2,'Logitech','/post/images/POS1568793401559.png',0),(3,'Razer','/post/images/POS1568800696233.png',0),(4,'hyperx','/post/images/POS1568800804067.png',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,'admin3',1,5,999000,4995000,1),(2,'admin3',2,2,90000,180000,1),(3,'admin3',1,2,999000,1998000,1),(4,'admin3',2,1,90000,90000,1),(5,'admin3',2,2,90000,180000,1),(6,'admin3',2,2,90000,180000,1),(7,'admin3',1,2,999000,1998000,1),(8,'admin3',2,3,90000,270000,1),(9,'admin3',1,3,999000,2997000,1),(10,'admin3',2,5,90000,450000,1),(11,'admin3',1,190,999000,189810000,1),(12,'admin3',1,5,560000,2800000,1),(13,'admin3',1,1,504000,504000,1),(14,'Testgantest',1,5,504000,2520000,1),(15,'Testgantest',1,5,504000,2520000,1),(16,'Testgantest',5,4,108349,433396,1),(17,'Testgantest',2,4,45000,180000,1),(18,'Testgantest',3,12,1110000,13319996,1),(19,'Testgantest',3,4,1110000,4439999,1),(20,'Testgantest',3,4,1110000,4439999,1),(21,'Testgantest',2,1,45000,45000,1),(22,'Testgantest',6,7,100000,700000,1),(23,'Testgantest',7,4,1350000,5400000,1),(24,'Testgantest',6,4,100000,400000,1),(25,'Testgantest',6,1,100000,100000,1),(26,'Testgantest',5,3,108349,325047,1),(27,'Testgantest',6,4,100000,400000,1),(28,'baron',7,5,1350000,6750000,1),(29,'baron',9,5,1250000,6250000,1),(30,'baron',8,1,980000,980000,1),(31,'baron',10,2,780000,1560000,1),(32,'baron',7,5,1350000,6750000,1),(33,'baron',8,8,980000,7840000,1),(34,'baron',8,2,980000,1960000,0),(35,'admin3',7,2,1350000,2700000,0),(36,'admin3',8,0,980000,0,1),(37,'baron',7,0,1350000,0,1),(38,'baron',7,-1,1350000,-1350000,1),(39,'admin3',10,2,780000,1560000,0);
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
  `isdeleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Mouse',0),(2,'Keyboard',0),(3,'Headset',0),(4,'Mousepad',0);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jumbo_slider`
--

LOCK TABLES `jumbo_slider` WRITE;
/*!40000 ALTER TABLE `jumbo_slider` DISABLE KEYS */;
INSERT INTO `jumbo_slider` VALUES (10,'/post/images/POS1568822275427.jpg'),(11,'/post/images/POS1568822453466.jpg'),(12,'/post/images/POS1568822575827.jpg');
/*!40000 ALTER TABLE `jumbo_slider` ENABLE KEYS */;
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
  `description` varchar(10000) NOT NULL,
  `discount` int(11) NOT NULL DEFAULT '0',
  `categoryid` int(11) NOT NULL,
  `brandid` int(11) NOT NULL,
  `isdeleted` int(11) NOT NULL DEFAULT '0',
  `stock` int(11) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'G604',560000,'Mouse Logitech asdsada asdsadasd asdasd asd asda asd asd asd as',10,0,0,0,94,'/post/images/POS1568793492736.jpeg'),(2,'RIVAL 650',50000,'Rival 650',10,1,1,1,99,'/post/images/POS1568794364883.png'),(3,'test',1233333,'aisdjsadads',10,2,1,1,100,'/post/images/POS1568796135140.png'),(4,'test lahi',1233333,'aisdjsadadsasd',10132,3,1,1,100,'/post/images/POS1568796161160.png'),(5,'asdsad',123124,'asdasdsad',12,1,1,1,100,'/post/images/POS1568796205603.png'),(6,'Test',100000,'test barang ga ada discount haha hihi huhu',0,1,1,1,100,'/post/images/POS1568819337592.png'),(7,'G502',1500000,'G502 HERO dilengkapi sensor optik terbaik untuk akurasi penelusuran maksimum, pencahayaan RGB yang disesuaikan, profil game khusus, dari 100 hingga 16.000 DPI, dan pemberat yang dapat diposisikan ulang.',10,1,2,0,95,'/post/images/POS1568861331568.png'),(8,'HyperX Cloud Gaming Headset',980000,'The versatile Cloud headset family is designed to fit anyone’s gaming needs, no matter their system, play style or personal style. Whether you need virtual 7.1 surround sound for your PC domination station or stereo cans crafted for console life, there’s a Cloud made for you. Each Cloud model is designed to keep you on top of your game longer by providing award-winning comfort through its signature HyperX™ memory foam. 53mm drivers and closed ear cups team up to deliver total audio immersion and pump out precision sound. Built with a durable aluminum frame, every headset in the Cloud line is engineered to tank daily damage and keep coming back for more. Cloud’s detachable noise-cancelling mic transmits loud and clear, so your teamwork will always be on point.',0,3,4,0,100,'/post/images/POS1568879208643.jpg'),(9,'Razer BlackWidow',1250000,'Since its inception, the Razer BlackWidow name has been synonymous not just with precision but also the tactile and clicky feel of its switches that gamers love. We’ve fine-tuned our mechanical switches to unlock the highest level of gaming performance yet with the latest edition of the Razer™ Green Mechanical Switch. Game on with total clicky satisfaction and Razer Chroma™ lighting with the new Razer BlackWidow.',0,2,3,0,95,'/post/images/POS1568879517874.png'),(10,'Rival 650',780000,'The first true performance wireless gaming mouse is here. The Rival 650 Wireless features Quantum Wireless™ 1ms lossless performance, lightning fast charging capabilities, and the most precise gaming sensor ever made.\n',0,1,1,0,100,'/post/images/POS1568879643933.png'),(11,'test',412312,'gagaga',10,1,3,0,100,'/post/images/POS1569484985315.png'),(12,'haha',123456,'harga',10,1,1,1,100,'/post/images/POS1569485078940.png'),(13,'hahaa',12345,'hahaha',1,1,2,1,100,'/post/images/POS1569485182810.png'),(14,'gatau',2909,'hahahaha',10,1,2,0,100,'/post/images/POS1569485310218.png'),(15,'assfsf',290933,'hahahahadsfds',10,3,2,0,100,'/post/images/POS1569485335668.png'),(16,'asdsad',1234,'sadas',12,2,2,0,111,'/post/images/POS1569569080880.jpg'),(17,'gggg',123,'sadas',1245,2,1,0,111,'/post/images/POS1569569100398.png'),(18,'asdsa',1234,'asd',11,2,2,0,10,'/post/images/POS1569569158386.png'),(19,'barang ga diskon',900000,'barang ga diskon',0,1,1,0,100,'/post/images/POS1569654323500.png'),(20,'Mice',50000,'hahahaha',0,1,2,0,100,'/post/images/POS1569688600707.png'),(21,'Kibot',90000,'hahaha',10,2,3,0,100,'/post/images/POS1569688627101.png'),(22,'another mice',80000,'hshsdodosdl',10,1,1,0,100,'/post/images/POS1569688691899.png');
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` datetime NOT NULL,
  `username` varchar(50) NOT NULL,
  `totalharga` int(11) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'waitingConfirmation',
  `phone` int(11) NOT NULL,
  `adress` varchar(500) NOT NULL,
  `recipient` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `zip` int(8) NOT NULL,
  `image_upload` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,'2019-09-18 12:16:17','admin3',4995000,'package delivered',818128842,'Jalan Jalan','Muhammad Haikal','Jalan Jalan',15138,'/post/images/POS1568783875271.png'),(2,'2019-09-18 12:19:25','admin3',180000,'package delivered',91118,'ajjaja','Muhammad Haikal','ajjaja',15138,'/post/images/POS1568784195871.png'),(3,'2019-09-18 12:28:20','admin3',1998000,'accepted by admin',123124,'asdsada','asdadsa','asdsada',15136,NULL),(4,'2019-09-18 12:30:12','admin3',90000,'package received',2131,'asdas','asfdasdf','asdas',123214,'/post/images/POS1568784632811.jpg'),(5,'2019-09-18 12:40:49','admin3',180000,'accepted by admin',556560517,'Abc123','Muhammad Haikal','Abc123',123123,NULL),(6,'2019-09-18 13:12:55','admin3',180000,'accepted by admin',5555,'coba kurang stock','haha','coba kurang stock',12345,NULL),(7,'2019-09-18 13:15:35','admin3',2268000,'accepted by admin',55650517,'HAHA','Muhammad Haikal','HAHA',12345,NULL),(8,'2019-09-18 13:16:40','admin3',3447000,'accepted by admin',2311,'asdsad','asdsa','asdsad',1234,NULL),(9,'2019-09-18 15:02:37','admin3',2800000,'package received',818128842,'Jlan Jalan','Muhammad Haikal','Jlan Jalan',15138,'/post/images/POS1568793793884.png'),(10,'2019-09-18 23:11:30','admin3',504000,'package received',656123,'ahahaha','hahahahahaha','ahahaha',123456,'/post/images/POS1568823126517.jpg'),(11,'2019-09-19 01:00:33','Testgantest',2520000,'accepted by admin',11919,'ahahah','muhammad haikal','ahahah',15138,NULL),(12,'2019-09-19 01:07:29','Testgantest',2520000,'accepted by admin',555,'abc123','hahah','abc123',1234565,NULL),(13,'2019-09-19 01:08:31','Testgantest',433396,'accepted by admin',12345,'asdsada','asdsad','asdsada',12345,NULL),(14,'2019-09-19 01:10:19','Testgantest',180000,'accepted by admin',1234,'ssfds','asda','ssfds',123445,NULL),(15,'2019-09-19 01:11:43','Testgantest',13319996,'accepted by admin',234,'sasdasd1','asdsada','sasdasd1',1234,NULL),(16,'2019-09-19 01:13:42','Testgantest',4439999,'accepted by admin',1234,'asdsa','haikal123','asdsa',124,NULL),(17,'2019-09-19 01:14:25','Testgantest',4439999,'accepted by admin',1234,'asdsada','sdada','asdsada',1234,NULL),(18,'2019-09-19 01:27:41','Testgantest',45000,'package received',1213,'asdsadas','sadsad','asdsadas',1234,'/post/images/POS1568860007071.jpg'),(19,'2019-09-19 09:32:53','Testgantest',700000,'rejected by admin',1234,'asdsa','qsadsad','asdsa',123,NULL),(20,'2019-09-19 10:47:28','Testgantest',5400000,'rejected by admin',818128842,'Jakarata','Haikal','Jakarata',12345,NULL),(21,'2019-09-19 10:48:00','Testgantest',400000,'rejected by admin',1234,'asdsa','asdasd','asdsa',123241,NULL),(22,'2019-09-19 10:53:31','Testgantest',100000,'rejected by admin',123,'asdsad','asdasd','asdsad',12312,NULL),(23,'2019-09-19 10:55:26','Testgantest',325047,'rejected by admin',123,'asdsad','sada','asdsad',1234,NULL),(24,'2019-09-19 11:26:36','Testgantest',400000,'rejected by admin',123456,'abc123','Muhammad Haikal','abc123',12345,NULL),(25,'2019-09-19 15:29:31','baron',13000000,'package delivered',12345,'jalan ','baron','jalan ',1235,'/post/images/POS1568881910123.png'),(26,'2019-09-19 15:44:17','baron',2540000,'waitingConfirmation',12345,'jaaja','baron','jaaja',12345,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_item`
--

LOCK TABLES `transaction_item` WRITE;
/*!40000 ALTER TABLE `transaction_item` DISABLE KEYS */;
INSERT INTO `transaction_item` VALUES (1,1,999000,5,1),(2,2,90000,2,2),(3,1,999000,2,3),(4,2,90000,1,4),(5,2,90000,2,5),(6,2,90000,2,6),(7,1,999000,2,7),(8,2,90000,3,7),(9,1,999000,3,8),(10,2,90000,5,8),(11,1,560000,5,9),(12,1,504000,1,10),(13,1,504000,5,11),(14,1,504000,5,12),(15,5,108349,4,13),(16,2,45000,4,14),(17,3,1110000,12,15),(18,3,1110000,4,16),(19,3,1110000,4,17),(20,2,45000,1,18),(21,6,100000,7,19),(22,7,1350000,4,20),(23,6,100000,4,21),(24,6,100000,1,22),(25,5,108349,3,23),(26,6,100000,4,24),(27,7,1350000,5,25),(28,9,1250000,5,25),(29,8,980000,1,26),(30,10,780000,2,26);
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
INSERT INTO `user_status` VALUES (1,'Unverified'),(2,'Verified');
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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'haikal1223','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-03 15:24:28',1),(3,'test123','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-07 17:26:40',1),(4,'haha','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','abc123',2,'2019-09-11 11:06:50',1),(5,'hahaaaa','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','abc123',2,'2019-09-11 11:07:37',1),(6,'hakial1223','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-11 11:10:21',1),(7,'haaaaa','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','haikal507@gmail.com',2,'2019-09-11 11:15:11',1),(8,'test123456','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-11 11:18:13',2),(9,'abc123','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-11 11:20:33',2),(10,'testing123','54068dbc8467a51717a4e8c76d1032c2c094ae89df11b87ef433f65d4db340ed','muhammadhaikal507@gmail.com',2,'2019-09-12 10:33:52',2),(11,'abc123456','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-12 10:47:45',1),(12,'abccccc','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmai',2,'2019-09-12 10:52:57',2),(13,'abccccccccc','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmai',2,'2019-09-12 10:57:18',1),(14,'abcxas','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmai',2,'2019-09-12 12:21:12',1),(15,'testes','54068dbc8467a51717a4e8c76d1032c2c094ae89df11b87ef433f65d4db340ed','muhammadhaikal507@gmai',2,'2019-09-12 12:22:30',1),(16,'sddsf','d16131c6588e9f6e80a8058ae262d4d77a4ec0f9dd11ebe841ff72930c3d5a9c','muhammadhaikal507@gmai',2,'2019-09-12 12:24:17',1),(17,'adsadsa','54068dbc8467a51717a4e8c76d1032c2c094ae89df11b87ef433f65d4db340ed','muhammadhaikal507@gmai',2,'2019-09-12 12:25:47',1),(18,'ancv123','54068dbc8467a51717a4e8c76d1032c2c094ae89df11b87ef433f65d4db340ed','muhammadhaikal507@gmai',2,'2019-09-12 12:26:34',1),(19,'abcsad','54068dbc8467a51717a4e8c76d1032c2c094ae89df11b87ef433f65d4db340ed','muhammadhaikal507@gmai',2,'2019-09-12 12:29:41',1),(20,'abc1234','9eff489f1b49bd6bf1d011efe1fb86f434d4ade59b75275898113cf5bc0338d0','muhammadhaikal507@gmai',2,'2019-09-12 12:33:05',1),(21,'abc123asdsa','d8758ebc4187e510148df295f242c08a942eb5db920a45bfd34899018a2e6cf0','muhammadhaikal507@gmai',2,'2019-09-12 12:33:52',1),(22,'abcdefg','54068dbc8467a51717a4e8c76d1032c2c094ae89df11b87ef433f65d4db340ed','muhammadhaikal507@gmai',2,'2019-09-12 13:01:16',1),(23,'admin','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmai',2,'2019-09-12 14:03:59',1),(24,'admin1','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','haikal594@gmail.com',2,'2019-09-12 14:06:32',1),(25,'admin2','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmai',2,'2019-09-12 14:09:03',1),(26,'admin3','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',1,'2019-09-12 14:10:34',2),(27,'admin4','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-12 14:27:57',1),(28,'gaada123','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 17:04:19',1),(29,'adalah','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 17:06:09',2),(30,'adada','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 17:09:18',1),(31,'abcdefghijklmn','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 17:10:03',1),(32,'gege123456','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 17:10:45',1),(33,'pleasework','54068dbc8467a51717a4e8c76d1032c2c094ae89df11b87ef433f65d4db340ed','muhammadhaikal507@gmail.com',2,'2019-09-14 17:11:51',1),(34,'nananana','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 17:16:14',1),(35,'adalahahaha','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 17:19:40',1),(36,'ahahahahaha','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 17:21:14',1),(37,'dahdahdah','54068dbc8467a51717a4e8c76d1032c2c094ae89df11b87ef433f65d4db340ed','muhammadhaikal507@gmail.com',2,'2019-09-14 17:22:09',1),(38,'dendi1223','54068dbc8467a51717a4e8c76d1032c2c094ae89df11b87ef433f65d4db340ed','muhammadhaikal507@gmail.com',2,'2019-09-14 17:25:26',1),(39,'pleaseeeee','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 17:30:09',1),(40,'baha','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 17:54:22',1),(41,'haikal1223456','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 17:56:07',1),(42,'bahayagan','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 17:58:52',1),(43,'pleaseworkplease','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 18:18:43',1),(44,'abcgilagua','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 18:20:40',1),(45,'pleasepleaseplease','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 18:25:41',1),(46,'pleaseblyatworkplease','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 18:43:38',1),(47,'PleaseWorkLAAAAA','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 18:44:05',1),(48,'woyyyyyyyy','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 18:45:30',1),(49,'woyyyyyyyyyyyyyyyyyyyyyyyyyyy','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 18:48:59',1),(50,'pleasemaupulangnihguaplease','57f277ea23e9ca9b7f2a404085018017bcd69ff445efcd22cf74e392f95e4311','muhammadhaikal507@gmail.com',2,'2019-09-14 18:50:35',1),(51,'maupulangplease','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 18:51:46',1),(52,'rezapenolongku','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 18:52:43',1),(53,'testbearer','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 19:00:09',1),(54,'admin5','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 19:00:55',1),(55,'badrun','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 22:27:37',1),(56,'kacang','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 23:31:04',1),(57,'goreng','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-14 23:58:04',1),(58,'kacanggoreng','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-15 00:05:03',1),(59,'testh-2','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-16 19:19:19',1),(60,'haha123456','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-16 19:20:00',1),(61,'keep123','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-16 19:20:59',1),(62,'h-1gan','54068dbc8467a51717a4e8c76d1032c2c094ae89df11b87ef433f65d4db340ed','muhammadhaikal507@gmail.com',2,'2019-09-17 10:26:22',1),(63,'admin10','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-17 10:30:44',2),(64,'irwan','54068dbc8467a51717a4e8c76d1032c2c094ae89df11b87ef433f65d4db340ed','irwanramadhan288@gmail.com',2,'2019-09-17 15:11:52',1),(65,'yuvens','e0f82be4da464bb308debeff7a329350ab0474a01a4831b905ed9a1218d6577a','yuvensenverd@yahoo.com',2,'2019-09-17 15:13:10',1),(66,'irwaan','54068dbc8467a51717a4e8c76d1032c2c094ae89df11b87ef433f65d4db340ed','irwanramadhan288@gmail.com',2,'2019-09-17 15:16:45',1),(67,'terakhir','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-18 16:56:00',2),(68,'Testgantest','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-18 21:54:11',2),(69,'lahlahlah','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-19 09:25:50',2),(70,'baron','e85d6c5148f1be4028c6047c6d944e17edbb18bf3ba8963d1b1b209b9dab47ec','muhammadhaikal507@gmail.com',2,'2019-09-19 15:23:17',2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-29 13:44:14
