-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: moffatbay
-- ------------------------------------------------------
-- Server version	8.0.45

DROP DATABASE IF EXISTS moffatbay;
CREATE DATABASE moffatbay
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_0900_ai_ci;

USE moffatbay;

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
-- Table structure for table `amenity`
--

DROP TABLE IF EXISTS `amenity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amenity` (
  `amenity_id` int NOT NULL AUTO_INCREMENT,
  `amenity_name` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`amenity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenity`
--

LOCK TABLES `amenity` WRITE;
/*!40000 ALTER TABLE `amenity` DISABLE KEYS */;
INSERT INTO `amenity` VALUES (1,'Wi-Fi','Free wireless internet','Technology'),(2,'Television','Flat-screen television','Entertainment'),(3,'Air Conditioning','Room temperature control','Comfort');
/*!40000 ALTER TABLE `amenity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attraction`
--

DROP TABLE IF EXISTS `attraction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attraction` (
  `attraction_id` int NOT NULL AUTO_INCREMENT,
  `attraction_name` varchar(100) DEFAULT NULL,
  `description` text,
  `location` varchar(150) DEFAULT NULL,
  `attraction_type` varchar(50) DEFAULT NULL,
  `website_url` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `distance_from_lodge` decimal(5,2) DEFAULT NULL,
  `lodge_id` int DEFAULT NULL,
  PRIMARY KEY (`attraction_id`),
  KEY `fk_attraction_lodge` (`lodge_id`),
  CONSTRAINT `fk_attraction_lodge` FOREIGN KEY (`lodge_id`) REFERENCES `lodge_info` (`lodge_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attraction`
--

LOCK TABLES `attraction` WRITE;
/*!40000 ALTER TABLE `attraction` DISABLE KEYS */;
INSERT INTO `attraction` VALUES (1,'Kayaking Adventure','Enjoy kayaking around the bay','Moffat Bay','Water Activity',NULL,NULL,1.50,1),(2,'Nature Hiking Trail','Explore scenic hiking trails','Nearby Forest','Outdoor Activity',NULL,NULL,3.20,1),(3,'Whale Watching','Enjoy a guided whale watching trip','San Juan Islands','Wildlife Activity',NULL,NULL,5.00,1);
/*!40000 ALTER TABLE `attraction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL UNIQUE,
  `phone_number` varchar(25) NOT NULL,
  `password_hash` varchar(250) NOT NULL,
  `registration_date` datetime DEFAULT NULL,
  `last_login_date` datetime DEFAULT NULL,
  `account_status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'John','Smith','john@example.com','4025551234','sample_hash_1','2026-11-01 10:00:00',NULL,'Active'),(2,'Mary','Johnson','mary@example.com','4025555678','sample_hash_2','2026-11-02 11:30:00',NULL,'Active'),(3,'David','Brown','david@example.com','4025559012','sample_hash_3','2026-11-03 09:15:00',NULL,'Active');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address`
--

DROP TABLE IF EXISTS `customer_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `street_address` varchar(150) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip_code` varchar(15) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `fk_customer_address` (`customer_id`),
  CONSTRAINT `fk_customer_address` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address`
--

LOCK TABLES `customer_address` WRITE;
/*!40000 ALTER TABLE `customer_address` DISABLE KEYS */;
INSERT INTO `customer_address` VALUES (1,1,'123 Main Street','Omaha','NE','68102','USA'),(2,2,'456 Oak Avenue','Lincoln','NE','68508','USA'),(3,3,'789 Pine Road','Bellevue','NE','68005','USA');
/*!40000 ALTER TABLE `customer_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lodge_image`
--

DROP TABLE IF EXISTS `lodge_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lodge_image` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `lodge_id` int DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `image_title` varchar(100) DEFAULT NULL,
  `image_description` varchar(255) DEFAULT NULL,
  `display_order` int DEFAULT NULL,
  `upload_date` datetime DEFAULT NULL,
  `active_flag` tinyint DEFAULT NULL,
  PRIMARY KEY (`image_id`),
  KEY `fk_lodge_image` (`lodge_id`),
  CONSTRAINT `fk_lodge_image` FOREIGN KEY (`lodge_id`) REFERENCES `lodge_info` (`lodge_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lodge_image`
--

LOCK TABLES `lodge_image` WRITE;
/*!40000 ALTER TABLE `lodge_image` DISABLE KEYS */;
INSERT INTO `lodge_image` VALUES (1,1,'images/lodge_exterior.jpg','Lodge Exterior','Front view of Moffat Bay Lodge',1,'2026-11-05 10:00:00',1),(2,1,'images/lodge_lobby.jpg','Lodge Lobby','Main lobby and reception area',2,'2026-11-05 10:00:00',1),(3,1,'images/bay_view.jpg','Bay View','Scenic view of the bay',3,'2026-11-05 10:00:00',1);
/*!40000 ALTER TABLE `lodge_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lodge_info`
--

DROP TABLE IF EXISTS `lodge_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lodge_info` (
  `lodge_id` int NOT NULL AUTO_INCREMENT,
  `lodge_name` varchar(100) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `email_address` varchar(100) NOT NULL UNIQUE,
  `street_address` varchar(150) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(15) DEFAULT NULL,
  `zip_code` varchar(15) DEFAULT NULL,
  `business_hours` varchar(100) DEFAULT NULL,
  `about_description` text,
  PRIMARY KEY (`lodge_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lodge_info`
--

LOCK TABLES `lodge_info` WRITE;
/*!40000 ALTER TABLE `lodge_info` DISABLE KEYS */;
INSERT INTO `lodge_info` VALUES (1,'Moffat Bay Lodge','3605551001','info@moffatbay.example','100 Bay Road','Friday Harbor','WA','98250','8 AM - 10 PM','Waterfront lodge with comfortable rooms');
/*!40000 ALTER TABLE `lodge_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_session`
--

DROP TABLE IF EXISTS `login_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_session` (
  `session_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `logout_time` datetime DEFAULT NULL,
  `session_token` varchar(255) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `session_status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`session_id`),
  KEY `fk_login_customer` (`customer_id`),
  CONSTRAINT `fk_login_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_session`
--

LOCK TABLES `login_session` WRITE;
/*!40000 ALTER TABLE `login_session` DISABLE KEYS */;
INSERT INTO `login_session` VALUES (1,1,'2026-11-01 09:00:00','2026-11-01 10:00:00','test_session_001','192.0.2.1','Closed'),(2,2,'2026-11-02 10:30:00','2026-11-02 11:30:00','test_session_002','192.0.2.2','Closed'),(3,3,'2026-11-03 08:00:00','2026-11-03 09:00:00','test_session_003','192.0.2.3','Closed');
/*!40000 ALTER TABLE `login_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `reservation_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `reservation_date` datetime DEFAULT NULL,
  `check_in_date` date DEFAULT NULL,
  `check_out_date` date DEFAULT NULL,
  `guest_count` int DEFAULT NULL,
  `total_nights` int DEFAULT NULL,
  `total_cost` decimal(10,2) DEFAULT NULL,
  `special_requests` text,
  PRIMARY KEY (`reservation_id`),
  KEY `fk_reservation_customer` (`customer_id`),
  KEY `fk_reservation_room` (`room_id`),
  KEY `fk_reservation_status` (`status_id`),
  CONSTRAINT `fk_reservation_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `fk_reservation_room` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`),
  CONSTRAINT `fk_reservation_status` FOREIGN KEY (`status_id`) REFERENCES `reservation_status` (`status_id`),
  CONSTRAINT `chk_reservation_dates` CHECK ((`check_out_date` > `check_in_date`))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES(1,1,1,2,'2026-11-05 10:00:00','2026-11-10','2026-11-12',2,2,200.00,'Early check-in requested'),(2,2,2,3,'2026-11-05 11:00:00','2026-11-15','2026-11-18',3,3,450.00,'Extra pillows requested'),(3,3,3,5,'2026-11-05 12:00:00','2026-11-20','2026-11-22',2,2,500.00,'Reservation cancelled');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_guest`
--

DROP TABLE IF EXISTS `reservation_guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_guest` (
  `guest_id` int NOT NULL AUTO_INCREMENT,
  `reservation_id` int NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `is_primary_guest` tinyint(1) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL UNIQUE,
  PRIMARY KEY (`guest_id`),
  KEY `fk_guest_reservation` (`reservation_id`),
  CONSTRAINT `fk_guest_reservation` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`reservation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_guest`
--

LOCK TABLES `reservation_guest` WRITE;
/*!40000 ALTER TABLE `reservation_guest` DISABLE KEYS */;
INSERT INTO `reservation_guest` VALUES (1,1,'John','Smith',35,1,'402-555-0101','john@example.com'),(2,2,'Mary','Johnson',30,1,'402-555-0102','mary@example.com'),(3,3,'David','Brown',40,1,'402-555-0103','david@example.com');
/*!40000 ALTER TABLE `reservation_guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_lookup`
--

DROP TABLE IF EXISTS `reservation_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_lookup` (
  `lookup_id` int NOT NULL AUTO_INCREMENT,
  `reservation_id` int NOT NULL,
  `lookup_date` datetime DEFAULT NULL,
  `lookup_method` varchar(45) DEFAULT NULL,
  `lookup_status` varchar(30) DEFAULT NULL,
  `lookup_success` tinyint DEFAULT NULL,
  PRIMARY KEY (`lookup_id`),
  KEY `fk_lookup_reservation` (`reservation_id`),
  CONSTRAINT `fk_lookup_reservation` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`reservation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_lookup`
--

LOCK TABLES `reservation_lookup` WRITE;
/*!40000 ALTER TABLE `reservation_lookup` DISABLE KEYS */;
INSERT INTO `reservation_lookup` VALUES (1,1,'2026-11-05 13:00:00','Reservation ID','Successful',1),(2,2,'2026-11-05 14:00:00','Email','Successful',1),(3,3,'2026-11-05 15:00:00','Reservation ID','Successful',1);
/*!40000 ALTER TABLE `reservation_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_status`
--

DROP TABLE IF EXISTS `reservation_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_status` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `status_name` varchar(30) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_status`
--

LOCK TABLES `reservation_status` WRITE;
/*!40000 ALTER TABLE `reservation_status` DISABLE KEYS */;
INSERT INTO `reservation_status` VALUES(1,'Pending','Reservation awaiting confirmation'),(2,'Confirmed','Reservation has been confirmed'),(3,'Checked In','Guest has checked into the lodge'),(4,'Checked Out','Guest has completed their stay and checked out'),(5,'Cancelled','Reservation has been cancelled'),(6,'No Show','Guest did not arrive for the reservation');
/*!40000 ALTER TABLE `reservation_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `room_id` int NOT NULL AUTO_INCREMENT,
  `room_type_id` int DEFAULT NULL,
  `room_number` varchar(10) DEFAULT NULL UNIQUE,
  `floor_number` int DEFAULT NULL,
  `room_status_id` int DEFAULT NULL,
  `view_type` varchar(50) DEFAULT NULL,
  `notes` text,
  `lodge_id` int DEFAULT NULL,
  PRIMARY KEY (`room_id`),
  KEY `fk_room_type` (`room_type_id`),
  KEY `fk_room_status` (`room_status_id`),
  KEY `fk_room_lodge` (`lodge_id`),
  CONSTRAINT `fk_room_lodge` FOREIGN KEY (`lodge_id`) REFERENCES `lodge_info` (`lodge_id`),
  CONSTRAINT `fk_room_status` FOREIGN KEY (`room_status_id`) REFERENCES `room_status` (`room_status_id`),
  CONSTRAINT `fk_room_type` FOREIGN KEY (`room_type_id`) REFERENCES `room_type` (`room_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES(1,1,'101',1,1,'Garden View','Double Full Beds room with garden view',1),(2,2,'102',1,3,'Bay View','Queen room reserved for upcoming guest',1),(3,4,'201',2,4,'Ocean View','King room temporarily under maintenance',1);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_amenity`
--

DROP TABLE IF EXISTS `room_amenity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_amenity` (
  `room_id` int NOT NULL,
  `amenity_id` int NOT NULL,
  PRIMARY KEY (`room_id`,`amenity_id`),
  KEY `fk_room_amenity_amenity` (`amenity_id`),
  CONSTRAINT `fk_room_amenity_amenity` FOREIGN KEY (`amenity_id`) REFERENCES `amenity` (`amenity_id`),
  CONSTRAINT `fk_room_amenity_room` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_amenity`
--

LOCK TABLES `room_amenity` WRITE;
/*!40000 ALTER TABLE `room_amenity` DISABLE KEYS */;
INSERT INTO `room_amenity` VALUES (1,1),(1,2),(2,3);
/*!40000 ALTER TABLE `room_amenity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_status`
--

DROP TABLE IF EXISTS `room_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_status` (
  `room_status_id` int NOT NULL AUTO_INCREMENT,
  `status_name` varchar(45) DEFAULT NULL,
  `status_description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`room_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_status`
--

LOCK TABLES `room_status` WRITE;
/*!40000 ALTER TABLE `room_status` DISABLE KEYS */;
INSERT INTO `room_status` VALUES(1,'Available','Room is available for booking'),(2,'Occupied','Room is currently occupied by guests'),(3,'Reserved','Room is reserved for an upcoming stay'),(4,'Maintenance','Room is unavailable due to maintenance'),(5,'Cleaning','Room is being cleaned and prepared for guests');
/*!40000 ALTER TABLE `room_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_type`
--

DROP TABLE IF EXISTS `room_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_type` (
  `room_type_id` int NOT NULL AUTO_INCREMENT,
  `room_type_name` varchar(50) DEFAULT NULL,
  `description` text,
  `price_per_night` decimal(8,2) DEFAULT NULL,
  `max_guests` int DEFAULT NULL,
  `bed_count` int DEFAULT NULL,
  PRIMARY KEY (`room_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_type`
--

LOCK TABLES `room_type` WRITE;
/*!40000 ALTER TABLE `room_type` DISABLE KEYS */;
INSERT INTO `room_type` VALUES
(1,'Double Full Beds','Two Full Beds',120.00,4,2),(2,'Queen','One Queen Bed',135.00,2,1),(3,'Double Queen Beds','Two Queen Beds',150.00,4,2),(4,'King','One King Bed',160.00,2,1);
/*!40000 ALTER TABLE `room_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;