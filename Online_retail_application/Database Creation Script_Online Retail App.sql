DROP DATABASE IF EXISTS `online_retail_app`;
CREATE DATABASE `online_retail_app`; 
USE `online_retail_app`;

-- Tables to be created
-- 1 customers
-- 2 addresses
-- 3 product_category
-- 4 products
-- 5 order_status
-- 6 orders
-- 7 order_items
-- 8 payments

-- Table structure for table `customers`
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
);

-- Dumping data for table `customers`
INSERT INTO `customers` VALUES (1,'Jennilee','Andriveau','jandriveau0@google.cn','632 549 8932'),
(2,'Abby','Beiderbecke','abeiderbecke1@yellowpages.com','531 556 6030'),
(3,'Matti','Shepherd','mshepherd2@tumblr.com','193 855 0624'),
(4,'Nickolas','Warbey','nwarbey3@cpanel.net','469 476 9342'),
(5,'Cosetta','Wickersham','cwickersham4@theatlantic.com','590 520 3823'),
(6,'Jade','Riccardo','jriccardo5@salon.com','149 700 8841'),
(7,'Suzanne','Blakeley','sblakeley6@angelfire.com','631 534 7688'),
(8,'Sanderson','Shrieve','sshrieve7@gnu.org','189 551 9116'),
(9,'Lotti','Walas','lwalas8@homestead.com','355 959 7069'),(10,'Greg','Motto','gmotto9@virginia.edu','903 229 0965'),
(11,'Jefferson','Reichartz','jreichartza@soundcloud.com','583 124 5140'),
(12,'Agatha','Egginson','aegginsonb@state.gov','529 117 3433'),
(13,'Mariel','Fairnington','mfairningtonc@wikia.com','285 747 5020'),
(14,'Isabel','Sandwith','isandwithd@163.com','873 985 2808'),
(15,'Alissa','Ickovic','aickovice@tuttocitta.it','490 545 2066'),
(16,'Alwyn','Gimbart','agimbartf@dot.gov','472 154 2491'),
(17,'Gloriana','Mizen','gmizeng@instagram.com','954 388 0929'),
(18,'Breena','Cruise','bcruiseh@ow.ly','136 869 8123'),
(19,'Dar','Hellens','dhellensi@github.io','636 487 0254'),
(20,'Elinor','Ugolini','eugolinij@youtu.be','477 874 8492');

-- Table structure for table `addresses`
CREATE TABLE `addresses` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `address_line1` varchar(100) DEFAULT NULL,
  `address_line2` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
);

-- Dumping data for table `addresses`
INSERT INTO `addresses` VALUES (1,1,'8 Northport Avenue','Apt 1869','Miami','Florida','33111','United States'),
(2,2,'55409 Oak Way','Apt 1596','Birmingham','Alabama','35225','United States'),
(3,3,'887 Oak Valley Hill','Room 315','Marietta','Georgia','30061','United States'),
(4,4,'669 Heath Avenue','Room 443','Rochester','New York','14652','United States'),
(5,5,'16621 Armistice Street','PO Box 11654','Wilkes Barre','Pennsylvania','18763','United States'),
(6,6,'88 Dovetail Place','PO Box 96084','Las Vegas','Nevada','89130','United States'),
(7,7,'6 Gulseth Avenue','3rd Floor','Bakersfield','California','93399','United States'),
(8,8,'185 Main Terrace','Room 1043','Waco','Texas','76796','United States'),
(9,9,'48156 Cascade Terrace','Apt 1991','Dallas','Texas','75210','United States'),
(10,10,'930 Straubel Lane','PO Box 70703','Atlanta','Georgia','30316','United States'),
(11,11,'01335 Melvin Point','Room 1260','Davenport','Iowa','52804','United States'),
(12,12,'6215 Service Place','Room 964','Charleston','West Virginia','25313','United States'),
(13,13,'5606 Brown Circle','Room 1747','Sacramento','California','94286','United States'),
(14,14,'0 Oakridge Hill','Room 724','Richmond','Virginia','23220','United States'),
(15,15,'1 Crownhardt Parkway','Suite 17','Columbus','Ohio','43210','United States'),
(16,16,'321 Shopko Avenue','15th Floor','Austin','Texas','78726','United States'),
(17,17,'1009 Glendale Place','17th Floor','Little Rock','Arkansas','72209','United States'),
(18,18,'22 Scoville Terrace','Room 1600','North Little Rock','Arkansas','72199','United States'),
(19,19,'33211 Heffernan Terrace','PO Box 32268','Tacoma','Washington','98481','United States'),
(20,20,'93293 Del Sol Alley','Room 1860','Charleston','West Virginia','25362','United States'),
(21,1,'52901 Menomonie Trail','Suite 38','Corpus Christi','Texas','78470','United States'),
(22,2,'34803 Charing Cross Alley','Room 520','Dallas','Texas','75226','United States'),
(23,3,'3199 Victoria Road','Room 280','Washington','District of Columbia','20580','United States'),
(24,4,'69939 Reinke Place','PO Box 37106','Philadelphia','Pennsylvania','19160','United States'),
(25,5,'5 Westerfield Point','Suite 36','Akron','Ohio','44321','United States');

-- Table structure for table `product_category`
CREATE TABLE `product_category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(70) DEFAULT NULL,
  `parent_category_id` int DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  FOREIGN KEY(parent_category_id) REFERENCES product_category(category_id)
);

-- Dumping data for table `product_category`
INSERT INTO `product_category` VALUES 
(1,'Skin Care',NULL),
(2,'Body Care',NULL),
(3,'Hair Care',NULL),
(4,'Face Care',1),
(5,'Eye Care',1),
(6,'Lip Care',1),
(7,'Body Lotions & Creams',2),
(8,'Body Oils',2),
(9,'Hand & Foot Care',2),
(10,'Shampoos',3),
(11,'Conditioners',3),
(12,'Hair Oils',3),
(13,'Moisturizers',4),
(14,'Toners',4),
(15,'Serums',4),
(16,'Eye Creams',5),
(17,'Lip Balms',6),
(18,'Lip Scrubs',6),
(19,'Hand Creams',9),
(20,'Foot Creams',9);

-- Table structure for table `products`
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `quantity_in_stock` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`category_id`)
);

-- Dumping data for table `products`
INSERT INTO `products` VALUES (1,13,'LIght Moisturising Face cream',50,100),
(2,13,'Deep Moisturising Face cream',90,150),
(3,14,'Tea Tree Facial Toner',40,80),
(4,14,'Rose Water Toner',30,120),
(5,15,'Beautifying Serum',90,75),
(6,15,'Rose Glow Serum',100,100),
(7,16,'Under Eye Cream',20,200),
(8,16,'Under Eye Mask',25,180),
(9,17,'Beetroot Lip Balm',5,300),
(10,17,'Chocolate Lip Balm',5,280),
(11,18,'Strawberry Lip Scrub',8,250),
(12,18,'Mint Lip Scrub',8,260),
(13,19,'Jasmine Hand Cream',15,150),
(14,20,'Vanilla Foot Cream',20,120),
(15,7,'Almond Milk Body Lotion',30,200),
(16,7,'Unscented Body Lotion',30,180),
(17,10,'Rice Water Shampoo',25,220),
(18,11,'Soy Milk Conditioner',28,210),
(19,12,'Hair Growth Oil',50,100),
(20,12,'Anti Dandruff Oil',45,110);

-- Table structure for table `order_status`
CREATE TABLE `order_status` (
  `order_status_id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`order_status_id`)
);

-- Dumping data for table `order_status`
INSERT INTO `order_status` VALUES 
(1,'Confirmed'),
(2,'Processing'),
(3,'Shipped'),
(4,'Out for Delivery'),
(5,'Delivered'),
(6,'Cancelled'),
(7,'Returned');

-- Table structure for table `orders`
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `order_status_id` int DEFAULT NULL,
  `shipping_address_id` int DEFAULT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `shipping_address_id` (`shipping_address_id`),
  KEY `order_status_id` (`order_status_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`shipping_address_id`) REFERENCES `addresses` (`address_id`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`order_status_id`) REFERENCES `order_status` (`order_status_id`)
);

-- Dumping data for table `orders`
INSERT INTO `orders` VALUES 
(1,1,1,1,'2023-11-20 08:00:00','2023-11-28 03:40:35'),
(2,2,7,2,'2023-06-17 07:00:00','2023-11-04 07:00:00'),
(3,3,2,3,'2023-11-22 08:00:00','2023-11-28 03:44:41'),
(4,4,6,4,'2023-10-01 07:00:00','2023-11-28 04:03:49'),
(5,5,1,5,'2023-11-20 08:00:00','2023-11-28 03:40:35'),
(6,6,6,6,'2023-10-01 07:00:00','2023-11-28 04:03:49'),
(7,7,4,7,'2023-11-01 07:00:00','2023-11-28 03:56:08'),
(8,8,5,8,'2023-10-30 07:00:00','2023-11-28 04:00:11'),
(9,9,3,9,'2023-09-18 07:00:00','2023-09-25 07:00:00'),
(10,10,5,10,'2023-11-18 03:54:06','2023-11-28 03:58:21'),
(11,11,5,11,'2023-11-18 03:54:06','2023-11-28 03:58:21'),
(12,12,5,12,'2023-11-18 03:54:06','2023-11-28 03:58:21'),
(13,13,1,13,'2023-11-20 08:00:00','2023-11-28 03:40:35'),
(14,14,5,14,'2023-10-27 07:00:00','2023-11-28 04:00:41'),
(15,15,5,15,'2023-11-18 03:54:06','2023-11-28 03:58:21'),
(16,16,5,16,'2023-11-18 03:54:06','2023-11-28 03:58:21'),
(17,17,5,17,'2023-11-01 07:00:00','2023-11-28 04:01:58'),
(18,18,1,18,'2023-11-20 08:00:00','2023-11-28 03:40:35'),
(19,19,5,19,'2023-11-01 07:00:00','2023-11-28 04:01:58'),
(20,20,3,20,'2023-03-01 08:00:00','2023-03-08 08:00:00'),
(21,1,3,21,'2023-11-20 08:00:00','2023-11-27 08:00:00'),
(22,2,5,21,'2023-11-20 08:00:00','2023-11-28 03:58:21');

-- Table structure for table `order_items`
CREATE TABLE `order_items` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
);

-- Dumping data for table `order_items`
INSERT INTO `order_items` VALUES 
(1,1,12,2,13),
(2,2,8,2,25),
(3,3,11,1,13),
(4,4,12,4,13),
(5,5,13,4,15),
(6,6,15,3,30),
(7,7,6,4,105),
(8,8,8,3,25),
(9,9,5,5,90),
(10,10,2,3,90),
(11,11,11,1,8),
(12,12,12,1,13),
(13,13,5,2,90),
(14,14,11,2,8),
(15,15,11,5,6),
(16,16,14,4,20),
(17,17,10,4,5),
(18,18,14,5,20),
(19,19,18,4,28),
(20,20,16,1,28),
(21,1,1,1,55),
(22,2,3,2,40),
(23,3,5,2,95),
(24,4,7,2,25),
(25,5,9,1,5);

-- Table structure for table `payments`
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
);

-- Dumping data for table `payments`
INSERT INTO `payments` VALUES 
(1,1,'Credit Card','Completed','2023-11-20 08:00:00','2023-11-20 08:00:00'),
(2,2,'Debit Card','Refunded','2023-06-17 07:00:00','2023-06-22 07:00:00'),
(3,3,'Debit Card','Completed','2023-11-22 08:00:00','2023-11-22 08:00:00'),
(4,4,'Credit Card','Refunded','2023-10-01 07:00:00','2023-10-20 07:00:00'),
(5,5,'Debit Card','Completed','2023-11-20 08:00:00','2023-11-20 08:00:00'),
(6,6,'Debit Card','Refunded','2023-10-01 07:00:00','2023-10-07 21:34:17'),
(7,7,'Credit Card','Refunded','2023-11-01 07:00:00','2023-11-01 07:00:00'),
(8,8,'Debit Card','Completed','2023-10-30 07:00:00','2023-10-30 07:00:00'),
(9,9,'Debit Card','Completed','2023-09-18 07:00:00','2023-09-18 07:00:00'),
(10,10,'Credit Card','Completed','2023-11-18 03:54:06','2023-11-18 03:54:06'),
(11,11,'Debit Card','Completed','2023-11-18 03:54:06','2023-11-18 03:54:06'),
(12,12,'Debit Card','Completed','2023-11-18 03:54:06','2023-11-18 03:54:06'),
(13,13,'Credit Card','Completed','2023-11-20 08:00:00','2023-11-20 08:00:00'),
(14,14,'Debit Card','Completed','2023-10-27 07:00:00','2023-10-27 07:00:00'),
(15,15,'Debit Card','Completed','2023-11-18 03:54:06','2023-11-18 03:54:06'),
(16,16,'Credit Card','Completed','2023-11-18 03:54:06','2023-11-18 03:54:06'),
(17,17,'Debit Card','Completed','2023-11-01 07:00:00','2023-11-01 07:00:00'),
(18,18,'Debit Card','Completed','2023-11-20 08:00:00','2023-11-20 08:00:00'),
(19,19,'Credit Card','Completed','2023-11-01 07:00:00','2023-11-01 07:00:00'),
(20,20,'Debit Card','Completed','2023-03-01 08:00:00','2023-03-01 08:00:00'),
(21,21,'Debit Card','Completed','2023-11-20 08:00:00','2023-11-20 08:00:00'),
(22,22,'Credit Card','Completed','2023-11-20 08:00:00','2023-11-20 08:00:00');
