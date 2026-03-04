-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: store
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Informatique'),(2,'Smartphones'),(3,'Tablettes'),(4,'Télévisions'),(5,'Audio'),(6,'Gaming'),(7,'Accessoires'),(8,'Réseau'),(9,'Stockage'),(10,'Composants PC'),(11,'Imprimantes'),(12,'Objets connectés'),(13,'Photo & Vidéo'),(14,'Électroménager'),(15,'Bureau'),(16,'Mobilier'),(17,'Éclairage'),(18,'Sécurité'),(19,'Sport'),(20,'Loisirs');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `price` int NOT NULL,
  `quantity` int NOT NULL,
  `id_category` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Laptop Pro 15 Gen 13','Ordinateur portable professionnel avec Intel Core i7 1360P, 16 Go DDR5 extensible, SSD NVMe 1 To PCIe 4.0 ultra rapide. Écran 15,6\" IPS Full HD 100% sRGB, 400 nits. Châssis aluminium, clavier rétroéclairé, WiFi 6E, Thunderbolt 4, autonomie 12h.',1499,25,1),(2,'Laptop Air 14','Ultrabook fin et léger avec processeur basse consommation, 16 Go RAM, SSD 512 Go. Écran 14\" IPS antireflet, batterie longue durée 15h, idéal mobilité et étudiants.',999,40,1),(3,'PC Gamer Xtreme RTX 4070','PC gaming Ryzen 7 7800X3D, 32 Go DDR5 RGB, RTX 4070 12 Go, SSD 2 To NVMe, watercooling 360mm, alimentation 850W Gold.',2199,10,1),(4,'Mini PC Office','Mini PC compact Intel i5, 16 Go RAM, SSD 512 Go, double HDMI 4K, WiFi 6.',699,30,1),(5,'PC All-in-One 24','Ordinateur tout-en-un 24 pouces Full HD, Intel i5, 16 Go RAM, SSD 1 To, webcam intégrée.',999,15,1),(6,'Smartphone Alpha Pro 256Go','Smartphone AMOLED 6,8\" 120Hz, 256 Go, triple capteur 50 MP, batterie 5000 mAh, charge rapide 65W, 5G.',1199,40,2),(7,'Smartphone Lite 128Go','Écran 6,5\" Full HD+, 128 Go extensible, batterie 5000 mAh, double capteur 48 MP.',249,80,2),(8,'Smartphone Business','Smartphone sécurisé, chiffrement avancé, 8 Go RAM, 256 Go stockage.',899,35,2),(9,'Smartphone Compact','Modèle 6,1\" compact, 128 Go, double caméra 12 MP.',699,50,2),(10,'Smartphone Endurance','Batterie 6000 mAh ultra longue durée, écran 6,7\".',399,60,2),(11,'Tablette Pro 12 AMOLED','Tablette 12,4\" AMOLED 120Hz, 256 Go, compatible stylet.',899,20,3),(12,'Tablette 10 HD','Écran 10\" Full HD, 128 Go extensible.',299,45,3),(13,'Tablette Kids','Tablette renforcée avec contrôle parental.',199,70,3),(14,'Tablette Business','Écran 11\", 5G, clavier magnétique inclus.',799,25,3),(15,'Tablette Multimedia','4 haut-parleurs stéréo Dolby Atmos.',499,40,3),(16,'TV OLED 65 Cinema','OLED 65\" 4K HDR10+, Dolby Vision, HDMI 2.1.',1499,20,4),(17,'TV QLED 55 144Hz','QLED 55\" 4K 144Hz gaming.',899,25,4),(18,'TV 43 Smart','LED 43\" Full HD Smart TV.',399,30,4),(19,'Projecteur 4K','Projecteur home cinéma 4K HDR.',799,18,4),(20,'Barre de Son Dolby Atmos','Barre de son 5.1 immersive.',299,35,5),(21,'Casque Bluetooth ANC','Réduction de bruit active, 40h autonomie.',249,60,5),(22,'Écouteurs True Wireless','Bluetooth 5.3, boîtier recharge USB-C.',99,120,5),(23,'Enceinte Portable 30W','IPX7 étanche, autonomie 20h.',99,120,5),(24,'Micro Streaming USB','Micro cardioïde pour streaming.',129,50,5),(25,'Casque Studio Pro','Casque monitoring audio professionnel.',199,30,5),(26,'Console NextGen 1To','Console 4K 120fps, ray tracing, SSD 1 To.',549,35,6),(27,'Manette Pro','Retour haptique, gâchettes adaptatives.',79,150,6),(28,'Volant Gaming','Volant force feedback 900°.',399,20,6),(29,'Casque VR','Casque réalité virtuelle 4K.',499,15,6),(30,'Carte Cadeau Gaming','Carte prépayée boutique jeux.',50,200,6),(31,'Clavier Mécanique RGB','Switches mécaniques, anti-ghosting.',129,100,7),(32,'Souris Gaming 26000 DPI','Capteur haute précision.',89,120,7),(33,'Tapis Souris XXL','Surface étendue antidérapante.',29,200,7),(34,'Hub USB-C','Multiport HDMI + USB.',69,85,7),(35,'Chargeur Rapide 65W','USB-C Power Delivery.',39,200,7),(36,'Routeur WiFi 6 AX5400','Débit jusqu?à 5400 Mbps.',179,45,8),(37,'Switch 16 Ports','Gigabit Ethernet métal.',99,50,8),(38,'Répéteur WiFi','Extension portée réseau.',59,60,8),(39,'NAS 2 Baies','Stockage réseau RAID.',349,20,8),(40,'Câble Ethernet Cat6 10m','Débit 1Gbps blindé.',19,150,8),(41,'SSD NVMe 1To','Lecture 7000 Mo/s.',149,70,9),(42,'SSD 2To Gen4','Haute performance gaming.',249,35,9),(43,'Disque Dur 4To','7200 rpm stockage massif.',109,65,9),(44,'Clé USB 128Go','USB 3.2 haute vitesse.',29,180,9),(45,'Carte MicroSD 256Go','UHS-I classe 10.',49,150,9),(46,'Carte Graphique RTX 4060','8 Go GDDR6 ray tracing.',399,25,10),(47,'Carte Mère ATX','Compatible Intel 13e gen.',189,30,10),(48,'RAM 32Go DDR5','Kit 2x16Go 6000 MHz.',179,40,10),(49,'Boîtier PC RGB','Verre trempé airflow.',109,45,10),(50,'Alimentation 750W Gold','Certification 80+ Gold.',119,40,10),(51,'Imprimante Laser','30 ppm WiFi.',229,20,11),(52,'Imprimante Couleur','Jet d?encre multifonction.',149,35,11),(53,'Scanner Portable','Scan A4 rapide.',129,25,11),(54,'Cartouche Toner XL','Haute capacité.',79,60,11),(55,'Papier Photo A4','Pack 200 feuilles.',25,100,11),(56,'Montre Connectée Sport','GPS intégré 10 jours autonomie.',199,55,12),(57,'Balance Connectée','Analyse corporelle WiFi.',79,50,12),(58,'Thermostat Connecté','Contrôle via smartphone.',179,30,12),(59,'Station Météo','Capteurs extérieur/intérieur.',89,40,12),(60,'Ampoule Connectée','RGB WiFi 16M couleurs.',19,300,12),(61,'Caméra Reflex 24MP','APS-C vidéo 4K.',899,12,13),(62,'Objectif 50mm f1.8','Idéal portrait lumineux.',199,22,13),(63,'Trépied Aluminium','Réglable hauteur 160cm.',79,40,13),(64,'Caméra Sport 4K','Waterproof 30m.',199,28,13),(65,'Drone 4K GPS','Stabilisation 3 axes.',599,15,13),(66,'Aspirateur Robot','Navigation Lidar 4000 Pa.',349,30,14),(67,'Machine à Laver 8kg','Classe A+++.',699,10,14),(68,'Réfrigérateur 500L','Multiportes inox.',1199,6,14),(69,'Four Chaleur Tournante','Programmation digitale.',499,12,14),(70,'Cafetière Expresso','Pompe 15 bars.',199,28,14),(71,'Bureau Électrique','Réglable 70-120 cm.',399,18,15),(72,'Support Écran','Bras articulé VESA.',79,55,15),(73,'Lampe Bureau LED','Intensité variable.',45,80,15),(74,'Armoire Bois Massif','Grande capacité.',599,8,15),(75,'Étagère Métal','Structure robuste.',149,30,15),(76,'Chaise Ergonomique Pro','Support lombaire réglable.',329,22,16),(77,'Fauteuil Relax','Inclinaison électrique.',499,12,16),(78,'Canapé 3 Places','Tissu résistant.',899,10,16),(79,'Table Basse Moderne','Plateau verre trempé.',199,25,16),(80,'Tabouret Design','Hauteur ajustable.',89,40,16),(81,'Lampe LED RGB','Compatible assistants vocaux.',29,200,17),(82,'Ruban LED 5m','Éclairage décoratif.',39,120,17),(83,'Plafonnier LED','Blanc chaud/froid réglable.',129,35,17),(84,'Applique Murale','Design contemporain.',79,45,17),(85,'Veilleuse Enfant','Lumière douce sécurisée.',25,70,17),(86,'Caméra Surveillance 2K','Vision nocturne intelligente.',89,75,18),(87,'Serrure Connectée','Ouverture Bluetooth.',199,20,18),(88,'Détecteur Fumée','Alarme sonore 85dB.',49,60,18),(89,'Alarme Maison','Kit complet sans fil.',299,18,18),(90,'Interphone Vidéo','Écran couleur 7\".',249,15,18),(91,'Tapis Roulant','2.5HP pliable écran LCD.',699,10,19),(92,'Vélo Appartement','Résistance magnétique.',399,15,19),(93,'Trottinette Électrique','Autonomie 30 km.',499,20,19),(94,'Ballon Football','Taille 5 officiel.',29,120,19),(95,'Montre Sport GPS','Suivi avancé performance.',249,35,19),(96,'Laptop Creator 16','PC portable 16 pouces 2.5K, Intel i9, 32Go RAM, RTX 4060, SSD 2To, calibré pour création graphique avancée.',2499,12,1),(97,'Laptop Student 14','Ordinateur portable 14 pouces Full HD, Ryzen 5, 8Go RAM, SSD 512Go, idéal études.',649,60,1),(98,'Workstation Pro','Station de travail Xeon, 64Go RAM ECC, RTX 4080, SSD 4To.',3999,5,1),(99,'Chromebook 13','Portable ChromeOS 13\", 8Go RAM, 128Go SSD, autonomie 14h.',399,45,1),(100,'PC Home Basic','PC fixe familial i3, 8Go RAM, SSD 512Go.',499,35,1),(101,'Smartphone Ultra Zoom','Écran 6.9\" AMOLED, zoom optique 10x, 512Go stockage.',1399,25,2),(102,'Smartphone Eco','Modèle recyclé reconditionné, 128Go.',299,70,2),(103,'Smartphone 5G Max','Écran 120Hz, batterie 5500mAh.',499,55,2),(104,'Smartphone Mini','Format compact 5.8\", 128Go.',599,40,2),(105,'Smartphone Rugged','Certifié IP68 renforcé antichoc.',449,30,2),(106,'Tablette 8 Compact','Écran 8\", 64Go, légère et portable.',199,80,3),(107,'Tablette 11 5G','Écran 11\", 5G intégrée.',699,35,3),(108,'Tablette Graphique','Surface dédiée dessin numérique.',349,25,3),(109,'Tablette Éducation','Protection renforcée école.',229,60,3),(110,'Tablette Premium 14','Écran 14\" OLED 120Hz.',1099,15,3),(111,'TV 75 pouces 4K','LED 75\" 4K HDR.',1199,12,4),(112,'TV 50 pouces Smart','Smart TV Full HD.',449,40,4),(113,'Écran PC 32 4K','Moniteur 32\" UHD IPS.',499,30,4),(114,'Moniteur Gaming 240Hz','Écran 27\" 240Hz 1ms.',599,20,4),(115,'Vidéoprojecteur Portable','Mini projecteur HD batterie intégrée.',349,25,4),(116,'Casque Gaming Surround','Audio 7.1 virtuel.',129,75,5),(117,'Écouteurs Sport','Résistants transpiration.',59,120,5),(118,'Enceinte Party 100W','Puissance 100W avec LED.',299,30,5),(119,'DAC Audio USB','Convertisseur audio haute fidélité.',149,25,5),(120,'Barre de Son Compacte','Format réduit Dolby Digital.',199,40,5),(121,'Console Portable','Console portable écran 7\".',399,25,6),(122,'Manette Arcade','Joystick arcade USB.',89,50,6),(123,'Carte PSN 100?','Carte prépayée 100?.',100,200,6),(124,'Siège Sim Racing','Cockpit simulation course.',699,10,6),(125,'Support Volant','Support pliable volant.',199,20,6),(126,'Clavier Sans Fil','Clavier AZERTY Bluetooth.',49,150,7),(127,'Souris Ergonomique','Souris verticale confort.',59,120,7),(128,'Webcam 4K','Webcam Ultra HD 4K.',149,40,7),(129,'Support Laptop','Support aluminium ventilé.',39,130,7),(130,'Dock Thunderbolt','Station accueil 12 ports.',249,35,7),(131,'Routeur Gaming','Optimisé faible latence.',229,30,8),(132,'Firewall Hardware','Sécurité réseau PME.',399,15,8),(133,'Switch 24 Ports','Switch rackable.',199,20,8),(134,'Point Accès WiFi','WiFi professionnel plafond.',179,25,8),(135,'Adaptateur CPL','Kit CPL 1Gbps.',89,60,8),(136,'SSD Externe 2To','USB-C 1050Mo/s.',199,50,9),(137,'Disque Dur 8To','HDD 8To sauvegarde.',199,30,9),(138,'Clé USB 256Go','USB 3.2 haute vitesse.',49,140,9),(139,'Carte SD 512Go','Carte mémoire UHS-II.',129,60,9),(140,'Boîtier SSD M2','Boîtier externe aluminium.',39,100,9),(141,'RTX 4080','Carte graphique 16Go GDDR6X.',1299,8,10),(142,'Watercooling 240mm','Kit refroidissement liquide.',129,45,10),(143,'Ventilateur RGB','Ventilateur 120mm silencieux.',29,200,10),(144,'Pâte Thermique Pro','Haute conductivité.',15,300,10),(145,'SSD SATA 1To','SSD 2.5 pouces 1To.',99,90,10),(146,'Imprimante 3D','Impression 3D volume 220x220.',349,20,11),(147,'Plastique PLA 1kg','Bobine filament PLA.',25,150,11),(148,'Destructeur Papier','Broyeur documents sécurisé.',89,40,11),(149,'Relieuse Bureau','Relieuse spirale.',79,35,11),(150,'Plastifieuse A4','Plastification rapide.',59,45,11),(151,'Bracelet Connecté','Suivi activité simple.',49,120,12),(152,'Purificateur Air','Filtre HEPA connecté.',299,25,12),(153,'Prise Connectée','Contrôle WiFi smartphone.',19,250,12),(154,'Caméra Bébé','Babyphone vidéo HD.',129,35,12),(155,'Détecteur Ouverture','Capteur porte connecté.',29,150,12),(156,'Caméra Hybride 30MP','Hybride plein format.',1799,10,13),(157,'Flash Externe','Flash TTL haute puissance.',199,25,13),(158,'Sac Photo','Sac transport rembourré.',89,60,13),(159,'Stabilisateur Gimbal','Stabilisateur smartphone.',129,45,13),(160,'Carte Capture','Capture HDMI streaming.',149,35,13),(161,'Lave Vaisselle','Classe A++ 12 couverts.',699,12,14),(162,'Micro Ondes','800W grill intégré.',149,30,14),(163,'Plaque Induction','4 foyers boost.',499,15,14),(164,'Hotte Cuisine','Aspiration 600m3/h.',299,18,14),(165,'Congélateur 300L','Grande capacité.',599,10,14),(166,'Bibliothèque Bois','5 étagères modernes.',249,20,15),(167,'Commode 6 Tiroirs','Grande capacité.',299,15,15),(168,'Bureau Gamer','Surface carbone LED.',349,18,15),(169,'Caisson Bureau','3 tiroirs verrouillables.',149,30,15),(170,'Table Extensible','Salle à manger moderne.',699,12,15),(171,'Fauteuil Bureau','Accoudoirs réglables.',199,35,16),(172,'Lit Double','Structure bois 140x190.',399,15,16),(173,'Matelas Mémoire','Matelas 140x190 confort.',499,20,16),(174,'Armoire Dressing','Grande penderie.',799,8,16),(175,'Meuble TV','Support TV moderne.',249,18,16),(176,'Spot LED Encastrable','Pack 6 spots 4000K.',79,70,17),(177,'Lampe Extérieure','IP65 étanche jardin.',99,40,17),(178,'Guirlande LED','Décoration intérieure.',29,120,17),(179,'Projecteur LED','Éclairage extérieur 50W.',59,60,17),(180,'Lampe Design','Lampe moderne salon.',149,25,17),(181,'Coffre Fort','Coffre sécurisé digital.',199,20,18),(182,'Caméra PTZ','Caméra motorisée 360°.',249,15,18),(183,'Sirène Alarme','Sirène extérieure 110dB.',59,50,18),(184,'Capteur Mouvement','Détection infrarouge.',39,100,18),(185,'Kit Vidéosurveillance','Kit 4 caméras 1080p.',399,12,18),(186,'Banc Musculation','Structure acier robuste.',299,15,19),(187,'Haltères 20kg','Kit haltères ajustables.',149,30,19),(188,'Tapis Yoga','Tapis antidérapant.',29,150,19),(189,'Sac Sport','Sac entraînement 40L.',59,80,19),(190,'Raquette Tennis','Raquette graphite légère.',129,35,19);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-04 10:53:30
