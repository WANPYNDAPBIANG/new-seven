/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-12.3.2-MariaDB, for Win64 (AMD64)
--
-- Host: serverless-europe-west9.sysp0000.db2.skysql.com    Database: seven_sisters_travel
-- ------------------------------------------------------
-- Server version	11.8.6-MariaDB-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `activity_logs`
--

DROP TABLE IF EXISTS `activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `action_type` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `metadata` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_logs`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `activity_logs` WRITE;
/*!40000 ALTER TABLE `activity_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_logs` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_id` int(11) NOT NULL,
  `package_title` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `persons` int(11) NOT NULL,
  `travel_date` date NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `contact_messages`
--

DROP TABLE IF EXISTS `contact_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_messages`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `contact_messages` WRITE;
/*!40000 ALTER TABLE `contact_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_messages` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'info',
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `state` varchar(100) NOT NULL,
  `location` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `duration` int(11) NOT NULL,
  `description` text NOT NULL,
  `image_url` text NOT NULL,
  `highlights` text DEFAULT NULL,
  `rating` decimal(3,2) NOT NULL DEFAULT 4.50,
  `review_count` int(11) NOT NULL DEFAULT 0,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `max_persons` int(11) NOT NULL DEFAULT 20,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;
INSERT INTO `packages` VALUES
(1,'Living Root Bridges Trek - Meghalaya','Meghalaya','Cherrapunji & Nongriat',8500.00,4,'Trek through ancient Khasi villages to discover the legendary double-decker living root bridges of Nongriat. Swim in crystal-clear natural pools beneath thundering waterfalls, explore limestone caves, and spend nights in eco-homestays.','https://images.unsplash.com/photo-1596402184320-417e7178b2cd?w=800','Double-decker living root bridge|Natural swimming pools|Nohkalikai Falls viewpoint|Local Khasi homestay|Cave exploration at Arwah',4.90,127,1,12,'2026-06-07 20:15:55'),
(2,'Kaziranga Rhino Safari - Assam','Assam','Kaziranga National Park',12000.00,3,'Witness the world\'s largest population of Indian one-horned rhinoceroses on elephant-back safari and jeep safari through Kaziranga\'s tall elephant grass. Also spot tigers, wild elephants, and thousands of migratory birds.','https://images.unsplash.com/photo-1589882485484-c073e3742e60?q=80&w=874&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D','Elephant-back rhino safari|Jeep safari at dawn|Boat ride on Brahmaputra|Tea estate visit|Majuli Island day trip',4.80,203,1,16,'2026-06-07 20:15:55'),
(3,'Hornbill Festival Experience - Nagaland','Nagaland','Kisama Heritage Village, Kohima',15000.00,5,'The Hornbill Festival is Nagaland\'s greatest cultural showcase - sixteen Naga tribes gather to display warrior dances, traditional music, fire-making, and ancient crafts. Stay in Naga log huts and eat authentic tribal cuisine.','https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800','All 16 Naga tribes in traditional attire|Warrior dance performances|Tribal crafts market|Kohima War Cemetery|Nagaland cuisine cooking class',4.90,89,1,20,'2026-06-07 20:15:55'),
(4,'Tawang Monastery Circuit - Arunachal Pradesh','Arunachal Pradesh','Tawang & Bomdila',18000.00,7,'Journey to one of Asia\'s largest Buddhist monasteries perched at 10,000 feet above sea level. Cross the Sela Pass at 13,700 feet, visit ancient Dirang Dzong, and witness centuries-old Tibetan Buddhist rituals.','https://images.unsplash.com/photo-1519681393784-d120267933ba?w=800','Tawang Monastery - Asia\'s largest|Sela Pass at 13,700ft|PTSO Lake reflection views|Ancient Tibetan butter lamp ceremonies|Local Monpa tribe homestay',4.80,156,1,14,'2026-06-07 20:15:55'),
(5,'Kanchenjunga Panorama - Sikkim','Sikkim','Pelling & Yuksom',16000.00,6,'Stand before the world\'s third-highest mountain peak on a journey through Sikkim\'s ancient monasteries and pristine alpine valleys. Trek through rhododendron forests, visit sacred Dubdi Monastery, and witness sunrise over Kanchenjunga.','https://images.unsplash.com/photo-1566837945700-30057527ade0?w=800','Kanchenjunga sunrise panorama|Dubdi Monastery - Sikkim\'s oldest|Khecheopalri Lake pilgrimage|Yuksom valley trek|Traditional Sikkimese thali dinner',4.90,178,1,12,'2026-06-07 20:15:55'),
(6,'Loktak Floating Village - Manipur','Manipur','Loktak Lake & Imphal',9500.00,4,'Explore the only floating national park in the world - Keibul Lamjao, home to the endangered Sangai deer. Stay on traditional floating phumdis, attend a Manipuri classical dance performance, and visit Ima Keithel, run entirely by women.','https://images.unsplash.com/photo-1518398046578-8cca57782e17?w=800','Keibul Lamjao floating national park|Sangai deer spotting|Traditional floating phumdi stay|Manipuri classical dance show|Ima Keithel womens market',4.70,64,0,10,'2026-06-07 20:15:55'),
(7,'Blue Mountains Trek - Mizoram','Mizoram','Phawngpui & Aizawl',11000.00,5,'Trek to Phawngpui, Mizoram\'s highest peak at 7210 feet, through virgin forests rich with orchids and rare wildlife. Explore the clifftop city of Aizawl, visit Solomon\'s Temple, and learn the iconic Cheraw bamboo dance.','https://images.unsplash.com/photo-1544735716-392fe2489ffa?w=800','Phawngpui peak summit at 7210ft|Vantawng Falls - Mizoram\'s highest|Cheraw bamboo dance workshop|Reiek Heritage Village|Orchid-rich forest trail',4.60,43,0,14,'2026-06-07 20:15:55'),
(8,'Royal Tripura Heritage Tour','Tripura','Agartala & Udaipur',7500.00,4,'Discover Tripura\'s royal legacy - from the ornate Ujjayanta Palace to the mystical Neermahal water palace floating on Rudrasagar Lake. Explore Unakoti\'s ancient rock-cut Shaivite sculptures and Jampui Hills orange gardens.','https://images.unsplash.com/photo-1547036967-23d11aacaee0?w=800','Ujjayanta Palace museum|Neermahal floating palace boat tour|Unakoti 8th century rock sculptures|Tripura Sundari Temple|Jampui Hills orange orchards',4.50,38,0,20,'2026-06-07 20:15:55');
/*!40000 ALTER TABLE `packages` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `reviewer_name` varchar(255) NOT NULL,
  `rating` tinyint(4) NOT NULL CHECK (`rating` between 1 and 5),
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `image_url` text NOT NULL,
  `capital` varchar(100) NOT NULL,
  `best_time` varchar(100) NOT NULL,
  `tourist_places` text DEFAULT NULL,
  `culture` text DEFAULT NULL,
  `food` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES
(1,'Meghalaya','meghalaya','The abode of clouds - a land of living root bridges, endless waterfalls, and some of the wettest places on earth. Meghalaya\'s limestone caves, rolling hills, and Khasi tribes make it one of India\'s most extraordinary destinations.','https://images.unsplash.com/photo-1596402184320-417e7178b2cd?w=800','Shillong','October to June','Cherrapunji, Mawsynram, Living Root Bridges, Dawki River, Nohkalikai Falls, Elephant Falls, Shillong Peak, Mawphlang Sacred Grove','Predominantly Khasi, Jaintia, and Garo tribes with matrilineal society. Famous for Nongkrem Dance, Wangala Festival, and vibrant traditional attire.','Jadoh (rice and pork), Doh-khlieh (pork salad), Pumaloi (rice dish), Nakham Bitchi (dried fish chutney)'),
(2,'Assam','assam','The gateway to Northeast India - home to one-horned rhinoceroses, Brahmaputra river islands, and the world\'s finest tea gardens. Assam\'s ancient temples, wildlife sanctuaries, and silk traditions are unmatched.','https://images.unsplash.com/photo-1589882485484-c073e3742e60?q=80&w=874&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D','Dispur','November to April','Kaziranga National Park, Majuli Island, Kamakhya Temple, Manas National Park, Sivasagar, Haflong, Jorhat Tea Gardens','Assamese culture centers on Bihu festival, Sattriya dance, and the Vaishnavite monasteries (Satras) of Majuli island.','Masor Tenga (sour fish curry), Khar (alkaline dish), Pitha (rice cakes), Poita Bhat (fermented rice), Duck with ash gourd'),
(3,'Nagaland','nagaland','The land of the Nagas - sixteen fierce and proud tribes whose warrior traditions, intricate crafts, and hornbill festivals draw travelers from across the world. Wild, forested, and deeply authentic.','https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800','Kohima','October to May','Kohima War Cemetery, Dzükou Valley, Hornbill Festival Ground, Khonoma Village, Japfü Peak, Dimapur Ruins','Sixteen major tribes including Angami, Ao, Sumi, Lotha. Famous for the Hornbill Festival (December) - a showcase of Naga warrior heritage.','Smoked pork with bamboo shoots, Axone (fermented soybean), Galho (rice-vegetable porridge), Anishi (taro leaf stew)'),
(4,'Manipur','manipur','A jeweled land - Manipur\'s floating lake Loktak, classical dance form Manipuri, and polo grounds (birthplace of modern polo) make it a cultural treasure of extraordinary depth.','https://images.unsplash.com/photo-1518398046578-8cca57782e17?w=800','Imphal','October to March','Loktak Lake, Keibul Lamjao National Park, Kangla Fort, Ima Keithel (Mothers Market), Shirui Kashung Peak, Shree Govindajee Temple','Meitei culture with classical Manipuri dance, the Rasa Leela, and the world\'s oldest polo sport. Bishnupur temples reflect Vaishnavite heritage.','Eromba (fermented fish with vegetables), Chagempomba, Ngari (fermented fish), Chamthong (vegetable stew), Singju (salad)'),
(5,'Mizoram','mizoram','The land of the Mizos - a hidden Himalayan sanctuary of blue mountains, bamboo forests, and one of India\'s most literate and gentle peoples. Aizawl perches dramatically on a ridge above the clouds.','https://images.unsplash.com/photo-1544735716-392fe2489ffa?w=800','Aizawl','October to March','Phawngpui Peak, Vantawng Falls, Reiek Heritage Village, Tamdil Lake, Murlen National Park, Solomon\'s Temple Aizawl','Mizo people are known for music, Cheraw dance (bamboo dance), and a strong Christian faith. Chapchar Kut festival marks spring.','Bai (vegetable stew with fermented pork), Chhum Han (boiled vegetables), Sawhchiar (rice porridge with chicken), Mizo vawksa rep (smoked pork)'),
(6,'Tripura','tripura','A compact kingdom of palaces, temples, and tribal heartlands. Tripura\'s Ujjayanta Palace, sacred Tripura Sundari temple, and Unakoti rock carvings reveal centuries of royal heritage.','https://images.unsplash.com/photo-1547036967-23d11aacaee0?w=800','Agartala','November to March','Ujjayanta Palace, Neermahal Water Palace, Unakoti Rock Carvings, Tripura Sundari Temple, Sepahijala Wildlife Sanctuary, Jampui Hills','Rich blend of Bengali and tribal cultures. Kharchi Puja, Garia Puja, and tribal festivals showcase Tripura\'s diversity.','Mui Borok, Chakhwi, Gudok, Bangui rice'),
(7,'Arunachal Pradesh','arunachal-pradesh','The dawn-lit mountains - India\'s largest northeastern state borders China, Bhutan, and Myanmar. Ancient monasteries, alpine meadows, and over 100 distinct tribes make it the most diverse state in India.','https://images.unsplash.com/photo-1519681393784-d120267933ba?w=800','Itanagar','October to April','Tawang Monastery, Sela Pass, Ziro Valley, Namdapha National Park, Bomdila, Pasighat, Mechuka Valley, Dirang','Over 100 tribes including Monpa, Adi, Nyishi, Apatani, Galo. Tawang\'s Tibetan Buddhist monasteries are a spiritual highlight.','Thukpa, Apong, Lukter, Pika Pila, Pan'),
(8,'Sikkim','sikkim','The Himalayan kingdom - India\'s smallest state is its most dramatic: glacier lakes, Kanchenjunga views, ancient Buddhist monasteries, and pristine alpine valleys that feel like the edge of the world.','https://images.unsplash.com/photo-1566837945700-30057527ade0?w=800','Gangtok','March to June, September to December','Rumtek Monastery, Tsomgo Lake, Nathula Pass, Pelling, Yuksom, Gurudongmar Lake, Lachen, Lachung, Yumthang Valley','Tibetan Buddhist culture with Losar, Saga Dawa, and Pang Lhabsol festivals. Thangka paintings and prayer flags are everywhere.','Thukpa, Momos, Phagshapa, Gundruk, Chang, Sel Roti');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` text DEFAULT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `auth_provider` varchar(50) NOT NULL DEFAULT 'local',
  `oauth_id` varchar(255) DEFAULT NULL,
  `profile_picture` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'Admin','admin@sevensisterstravel.in','$2b$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LchAEEYL.Gu','admin','2026-06-07 20:18:07','local',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-06-17 21:12:59
