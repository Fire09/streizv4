CREATE TABLE IF NOT EXISTS `cerberus_center` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `offices_business_id` varchar(255) NOT NULL,
  `offices_business_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;