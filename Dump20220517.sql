-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: shoes
-- ------------------------------------------------------
-- Server version	5.7.33-log

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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_rdxh7tq2xs66r485cc8dkxt77` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (2,'2021-08-22 13:49:47.368000',NULL,'2022-03-29 15:36:12.255000','CONVERSE',1,'/media/static/1af55dcb-dc1f-488d-99ef-cbac1166f791.png'),(4,'2021-08-22 13:50:05.440000',NULL,'2022-03-29 15:33:00.242000','NIKE',1,'/media/static/5fa0ddb1-5e3e-4ae3-a7a1-ce4fc2ceac23.jpg'),(5,'2022-03-29 14:47:49.125000',NULL,'2022-03-29 15:34:47.952000','BALENCIAGA',1,'/media/static/11896486-5bb4-4fce-b0b1-f113b60d588c.png'),(7,'2022-03-29 15:35:59.165000',NULL,'2022-03-29 15:36:21.046000','MLB',1,'/media/static/bd901f26-d8fc-4ffb-82b8-d6598d271aee.png'),(8,'2022-03-29 15:43:05.662000',NULL,'2022-05-01 18:32:21.341000','ADIDAS',1,'/media/static/f245d4ef-e0d1-41f4-941e-354da2b585e1.png');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_fk_1_idx` (`user_id`),
  KEY `carts_fk_2_idx` (`product_id`),
  CONSTRAINT `carts_fk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `carts_fk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (10,1,'u2aJZe',1,41),(14,1,'bfPcPf',2,42);
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `modified_at` datetime(6) DEFAULT NULL,
  `name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'2022-03-22 13:48:57.568000',NULL,'Giày Nam',0,'giay-nam',1),(2,'2022-03-22 13:49:02.889000',NULL,'Giày Nữ',0,'giay-nu',1),(3,'2022-03-22 13:49:06.955000','2022-03-29 18:31:01.043000','Giày Trẻ em',0,'giay-tre-em',1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime(6) DEFAULT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKs1slvnkuemjsq2kj4h3vhx7i1` (`post_id`),
  KEY `FKm1rmnfcvq5mk26li4lit88pc5` (`product_id`),
  KEY `FKqm52p1v3o13hy268he0wcngr5` (`user_id`),
  CONSTRAINT `FKm1rmnfcvq5mk26li4lit88pc5` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKqm52p1v3o13hy268he0wcngr5` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKs1slvnkuemjsq2kj4h3vhx7i1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'Sản phẩm chất lượng, sẽ ủng hộ shop dài dài','2022-03-22 14:10:18.348000',NULL,'u2aJZe',2),(2,'mmmm','2022-04-30 07:19:38.507000',NULL,'bfPcPf',1),(3,'hi','2022-04-30 07:22:56.908000',NULL,'bfPcPf',1),(4,'toots','2022-04-30 07:24:57.137000',NULL,'bfPcPf',1),(6,'haizz','2022-04-30 07:39:03.888000',NULL,'bfPcPf',1),(7,'xịn\n','2022-05-04 15:23:42.151000',NULL,'yYdwl4',1),(8,'Chương trình có những khuyến mại nào hấp dẫn?','2022-05-05 00:18:23.615000',2,NULL,1),(9,'những sản phẩm nào đang khuyến mại ','2022-05-16 18:09:13.150000',2,NULL,1),(10,'tốt lắm','2022-05-16 18:11:41.244000',2,NULL,1);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_4mgw71qgyeud96uf8kgiu9fsw` (`link`),
  KEY `FKp1m9f9rm7xy8nk7a820dvh6c4` (`created_by`),
  CONSTRAINT `FKp1m9f9rm7xy8nk7a820dvh6c4` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES ('129ad9d1-cb21-4219-9d17-b19e9b68fd7a','2022-05-16 17:54:12.035000','/media/static/129ad9d1-cb21-4219-9d17-b19e9b68fd7a.jpg','file',94748,'jpg',1),('2831e61c-7088-46a2-9522-46c625173168','2022-05-16 17:52:30.324000','/media/static/2831e61c-7088-46a2-9522-46c625173168.jpg','file',128771,'jpg',1),('336d4d07-3423-4b61-8e66-d23281ed0e28','2022-05-16 17:53:02.063000','/media/static/336d4d07-3423-4b61-8e66-d23281ed0e28.jpg','file',185502,'jpg',1),('48f7030b-5e72-4a2a-9f2e-7fbb8dcb80a4','2022-05-16 17:51:45.016000','/media/static/48f7030b-5e72-4a2a-9f2e-7fbb8dcb80a4.jpg','file',49619,'jpg',1),('545c243c-e2f6-42ac-9f1f-df4173e36bb3','2022-05-16 17:56:02.310000','/media/static/545c243c-e2f6-42ac-9f1f-df4173e36bb3.png','file',822036,'png',1),('72294198-7c39-4c9a-962e-fd4950f10950','2022-05-16 17:50:17.245000','/media/static/72294198-7c39-4c9a-962e-fd4950f10950.jpg','file',47154,'jpg',1),('87a3983c-9a92-4ec4-978e-e4f334718cb9','2022-05-16 17:54:19.578000','/media/static/87a3983c-9a92-4ec4-978e-e4f334718cb9.jpg','file',41926,'jpg',1),('88eeed93-10c1-4b91-ac50-b8fd823462ce','2022-05-16 17:54:58.996000','/media/static/88eeed93-10c1-4b91-ac50-b8fd823462ce.jpg','file',38817,'jpg',1),('b6332bb5-efa8-48ae-bde7-62f4d27c50aa','2022-05-16 17:52:54.532000','/media/static/b6332bb5-efa8-48ae-bde7-62f4d27c50aa.jpg','file',148311,'jpg',1),('bad2266c-8fb9-498a-9833-044d721f9e2a','2022-05-16 17:50:01.823000','/media/static/bad2266c-8fb9-498a-9833-044d721f9e2a.jpg','file',59236,'jpg',1),('ca9fdf39-29c2-480f-849c-4219fad81678','2022-05-16 17:53:38.844000','/media/static/ca9fdf39-29c2-480f-849c-4219fad81678.jpg','file',57578,'jpg',1),('cea46f05-300f-4d47-be8f-24a59b6c727c','2022-05-16 17:50:28.876000','/media/static/cea46f05-300f-4d47-be8f-24a59b6c727c.jpg','file',50922,'jpg',1),('df449dba-bff7-4d23-9192-77eee24c3689','2022-05-16 17:53:53.657000','/media/static/df449dba-bff7-4d23-9192-77eee24c3689.jpg','file',54344,'jpg',1),('e264fccb-edd8-425d-b188-f1ec65ae64b1','2022-05-16 17:50:07.601000','/media/static/e264fccb-edd8-425d-b188-f1ec65ae64b1.jpg','file',59000,'jpg',1),('ef2d64b4-0b37-4b45-88d8-068c565db119','2022-05-09 16:36:03.919000','/media/static/ef2d64b4-0b37-4b45-88d8-068c565db119.jpg','file',53158,'jpg',1);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `modified_at` datetime(6) DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `promotion` json DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `receiver_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `total_price` bigint(20) DEFAULT NULL,
  `buyer` bigint(20) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `modified_by` bigint(20) DEFAULT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKljvc97l19m7cnlopv8535hijx` (`buyer`),
  KEY `FKtjwuphstqm46uffgc7l1r27a9` (`created_by`),
  KEY `FKe0abpy849bl2ynw3468ksavvl` (`modified_by`),
  KEY `FK787ibr3guwp6xobrpbofnv7le` (`product_id`),
  CONSTRAINT `FK787ibr3guwp6xobrpbofnv7le` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKe0abpy849bl2ynw3468ksavvl` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FKljvc97l19m7cnlopv8535hijx` FOREIGN KEY (`buyer`) REFERENCES `users` (`id`),
  CONSTRAINT `FKtjwuphstqm46uffgc7l1r27a9` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (12,'2022-05-01 09:18:48.731000','2022-05-01 09:44:39.115000','',620000,NULL,1,'hn','admin','0969708715',41,5,620000,1,1,1,'bfPcPf'),(13,'2022-05-01 09:27:33.622000','2022-05-01 09:43:36.047000','',900000,NULL,2,'hn','admin','0969708715',40,5,900000,1,1,1,'Eq1H5L'),(14,'2022-05-01 09:50:08.148000',NULL,'',620000,NULL,0,'th','admin','0969708715',41,5,620000,1,1,NULL,'bfPcPf'),(15,'2022-05-01 09:50:43.279000','2022-05-02 18:33:25.457000','',620000,NULL,1,'th','admin','0969708715',41,3,620000,1,1,1,'bfPcPf'),(16,'2022-05-01 09:51:44.009000','2022-05-02 03:52:27.790000','',450000,NULL,1,'thththtth','admin','0969708712',41,5,450000,1,1,1,'Eq1H5L'),(17,'2022-05-01 10:01:12.951000',NULL,'',450000,NULL,1,'hehheg seg','admin','0969708712',41,5,315000,1,1,NULL,'Eq1H5L'),(18,'2022-05-01 10:10:15.435000',NULL,'',450000,NULL,1,'thhhh','admin','0969708715',41,5,450000,1,1,NULL,'Eq1H5L'),(19,'2022-05-01 10:12:48.828000',NULL,'',450000,NULL,1,'a','admin','0969708715',41,5,450000,1,1,NULL,'Eq1H5L'),(20,'2022-05-01 10:13:37.172000',NULL,'',450000,NULL,1,'a345345','admin','0969708715',41,5,450000,1,1,NULL,'Eq1H5L'),(21,'2022-05-01 10:26:01.166000','2022-05-02 18:41:43.924000','',450000,NULL,1,'gsrasr','admin','0969708715',41,3,450000,1,1,1,'Eq1H5L'),(22,'2022-05-01 10:29:30.662000','2022-05-02 18:43:48.989000','',1650000,NULL,3,'gegesgar gehehe ','admin','0969708715',41,3,1650000,1,1,1,'Eq1H5L'),(23,'2022-05-01 10:47:00.751000','2022-05-05 01:39:03.825000','',1650000,NULL,3,'aa','admin','0969708715',41,4,1650000,1,1,1,'Eq1H5L'),(24,'2022-05-01 12:09:27.480000','2022-05-02 18:32:53.270000','',900000,NULL,2,'thang thanh','admin','0969708715',42,3,900000,1,1,1,'Eq1H5L'),(25,'2022-05-04 17:14:38.982000','2022-05-04 18:20:21.610000','',510000,NULL,1,'Vĩnh Hưng Hoàng Mai Hà Nội','user','0969708715',42,3,510000,2,2,1,'UxsKho'),(26,'2022-05-04 17:32:30.134000',NULL,'',570000,NULL,2,'Vĩnh Hưng Hoàng Mai Hà Nội','user','0969708715',41,1,570000,2,2,NULL,'yYdwl4'),(27,'2022-05-04 17:36:06.490000','2022-05-04 17:38:48.183000','',1140000,NULL,2,'Vĩnh Hưng Hoàng Mai Hà Nội','user','0969708715',41,1,1140000,2,2,1,'yYdwl4'),(29,'2022-05-04 17:46:52.988000',NULL,'',550000,NULL,1,'qqq','admin','0969708715',41,1,550000,1,1,NULL,'Eq1H5L'),(30,'2022-05-04 17:51:38.783000',NULL,'',550000,NULL,2,'hgggggggg','admin','0969708715',42,1,950000,1,1,NULL,'Eq1H5L'),(31,'2022-05-04 17:56:15.967000','2022-05-04 18:12:49.033000','',570000,NULL,3,'hekeira ','admin','0969708715',42,1,1710000,1,1,1,'yYdwl4'),(32,'2022-05-05 01:41:57.153000','2022-05-05 01:42:23.418000','',750000,NULL,0,'Bắc Từ Liêm, Hà Nội','Ngô Đức Minh','0342568859',40,5,750000,1,1,1,'bfPcPf'),(33,'2022-05-05 01:42:03.789000','2022-05-05 01:44:15.844000','',750000,NULL,1,'Bắc Từ Liêm, Hà Nội','Ngô Đức Minh','0342568859',40,2,750000,1,1,1,'bfPcPf');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime(6) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `modified_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `slug` varchar(600) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) DEFAULT '0',
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `modified_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3b6cq7u0x3fdxeh4sq95mia29` (`created_by`),
  KEY `FKl2q2idcap1gt3qhh87ebirpnc` (`modified_by`),
  CONSTRAINT `FK3b6cq7u0x3fdxeh4sq95mia29` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FKl2q2idcap1gt3qhh87ebirpnc` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (2,'<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px; font-style: italic;\">Với sự hấp dẫn từ sự kiện sale lớn nhất năm 2021 thì Shoes Shop cũng muốn chia sẽ chút niềm vui cho các tín đồ sneaker những mẫu giày chất lượng &amp; tuyệt vời nhất.&nbsp;</span><br></p>','2022-05-04 15:48:06.441000','<p><br></p><div><p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px;\">Không khí mua sắm đã bắt đầu tràn ngập trên các con đường, các cửa hàng trên toàn quốc. Đây là cơ hội duy nhất trong năm để mọi người có thể lựa chọn cho mình những trang phục, đồ dùng mình \"ấp ủ\" từ lâu rồi phải không nè&nbsp;</span><br></p><p><br style=\"outline: 0px; content: &quot;A&quot;; height: 1px; margin: 6px 0px; display: block; color: rgb(51, 51, 51); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px;\"><em style=\"outline: 0px; color: rgb(51, 51, 51); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px;\">Và đây cũng là thời điểm thích hợp để đi du lịch cùng người yêu, bạn bè &amp; những người thân trong gia đình. Thời tiết tốt, mát mẻ, trong lành, nhiều điểm tham quan mới &amp; giúp giải tỏa stress sau cả năm làm việc, học tập mệt mỏi thì cũng đáng cân nhắc để xách túi lên đường ngay nào!</em><br style=\"outline: 0px; content: &quot;A&quot;; height: 1px; margin: 6px 0px; display: block; color: rgb(51, 51, 51); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px;\">Nhưng để đi du lịch được thoải mái &amp; vui vẻ hơn thì trong chuyến đi của bạn không thể thiếu vài đôi giày sneaker đẹp, cá tính, năng động &amp; đặc biệt là phải hỗ trợ công năng tối đa cho người sử dụng. Và trong dịp&nbsp;</span><span style=\"outline: 0px; color: rgb(51, 51, 51); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px;\"><span style=\"font-weight: 700 !important;\">BLACK FRIDAY 2021</span></span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px;\">&nbsp;lần này&nbsp;</span><span style=\"outline: 0px; color: rgb(51, 51, 51); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px;\">Shoes Shop</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 18px;\">&nbsp;xin liệt kê các mẫu giày được khách phản hồi rất tốt &amp; bán rất chạy trong năm vừa qua.</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 16px; font-style: italic;\"><br></span></p></div>','2022-05-16 18:08:34.344000','2022-05-04 15:48:06.441000','chuong-trinh-sale-khung-lon-nhat-nam-black-friday-2021',1,'/media/static/545c243c-e2f6-42ac-9f1f-df4173e36bb3.png','CHƯƠNG TRÌNH SALE KHỦNG LỚN NHẤT NĂM - BLACK FRIDAY 2021',1,1);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image_feedback` json DEFAULT NULL,
  `images` json DEFAULT NULL,
  `modified_at` datetime(6) DEFAULT NULL,
  `name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` bigint(20) DEFAULT NULL,
  `sale_price` bigint(20) DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) DEFAULT NULL,
  `total_sold` bigint(20) DEFAULT NULL,
  `product_view` int(11) DEFAULT NULL,
  `brand_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKs6cydsualtsrprvlf2bb3lcam` (`brand_id`),
  CONSTRAINT `FKs6cydsualtsrprvlf2bb3lcam` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('22U2Iv',NULL,'<div class=\"kvgmc6g5 cxmmr5t8 oygrvhab hcukyx3x c1et5uql ii04i59q\" style=\"overflow-wrap: break-word; margin: 0px; white-space: pre-wrap; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px;\"><div dir=\"auto\" style=\"font-family: inherit;\"><span class=\"pq6dq46d tbxw36s4 knj5qynh kvgmc6g5 ditlmg2l oygrvhab nvdbi5me sf5mxxl7 gl3lb2sf hhz5lgdu\" style=\"margin: 0px 1px; height: 16px; width: 16px; display: inline-flex; vertical-align: middle; font-family: inherit;\"><img height=\"16\" width=\"16\" alt=\"?\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/ta9/1.5/16/1f525.png\" style=\"border: 0px;\"></span>Jorđan rep 1:1<span class=\"pq6dq46d tbxw36s4 knj5qynh kvgmc6g5 ditlmg2l oygrvhab nvdbi5me sf5mxxl7 gl3lb2sf hhz5lgdu\" style=\"margin: 0px 1px; height: 16px; width: 16px; display: inline-flex; vertical-align: middle; font-family: inherit;\"><img height=\"16\" width=\"16\" alt=\"?\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/ta9/1.5/16/1f525.png\" style=\"border: 0px;\"></span></div><div dir=\"auto\" style=\"font-family: inherit;\"><span style=\"font-family: inherit;\"><a class=\"oajrlxb2 g5ia77u1 qu0x051f esr5mh6w e9989ue4 r7d6kgcz rq0escxv nhd2j8a9 nc684nl6 p7hjln8o kvgmc6g5 cxmmr5t8 oygrvhab hcukyx3x jb3vyjys rz4wbd8a qt6c0cv9 a8nywdso i1ao9s8h esuyzwwr f1sip0of lzcic4wl gpro0wi8 q66pz984 b1v8xokw\" href=\"https://www.facebook.com/hashtag/gi%C3%A1_ch%E1%BB%89_620k?__eep__=6&amp;__cft__[0]=AZXfpl-Mq_c81QGawnsouGBbzbkS93fMVR558FJ953GHnBSRgnMshsiVT_-FVVIJ5XJTfKK62l7xWYYlKutl8TnBaNfFWbNGzox9bmOsrP1H3EwWBe6hUGrzxjpzrqH01Evbk9N-2qQ6cbZJbl4jEhEM&amp;__tn__=*NK-R\" role=\"link\" tabindex=\"0\" style=\"color: var(--accent); cursor: pointer; list-style: none; border-width: 0px; border-style: initial; border-color: initial; padding: 0px; margin: 0px; touch-action: manipulation; text-align: inherit; display: inline; -webkit-tap-highlight-color: transparent; font-family: inherit;\">#Giá_chỉ_620k</a></span></div><div dir=\"auto\" style=\"font-family: inherit;\"><span class=\"pq6dq46d tbxw36s4 knj5qynh kvgmc6g5 ditlmg2l oygrvhab nvdbi5me sf5mxxl7 gl3lb2sf hhz5lgdu\" style=\"margin: 0px 1px; height: 16px; width: 16px; display: inline-flex; vertical-align: middle; font-family: inherit;\"><img height=\"16\" width=\"16\" alt=\"?\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/td2/1.5/16/1f44a.png\" style=\"border: 0px;\"></span> Full hộp, móc jodan, tem tag đầy đủ</div><div dir=\"auto\" style=\"font-family: inherit;\"><span class=\"pq6dq46d tbxw36s4 knj5qynh kvgmc6g5 ditlmg2l oygrvhab nvdbi5me sf5mxxl7 gl3lb2sf hhz5lgdu\" style=\"margin: 0px 1px; height: 16px; width: 16px; display: inline-flex; vertical-align: middle; font-family: inherit;\"><img height=\"16\" width=\"16\" alt=\"?\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/taa/1.5/16/1f449.png\" style=\"border: 0px;\"></span> Size 36.37.38.39.40.41.42.43</div><div dir=\"auto\" style=\"font-family: inherit;\"><span class=\"pq6dq46d tbxw36s4 knj5qynh kvgmc6g5 ditlmg2l oygrvhab nvdbi5me sf5mxxl7 gl3lb2sf hhz5lgdu\" style=\"margin: 0px 1px; height: 16px; width: 16px; display: inline-flex; vertical-align: middle; font-family: inherit;\"><img height=\"16\" width=\"16\" alt=\"?\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/t39/1.5/16/1f31f.png\" style=\"border: 0px;\"></span> Free ship toàn quốc</div></div><div class=\"cxmmr5t8 oygrvhab hcukyx3x c1et5uql o9v6fnle ii04i59q\" style=\"overflow-wrap: break-word; margin: 0.5em 0px 0px; white-space: pre-wrap; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px;\"><div dir=\"auto\" style=\"font-family: inherit;\"><span style=\"font-family: inherit;\"><a class=\"oajrlxb2 g5ia77u1 qu0x051f esr5mh6w e9989ue4 r7d6kgcz rq0escxv nhd2j8a9 nc684nl6 p7hjln8o kvgmc6g5 cxmmr5t8 oygrvhab hcukyx3x jb3vyjys rz4wbd8a qt6c0cv9 a8nywdso i1ao9s8h esuyzwwr f1sip0of lzcic4wl gpro0wi8 q66pz984 b1v8xokw\" href=\"https://www.facebook.com/hashtag/adidas?__eep__=6&amp;__cft__[0]=AZXfpl-Mq_c81QGawnsouGBbzbkS93fMVR558FJ953GHnBSRgnMshsiVT_-FVVIJ5XJTfKK62l7xWYYlKutl8TnBaNfFWbNGzox9bmOsrP1H3EwWBe6hUGrzxjpzrqH01Evbk9N-2qQ6cbZJbl4jEhEM&amp;__tn__=*NK-R\" role=\"link\" tabindex=\"0\" style=\"color: var(--accent); cursor: pointer; list-style: none; border-width: 0px; border-style: initial; border-color: initial; padding: 0px; margin: 0px; touch-action: manipulation; text-align: inherit; display: inline; -webkit-tap-highlight-color: transparent; font-family: inherit;\">#adidas</a></span> <span style=\"font-family: inherit;\"><a class=\"oajrlxb2 g5ia77u1 qu0x051f esr5mh6w e9989ue4 r7d6kgcz rq0escxv nhd2j8a9 nc684nl6 p7hjln8o kvgmc6g5 cxmmr5t8 oygrvhab hcukyx3x jb3vyjys rz4wbd8a qt6c0cv9 a8nywdso i1ao9s8h esuyzwwr f1sip0of lzcic4wl gpro0wi8 q66pz984 b1v8xokw\" href=\"https://www.facebook.com/hashtag/nike?__eep__=6&amp;__cft__[0]=AZXfpl-Mq_c81QGawnsouGBbzbkS93fMVR558FJ953GHnBSRgnMshsiVT_-FVVIJ5XJTfKK62l7xWYYlKutl8TnBaNfFWbNGzox9bmOsrP1H3EwWBe6hUGrzxjpzrqH01Evbk9N-2qQ6cbZJbl4jEhEM&amp;__tn__=*NK-R\" role=\"link\" tabindex=\"0\" style=\"color: var(--accent); cursor: pointer; list-style: none; border-width: 0px; border-style: initial; border-color: initial; padding: 0px; margin: 0px; touch-action: manipulation; text-align: inherit; display: inline; -webkit-tap-highlight-color: transparent; font-family: inherit;\">#nike</a></span> <span style=\"font-family: inherit;\"><a class=\"oajrlxb2 g5ia77u1 qu0x051f esr5mh6w e9989ue4 r7d6kgcz rq0escxv nhd2j8a9 nc684nl6 p7hjln8o kvgmc6g5 cxmmr5t8 oygrvhab hcukyx3x jb3vyjys rz4wbd8a qt6c0cv9 a8nywdso i1ao9s8h esuyzwwr f1sip0of lzcic4wl gpro0wi8 q66pz984 b1v8xokw\" href=\"https://www.facebook.com/hashtag/vans?__eep__=6&amp;__cft__[0]=AZXfpl-Mq_c81QGawnsouGBbzbkS93fMVR558FJ953GHnBSRgnMshsiVT_-FVVIJ5XJTfKK62l7xWYYlKutl8TnBaNfFWbNGzox9bmOsrP1H3EwWBe6hUGrzxjpzrqH01Evbk9N-2qQ6cbZJbl4jEhEM&amp;__tn__=*NK-R\" role=\"link\" tabindex=\"0\" style=\"color: var(--accent); cursor: pointer; list-style: none; border-width: 0px; border-style: initial; border-color: initial; padding: 0px; margin: 0px; touch-action: manipulation; text-align: inherit; display: inline; -webkit-tap-highlight-color: transparent; font-family: inherit;\">#vans</a></span> <span style=\"font-family: inherit;\"><a class=\"oajrlxb2 g5ia77u1 qu0x051f esr5mh6w e9989ue4 r7d6kgcz rq0escxv nhd2j8a9 nc684nl6 p7hjln8o kvgmc6g5 cxmmr5t8 oygrvhab hcukyx3x jb3vyjys rz4wbd8a qt6c0cv9 a8nywdso i1ao9s8h esuyzwwr f1sip0of lzcic4wl gpro0wi8 q66pz984 b1v8xokw\" href=\"https://www.facebook.com/hashtag/giaynam?__eep__=6&amp;__cft__[0]=AZXfpl-Mq_c81QGawnsouGBbzbkS93fMVR558FJ953GHnBSRgnMshsiVT_-FVVIJ5XJTfKK62l7xWYYlKutl8TnBaNfFWbNGzox9bmOsrP1H3EwWBe6hUGrzxjpzrqH01Evbk9N-2qQ6cbZJbl4jEhEM&amp;__tn__=*NK-R\" role=\"link\" tabindex=\"0\" style=\"color: var(--accent); cursor: pointer; list-style: none; border-width: 0px; border-style: initial; border-color: initial; padding: 0px; margin: 0px; touch-action: manipulation; text-align: inherit; display: inline; -webkit-tap-highlight-color: transparent; font-family: inherit;\">#giaynam</a></span> <span style=\"font-family: inherit;\"><a class=\"oajrlxb2 g5ia77u1 qu0x051f esr5mh6w e9989ue4 r7d6kgcz rq0escxv nhd2j8a9 nc684nl6 p7hjln8o kvgmc6g5 cxmmr5t8 oygrvhab hcukyx3x jb3vyjys rz4wbd8a qt6c0cv9 a8nywdso i1ao9s8h esuyzwwr f1sip0of lzcic4wl gpro0wi8 q66pz984 b1v8xokw\" href=\"https://www.facebook.com/hashtag/giaynu?__eep__=6&amp;__cft__[0]=AZXfpl-Mq_c81QGawnsouGBbzbkS93fMVR558FJ953GHnBSRgnMshsiVT_-FVVIJ5XJTfKK62l7xWYYlKutl8TnBaNfFWbNGzox9bmOsrP1H3EwWBe6hUGrzxjpzrqH01Evbk9N-2qQ6cbZJbl4jEhEM&amp;__tn__=*NK-R\" role=\"link\" tabindex=\"0\" style=\"color: var(--accent); cursor: pointer; list-style: none; border-width: 0px; border-style: initial; border-color: initial; padding: 0px; margin: 0px; touch-action: manipulation; text-align: inherit; display: inline; -webkit-tap-highlight-color: transparent; font-family: inherit;\">#giaynu</a></span> <span style=\"font-family: inherit;\"><a class=\"oajrlxb2 g5ia77u1 qu0x051f esr5mh6w e9989ue4 r7d6kgcz rq0escxv nhd2j8a9 nc684nl6 p7hjln8o kvgmc6g5 cxmmr5t8 oygrvhab hcukyx3x jb3vyjys rz4wbd8a qt6c0cv9 a8nywdso i1ao9s8h esuyzwwr f1sip0of lzcic4wl gpro0wi8 q66pz984 b1v8xokw\" href=\"https://www.facebook.com/hashtag/giaydep?__eep__=6&amp;__cft__[0]=AZXfpl-Mq_c81QGawnsouGBbzbkS93fMVR558FJ953GHnBSRgnMshsiVT_-FVVIJ5XJTfKK62l7xWYYlKutl8TnBaNfFWbNGzox9bmOsrP1H3EwWBe6hUGrzxjpzrqH01Evbk9N-2qQ6cbZJbl4jEhEM&amp;__tn__=*NK-R\" role=\"link\" tabindex=\"0\" style=\"color: var(--accent); cursor: pointer; list-style: none; border-width: 0px; border-style: initial; border-color: initial; padding: 0px; margin: 0px; touch-action: manipulation; text-align: inherit; display: inline; -webkit-tap-highlight-color: transparent; font-family: inherit;\">#giaydep</a></span> <span style=\"font-family: inherit;\"><a class=\"oajrlxb2 g5ia77u1 qu0x051f esr5mh6w e9989ue4 r7d6kgcz rq0escxv nhd2j8a9 nc684nl6 p7hjln8o kvgmc6g5 cxmmr5t8 oygrvhab hcukyx3x jb3vyjys rz4wbd8a qt6c0cv9 a8nywdso i1ao9s8h esuyzwwr f1sip0of lzcic4wl gpro0wi8 q66pz984 b1v8xokw\" href=\"https://www.facebook.com/hashtag/giaydoi?__eep__=6&amp;__cft__[0]=AZXfpl-Mq_c81QGawnsouGBbzbkS93fMVR558FJ953GHnBSRgnMshsiVT_-FVVIJ5XJTfKK62l7xWYYlKutl8TnBaNfFWbNGzox9bmOsrP1H3EwWBe6hUGrzxjpzrqH01Evbk9N-2qQ6cbZJbl4jEhEM&amp;__tn__=*NK-R\" role=\"link\" tabindex=\"0\" style=\"color: var(--accent); cursor: pointer; list-style: none; border-width: 0px; border-style: initial; border-color: initial; padding: 0px; margin: 0px; touch-action: manipulation; text-align: inherit; display: inline; -webkit-tap-highlight-color: transparent; font-family: inherit;\">#giaydoi</a></span>  <span style=\"font-family: inherit;\"><a class=\"oajrlxb2 g5ia77u1 qu0x051f esr5mh6w e9989ue4 r7d6kgcz rq0escxv nhd2j8a9 nc684nl6 p7hjln8o kvgmc6g5 cxmmr5t8 oygrvhab hcukyx3x jb3vyjys rz4wbd8a qt6c0cv9 a8nywdso i1ao9s8h esuyzwwr f1sip0of lzcic4wl gpro0wi8 q66pz984 b1v8xokw\" href=\"https://www.facebook.com/hashtag/sneaker?__eep__=6&amp;__cft__[0]=AZXfpl-Mq_c81QGawnsouGBbzbkS93fMVR558FJ953GHnBSRgnMshsiVT_-FVVIJ5XJTfKK62l7xWYYlKutl8TnBaNfFWbNGzox9bmOsrP1H3EwWBe6hUGrzxjpzrqH01Evbk9N-2qQ6cbZJbl4jEhEM&amp;__tn__=*NK-R\" role=\"link\" tabindex=\"0\" style=\"color: var(--accent); cursor: pointer; list-style: none; border-width: 0px; border-style: initial; border-color: initial; padding: 0px; margin: 0px; touch-action: manipulation; text-align: inherit; display: inline; -webkit-tap-highlight-color: transparent; font-family: inherit;\">#sneaker</a></span> <span style=\"font-family: inherit;\"><a class=\"oajrlxb2 g5ia77u1 qu0x051f esr5mh6w e9989ue4 r7d6kgcz rq0escxv nhd2j8a9 nc684nl6 p7hjln8o kvgmc6g5 cxmmr5t8 oygrvhab hcukyx3x jb3vyjys rz4wbd8a qt6c0cv9 a8nywdso i1ao9s8h esuyzwwr f1sip0of lzcic4wl gpro0wi8 q66pz984 b1v8xokw\" href=\"https://www.facebook.com/hashtag/shoes?__eep__=6&amp;__cft__[0]=AZXfpl-Mq_c81QGawnsouGBbzbkS93fMVR558FJ953GHnBSRgnMshsiVT_-FVVIJ5XJTfKK62l7xWYYlKutl8TnBaNfFWbNGzox9bmOsrP1H3EwWBe6hUGrzxjpzrqH01Evbk9N-2qQ6cbZJbl4jEhEM&amp;__tn__=*NK-R\" role=\"link\" tabindex=\"0\" style=\"color: var(--accent); cursor: pointer; list-style: none; border-width: 0px; border-style: initial; border-color: initial; padding: 0px; margin: 0px; touch-action: manipulation; text-align: inherit; display: inline; -webkit-tap-highlight-color: transparent; font-family: inherit;\">#shoes</a></span> <span style=\"font-family: inherit;\"><a class=\"oajrlxb2 g5ia77u1 qu0x051f esr5mh6w e9989ue4 r7d6kgcz rq0escxv nhd2j8a9 nc684nl6 p7hjln8o kvgmc6g5 cxmmr5t8 oygrvhab hcukyx3x jb3vyjys rz4wbd8a qt6c0cv9 a8nywdso i1ao9s8h esuyzwwr f1sip0of lzcic4wl gpro0wi8 q66pz984 b1v8xokw\" href=\"https://www.facebook.com/hashtag/giay?__eep__=6&amp;__cft__[0]=AZXfpl-Mq_c81QGawnsouGBbzbkS93fMVR558FJ953GHnBSRgnMshsiVT_-FVVIJ5XJTfKK62l7xWYYlKutl8TnBaNfFWbNGzox9bmOsrP1H3EwWBe6hUGrzxjpzrqH01Evbk9N-2qQ6cbZJbl4jEhEM&amp;__tn__=*NK-R\" role=\"link\" tabindex=\"0\" style=\"color: var(--accent); cursor: pointer; list-style: none; border-width: 0px; border-style: initial; border-color: initial; padding: 0px; margin: 0px; touch-action: manipulation; text-align: inherit; display: inline; -webkit-tap-highlight-color: transparent; font-family: inherit;\">#giay</a></span></div></div>','[\"/media/static/cea46f05-300f-4d47-be8f-24a59b6c727c.jpg\", \"/media/static/72294198-7c39-4c9a-962e-fd4950f10950.jpg\"]','[\"/media/static/e264fccb-edd8-425d-b188-f1ec65ae64b1.jpg\", \"/media/static/bad2266c-8fb9-498a-9833-044d721f9e2a.jpg\"]','2022-05-16 17:51:08.847000','NIKE JORDAN Đen Trắng',620000,750000,'nike-jordan-en-trang',1,0,0,4),('bfPcPf',NULL,'<div dir=\"auto\" style=\"font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px; white-space: pre-wrap;\"><span class=\"pq6dq46d tbxw36s4 knj5qynh kvgmc6g5 ditlmg2l oygrvhab nvdbi5me sf5mxxl7 gl3lb2sf hhz5lgdu\" style=\"margin: 0px 1px; height: 16px; width: 16px; display: inline-flex; vertical-align: middle; font-family: inherit;\"><img height=\"16\" width=\"16\" alt=\"?\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/ta9/1.5/16/1f525.png\" style=\"border: 0px;\"></span>MLB Bostơn rep 1:1 in 3D không bong tróc</div><div dir=\"auto\" style=\"font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px; white-space: pre-wrap;\"><span style=\"font-family: inherit;\"><a class=\"oajrlxb2 g5ia77u1 qu0x051f esr5mh6w e9989ue4 r7d6kgcz rq0escxv nhd2j8a9 nc684nl6 p7hjln8o kvgmc6g5 cxmmr5t8 oygrvhab hcukyx3x jb3vyjys rz4wbd8a qt6c0cv9 a8nywdso i1ao9s8h esuyzwwr f1sip0of lzcic4wl gpro0wi8 q66pz984 b1v8xokw\" href=\"https://www.facebook.com/hashtag/gi%C3%A1_ch%E1%BB%89_620k?__eep__=6&amp;__cft__[0]=AZUn_wgrf6rElsYC2_EeGhg87S6dz3FcA2XnDL1H9uONVPUJaihpqIvUhxU1JMh5zUDbi7vkjQc4msCe1OkGY-XvOOJjbLHr7cDUl0OsrCVPV71t4HxI9NIWqAUGs8uH_btKrEUO1-x-1RTV0ihBiqE8&amp;__tn__=*NK-R\" role=\"link\" tabindex=\"0\" style=\"color: var(--accent); cursor: pointer; list-style: none; border-width: 0px; border-style: initial; border-color: initial; padding: 0px; margin: 0px; touch-action: manipulation; text-align: inherit; display: inline; -webkit-tap-highlight-color: transparent; font-family: inherit;\">#Giá_chỉ_620k</a></span></div><div dir=\"auto\" style=\"font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px; white-space: pre-wrap;\"><span class=\"pq6dq46d tbxw36s4 knj5qynh kvgmc6g5 ditlmg2l oygrvhab nvdbi5me sf5mxxl7 gl3lb2sf hhz5lgdu\" style=\"margin: 0px 1px; height: 16px; width: 16px; display: inline-flex; vertical-align: middle; font-family: inherit;\"><img height=\"16\" width=\"16\" alt=\"?\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/td2/1.5/16/1f44a.png\" style=\"border: 0px;\"></span> Full hộp, phụ kiện tem mac, túi đựng đầy đủ </div><div dir=\"auto\" style=\"font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px; white-space: pre-wrap;\"><span class=\"pq6dq46d tbxw36s4 knj5qynh kvgmc6g5 ditlmg2l oygrvhab nvdbi5me sf5mxxl7 gl3lb2sf hhz5lgdu\" style=\"margin: 0px 1px; height: 16px; width: 16px; display: inline-flex; vertical-align: middle; font-family: inherit;\"><img height=\"16\" width=\"16\" alt=\"?\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/taa/1.5/16/1f449.png\" style=\"border: 0px;\"></span> Size 36.37.39.40</div><div dir=\"auto\" style=\"font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px; white-space: pre-wrap;\"><span class=\"pq6dq46d tbxw36s4 knj5qynh kvgmc6g5 ditlmg2l oygrvhab nvdbi5me sf5mxxl7 gl3lb2sf hhz5lgdu\" style=\"margin: 0px 1px; height: 16px; width: 16px; display: inline-flex; vertical-align: middle; font-family: inherit;\"><img height=\"16\" width=\"16\" alt=\"?\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/t39/1.5/16/1f31f.png\" style=\"border: 0px;\"></span> Free ship toàn quốc</div>',NULL,'[\"/media/static/48f7030b-5e72-4a2a-9f2e-7fbb8dcb80a4.jpg\"]','2022-05-16 17:51:47.686000','MLB Bostơn',620000,750000,'mlb-boston',1,0,0,7),('Eq1H5L',NULL,'<p><span style=\"color: rgb(137, 137, 137); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 15px; text-align: center;\">&nbsp;Chất lượng Rep 1:1 Tốt Nhất</span><br style=\"color: rgb(137, 137, 137); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 15px; text-align: center;\"><span style=\"color: rgb(137, 137, 137); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 15px; text-align: center;\">- Vận chuyển toàn quốc&nbsp;[ Kiểm Tra Hàng Trước Khi Thanh Toán ]&nbsp;</span><br style=\"color: rgb(137, 137, 137); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 15px; text-align: center;\"><span style=\"color: rgb(137, 137, 137); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 15px; text-align: center;\">- 100% Ảnh chụp trực tiếp tại Tu Shoes&nbsp;</span><br style=\"color: rgb(137, 137, 137); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 15px; text-align: center;\"><span style=\"color: rgb(137, 137, 137); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 15px; text-align: center;\">- Bảo Hành Trọn Đời Sản Phẩm&nbsp;</span><br style=\"color: rgb(137, 137, 137); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 15px; text-align: center;\"><span style=\"color: rgb(137, 137, 137); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 15px; text-align: center;\">- Đổi Trả 7 Ngày Không Kể Lí Do&nbsp;</span><br></p>',NULL,'[\"/media/static/2831e61c-7088-46a2-9522-46c625173168.jpg\"]','2022-05-16 17:52:34.698000','CONVERSE HOA CÚC',450000,550000,'converse-hoa-cuc',1,0,0,2),('pwL619',NULL,'giày xuất xưởng chính hãng',NULL,'[\"/media/static/b6332bb5-efa8-48ae-bde7-62f4d27c50aa.jpg\", \"/media/static/336d4d07-3423-4b61-8e66-d23281ed0e28.jpg\"]','2022-05-16 17:53:07.904000','Alpha Bounce ',450000,550000,'alpha-bounce',1,0,0,8),('u2aJZe',NULL,'<p><span style=\"color: rgb(137, 137, 137); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 15px; text-align: center;\">- Chất lượng Rep 1:1&nbsp;</span><br style=\"color: rgb(137, 137, 137); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 15px; text-align: center;\"><span style=\"color: rgb(137, 137, 137); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 15px; text-align: center;\">- Đi lùi&nbsp;1 size so với tiêu chuẩn</span><br style=\"color: rgb(137, 137, 137); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 15px; text-align: center;\"><span style=\"color: rgb(137, 137, 137); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 15px; text-align: center;\">- Vận chuyển toàn quốc&nbsp;[ Kiểm Tra Hàng Trước Khi Thanh Toán ]&nbsp;</span><br style=\"color: rgb(137, 137, 137); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 15px; text-align: center;\"><span style=\"color: rgb(137, 137, 137); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 15px; text-align: center;\">- 100% Ảnh chụp trực tiếp tại Tu Shoes&nbsp;</span><br style=\"color: rgb(137, 137, 137); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 15px; text-align: center;\"><span style=\"color: rgb(137, 137, 137); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 15px; text-align: center;\">- Bảo Hành Trọn Đời Sản Phẩm&nbsp;</span><br style=\"color: rgb(137, 137, 137); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 15px; text-align: center;\"><span style=\"color: rgb(137, 137, 137); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 15px; text-align: center;\">- Đổi Trả 7 Ngày Không Kể Lí Do&nbsp;</span><br></p>',NULL,'[\"/media/static/ca9fdf39-29c2-480f-849c-4219fad81678.jpg\", \"/media/static/df449dba-bff7-4d23-9192-77eee24c3689.jpg\"]','2022-05-16 17:53:56.514000','NIKE JORDAN NEW',650000,1750000,'nike-jordan-new',1,0,1,4),('UxsKho',NULL,'<div dir=\"auto\" style=\"font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px; white-space: pre-wrap;\"><span class=\"pq6dq46d tbxw36s4 knj5qynh kvgmc6g5 ditlmg2l oygrvhab nvdbi5me sf5mxxl7 gl3lb2sf hhz5lgdu\" style=\"margin: 0px 1px; height: 16px; width: 16px; display: inline-flex; vertical-align: middle; font-family: inherit;\"><img height=\"16\" width=\"16\" alt=\"?\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/ta9/1.5/16/1f525.png\" style=\"border: 0px; display: block; max-width: 100%; height: auto;\"></span>Balen Speed đen rep+ <span class=\"pq6dq46d tbxw36s4 knj5qynh kvgmc6g5 ditlmg2l oygrvhab nvdbi5me sf5mxxl7 gl3lb2sf hhz5lgdu\" style=\"margin: 0px 1px; height: 16px; width: 16px; display: inline-flex; vertical-align: middle; font-family: inherit;\"><img height=\"16\" width=\"16\" alt=\"?\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/ta9/1.5/16/1f525.png\" style=\"border: 0px; display: block; max-width: 100%; height: auto;\"></span></div><div dir=\"auto\" style=\"font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px; white-space: pre-wrap;\"><span style=\"font-family: inherit;\"><a class=\"oajrlxb2 g5ia77u1 qu0x051f esr5mh6w e9989ue4 r7d6kgcz rq0escxv nhd2j8a9 nc684nl6 p7hjln8o kvgmc6g5 cxmmr5t8 oygrvhab hcukyx3x jb3vyjys rz4wbd8a qt6c0cv9 a8nywdso i1ao9s8h esuyzwwr f1sip0of lzcic4wl gpro0wi8 q66pz984 b1v8xokw\" href=\"https://www.facebook.com/hashtag/gi%C3%A1_ch%E1%BB%89_510k?__eep__=6&amp;__cft__[0]=AZUOFUkcasL5EbFzvNjceuOpIvhc_mHsfHOzx-tIVRP-cYubffO4FYz1qOjcLzuScD_WUMPo1SXxjqtJXpV26w5kvqr7QdEJEyZT78zntEVv3p5CEchtPpsPYtmMFinBmX_j1FK-mKPJ62rCU4yaBzhh&amp;__tn__=*NK-R\" role=\"link\" tabindex=\"0\" style=\"color: var(--accent); transition: all 0.3s ease 0s; cursor: pointer; list-style: none; border-width: 0px; border-style: initial; border-color: initial; padding: 0px; margin: 0px; touch-action: manipulation; text-align: inherit; display: inline; -webkit-tap-highlight-color: transparent; font-family: inherit;\">#Giá_chỉ_510k</a></span></div><div dir=\"auto\" style=\"font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px; white-space: pre-wrap;\"><span class=\"pq6dq46d tbxw36s4 knj5qynh kvgmc6g5 ditlmg2l oygrvhab nvdbi5me sf5mxxl7 gl3lb2sf hhz5lgdu\" style=\"margin: 0px 1px; height: 16px; width: 16px; display: inline-flex; vertical-align: middle; font-family: inherit;\"><img height=\"16\" width=\"16\" alt=\"?\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/taa/1.5/16/1f449.png\" style=\"border: 0px; display: block; max-width: 100%; height: auto;\"></span> giày siêu nhẹ, chất vải mềm co giãn tốt đi bao êm </div><div dir=\"auto\" style=\"font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px; white-space: pre-wrap;\"><span class=\"pq6dq46d tbxw36s4 knj5qynh kvgmc6g5 ditlmg2l oygrvhab nvdbi5me sf5mxxl7 gl3lb2sf hhz5lgdu\" style=\"margin: 0px 1px; height: 16px; width: 16px; display: inline-flex; vertical-align: middle; font-family: inherit;\"><img height=\"16\" width=\"16\" alt=\"?\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/taa/1.5/16/1f449.png\" style=\"border: 0px; display: block; max-width: 100%; height: auto;\"></span> Full size 36.37.38.39.40.41.42.43</div><div dir=\"auto\" style=\"font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px; white-space: pre-wrap;\"><span class=\"pq6dq46d tbxw36s4 knj5qynh kvgmc6g5 ditlmg2l oygrvhab nvdbi5me sf5mxxl7 gl3lb2sf hhz5lgdu\" style=\"margin: 0px 1px; height: 16px; width: 16px; display: inline-flex; vertical-align: middle; font-family: inherit;\"><img height=\"16\" width=\"16\" alt=\"?\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/t39/1.5/16/1f31f.png\" style=\"border: 0px; display: block; max-width: 100%; height: auto;\"></span> Free ship toàn quốc</div>',NULL,'[\"/media/static/129ad9d1-cb21-4219-9d17-b19e9b68fd7a.jpg\", \"/media/static/87a3983c-9a92-4ec4-978e-e4f334718cb9.jpg\"]','2022-05-16 17:54:22.346000','BALENCIAGA SPEED ',450000,510000,'balenciaga-speed',1,0,0,5),('yYdwl4',NULL,'<div dir=\"auto\" style=\"font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px; white-space: pre-wrap;\"><span class=\"pq6dq46d tbxw36s4 knj5qynh kvgmc6g5 ditlmg2l oygrvhab nvdbi5me sf5mxxl7 gl3lb2sf hhz5lgdu\" style=\"margin: 0px 1px; height: 16px; width: 16px; display: inline-flex; vertical-align: middle; font-family: inherit;\"><img height=\"16\" width=\"16\" alt=\"?\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/te5/1.5/16/1f389.png\" style=\"border: 0px;\"></span>﻿Ultraboost 6.0 màu hồng<span class=\"pq6dq46d tbxw36s4 knj5qynh kvgmc6g5 ditlmg2l oygrvhab nvdbi5me sf5mxxl7 gl3lb2sf hhz5lgdu\" style=\"margin: 0px 1px; height: 16px; width: 16px; display: inline-flex; vertical-align: middle; font-family: inherit;\"><img height=\"16\" width=\"16\" alt=\"?\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/te5/1.5/16/1f389.png\" style=\"border: 0px;\"></span></div><div dir=\"auto\" style=\"font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px; white-space: pre-wrap;\"><span style=\"font-family: inherit;\"><a class=\"oajrlxb2 g5ia77u1 qu0x051f esr5mh6w e9989ue4 r7d6kgcz rq0escxv nhd2j8a9 nc684nl6 p7hjln8o kvgmc6g5 cxmmr5t8 oygrvhab hcukyx3x jb3vyjys rz4wbd8a qt6c0cv9 a8nywdso i1ao9s8h esuyzwwr f1sip0of lzcic4wl gpro0wi8 q66pz984 b1v8xokw\" href=\"https://www.facebook.com/hashtag/gi%C3%A1_ch%E1%BB%89_570k?__eep__=6&amp;__cft__[0]=AZVLgGO33wSaBu1rXtUIYtkEiYXEOwdzYCDBS8LbRXuarBs2Z0MYlJjA-6exrmDrcRTId7xul_xA9yKTKu-oROcZb1B84ve3tA40VIFeAw98eY5yWu1uRmTNBH7bXH0gFMXyQF_36m-VPobnM0QGFQMm&amp;__tn__=*NK-R\" role=\"link\" tabindex=\"0\" style=\"color: var(--accent); cursor: pointer; list-style: none; border-width: 0px; border-style: initial; border-color: initial; padding: 0px; margin: 0px; touch-action: manipulation; text-align: inherit; display: inline; -webkit-tap-highlight-color: transparent; font-family: inherit;\">#Giá_chỉ_570k</a></span></div><div dir=\"auto\" style=\"font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px; white-space: pre-wrap;\"><span class=\"pq6dq46d tbxw36s4 knj5qynh kvgmc6g5 ditlmg2l oygrvhab nvdbi5me sf5mxxl7 gl3lb2sf hhz5lgdu\" style=\"margin: 0px 1px; height: 16px; width: 16px; display: inline-flex; vertical-align: middle; font-family: inherit;\"><img height=\"16\" width=\"16\" alt=\"?\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/taa/1.5/16/1f449.png\" style=\"border: 0px;\"></span>Bost êm nhẹ, chất vải co giãn thám hút mồ hôi tốt, fom gọn </div><div dir=\"auto\" style=\"font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px; white-space: pre-wrap;\"><span class=\"pq6dq46d tbxw36s4 knj5qynh kvgmc6g5 ditlmg2l oygrvhab nvdbi5me sf5mxxl7 gl3lb2sf hhz5lgdu\" style=\"margin: 0px 1px; height: 16px; width: 16px; display: inline-flex; vertical-align: middle; font-family: inherit;\"><img height=\"16\" width=\"16\" alt=\"?\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/taa/1.5/16/1f449.png\" style=\"border: 0px;\"></span>Full hộp, tem tag phụ kiện đầy đủ.</div><div dir=\"auto\" style=\"font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px; white-space: pre-wrap;\"><span class=\"pq6dq46d tbxw36s4 knj5qynh kvgmc6g5 ditlmg2l oygrvhab nvdbi5me sf5mxxl7 gl3lb2sf hhz5lgdu\" style=\"margin: 0px 1px; height: 16px; width: 16px; display: inline-flex; vertical-align: middle; font-family: inherit;\"><img height=\"16\" width=\"16\" alt=\"?\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/taa/1.5/16/1f449.png\" style=\"border: 0px;\"></span>Size 36.37.38.39</div><div dir=\"auto\" style=\"font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px; white-space: pre-wrap;\"><span class=\"pq6dq46d tbxw36s4 knj5qynh kvgmc6g5 ditlmg2l oygrvhab nvdbi5me sf5mxxl7 gl3lb2sf hhz5lgdu\" style=\"margin: 0px 1px; height: 16px; width: 16px; display: inline-flex; vertical-align: middle; font-family: inherit;\"><img height=\"16\" width=\"16\" alt=\"?\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/t39/1.5/16/1f31f.png\" style=\"border: 0px;\"></span> Free ship toàn quốc</div>',NULL,'[\"/media/static/88eeed93-10c1-4b91-ac50-b8fd823462ce.jpg\"]','2022-05-16 17:55:10.336000','Ultraboost 6.0 Trấng',550000,670000,'ultraboost-6-0-trang',1,0,0,8);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) NOT NULL,
  KEY `FKkud35ls1d40wpjb5htpp14q4e` (`category_id`),
  KEY `FK2k3smhbruedlcrvu6clued06x` (`product_id`),
  CONSTRAINT `FK2k3smhbruedlcrvu6clued06x` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKkud35ls1d40wpjb5htpp14q4e` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES ('22U2Iv',1),('22U2Iv',2),('bfPcPf',1),('bfPcPf',2),('Eq1H5L',1),('Eq1H5L',2),('pwL619',1),('u2aJZe',1),('u2aJZe',2),('UxsKho',1),('UxsKho',2),('yYdwl4',1),('yYdwl4',2);
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_size`
--

DROP TABLE IF EXISTS `product_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_size` (
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`,`size`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_size`
--

LOCK TABLES `product_size` WRITE;
/*!40000 ALTER TABLE `product_size` DISABLE KEYS */;
INSERT INTO `product_size` VALUES ('22U2Iv',37,4),('22U2Iv',39,4),('22U2Iv',42,4),('bfPcPf',35,100),('bfPcPf',36,100),('bfPcPf',40,99),('bfPcPf',41,99),('bfPcPf',42,100),('Eq1H5L',35,998),('Eq1H5L',36,999),('Eq1H5L',38,998),('Eq1H5L',39,3),('Eq1H5L',40,15),('Eq1H5L',41,996),('Eq1H5L',42,998),('pwL619',35,14),('pwL619',37,14),('pwL619',39,11),('pwL619',40,19),('pwL619',41,19),('pwL619',42,19),('u2aJZe',35,999),('u2aJZe',36,999),('u2aJZe',37,999),('u2aJZe',38,999),('u2aJZe',39,999),('u2aJZe',40,999),('u2aJZe',41,999),('u2aJZe',42,999),('UxsKho',35,100),('UxsKho',36,100),('UxsKho',38,100),('UxsKho',40,100),('UxsKho',41,100),('UxsKho',42,99),('yYdwl4',36,50),('yYdwl4',39,50),('yYdwl4',41,50),('yYdwl4',42,50);
/*!40000 ALTER TABLE `product_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `discount_type` int(11) DEFAULT NULL,
  `discount_value` bigint(20) DEFAULT NULL,
  `expired_at` datetime(6) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT NULL,
  `maximum_discount_value` bigint(20) DEFAULT NULL,
  `name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_acld676f1gyc04nofpb7t2ecn` (`coupon_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
INSERT INTO `promotion` VALUES (1,'KH123','2021-08-22 13:57:01.646000',2,300000,'2022-07-20 00:00:00.000000',1,0,0,'2/9'),(3,'KH321','2022-05-07 16:42:08.156000',1,15,'2022-05-20 00:00:00.000000',1,1,120000,'2/9');
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statistic`
--

DROP TABLE IF EXISTS `statistic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statistic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `profit` bigint(20) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `sales` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKok7jp7mh6y9tghumc2do51ieq` (`order_id`),
  CONSTRAINT `FKok7jp7mh6y9tghumc2do51ieq` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statistic`
--

LOCK TABLES `statistic` WRITE;
/*!40000 ALTER TABLE `statistic` DISABLE KEYS */;
INSERT INTO `statistic` VALUES (1,'2021-08-22 14:16:48.648000',1650000,1,1300000,15),(2,'2022-05-02 18:10:35.605000',950000,1,1600000,13),(3,'2022-05-02 18:32:53.245000',-200000,2,900000,24),(4,'2022-05-02 18:33:25.452000',-130000,1,620000,15),(5,'2022-05-02 18:40:41.385000',300000,3,1650000,23),(6,'2022-05-02 18:41:43.918000',0,1,450000,21),(7,'2022-05-02 18:43:48.985000',300000,3,1650000,22),(9,'2022-05-04 18:20:21.598000',-240000,1,510000,25);
/*!40000 ALTER TABLE `statistic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_at` datetime(6) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roles` json NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,NULL,'2021-08-22 13:43:08.676000','admin@gmail.com','admin',NULL,'$2a$12$qaa/tacaxDcyOcZQhfbU7.h4.z8sOr/9eNXOm80JmrsdqEsstqDOi','0969708715','[\"ADMIN\"]',1),(2,'Hà Nội',NULL,'2021-08-22 13:44:11.392000','user@gmail.com','user',NULL,'$2a$12$q/jtiM.wJgv/iQy.lu2zfOnm1so/PximndklBZ8r4UIdmcv6zOyta','0969708715','[\"USER\"]',1),(3,NULL,NULL,'2021-08-22 14:13:47.852000','thaotrang@gmail.com','Thảo Trang',NULL,'$2a$12$xAgcACYzUTMsT2q4v93MUeHTWI1DN13i9.tN6kpK.CiazKhsRsb0y','0378246453','[\"USER\"]',1),(4,NULL,NULL,'2021-08-22 14:14:40.837000','phuong@gmail.com','Phương',NULL,'$2a$12$.bH4k6xySdmmPDJYkXbQjOKqig4VpCl08uHY11WQRe/fIkno83cXm','0378246453','[\"USER\"]',1),(5,NULL,NULL,'2021-08-22 14:15:37.844000','linh@gmail.com','Linh',NULL,'$2a$12$mtLAES4vlQ5vXFpLtADAI.aqvVjzNMeCuc8cRnr8FbWxY1vmJZDyy','0378246453','[\"USER\"]',1),(6,NULL,NULL,'2022-03-23 16:40:07.015000','minh@gmail.com','ngo duc minh',NULL,'$2a$12$yG1WwAND3MqZ8SWDzPkCK.tAaYxb3o3ol0TLQZFrIf5L/DdgAuL7u','0342621879','[\"USER\"]',1),(7,NULL,NULL,'2022-04-02 17:53:09.250000','minhnd@gmail.com','ngo duc minh',NULL,'$2a$12$UoKx9YKNmFMZ6V/RgN99t.l5Ga4KTdY6qiyhayg8mCXXL745gwdR2','0342621879','[\"USER\"]',1),(8,NULL,NULL,'2022-05-04 02:01:23.902000','tien12345@gmail.com','Lê Xuân Tiến ',NULL,'$2a$12$KEvVW5zQXnzh.sGugX400OWF/CF2NRridyZEfVAiRVYIqbeGyoq6W','0894378763','[\"USER\"]',1);
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

-- Dump completed on 2022-05-17  1:26:00
