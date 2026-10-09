CREATE DATABASE  IF NOT EXISTS `banco_comercial` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `banco_comercial`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: banco_comercial
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `ID_Cliente` int NOT NULL AUTO_INCREMENT,
  `Cedula_RNC` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Nombre_Completo` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Fecha_Nacimiento` date NOT NULL,
  `Genero` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Estado_Civil` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Nivel_Educativo` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ingreso_Mensual` decimal(12,2) DEFAULT NULL,
  `Tipo_Empleo` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Antiguedad_Laboral_Meses` int DEFAULT NULL,
  `Telefono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_Cliente`),
  UNIQUE KEY `Cedula_RNC` (`Cedula_RNC`),
  CONSTRAINT `cliente_chk_1` CHECK ((`Ingreso_Mensual` >= 0)),
  CONSTRAINT `cliente_chk_2` CHECK ((`Antiguedad_Laboral_Meses` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'375-9236009-9','Dulce Castillo Polanco','1971-04-20','Femenino','Divorciado(a)','Postgrado',104842.40,'Pensionado',400,'809-202-2322'),(2,'183-7314012-8','Rosa Núñez Pérez','1996-11-11','Femenino','Soltero(a)','Secundario',26729.36,'Independiente',240,'849-548-2469'),(3,'237-8083634-1','Ramón Peña Núñez','1974-11-23','Masculino','Divorciado(a)','Postgrado',88899.52,'Independiente',96,'849-767-9166'),(4,'246-9605863-8','Víctor Castillo Almonte','2003-08-13','Masculino','Soltero(a)','Postgrado',85656.64,'Comerciante',147,'849-429-3113'),(5,'118-3047042-7','Alberto Tavárez Sánchez','1971-12-20','Masculino','Divorciado(a)','Universitario',62583.64,'Comerciante',229,'849-758-5112'),(6,'138-1155640-0','Ramón Herrera Almonte','1997-12-16','Masculino','Casado(a)','Universitario',61082.51,'Independiente',215,'849-811-8507'),(7,'223-1564049-4','Fernando Vásquez Beltré','1977-05-23','Masculino','Unión libre','Universitario',62446.24,'Comerciante',209,'829-300-8183'),(8,'256-7209730-1','Alberto Santana Núñez','1976-07-27','Masculino','Casado(a)','Universitario',81669.59,'Independiente',234,'849-621-3397'),(9,'062-1749254-8','María Rodríguez Pérez','1993-10-18','Femenino','Unión libre','Primario',21187.68,'Empleado temporal',66,'849-975-6853'),(10,'068-9467819-4','Laura Sánchez Encarnación','2001-08-23','Femenino','Soltero(a)','Secundario',29433.63,'Comerciante',153,'829-884-3623'),(11,'008-2780632-6','Jorge Peña Castillo','1991-07-26','Masculino','Soltero(a)','Secundario',28964.56,'Empleado temporal',99,'809-555-6790'),(12,'239-3864434-2','José Pérez Castillo','1995-06-22','Masculino','Viudo(a)','Técnico',40473.73,'Empleado fijo',130,'849-411-8104'),(13,'332-1808451-7','Eduardo Ferreras Reyes','1969-09-13','Masculino','Casado(a)','Primario',15963.22,'Empleado temporal',14,'829-928-1335'),(14,'213-2319675-6','Dulce Díaz Almonte','1998-03-06','Femenino','Unión libre','Secundario',26597.48,'Comerciante',139,'809-552-3862'),(15,'062-9845818-8','Ingrid Del Rosario Volquez','1991-05-15','Femenino','Unión libre','Secundario',25429.36,'Comerciante',116,'809-419-4790'),(16,'081-6900575-8','Carmen Tavárez Núñez','1986-07-18','Femenino','Viudo(a)','Secundario',36993.81,'Independiente',219,'849-421-2797'),(17,'285-3224963-1','Francisco Herrera Del Rosario','2001-12-07','Masculino','Unión libre','Postgrado',87978.69,'Independiente',174,'809-646-3806'),(18,'033-5882776-5','Ana Del Rosario Vásquez','1976-11-21','Femenino','Casado(a)','Primario',19883.50,'Independiente',153,'829-462-2030'),(19,'288-6877173-5','Elena Guzmán Pérez','1968-02-08','Femenino','Divorciado(a)','Primario',17404.98,'Empleado fijo',178,'849-840-1622'),(20,'200-5896957-5','Andrés Ferreras Díaz','2003-08-14','Masculino','Soltero(a)','Primario',22149.44,'Pensionado',248,'849-932-8155'),(21,'300-1340075-8','Ramón Batista Jiménez','1983-12-25','Masculino','Unión libre','Primario',17241.47,'Comerciante',84,'809-774-1919'),(22,'015-8126459-9','Miguel López Ferreras','1972-02-02','Masculino','Casado(a)','Secundario',29011.03,'Pensionado',274,'829-625-7293'),(23,'131-3477715-3','Massiel Sánchez Reyes','1973-03-18','Femenino','Soltero(a)','Primario',21835.69,'Pensionado',323,'809-483-9866'),(24,'175-9731684-5','Elena Jiménez Fernández','2002-02-27','Femenino','Soltero(a)','Secundario',29564.27,'Pensionado',255,'849-211-4978'),(25,'120-5626517-5','Mercedes Sánchez Castillo','1974-12-28','Femenino','Casado(a)','Universitario',72215.14,'Independiente',205,'829-567-8524'),(26,'003-6946386-8','Ricardo Almonte Mejía','2002-05-07','Masculino','Divorciado(a)','Secundario',30929.90,'Empleado temporal',127,'809-854-3827'),(27,'112-6145748-9','Patricia Herrera Cabrera','1981-03-23','Femenino','Soltero(a)','Primario',26085.02,'Empleado fijo',139,'829-589-9830'),(28,'281-5386303-4','Alberto Almonte Polanco','1975-09-04','Masculino','Soltero(a)','Primario',15287.84,'Comerciante',88,'849-806-4109'),(29,'311-9053266-6','Sofía Peña Herrera','1983-06-05','Femenino','Unión libre','Universitario',51161.10,'Empleado fijo',219,'849-374-9457'),(30,'192-2067037-5','Laura Herrera Fernández','1975-01-04','Femenino','Unión libre','Postgrado',112000.06,'Empleado fijo',218,'809-744-3526'),(31,'332-2972144-5','Manuel Fernández Martínez','1985-08-04','Masculino','Divorciado(a)','Primario',18303.10,'Pensionado',274,'829-323-9502'),(32,'254-6234931-4','Patricia Sánchez Volquez','1994-10-12','Femenino','Casado(a)','Primario',14369.84,'Empleado fijo',209,'809-532-8087'),(33,'353-6847641-5','Andrés Jiménez Beltré','1996-07-11','Masculino','Divorciado(a)','Secundario',23076.04,'Comerciante',59,'849-590-4487'),(34,'228-5422858-2','Belkis Sánchez Cabrera','1973-07-09','Femenino','Viudo(a)','Técnico',50728.19,'Independiente',71,'849-474-4838'),(35,'012-6522554-6','Juana Herrera Del Rosario','1972-05-10','Femenino','Unión libre','Postgrado',98499.32,'Comerciante',105,'809-895-9104'),(36,'089-1176419-4','Ricardo Castillo Díaz','1992-06-21','Masculino','Viudo(a)','Técnico',30096.84,'Comerciante',188,'849-458-3139'),(37,'062-5507101-5','Xiomara Guzmán Volquez','1995-08-11','Femenino','Soltero(a)','Primario',13972.44,'Empleado temporal',165,'809-668-9436'),(38,'113-8775634-3','Patricia Rodríguez Herrera','1977-09-25','Femenino','Viudo(a)','Primario',25880.59,'Empleado temporal',87,'849-374-6069'),(39,'095-9613863-3','Massiel Batista Castillo','2002-09-05','Femenino','Divorciado(a)','Primario',13856.63,'Comerciante',14,'849-878-6591'),(40,'012-9064455-5','Laura Ferreras Mejía','1981-08-11','Femenino','Unión libre','Técnico',29476.63,'Comerciante',37,'829-403-7021'),(41,'393-6009775-7','Claudia Peña Díaz','2002-01-27','Femenino','Viudo(a)','Universitario',78535.11,'Pensionado',392,'809-721-9559'),(42,'132-9858251-8','Fernando Jiménez Sánchez','1986-06-06','Masculino','Divorciado(a)','Primario',25959.59,'Empleado temporal',197,'849-308-4519'),(43,'367-9197072-2','Mercedes Díaz Guzmán','1997-09-05','Femenino','Viudo(a)','Postgrado',82606.32,'Independiente',201,'849-533-6959'),(44,'074-3202121-9','Héctor Herrera Ferreras','1999-04-05','Masculino','Soltero(a)','Postgrado',104504.29,'Empleado temporal',189,'849-235-5593'),(45,'028-4114424-2','Pedro Fernández Santana','1999-12-12','Masculino','Divorciado(a)','Secundario',27822.75,'Empleado temporal',180,'849-837-9023'),(46,'167-3443532-8','José Peña Reyes','1997-06-18','Masculino','Soltero(a)','Primario',19367.06,'Comerciante',42,'829-207-1953'),(47,'047-8094080-6','Belkis Ureña Batista','1981-06-25','Femenino','Casado(a)','Primario',15564.01,'Empleado temporal',225,'809-446-4680'),(48,'186-4509476-4','Fernando Díaz Vásquez','1975-09-28','Masculino','Divorciado(a)','Universitario',72777.05,'Comerciante',222,'849-821-8893'),(49,'105-8274380-3','Yokasta Cabrera Díaz','1972-02-12','Femenino','Divorciado(a)','Postgrado',113301.46,'Empleado fijo',47,'809-760-3373'),(50,'182-9190157-2','Francisco Peña Cabrera','1988-07-01','Masculino','Soltero(a)','Universitario',64653.31,'Independiente',218,'809-773-4646');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `decision_credito`
--

DROP TABLE IF EXISTS `decision_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `decision_credito` (
  `ID_Decision` int NOT NULL AUTO_INCREMENT,
  `ID_Solicitud` int NOT NULL,
  `Resultado_Decision` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Monto_Aprobado` decimal(12,2) DEFAULT NULL,
  `Tasa_Interes_Asignada` decimal(5,2) DEFAULT NULL,
  `Analista_Responsable` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Fecha_Decision` date NOT NULL,
  `Motivo_Rechazo` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_Decision`),
  KEY `idx_decision_solicitud` (`ID_Solicitud`),
  CONSTRAINT `fk_decision_solicitud` FOREIGN KEY (`ID_Solicitud`) REFERENCES `solicitud_credito` (`ID_Solicitud`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `decision_credito_chk_1` CHECK ((`Monto_Aprobado` >= 0)),
  CONSTRAINT `decision_credito_chk_2` CHECK ((`Tasa_Interes_Asignada` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=950061 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `decision_credito`
--

LOCK TABLES `decision_credito` WRITE;
/*!40000 ALTER TABLE `decision_credito` DISABLE KEYS */;
INSERT INTO `decision_credito` VALUES (950001,500001,'Aprobado',373072.44,18.32,'J. Ramírez','2026-08-02',NULL),(950002,500002,'Aprobado',196063.48,16.62,NULL,'2026-08-28',NULL),(950003,500003,'Aprobado',120648.64,14.00,NULL,'2026-07-09',NULL),(950004,500004,'Rechazado',NULL,NULL,'M. Fernández','2026-04-18','Documentación incompleta'),(950005,500005,'Aprobado',144672.41,17.75,'A. Guzmán','2026-05-11',NULL),(950006,500006,'Aprobado',243810.77,17.15,'L. Peralta','2026-02-21',NULL),(950007,500007,'Aprobado parcial',1018143.69,27.02,'J. Ramírez','2026-08-08',NULL),(950008,500008,'Aprobado',56754.67,16.71,NULL,'2026-03-24',NULL),(950009,500009,'Aprobado',136845.64,15.39,NULL,'2026-08-17',NULL),(950010,500010,'Rechazado',NULL,NULL,'C. Núñez','2026-08-17','Nivel de endeudamiento elevado'),(950011,500011,'Aprobado parcial',576147.19,25.90,'M. Fernández','2026-03-04',NULL),(950012,500012,'Rechazado',NULL,NULL,'L. Peralta','2026-06-25','Capacidad de pago insuficiente'),(950013,500013,'Rechazado',NULL,NULL,'J. Ramírez','2026-07-22','Antigüedad laboral insuficiente'),(950014,500014,'Rechazado',NULL,NULL,'C. Núñez','2026-08-31','Capacidad de pago insuficiente'),(950015,500015,'Aprobado parcial',2820031.85,20.60,'J. Ramírez','2026-06-20',NULL),(950016,500016,'Aprobado',253180.24,16.76,NULL,'2026-07-18',NULL),(950017,500017,'Rechazado',NULL,NULL,'A. Guzmán','2026-01-16','Historial crediticio desfavorable'),(950018,500018,'Rechazado',NULL,NULL,'M. Fernández','2026-05-05','Nivel de endeudamiento elevado'),(950019,500019,'Aprobado parcial',3310619.20,28.00,'J. Ramírez','2026-01-30',NULL),(950020,500020,'Rechazado',NULL,NULL,'A. Guzmán','2026-02-26','Documentación incompleta'),(950021,500021,'Aprobado',52848.01,19.18,'J. Ramírez','2026-03-13',NULL),(950022,500022,'Aprobado',845091.22,18.19,'A. Guzmán','2026-07-06',NULL),(950023,500023,'Aprobado',4017776.49,20.12,'M. Fernández','2026-05-25',NULL),(950024,500024,'Aprobado parcial',317737.42,17.84,'L. Peralta','2026-07-20',NULL),(950025,500025,'Aprobado',55349.04,16.54,NULL,'2026-08-02',NULL),(950026,500026,'Rechazado',NULL,NULL,'J. Ramírez','2026-08-29','Nivel de endeudamiento elevado'),(950027,500027,'Aprobado parcial',5051655.95,25.38,'J. Ramírez','2026-07-16',NULL),(950028,500028,'Rechazado',NULL,NULL,'L. Peralta','2026-03-12','Historial crediticio desfavorable'),(950029,500029,'Aprobado',27714.82,15.60,NULL,'2026-04-26',NULL),(950030,500030,'Aprobado',132286.42,17.18,'M. Fernández','2026-06-26',NULL),(950031,500031,'Aprobado parcial',2319084.84,25.74,'L. Peralta','2026-05-04',NULL),(950032,500032,'Rechazado',NULL,NULL,'J. Ramírez','2026-04-18','Nivel de endeudamiento elevado'),(950033,500033,'Rechazado',NULL,NULL,'M. Fernández','2026-04-20','Historial crediticio desfavorable'),(950034,500034,'Rechazado',NULL,NULL,'R. Santos','2026-08-19','Historial crediticio desfavorable'),(950035,500035,'Aprobado parcial',360796.01,22.17,'R. Santos','2026-02-26',NULL),(950036,500036,'Aprobado',1220371.84,16.35,'L. Peralta','2026-07-08',NULL),(950037,500037,'Aprobado parcial',45055.13,17.37,'M. Fernández','2026-03-19',NULL),(950038,500038,'Aprobado',26853.86,17.76,NULL,'2026-02-14',NULL),(950039,500039,'Aprobado',372607.56,20.51,'R. Santos','2026-04-03',NULL),(950040,500040,'Rechazado',NULL,NULL,'J. Ramírez','2026-04-23','Nivel de endeudamiento elevado'),(950041,500041,'Rechazado',NULL,NULL,'L. Peralta','2026-04-05','Capacidad de pago insuficiente'),(950042,500042,'Rechazado',NULL,NULL,'A. Guzmán','2026-06-27','Créditos en mora activos'),(950043,500043,'Aprobado parcial',72736.35,25.45,'L. Peralta','2026-09-01',NULL),(950044,500044,'Aprobado parcial',2667751.07,27.71,'M. Fernández','2026-04-19',NULL),(950045,500045,'Rechazado',NULL,NULL,'C. Núñez','2026-03-04','Nivel de endeudamiento elevado'),(950046,500046,'Aprobado',81567.16,16.83,NULL,'2026-08-16',NULL),(950047,500047,'Aprobado',52217.09,15.18,'C. Núñez','2026-02-12',NULL),(950048,500048,'Aprobado parcial',33890.23,24.95,'A. Guzmán','2026-09-01',NULL),(950049,500049,'Aprobado',1349626.90,19.36,'M. Fernández','2026-03-17',NULL),(950050,500050,'Rechazado',NULL,NULL,'L. Peralta','2026-05-28','Documentación incompleta'),(950051,500051,'Aprobado',77024.30,16.48,'L. Peralta','2026-04-13',NULL),(950052,500052,'Aprobado parcial',5255571.12,27.80,'M. Fernández','2026-08-18',NULL),(950053,500053,'Rechazado',NULL,NULL,'A. Guzmán','2026-03-09','Antigüedad laboral insuficiente'),(950054,500054,'Aprobado parcial',1135509.80,21.88,'C. Núñez','2026-03-14',NULL),(950055,500055,'Rechazado',NULL,NULL,'J. Ramírez','2026-08-11','Historial crediticio desfavorable'),(950056,500056,'Aprobado',70462.90,16.93,NULL,'2026-01-11',NULL),(950057,500057,'Rechazado',NULL,NULL,'M. Fernández','2026-07-30','Capacidad de pago insuficiente'),(950058,500058,'Aprobado',583644.70,18.02,NULL,'2026-01-22',NULL),(950059,500059,'Aprobado parcial',905067.05,26.16,'M. Fernández','2026-04-15',NULL),(950060,500060,'Aprobado',60942.90,16.23,NULL,'2026-05-31',NULL);
/*!40000 ALTER TABLE `decision_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluacion_riesgo`
--

DROP TABLE IF EXISTS `evaluacion_riesgo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluacion_riesgo` (
  `ID_Evaluacion` int NOT NULL AUTO_INCREMENT,
  `ID_Solicitud` int NOT NULL,
  `Score_Interno` decimal(4,2) NOT NULL,
  `Categoria_Riesgo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Fecha_Evaluacion` date NOT NULL,
  `Version_Modelo` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_Evaluacion`),
  KEY `idx_evaluacion_solicitud` (`ID_Solicitud`),
  CONSTRAINT `fk_evaluacion_solicitud` FOREIGN KEY (`ID_Solicitud`) REFERENCES `solicitud_credito` (`ID_Solicitud`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `evaluacion_riesgo_chk_1` CHECK ((`Score_Interno` between 0 and 1))
) ENGINE=InnoDB AUTO_INCREMENT=900071 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluacion_riesgo`
--

LOCK TABLES `evaluacion_riesgo` WRITE;
/*!40000 ALTER TABLE `evaluacion_riesgo` DISABLE KEYS */;
INSERT INTO `evaluacion_riesgo` VALUES (900001,500001,0.16,'Riesgo medio','2026-07-26','v1.3'),(900002,500002,0.14,'Riesgo bajo','2026-08-19','v1.4'),(900003,500003,0.07,'Riesgo bajo','2026-07-06','v1.4'),(900004,500004,0.34,'Riesgo alto','2026-04-14','v1.3'),(900005,500005,0.15,'Riesgo medio','2026-05-10','v1.2'),(900006,500006,0.10,'Riesgo bajo','2026-02-14','v1.3'),(900007,500007,0.36,'Riesgo alto','2026-07-30','v1.2'),(900008,500007,0.31,'Riesgo alto','2026-08-01','v1.4'),(900009,500008,0.13,'Riesgo bajo','2026-03-17','v1.2'),(900010,500009,0.05,'Riesgo bajo','2026-08-13','v1.3'),(900011,500009,0.12,'Riesgo bajo','2026-08-15','v1.4'),(900012,500010,0.42,'Riesgo alto','2026-08-09','v1.3'),(900013,500010,0.45,'Riesgo alto','2026-08-11','v1.4'),(900014,500011,0.38,'Riesgo alto','2026-03-01','v1.4'),(900015,500012,0.34,'Riesgo alto','2026-06-23','v1.2'),(900016,500013,0.37,'Riesgo alto','2026-07-20','v1.2'),(900017,500014,0.37,'Riesgo alto','2026-08-22','v1.3'),(900018,500015,0.21,'Riesgo medio','2026-06-14','v1.3'),(900019,500015,0.21,'Riesgo medio','2026-06-16','v1.4'),(900020,500016,0.12,'Riesgo bajo','2026-07-15','v1.3'),(900021,500017,0.61,'Riesgo muy alto','2026-01-07','v1.3'),(900022,500018,0.33,'Riesgo alto','2026-05-02','v1.2'),(900023,500019,0.41,'Riesgo alto','2026-01-23','v1.4'),(900024,500020,0.33,'Riesgo alto','2026-02-24','v1.2'),(900025,500021,0.15,'Riesgo medio','2026-03-07','v1.2'),(900026,500022,0.17,'Riesgo medio','2026-07-03','v1.2'),(900027,500023,0.18,'Riesgo medio','2026-05-17','v1.4'),(900028,500024,0.16,'Riesgo medio','2026-07-13','v1.4'),(900029,500024,0.16,'Riesgo medio','2026-07-14','v1.4'),(900030,500025,0.10,'Riesgo bajo','2026-07-26','v1.2'),(900031,500025,0.04,'Riesgo bajo','2026-07-30','v1.4'),(900032,500026,0.36,'Riesgo alto','2026-08-22','v1.3'),(900033,500027,0.34,'Riesgo alto','2026-07-09','v1.2'),(900034,500027,0.37,'Riesgo alto','2026-07-10','v1.4'),(900035,500028,0.68,'Riesgo muy alto','2026-03-10','v1.2'),(900036,500029,0.09,'Riesgo bajo','2026-04-17','v1.2'),(900037,500030,0.15,'Riesgo medio','2026-06-22','v1.4'),(900038,500030,0.09,'Riesgo bajo','2026-06-25','v1.4'),(900039,500031,0.37,'Riesgo alto','2026-05-03','v1.2'),(900040,500032,0.35,'Riesgo alto','2026-04-15','v1.2'),(900041,500033,0.40,'Riesgo alto','2026-04-19','v1.3'),(900042,500034,0.38,'Riesgo alto','2026-08-15','v1.4'),(900043,500035,0.23,'Riesgo medio','2026-02-22','v1.2'),(900044,500036,0.13,'Riesgo bajo','2026-07-01','v1.4'),(900045,500037,0.15,'Riesgo medio','2026-03-10','v1.3'),(900046,500038,0.13,'Riesgo bajo','2026-02-12','v1.3'),(900047,500039,0.24,'Riesgo medio','2026-03-26','v1.3'),(900048,500040,0.37,'Riesgo alto','2026-04-22','v1.4'),(900049,500041,0.30,'Riesgo alto','2026-04-04','v1.3'),(900050,500042,0.18,'Riesgo medio','2026-06-19','v1.2'),(900051,500043,0.32,'Riesgo alto','2026-08-25','v1.3'),(900052,500044,0.38,'Riesgo alto','2026-04-18','v1.2'),(900053,500045,0.55,'Riesgo muy alto','2026-02-24','v1.4'),(900054,500046,0.11,'Riesgo bajo','2026-08-08','v1.3'),(900055,500046,0.15,'Riesgo medio','2026-08-09','v1.4'),(900056,500047,0.10,'Riesgo bajo','2026-02-09','v1.4'),(900057,500048,0.31,'Riesgo alto','2026-08-24','v1.2'),(900058,500049,0.18,'Riesgo medio','2026-03-16','v1.3'),(900059,500050,0.23,'Riesgo medio','2026-05-25','v1.3'),(900060,500050,0.16,'Riesgo medio','2026-05-29','v1.4'),(900061,500051,0.09,'Riesgo bajo','2026-04-06','v1.4'),(900062,500052,0.41,'Riesgo alto','2026-08-10','v1.2'),(900063,500053,0.32,'Riesgo alto','2026-03-01','v1.2'),(900064,500054,0.26,'Riesgo medio','2026-03-10','v1.2'),(900065,500055,0.56,'Riesgo muy alto','2026-08-05','v1.3'),(900066,500056,0.14,'Riesgo bajo','2026-01-09','v1.2'),(900067,500057,0.53,'Riesgo alto','2026-07-27','v1.4'),(900068,500058,0.13,'Riesgo bajo','2026-01-17','v1.2'),(900069,500059,0.36,'Riesgo alto','2026-04-09','v1.4'),(900070,500060,0.10,'Riesgo bajo','2026-05-27','v1.3');
/*!40000 ALTER TABLE `evaluacion_riesgo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_crediticio`
--

DROP TABLE IF EXISTS `historial_crediticio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_crediticio` (
  `ID_Historial` int NOT NULL AUTO_INCREMENT,
  `ID_Cliente` int NOT NULL,
  `Score_Buro` int DEFAULT NULL,
  `Creditos_Activos` int DEFAULT '0',
  `Creditos_En_Mora` int DEFAULT '0',
  `Dias_Max_Atraso_Historico` int DEFAULT '0',
  `Deuda_Total_Actual` decimal(12,2) DEFAULT '0.00',
  `Fecha_Consulta` date NOT NULL,
  PRIMARY KEY (`ID_Historial`),
  KEY `idx_historial_cliente` (`ID_Cliente`),
  CONSTRAINT `fk_historial_cliente` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID_Cliente`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `historial_crediticio_chk_1` CHECK ((`Score_Buro` between 300 and 850)),
  CONSTRAINT `historial_crediticio_chk_2` CHECK ((`Creditos_Activos` >= 0)),
  CONSTRAINT `historial_crediticio_chk_3` CHECK ((`Creditos_En_Mora` >= 0)),
  CONSTRAINT `historial_crediticio_chk_4` CHECK ((`Dias_Max_Atraso_Historico` >= 0)),
  CONSTRAINT `historial_crediticio_chk_5` CHECK ((`Deuda_Total_Actual` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_crediticio`
--

LOCK TABLES `historial_crediticio` WRITE;
/*!40000 ALTER TABLE `historial_crediticio` DISABLE KEYS */;
INSERT INTO `historial_crediticio` VALUES (1,1,693,2,0,38,272405.20,'2026-06-25'),(2,2,625,2,1,60,123869.30,'2026-02-27'),(3,3,745,2,0,0,53843.57,'2026-08-19'),(4,4,747,0,0,37,0.00,'2026-08-18'),(5,5,743,0,0,0,0.00,'2026-02-13'),(6,6,743,0,0,2,0.00,'2026-02-25'),(7,7,729,4,0,22,227972.61,'2026-08-08'),(8,8,771,2,0,0,137609.79,'2026-06-14'),(9,9,724,0,0,29,0.00,'2026-02-19'),(10,10,742,3,0,0,244101.85,'2026-04-13'),(11,11,744,0,0,19,0.00,'2026-06-09'),(12,12,663,3,1,46,385286.07,'2026-03-17'),(13,13,696,0,0,38,0.00,'2026-03-15'),(14,14,558,3,1,104,206749.31,'2026-01-08'),(15,15,792,1,0,11,51831.43,'2026-06-03'),(16,16,801,2,0,14,239980.75,'2026-02-15'),(17,17,799,4,0,0,499175.12,'2026-01-28'),(18,18,772,1,0,4,29568.38,'2026-02-09'),(19,19,796,1,0,3,135448.63,'2026-02-23'),(20,20,756,4,0,38,192898.19,'2026-01-18'),(21,21,751,2,0,0,97540.94,'2026-01-14'),(22,22,819,3,0,0,121997.22,'2026-04-06'),(23,23,739,4,0,26,571653.33,'2026-03-15'),(24,24,756,0,0,0,0.00,'2026-04-27'),(25,25,568,3,1,88,120944.11,'2026-02-05'),(26,26,588,0,1,90,0.00,'2026-07-22'),(27,27,807,4,0,6,82674.45,'2026-05-08'),(28,28,778,0,0,0,0.00,'2026-03-10'),(29,29,762,4,0,0,434934.85,'2026-02-08'),(30,30,605,3,1,78,409376.88,'2026-08-04'),(31,31,730,0,0,20,0.00,'2026-07-09'),(32,32,759,0,0,0,0.00,'2026-07-21'),(33,33,769,0,0,0,0.00,'2026-06-15'),(34,34,627,0,1,57,0.00,'2026-05-09'),(35,35,512,3,2,61,381661.89,'2026-03-04'),(36,36,777,4,0,0,433986.00,'2026-07-08'),(37,37,789,2,0,0,68626.06,'2026-06-21'),(38,38,781,4,0,20,345417.79,'2026-07-23'),(39,39,740,2,0,16,165202.34,'2026-01-24'),(40,40,585,4,2,22,412430.78,'2026-03-15'),(41,41,723,3,0,40,335139.53,'2026-06-18'),(42,42,606,2,1,89,259993.59,'2026-05-26'),(43,43,757,4,0,23,339083.55,'2026-01-14'),(44,44,738,4,0,24,356080.48,'2026-07-12'),(45,45,802,0,0,0,0.00,'2026-07-16'),(46,46,743,1,0,0,87259.16,'2026-02-04'),(47,47,784,1,0,0,98762.07,'2026-02-14'),(48,48,739,1,0,7,114743.89,'2026-03-15'),(49,49,764,3,0,0,387062.02,'2026-08-11'),(50,50,770,4,0,0,147894.26,'2026-08-28');
/*!40000 ALTER TABLE `historial_crediticio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud_credito`
--

DROP TABLE IF EXISTS `solicitud_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitud_credito` (
  `ID_Solicitud` int NOT NULL AUTO_INCREMENT,
  `ID_Cliente` int NOT NULL,
  `Fecha_Solicitud` date NOT NULL,
  `Tipo_Producto` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Monto_Solicitado` decimal(12,2) NOT NULL,
  `Plazo_Solicitado_Meses` int NOT NULL,
  `Canal_Solicitud` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Estado_Solicitud` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Recibida',
  PRIMARY KEY (`ID_Solicitud`),
  KEY `idx_solicitud_cliente` (`ID_Cliente`),
  CONSTRAINT `fk_solicitud_cliente` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID_Cliente`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `solicitud_credito_chk_1` CHECK ((`Monto_Solicitado` > 0)),
  CONSTRAINT `solicitud_credito_chk_2` CHECK ((`Plazo_Solicitado_Meses` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=500061 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud_credito`
--

LOCK TABLES `solicitud_credito` WRITE;
/*!40000 ALTER TABLE `solicitud_credito` DISABLE KEYS */;
INSERT INTO `solicitud_credito` VALUES (500001,7,'2026-07-25','Préstamo de vehículo',373072.44,84,'Call center','Procesada'),(500002,5,'2026-08-16','Préstamo personal',196063.48,48,'Sucursal','Procesada'),(500003,4,'2026-07-06','Tarjeta de crédito',120648.64,36,'Agente externo','Procesada'),(500004,34,'2026-04-14','Préstamo personal',159528.23,18,'Sucursal','Procesada'),(500005,10,'2026-05-09','Tarjeta de crédito',144672.41,24,'Banca en línea','Procesada'),(500006,49,'2026-02-14','Préstamo personal',243810.77,240,'Banca en línea','Procesada'),(500007,21,'2026-07-28','Préstamo comercial',2186860.97,36,'App móvil','Procesada'),(500008,48,'2026-03-17','Tarjeta de crédito',56754.67,120,'Agente externo','Procesada'),(500009,17,'2026-08-10','Tarjeta de crédito',136845.64,36,'App móvil','Procesada'),(500010,46,'2026-08-06','Préstamo hipotecario',5462707.21,36,'Banca en línea','Procesada'),(500011,20,'2026-02-28','Préstamo comercial',729965.13,24,'Agente externo','Procesada'),(500012,39,'2026-06-23','Préstamo hipotecario',4976827.66,12,'Banca en línea','Procesada'),(500013,26,'2026-07-20','Tarjeta de crédito',115440.14,12,'Banca en línea','Procesada'),(500014,28,'2026-08-19','Préstamo hipotecario',4088632.70,48,'Sucursal','Procesada'),(500015,49,'2026-06-13','Préstamo hipotecario',5337131.81,84,'Sucursal','Procesada'),(500016,24,'2026-07-15','Préstamo personal',253180.24,36,'Agente externo','Procesada'),(500017,35,'2026-01-04','Préstamo hipotecario',3317830.59,60,'Banca en línea','Procesada'),(500018,46,'2026-05-01','Préstamo de vehículo',544682.30,12,'App móvil','Procesada'),(500019,12,'2026-01-23','Préstamo hipotecario',6136804.93,240,'Agente externo','Procesada'),(500020,30,'2026-02-22','Préstamo comercial',1410914.05,240,'Sucursal','Procesada'),(500021,19,'2026-03-04','Tarjeta de crédito',52848.01,12,'Sucursal','Procesada'),(500022,5,'2026-07-02','Préstamo de vehículo',845091.22,120,'Sucursal','Procesada'),(500023,49,'2026-05-14','Préstamo hipotecario',4017776.49,84,'App móvil','Procesada'),(500024,4,'2026-07-10','Préstamo de vehículo',611102.76,120,'App móvil','Procesada'),(500025,39,'2026-07-23','Préstamo personal',55349.04,240,'Call center','Procesada'),(500026,31,'2026-08-21','Préstamo de vehículo',1308972.43,36,'Sucursal','Procesada'),(500027,9,'2026-07-07','Préstamo hipotecario',6294790.27,84,'Agente externo','Procesada'),(500028,40,'2026-03-07','Préstamo hipotecario',1791679.86,36,'Sucursal','Procesada'),(500029,7,'2026-04-15','Tarjeta de crédito',27714.82,60,'Sucursal','Procesada'),(500030,1,'2026-06-19','Préstamo personal',132286.42,24,'App móvil','Procesada'),(500031,22,'2026-05-03','Préstamo hipotecario',3918728.87,12,'Agente externo','Procesada'),(500032,5,'2026-04-15','Préstamo comercial',967144.65,18,'App móvil','Procesada'),(500033,10,'2026-04-18','Préstamo hipotecario',4725489.39,60,'Banca en línea','Procesada'),(500034,38,'2026-08-12','Préstamo de vehículo',503347.51,18,'Banca en línea','Procesada'),(500035,31,'2026-02-21','Préstamo comercial',467951.76,36,'Agente externo','Procesada'),(500036,4,'2026-06-28','Préstamo de vehículo',1220371.84,84,'Sucursal','Procesada'),(500037,20,'2026-03-09','Tarjeta de crédito',79778.84,12,'App móvil','Procesada'),(500038,20,'2026-02-09','Tarjeta de crédito',26853.86,48,'Banca en línea','Procesada'),(500039,20,'2026-03-23','Préstamo personal',372607.56,36,'Call center','Procesada'),(500040,6,'2026-04-21','Préstamo de vehículo',1515139.15,6,'Sucursal','Procesada'),(500041,21,'2026-04-01','Préstamo hipotecario',1425167.65,84,'Agente externo','Procesada'),(500042,27,'2026-06-18','Préstamo comercial',664368.08,48,'Agente externo','Procesada'),(500043,46,'2026-08-22','Tarjeta de crédito',128843.56,6,'Banca en línea','Procesada'),(500044,24,'2026-04-18','Préstamo hipotecario',4007091.25,120,'Banca en línea','Procesada'),(500045,26,'2026-02-21','Préstamo personal',190352.40,6,'Agente externo','Procesada'),(500046,3,'2026-08-05','Tarjeta de crédito',81567.16,48,'Sucursal','Procesada'),(500047,17,'2026-02-08','Tarjeta de crédito',52217.09,24,'Banca en línea','Procesada'),(500048,14,'2026-08-22','Préstamo personal',74865.52,120,'Call center','Procesada'),(500049,23,'2026-03-13','Préstamo de vehículo',1349626.90,240,'Banca en línea','Procesada'),(500050,12,'2026-05-25','Tarjeta de crédito',62214.59,60,'Agente externo','Procesada'),(500051,28,'2026-04-03','Tarjeta de crédito',77024.30,48,'App móvil','Procesada'),(500052,39,'2026-08-09','Préstamo hipotecario',6379235.54,24,'Banca en línea','Procesada'),(500053,36,'2026-02-28','Préstamo de vehículo',1248573.55,18,'Sucursal','Procesada'),(500054,30,'2026-03-08','Préstamo de vehículo',1506271.97,240,'Call center','Procesada'),(500055,30,'2026-08-02','Préstamo hipotecario',5685006.88,36,'Sucursal','Procesada'),(500056,41,'2026-01-09','Tarjeta de crédito',70462.90,12,'Call center','Procesada'),(500057,34,'2026-07-24','Préstamo hipotecario',3245969.75,12,'Banca en línea','Procesada'),(500058,8,'2026-01-17','Préstamo de vehículo',583644.70,48,'Agente externo','Procesada'),(500059,21,'2026-04-09','Préstamo comercial',1732479.41,6,'Banca en línea','Procesada'),(500060,11,'2026-05-25','Tarjeta de crédito',60942.90,120,'Sucursal','Procesada');
/*!40000 ALTER TABLE `solicitud_credito` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-21 13:28:36
