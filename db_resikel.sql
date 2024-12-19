-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: db_resikel
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `point_point`
--

DROP TABLE IF EXISTS `point_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `point_point` (
  `id` int NOT NULL AUTO_INCREMENT,
  `purchase_order_id` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `point_type` varchar(255) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `write_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_order_id` (`purchase_order_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `point_point_ibfk_1` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_order` (`id`),
  CONSTRAINT `point_point_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `res_users` (`id`),
  CONSTRAINT `point_point_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `res_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point_point`
--

LOCK TABLES `point_point` WRITE;
/*!40000 ALTER TABLE `point_point` DISABLE KEYS */;
/*!40000 ALTER TABLE `point_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author_id` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `tags` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `write_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `res_users` (`id`),
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `res_users` (`id`),
  CONSTRAINT `post_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `res_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_category`
--

DROP TABLE IF EXISTS `post_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_category`
--

LOCK TABLES `post_category` WRITE;
/*!40000 ALTER TABLE `post_category` DISABLE KEYS */;
INSERT INTO `post_category` VALUES (1,'Kegiatan','2024-12-17 17:23:03'),(2,'Artikel','2024-12-17 17:23:03'),(3,'Jenis Sampah','2024-12-17 17:23:03'),(4,'Manfaat','2024-12-17 17:23:03');
/*!40000 ALTER TABLE `post_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_post`
--

DROP TABLE IF EXISTS `post_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `post_post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `res_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_post_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `post_category` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_post`
--

LOCK TABLES `post_post` WRITE;
/*!40000 ALTER TABLE `post_post` DISABLE KEYS */;
INSERT INTO `post_post` VALUES (3,1,1,'Ambativasi','Amba.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus faucibus sapien eget rutrum tincidunt. Aenean ac dignissim eros. Nulla dignissim consectetur nunc. Suspendisse bibendum scelerisque turpis, at consectetur elit viv','2024-12-17 18:23:17'),(5,1,2,'bung amba penyelamat ngawi selatan',NULL,'Pahlawa ngawi selatan, amba salahsatu perwakilan ambasador regional ngawi berhasil melakukan great save terhadap kota tercintanya alhasil ia menjadi satu satunya pahlawan ngawi yang menjadi sorotan publik, kata kata terkenalnya adalah \"ambateukam\" yang artinya amba/aku akun datang','2024-12-18 00:41:54'),(6,1,1,'ini lo weh','foto-1734486190154-181171027.jpg','ini desc','2024-12-18 01:22:48'),(9,1,1,'w',NULL,'fd','2024-12-18 01:28:53'),(10,1,1,'the giant horse dock','foto-1734491932561-183905162.jpg','the giant horse dock is weight a thousand pound','2024-12-18 03:18:52'),(11,1,1,'2','Proklamasi','foto-1734515894285-667248386.png','2024-12-18 09:58:14'),(12,1,1,'1','ini lo weh','foto-1734515924019-749358292.jpg','2024-12-18 09:58:44'),(13,1,1,'2','d','foto-1734515944546-88271739.jpg','2024-12-18 09:59:04'),(14,1,1,'2','fd','foto-1734516448905-47302875.png','2024-12-18 10:07:28'),(16,1,2,'ada','foto-1734517702426-238926256.png','airhguiaerhigiaheifh','2024-12-18 10:26:59'),(17,1,2,'WLE WLO WLO','foto-1734519976366-748214867.jpg','EIFHUAEWHOFGOIWHGOI','2024-12-18 10:56:55'),(19,1,2,'2','title','foto-1734520451237-821014787.png','2024-12-18 11:14:11'),(20,1,2,'2','agarg','foto-1734520730727-322683125.jpg','2024-12-18 11:18:50');
/*!40000 ALTER TABLE `post_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `write_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `product_category_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `product_category` (`id`),
  CONSTRAINT `product_category_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `res_users` (`id`),
  CONSTRAINT `product_category_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `res_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,NULL,NULL,NULL,'Plastic',NULL,NULL),(3,NULL,NULL,NULL,'Besi',NULL,NULL),(4,NULL,NULL,NULL,'Batery',NULL,NULL);
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_product`
--

DROP TABLE IF EXISTS `product_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `uom_id` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `list_price` float DEFAULT NULL,
  `cost_price` float DEFAULT NULL,
  `image` blob,
  `create_date` datetime DEFAULT NULL,
  `write_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `uom_id` (`uom_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `product_product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id`),
  CONSTRAINT `product_product_ibfk_2` FOREIGN KEY (`uom_id`) REFERENCES `uom_uom` (`id`),
  CONSTRAINT `product_product_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `res_users` (`id`),
  CONSTRAINT `product_product_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `res_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_product`
--

LOCK TABLES `product_product` WRITE;
/*!40000 ALTER TABLE `product_product` DISABLE KEYS */;
INSERT INTO `product_product` VALUES (2,1,1,NULL,NULL,'Product 1',10.5,7,_binary 'base64EncodedImageHere','2024-12-16 00:27:22','2024-12-16 00:27:22'),(4,1,1,NULL,1,'Updated Product',600,350,_binary 'updated_image_url','2024-12-17 13:42:43','2024-12-17 13:42:43');
/*!40000 ALTER TABLE `product_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order`
--

DROP TABLE IF EXISTS `purchase_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `partner_id` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_order` datetime DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `amount_total` float DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `write_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `partner_id` (`partner_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `purchase_order_ibfk_1` FOREIGN KEY (`partner_id`) REFERENCES `res_users` (`id`),
  CONSTRAINT `purchase_order_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `res_users` (`id`),
  CONSTRAINT `purchase_order_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `res_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order`
--

LOCK TABLES `purchase_order` WRITE;
/*!40000 ALTER TABLE `purchase_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order_line`
--

DROP TABLE IF EXISTS `purchase_order_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_order_line` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `product_uom` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `product_qty` float DEFAULT NULL,
  `price_unit` float DEFAULT NULL,
  `price_subtotal` float DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `write_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  KEY `product_uom` (`product_uom`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `purchase_order_line_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `purchase_order` (`id`),
  CONSTRAINT `purchase_order_line_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`),
  CONSTRAINT `purchase_order_line_ibfk_3` FOREIGN KEY (`product_uom`) REFERENCES `uom_uom` (`id`),
  CONSTRAINT `purchase_order_line_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `res_users` (`id`),
  CONSTRAINT `purchase_order_line_ibfk_5` FOREIGN KEY (`updated_by`) REFERENCES `res_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order_line`
--

LOCK TABLES `purchase_order_line` WRITE;
/*!40000 ALTER TABLE `purchase_order_line` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_order_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `res_users`
--

DROP TABLE IF EXISTS `res_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `res_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(45) NOT NULL,
  `total_points` varchar(45) NOT NULL,
  `active` tinyint NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `res_users`
--

LOCK TABLES `res_users` WRITE;
/*!40000 ALTER TABLE `res_users` DISABLE KEYS */;
INSERT INTO `res_users` VALUES (1,'ianjul@julian.co','$2b$10$OtuY1IPGhhSlDRe7njhhbezdBpf2U6pZ5bodjzLgHuo7osXEjutDW','Ju','0',0,'2024-12-16 23:20:07'),(9,'sasa@gmail.com','$2b$10$hT3E0ETIbtQcQh2E9x9hHuFzmmmF1SJqWhNxfpIFTychmKoxcT5Ra','sasa','1000',1,'2024-12-16 23:20:07'),(10,'ricky@gmail.com','$2b$10$F.ShQi34Z7IcPB1HSDkstOKgMbY0pvCxe3j26jWMqKCi49Dyd8ngC','ricky','0',0,'2024-12-16 23:20:07'),(12,'ripeng@gmail.com','$2b$10$FB0pjlndBzOJ6HPN.6w6Z.FmJEVAFYaeDAn5AMgRwz3u5ETtzRtdi','ripp','0',0,'2024-12-16 23:20:07'),(13,'alsa@gmail.com','$2b$10$5lyZbOpyUyAO.7HfdVSLe.b/UIS1qu5rXE2AFY7UoxtpPJsenT47O','miloenak','0',0,'2024-12-16 23:20:07'),(14,'justi@gmail.com','$2b$10$tGRXnnfq3845oDAbj5Eh0uxpsn1JbD06iZ1S6w3quQI2I1UFaHfMy','Justicia','0',1,'2024-12-16 23:20:07'),(15,'ricky@gmail.com','$2b$10$M08CnZUBoO1woBVO7aKG6eGNC74vuhPw6fKnEtkwzY.bsRl.3SAOO','riki ganteng','0',1,'2024-12-16 23:20:07'),(16,'1@1.com','$2b$10$ArJ6lyTdX/kvlmPD7FJ8IOakuqa61koaXJIDz3imk3kGKCyY8g6MG','one','0',1,'2024-12-16 23:20:07'),(17,'kanye@gmail.com','$2b$10$N17eErHnv9IXTP5ev1g9cOCAYToKf6JlEWNA5MFlQ7klu1v1vETqW','Kanye West','900',1,'2024-12-16 23:20:07'),(20,'jeff@gmail.com','$2b$10$Uw0nYbmd8H0dmTtkRLqJoe/JWXyP6lXXlzwgrrDhOlI1eLYR5cGwq','jeff bezos','9999999',1,'2024-12-17 16:05:03'),(21,'kaka@gmail.com','$2b$10$1zPqy/ecLj9WuFsqEvCntux7vEexoh7/nLD72f4Ncta5pyxYwIXFm','manabisa','999',1,'2024-12-17 17:24:18'),(22,'agus@gmai.com','$2b$10$sqtrbA.EGAT8X5i5GzRM6uA6lh6P78cMdWI60fXkiw3iPOyqVMAm2','Agus','666',0,'2024-12-17 18:14:50');
/*!40000 ALTER TABLE `res_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_area_transaksi_wilayah`
--

DROP TABLE IF EXISTS `tb_area_transaksi_wilayah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_area_transaksi_wilayah` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama_wilayah` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `jumlah_user` int NOT NULL,
  `jumlah_transaksi` int NOT NULL,
  `total_sampah` int NOT NULL,
  `total_reward` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_area_transaksi_wilayah`
--

LOCK TABLES `tb_area_transaksi_wilayah` WRITE;
/*!40000 ALTER TABLE `tb_area_transaksi_wilayah` DISABLE KEYS */;
INSERT INTO `tb_area_transaksi_wilayah` VALUES (1,'Batam Kota',25,20,120,230000),(2,'Sekupang',10,20,120,230000),(3,'Sagulung',10,20,120,230000),(4,'Lubuk Baja',5,20,120,250000),(5,'Nongsa',5,20,120,240000);
/*!40000 ALTER TABLE `tb_area_transaksi_wilayah` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_uom`
--

DROP TABLE IF EXISTS `tb_uom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_uom` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama_uom` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `satuan` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `faktor_konversi` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_uom`
--

LOCK TABLES `tb_uom` WRITE;
/*!40000 ALTER TABLE `tb_uom` DISABLE KEYS */;
INSERT INTO `tb_uom` VALUES (1,'Kilogram','KG',1);
/*!40000 ALTER TABLE `tb_uom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uom_category`
--

DROP TABLE IF EXISTS `uom_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uom_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `write_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `uom_category_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `res_users` (`id`),
  CONSTRAINT `uom_category_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `res_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uom_category`
--

LOCK TABLES `uom_category` WRITE;
/*!40000 ALTER TABLE `uom_category` DISABLE KEYS */;
INSERT INTO `uom_category` VALUES (1,NULL,NULL,'uom_category',NULL,NULL);
/*!40000 ALTER TABLE `uom_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uom_uom`
--

DROP TABLE IF EXISTS `uom_uom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uom_uom` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `factor` float DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `write_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `uom_uom_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `res_users` (`id`),
  CONSTRAINT `uom_uom_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `res_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uom_uom`
--

LOCK TABLES `uom_uom` WRITE;
/*!40000 ALTER TABLE `uom_uom` DISABLE KEYS */;
INSERT INTO `uom_uom` VALUES (1,NULL,1,1,'Miligram',1.1,NULL,'2024-12-16 13:23:02'),(9,1,1,NULL,'gram',0.1,'2024-12-16 15:24:36',NULL),(11,1,1,NULL,'Kilogram',1,'2024-12-16 15:51:13',NULL),(16,1,1,NULL,'Ons',1.3,'2024-12-16 17:53:05',NULL),(17,1,1,NULL,'Liter',2,'2024-12-17 04:56:37',NULL),(18,1,1,NULL,'Ton',1000,'2024-12-17 09:04:37',NULL);
/*!40000 ALTER TABLE `uom_uom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'Justicia Febriananda','justi@gmail.com','123123'),(3,'Ahmad Iqbal','iqbal@gmail.com','123123'),(4,'Yanjul','admin@gmail.com','123');
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

-- Dump completed on 2024-12-18 19:02:10
