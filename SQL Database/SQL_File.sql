-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: LIBRARY_MANAGEMENT
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `Book_Id` varchar(4) NOT NULL,
  `Book_Name` varchar(30) NOT NULL,
  `Author` varchar(20) NOT NULL,
  `Language` varchar(20) NOT NULL,
  `Category` varchar(20) NOT NULL,
  `Quantity` decimal(2,0) NOT NULL,
  PRIMARY KEY (`Book_Id`),
  UNIQUE KEY `Book_Name` (`Book_Name`),
  CONSTRAINT `book_chk_1` CHECK ((cast(`Book_Id` as char charset binary) like _utf8mb4'B_%')),
  CONSTRAINT `book_chk_2` CHECK ((`Book_Name` <> _utf8mb4'')),
  CONSTRAINT `book_chk_3` CHECK ((`Author` <> _utf8mb4'')),
  CONSTRAINT `book_chk_4` CHECK ((`Language` <> _utf8mb4'')),
  CONSTRAINT `book_chk_5` CHECK ((`Category` <> _utf8mb4''))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES ('B0','Great Gatsby','F. Scott Fitzgerald','English','Fiction',25),('B1','Moby Dick','Herman Melville','English','Fiction',20),('B10','The Alchemist','Paulo Coelho','English','Philosophy',23),('B11','The Art of War','Sun Tzu','English','Philosophy',18),('B12','Think and Grow Rich','Napoleon Hill','English','Self-Help',22),('B13','Sapiens','Yuval Noah Harari','English','History',20),('B14','Cosmos','Carl Sagan','English','Science',30),('B15','The Grand Design','Stephen Hawking','English','Science',25),('B16','The Lean Startup','Eric Ries','English','Business',28),('B17','Rich Dad Poor Dad','Robert Kiyosaki','English','Business',22),('B18','The Innovator’s Dilemma','Clayton Christensen','English','Business',20),('B2','Pride and Prejudice','Jane Austen','English','Fiction',18),('B3','To Kill a Mockingbird','Harper Lee','English','Fiction',22),('B4','1984','George Orwell','English','Fiction',30),('B5','The Catcher in the Rye','J.D. Salinger','English','Fiction',15),('B6','War and Peace','Leo Tolstoy','English','Fiction',12),('B7','The Hobbit','J.R.R. Tolkien','English','Fantasy',28),('B8','Harry Potter','J.K. Rowling','English','Fantasy',34),('B9','Lord of the Rings','J.R.R. Tolkien','English','Fantasy',40);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Book_Inc` AFTER INSERT ON `book` FOR EACH ROW BEGIN
 UPDATE Counter
	SET Book_Counter = Book_Counter + 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `borrow`
--

DROP TABLE IF EXISTS `borrow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrow` (
  `User_Id` varchar(4) NOT NULL,
  `Book_Id` varchar(4) NOT NULL,
  `Issue_Date` date NOT NULL,
  `Return_Date` date NOT NULL,
  `Charges` decimal(4,0) NOT NULL DEFAULT '0',
  KEY `Book_Id` (`Book_Id`),
  KEY `User_Id` (`User_Id`),
  CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`Book_Id`) REFERENCES `book` (`Book_Id`),
  CONSTRAINT `borrow_ibfk_2` FOREIGN KEY (`User_Id`) REFERENCES `user` (`User_Id`),
  CONSTRAINT `borrow_chk_1` CHECK ((`Charges` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrow`
--

LOCK TABLES `borrow` WRITE;
/*!40000 ALTER TABLE `borrow` DISABLE KEYS */;
INSERT INTO `borrow` VALUES ('U5','B8','2023-10-05','2023-10-15',460),('U5','B17','2023-10-15','2023-10-30',310),('U5','B10','2023-10-05','2023-10-15',460);
/*!40000 ALTER TABLE `borrow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counter`
--

DROP TABLE IF EXISTS `counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `counter` (
  `User_Counter` decimal(3,0) NOT NULL,
  `Book_Counter` decimal(3,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counter`
--

LOCK TABLES `counter` WRITE;
/*!40000 ALTER TABLE `counter` DISABLE KEYS */;
INSERT INTO `counter` VALUES (11,19);
/*!40000 ALTER TABLE `counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credentials`
--

DROP TABLE IF EXISTS `credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credentials` (
  `User_Id` varchar(4) NOT NULL,
  `Pass` text NOT NULL,
  KEY `User_Id` (`User_Id`),
  CONSTRAINT `credentials_ibfk_1` FOREIGN KEY (`User_Id`) REFERENCES `user` (`User_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credentials`
--

LOCK TABLES `credentials` WRITE;
/*!40000 ALTER TABLE `credentials` DISABLE KEYS */;
INSERT INTO `credentials` VALUES ('U1','Admin'),('U5','Execute'),('U9','Nimesh');
/*!40000 ALTER TABLE `credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_details`
--

DROP TABLE IF EXISTS `personal_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_details` (
  `User_Id` varchar(4) NOT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `Contact_No` char(10) NOT NULL,
  `City` varchar(15) NOT NULL,
  UNIQUE KEY `Name` (`Name`),
  KEY `User_Id` (`User_Id`),
  CONSTRAINT `personal_details_ibfk_1` FOREIGN KEY (`User_Id`) REFERENCES `user` (`User_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_details`
--

LOCK TABLES `personal_details` WRITE;
/*!40000 ALTER TABLE `personal_details` DISABLE KEYS */;
INSERT INTO `personal_details` VALUES ('U1','Admin','1234567890','City'),('U5','Execute','1234567890','A\'bad'),('U9','Nimesh','1111111111','Surat');
/*!40000 ALTER TABLE `personal_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `premium`
--

DROP TABLE IF EXISTS `premium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `premium` (
  `User_Id` varchar(4) NOT NULL,
  `Validity` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `premium`
--

LOCK TABLES `premium` WRITE;
/*!40000 ALTER TABLE `premium` DISABLE KEYS */;
INSERT INTO `premium` VALUES ('U1',NULL),('U5','2023-12-29');
/*!40000 ALTER TABLE `premium` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `User_Id` varchar(4) NOT NULL,
  `Premium_Mem` tinyint(1) NOT NULL,
  `Books_Borrowed` decimal(1,0) NOT NULL,
  PRIMARY KEY (`User_Id`),
  CONSTRAINT `user_chk_1` CHECK ((cast(`User_Id` as char charset binary) like _utf8mb4'U_%')),
  CONSTRAINT `user_chk_2` CHECK ((`Books_Borrowed` > -(1)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('U1',1,0),('U5',1,3),('U9',0,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `User_Inc` AFTER INSERT ON `user` FOR EACH ROW BEGIN
 UPDATE Counter
	SET User_Counter = User_Counter + 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'LIBRARY_MANAGEMENT'
--
/*!50003 DROP FUNCTION IF EXISTS `Authenticate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Authenticate`( Uid VARCHAR(4) , UName VARCHAR(30) , UPass TEXT ) RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	IF Search_User(Uid,UName) = False THEN
		RETURN "User Doesn\'t Exists !";
    END IF;
	IF ( SELECT 1 FROM Credentials NATURAL JOIN Personal_Details WHERE (User_Id = Uid OR Name = UName)AND Pass = UPass) THEN
		RETURN "Login Successful !";
	END IF;
	RETURN "Incorrect Credentials !";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Book_Avai` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Book_Avai`(Bid VARCHAR(4) , BName VARCHAR(30) ) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
	IF ( (SELECT Quantity FROM Book WHERE Book_Id = Bid OR Book_Name = BName) > 0 ) THEN
		RETURN True;
	END IF;
	RETURN False;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Borrow_Limit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Borrow_Limit`(Uid VARCHAR(4), UName VARCHAR(30)) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
    DECLARE borrowedCount INT;
    DECLARE premiumStatus INT;

    SET borrowedCount = (SELECT Books_Borrowed FROM User NATURAL JOIN Personal_Details WHERE User_Id = Uid OR Name = UName);

    SET premiumStatus = (SELECT isPremium(Uid, UName));

    IF borrowedCount < 3 AND premiumStatus = 0 THEN
        RETURN TRUE;
    ELSEIF borrowedCount < 5 AND premiumStatus = 1 THEN
        RETURN TRUE;
    END IF;
        RETURN FALSE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Cancel_Premium` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Cancel_Premium`( Uid VARCHAR(4) , UName VARCHAR(30)) RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE Uide VARCHAR(4);

    IF (SELECT Premium_Mem FROM User NATURAL JOIN Personal_Details WHERE User_Id = Uid OR Name = UName) = False THEN
		RETURN "Premium Membership Doesn\'t Exists";
    END IF;

    IF Uid = "" THEN
		SET Uide = (SELECT User_Id FROM User NATURAL JOIN Personal_Details WHERE Name = UName);
    END IF;
    
	UPDATE User
    SET Premium_Mem = False
    WHERE User_Id IN (Uid,Uide);
    
    DELETE
    FROM Premium
    WHERE User_Id IN (Uid,Uide);
    
    RETURN "Premium Membership Cancelled";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Create_User` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Create_User`( Name VARCHAR(30) , Pass TEXT , Contact CHAR(10) , City VARCHAR(15) , Premium_Mem BOOLEAN) RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE c NUMERIC(3,0) ;
    DECLARE Uid VARCHAR(4);
	SET c = (SELECT User_Counter FROM Counter);
    
    IF Dupli_User(Name) = 1 THEN
		RETURN "User already exists";
	END IF;
    
    SET Uid = CONCAT ( "U" , c ) ;
    
    INSERT INTO User
	VALUE
	( Uid , Premium_Mem , 0 ) ;

	INSERT INTO Personal_Details
	VALUE
	( Uid , Name , Contact , City) ;

	INSERT INTO Credentials
	VALUE
	( Uid , Pass );
    
    IF Premium_Mem = True THEN
		INSERT INTO Premium
        VALUE
        ( Uid , DATE (CURDATE() + INTERVAL(29) DAY) );
    END IF;
	
    RETURN CONCAT("User Registered Successfully & User Id is ",Uid);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Delete_User` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Delete_User`(Uid VARCHAR(4), UName VARCHAR(30) , UPass TEXT) RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE userExists INT;
    DECLARE booksBorrowed INT;    
    
    SET userExists = Search_User(Uid , UName) ;
    SET booksBorrowed = (SELECT Books_Borrowed FROM User NATURAL JOIN Personal_Details WHERE User_Id = Uid OR Name = UName);

    IF userExists = 0 THEN
        RETURN "User Doesn't Exist";
    ELSEIF booksBorrowed > 0 THEN
        RETURN "User should return all the books before deletion";
   ELSEIF Uid IS NULL OR Uid = "" THEN
		SET Uid = (SELECT User_Id FROM User NATURAL JOIN Personal_Details WHERE Name = UName);
   END IF;

	DELETE FROM Personal_Details WHERE User_Id = Uid;
	DELETE FROM Credentials WHERE User_Id = Uid;
	DELETE FROM User WHERE User_Id = Uid;
	DELETE FROM Premium WHERE User_Id = Uid;

	RETURN "User Successfully Deleted";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Dupli_Book` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Dupli_Book`( BName VARCHAR(30) ) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
	IF EXISTS (SELECT 1 FROM Book WHERE Book_Name = BName ) THEN
		RETURN True;
	END IF ;
RETURN False;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Dupli_User` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Dupli_User`(UName VARCHAR(30) ) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
	IF (SELECT 1 FROM Personal_Details WHERE Name = UName ) THEN
		RETURN True;
	END IF ;
RETURN FALSE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Get_Premium` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Get_Premium`( Uid VARCHAR(4) ,  UName VARCHAR(30) ) RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE Uide VARCHAR(4);
    
    IF (SELECT Premium_Mem FROM User NATURAL JOIN Personal_Details WHERE User_Id = Uid OR Name = UName) THEN
		RETURN "Premium Membership Already Exists";
    END IF;
    
    IF Uid = "" THEN
		SET Uide = (SELECT User_Id FROM User NATURAL JOIN Personal_Details WHERE Name = UName);
		INSERT INTO Premium
		VALUE
		(Uide,DATE(CURDATE() + INTERVAL (29) DAY));
	ELSE
		INSERT INTO Premium
		VALUE
		(Uid,DATE(CURDATE() + INTERVAL (29) DAY));
    END IF;
	
	UPDATE User
	SET Premium_Mem = True
	WHERE User_Id IN (Uid,Uide);
    
    RETURN "Premium Membership Successful";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `isPremium` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `isPremium`(Uid VARCHAR(4) , UName VARCHAR(30) ) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
	IF ( (SELECT Premium_Mem FROM User NATURAL JOIN Personal_Details WHERE User_Id = Uid OR Name = UName) = 0 ) THEN
		RETURN False;
	END IF;
	RETURN True;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Request_Book` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Request_Book`(Bid VARCHAR(4), BName VARCHAR(30), Uid VARCHAR(4) , UName VARCHAR(30)) RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE bookExists INT;
    DECLARE isAvailable INT;
    DECLARE borrowLimit BOOLEAN;
    DECLARE temp INT;
    DECLARE userHoldsBook BOOLEAN;
    

    SET bookExists = Search_Book(Bid, BName);
    SET isAvailable = Book_Avai(Bid, BName);
    SET borrowLimit = Borrow_Limit(Uid, UName);

    IF bookExists = 0 THEN
        RETURN "Book doesn't exist";
    ELSEIF isAvailable = 0 THEN
        RETURN "Book isn't available this moment";
    ELSEIF borrowLimit = FALSE THEN
        RETURN "User's Borrow Limit Reached";
	END IF;
    
    IF Uid IS NULL OR Uid ="" THEN
		SET Uid = (SELECT User_Id FROM User NATURAL JOIN Personal_Details WHERE Name = UName) ;
	END IF;
    IF Bid IS NULL OR Bid = "" THEN
		SET Bid = (SELECT Book_Id FROM Book WHERE Book_Name = BName) ;
    END IF;
    
    SET userHoldsBook = User_Holds_Book(Uid,Bid);
    
    IF userHoldsBook = 1 THEN
		RETURN "User can\'t borrow the same book again" ;
	END IF;
    
    IF User_Has_Penalties(Uid,Bid) = 1 THEN
		RETURN "User has penalties";
    END IF;
    
        UPDATE Book
        SET Quantity = Quantity - 1
        WHERE Book_Id = Bid;

        UPDATE User
        SET Books_Borrowed = Books_Borrowed + 1
        WHERE User_Id = Uid;

        IF isPremium(Uid, UName) = 0 THEN
            SET temp = 10;
        ELSE
            SET temp = 15;
        END IF;

        INSERT INTO Borrow
        VALUES (Uid, Bid, NOW(), DATE_ADD(NOW(), INTERVAL temp DAY), 0);

        RETURN "Book Requested Successfully";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Return_Book` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Return_Book`(Bid VARCHAR(4) , BName VARCHAR(30) , Uid VARCHAR(4) , UName VARCHAR(30)) RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE returnLimit INT ;
    DECLARE userHoldsBook INT ;
	DECLARE searchBook INT ;
    
    SET returnLimit = Return_Limit(Uid,UName);
    
    IF returnLimit = 0 THEN
		RETURN "There isn\'t any book to return";
    ELSEIF searchBook = 0 THEN
		RETURN "Book isn\'t present in library" ;
    END IF;
    IF Uid IS NULL OR Uid ="" THEN
		SET Uid = (SELECT User_Id FROM User NATURAL JOIN Personal_Details WHERE Name = UName) ;
	END IF;
    IF Bid IS NULL OR Bid ="" THEN
		SET Bid = (SELECT Book_Id FROM Book WHERE Book_Name = BName) ;
    END IF;
    
    SET userHoldsBook = User_Holds_Book(Uid,Bid);
    
    IF userHoldsBook = 0 THEN
		RETURN CONCAT("User doesn\'t holds ",BName) ;
    END IF;
    
    UPDATE User
    SET Books_Borrowed = Books_Borrowed - 1
    WHERE User_Id = Uid;
    
    UPDATE Book
    SET Quantity = Quantity + 1
    WHERE Book_Id = Bid;
    
    DELETE FROM Borrow
    WHERE User_Id = Uid
    AND Book_Id = Bid;
    
	RETURN "Book Returned Successfully" ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Return_Limit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Return_Limit`(Uid VARCHAR(4) , UName VARCHAR(30) ) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
	DECLARE Book_Borrowed INT;
	
	SET Book_Borrowed = (SELECT Books_Borrowed FROM User NATURAL JOIN Personal_Details WHERE User_Id = Uid OR Name = UName) ;
	IF Book_Borrowed = 0 THEN
		RETURN False;
	END IF;
	RETURN True;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Search_Book` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Search_Book`( Bid VARCHAR(4) , BName VARCHAR(30) ) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
	IF (SELECT 1 FROM Book WHERE Book_Id = Bid OR Book_Name = BName ) THEN
		RETURN True;
	END IF;
	RETURN False;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Search_User` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Search_User`( Uid VARCHAR(4) , UName VARCHAR(30) ) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
	IF (SELECT 1 FROM Personal_Details WHERE User_Id = Uid OR Name = UName ) THEN
		RETURN True;
	END IF;
	RETURN False;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `User_Has_Penalties` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `User_Has_Penalties`(Uid VARCHAR(4) , Bid VARCHAR(4)) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
	DECLARE charges INT;
    SET charges = (SELECT Charges FROM Borrow WHERE User_Id = Uid AND Book_Id = Bid);
    
    IF charges = 0 THEN
		RETURN FALSE;
    END IF;
    RETURN TRUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `User_Holds_Book` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `User_Holds_Book`(Uid VARCHAR(4) , Bid VARCHAR(4) ) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
    IF (SELECT 1 FROM Borrow WHERE User_Id = Uid AND Book_Id = Bid ) THEN
		RETURN True;
    END IF;
	RETURN False;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Add_Book` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_Book`(IN BName VARCHAR(30) , IN BAuth VARCHAR(20) , IN BLang VARCHAR(20) , IN BCate VARCHAR(20) , IN BQuan NUMERIC(2,0) )
BEGIN
	DECLARE C NUMERIC(3,0);
	SET C = (SELECT Book_Counter FROM Counter LIMIT 1);
	
    IF Dupli_Book(BName) = 0 THEN
		INSERT INTO Book
		VALUES
		( CONCAT ("B" , C) , BName , BAuth , BLang , BCate , BQuan) ;
	
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Display_Books_Category` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Display_Books_Category`(IN Cate VARCHAR(20))
BEGIN
	SELECT Book_Name
    FROM Book
    WHERE Category = Cate ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Display_Books_Language` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Display_Books_Language`(IN Lang VARCHAR(20))
BEGIN
	SELECT Book_Name
    FROM Book
    WHERE Language = Lang ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Init` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Init`()
BEGIN
	CALL Premium_Deadline_Check();
    CALL Set_Charges();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Premium_Deadline_Check` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Premium_Deadline_Check`()
BEGIN
	DECLARE done INT DEFAULT 1;
    DECLARE uid VARCHAR(4);
    DECLARE vdate DATE;
    DECLARE My_Cursor CURSOR FOR SELECT User_Id , Validity FROM Premium;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 0;
    
    OPEN My_Cursor;
    
	WHILE done DO
		FETCH My_Cursor INTO uid , vdate;
        IF DATEDIFF(vdate , CURDATE()) < 0 THEN
			DELETE
            FROM Premium
            WHERE User_id = uid;
            
            UPDATE User
            SET Premium_Mem = 0
            WHERE User_Id = Uid;
        END IF;
    END WHILE;
    
    CLOSE My_Cursor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Set_Charges` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Set_Charges`()
BEGIN
    DECLARE done INT DEFAULT 1;
    DECLARE days INT;
    DECLARE uid VARCHAR(4);
    DECLARE bid VARCHAR(4);
    DECLARE rdate DATE;
    DECLARE My_Cursor CURSOR FOR SELECT User_id , Book_Id , Return_Date FROM Borrow;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 0;

    
    OPEN My_Cursor;
    
    WHILE done
    DO
		FETCH My_Cursor INTO  uid , bid , rdate; 
        SET days = DATEDIFF( rdate , CURDATE() );
        IF days < 0 THEN
			UPDATE Borrow
            SET Charges = DATEDIFF(CURDATE() , rdate) * 10
            WHERE User_Id = Uid
            AND Book_Id = Bid;
        END IF;
	END WHILE;
	
    CLOSE My_Cursor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Users_Book` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Users_Book`(IN Uid VARCHAR(4) , IN UName VARCHAR(30) )
BEGIN
		SELECT Book_Name , Return_Date
		FROM Borrow
		NATURAL JOIN User
		NATURAL JOIN Book
		NATURAL JOIN Personal_Details
		WHERE User_Id = Uid
			OR Name = UName;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-30 21:39:25
