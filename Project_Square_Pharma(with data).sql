-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: sqdb
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `drugcategories`
--

DROP TABLE IF EXISTS `drugcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drugcategories` (
  `CategoryID` int NOT NULL,
  `CategoryName` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drugcategories`
--

LOCK TABLES `drugcategories` WRITE;
/*!40000 ALTER TABLE `drugcategories` DISABLE KEYS */;
INSERT INTO `drugcategories` VALUES (71,'F1','Volatile 1'),(72,'X1','Biohazard 1'),(73,'XX1','RNA Seq'),(74,'F2','Volatile 2'),(75,'X2','Biohazard 2'),(76,'F3','Volatile 3');
/*!40000 ALTER TABLE `drugcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drugs`
--

DROP TABLE IF EXISTS `drugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drugs` (
  `DrugID` int NOT NULL,
  `DrugName` varchar(255) DEFAULT NULL,
  `Dosage` varchar(255) DEFAULT NULL,
  `Packaging` varchar(255) DEFAULT NULL,
  `SupplierID` int DEFAULT NULL,
  `CategoryID` int DEFAULT NULL,
  `FormulationPlantID` int DEFAULT NULL,
  PRIMARY KEY (`DrugID`),
  KEY `SupplierID` (`SupplierID`),
  KEY `CategoryID` (`CategoryID`),
  KEY `FormulationPlantID` (`FormulationPlantID`),
  CONSTRAINT `drugs_ibfk_1` FOREIGN KEY (`SupplierID`) REFERENCES `supplier` (`SupplierID`),
  CONSTRAINT `drugs_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `drugcategories` (`CategoryID`),
  CONSTRAINT `drugs_ibfk_3` FOREIGN KEY (`FormulationPlantID`) REFERENCES `formulationplants` (`FormulationPlantID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drugs`
--

LOCK TABLES `drugs` WRITE;
/*!40000 ALTER TABLE `drugs` DISABLE KEYS */;
INSERT INTO `drugs` VALUES (400,'Ace','Adults: 1-2 tablets every day','Paracetamol',1110,71,80),(401,'Ace Plus','Adults: 1-2 tablets every 4-6 hours','Paracetamol & Caffeine',1110,71,80),(402,'Amodis','Doctors Reccomendation','Metronidazole',1112,72,81),(403,'Bioprem','1 tablet daily','Biotin 2.5',1114,73,81),(404,'Calbo-D','1 tablet twice daily','Calcium + Vitamin-D',1115,75,84),(405,'D-balance','Doctors Reccomendation','Cholecalciferol EP',1111,76,83),(406,'Eromycin','Adults : 1-2 gm daily','Erythromycin',1112,74,82),(407,'Frabex','Doctors Reccomendation','Tranexamic acid',1113,74,80),(408,'Hemorif','3 tablets twice daily for 4 days','Diosmin + Hesperidine',1113,71,82),(409,'Montene','One 10 mg tablet daily','Montelukast',1112,73,84),(410,'Seclo','should be taken before meal','Omeprazole',1115,75,83);
/*!40000 ALTER TABLE `drugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formulationplants`
--

DROP TABLE IF EXISTS `formulationplants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formulationplants` (
  `FormulationPlantID` int NOT NULL,
  `PlantName` varchar(255) DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FormulationPlantID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formulationplants`
--

LOCK TABLES `formulationplants` WRITE;
/*!40000 ALTER TABLE `formulationplants` DISABLE KEYS */;
INSERT INTO `formulationplants` VALUES (80,'Plant 1','Dhaka'),(81,'Plant 2','Gazipur'),(82,'Plant 3','Dhaka'),(83,'Plant 4','Pabna'),(84,'Plant 5','Pabna');
/*!40000 ALTER TABLE `formulationplants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logistics`
--

DROP TABLE IF EXISTS `logistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logistics` (
  `LogisticsID` int NOT NULL,
  `DrugID` int DEFAULT NULL,
  `WarehouseID` int DEFAULT NULL,
  `FormulationPlantID` int DEFAULT NULL,
  `ShipmentDate` date DEFAULT NULL,
  PRIMARY KEY (`LogisticsID`),
  KEY `DrugID` (`DrugID`),
  KEY `WarehouseID` (`WarehouseID`),
  KEY `FormulationPlantID` (`FormulationPlantID`),
  CONSTRAINT `logistics_ibfk_1` FOREIGN KEY (`DrugID`) REFERENCES `drugs` (`DrugID`),
  CONSTRAINT `logistics_ibfk_2` FOREIGN KEY (`WarehouseID`) REFERENCES `warehouses` (`WarehouseID`),
  CONSTRAINT `logistics_ibfk_3` FOREIGN KEY (`FormulationPlantID`) REFERENCES `formulationplants` (`FormulationPlantID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logistics`
--

LOCK TABLES `logistics` WRITE;
/*!40000 ALTER TABLE `logistics` DISABLE KEYS */;
INSERT INTO `logistics` VALUES (3,400,101,80,'2022-12-07'),(4,404,105,84,'2023-01-11'),(5,408,103,82,'2022-05-21'),(6,409,102,84,'2022-07-13'),(7,401,104,80,'2022-10-30'),(8,402,105,81,'2022-02-26'),(9,403,101,81,'2022-03-28'),(10,407,103,80,'2023-04-14'),(11,410,104,83,'2023-05-11'),(12,405,102,83,'2023-05-18'),(13,406,103,82,'2023-01-14');
/*!40000 ALTER TABLE `logistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `SaleID` int NOT NULL,
  `DrugID` int DEFAULT NULL,
  `WarehouseID` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `SaleDate` date DEFAULT NULL,
  PRIMARY KEY (`SaleID`),
  KEY `DrugID` (`DrugID`),
  KEY `WarehouseID` (`WarehouseID`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`DrugID`) REFERENCES `drugs` (`DrugID`),
  CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`WarehouseID`) REFERENCES `warehouses` (`WarehouseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (71,402,101,120,'2023-05-18'),(72,404,102,320,'2023-05-18'),(73,406,103,450,'2023-05-18'),(74,408,104,550,'2023-05-18'),(75,410,105,320,'2023-05-18'),(76,409,101,477,'2023-05-18'),(77,407,102,183,'2023-05-18'),(78,405,103,232,'2023-05-18'),(79,403,104,284,'2023-05-18'),(80,401,105,271,'2023-05-18'),(81,400,101,320,'2023-05-18');
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `SupplierID` int NOT NULL,
  `SupplierName` varchar(255) DEFAULT NULL,
  `ContactInfo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1110,'The DOW Chemical Company-USA','+18575537476'),(1111,'Hameco Agro B.V-Holland','+31010882811'),(1112,'XVET-Germany','+32102818101'),(1113,'Lallemand SAS-France','+33211998811'),(1114,'Nuscience-Belgium','+37456711245'),(1115,'Biostadt India limited –India','+91487693321');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouses`
--

DROP TABLE IF EXISTS `warehouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouses` (
  `WarehouseID` int NOT NULL,
  `WarehouseName` varchar(255) DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`WarehouseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouses`
--

LOCK TABLES `warehouses` WRITE;
/*!40000 ALTER TABLE `warehouses` DISABLE KEYS */;
INSERT INTO `warehouses` VALUES (101,'Warehouse 1','Dhaka'),(102,'Warehouse 2','Pabna'),(103,'Warehouse 3','Gazipur'),(104,'Warehouse 4','Tangail'),(105,'Warehouse 5','Kaliakoir');
/*!40000 ALTER TABLE `warehouses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-18  8:57:46
