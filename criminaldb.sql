DROP DATABASE IF EXISTS `criminaldb`;
CREATE DATABASE `criminaldb`;
USE `criminaldb`;

DROP TABLE IF EXISTS Jails;
CREATE TABLE Jails(
    `Jail_Code`             INT(10)  NOT NULL DEFAULT '0' PRIMARY KEY,
    `Area_of_Jurisdiction`  VARCHAR(100) NOT NULL DEFAULT '',
    `Start_Date`          	DATE  NOT NULL,
    `Deleted`               TINYINT(1) NOT NULL DEFAULT 0 -- 0: Not deleted, 1: Deleted
);

DROP TABLE IF EXISTS Criminals;
CREATE TABLE Criminals(
    `Criminal_Code`     INT(10)  NOT NULL DEFAULT '0' PRIMARY KEY,
    `First_Name`        VARCHAR(45) NOT NULL DEFAULT '',
    `Last_Name`         VARCHAR(45)  NOT NULL DEFAULT '',
    `Total_Sentence`    INT(10) NOT NULL DEFAULT '0',
    `Jail_Code`         INT(10)  DEFAULT '0',
	`Deleted`           TINYINT(1) NOT NULL DEFAULT 0, -- 0: Not deleted, 1: Deleted
    FOREIGN KEY(`Jail_Code`) REFERENCES Jails(`Jail_Code`)
);

DROP TABLE IF EXISTS officers;
CREATE TABLE officers(
    `Badge_Number`      	INT(10) NOT NULL DEFAULT '0' PRIMARY KEY, 
    `First_Name`        	VARCHAR(45) NOT NULL DEFAULT '',
    `Last_Name`         	VARCHAR(45) NOT NULL DEFAULT '',
    `Jail_Code`         	INT(10) DEFAULT '0',
    `Start_Date_Current`	DATE NOT NULL,
    `Active`            	CHAR(1) NOT NULL DEFAULT '',
    `Deleted`           	TINYINT(1) NOT NULL DEFAULT 0, -- 0: Not deleted, 1: Deleted
    FOREIGN KEY(`Jail_Code`) REFERENCES Jails(`Jail_Code`)
);


DROP TABLE IF EXISTS Crimes;
CREATE TABLE Crimes(
    `Crime_Code`     INT(10)  NOT NULL DEFAULT '0' PRIMARY KEY,
    `Crime_Type`     VARCHAR(100) NOT NULL DEFAULT '',
    `Badge_Number`   INT(10),
    `Date_Committed` DATE      NOT NULL,
    `Sentence`       INT(10)  NOT NULL DEFAULT '0',
    `Criminal_Code`  INT(10)  DEFAULT '0',
    `Deleted`        TINYINT(1) NOT NULL DEFAULT 0, 
    FOREIGN KEY(`Criminal_Code`) REFERENCES criminals(`Criminal_Code`),
    FOREIGN KEY(`Badge_Number`) REFERENCES officers(`Badge_Number`) 
);

DROP TABLE IF EXISTS officer_station_history;
CREATE TABLE officer_station_history(
   `Badge_Number`	INT(10) NOT NULL,
   `Jail_Code` 		INT(10) NOT NULL, 
   `start_date` 	DATE NOT NULL, 
   `end_date` 		DATE NOT NULL,
   FOREIGN KEY (`Badge_Number`) REFERENCES officers (`Badge_Number`),
   FOREIGN KEY (`Jail_Code`) REFERENCES jails (`Jail_Code`)
);


DROP TABLE IF EXISTS incarceration_history;
CREATE TABLE incarceration_history(
   `Criminal_Code`	INT(10), 
   `Jail_Code`      INT(10),
   `start_date`     DATE  NOT NULL,
   `end_date`       DATE  NOT NULL, 
   `status`		   char(100) NOT NULL,
  FOREIGN KEY(Criminal_Code) REFERENCES criminals(Criminal_Code),
  FOREIGN KEY(Jail_Code) REFERENCES jails(Jail_Code)
);

INSERT INTO `Jails` VALUES
 (0, 'Manila', '1905-05-03', 0),
 (1, 'Quezon City', '2007-12-04', 0),
 (2, 'Zamboanga City', '1912-09-05', 0),
 (3, 'Davao', '1960-06-26', 0),
 (4, 'Caloocan City', '1932-12-11', 0),
 (5, 'Canagatan', '1967-02-09', 0),
 (6, 'Taguig City', '1975-10-09', 0),
 (7, 'Pasig City', '1958-12-05', 0),
 (8, 'Valenzuela', '1918-08-04', 0),
 (9, 'City of Paranaque', '2004-09-28', 0),
 (10, 'Bacoor', '1923-06-29', 0),
 (11, 'Tondo', '1985-11-25', 0),
 (12, 'Las Pinas City', '1905-02-10', 0),
 (13, 'Pasay City', '1980-12-03', 0),
 (14, 'Mandaluyong City', '1958-03-13', 0),
 (15, 'Sampaloc', '1996-06-18', 0),
 (16, 'Malabon', '1918-03-28', 0),
 (17, 'San Pedro', '1956-09-18', 0),
 (18, 'Navotas', '1958-01-10', 0),
 (19, 'Santa Ana', '1913-12-23', 0),
 (20, 'General Mariano Alvarez', '1919-07-14', 0),
 (21, 'Payatas', '1982-12-04', 0),
 (22, 'San Andres', '1959-01-26', 0),
 (23, 'Santa Cruz', '1906-12-11', 0),
 (24, 'San Juan', '1976-01-04', 0),
 (25, 'Poblacion', '1920-12-05', 0),
 (26, 'Santamesa', '1967-12-29', 0),
 (27, 'Rosario', '1927-12-18', 0),
 (28, 'Bagong Silangan', '1982-08-04', 0),
 (29, 'Putatan', '1992-03-27', 0),
 (30, 'Malate', '1991-06-04', 0),
 (31, 'Western Bicutan', '1999-02-24', 0),
 (32, 'Pandacan', '2000-05-16', 0),
 (33, 'Banco Filipino International Village', '1920-07-04', 0),
 (34, 'Paco', '1912-05-05', 0),
 (35, 'San Isidro', '1909-01-06', 0),
 (36, 'San Antonio', '1999-01-22', 0),
 (37, 'Pateros', '1949-11-07', 0),
 (38, 'Sucat', '1960-09-04', 0),
 (39, 'Lower Bicutan', '1977-07-18', 0),
 (40, 'Tatalon', '1984-07-31', 0),
 (41, 'Don Bosco', '1958-05-15', 0),
 (42, 'Bignay', '1957-08-01', 0),
 (43, 'Bagumbayan', '1908-11-26', 0),
 (44, 'Upper Bicutan', '1929-05-27', 0),
 (45, 'Central Signal Village', '1950-04-05', 0),
 (46, 'Marikina Heights', '2002-08-02', 0),
 (47, 'Bayanan', '1905-07-07', 0),
 (48, 'Karuhatan', '1985-04-26', 0),
 (49, 'Bel-Air', '1935-09-07', 0),
 (50, 'Pansol', '1956-03-06', 0),
 (51, 'Baclaran', '1938-03-14', 0),
 (52, 'Quiapo', '1915-03-11', 0),
 (53, 'West Rembo', '1951-02-16', 0),
 (54, 'Bagong Pag-Asa', '1923-07-18', 0),
 (55, 'Santo Nino', '1900-04-14', 0),
 (56, 'Pinyahan', '1977-04-22', 0);

INSERT INTO Criminals VALUES
 (0,'Kon','Haider',36,8,0)
,(1,'Por','Attanasova',72,5,0)
,(2,'Lorea','Moshayedi',24,2,0)
,(3,'Mockus','Diner',36,2,0)
,(4,'Raffaella','Smith',36,3,0)
,(5,'Rebecca','Alavi',36,1,0)
,(6,'Rusnakova','Schnapp',36,1,0)
,(7,'Aureo','Piccioli',24,8,0)
,(8,'Feliks','Vanderhoop',36,7,0)
,(9,'Ivana','Tassé',36,4,0)
,(10,'Levesque','Dalton',36,8,0)
,(11,'Mika','Stark',4,3,0)
,(12,'Nataliia','Biersack',96,5,0)
,(13,'Scarlett','Dints',18,6,0)
,(14,'Solomon','Earl',204,8,0)
,(15,'Carrie','Hagendorf',36,2,0)
,(16,'Forfoni','Frese',120,1,0)
,(17,'Jairo','Saurty',48,2,0)
,(18,'Milko','Duran',84,8,0)
,(19,'Riza','Fortini',24,6,0)
,(20,'Denis','Pett',120,2,0)
,(21,'Esmeralda','Bibancos',96,4,0)
,(22,'Gal','Rateau',36,4,0)
,(23,'Joyce','Tucker',18,4,0)
,(24,'Ale','Iqbal',60,5,0)
,(25,'Amdia','Sjoholm',36,6,0)
,(26,'Blythe','Knetter',9,2,0)
,(27,'Carolynn','Roderick',9,3,0)
,(28,'Moises','Cama',30,9,0)
,(29,'Rolando','Aistars',72,3,0)
,(30,'Salvador','Bogdanski',36,2,0)
,(31,'Thanassis','Brillante',36,3,0)
,(32,'Thorbjoern','Video',216,0,0)
,(33,'Jaclyn','Torres',12,8,0)
,(34,'Rosana','Rodrigues',276,6,0)
,(35,'Shrabya','Schmidt',96,2,0)
,(36,'April','Horgan',240,3,0)
,(37,'Germaine','Koloski',36,1,0)
,(38,'Paul','Schembri',36,1,0)
,(39,'Talitha','Jellins',24,4,0)
,(40,'Nisha','Hauser',36,7,0)
,(41,'Phillip','Mendoza',36,2,0)
,(42,'Alyx','Paredes',12,8,0)
,(43,'Barry','Shienbaum',24,0,0)
,(44,'Brie','Ezratty',36,6,0)
,(45,'Family','Hill',24,8,0)
,(46,'Olsen','Edment',36,6,0)
,(47,'Abogados','Doucet',18,4,0)
,(48,'Chapman','Nicholson',108,6,0)
,(49,'Delia','Alexander',36,3,0)
,(50,'Gopal','Infante',36,3,0)
,(51,'Hilario','Saleem',18,6,0)
,(52,'Wheatley','Stzoser',120,3,0)
,(53,'Cole','Dinn',297,6,0)
,(54,'Dafni','Harmon',36,4,0)
,(55,'Jenora','Cirsa',36,1,0)
,(56,'Nicolle','Ascoe',24,4,0)
,(57,'Paulin','Pope',24,2,0)
,(58,'Racquel','Issacs',84,2,0)
,(59,'Jacko','Rochdi',9,8,0)
,(60,'Lille','Marchetti',54,3,0)
,(61,'Yahir','Kundler',36,1,0)
,(62,'Cristina','Bird',312,3,0)
,(63,'Leticia','Donald',36,3,0)
,(64,'Simone','Ashbaugh',24,6,0)
,(65,'Storm','Seneca',360,2,0)
,(66,'Adar','Frazer',45,1,0)
,(67,'Frederic','Sparaco',36,5,0)
,(68,'Joan','Medina',36,3,0)
,(69,'Livingston','Boggi',36,8,0)
,(70,'Osvelia','Manrique',9,5,0)
,(71,'Camila','Mahley',4,9,0)
,(72,'Dereck','Della',36,5,0)
,(73,'Liliya','Byrne',24,5,0)
,(74,'Luc','Bali',72,8,0)
,(75,'Moral','Tanner',72,2,0)
,(76,'Nannette','Scuras',36,8,0)
,(77,'Rima','Kersten',24,7,0)
,(78,'Meaghan','Jeyapal',18,5,0)
,(79,'Sabrina','Budini',36,4,0)
,(80,'Tayler','Underwood',36,0,0)
,(81,'Xasmin','Bibr',18,6,0)
,(82,'Carly','Brown',36,5,0)
,(83,'Denise','Rincon',18,9,0)
,(84,'Krawczyk','Danielle',9,8,0)
,(85,'Lettie','Valdez',36,7,0)
,(86,'Negin','Steffens',3,8,0)
,(87,'Sabina','Krantzberg',36,6,0)
,(88,'Agathe','Becker',36,2,0)
,(89,'Brittnay','Trueman',78,6,0)
,(90,'Gwynne','Warner',45,0,0)
,(91,'Lauren','Messina',36,6,0)
,(92,'Cezar','Candlish',39,0,0)
,(93,'Fred','Collins',24,9,0)
,(94,'Jesper','Driller',60,7,0)
,(95,'Libi','Aspinwall',36,8,0)
,(96,'Rasika','Dattilo',60,6,0)
,(97,'Lila','Mondanaro',36,1,0)
,(98,'Loni','Giordanengo',36,3,0)
,(99,'Chiho','Dakhil',48,8,0)
,(100,'Madeline','Michael',12,4,0)
,(101,'Nidhi','Barber',36,0,0)
,(102,'Wilson','Greenberg',36,5,0)
,(103,'Hadar','Batey',72,1,0)
,(104,'Iana','Jennie',4,5,0)
,(105,'Mazariegos','Benidze',45,6,0)
,(106,'Phung','Espinel',36,3,0)
,(107,'Ralf','Taibi',45,4,0)
,(108,'Ruchika','Pelaes',42,7,0)
,(109,'Tata','Coehn',4,6,0)
,(110,'Vikki','Yoder',45,6,0)
,(111,'Malcolm','Monfrecola',24,5,0)
,(112,'Mayalla','Reserva',24,3,0)
,(113,'Stefani','Sminoff',96,7,0)
,(114,'Arleta','Nystrom',28,6,0)
,(115,'Brad','Javier',36,3,0)
,(116,'Candyce','Cervera',60,8,0)
,(117,'Milan','Ranegie',72,1,0)
,(118,'Bettina','Gooden',36,8,0)
,(119,'Dhia','Lola',4,0,0)
,(120,'Geri','Julian',36,9,0)
,(121,'Gretta','Karr',40,4,0)
,(122,'Leader','Favalero',18,6,0)
,(123,'Victorino','Mitchell',24,5,0)
,(124,'Aaron','Fahy',36,8,0)
,(125,'Shawn','Spa',36,3,0)
,(126,'Alexandrea','Alegria',4,5,0)
,(127,'Antonio','Siegel',180,7,0)
,(128,'Avila','Estrella',36,2,0)
,(129,'Blathnaid','Jackintell',36,0,0)
,(130,'Elaine','Genis',72,1,0)
,(131,'Jaye','Minionis',12,8,0)
,(132,'Silk','Shahinfar',36,8,0)
,(133,'Aruni','Mcdermott',24,7,0)
,(134,'Dyna','Newborne',72,6,0)
,(135,'Fani','Villanueva',9,6,0)
,(136,'Gauthieo','Passarelli',252,3,0)
,(137,'Micheal','Rothman',24,0,0)
,(138,'Pearl','Corson',72,6,0)
,(139,'Raina','Lubrenecki',24,3,0)
,(140,'Teryl','Mccarthy',96,9,0)
,(141,'Angie','Ansel',72,6,0)
,(142,'Barreau','Yam',72,8,0)
,(143,'Baruch','Chaia',36,4,0)
,(144,'Gerbert','Boncelet',48,3,0)
,(145,'Jhony','Piecuch',72,8,0)
,(146,'Maryam','Gillman',36,7,0)
,(147,'Milana','Baroni',36,4,0)
,(148,'Alayne','Menke',36,4,0)
,(149,'Isac','Julee',36,2,0)
,(150,'Maitri','Kalach',204,3,0)
,(151,'Anouk','Harrison',36,1,0)
,(152,'Dilan','Milea',18,4,0)
,(153,'Maestro','Pezzotti',36,7,0)
,(154,'Nagy','Turino',48,3,0)
,(155,'Allyn','Chinta',42,4,0)
,(156,'Beach','Traytele',36,2,0)
,(157,'Bob','Cannestra',36,2,0)
,(158,'Gabrille','Borenstein',36,4,0)
,(159,'Hilda','Hansen',45,4,0)
,(160,'Meir','Buller',9,4,0)
,(161,'Adele','Theo',30,1,0)
,(162,'Domenico','Anonymous',9,4,0)
,(163,'James','Marshall',240,4,0)
,(164,'Rossana','Bertolino',18,5,0)
,(165,'Thu','Baldasare',72,7,0)
,(166,'Debbi','O''Shea',45,5,0)
,(167,'Lotte','Hoffman',6,5,0)
,(168,'Saranel','Donovan',36,6,0)
,(169,'Sibylla','Manny',4,2,0)
,(170,'Thanh','Halcyon',6,1,0)
,(171,'Trevor','Alp',36,7,0)
,(172,'Steven','Lekach',72,7,0)
,(173,'Amanda','Dass',24,1,0)
,(174,'Crisanta','Porter',45,6,0)
,(175,'Mallorie','Irene',144,2,0)
,(176,'Yev','Hugonot',36,5,0)
,(177,'Bobby','Gracida',6,4,0)
,(178,'Chelsy','Elena',24,7,0)
,(179,'Jacques','Priecel',24,1,0)
,(180,'Jennifer','Mazariegos',36,6,0)
,(181,'Kerstens','Melissa''S',36,8,0)
,(182,'Maryu','Orca',36,7,0)
,(183,'Vagram','Bausa',36,2,0)
,(184,'Ekebil','Louis',39,2,0)
,(185,'Isidoro','Southwell',36,5,0)
,(186,'Arizona','Catona',36,8,0)
,(187,'Belgica','Bracamonte',24,6,0)
,(188,'Campos','Cullinae',240,7,0)
,(189,'Rhonda','Umhoefer',36,8,0)
,(190,'Danny','Strack',24,5,0)
,(191,'Grace','Lorena',36,0,0)
,(192,'Herman','Zaitz',36,7,0)
,(193,'Whai','Shingle',9,3,0)
,(194,'Christophe','Ellis',36,7,0)
,(195,'Katia','Eichel',36,1,0)
,(196,'Tahir','Pavan',36,7,0)
,(197,'Debbie','Herrington',36,7,0)
,(198,'Giacomo','Grifit',24,6,0)
,(199,'Kris','Romney',4,5,0)
,(200,'Meenakshi','Lange',36,3,0)
,(201,'Tydeman','Holtz',24,7,0)
,(202,'Dermot','Robertson',36,5,0)
,(203,'Ewa','Cobrarle',240,7,0)
,(204,'Giovanni','Herrerra',36,0,0)
,(205,'Patrick','Zandri',108,6,0)
,(206,'Ren','Andrea',24,5,0)
,(207,'Chinitas','Morehouse',24,1,0)
,(208,'Contenti','Birnbaum',36,4,0)
,(209,'Ginny','Ospina',96,6,0)
,(210,'Griffin','Reeser',36,8,0)
,(211,'Malone','Bedsole',9,0,0)
,(212,'Monika','Kinglake',36,4,0)
,(213,'Nedim','Italo',180,8,0)
,(214,'Piero','Romero',36,7,0)
,(215,'Briana','Mougenot',24,6,0)
,(216,'Casandra','Rallo',36,4,0)
,(217,'Cynthia','Christoph',36,3,0)
,(218,'Felicity','Thiermann',4,3,0)
,(219,'Haleh','Mylan',18,5,0)
,(220,'Hope','Ruotolo.',72,4,0)
,(221,'Kenneth','Deamoer',6,8,0)
,(222,'Marty','Milan',36,3,0)
,(223,'General','Herd',36,2,0)
,(224,'Janaina','Welch',36,1,0)
,(225,'Jennie','Kramberg',24,1,0)
,(226,'Jonas','Abito',246,2,0)
,(227,'Krystal','Falcone',36,4,0)
,(228,'Robert','Bayat',18,6,0)
,(229,'Emilio','Wayne',60,2,0)
,(230,'Lotus','Marotta',36,3,0)
,(231,'Shabon','Mutio',36,1,0)
,(232,'Willian','Claire',60,1,0)
,(233,'Adriane','Butzer',36,5,0)
,(234,'Kent','Percasky',54,1,0)
,(235,'Sitara','Levin',480,6,0)
,(236,'Amma','Quirk',18,9,0)
,(237,'Braden','Pearl',36,7,0)
,(238,'Jayesh','Pueblo',36,5,0)
,(239,'Mardian','Abaldo',36,5,0)
,(240,'Nissim','Magana',312,7,0)
,(241,'Bracelet','Escalante',24,3,0)
,(242,'Giovana','Cauchi',24,6,0)
,(243,'Britny','Beli',180,3,0)
,(244,'Iwona','Edmondson',72,3,0)
,(245,'Kane','Badillo',48,5,0)
,(246,'Nicolaios','Macneille',24,1,0)
,(247,'Prof','Gaedke',60,8,0)
,(248,'Zuzana','Steen',18,0,0)
,(249,'Cintia','Decamp',24,9,0)
,(250,'Coby','Sloofman',36,8,0)
,(251,'Gizelle','Schwegel',54,4,0)
,(252,'Grazia','Palma',73,1,0)
,(253,'Arianna','Mr.',240,5,0)
,(254,'Corinne','Boundy',36,1,0)
,(255,'Emery','Tbd',12,6,0)
,(256,'Gali','Pickett',36,3,0)
,(257,'Jimena','Rosas',12,8,0)
,(258,'Kimmi','Giangrasso',60,3,0)
,(259,'Lucina','Todd',24,6,0)
,(260,'Robb','Guérette',24,0,0)
,(261,'Ahmed','Quiñones',72,6,0)
,(262,'Girish','Kramm',36,5,0)
,(263,'Lea','Besancon',180,4,0)
,(264,'Nola','Klopp',36,3,0)
,(265,'Dray','Mccafferty',204,3,0)
,(266,'Lorena','Bayardo',24,1,0)
,(267,'Sybille','Denise',72,7,0)
,(268,'Vahe','Benitez',36,7,0)
,(269,'William','Tomasovich',12,7,0)
,(270,'Canosa','Jefaza',72,8,0)
,(271,'Carling','Mkay',60,7,0)
,(272,'Greissy','Erika',204,6,0)
,(273,'Breton','Jana',24,6,0)
,(274,'Caroline','Marion',24,3,0)
,(275,'Entrenadores','Rojas',72,7,0)
,(276,'Indigo','Alper',36,7,0)
,(277,'Kavuzlu','Gardner',36,8,0)
,(278,'Key','Toone',72,5,0)
,(279,'Marine','Veson',24,6,0)
,(280,'Reserved','Kassamani',4,4,0)
,(281,'Alessandro','Brambah',24,8,0)
,(282,'Courtney','Coco',4,5,0)
,(283,'Felice','Kemp',36,9,0)
,(284,'Fernando','Canto',36,1,0)
,(285,'Puja','Risser',36,7,0)
,(286,'Zach','Boyd',36,4,0)
,(287,'Alida','Bellinger',27,2,0)
,(288,'Basia','Brandon',36,5,0)
,(289,'Flora','Munoz',36,2,0)
,(290,'Sue','Elizabeth',36,7,0)
,(291,'Bellin','Charge',36,6,0)
,(292,'Kaiden','Shepley',36,0,0)
,(293,'Luka','Melissa',36,5,0)
,(294,'Mert','Misener',96,3,0)
,(295,'Stanley','Elaine',72,6,0)
,(296,'Joe','Bukhari',72,4,0)
,(297,'Macarena','Lean',180,4,0)
,(298,'Selin','Kravchenko',240,0,0)
,(299,'Holly','Conner',36,8,0)
,(300,'Jessie','Bloqueo',6,7,0)
,(301,'Ma.','Friadnar',36,7,0)
,(302,'Mads','Huot',240,3,0)
,(303,'Sebastien','Olivera',36,4,0)
,(304,'Annalee','Guide',45,1,0)
,(305,'Borka','Schneider',36,6,0)
,(306,'Fahamu','Perez',36,3,0)
,(307,'Genaoveva','Finiochetti',36,2,0)
,(308,'Heidy','Kelleher',180,2,0)
,(309,'Ducros','Passalacqua',36,6,0)
,(310,'Maya','Hovananian',84,9,0)
,(311,'Suraj','Xieveria',36,0,0)
,(312,'Tiffany','Monroy',36,2,0)
,(313,'Blockeado','Leonard',276,5,0)
,(314,'Gill','Bowen',72,3,0)
,(315,'Nikolaos','Geissler',36,2,0)
,(316,'Aleshia','Owens',72,6,0)
,(317,'Clases','Rhoades',72,6,0)
,(318,'Fellahi','Stuart',36,7,0)
,(319,'Lauber','Borson',36,9,0)
,(320,'Alma','Silveira',72,5,0)
,(321,'Annie','Agin',36,8,0)
,(322,'Doreen','Alex',24,0,0)
,(323,'Elisa','Kaye',108,8,0)
,(324,'Montse','Truscott',36,5,0)
,(325,'Orry','Andrews',36,1,0)
,(326,'Shalane','Denglee',216,7,0)
,(327,'Beverly','Hrycyk',36,6,0)
,(328,'Keisha','Rieder',258,8,0)
,(329,'Liseth','Heggle',36,7,0)
,(330,'Manish','Gratton',60,6,0)
,(331,'João','Zohrenejad',9,5,0)
,(332,'Laurence','Mielcarek',72,7,0)
,(333,'Pernille','Maynard',36,2,0)
,(334,'Piotr','Pack',24,9,0)
,(335,'Chong','Salgado',24,2,0)
,(336,'Niko','Shanon',84,3,0)
,(337,'Tatiana','Garibay',36,5,0)
,(338,'Baili','Holme',36,4,0)
,(339,'Green','Drake',36,8,0)
,(340,'Juha','Reicherter',36,8,0)
,(341,'Labedz','Cioffi',36,0,0)
,(342,'Robinson','Connely',36,2,0)
,(343,'Roselli','Llano',36,8,0)
,(344,'Amar','Khanna',6,3,0)
,(345,'Delphine','Puley',24,1,0)
,(346,'Felix','Jen',18,8,0)
,(347,'Janeth','Montoya',45,5,0)
,(348,'Marguerite','Villaseñor',72,3,0)
,(349,'Bieta','Kristen',36,6,0)
,(350,'Cintya','Evens',36,4,0)
,(351,'Hal','Fandos',6,9,0)
,(352,'Vicente','Butcher',36,7,0)
,(353,'Candace','Arnold',18,4,0)
,(354,'Diana','Coughlin',180,2,0)
,(355,'Ingvild','Caban',24,6,0)
,(356,'Kaelin','Marchant',48,3,0)
,(357,'Lizzie','Kildrow',24,3,0)
,(358,'Beata','Benegas',6,7,0)
,(359,'Bleachclub','Olga',40,8,0)
,(360,'Fdferg','Fernandes',72,5,0)
,(361,'Graciela','Roy',36,2,0)
,(362,'Jeniffer','Heiser',54,0,0)
,(363,'Yamel','Suzuki',18,6,0)
,(364,'Cori','Ingoglia',4,4,0)
,(365,'Kennedy','Stock',24,5,0)
,(366,'Tami','Biondo',36,5,0)
,(367,'Teri','Feese',72,3,0)
,(368,'Tulip','Balazs',72,4,0)
,(369,'Vittorio','Caroline',36,6,0)
,(370,'Yin','Nottingham',48,1,0)
,(371,'Gabrielle','Benjamin',36,9,0)
,(372,'Lee','Caldwell',36,7,0)
,(373,'Sahle','Gerassimo',36,2,0)
,(374,'Aracely','Zeitoun',24,1,0)
,(375,'Daynia','Braga',96,3,0)
,(376,'Eder','Maclean',36,0,0)
,(377,'Garrick','Wade',9,1,0)
,(378,'Ilze','Berdichevskiy',54,2,0)
,(379,'Martina','Bell',40,2,0)
,(380,'Rahel','Ducong',24,5,0)
,(381,'Dennise','Akavova',90,5,0)
,(382,'Harrison','Jenkins',72,1,0)
,(383,'Shazia','Hayes',24,8,0)
,(384,'Vijay','Escudero',36,3,0)
,(385,'Adamn','Colabianchi',36,9,0)
,(386,'Kathlenn','Room',36,9,0)
,(387,'Krauskopf','Chunya',72,8,0)
,(388,'Massy','Chalmers',36,0,0)
,(389,'Tal','Streif',36,3,0)
,(390,'Fabiola','Bryant',240,3,0)
,(391,'Faris','Quintana',36,1,0)
,(392,'Julianne','Piere',6,5,0)
,(393,'Jurgen','Belz',6,2,0)
,(394,'Katelyn','Booz',240,2,0)
,(395,'Kori','Mcvey',24,3,0)
,(396,'Yuval','Olguin',9,3,0)
,(397,'Kari','Choucri',4,6,0)
,(398,'Nerijus','Kaminer',36,0,0)
,(399,'Mandeep','Weinberg',9,4,0)
,(400,'Modelo','Goya',36,0,0)
,(401,'Ravi','Espinosa',120,1,0)
,(402,'Valeri','Pablo',36,4,0)
,(403,'Armonia','Boxer',18,4,0)
,(404,'Bradbury','Jean',48,3,0)
,(405,'Colin','Berse',36,6,0)
,(406,'Kallie','Opshaug',96,2,0)
,(407,'Kyle','Praeger',9,8,0)
,(408,'Remo','Grumhaus',36,5,0)
,(409,'Chica','Cutwright',36,7,0)
,(410,'Eliveg','Employee',180,8,0)
,(411,'Mckayla','Georges',36,8,0)
,(412,'Monia','Mahuad',36,7,0)
,(413,'Strom','Cole',36,1,0)
,(414,'Allesandro','Tolibas',36,2,0)
,(415,'Candince','Pereira',288,1,0)
,(416,'Graeme','Galardi',18,3,0)
,(417,'Koenig','Ait',36,6,0)
,(418,'Lyndsey','Bagheri',36,5,0)
,(419,'Ofek','Downer',180,7,0)
,(420,'Piere','Roberson',60,6,0)
,(421,'Sharon','Von',24,1,0)
,(422,'Elsie','Golitz',4,1,0)
,(423,'Kristin','Rey',3,8,0)
,(424,'Shireen','Debeer',36,5,0)
,(425,'Dee','Clabecq',24,3,0)
,(426,'Stallard','Lagreula',24,4,0)
,(427,'Sun','Klum',9,2,0)
,(428,'Class','Rierson',180,7,0)
,(429,'Instructora','Romboli',36,1,0)
,(430,'Matthew','Biros',60,6,0)
,(431,'Palpu','Ryder',24,9,0)
,(432,'Richarc','Zabel',6,7,0)
,(433,'Rubem','Monserrat',36,7,0)
,(434,'Ivona','Giugno',72,0,0)
,(435,'Alosnos','Rebecca',36,3,0)
,(436,'Bercy','Cardona',36,3,0)
,(437,'Bryan','Chris',36,1,0)
,(438,'Joyanne','Swenson',48,7,0)
,(439,'Orvin','Benesh',216,2,0)
,(440,'Carol','Bonnet',276,1,0)
,(441,'Andrea','Bruhmuller',36,6,0)
,(442,'Jessey','Cito',36,4,0)
,(443,'Libbey','Hurley',36,9,0)
,(444,'Ophira','Gina',36,3,0)
,(445,'Oswaldo','Mcgrady',36,5,0)
,(446,'Shelbey','Hau',6,4,0)
,(447,'Tulik','Walker',81,7,0)
,(448,'Asusena','Matute',18,4,0)
,(449,'Jaesoon','Flugal',9,7,0)
,(450,'Egar','Barksdale',36,7,0)
,(451,'Fredricson','Beaumont',36,9,0)
,(452,'Jody','Unter',36,1,0)
,(453,'Marjolaine','Herrera',96,4,0)
,(454,'Nitsanne','Raffan',72,1,0)
,(455,'Catherine','Neuman',24,6,0)
,(456,'Jodie','Miles',120,1,0)
,(457,'Ashley','Quesada',9,3,0)
,(458,'From','Ogilvie',48,0,0)
,(459,'Karin','Feldenkris',36,7,0)
,(460,'Kashmir','Grenfell',36,1,0)
,(461,'Eugenio','Links',9,1,0)
,(462,'Hajjar','Niedfeldt',12,2,0)
,(463,'Sr.','Claesson',36,4,0)
,(464,'Sunny','Raskin',24,3,0)
,(465,'Test','Hernández',36,8,0)
,(466,'Ceres','Hold',4,5,0)
,(467,'Javid','Myklatun',180,3,0)
,(468,'Whitnee','Albiter',72,0,0)
,(469,'Zachary','Caballero',36,0,0)
,(470,'Nalini','Perpar',72,3,0)
,(471,'Alberto','Krooke',36,4,0)
,(472,'Eran','Barbé',276,4,0)
,(473,'Melotti','Hovda',36,7,0)
,(474,'Belson','Chepe',24,0,0)
,(475,'Deena','Iversen',36,2,0)
,(476,'Jeanie','Trabado',36,3,0)
,(477,'Layne','Ewald',24,1,0)
,(478,'Mirna','Buckley',18,3,0)
,(479,'Noa','Malvarosa',72,8,0)
,(480,'Nosheen','Mccourt',36,8,0)
,(481,'Sansara','Crenshaw',240,4,0)
,(482,'Betzy','Casanova',48,4,0)
,(483,'Iker','Pastor',258,2,0)
,(484,'Kicki','Bugeau',9,4,0)
,(485,'Kimberlie','Faircloth',36,6,0)
,(486,'Marianne','Lack',36,6,0)
,(487,'Prue','Subbaraman',36,5,0)
,(488,'Rainer','Arcery',36,1,0)
,(489,'Tooner','Wren',9,6,0)
,(490,'Aden','Camara',4,5,0)
,(491,'Coleen','Gregori',36,8,0)
,(492,'Greatz','Ahaa',24,6,0)
,(493,'Zena','Steinz',24,1,0)
,(494,'Diederik','Coomber',48,5,0)
,(495,'Diego','Leal',36,7,0)
,(496,'Flor','Miller',9,2,0)
,(497,'Pima','Guffey',9,3,0)
,(498,'Florine','Colwell',36,1,0)
,(499,'Harold','Mercado',36,6,0)
,(500,'Philippe','Zacarias',36,4,0)
,(501,'Cheslea','Goodhart',36,5,0)
,(502,'Kristine','Deangelis',36,2,0)
,(503,'Morad','Rude',36,6,0)
,(504,'Stefanie','Estivalet',36,5,0)
,(505,'Eliane','Goodis',36,8,0)
,(506,'Gian','Kennyk',36,6,0)
,(507,'Tip','Cantú',240,6,0)
,(508,'Anayeli','Garibo',36,7,0)
,(509,'Charee','Naime',24,3,0)
,(510,'Doris','Harrington',36,7,0)
,(511,'Maeve','Antonio',36,9,0)
,(512,'Mellissa','Erhard',36,2,0)
,(513,'Rici','Paine',72,5,0)
,(514,'Tanner','Shumate',4,1,0)
,(515,'Teck','Morgenthau',42,0,0)
,(516,'Elisabetta','Maspes',36,5,0)
,(517,'Yoana','Schemansky',18,5,0)
,(518,'Adolfo','Toro',36,6,0)
,(519,'Alanna','Hugh',60,4,0)
,(520,'Banelly','Wells',36,2,0)
,(521,'Irina','Betsy',36,7,0)
,(522,'Caity','Folberg',96,1,0)
,(523,'Downing','Grapes',36,8,0)
,(524,'Suzannah','Nilsson',36,7,0)
,(525,'Ermicely','Monford',42,2,0)
,(526,'Pit','Backus',36,8,0)
,(527,'Bruna','Mamula',36,7,0)
,(528,'Hannah','Raoult',36,7,0)
,(529,'Manpreet','Hayhurst',36,7,0)
,(530,'Trace','Boice',180,9,0)
,(531,'Alejandro','Bowser',36,5,0)
,(532,'Anthea','David',18,3,0)
,(533,'Geckos','Vanburen',60,5,0)
,(534,'Ivin','Second',36,5,0)
,(535,'Nomi','Mccabe',240,4,0)
,(536,'Enrique','Morse',36,0,0)
,(537,'Estin','Acairol',18,6,0)
,(538,'Jana','Marzuki',36,4,0)
,(539,'Laura/Bryan','Casasola',36,2,0)
,(540,'Makuin','Jamieson',36,9,0)
,(541,'Roger','Duff',9,7,0)
,(542,'Romualdo','Klish',45,2,0)
,(543,'Thue','Cerbone',36,4,0)
,(544,'Maura','Mcdole',36,0,0)
,(545,'Osborn','Faulkner',36,8,0)
,(546,'Ryanne','Naylor',180,7,0)
,(547,'Tolin','Mawer',6,6,0)
,(548,'Demetri','Weber',36,6,0)
,(549,'Fatima','Basilio',36,5,0)
,(550,'Lomelin','Carter',36,9,0)
,(551,'Lucas','Hayward',9,6,0)
,(552,'Via','Mackenzie',36,4,0)
,(553,'Cheyenne','Samantha',36,0,0)
,(554,'Maryanne','Perlin',36,6,0)
,(555,'Ernest','Alanis',36,6,0)
,(556,'Eunhee','Troisi',36,6,0)
,(557,'Gina','Castellano',36,6,0)
,(558,'Leo','Raquel',36,3,0)
,(559,'Nahid','Silver',18,5,0)
,(560,'Owen','Grubb',6,1,0)
,(561,'Thalia','Valdivia',36,5,0)
,(562,'Ilhan','Louisa',36,7,0)
,(563,'Ishtar','Rattenbury',42,7,0)
,(564,'Juliet','Paulo',72,1,0)
,(565,'Vesi','Hindsley',36,4,0)
,(566,'Josua','Biddlecombe',36,6,0)
,(567,'Testing','Kaiser',12,0,0)
,(568,'Joana','Ahner',36,6,0)
,(569,'Katrina','Tobiasen',36,7,0)
,(570,'Linus','Marinos',18,6,0)
,(571,'Sjoerd','Viu',36,3,0)
,(572,'Vinita','Rouhani',96,3,0)
,(573,'Bowen','Valentina',27,2,0)
,(574,'Carla','Coronado',24,8,0)
,(575,'Charlene','Yun',36,6,0)
,(576,'Martinat','Chaparro',24,2,0)
,(577,'Sophia','Tavares',36,3,0)
,(578,'Claire','Keegan',96,4,0)
,(579,'Mauro','Ortquist',180,4,0)
,(580,'Alisa','Haimo',36,5,0)
,(581,'Attree','Behr',9,8,0)
,(582,'Edith','Barshan',204,4,0)
,(583,'Jaynee','Ellison',3,8,0)
,(584,'Lorraine','Nightingale',24,5,0)
,(585,'Restaurant','Saluja',24,4,0)
,(586,'Tootsie','Cristina',36,3,0)
,(587,'Moore','Ciminelli',84,8,0)
,(588,'Velina','Scholfield',36,3,0)
,(589,'Blocked','Mako',36,3,0)
,(590,'Paco','Jensen',18,8,0)
,(591,'Gert','Donde',36,5,0)
,(592,'Shigei','Millner',36,1,0)
,(593,'Zack','Samsara',72,0,0)
,(594,'Estelle','Shorr',54,6,0)
,(595,'Ferdinando','Wung',36,5,0)
,(596,'Oscar','Goergen',36,4,0)
,(597,'Yury','Massicot',6,3,0)
,(598,'Barbro','Soltero',60,7,0)
,(599,'Daniels','Tinyo',96,3,0)
,(600,'Sherri','Gold',36,6,0)
,(601,'Abbie','Rizo',6,8,0)
,(602,'Ileana','Borock',36,4,0)
,(603,'Luciana','Alama',72,4,0)
,(604,'Genesis','Laufer',9,0,0)
,(605,'Stefana','Eden',216,1,0)
,(606,'Whitney','Goodloe',36,2,0)
,(607,'Shayna','Corrales',36,4,0)
,(608,'Usiel','Tba',18,9,0)
,(609,'Leann','Claypool',36,8,0)
,(610,'Amigos','Lasting',48,2,0)
,(611,'Cara','Mccambly',18,3,0)
,(612,'Danna','Moscatelli',24,5,0)
,(613,'Heidi','Kanowsky',24,4,0)
,(614,'Kellen','Viviana',36,3,0)
,(615,'Orysia','Billingsley',48,7,0)
,(616,'Richardson','Burg',48,4,0)
,(617,'Azalea','Gaxiola',36,5,0)
,(618,'Lychota','Warat',36,8,0)
,(619,'Margit','Margron',36,8,0)
,(620,'Reem','Marimar',45,1,0)
,(621,'Caren','O''Hare',60,6,0)
,(622,'Jacylyn','Lehman',60,5,0)
,(623,'Huesped','Gastelum',9,7,0)
,(624,'Kitzberger','Stronberg',54,2,0)
,(625,'Sara','Frianela',36,3,0)
,(626,'Guillem','Vendruscolo',36,7,0)
,(627,'Martinez','Encargada',180,7,0)
,(628,'Mckenna','Carrera',3,9,0)
,(629,'Srisakuna','Ivanna',36,8,0)
,(630,'Victoria','Miner',36,3,0)
,(631,'Conrado','Perrina',24,3,0)
,(632,'Ernesto','Alvarado',72,0,0)
,(633,'Iris','Youelles',6,4,0)
,(634,'Reparacion','Lindemann',36,9,0)
,(635,'Cayetana','Assistant',18,6,0)
,(636,'Devara','Lachance',36,6,0)
,(637,'Parrish','Walter',24,9,0)
,(638,'Veida','Rimer',36,6,0)
,(639,'Consuelo','Frauen',18,8,0)
,(640,'Joleen','Mather',36,8,0)
,(641,'Roisin','Paquette',24,1,0)
,(642,'Crowley','Pulido',12,6,0)
,(643,'Faysal','Crager',36,4,0)
,(644,'Leonard','Fauvain',36,4,0)
,(645,'Carin','Eiseman',9,4,0)
,(646,'Halleh','Bailliu',36,3,0)
,(647,'Noemi','Whiteside',9,1,0)
,(648,'Servaes','Durand',18,8,0)
,(649,'Yuvi','Szablowska',24,1,0)
,(650,'Alice','Senn',96,3,0)
,(651,'Asha','Hanners',12,5,0)
,(652,'Chenin','Megan',9,4,0)
,(653,'Fisher','Berezdivin',60,1,0)
,(654,'Honor','Mejilla',60,6,0)
,(655,'Jarrod','Salinas',36,1,0)
,(656,'Nalleli','Pertler',36,1,0)
,(657,'Philip','Wright',18,0,0)
,(658,'Hocking','Elaco',180,3,0)
,(659,'Hunt','Alcapone',180,2,0)
,(660,'Kerri','Hui',36,3,0)
,(661,'Silva','Muir',36,4,0)
,(662,'Dora','Laing',36,2,0)
,(663,'Elhassan','Sowter',36,1,0)
,(664,'Layton','Olivares',36,7,0)
,(665,'Romain','Hegeler',264,6,0)
,(666,'Glynn','Anna',4,8,0)
,(667,'Irfan','Venegas',48,5,0)
,(668,'Janette','Sarlo',36,0,0)
,(669,'Rupa','Olaru',9,1,0)
,(670,'Yohara','Halenda',36,6,0)
,(671,'Yvan','Richards',36,2,0)
,(672,'Anibal','Zambrano',9,1,0)
,(673,'Dilshad','Whitehead',36,4,0)
,(674,'Liliana','Scarnatto',36,7,0)
,(675,'Nikki','Evelyn',57,2,0)
,(676,'Tasiopoulos','Carlos',36,6,0)
,(677,'Brigid','Landy',36,5,0)
,(678,'Ginger','Jagust',72,3,0)
,(679,'Jacinta','Kaminski',9,2,0)
,(680,'Jaques','Charters',24,8,0)
,(681,'Marin','Lund',36,7,0)
,(682,'Newguest','Fuller',36,5,0)
,(683,'Lorri','Norris',54,0,0)
,(684,'Mariya','Castanares',36,1,0)
,(685,'Ramchandra','Heimann',24,3,0)
,(686,'Raquel','Contador',48,5,0)
,(687,'Second','Onieal',72,7,0)
,(688,'Visitor','Josey',36,2,0)
,(689,'Daskey','Beddingfield',36,3,0)
,(690,'Gery','Jessie',36,3,0)
,(691,'Nanan','Roth',36,3,0)
,(692,'Aleta','Lacy',36,1,0)
,(693,'Lauryn','Connolly',36,1,0)
,(694,'Maryblair','Bowers',9,6,0)
,(695,'Nicolette','Madrini',54,5,0)
,(696,'Pasquale','Lefrock',6,8,0)
,(697,'Rafael','Ditomasso',66,2,0)
,(698,'Seb','Ashmore',6,1,0)
,(699,'Shar','Banks',48,1,0)
,(700,'Sokphea','Katrina',36,5,0)
,(701,'Evaristo','Pummer',72,7,0)
,(702,'Maree','Peleg',9,1,0)
,(703,'Meddings','Schwabsky',36,4,0)
,(704,'Shana','Llse',4,2,0)
,(705,'Dhana','Norris.',60,9,0)
,(706,'Ramandeep','Cuatro',36,8,0)
,(707,'Perihan','Long',36,8,0)
,(708,'Pouneh','Gulisano',18,6,0)
,(709,'Viaventure','Sandro',36,6,0)
,(710,'Vit','Nogales',36,4,0)
,(711,'Watson','Staff',60,3,0)
,(712,'Zuleica','Nourish',24,0,0)
,(713,'Erinn','Lin',24,4,0)
,(714,'Anne','Romeu',24,1,0)
,(715,'Barrow','Husar',36,2,0)
,(716,'Brenna','Vides',24,4,0)
,(717,'Jamison','Nottle',84,6,0)
,(718,'Margarita','Callaway',180,2,0)
,(719,'Saba','Dipalma',36,3,0)
,(720,'Selina','Mayotte',72,3,0)
,(721,'Shira','Heap',36,3,0)
,(722,'Bashi','Spence',48,1,0)
,(723,'Joelle','Jaffe',36,2,0)
,(724,'Maria','Butler',9,2,0)
,(725,'Spike','Baeza',36,3,0)
,(726,'Amyjo','Maksoud',36,3,0)
,(727,'Jane','Alger',36,4,0)
,(728,'Brehan','Kavanaugh',24,4,0)
,(729,'Britt','Bina',36,7,0)
,(730,'Kathalina','Kircalioglu',36,5,0)
,(731,'Omar','Ekholm',36,5,0)
,(732,'Rangel','Kravis',18,3,0)
,(733,'Retreat','Gaucher',18,6,0)
,(734,'Shanna','Staedeli',36,4,0)
,(735,'Body','Parke',18,2,0)
,(736,'Efrain','Urtiaga',36,7,0)
,(737,'Halkan','Bloggs',36,2,0)
,(738,'Kortney','Shimono',12,0,0)
,(739,'Marien','Bennoune',36,2,0)
,(740,'Freya','Mohammad',60,8,0)
,(741,'Lizet','Corona',24,8,0)
,(742,'Melissa','Welsh',108,1,0)
,(743,'Paulette','Con',240,7,0)
,(744,'Photo','Doherty',18,8,0)
,(745,'Aki','Hearn',36,7,0)
,(746,'Cloud','Galsky',72,7,0)
,(747,'Idit','Indigo',180,8,0)
,(748,'Kimberlee','Webster',36,7,0)
,(749,'Lenavitt','Wilks',24,8,0)
,(750,'Tobie','Cochrane',36,1,0)
,(751,'Warneke','Bock',24,2,0)
,(752,'Dallard','Hueber',9,2,0)
,(753,'Dar','Fitschen',36,6,0)
,(754,'Jimmy','Charles',96,6,0)
,(755,'Kotler','Callahan',76,1,0)
,(756,'Lian','Beachclub',21,5,0)
,(757,'Meg','Olan',36,7,0)
,(758,'Mikayla','Hamingway',9,6,0)
,(759,'Audrey','Sivalon',9,1,0)
,(760,'Cathleen','Trentalancia',36,4,0)
,(761,'Leini','Henriquez',36,6,0)
,(762,'Sireesha','Henley',18,4,0)
,(763,'Bahman','Girffiths',4,3,0)
,(764,'Fillipo','Portocarrero',45,4,0)
,(765,'Henrietta','Rezanour',18,1,0)
,(766,'Jamil','Kramer',36,6,0)
,(767,'Pawluk','Dimas',36,4,0)
,(768,'Seamus','Brock',84,4,0)
,(769,'Dastgiri','Boulos',36,6,0)
,(770,'Ferreyra','Carey',72,7,0)
,(771,'Jay','Zoe',36,2,0)
,(772,'Mareen','Ciconte',3,7,0)
,(773,'Morgan','Cofinas',192,0,0)
,(774,'Satin','Alan',36,1,0)
,(775,'Vainius','Dineen',36,5,0)
,(776,'Venta','Lohrer',96,4,0)
,(777,'Atsuko','Rivera',9,7,0)
,(778,'Del','Pattanyus',36,6,0)
,(779,'Ivon','Tufino',192,6,0)
,(780,'Phoebe','Bergstein',48,3,0)
,(781,'Reza','Belinda',6,3,0)
,(782,'Savanna','Peyser',108,5,0)
,(783,'Alna','Adrian',33,2,0)
,(784,'Jadyn','Thalji',120,6,0)
,(785,'Lindsay','Hudgins',36,4,0)
,(786,'Homero','Hunt',72,4,0)
,(787,'Rayco','Mccarell',54,6,0)
,(788,'Brandon','Chedikian',36,2,0)
,(789,'Hend','Lucille',36,7,0)
,(790,'Ivonne','Sanders',24,0,0)
,(791,'Lluvia','Damas',24,2,0)
,(792,'Malik','Goebl',36,8,0)
,(793,'Otilia','Powell',24,5,0)
,(794,'Richika','Johnston',72,1,0)
,(795,'Tba','Ahrens',24,6,0)
,(796,'Almadelia','Stein',24,1,0)
,(797,'Poonam','Sfakianos',36,2,0)
,(798,'Mark','Cohen',36,3,0)
,(799,'Venus','Villeneuve',249,4,0),
(800,'Patrick','Ryan',54,15,0),
(801,'Luke','Payne',85,46,0),
(802,'Daryl','Hawkins',11,36,0),
(803,'Spike','Miller',74,49,0),
(804,'Frederick','Richardson',67,20,0),
(805,'Edgar','Williams',6,51,0),
(806,'Andrew','Grant',94,13,0),
(807,'Charlie','Montgomery',28,15,0),
(808,'Charlotte','Montgomery',87,39,0),
(809,'Luke','Taylor',42,50,0),
(810,'Adrianna','Morgan',71,2,0),
(811,'Eddy','Campbell',9,10,0),
(812,'Blake','Parker',81,15,0),
(813,'Abigail','Holmes',98,25,0),
(814,'Annabella','Foster',3,30,0),
(815,'Tyler','Cooper',37,48,0),
(816,'Luke','Ellis',66,16,0),
(817,'Amy','Phillips',13,17,0),
(818,'Jordan','Johnston',79,15,0),
(819,'Amanda','Morrison',59,24,0),
(820,'Miranda','Fowler',68,31,0),
(821,'Amber','Rogers',79,0,0),
(822,'Connie','Douglas',98,0,0),
(823,'Daisy','Craig',95,49,0),
(824,'David','Foster',33,33,0),
(825,'Carlos','Ross',20,22,0),
(826,'Savana','Smith',43,0,0),
(827,'Victoria','Owens',19,40,0),
(828,'Brad','Douglas',4,49,0),
(829,'Honey','Ryan',90,23,0),
(830,'Brianna','Nelson',61,53,0),
(831,'Belinda','Perkins',88,33,0),
(832,'Abraham','Stevens',5,31,0),
(833,'Adrianna','Rogers',35,56,0),
(834,'Sienna','Carter',47,41,0),
(835,'Luke','Cooper',81,52,0),
(836,'Owen','Wright',14,52,0),
(837,'Kirsten','Lloyd',65,17,0),
(838,'Robert','Barnes',78,0,0),
(839,'Tony','Dixon',70,0,0),
(840,'Adele','Hamilton',78,47,0),
(841,'Lucas','Craig',81,38,0),
(842,'Charlotte','Cunningham',39,49,0),
(843,'Bruce','Montgomery',78,3,0),
(844,'Blake','Carter',70,25,0),
(845,'Amelia','Montgomery',50,12,0),
(846,'Paul','Ellis',15,0,0),
(847,'Frederick','Riley',53,25,0),
(848,'Adrian','Harris',87,40,0),
(849,'Lily','Rogers',21,32,0),
(850,'Maya','Craig',16,56,0),
(851,'Adele','Tucker',34,32,0),
(852,'Alisa','Ferguson',29,4,0),
(853,'Paul','Roberts',93,7,0),
(854,'Ned','Perry',73,6,0),
(855,'Clark','Morris',37,42,0),
(856,'Frederick','Ryan',23,7,0),
(857,'Ashton','Wilson',19,3,0),
(858,'Chester','Myers',50,31,0),
(859,'John','Carroll',52,47,0),
(860,'Jasmine','Anderson',28,15,0),
(861,'Edward','Smith',75,33,0),
(862,'Eleanor','Watson',88,16,0),
(863,'Mary','Bailey',87,42,0),
(864,'Jenna','Stevens',34,29,0),
(865,'Carlos','Alexander',20,8,0),
(866,'Carina','Parker',95,40,0),
(867,'Edward','Morgan',57,0,0),
(868,'George','Mason',14,20,0),
(869,'Kate','Douglas',24,12,0),
(870,'Kelsey','Richardson',63,4,0),
(871,'Julia','Nelson',24,21,0),
(872,'Jessica','Gray',23,10,0),
(873,'Garry','Martin',29,10,0),
(874,'Alfred','Nelson',93,46,0),
(875,'Sarah','Baker',23,10,0),
(876,'Adele','Thomas',20,9,0),
(877,'Melanie','Richards',67,47,0),
(878,'Brooke','Carroll',72,29,0),
(879,'Abigail','Dixon',77,9,0),
(880,'Dexter','Roberts',68,27,0),
(881,'Kate','Edwards',29,28,0),
(882,'Charlie','Ross',80,54,0),
(883,'Thomas','Bailey',7,6,0),
(884,'Alan','Morgan',69,30,0),
(885,'Alexander','Andrews',16,17,0),
(886,'Charlie','Johnston',21,13,0),
(887,'Myra','Stewart',44,11,0),
(888,'Dainton','Stewart',63,10,0),
(889,'Sophia','Myers',48,43,0),
(890,'Chelsea','Allen',40,23,0),
(891,'Ashton','Richardson',40,46,0),
(892,'Frederick','Wright',51,54,0),
(893,'Kate','Taylor',34,11,0),
(894,'Deanna','Wright',99,23,0),
(895,'Blake','Scott',55,9,0),
(896,'Daryl','Evans',10,47,0),
(897,'Aiden','Craig',94,47,0),
(898,'Edgar','Payne',60,18,0),
(899,'Lana','Perkins',69,54,0),
(900,'Alissa','Kelley',11,5,0),
(901,'Kelvin','Murray',58,24,0),
(902,'Alan','Baker',82,19,0),
(903,'Kate','Dixon',15,40,0),
(904,'Miley','Moore',61,21,0),
(905,'Heather','Cole',46,56,0),
(906,'Rubie','Fowler',41,2,0),
(907,'Sawyer','Campbell',81,28,0),
(908,'Richard','Gibson',78,18,0),
(909,'Heather','Foster',22,23,0),
(910,'Reid','Gray',72,17,0),
(911,'Anna','Casey',58,32,0),
(912,'Mary','Moore',98,14,0),
(913,'Haris','Anderson',27,2,0),
(914,'Nicole','Cameron',79,43,0),
(915,'Oscar','Elliott',42,43,0),
(916,'Belinda','Wells',19,7,0),
(917,'Amelia','Evans',7,18,0),
(918,'Vincent','Douglas',50,47,0),
(919,'Valeria','Owens',27,32,0),
(920,'Paige','Craig',83,7,0),
(921,'Lilianna','Brooks',9,5,0),
(922,'Nicholas','Ross',83,32,0),
(923,'Melanie','Mitchell',35,40,0),
(924,'Nicole','Watson',4,0,0),
(925,'John','West',88,26,0),
(926,'Fiona','Riley',34,4,0),
(927,'Fiona','Martin',63,50,0),
(928,'Amanda','Sullivan',79,13,0),
(929,'Dexter','Barnes',42,20,0),
(930,'Briony','Clark',18,37,0),
(931,'Aston','Mason',71,49,0),
(932,'Alissa','Gray',69,54,0),
(933,'Marcus','Grant',92,56,0),
(934,'Ryan','Cooper',31,42,0),
(935,'Charlotte','Smith',30,49,0),
(936,'Amy','Hill',34,50,0),
(937,'Samantha','Cooper',87,45,0),
(938,'Oscar','Adams',69,20,0),
(939,'Byron','Cunningham',12,7,0),
(940,'Luke','Carter',82,46,0),
(941,'Alen','Watson',21,56,0),
(942,'Chelsea','Miller',23,23,0),
(943,'Adrian','Wells',38,17,0),
(944,'Antony','Tucker',1,19,0),
(945,'Paige','Foster',62,11,0),
(946,'Alina','Evans',62,20,0),
(947,'Walter','Brown',44,20,0),
(948,'Chelsea','Murray',98,16,0),
(949,'Edgar','Alexander',27,48,0),
(950,'Paige','Ryan',14,46,0),
(951,'Bruce','Barrett',4,42,0),
(952,'Kimberly','Douglas',33,0,0),
(953,'Annabella','Spencer',96,29,0),
(954,'Frederick','Harris',98,9,0),
(955,'Carlos','Russell',8,45,0),
(956,'Blake','Walker',47,21,0),
(957,'Cadie','Cameron',72,3,0),
(958,'Rubie','Bailey',16,23,0),
(959,'Carl','Hawkins',79,4,0),
(960,'Belinda','Andrews',59,54,0),
(961,'Agata','Carroll',58,8,0),
(962,'Fiona','Chapman',28,3,0),
(963,'Sabrina','Miller',57,27,0),
(964,'Darcy','Howard',30,39,0),
(965,'Bruce','Jones',89,39,0),
(966,'Antony','Douglas',57,16,0),
(967,'Mike','Johnson',35,23,0),
(968,'Sienna','Baker',44,47,0),
(969,'Charlie','Ryan',38,18,0),
(970,'Sofia','Harris',44,46,0),
(971,'Miranda','Richards',85,52,0),
(972,'Rosie','Harper',39,56,0),
(973,'Paul','Miller',65,55,0),
(974,'Ted','Cameron',10,14,0),
(975,'Alen','Dixon',82,27,0),
(976,'Alen','Hunt',81,55,0),
(977,'Fenton','Evans',19,56,0),
(978,'Owen','Baker',99,22,0),
(979,'Penelope','Cole',29,10,0),
(980,'Jessica','Wilson',53,9,0),
(981,'Aida','Hall',61,25,0),
(982,'Derek','Ross',4,52,0),
(983,'Jack','Walker',21,24,0),
(984,'Naomi','Mitchell',74,39,0),
(985,'Rubie','Henderson',41,35,0),
(986,'Max','Russell',50,10,0),
(987,'Ashton','Thomas',16,56,0),
(988,'Haris','Rogers',17,53,0),
(989,'Lana','Riley',12,45,0),
(990,'Edgar','Crawford',60,24,0),
(991,'Kristian','Ellis',6,16,0),
(992,'Roman','Owens',73,24,0),
(993,'Maria','Elliott',91,9,0),
(994,'Grace','Murray',7,29,0),
(995,'Julian','Holmes',59,0,0),
(996,'Mike','Nelson',54,14,0),
(997,'Heather','Evans',73,52,0),
(998,'Carina','Perry',32,28,0),
(999,'Arianna','Moore',86,19,0),
(1000,'Sawyer','Ferguson',74,31,0),
(1001,'Alissa','Perry',56,0,0),
(1002,'Amanda','Davis',47,14,0),
(1003,'Dexter','Dixon',8,16,0),
(1004,'Chelsea','Edwards',85,42,0),
(1005,'Abraham','Tucker',96,42,0),
(1006,'Kimberly','Ferguson',34,16,0),
(1007,'Lucas','Gibson',22,55,0),
(1008,'Penelope','Perkins',52,7,0),
(1009,'Antony','Wells',68,6,0),
(1010,'Catherine','Ryan',8,11,0),
(1011,'Sienna','Clark',99,14,0),
(1012,'Adison','Andrews',37,51,0),
(1013,'Rubie','Carter',79,15,0),
(1014,'Sarah','Payne',86,10,0),
(1015,'Dexter','Wilson',82,48,0),
(1016,'Savana','Nelson',18,5,0),
(1017,'Grace','Elliott',26,55,0),
(1018,'Edith','Gibson',41,13,0),
(1019,'Lilianna','Armstrong',8,13,0),
(1020,'Alford','Hunt',66,22,0),
(1021,'William','Mitchell',70,32,0),
(1022,'Penelope','Martin',92,22,0),
(1023,'Rebecca','Baker',97,5,0),
(1024,'Arnold','Barrett',46,6,0),
(1025,'Thomas','Carter',36,32,0),
(1026,'Ned','Barrett',47,42,0),
(1027,'Rubie','Murray',57,22,0),
(1028,'Hailey','Cole',68,46,0),
(1029,'Oscar','Douglas',93,22,0),
(1030,'Kimberly','Campbell',99,46,0),
(1031,'Briony','Cooper',17,23,0),
(1032,'Cadie','Crawford',76,33,0),
(1033,'Natalie','Williams',3,44,0),
(1034,'Carina','West',21,10,0),
(1035,'Lucia','Owens',99,13,0),
(1036,'Clark','Reed',29,56,0),
(1037,'Kevin','Riley',66,45,0),
(1038,'Connie','Warren',21,37,0),
(1039,'Amelia','Stewart',89,31,0),
(1040,'Daisy','Barrett',57,13,0),
(1041,'Lucas','Grant',93,9,0),
(1042,'Violet','Dixon',61,35,0),
(1043,'Lana','Howard',86,37,0),
(1044,'Alfred','Ferguson',8,22,0),
(1045,'Natalie','Roberts',92,36,0),
(1046,'Samantha','Grant',58,48,0),
(1047,'Martin','Hawkins',6,9,0),
(1048,'Blake','Henderson',41,38,0),
(1049,'Justin','Kelly',69,1,0),
(1050,'Miley','Payne',70,38,0),
(1051,'Grace','Miller',51,38,0),
(1052,'Victoria','Nelson',66,16,0),
(1053,'Derek','Allen',92,11,0),
(1054,'Cadie','Barnes',14,54,0),
(1055,'Vanessa','Smith',18,51,0),
(1056,'Amelia','Miller',76,12,0),
(1057,'Edgar','Craig',73,11,0),
(1058,'Walter','Ross',43,38,0),
(1059,'Aiden','Martin',98,38,0),
(1060,'Clark','Davis',85,23,0),
(1061,'Caroline','Walker',82,45,0),
(1062,'Catherine','Nelson',63,1,0),
(1063,'Oliver','Harris',74,16,0),
(1064,'Alen','Brown',13,2,0),
(1065,'Aldus','Douglas',28,45,0),
(1066,'April','Harper',45,18,0),
(1067,'Jasmine','Watson',91,44,0),
(1068,'Daryl','Reed',62,31,0),
(1069,'Edwin','Barnes',58,34,0),
(1070,'Alan','Stevens',20,37,0),
(1071,'Fenton','Williams',8,7,0),
(1072,'Kelsey','Martin',86,26,0),
(1073,'Violet','Williams',32,26,0),
(1074,'Maria','Carroll',45,29,0),
(1075,'Michael','Harrison',21,54,0),
(1076,'Evelyn','Harris',20,1,0),
(1077,'Evelyn','Craig',46,33,0),
(1078,'Adrianna','Brown',91,19,0),
(1079,'Elian','Fowler',95,51,0),
(1080,'Cadie','Morris',66,25,0),
(1081,'Fenton','Cameron',95,35,0),
(1082,'Brad','Grant',12,34,0),
(1083,'Blake','Ryan',88,50,0),
(1084,'Naomi','Rogers',95,24,0),
(1085,'Sydney','Thompson',72,39,0),
(1086,'Richard','Farrell',64,31,0),
(1087,'Vincent','Martin',82,33,0),
(1088,'Paul','Holmes',85,51,0),
(1089,'Alford','Mitchell',38,36,0),
(1090,'Garry','Grant',54,40,0),
(1091,'Naomi','Craig',11,13,0),
(1092,'Martin','Kelley',85,46,0),
(1093,'Adison','Spencer',43,55,0),
(1094,'William','Robinson',7,35,0),
(1095,'Cadie','Hawkins',31,56,0),
(1096,'Harold','Stewart',85,48,0),
(1097,'Vincent','Barnes',38,8,0),
(1098,'Byron','Ellis',26,29,0),
(1099,'Chelsea','Roberts',73,14,0),
(1100,'Jordan','Hunt',11,6,0),
(1101,'Adelaide','Clark',40,56,0),
(1102,'Henry','Montgomery',45,23,0),
(1103,'Elise','Hall',90,34,0),
(1104,'Victoria','Smith',91,8,0),
(1105,'Sam','Gibson',73,17,0),
(1106,'Justin','Moore',4,8,0),
(1107,'Lyndon','Johnston',29,1,0),
(1108,'Ada','Dixon',6,39,0),
(1109,'Amy','Ryan',6,28,0),
(1110,'Honey','Montgomery',80,13,0),
(1111,'Alberta','Wells',69,53,0),
(1112,'Ryan','Ryan',88,29,0),
(1113,'Cherry','Murray',29,8,0),
(1114,'Paul','Ross',31,32,0),
(1115,'Adrianna','Parker',48,48,0),
(1116,'Justin','Murray',90,54,0),
(1117,'Kate','Morris',16,37,0),
(1118,'Kirsten','Scott',26,49,0),
(1119,'Brooke','Evans',75,18,0),
(1120,'Victor','Spencer',48,1,0),
(1121,'Wilson','Payne',50,1,0),
(1122,'Steven','Scott',10,18,0),
(1123,'Kirsten','Foster',12,44,0),
(1124,'Arthur','Elliott',16,41,0),
(1125,'Alexia','Bennett',53,29,0),
(1126,'Amber','Crawford',85,9,0),
(1127,'Kate','Davis',51,26,0),
(1128,'Maddie','Casey',47,5,0),
(1129,'Walter','Edwards',91,48,0),
(1130,'Jordan','Cole',65,19,0),
(1131,'Sabrina','Kelly',79,47,0),
(1132,'Rafael','Howard',87,35,0),
(1133,'Wilson','Cole',75,28,0),
(1134,'Tess','Anderson',89,45,0),
(1135,'Adison','Barnes',18,10,0),
(1136,'Jack','Allen',62,30,0),
(1137,'Maddie','Riley',80,39,0),
(1138,'Connie','Cameron',69,20,0),
(1139,'Arianna','Cooper',16,8,0),
(1140,'Joyce','Morris',89,49,0),
(1141,'Roman','Kelley',76,10,0),
(1142,'Tiana','West',75,22,0),
(1143,'Sam','Thompson',77,48,0),
(1144,'Melissa','Reed',65,18,0),
(1145,'Kelvin','Harper',92,30,0),
(1146,'Arthur','Scott',54,30,0),
(1147,'James','Sullivan',63,36,0),
(1148,'Alfred','Richardson',58,2,0),
(1149,'Kevin','Morrison',67,13,0),
(1150,'Miley','Roberts',29,1,0),
(1151,'Amelia','Edwards',81,5,0),
(1152,'Paul','Johnston',97,30,0),
(1153,'Melanie','Grant',3,6,0),
(1154,'Kelvin','Gray',76,53,0),
(1155,'Dale','Barnes',22,13,0),
(1156,'Jasmine','Ferguson',52,22,0),
(1157,'William','Wilson',79,4,0),
(1158,'Spike','Cole',68,3,0),
(1159,'Frederick','Hunt',57,47,0),
(1160,'Adele','Rogers',37,28,0),
(1161,'Isabella','Douglas',23,38,0),
(1162,'Lucia','Wright',49,7,0),
(1163,'Lenny','Casey',71,25,0),
(1164,'Rosie','Davis',52,51,0),
(1165,'Frederick','Crawford',98,37,0),
(1166,'Kirsten','Hamilton',37,9,0),
(1167,'Olivia','Hall',14,36,0),
(1168,'Melanie','Gibson',18,35,0),
(1169,'Briony','Anderson',50,48,0),
(1170,'Hailey','Alexander',95,30,0),
(1171,'Rosie','Carroll',38,53,0),
(1172,'Victoria','Richards',85,35,0),
(1173,'Antony','Scott',35,7,0),
(1174,'Antony','Allen',38,46,0),
(1175,'Sabrina','Johnston',96,10,0),
(1176,'Lucy','Anderson',42,32,0),
(1177,'Penelope','Nelson',17,6,0),
(1178,'Audrey','Owens',41,12,0),
(1179,'Maria','Henderson',31,15,0),
(1180,'Owen','Moore',60,55,0),
(1181,'Spike','Douglas',91,45,0),
(1182,'Marcus','Brooks',23,9,0),
(1183,'Chelsea','Douglas',47,40,0),
(1184,'Hailey','Douglas',93,4,0),
(1185,'Maximilian','Hill',61,9,0),
(1186,'Daryl','Myers',97,56,0),
(1187,'Fenton','Richards',78,31,0),
(1188,'Aldus','Craig',3,16,0),
(1189,'Stella','Cooper',81,1,0),
(1190,'Emma','Parker',76,55,0),
(1191,'Lucia','Morris',51,51,0),
(1192,'Nicole','Fowler',52,56,0),
(1193,'Sabrina','Holmes',74,8,0),
(1194,'Dominik','Murray',61,3,0),
(1195,'Agata','Miller',49,19,0),
(1196,'Tiana','Stewart',43,25,0),
(1197,'Maria','Moore',84,12,0),
(1198,'James','Taylor',42,43,0),
(1199,'Sydney','Fowler',61,36,0),
(1200,'Carl','Hill',13,1,0),
(1201,'Alan','Lloyd',90,6,0),
(1202,'Patrick','Allen',24,49,0),
(1203,'Aiden','Owens',89,0,0),
(1204,'Amelia','Walker',48,0,0),
(1205,'Bruce','Adams',69,35,0),
(1206,'Owen','Henderson',31,34,0),
(1207,'Albert','Adams',40,27,0),
(1208,'Max','Williams',98,13,0),
(1209,'Harold','Perry',81,46,0),
(1210,'Florrie','Parker',64,17,0),
(1211,'James','Henderson',34,33,0),
(1212,'Anna','Holmes',73,37,0),
(1213,'Cadie','Rogers',34,39,0),
(1214,'Edwin','Montgomery',30,10,0),
(1215,'Connie','Henderson',68,25,0),
(1216,'Arnold','Davis',22,42,0),
(1217,'Briony','Casey',32,55,0),
(1218,'Steven','Allen',11,19,0),
(1219,'Byron','Thomas',47,34,0),
(1220,'Alberta','Douglas',84,7,0),
(1221,'Harold','Martin',71,38,0),
(1222,'Dainton','Thomas',63,25,0),
(1223,'Caroline','Carroll',84,45,0),
(1224,'Carina','Mitchell',75,36,0),
(1225,'Dainton','Farrell',90,25,0),
(1226,'Arthur','Carroll',27,56,0),
(1227,'Roman','Hall',44,15,0),
(1228,'Elise','Johnston',86,12,0),
(1229,'Kimberly','Gibson',81,33,0),
(1230,'Sarah','Anderson',56,39,0),
(1231,'Chloe','Hall',69,7,0),
(1232,'Lucia','Murray',66,38,0),
(1233,'Tony','Scott',87,53,0),
(1234,'Paul','Barrett',79,22,0),
(1235,'James','Perkins',90,45,0),
(1236,'Eddy','Smith',79,28,0),
(1237,'Myra','Robinson',8,37,0),
(1238,'Justin','Mason',42,3,0),
(1239,'James','Barrett',90,21,0),
(1240,'Arianna','Watson',56,10,0),
(1241,'Adison','Johnston',14,13,0),
(1242,'Freddie','Phillips',73,25,0),
(1243,'Aldus','Cooper',42,33,0),
(1244,'Carina','Baker',97,25,0),
(1245,'Ada','Ellis',39,17,0),
(1246,'Adele','Harper',15,13,0),
(1247,'Heather','Bennett',30,37,0),
(1248,'Joyce','Watson',94,10,0),
(1249,'Carlos','Adams',90,8,0),
(1250,'Marcus','Thompson',16,29,0),
(1251,'Byron','Fowler',5,6,0),
(1252,'Jacob','Anderson',58,4,0),
(1253,'Sawyer','Baker',98,41,0),
(1254,'Savana','Williams',22,22,0),
(1255,'Miller','Hawkins',22,1,0),
(1256,'Sawyer','Miller',11,16,0),
(1257,'Mike','Harris',94,9,0),
(1258,'Eric','Higgins',62,22,0),
(1259,'Arthur','Carter',69,51,0),
(1260,'Lana','Evans',84,51,0),
(1261,'Rubie','Ross',30,25,0),
(1262,'Sarah','Campbell',48,44,0),
(1263,'Andrew','Cooper',75,15,0),
(1264,'Vivian','Carroll',38,48,0),
(1265,'Kirsten','Wright',28,39,0),
(1266,'Arthur','Hill',93,18,0),
(1267,'Annabella','Myers',39,18,0),
(1268,'Lilianna','Henderson',88,25,0),
(1269,'Alisa','Lloyd',10,17,0),
(1270,'Tess','Kelly',44,55,0),
(1271,'Max','Warren',3,36,0),
(1272,'Alan','Roberts',33,49,0),
(1273,'Abraham','Hall',42,51,0),
(1274,'Nicole','Moore',77,27,0),
(1275,'Nicholas','Bailey',21,38,0),
(1276,'Kelsey','Parker',43,26,0),
(1277,'Rosie','Williams',52,17,0),
(1278,'James','Stewart',18,44,0),
(1279,'Edgar','Mitchell',69,19,0),
(1280,'Valeria','Dixon',50,25,0),
(1281,'Albert','Lloyd',48,49,0),
(1282,'Edward','Armstrong',31,28,0),
(1283,'Vanessa','Tucker',21,44,0),
(1284,'Lucy','Mason',4,19,0),
(1285,'Spike','Smith',54,11,0),
(1286,'Melanie','Robinson',1,34,0),
(1287,'Chelsea','Cunningham',23,18,0),
(1288,'Dainton','Higgins',3,4,0),
(1289,'Anna','Baker',9,49,0),
(1290,'Tess','Owens',75,41,0),
(1291,'Harold','Edwards',68,48,0),
(1292,'Abigail','Barrett',2,1,0),
(1293,'Andrew','Hunt',5,48,0),
(1294,'John','Bennett',18,21,0),
(1295,'Adam','Smith',15,46,0),
(1296,'Olivia','Morgan',93,33,0),
(1297,'David','Mitchell',42,36,0),
(1298,'Stuart','Mitchell',86,49,0),
(1299,'Kimberly','Rogers',50,0,0),
(1300,'Oscar','Armstrong',73,19,0),
(1301,'Rebecca','Stewart',1,21,0),
(1302,'Chester','Howard',71,45,0),
(1303,'Madaline','Cole',95,7,0),
(1304,'Sophia','Stewart',1,49,0),
(1305,'Steven','Grant',98,7,0),
(1306,'Sarah','Bailey',72,43,0),
(1307,'Lucas','Anderson',59,17,0),
(1308,'Penelope','Myers',33,2,0),
(1309,'Derek','Kelly',6,5,0),
(1310,'Frederick','Parker',34,44,0),
(1311,'Antony','Ryan',21,12,0),
(1312,'Freddie','Fowler',22,33,0),
(1313,'Leonardo','Perkins',76,51,0),
(1314,'Alexander','Payne',74,19,0),
(1315,'Alexia','Hill',14,42,0),
(1316,'Julian','Montgomery',51,9,0),
(1317,'Paul','Barnes',8,29,0),
(1318,'Marcus','Johnson',5,11,0),
(1319,'Harold','West',44,8,0),
(1320,'Elian','Kelley',81,24,0),
(1321,'Max','Hunt',2,27,0),
(1322,'Savana','Higgins',88,24,0),
(1323,'Tess','Brown',39,39,0),
(1324,'Tyler','Thomas',9,4,0),
(1325,'Evelyn','Douglas',59,17,0),
(1326,'Isabella','Owens',32,23,0),
(1327,'Anna','Watson',48,13,0),
(1328,'Haris','Nelson',6,48,0),
(1329,'Edward','Murphy',9,12,0),
(1330,'Stuart','Douglas',6,11,0),
(1331,'Alford','Harrison',18,30,0),
(1332,'Antony','Casey',99,44,0),
(1333,'Lucy','Cunningham',58,37,0),
(1334,'Andrew','Holmes',5,8,0),
(1335,'Naomi','Perry',17,3,0),
(1336,'Kate','Grant',24,4,0),
(1337,'Justin','Richards',91,34,0),
(1338,'Ashton','Russell',83,3,0),
(1339,'Edgar','Parker',16,15,0),
(1340,'Rafael','Cameron',73,53,0),
(1341,'Owen','Hamilton',39,48,0),
(1342,'James','Morrison',45,37,0),
(1343,'Maya','Riley',20,25,0),
(1344,'Michelle','Cooper',54,10,0),
(1345,'Rafael','Murphy',96,1,0),
(1346,'Nicole','Hamilton',40,1,0),
(1347,'April','Myers',95,24,0),
(1348,'William','Myers',32,44,0),
(1349,'Joyce','Hall',70,50,0),
(1350,'Ashton','Mitchell',41,43,0),
(1351,'Sam','Tucker',29,2,0),
(1352,'Carl','Ferguson',64,21,0),
(1353,'Annabella','Crawford',97,24,0),
(1354,'James','Roberts',1,29,0),
(1355,'Victor','Farrell',93,26,0),
(1356,'David','Kelly',64,33,0),
(1357,'Sofia','Douglas',30,4,0),
(1358,'Sydney','Crawford',95,1,0),
(1359,'Dexter','Morris',30,36,0),
(1360,'Jack','Harper',40,7,0),
(1361,'Paul','Bennett',65,26,0),
(1362,'Julia','Douglas',7,50,0),
(1363,'Haris','Ryan',67,20,0),
(1364,'Adison','Parker',33,4,0),
(1365,'Luke','Williams',84,18,0),
(1366,'Jenna','Farrell',33,39,0),
(1367,'Sawyer','Nelson',67,25,0),
(1368,'Richard','Brown',85,55,0),
(1369,'Daniel','Wright',46,20,0),
(1370,'Nicholas','Harper',52,50,0),
(1371,'Cherry','Chapman',20,42,0),
(1372,'Nicholas','Foster',34,50,0),
(1373,'Belinda','Ross',81,29,0),
(1374,'Amelia','Martin',43,53,0),
(1375,'Evelyn','Cameron',90,24,0),
(1376,'Cherry','Morgan',93,36,0),
(1377,'Charlotte','Foster',93,27,0),
(1378,'Jenna','Ellis',93,46,0),
(1379,'Daryl','Davis',79,13,0),
(1380,'Gianna','Tucker',3,7,0),
(1381,'Isabella','Myers',70,25,0),
(1382,'Fiona','Allen',56,21,0),
(1383,'Madaline','Martin',25,15,0),
(1384,'Myra','Higgins',17,14,0),
(1385,'Charlie','Harrison',14,32,0),
(1386,'Edward','Stevens',20,30,0),
(1387,'Roland','Payne',60,41,0),
(1388,'Victor','Nelson',61,32,0),
(1389,'Florrie','Brown',42,29,0),
(1390,'Dominik','Martin',25,41,0),
(1391,'Freddie','Warren',29,13,0),
(1392,'Belinda','Hawkins',10,47,0),
(1393,'Agata','Riley',76,23,0),
(1394,'Ada','Wright',12,46,0),
(1395,'Miley','Edwards',25,40,0),
(1396,'Reid','Miller',26,23,0),
(1397,'Frederick','Stewart',64,0,0),
(1398,'Charlotte','Roberts',71,9,0),
(1399,'April','Crawford',69,37,0),
(1400,'Haris','Turner',32,32,0),
(1401,'Myra','Russell',72,18,0),
(1402,'Blake','Moore',43,39,0),
(1403,'Nicole','Smith',45,32,0),
(1404,'Alexia','Hall',9,19,0),
(1405,'Lucas','Hunt',36,30,0),
(1406,'Elian','Watson',92,31,0),
(1407,'Tess','Edwards',17,46,0),
(1408,'Ada','Andrews',79,48,0),
(1409,'Amelia','Turner',85,28,0),
(1410,'Sydney','Brown',87,35,0),
(1411,'Nicholas','Perkins',6,49,0),
(1412,'Connie','Farrell',88,17,0),
(1413,'Mike','Cunningham',3,43,0),
(1414,'Dominik','Dixon',5,44,0),
(1415,'Adele','Parker',38,2,0),
(1416,'James','Richardson',77,18,0),
(1417,'Tony','Ryan',76,27,0),
(1418,'Stella','Hawkins',15,22,0),
(1419,'Anna','Morrison',41,17,0),
(1420,'Chloe','Johnson',46,24,0),
(1421,'Patrick','Barnes',96,48,0),
(1422,'James','West',66,13,0),
(1423,'Paul','Williams',21,19,0),
(1424,'Violet','Smith',14,32,0),
(1425,'Natalie','Thompson',32,17,0),
(1426,'Andrew','Brown',26,27,0),
(1427,'Sam','Alexander',29,41,0),
(1428,'Eleanor','Chapman',56,44,0),
(1429,'Sawyer','Cameron',70,27,0),
(1430,'James','Sullivan',66,8,0),
(1431,'Charlie','Kelly',72,19,0),
(1432,'Kelvin','Cole',20,33,0),
(1433,'Clark','Bennett',31,36,0),
(1434,'Ada','West',45,33,0),
(1435,'Harold','Thompson',12,28,0),
(1436,'Naomi','Richards',38,41,0),
(1437,'Edward','Edwards',3,28,0),
(1438,'Cherry','Brown',71,15,0),
(1439,'Alissa','Higgins',59,2,0),
(1440,'April','Williams',76,9,0),
(1441,'Elise','Holmes',31,55,0),
(1442,'Luke','Gibson',6,31,0),
(1443,'Agata','Roberts',81,38,0),
(1444,'Haris','Hunt',61,27,0),
(1445,'Chloe','Wells',50,56,0),
(1446,'Valeria','Campbell',27,27,0),
(1447,'Ned','Mitchell',15,25,0),
(1448,'Martin','Dixon',99,24,0),
(1449,'Victoria','Bennett',91,31,0),
(1450,'Maddie','Armstrong',59,20,0),
(1451,'Olivia','Edwards',94,52,0),
(1452,'Jack','Spencer',5,13,0),
(1453,'Abigail','Campbell',30,42,0),
(1454,'Chelsea','Williams',1,47,0),
(1455,'Emma','Harrison',88,44,0),
(1456,'Thomas','Edwards',17,26,0),
(1457,'Jessica','Wright',26,31,0),
(1458,'Jenna','Bennett',88,47,0),
(1459,'Clark','Barrett',53,38,0),
(1460,'Dominik','Higgins',16,4,0),
(1461,'Annabella','Johnston',42,24,0),
(1462,'April','Hunt',3,35,0),
(1463,'Mike','Baker',51,50,0),
(1464,'Ellia','Harper',27,54,0),
(1465,'Dainton','Crawford',94,52,0),
(1466,'Clark','Murray',81,0,0),
(1467,'Sam','Allen',23,3,0),
(1468,'Lucy','Riley',62,14,0),
(1469,'Melissa','Spencer',12,11,0),
(1470,'Bruce','Davis',75,5,0),
(1471,'Oscar','Howard',57,9,0),
(1472,'Edwin','Martin',17,27,0),
(1473,'Jared','Alexander',27,42,0),
(1474,'Jacob','Hawkins',32,43,0),
(1475,'Maria','Reed',69,2,0),
(1476,'Roman','Harris',30,2,0),
(1477,'Derek','Howard',46,16,0),
(1478,'Lily','Perkins',23,36,0),
(1479,'Rebecca','Hunt',11,12,0),
(1480,'Byron','West',91,0,0),
(1481,'Jacob','Hamilton',83,5,0),
(1482,'Kirsten','Miller',70,49,0),
(1483,'Alina','Higgins',17,25,0),
(1484,'Kate','Carter',87,47,0),
(1485,'John','Thomas',82,48,0),
(1486,'Sabrina','Foster',4,48,0),
(1487,'Vanessa','Roberts',80,37,0),
(1488,'Rebecca','Carroll',1,11,0),
(1489,'Ted','Taylor',20,35,0),
(1490,'Kirsten','Turner',50,56,0),
(1491,'Edith','Clark',73,2,0),
(1492,'Miranda','Perkins',52,41,0),
(1493,'Dexter','Sullivan',39,35,0),
(1494,'Kelvin','Howard',88,43,0),
(1495,'Edwin','Sullivan',5,33,0),
(1496,'Belinda','Cameron',91,55,0),
(1497,'Alissa','Cooper',63,13,0),
(1498,'Emma','Howard',77,19,0),
(1499,'Anna','Reed',97,26,0),
(1500,'Jenna','Lloyd',4,19,0);

INSERT INTO `officers` VALUES
(0,'Vivian','Murray',1,'2020-03-15','T', 0),
(1,'Vanessa','Moore',3,'2021-06-22','T', 0),
(2,'Leonardo','Foster',2,'2022-11-07','T', 0),
(3,'Violet','Crawford',0,'2024-11-23','T', 0),
(4,'Reid','Perkins',2,'2024-05-30','T', 0),
(5,'Maya','Thompson',NULL,'2020-09-12','F', 0),
(6,'Heather','Smith',3,'2021-04-05','T', 0),
(7,'Tara','Cooper',0,'2022-08-14','T', 0),
(8,'John','Roberts',7,'2023-12-01','T', 0),
(9,'Tyler','Scott',2,'2024-02-20','T', 0),
(10,'Abigail','Howard',1,'2020-11-11','T', 0),
(11,'Ted','Warren',5,'2021-07-25','T', 0),
(12,'Darcy','Harris',NULL,'2022-03-30','F', 0),
(13,'Adelaide','Cunningham',4,'2023-10-06','T', 0),
(14,'Bruce','Murray',7,'2024-05-15','T', 0),
(15,'Freddie','Johnson',0,'2020-06-18','T', 0),
(16,'Jacob','Payne',4,'2021-12-09','T', 0),
(17,'Jenna','Holmes',0,'2022-01-22','T', 0),
(18,'Isabella','Hawkins',4,'2023-07-11','T', 0),
(19,'Adrian','Tucker',1,'2024-04-04','T', 0),
(20,'Daniel','Evans',3,'2020-08-28','T', 0),
(21,'Paige','Parker',5,'2021-05-02','T', 0),
(22,'Darcy','Turner',9,'2022-09-29','T', 0),
(23,'Kelsey','Stewart',NULL,'2023-11-03','F', 0),
(24,'Julian','Davis',5,'2024-02-11','T', 0),
(25,'Kimberly','Holmes',7,'2020-03-21','T', 0),
(26,'Lenny','Morris',9,'2021-06-30','T', 0),
(27,'John','Johnston',0,'2022-10-17','T', 0),
(28,'Maria','Harrison',2,'2023-04-23','T', 0),
(29,'Brooke','Smith',8,'2024-12-05','T', 0),
(30,'Caroline','Hunt',7,'2020-01-14','T', 0),
(31,'Lucy','Sullivan',4,'2021-02-25','T', 0),
(32,'Sophia','Miller',3,'2022-07-09','T', 0),
(33,'Aiden','Adams',4,'2023-03-18','T', 0),
(34,'Aiden','Holmes',9,'2024-08-12','T', 0),
(35,'James','Martin',3,'2020-05-15','T', 0),
(36,'Ryan','Tucker',7,'2021-09-04','T', 0),
(37,'Emily','Morgan',0,'2022-11-29','T', 0),
(38,'Gianna','Campbell',7,'2023-06-13','T', 0),
(39,'Dominik','Ryan',9,'2024-10-22','T', 0),
(40,'Alexander','Morrison',3,'2020-12-30','T', 0),
(41,'Richard','Montgomery',3,'2021-01-08','T', 0),
(42,'Violet','Murphy',6,'2022-04-26','T', 0),
(43,'Alina','Stewart',NULL,'2023-08-11','F', 0),
(44,'Adam','Stewart',1,'2024-02-14','T', 0),
(45,'Antony','Baker',7,'2020-09-19','T', 0),
(46,'Adelaide','Mitchell',7,'2021-03-24','T', 0),
(47,'Arnold','Gray',7,'2022-06-07','T', 0),
(48,'Rosie','Smith',0,'2020-01-15','T', 0),
(49,'Carina','Crawford',3,'2021-03-22','T', 0),
(50,'Lenny','Scott',3,'2022-06-18','T', 0),
(51,'Natalie','Watson',0,'2023-09-11','T', 0),
(52,'Alen','Casey',3,'2024-02-28','T', 0),
(53,'Kristian','Montgomery',8,'2020-07-24','T', 0),
(54,'Bruce','Murphy',8,'2021-11-22','T', 0),
(55,'Frederick','Cole',1,'2022-10-23','T', 0),
(56,'Charlie','Taylor',9,'2023-05-19','T', 0),
(57,'Daniel','Smith',3,'2024-04-29','T', 0),
(58,'Henry','Ellis',4,'2020-08-22','T', 0),
(59,'Olivia','Martin',9,'2021-12-25','T', 0),
(60,'Alina','Henderson',4,'2022-03-27','T', 0),
(61,'Sawyer','Harris',7,'2023-01-09','T', 0),
(62,'Vanessa','Thomas',7,'2024-06-15','T', 0),
(63,'Chester','Foster',5,'2020-02-06','T', 0),
(64,'Sabrina','Farrell',8,'2021-04-12','T', 0),
(65,'Cadie','Martin',8,'2022-05-30','T', 0),
(66,'Melanie','Kelly',0,'2023-07-11','T', 0),
(67,'Valeria','Elliott',8,'2024-09-07','T', 0),
(68,'Eleanor','Douglas',4,'2020-10-29','T', 0),
(69,'Arianna','Nelson',9,'2021-11-18','T', 0),
(70,'Rafael','Robinson',1,'2022-12-13','T', 0),
(71,'Sam','Campbell',9,'2023-03-20','T', 0),
(72,'Brooke','Taylor',7,'2024-08-12','T', 0),
(73,'Abigail','Perkins',1,'2020-01-11','T', 0),
(74,'Sam','Russell',5,'2021-02-28','T', 0),
(75,'Chester','Reed',1,'2022-04-12','T', 0),
(76,'Ashton','Craig',1,'2023-05-27','T', 0),
(77,'Catherine','Owens',3,'2024-06-01','T', 0),
(78,'Victoria','Elliott',0,'2020-07-25','T', 0),
(79,'Evelyn','Campbell',9,'2021-08-07','T', 0),
(80,'Lydia','Thompson',2,'2022-09-14','T', 0),
(81,'Aldus','Hunt',7,'2023-10-03','T', 0),
(82,'Ted','Turner',6,'2024-11-04','T', 0),
(83,'Vivian','Dixon',5,'2020-12-25','T', 0),
(84,'Lydia','Smith',4,'2021-01-13','T', 0),
(85,'Jordan','Davis',6,'2022-02-21','T', 0),
(86,'Brooke','Reed',7,'2023-03-30','T', 0),
(87,'Kristian','Scott',3,'2024-04-11','T', 0),
(88,'Gianna','Farrell',1,'2020-05-22','T', 0),
(89,'Spike','Kelley',7,'2021-06-16','T', 0),
(90,'Tiana','Turner',0,'2022-07-11','T', 0),
(91,'Derek','Turner',7,'2023-08-27','T', 0),
(92,'Dexter','Rogers',3,'2024-09-02','T', 0),
(93,'Amy','Cole',3,'2020-10-23','T', 0),
(94,'Edgar','Higgins',3,'2021-11-10','T', 0),
(95,'Alen','Williams',6,'2022-12-20','T', 0),
(96,'Daniel','Roberts',2,'2023-01-08','T', 0),
(97,'Isabella','Higgins',3,'2020-01-26','T', 0),
(98,'Stella','Morgan',0,'2021-02-04','T', 0),
(99,'Robert','Morris',6,'2022-03-02','T', 0),
(100,'Oliver','Grant',6,'2023-04-05','T', 0),
(101,'Sydney','Morris',1,'2024-05-29','T', 0),
(102,'Joyce','Andrews',5,'2020-06-15','T', 0),
(103,'Alina','Johnston',0,'2021-07-05','T', 0),
(104,'Rafael','Sullivan',8,'2022-08-20','T', 0),
(105,'Ryan','Cameron',8,'2023-09-03','T', 0),
(106,'Camila','Stewart',4,'2024-10-15','T', 0),
(107,'Carlos','Fowler',0,'2020-11-29','T', 0),
(108,'Daryl','Kelley',9,'2021-12-28','T', 0),
(109,'Gianna','Casey',1,'2022-01-03','T', 0),
(110,'Jordan','Stevens',4,'2023-02-10','T', 0),
(111,'Frederick','Alexander',5,'2024-03-09','T', 0),
(112,'William','Montgomery',7,'2020-04-19','T', 0),
(113,'Catherine','Cooper',4,'2021-05-26','T', 0),
(114,'Emily','Lloyd',7,'2022-06-23','T', 0),
(115,'Leonardo','Grant',8,'2023-07-30','T', 0),
(116,'Jack','Sullivan',3,'2024-08-18','T', 0),
(117,'Valeria','Kelley',5,'2020-09-22','T', 0),
(118,'Ashton','Wells',4,'2021-10-11','T', 0),
(119,'Rafael','Gray',7,'2022-11-21','T', 0),
(120,'Daryl','Davis',9,'2023-12-09','T', 0),
(121,'Amber','Smith',6,'2024-01-04','T', 0),
(122,'Ashton','Williams',4,'2020-02-26','T', 0),
(123,'Maddie','Crawford',2,'2021-03-15','T', 0),
(124,'Oliver','Alexander',7,'2022-04-13','T', 0),
(125,'Robert','Douglas',5,'2023-05-30','T', 0),
(126,'Dale','Grant',9,'2024-06-12','T', 0),
(127,'Eric','Rogers',8,'2020-07-16','T', 0),
(128,'Adison','Johnson',5,'2021-08-20','T', 0),
(129,'Lily','Mason',9,'2022-09-14','T', 0),
(130,'Daryl','Smith',6,'2023-10-08','T', 0),
(131,'Miller','Stewart',2,'2024-11-02','T', 0),
(132,'Ned','Taylor',7,'2020-12-22','T', 0),
(133,'Kellan','Payne',2,'2021-01-14','T', 0),
(134,'Dainton','Davis',8,'2022-02-20','T', 0),
(135,'Maria','Crawford',3,'2023-03-16','T', 0),
(136,'Marcus','Holmes',1,'2024-04-06','T', 0),
(137,'Catherine','Watson',0,'2020-05-29','T', 0),
(138,'Melanie','Cameron',8,'2021-06-18','T', 0),
(139,'Richard','Henderson',7,'2022-07-19','T', 0),
(140,'William','Scott',1,'2023-08-22','T', 0),
(141,'Ted','Riley',5,'2024-09-17','T', 0),
(142,'Valeria','Davis',5,'2020-10-01','T', 0),
(143,'Harold','Ferguson',3,'2021-11-12','T', 0),
(144,'Clark','Smith',6,'2022-12-14','T', 0),
(145,'Lydia','Payne',6,'2023-01-10','T', 0),
(146,'Eddy','Ryan',5,'2024-02-05','T', 0),
(147,'Chelsea','Harris',2,'2020-01-12','T', 0),
(148,'Anna','Richards',7,'2021-02-14','T', 0),
(149,'Maddie','Elliott',9,'2022-03-30','T', 0),
(150,'Paul','Allen',9,'2023-04-18','T', 0),
(151,'Andrew','Hawkins',8,'2024-05-14','T', 0),
(152,'Dominik','Douglas',4,'2020-06-11','T', 0),
(153,'Rosie','Davis',7,'2021-07-10','T', 0),
(154,'Ashton','Richardson',7,'2022-08-16','T', 0),
(155,'Lyndon','Owens',9,'2023-09-11','T', 0),
(156,'Maddie','Chapman',6,'2024-10-17','T', 0),
(157,'Maya','Payne',4,'2020-11-27','T', 0),
(158,'Savana','Reed',4,'2021-12-05','T', 0),
(159,'Aldus','Allen',6,'2022-01-12','T', 0),
(160,'Ryan','Hawkins',2,'2023-02-17','T', 0),
(161,'Elian','Taylor',1,'2024-03-27','T', 0),
(162,'Deanna','Craig',6,'2020-04-26','T', 0),
(163,'Connie','Walker',9,'2021-05-19','T', 0),
(164,'Lucia','Scott',9,'2022-06-07','T', 0),
(165,'Tiana','Wells',3,'2023-07-27','T', 0),
(166,'Gianna','Murphy',4,'2024-08-09','T', 0),
(167,'Lydia','Brooks',8,'2020-09-29','T', 0),
(168,'Ellia','Williams',4,'2021-10-11','T', 0),
(169,'Vincent','Allen',3,'2022-11-02','T', 0),
(170,'Miley','Perry',0,'2023-12-21','T', 0),
(171,'Victor','Wells',6,'2024-01-21','T', 0),
(172,'William','Howard',5,'2020-02-16','T', 0),
(173,'Jack','Hall',7,'2021-03-17','T', 0),
(174,'Nicole','Johnson',3,'2022-04-17','T', 0),
(175,'Alissa','Cunningham',2,'2023-05-05','T', 0),
(176,'Edwin','Cameron',2,'2024-06-17','T', 0),
(177,'Max','Ryan',9,'2020-07-11','T', 0),
(178,'Marcus','Richardson',6,'2021-08-10','T', 0),
(179,'Roland','Murphy',5,'2022-09-24','T', 0),
(180,'Samantha','Thompson',5,'2023-10-23','T', 0),
(181,'Lucas','Brooks',6,'2024-11-30','T', 0),
(182,'Kimberly','Howard',1,'2020-12-07','T', 0),
(183,'Garry','Taylor',1,'2021-01-21','T', 0),
(184,'Adrianna','Jones',1,'2022-02-27','T', 0),
(185,'Roman','Murray',0,'2023-03-24','T', 0),
(186,'Roman','Thompson',5,'2024-04-24','T', 0),
(187,'Reid','Morris',7,'2020-05-03','T', 0),
(188,'Alexia','Hamilton',0,'2021-06-05','T', 0),
(189,'Sofia','Carter',9,'2022-07-14','T', 0),
(190,'Alina','Myers',2,'2023-08-23','T', 0),
(191,'Connie','Spencer',9,'2024-09-10','T', 0),
(192,'Olivia','Parker',1,'2020-10-24','T', 0),
(193,'Eddy','Miller',3,'2021-11-10','T', 0),
(194,'Edgar','Hunt',7,'2022-12-15','T', 0),
(195,'Arthur','Evans',4,'2023-01-08','T', 0),
(196,'Violet','Morgan',7,'2024-02-10','T', 0),
(197,'Amber','Allen',6,'2020-01-03','T', 0),
(198,'Antony','Armstrong',2,'2021-02-07','T', 0),
(199,'Miley','Russell',8,'2022-03-26','T', 0),
(200,'Ryan','Warren',8,'2023-04-19','T', 0),
(201,'Reid','Morrison',9,'2024-05-10','T', 0),
(202,'James','Crawford',0,'2020-06-01','T', 0),
(203,'Audrey','Allen',8,'2021-07-01','T', 0),
(204,'Vincent','Craig',9,'2022-08-30','T', 0),
(205,'David','Mason',6,'2023-09-03','T', 0),
(206,'Audrey','Robinson',8,'2024-10-25','T', 0),
(207,'Amy','Brown',8,'2020-11-11','T', 0),
(208,'Belinda','Ellis',1,'2021-12-30','T', 0),
(209,'Annabella','Adams',6,'2022-01-20','T', 0),
(210,'Aida','Ferguson',1,'2023-02-03','T', 0),
(211,'Eric','Perry',6,'2024-03-19','T', 0),
(212,'Abigail','Adams',8,'2020-04-13','T', 0),
(213,'Kristian','Perry',6,'2021-05-30','T', 0),
(214,'Roland','Douglas',2,'2022-06-03','T', 0),
(215,'Edward','Tucker',8,'2023-07-27','T', 0),
(216,'Agata','Parker',0,'2024-08-23','T', 0),
(217,'Camila','Watson',8,'2020-09-01','T', 0),
(218,'Alan','Myers',0,'2021-10-05','T', 0),
(219,'Michelle','Gibson',6,'2022-11-21','T', 0),
(220,'Alfred','Hall',4,'2023-12-05','T', 0),
(221,'Alissa','Morris',0,'2024-01-04','T', 0),
(222,'Eleanor','Chapman',2,'2020-02-24','T', 0),
(223,'Jacob','Cunningham',2,'2021-03-01','T', 0),
(224,'Charlie','Gibson',2,'2022-04-02','T', 0),
(225,'Ashton','Wright',4,'2023-05-06','T', 0),
(226,'Melissa','Roberts',2,'2024-06-08','T', 0),
(227,'Marcus','Kelly',4,'2020-07-07','T', 0),
(228,'Adison','Mitchell',7,'2021-08-15','T', 0),
(229,'Oliver','Martin',0,'2022-09-15','T', 0),
(230,'Heather','Phillips',8,'2023-10-21','T', 0),
(231,'Max','Henderson',8,'2024-11-03','T', 0),
(232,'Tony','Lloyd',3,'2020-12-03','T', 0),
(233,'Darcy','Morgan',2,'2021-01-04','T', 0),
(234,'Joyce','Armstrong',1,'2022-02-01','T', 0),
(235,'Paul','West',3,'2023-03-26','T', 0),
(236,'Steven','Thomas',8,'2024-04-25','T', 0),
(237,'Henry','Evans',6,'2020-05-27','T', 0),
(238,'Tiana','Thomas',0,'2021-06-23','T', 0),
(239,'Jenna','Casey',2,'2020-01-23','T', 0),
(240,'Lucia','Brown',9,'2021-02-19','T', 0),
(241,'Carina','Campbell',5,'2022-03-04','T', 0),
(242,'Bruce','Morrison',5,'2023-04-17','T', 0),
(243,'Kevin','Brown',7,'2024-05-03','T', 0),
(244,'Stuart','Andrews',7,'2020-06-14','T', 0),
(245,'Mike','Stevens',5,'2021-07-22','T', 0),
(246,'Elian','Montgomery',6,'2022-08-09','T', 0),
(247,'Vivian','Gibson',8,'2023-09-17','T', 0),
(248,'Deanna','Holmes',2,'2024-10-18','T', 0),
(249,'Spike','Wright',5,'2020-11-01','T', 0),
(250,'Brianna','Crawford',8,'2021-12-03','T', 0),
(251,'Andrew','Reed',6,'2022-01-29','T', 0),
(252,'Aldus','Murray',5,'2023-02-01','T', 0),
(253,'Emily','Richards',8,'2024-03-03','T', 0),
(254,'Agata','Roberts',6,'2020-04-11','T', 0),
(255,'Jessica','Carter',6,'2021-05-20','T', 0),
(256,'Sabrina','Morrison',1,'2022-06-24','T', 0),
(257,'Victoria','Moore',5,'2023-07-13','T', 0),
(258,'Lana','Johnson',2,'2024-08-17','T', 0),
(259,'Walter','Scott',5,'2020-09-24','T', 0),
(260,'Albert','Johnson',3,'2021-10-01','T', 0),
(261,'Melissa','Craig',4,'2022-11-02','T', 0),
(262,'Annabella','Rogers',4,'2023-12-23','T', 0),
(263,'Kelvin','Cooper',0,'2024-01-12','T', 0),
(264,'Paul','Martin',7,'2020-02-17','T', 0),
(265,'Honey','Johnson',5,'2021-03-17','T', 0),
(266,'Annabella','Owens',6,'2022-04-04','T', 0),
(267,'Elise','Anderson',0,'2023-05-20','T', 0),
(268,'Adam','Hill',9,'2024-06-16','T', 0),
(269,'Owen','Nelson',9,'2020-07-09','T', 0),
(270,'Robert','Wells',4,'2021-08-13','T', 0),
(271,'Elise','Evans',8,'2022-09-20','T', 0),
(272,'Myra','Sullivan',5,'2023-10-27','T', 0),
(273,'Oscar','Henderson',9,'2024-11-07','T', 0),
(274,'Rebecca','Roberts',1,'2020-12-21','T', 0),
(275,'Melissa','Kelley',9,'2021-01-03','T', 0),
(276,'Gianna','Payne',3,'2022-02-01','T', 0),
(277,'Brooke','Ryan',5,'2023-03-09','T', 0),
(278,'Camila','Spencer',3,'2024-04-10','T', 0),
(279,'Aida','Hill',4,'2020-05-23','T', 0),
(280,'Alford','Dixon',7,'2021-06-12','T', 0),
(281,'Kevin','West',3,'2022-07-25','T', 0),
(282,'Daisy','Kelly',7,'2023-08-14','T', 0),
(283,'Alissa','Tucker',2,'2024-09-01','T', 0),
(284,'Kelsey','Alexander',2,'2020-10-29','T', 0),
(285,'Nicholas','Payne',3,'2021-11-11','T', 0),
(286,'Tony','Rogers',7,'2022-12-24','T', 0),
(287,'Edith','Cooper',0,'2023-01-06','T', 0),
(288,'Cherry','Johnston',7,'2024-02-27','T', 0),
(289,'Belinda','Barrett',6,'2020-01-03','T', 0),
(290,'Aston','Farrell',9,'2021-02-23','T', 0),
(291,'Daisy','Harris',1,'2022-03-11','T', 0),
(292,'Edith','Hamilton',0,'2023-04-08','T', 0),
(293,'Sofia','Henderson',4,'2024-05-14','T', 0),
(294,'Leonardo','Mitchell',1,'2020-06-11','T', 0),
(295,'Wilson','Roberts',3,'2021-07-07','T', 0),
(296,'Daisy','Casey',5,'2022-08-12','T', 0),
(297,'Vincent','Payne',2,'2023-09-12','T', 0),
(298,'Eleanor','Cole',8,'2024-10-27','T', 0),
(299,'Henry','West',6,'2020-11-24','T', 0),
(300, 'Florrie', 'Morris', 51, '1964-10-14', 'T', 0),
(301, 'Alexander', 'Craig', 14, '1984-03-30', 'T', 0),
(302, 'Kirsten', 'Sullivan', 36, '1991-01-05', 'T', 0),
(303, 'Frederick', 'Hunt', 34, '1920-07-31', 'T', 0),
(304, 'Elise', 'Morrison', 30, '1974-12-22', 'T', 0),
(305, 'Roland', 'Stevens', 55, '1963-12-25', 'T', 0),
(306, 'Arnold', 'Howard', 37, '1945-06-08', 'T', 0),
(307, 'Kristian', 'Howard', 20, '1968-01-21', 'T', 0),
(308, 'Chelsea', 'Andrews', 34, '1977-06-28', 'T', 0),
(309, 'Ada', 'Roberts', 54, '2021-12-28', 'T', 0),
(310, 'Evelyn', 'Walker', 35, '2012-10-23', 'T', 0),
(311, 'Adele', 'Hunt', 0, '1977-06-12', 'T', 0),
(312, 'Miley', 'Stevens', 2, '1930-03-11', 'T', 0),
(313, 'Melissa', 'Morrison', 25, '1945-03-12', 'T', 0),
(314, 'Alfred', 'Myers', 4, '1922-07-16', 'T', 0),
(315, 'Lenny', 'Allen', 21, '1918-06-27', 'T', 0),
(316, 'Vivian', 'Tucker', 8, '1946-08-08', 'T', 0),
(317, 'Ellia', 'Stevens', 18, '1917-01-07', 'T', 0),
(318, 'Tara', 'Ferguson', 12, '1923-06-15', 'T', 0),
(319, 'Julia', 'Cameron', 33, '1993-10-29', 'T', 0),
(320, 'Alissa', 'Jones', 36, '2023-03-21', 'T', 0),
(321, 'James', 'Ryan', 24, '1971-04-10', 'T', 0),
(322, 'Daisy', 'Craig', 11, '1993-05-19', 'T', 0),
(323, 'Julia', 'Ross', 40, '1918-03-09', 'T', 0),
(324, 'Freddie', 'Phillips', 32, '1914-03-24', 'T', 0),
(325, 'Eric', 'Hunt', 18, '1969-01-29', 'T', 0),
(326, 'Florrie', 'Murphy', 26, '1919-10-17', 'T', 0),
(327, 'Charlotte', 'Thomas', 45, '2021-03-28', 'T', 0),
(328, 'Melissa', 'Ellis', 29, '1969-09-10', 'T', 0),
(329, 'Olivia', 'Jones', 17, '1923-11-29', 'T', 0),
(330, 'Marcus', 'Smith', 5, '2002-01-29', 'T', 0),
(331, 'Adison', 'Barrett', 43, '2005-03-23', 'T', 0),
(332, 'Frederick', 'Martin', 23, '2016-12-06', 'T', 0),
(333, 'Luke', 'Watson', 1, '1954-05-03', 'T', 0),
(334, 'Alina', 'Russell', 42, '1933-08-14', 'T', 0),
(335, 'Agata', 'Murray', 28, '1914-10-10', 'T', 0),
(336, 'Naomi', 'Cole', 12, '1900-02-21', 'T', 0),
(337, 'Eddy', 'Gray', 10, '1986-08-14', 'T', 0),
(338, 'Heather', 'Farrell', 41, '1970-02-24', 'T', 0),
(339, 'Arthur', 'Evans', 18, '1956-03-12', 'T', 0),
(340, 'Martin', 'Roberts', 2, '1953-07-22', 'T', 0),
(341, 'John', 'Cooper', 0, '1925-10-23', 'T', 0),
(342, 'Aston', 'Mitchell', 55, '1912-01-19', 'T', 0),
(343, 'Kimberly', 'Farrell', 24, '1914-11-24', 'T', 0),
(344, 'Emma', 'Ross', 44, '1902-12-29', 'T', 0),
(345, 'Arianna', 'Roberts', 4, '1931-08-09', 'T', 0),
(346, 'Adelaide', 'Martin', 42, '1957-02-19', 'T', 0),
(347, 'Edwin', 'Reed', 10, '1926-08-17', 'T', 0),
(348, 'Naomi', 'Gray', 34, '1983-04-21', 'T', 0),
(349, 'Joyce', 'Johnson', 44, '1991-04-12', 'T', 0),
(350, 'Henry', 'Cole', 53, '2009-11-23', 'T', 0),
(351, 'Bruce', 'Brooks', 55, '2021-02-14', 'T', 0),
(352, 'Kate', 'Ryan', 56, '1978-11-03', 'T', 0),
(353, 'Victoria', 'West', 7, '2023-11-09', 'T', 0),
(354, 'Rubie', 'Hill', 50, '1949-11-21', 'T', 0),
(355, 'Ned', 'Martin', 1, '1997-04-08', 'T', 0),
(356, 'Sam', 'Gibson', 11, '1943-06-27', 'T', 0),
(357, 'Aiden', 'Barnes', 13, '1939-01-11', 'T', 0),
(358, 'Elise', 'Hill', 21, '1904-04-05', 'T', 0),
(359, 'Alfred', 'Reed', 24, '1902-08-17', 'T', 0),
(360, 'Amy', 'Murray', 6, '1904-08-21', 'T', 0),
(361, 'Hailey', 'Chapman', 15, '1901-08-10', 'T', 0),
(362, 'Natalie', 'Stewart', 53, '1972-01-09', 'T', 0),
(363, 'Fenton', 'Taylor', 10, '1983-01-18', 'T', 0),
(364, 'Owen', 'Cameron', 8, '1951-06-10', 'T', 0),
(365, 'Aida', 'Douglas', 22, '1924-02-24', 'T', 0),
(366, 'Paul', 'Turner', 6, '1906-05-08', 'T', 0),
(367, 'Aston', 'Kelley', 14, '1932-08-20', 'T', 0),
(368, 'Lucia', 'Chapman', 50, '1938-12-18', 'T', 0),
(369, 'Lily', 'Nelson', 10, '2008-04-04', 'T', 0),
(370, 'Chloe', 'Ryan', 33, '1940-08-07', 'T', 0),
(371, 'Maximilian', 'Cameron', 37, '1919-09-04', 'T', 0),
(372, 'Lucas', 'Parker', 45, '1981-05-27', 'T', 0),
(373, 'Dale', 'Ross', 49, '1911-04-15', 'T', 0),
(374, 'Nicholas', 'Gray', 26, '1946-12-04', 'T', 0),
(375, 'Nicholas', 'Johnson', 46, '1953-12-08', 'T', 0),
(376, 'Edith', 'Andrews', 33, '1947-03-05', 'T', 0),
(377, 'Aiden', 'Harris', 38, '1920-09-10', 'T', 0),
(378, 'Rubie', 'Richards', 22, '1977-05-14', 'T', 0),
(379, 'Chloe', 'Miller', 20, '1981-09-20', 'T', 0),
(380, 'Oliver', 'Taylor', 55, '1959-08-22', 'T', 0),
(381, 'Chelsea', 'Hunt', 10, '1915-06-28', 'T', 0),
(382, 'Sabrina', 'Barnes', 24, '1911-03-24', 'T', 0),
(383, 'Amelia', 'Taylor', 14, '1945-12-31', 'T', 0),
(384, 'Victor', 'Thompson', 46, '1997-08-23', 'T', 0),
(385, 'Gianna', 'Cole', 26, '1950-11-01', 'T', 0),
(386, 'Rebecca', 'Allen', 0, '1971-05-02', 'T', 0),
(387, 'Charlie', 'Craig', 56, '2018-01-30', 'T', 0),
(388, 'Sienna', 'Barrett', 53, '1962-02-09', 'T', 0),
(389, 'Edgar', 'Johnston', 20, '1997-02-25', 'T', 0),
(390, 'Jack', 'Walker', 29, '2024-05-27', 'T', 0),
(391, 'Jordan', 'Smith', 44, '1949-09-12', 'T', 0),
(392, 'Julia', 'Turner', 9, '1985-07-06', 'T', 0),
(393, 'James', 'Murphy', 16, '1987-10-16', 'T', 0),
(394, 'Patrick', 'Johnson', 46, '2011-09-10', 'T', 0),
(395, 'Edwin', 'Watson', 4, '1986-09-30', 'T', 0),
(396, 'Jasmine', 'Harris', 3, '1956-04-23', 'T', 0),
(397, 'Alisa', 'Walker', 10, '1909-10-12', 'T', 0),
(398, 'Dexter', 'Hunt', 3, '2013-02-10', 'T', 0),
(399, 'Steven', 'Morris', 51, '1942-11-27', 'T', 0),
(400, 'Wilson', 'Brown', 50, '1931-05-18', 'T', 0),
(401, 'Eddy', 'Nelson', 34, '1970-05-19', 'T', 0),
(402, 'Sophia', 'Kelly', 38, '1934-03-17', 'T', 0),
(403, 'Dominik', 'Smith', 0, '1900-11-24', 'T', 0),
(404, 'Amy', 'Gibson', 34, '1965-10-22', 'T', 0),
(405, 'Carl', 'Barnes', 36, '1991-05-09', 'T', 0),
(406, 'Alexia', 'Gray', 44, '1973-08-31', 'T', 0),
(407, 'Charlotte', 'Thompson', 40, '1931-06-23', 'T', 0),
(408, 'Spike', 'Russell', 50, '1927-12-02', 'T', 0),
(409, 'Oliver', 'Morgan', 8, '2005-03-26', 'T', 0),
(410, 'Rosie', 'Baker', 0, '1986-05-10', 'T', 0),
(411, 'Maya', 'Mason', 23, '1929-07-02', 'T', 0),
(412, 'Dexter', 'Scott', 48, '1936-08-11', 'T', 0),
(413, 'Alen', 'Payne', 45, '1942-12-10', 'T', 0),
(414, 'Rebecca', 'Wright', 12, '2022-09-16', 'T', 0),
(415, 'Tara', 'Farrell', 52, '1901-02-02', 'T', 0),
(416, 'Evelyn', 'Farrell', 41, '1956-08-03', 'T', 0),
(417, 'Lucas', 'Morris', 8, '1908-04-12', 'T', 0),
(418, 'Victor', 'Davis', 42, '1944-06-29', 'T', 0),
(419, 'Maddie', 'Robinson', 1, '1915-12-10', 'T', 0),
(420, 'Julia', 'Martin', 6, '2012-10-02', 'T', 0),
(421, 'Rosie', 'Clark', 52, '2021-06-27', 'T', 0),
(422, 'Honey', 'Morris', 28, '1978-05-29', 'T', 0),
(423, 'Vivian', 'Murray', 11, '1910-12-02', 'T', 0),
(424, 'Grace', 'Montgomery', 28, '1978-10-15', 'T', 0),
(425, 'Nicholas', 'Cameron', 7, '2022-01-05', 'T', 0),
(426, 'Daniel', 'Carter', 43, '1955-11-12', 'T', 0),
(427, 'Adeline', 'Rogers', 36, '1974-07-23', 'T', 0),
(428, 'Joseph', 'Foster', 9, '1926-01-14', 'T', 0),
(429, 'Aaron', 'Price', 24, '1964-06-19', 'T', 0),
(430, 'Layla', 'Miller', 49, '1938-03-21', 'T', 0),
(431, 'Sophia', 'Reed', 41, '1930-02-16', 'T', 0),
(432, 'Clara', 'Cooper', 10, '1949-07-25', 'T', 0),
(433, 'Hudson', 'Parker', 44, '1993-03-19', 'T', 0),
(434, 'Clifford', 'Collins', 39, '1996-04-03', 'T', 0),
(435, 'Esther', 'Henderson', 53, '1951-01-11', 'T', 0),
(436, 'Ruby', 'Foster', 25, '1928-08-13', 'T', 0),
(437, 'Harvey', 'Fisher', 32, '1917-05-07', 'T', 0),
(438, 'Lila', 'Bennett', 38, '1994-06-25', 'T', 0),
(439, 'Archer', 'Bryant', 13, '2010-02-08', 'T', 0),
(440, 'Elliott', 'Harrison', 45, '2003-12-30', 'T', 0),
(441, 'Abigail', 'Watkins', 16, '1988-05-09', 'T', 0),
(442, 'Felicity', 'Myers', 42, '1932-03-02', 'T', 0),
(443, 'Alice', 'Ford', 31, '2002-07-22', 'T', 0),
(444, 'Cole', 'Sullivan', 22, '1913-11-14', 'T', 0),
(445, 'Ivy', 'Barnes', 51, '1999-08-18', 'T', 0),
(446, 'Charlotte', 'Adams', 35, '1990-11-11', 'T', 0),
(447, 'Molly', 'Nelson', 26, '1918-06-01', 'T', 0),
(448, 'Max', 'Carter', 19, '1923-04-14', 'T', 0),
(449, 'Olivia', 'Morgan', 15, '1975-09-30', 'T', 0),
(450, 'Nathan', 'Russell', 28, '1936-01-17', 'T', 0),
(451, 'Elise', 'Mitchell', 46, '2015-03-30', 'T', 0),
(452, 'Emily', 'Howard', 25, '1965-09-10', 'T', 0),
(453, 'Olivia', 'Robinson', 30, '2013-03-05', 'T', 0),
(454, 'Jack', 'Anderson', 33, '1907-03-30', 'T', 0),
(455, 'Alexander', 'Wilson', 12, '1917-08-14', 'T', 0),
(456, 'Olivia', 'Davis', 27, '2009-12-03', 'T', 0),
(457, 'Jacob', 'Roberts', 51, '1931-03-24', 'T', 0),
(458, 'Jordan', 'Moore', 47, '1925-02-19', 'T', 0),
(459, 'Amelia', 'Wright', 17, '1924-02-26', 'T', 0),
(460, 'Sarah', 'Harrison', 7, '1956-12-10', 'T', 0),
(461, 'Clark', 'Perry', 36, '1928-08-24', 'T', 0),
(462, 'Fenton', 'Gibson', 13, '1994-06-17', 'T', 0),
(463, 'Dainton', 'Richards', 15, '1997-02-22', 'T', 0),
(464, 'Miranda', 'Jones', 2, '1945-04-25', 'T', 0),
(465, 'Aldus', 'Walker', 11, '1941-10-26', 'T', 0),
(466, 'Patrick', 'Rogers', 51, '1933-06-18', 'T', 0),
(467, 'Ted', 'Johnson', 20, '1927-03-28', 'T', 0),
(468, 'Tara', 'Wright', 33, '1903-09-07', 'T', 0),
(469, 'April', 'Morris', 45, '1947-01-01', 'T', 0),
(470, 'Daryl', 'Allen', 40, '1931-11-21', 'T', 0),
(471, 'Lana', 'Holmes', 38, '2013-12-26', 'T', 0),
(472, 'Abraham', 'Carter', 53, '1997-04-18', 'T', 0),
(473, 'Brianna', 'Clark', 12, '1999-07-19', 'T', 0),
(474, 'Roman', 'Anderson', 40, '1927-06-20', 'T', 0),
(475, 'Darcy', 'Richardson', 16, '1954-12-19', 'T', 0),
(476, 'Audrey', 'Evans', 53, '2021-07-23', 'T', 0),
(477, 'Emily', 'Harris', 56, '1989-08-04', 'T', 0),
(478, 'Wilson', 'Turner', 47, '1925-08-02', 'T', 0),
(479, 'Martin', 'Smith', 41, '1988-02-02', 'T', 0),
(480, 'Aldus', 'Carroll', 31, '1952-01-20', 'T', 0),
(481, 'Connie', 'Turner', 38, '1989-04-04', 'T', 0),
(482, 'Kevin', 'Morris', 22, '1920-10-24', 'T', 0),
(483, 'Lucas', 'Alexander', 44, '1935-10-03', 'T', 0),
(484, 'Audrey', 'Tucker', 39, '2002-10-18', 'T', 0),
(485, 'Antony', 'Morrison', 38, '1935-12-14', 'T', 0),
(486, 'Sabrina', 'Howard', 22, '1969-08-28', 'T', 0),
(487, 'Wilson', 'Warren', 44, '2024-10-10', 'T', 0),
(488, 'Byron', 'Richardson', 45, '2002-07-08', 'T', 0),
(489, 'Michael', 'Crawford', 41, '1958-07-22', 'T', 0),
(490, 'Lucia', 'Morris', 39, '2003-07-31', 'T', 0),
(491, 'Honey', 'Harper', 0, '1911-09-20', 'T', 0),
(492, 'Alberta', 'Reed', 31, '1945-07-30', 'T', 0),
(493, 'Sienna', 'Morrison', 26, '1906-05-19', 'T', 0),
(494, 'Sarah', 'Riley', 24, '1952-11-28', 'T', 0),
(495, 'Alfred', 'Brooks', 38, '2007-10-31', 'T', 0),
(496, 'Joyce', 'Fowler', 42, '1959-06-08', 'T', 0),
(497, 'Anna', 'Robinson', 17, '1945-07-30', 'T', 0),
(498, 'Charlotte', 'Crawford', 50, '1935-06-25', 'T', 0),
(499, 'Edith', 'Stevens', 8, '2010-11-17', 'T', 0),
(500, 'Chloe', 'Wilson', 34, '1923-10-16', 'T', 0),
(501, 'Fenton', 'Armstrong', 7, '1936-11-10', 'T', 0),
(502, 'Stuart', 'Myers', 41, '1958-01-04', 'T', 0),
(503, 'Daniel', 'Higgins', 22, '2020-02-28', 'T', 0),
(504, 'Ashton', 'Morrison', 53, '1998-01-07', 'T', 0),
(505, 'Sofia', 'Campbell', 8, '1950-11-11', 'T', 0),
(506, 'David', 'Taylor', 4, '1987-09-23', 'T', 0),
(507, 'Max', 'Morgan', 1, '1942-06-12', 'T', 0),
(508, 'Charlie', 'Kelley', 36, '1914-03-08', 'T', 0),
(509, 'Ashton', 'Martin', 4, '1915-09-05', 'T', 0),
(510, 'Fenton', 'Tucker', 33, '1939-08-16', 'T', 0),
(511, 'James', 'Carroll', 19, '1940-09-20', 'T', 0),
(512, 'Sam', 'Robinson', 22, '1917-10-16', 'T', 0),
(513, 'Stuart', 'Adams', 40, '1999-12-15', 'T', 0),
(514, 'Lucas', 'Campbell', 41, '1999-08-18', 'T', 0),
(515, 'Joyce', 'Murphy', 5, '1908-04-12', 'T', 0),
(516, 'Joyce', 'Hamilton', 14, '1964-06-12', 'T', 0),
(517, 'Belinda', 'Martin', 28, '1931-01-07', 'T', 0),
(518, 'Lucia', 'Cunningham', 51, '1960-11-09', 'T', 0),
(519, 'Lenny', 'Chapman', 56, '2005-04-30', 'T', 0),
(520, 'Alen', 'Crawford', 39, '1983-11-22', 'T', 0),
(521, 'Elian', 'Cole', 17, '1902-08-10', 'T', 0),
(522, 'Roland', 'Wells', 6, '1975-07-02', 'T', 0),
(523, 'Tony', 'Richardson', 14, '1939-03-19', 'T', 0),
(524, 'Aida', 'Gray', 20, '1934-12-09', 'T', 0),
(525, 'Haley', 'Patterson', 28, '1943-10-30', 'T', 0),
(526, 'Samantha', 'Baker', 33, '1924-01-18', 'T', 0),
(527, 'Russell', 'Hughes', 15, '1927-07-13', 'T', 0),
(528, 'Mason', 'Hughes', 24, '1995-04-06', 'T', 0),
(529, 'Olivia', 'King', 27, '1943-09-10', 'T', 0),
(530, 'Avery', 'Martin', 42, '2017-01-11', 'T', 0),
(531, 'Ashton', 'Stewart', 28, '2023-09-24', 'T', 0),
(532, 'Zoe', 'Cameron', 34, '1983-02-14', 'T', 0),
(533, 'Oscar', 'Morris', 30, '1980-11-06', 'T', 0),
(534, 'Tyler', 'Allen', 48, '1922-04-21', 'T', 0),
(535, 'Ella', 'Young', 25, '1921-02-15', 'T', 0),
(536, 'Martin', 'Simmons', 42, '1940-08-28', 'T', 0),
(537, 'Olivia', 'Davis', 41, '2005-09-25', 'T', 0),
(538, 'Amelia', 'Foster', 22, '2007-12-17', 'T', 0),
(539, 'Edward', 'Evans', 40, '1953-07-02', 'T', 0),
(540, 'Chloe', 'Cook', 26, '1993-01-06', 'T', 0),
(541, 'Thomas', 'Scott', 30, '2004-02-24', 'T', 0),
(542, 'Megan', 'Mitchell', 41, '1985-11-02', 'T', 0),
(543, 'Lauren', 'Nelson', 46, '2019-04-12', 'T', 0),
(544, 'Sydney', 'Warren', 33, '1942-10-16', 'T', 0),
(545, 'Ronald', 'Reed', 51, '2013-08-29', 'T', 0),
(546, 'David', 'Watson', 34, '1991-01-21', 'T', 0),
(547, 'George', 'Wood', 23, '1994-07-01', 'T', 0),
(548, 'Jenna', 'Morris', 29, '1930-10-25', 'T', 0),
(549, 'Alfred', 'Howard', 16, '2002-01-30', 'T', 0),
(550, 'William', 'Cameron', 39, '1956-05-10', 'T', 0),
(551, 'Grace', 'Jackson', 41, '2024-09-17', 'T', 0),
(552, 'Brianna', 'Taylor', 28, '2014-12-06', 'T', 0),
(553, 'Eva', 'Thomas', 47, '2024-02-17', 'T', 0),
(554, 'Charlotte', 'Hunter', 33, '1940-01-19', 'T', 0),
(555, 'Daniel', 'Cooper', 29, '2006-11-30', 'T', 0),
(556, 'Audrey', 'Harper', 12, '1989-01-19', 'T', 0),
(557, 'Nathaniel', 'Johnson', 32, '1957-06-12', 'T', 0),
(558, 'Brian', 'Walker', 52, '1998-04-10', 'T', 0),
(559, 'Victor', 'Adams', 34, '1947-02-28', 'T', 0),
(560, 'Hannah', 'White', 45, '1950-06-02', 'T', 0),
(561, 'Sophie', 'Hall', 41, '1989-12-15', 'T', 0),
(562, 'Lucas', 'Gonzalez', 19, '1998-07-13', 'T', 0),
(563, 'Sophia', 'Morris', 41, '2007-11-01', 'T', 0),
(564, 'Ivy', 'Parker', 27, '1945-03-16', 'T', 0),
(565, 'John', 'Young', 44, '2021-06-28', 'T', 0),
(566, 'Levi', 'Grant', 41, '1996-07-11', 'T', 0),
(567, 'Mason', 'Wells', 25, '1982-05-03', 'T', 0),
(568, 'Isla', 'King', 33, '2000-03-25', 'T', 0),
(569, 'Miles', 'Parker', 30, '2006-02-13', 'T', 0),
(570, 'Tessa', 'Gonzalez', 15, '2023-10-21', 'T', 0),
(571, 'Sophie', 'Fletcher', 13, '2023-04-01', 'T', 0),
(572, 'Kendall', 'Morris', 50, '2007-11-17', 'T', 0),
(573, 'Harley', 'Gibson', 9, '2015-09-16', 'T', 0),
(574, 'Luca', 'Evans', 16, '1998-04-12', 'T', 0),
(575, 'Harrison', 'James', 22, '2005-06-14', 'T', 0),
(576, 'Scarlett', 'Fowler', 41, '2020-12-14', 'T', 0),
(577, 'Oliver', 'Chavez', 26, '1983-04-04', 'T', 0),
(578, 'Zoey', 'Chapman', 34, '2014-08-29', 'T', 0),
(579, 'Ella', 'Green', 23, '2024-02-13', 'T', 0),
(580, 'Lily', 'Harrison', 44, '2018-10-02', 'T', 0),
(581, 'Emilia', 'Harper', 31, '2020-02-11', 'T', 0),
(582, 'Clara', 'Simmons', 42, '1999-12-19', 'T', 0),
(583, 'Finn', 'Nelson', 48, '1956-05-17', 'T', 0),
(584, 'Oliver', 'Bennett', 47, '2012-01-01', 'T', 0),
(585, 'Benjamin', 'Brooks', 32, '2003-08-05', 'T', 0),
(586, 'Grayson', 'Wright', 21, '2017-09-18', 'T', 0),
(587, 'Sophie', 'Ford', 29, '1983-03-15', 'T', 0),
(588, 'Isaac', 'Foster', 39, '1997-10-02', 'T', 0),
(589, 'Adam', 'Campbell', 31, '1995-02-25', 'T', 0),
(590, 'Lydia', 'Harrison', 41, '2020-11-11', 'T', 0),
(591, 'Olivia', 'Barnes', 22, '2002-04-11', 'T', 0),
(592, 'Mason', 'Scott', 30, '2023-01-16', 'T', 0),
(593, 'Paige', 'Davis', 21, '2019-06-07', 'T', 0),
(594, 'Owen', 'Morgan', 42, '2011-07-19', 'T', 0),
(595, 'Nina', 'Williams', 50, '2021-11-27', 'T', 0),
(596, 'Eliza', 'Parker', 26, '2009-12-10', 'T', 0),
(597, 'Lucy', 'White', 44, '2004-10-15', 'T', 0),
(598, 'Jack', 'Ward', 48, '2020-07-18', 'T', 0),
(599, 'Luke', 'Evans', 39, '2000-03-03', 'T', 0),
(600, 'Ethan', 'Cooper', 29, '2013-08-09', 'T', 0),
(601, 'Kristian', 'Hunt', 21, '1937-07-01', 'T', 0),
(602, 'Oscar', 'Morrison', 36, '1920-01-02', 'T', 0),
(603, 'Thomas', 'Bennett', 18, '1913-10-26', 'T', 0),
(604, 'Paige', 'Davis', 26, '2007-07-09', 'T', 0),
(605, 'Valeria', 'Montgomery', 23, '1910-07-05', 'T', 0),
(606, 'Brianna', 'Thomas', 43, '1929-12-04', 'T', 0),
(607, 'Ashton', 'Adams', 47, '1915-05-16', 'T', 0),
(608, 'Amanda', 'Parker', 37, '2024-03-06', 'T', 0),
(609, 'Abraham', 'Robinson', 48, '2002-03-25', 'T', 0),
(610, 'Max', 'Dixon', 51, '1923-09-25', 'T', 0),
(611, 'Adelaide', 'Richardson', 45, '1976-08-07', 'T', 0),
(612, 'Alexander', 'Watson', 51, '1902-01-01', 'T', 0),
(613, 'Chester', 'Elliott', 37, '1926-02-06', 'T', 0),
(614, 'Eleanor', 'Taylor', 28, '1999-10-25', 'T', 0),
(615, 'Brooke', 'Cunningham', 47, '1904-03-31', 'T', 0),
(616, 'Ryan', 'Carter', 40, '2008-06-18', 'T', 0),
(617, 'Miley', 'Evans', 27, '1994-02-24', 'T', 0),
(618, 'Julia', 'Stevens', 9, '1997-11-09', 'T', 0),
(619, 'Ned', 'Morgan', 3, '1997-06-21', 'T', 0),
(620, 'Wilson', 'Richardson', 2, '1999-09-09', 'T', 0),
(621, 'Tyler', 'Sullivan', 55, '2001-03-29', 'T', 0),
(622, 'Alexia', 'Adams', 32, '1913-03-18', 'T', 0),
(623, 'Melanie', 'Moore', 28, '1926-01-30', 'T', 0),
(624, 'Lenny', 'Cameron', 33, '1925-09-28', 'T', 0),
(625, 'Eleanor', 'Smith', 1, '1964-11-13', 'T', 0),
(626, 'Miller', 'Montgomery', 40, '1980-01-18', 'T', 0),
(627, 'Heather', 'Evans', 8, '1978-01-31', 'T', 0),
(628, 'Lana', 'Miller', 24, '1947-08-08', 'T', 0),
(629, 'Lily', 'Harper', 6, '1985-10-22', 'T', 0),
(630, 'Stuart', 'Scott', 39, '1930-09-15', 'T', 0),
(631, 'Jacob', 'Taylor', 38, '1935-06-27', 'T', 0),
(632, 'Tiana', 'Holmes', 38, '1989-06-17', 'T', 0),
(633, 'Lily', 'Cole', 42, '1977-11-09', 'T', 0),
(634, 'Reid', 'Thompson', 12, '1972-05-27', 'T', 0),
(635, 'Byron', 'Anderson', 26, '1909-08-12', 'T', 0),
(636, 'Sarah', 'Tucker', 25, '1969-07-01', 'T', 0),
(637, 'Savana', 'Henderson', 27, '1981-05-25', 'T', 0),
(638, 'William', 'Miller', 43, '1920-09-03', 'T', 0),
(639, 'Bruce', 'Riley', 19, '1932-06-02', 'T', 0),
(640, 'Deanna', 'Harper', 55, '1923-09-13', 'T', 0),
(641, 'Arnold', 'Thompson', 46, '2000-03-17', 'T', 0),
(642, 'Rubie', 'Craig', 10, '1912-05-24', 'T', 0),
(643, 'Victor', 'Farrell', 45, '1913-11-04', 'T', 0),
(644, 'Wilson', 'Carroll', 27, '1966-11-24', 'T', 0),
(645, 'Vanessa', 'Chapman', 40, '1977-11-21', 'T', 0),
(646, 'Henry', 'Crawford', 43, '1924-03-09', 'T', 0),
(647, 'Wilson', 'Grant', 16, '1947-10-07', 'T', 0),
(648, 'Tyler', 'Alexander', 45, '2012-01-03', 'T', 0),
(649, 'Kellan', 'Owens', 6, '1964-06-08', 'T', 0),
(650, 'Adrian', 'Thomas', 22, '2007-04-13', 'T', 0),
(651, 'Cadie', 'Payne', 16, '1963-06-07', 'T', 0),
(652, 'Andrew', 'Morrison', 5, '2007-12-17', 'T', 0),
(653, 'Derek', 'Grant', 46, '1946-12-22', 'T', 0),
(654, 'Lucia', 'Miller', 24, '1916-04-18', 'T', 0),
(655, 'Thomas', 'Myers', 5, '1953-01-20', 'T', 0),
(656, 'Daniel', 'Montgomery', 53, '1928-10-21', 'T', 0),
(657, 'Agata', 'Harper', 1, '1908-09-27', 'T', 0),
(658, 'Lucia', 'Myers', 47, '1965-12-22', 'T', 0),
(659, 'Cherry', 'Reed', 15, '2021-10-01', 'T', 0),
(660, 'Amelia', 'Reed', 29, '1967-02-20', 'T', 0),
(661, 'Sophia', 'Armstrong', 8, '1901-12-29', 'T', 0),
(662, 'Camila', 'Richardson', 8, '2020-11-21', 'T', 0),
(663, 'Albert', 'Martin', 33, '1950-07-18', 'T', 0),
(664, 'Jordan', 'Wilson', 1, '1991-08-12', 'T', 0),
(665, 'Adison', 'Andrews', 46, '1954-06-28', 'T', 0),
(666, 'Max', 'Wright', 35, '1908-03-10', 'T', 0),
(667, 'Miley', 'Brown', 30, '1977-08-03', 'T', 0),
(668, 'Frederick', 'Ross', 48, '1930-01-02', 'T', 0),
(669, 'Myra', 'Payne', 41, '1997-05-16', 'T', 0),
(670, 'Evelyn', 'Reed', 27, '1969-09-22', 'T', 0),
(671, 'Wilson', 'Wells', 4, '2003-07-06', 'T', 0),
(672, 'Kevin', 'Rogers', 56, '1988-01-02', 'T', 0),
(673, 'Edgar', 'Morrison', 22, '1911-02-02', 'T', 0),
(674, 'Nicholas', 'Adams', 2, '1968-07-14', 'T', 0),
(675, 'Liam', 'Hunter', 10, '1965-11-03', 'T', 0),
(676, 'Rylee', 'Miller', 25, '1974-05-11', 'T', 0),
(677, 'Holly', 'Lewis', 43, '2014-01-19', 'T', 0),
(678, 'Ryder', 'Taylor', 17, '1981-01-05', 'T', 0),
(679, 'Elise', 'Mitchell', 46, '2015-03-30', 'T', 0),
(680, 'Toby', 'Richardson', 36, '2007-06-23', 'T', 0),
(681, 'Lucas', 'Lee', 40, '2016-12-15', 'T', 0),
(682, 'Charlie', 'Harris', 26, '1988-03-09', 'T', 0),
(683, 'Madison', 'Clark', 42, '2009-07-16', 'T', 0),
(684, 'Jake', 'Gonzalez', 33, '1995-08-19', 'T', 0),
(685, 'Sarah', 'Roberts', 29, '2023-05-28', 'T', 0),
(686, 'Isabella', 'Allen', 23, '2011-11-30', 'T', 0),
(687, 'Matthew', 'Nelson', 39, '1996-12-10', 'T', 0),
(688, 'Daniel', 'Miller', 31, '2019-03-03', 'T', 0),
(689, 'Ella', 'Young', 38, '1998-06-02', 'T', 0),
(690, 'Olivia', 'King', 25, '2017-01-10', 'T', 0),
(691, 'Jack', 'Scott', 44, '2015-09-19', 'T', 0),
(692, 'Benjamin', 'Gonzalez', 35, '2020-06-23', 'T', 0),
(693, 'Chloe', 'White', 30, '2014-10-14', 'T', 0),
(694, 'Liam', 'Baker', 32, '2022-11-28', 'T', 0),
(695, 'Charlotte', 'Moore', 39, '2018-04-20', 'T', 0),
(696, 'William', 'Brown', 28, '2021-02-16', 'T', 0),
(697, 'Avery', 'Johnson', 41, '2014-08-03', 'T', 0),
(698, 'Sophia', 'Taylor', 33, '2015-12-27', 'T', 0),
(699, 'Mason', 'Hernandez', 29, '2013-07-04', 'T', 0),
(700, 'Amelia', 'Martin', 37, '2020-04-15', 'T', 0),
(701, 'Jack', 'Walker', 42, '2022-08-02', 'T', 0),
(702, 'Elijah', 'White', 27, '2020-01-08', 'T', 0),
(703, 'Lily', 'Young', 39, '2017-12-11', 'T', 0),
(704, 'Scarlett', 'Moore', 25, '2016-05-01', 'T', 0),
(705, 'Sophie', 'Allen', 30, '2022-07-27', 'T', 0),
(706, 'Henry', 'King', 38, '2021-06-10', 'T', 0),
(707, 'Grace', 'Harris', 34, '2020-04-21', 'T', 0),
(708, 'Oliver', 'Gonzalez', 24, '2019-02-11', 'T', 0),
(709, 'Aidan', 'Smith', 32, '2018-09-03', 'T', 0),
(710, 'Maya', 'Roberts', 27, '2020-11-04', 'T', 0),
(711, 'Elena', 'Martin', 35, '2017-05-18', 'T', 0),
(712, 'Michaela', 'Clark', 31, '2021-10-23', 'T', 0),
(713, 'Miles', 'Taylor', 29, '2022-12-05', 'T', 0),
(714, 'Ethan', 'Hernandez', 39, '2019-03-06', 'T', 0),
(715, 'Oliver', 'Brown', 30, '2021-08-13', 'T', 0),
(716, 'Natalie', 'Nelson', 41, '2020-02-07', 'T', 0),
(717, 'Madeline', 'Moore', 33, '2022-04-14', 'T', 0),
(718, 'Ella', 'Gonzalez', 37, '2019-06-21', 'T', 0),
(719, 'Benjamin', 'Baker', 36, '2021-07-29', 'T', 0),
(720, 'Isabella', 'Young', 40, '2023-09-06', 'T', 0),
(721, 'Hannah', 'Martin', 26, '2022-05-04', 'T', 0),
(722, 'Oliver', 'Roberts', 31, '2023-08-10', 'T', 0),
(723, 'Lucas', 'King', 25, '2021-01-23', 'T', 0),
(724, 'Amelia', 'Moore', 43, '2022-06-09', 'T', 0),
(725, 'Sebastian', 'Gonzalez', 31, '2017-01-14', 'T', 0),
(726, 'Nina', 'Taylor', 32, '2020-10-11', 'T', 0),
(727, 'Katherine', 'Walker', 28, '2021-07-01', 'T', 0),
(728, 'James', 'Nelson', 34, '2023-02-12', 'T', 0),
(729, 'Mila', 'Brown', 30, '2022-11-23', 'T', 0),
(730, 'Liam', 'Martin', 39, '2021-04-05', 'T', 0),
(731, 'Sofia', 'Johnson', 32, '2022-06-19', 'T', 0),
(732, 'Eleanor', 'Hernandez', 27, '2023-03-25', 'T', 0),
(733, 'Zoe', 'Roberts', 28, '2020-10-02', 'T', 0),
(734, 'Elijah', 'Smith', 41, '2023-05-07', 'T', 0),
(735, 'Emily', 'Taylor', 39, '2021-03-18', 'T', 0),
(736, 'Joseph', 'Brown', 26, '2022-11-13', 'T', 0),
(737, 'Ella', 'Gonzalez', 30, '2023-08-17', 'T', 0),
(738, 'Liam', 'Walker', 35, '2021-09-24', 'T', 0),
(739, 'Chloe', 'Young', 41, '2020-04-19', 'T', 0),
(740, 'Charlotte', 'Martin', 27, '2021-10-05', 'T', 0),
(741, 'Elena', 'Brown', 33, '2022-03-14', 'T', 0),
(742, 'Grayson', 'Nelson', 38, '2020-11-27', 'T', 0),
(743, 'Ava', 'Smith', 29, '2023-04-12', 'T', 0),
(744, 'Sophia', 'Walker', 37, '2021-02-20', 'T', 0),
(745, 'Amelia', 'Roberts', 36, '2023-07-02', 'T', 0),
(746, 'Aiden', 'Taylor', 41, '2020-12-13', 'T', 0),
(747, 'Ella', 'Johnson', 28, '2022-02-04', 'T', 0),
(748, 'Matthew', 'Martin', 38, '2021-06-18', 'T', 0),
(749, 'Lucas', 'Brown', 31, '2020-10-30', 'T', 0),
(750, 'Scarlett', 'Hernandez', 39, '2022-09-22', 'T', 0),
(751, 'Mike', 'Howard', 47, '1985-01-07', 'T', 0),
(752, 'Joyce', 'Andrews', 1, '1984-07-05', 'T', 0),
(753, 'Kelsey', 'Roberts', 16, '1996-04-13', 'T', 0),
(754, 'Violet', 'Andrews', 50, '1984-01-09', 'T', 0),
(755, 'Vanessa', 'Harrison', 3, '1939-08-24', 'T', 0),
(756, 'Emma', 'Thomas', 17, '2009-05-13', 'T', 0),
(757, 'Sienna', 'Myers', 52, '1980-06-17', 'T', 0),
(758, 'Maria', 'Howard', 55, '1910-03-15', 'T', 0),
(759, 'Kimberly', 'Johnston', 51, '1982-04-18', 'T', 0),
(760, 'Charlotte', 'Hall', 43, '1991-06-22', 'T', 0),
(761, 'Isabella', 'Casey', 9, '1950-04-09', 'T', 0),
(762, 'Daryl', 'Bennett', 31, '1999-06-16', 'T', 0),
(763, 'Valeria', 'Tucker', 14, '1931-05-30', 'T', 0),
(764, 'Ryan', 'Douglas', 3, '1950-02-04', 'T', 0),
(765, 'Mike', 'Hawkins', 31, '1918-10-16', 'T', 0),
(766, 'Sawyer', 'Ferguson', 32, '1910-04-18', 'T', 0),
(767, 'Amy', 'Perry', 4, '1903-02-01', 'T', 0),
(768, 'Andrew', 'Taylor', 1, '1922-01-11', 'T', 0),
(769, 'Kirsten', 'Harris', 14, '1947-10-10', 'T', 0),
(770, 'Patrick', 'Brooks', 21, '1982-01-20', 'T', 0),
(771, 'Wilson', 'Gray', 21, '1996-12-16', 'T', 0),
(772, 'Darcy', 'Cooper', 51, '1970-08-23', 'T', 0),
(773, 'Amy', 'Barnes', 9, '1972-03-22', 'T', 0),
(774, 'Melanie', 'Taylor', 26, '1947-10-26', 'T', 0),
(775, 'Vanessa', 'Allen', 41, '1926-05-18', 'T', 0),
(776, 'Victor', 'Mitchell', 25, '1951-07-15', 'T', 0),
(777, 'Tiana', 'Evans', 29, '1974-01-06', 'T', 0),
(778, 'Owen', 'Farrell', 31, '1940-12-04', 'T', 0),
(779, 'Agata', 'Wright', 33, '2001-04-23', 'T', 0),
(780, 'Nicole', 'Barnes', 4, '1978-12-12', 'T', 0),
(781, 'Isabella', 'Cole', 48, '1990-07-24', 'T', 0),
(782, 'Tess', 'Russell', 19, '1994-11-24', 'T', 0),
(783, 'Alina', 'Evans', 10, '1962-08-01', 'T', 0),
(784, 'Reid', 'Miller', 35, '1991-12-07', 'T', 0),
(785, 'Harold', 'Murphy', 14, '1946-02-20', 'T', 0),
(786, 'Preston', 'Robinson', 32, '1942-01-14', 'T', 0),
(787, 'Charlie', 'Barnes', 40, '1933-11-03', 'T', 0),
(788, 'Vanessa', 'Johnston', 3, '2006-09-11', 'T', 0),
(789, 'Vivian', 'Craig', 10, '1906-09-05', 'T', 0),
(790, 'Daryl', 'Henderson', 28, '1911-11-19', 'T', 0),
(791, 'Edith', 'Cole', 53, '1927-09-14', 'T', 0),
(792, 'Robert', 'Barnes', 10, '1935-01-23', 'T', 0),
(793, 'Rosie', 'Barnes', 21, '1997-04-22', 'T', 0),
(794, 'Natalie', 'Casey', 28, '1937-09-06', 'T', 0),
(795, 'Gianna', 'Barnes', 12, '1920-04-27', 'T', 0),
(796, 'Lana', 'Jones', 50, '1955-03-26', 'T', 0),
(797, 'Albert', 'Hill', 56, '1975-08-26', 'T', 0),
(798, 'Darcy', 'Douglas', 6, '1985-04-05', 'T', 0),
(799, 'Reid', 'Russell', 23, '1957-02-16', 'T', 0),
(800, 'Belinda', 'Hill', 1, '1955-02-27', 'T', 0),
(801, 'Abraham', 'Owens', 45, '2000-09-21', 'T', 0),
(802, 'Ada', 'Watson', 29, '2015-12-29', 'T', 0),
(803, 'Julian', 'Thomas', 4, '1931-04-14', 'T', 0),
(804, 'Daryl', 'Owens', 27, '1968-08-02', 'T', 0),
(805, 'Roman', 'Nelson', 56, '1977-09-10', 'T', 0),
(806, 'Stuart', 'Davis', 46, '2004-05-02', 'T', 0),
(807, 'Julian', 'Phillips', 20, '1960-09-30', 'T', 0),
(808, 'Alina', 'Hawkins', 17, '1995-02-11', 'T', 0),
(809, 'Hailey', 'Craig', 7, '1921-11-23', 'T', 0),
(810, 'Ned', 'Evans', 17, '1963-01-03', 'T', 0),
(811, 'Rafael', 'Wells', 49, '1919-07-24', 'T', 0),
(812, 'Lucas', 'Cooper', 54, '1940-02-27', 'T', 0),
(813, 'Henry', 'Tucker', 46, '1994-11-24', 'T', 0),
(814, 'Melissa', 'Robinson', 52, '1907-06-22', 'T', 0),
(815, 'Tiana', 'Stevens', 3, '1918-05-08', 'T', 0),
(816, 'Alina', 'Moore', 1, '1976-05-22', 'T', 0),
(817, 'Alexander', 'Reed', 9, '1946-03-02', 'T', 0),
(818, 'Jordan', 'Parker', 5, '1921-10-27', 'T', 0),
(819, 'Rebecca', 'Mitchell', 52, '1947-11-16', 'T', 0),
(820, 'Daryl', 'Reed', 12, '1918-04-12', 'T', 0),
(821, 'Julian', 'Russell', 56, '1955-10-03', 'T', 0),
(822, 'Lucy', 'Kelley', 23, '1963-05-01', 'T', 0),
(823, 'Eddy', 'Murphy', 43, '1961-05-21', 'T', 0),
(824, 'Adrian', 'Reed', 33, '1948-09-05', 'T', 0),
(825, 'Isabella', 'Watson', 33, '2000-02-26', 'T', 0),
(826, 'Lana', 'Brooks', 22, '1953-01-24', 'T', 0),
(827, 'Adam', 'Ferguson', 35, '1983-08-05', 'T', 0),
(828, 'Beatrice', 'Douglas', 50, '1986-01-21', 'T', 0),
(829, 'Alina', 'Phillips', 38, '1983-07-05', 'T', 0),
(830, 'Patrick', 'Rodriguez', 39, '1997-02-11', 'T', 0),
(831, 'Oscar', 'Murphy', 21, '1998-11-02', 'T', 0),
(832, 'Lucy', 'Russell', 30, '2023-04-10', 'T', 0),
(833, 'Eleanor', 'Mitchell', 47, '2020-12-15', 'T', 0),
(834, 'Gianna', 'Henderson', 26, '2024-01-30', 'T', 0),
(835, 'Rose', 'Wells', 25, '2016-11-12', 'T', 0),
(836, 'Dylan', 'Jones', 33, '2002-01-13', 'T', 0),
(837, 'Lily', 'Smith', 15, '2001-11-01', 'T', 0),
(838, 'Eleanor', 'Harris', 52, '2013-08-22', 'T', 0),
(839, 'Tiana', 'Moore', 5, '2004-09-07', 'T', 0),
(840, 'Melissa', 'Russell', 38, '2011-04-01', 'T', 0),
(841, 'Owen', 'Owens', 28, '2024-01-15', 'T', 0),
(842, 'Tiana', 'Parker', 31, '2023-11-01', 'T', 0),
(843, 'Rosa', 'Jones', 25, '2023-09-10', 'T', 0),
(844, 'Diana', 'Reed', 25, '2024-02-13', 'T', 0),
(845, 'Gianna', 'Moore', 36, '2019-03-08', 'T', 0),
(846, 'Albert', 'Robinson', 42, '2006-10-19', 'T', 0),
(847, 'Kelsey', 'Cooper', 21, '1992-08-25', 'T', 0),
(848, 'Emma', 'Phillips', 50, '2020-12-10', 'T', 0),
(849, 'Harold', 'Tucker', 43, '1984-09-02', 'T', 0),
(850, 'Jordan', 'Barnes', 49, '2018-06-14', 'T', 0),
(851, 'Grace', 'Nelson', 5, '2023-11-02', 'T', 0),
(852, 'Isabelle', 'Casey', 16, '2022-04-18', 'T', 0),
(853, 'Daniel', 'Ferguson', 3, '2007-07-17', 'T', 0),
(854, 'Natalie', 'Mitchell', 5, '2018-02-02', 'T', 0),
(855, 'Tess', 'Jones', 44, '2024-05-19', 'T', 0),
(856, 'Isabelle', 'Thomas', 38, '2012-10-25', 'T', 0),
(857, 'Vanessa', 'Parker', 32, '2016-12-01', 'T', 0),
(858, 'Patrick', 'Douglas', 34, '2024-11-15', 'T', 0),
(859, 'Adam', 'Mitchell', 41, '2024-03-04', 'T', 0),
(860, 'Madeline', 'Taylor', 47, '2021-08-12', 'T', 0),
(861, 'Mason', 'Thomas', 45, '2023-06-17', 'T', 0),
(862, 'Diana', 'Harris', 23, '2014-10-10', 'T', 0),
(863, 'Olivia', 'Hernandez', 22, '2017-07-24', 'T', 0),
(864, 'Madeline', 'Moore', 5, '2024-04-28', 'T', 0),
(865, 'Violet', 'Barnes', 39, '2023-09-01', 'T', 0),
(866, 'Jordan', 'Davis', 37, '2021-09-18', 'T', 0),
(867, 'Owen', 'Mitchell', 44, '2020-03-28', 'T', 0),
(868, 'Grace', 'Miller', 14, '2024-06-11', 'T', 0),
(869, 'Alexander', 'Barnes', 25, '2017-04-02', 'T', 0),
(870, 'Lucia', 'Reed', 33, '2020-08-29', 'T', 0),
(871, 'Jack', 'Nelson', 39, '2014-02-18', 'T', 0),
(872, 'Rosa', 'Davis', 26, '2018-03-10', 'T', 0),
(873, 'Edward', 'Cooper', 33, '2023-01-07', 'T', 0),
(874, 'Gianna', 'Reed', 51, '2023-06-20', 'T', 0),
(875, 'Owen', 'Gray', 30, '2019-07-15', 'T', 0),
(876, 'Oscar', 'Taylor', 32, '2020-04-28', 'T', 0),
(877, 'Diane', 'Barnes', 17, '2023-11-30', 'T', 0),
(878, 'Ruby', 'Jones', 42, '2022-12-09', 'T', 0),
(879, 'Andrew', 'Casey', 3, '2015-03-17', 'T', 0),
(880, 'Frank', 'Taylor', 38, '2024-07-06', 'T', 0),
(881, 'Natalie', 'Reed', 22, '2017-03-10', 'T', 0),
(882, 'Max', 'Ferguson', 45, '2023-02-11', 'T', 0),
(883, 'Natalie', 'Owens', 23, '2024-08-01', 'T', 0),
(884, 'Olivia', 'Mitchell', 16, '2022-11-01', 'T', 0),
(885, 'Benjamin', 'Moore', 32, '2016-12-19', 'T', 0),
(886, 'Andrew', 'Ferguson', 42, '2015-11-20', 'T', 0),
(887, 'Violet', 'Gray', 33, '2021-01-23', 'T', 0),
(888, 'Gianna', 'Taylor', 52, '2023-11-04', 'T', 0),
(889, 'Harold', 'Moore', 22, '2019-12-13', 'T', 0),
(890, 'Reid', 'Casey', 1, '2024-02-02', 'T', 0),
(891, 'Harold', 'Barnes', 36, '2018-07-01', 'T', 0),
(892, 'Oscar', 'Tucker', 37, '2023-05-16', 'T', 0),
(893, 'Diana', 'Nelson', 5, '2023-08-21', 'T', 0),
(894, 'Tess', 'Taylor', 51, '2019-05-12', 'T', 0),
(895, 'Jordan', 'Casey', 36, '2022-01-30', 'T', 0),
(896, 'Olivia', 'Tucker', 43, '2024-06-01', 'T', 0),
(897, 'Rebecca', 'Stevens', 25, '2015-10-22', 'T', 0),
(898, 'Mason', 'Harris', 47, '2020-10-29', 'T', 0),
(899, 'Henry', 'Nelson', 23, '2022-05-02', 'T', 0),
(900, 'Lucia', 'Thomas', 50, '2024-09-15', 'T', 0);

INSERT INTO `Crimes` VALUES
 (0,'VEHICLE - STOLEN',4,'2020-03-01',24,198,0)
,(1,'BURGLARY FROM VEHICLE',201,'2020-02-08',9,783,0)
,(2,'BIKE - STOLEN',132,'2020-11-04',4,104,0)
,(3,'SHOPLIFTING-GRAND THEFT ($950.01 & OVER)',151,'2020-03-10',24,426,0)
,(4,'THEFT OF IDENTITY',222,'2020-08-17',36,730,0)
,(5,'THEFT OF IDENTITY',158,'2020-12-01',36,402,0)
,(6,'THEFT OF IDENTITY',231,'2020-07-03',36,433,0)
,(7,'THEFT OF IDENTITY',181,'2020-05-12',36,520,0)
,(8,'THEFT OF IDENTITY',27,'2020-12-09',36,671,0)
,(9,'BATTERY - SIMPLE ASSAULT',132,'2020-12-31',9,652,0)
,(10,'THEFT OF IDENTITY',30,'2020-07-01',36,770,0)
,(11,'SODOMY/SEXUAL CONTACT B/W PENIS OF ONE PERS TO ANUS OTH',101,'2020-10-01',96,113,0)
,(12,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',269,'2020-02-01',180,779,0)
,(13,'VEHICLE - STOLEN',250,'2020-11-01',24,225,0)
,(14,'THEFT OF IDENTITY',16,'2020-02-02',36,140,0)
,(15,'THEFT OF IDENTITY',185,'2020-07-01',36,668,0)
,(16,'THEFT OF IDENTITY',206,'2020-01-09',36,275,0)
,(17,'ASSAULT WITH DEADLY WEAPON, AGGRAVATED ASSAULT',173,'2020-11-27',48,615,0)
,(18,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',45,'2020-01-01',18,657,0)
,(19,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',198,'2020-02-11',24,458,0)
,(20,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',175,'2020-01-01',24,271,0)
,(21,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',154,'2020-03-15',180,467,0)
,(22,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',178,'2020-07-01',180,32,0)
,(23,'VEHICLE - STOLEN',239,'2020-09-09',24,96,0)
,(24,'THEFT OF IDENTITY',105,'2020-07-01',36,348,0)
,(25,'CRIMINAL THREATS - NO WEAPON DISPLAYED',286,'2020-02-09',18,368,0)
,(26,'EMBEZZLEMENT, GRAND THEFT ($950.01 & OVER)',158,'2020-08-14',36,35,0)
,(27,'VEHICLE - STOLEN',197,'2020-05-02',24,133,0)
,(28,'THEFT OF IDENTITY',242,'2020-07-01',36,8,0)
,(29,'BATTERY - SIMPLE ASSAULT',31,'2020-03-30',9,377,0)
,(30,'THEFT OF IDENTITY',162,'2020-01-27',36,142,0)
,(31,'THEFT OF IDENTITY',115,'2020-01-01',36,760,0)
,(32,'BURGLARY FROM VEHICLE',137,'2020-05-08',9,620,0)
,(33,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',210,'2020-01-18',4,666,0)
,(34,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',104,'2020-05-26',4,119,0)
,(35,'CRIMINAL THREATS - NO WEAPON DISPLAYED',292,'2020-11-26',18,537,0)
,(36,'THEFT OF IDENTITY',232,'2020-03-10',36,88,0)
,(37,'THEFT OF IDENTITY',151,'2020-04-01',36,103,0)
,(38,'THEFT OF IDENTITY',40,'2020-06-28',36,391,0)
,(39,'THEFT OF IDENTITY',123,'2020-09-02',36,347,0)
,(40,'THEFT OF IDENTITY',124,'2020-10-23',36,699,0)
,(41,'THEFT OF IDENTITY',295,'2020-01-01',36,270,0)
,(42,'CHILD ANNOYING (17YRS & UNDER)',27,'2020-01-01',18,368,0)
,(43,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',81,'2020-10-30',180,354,0)
,(44,'THEFT OF IDENTITY',19,'2020-12-10',36,511,0)
,(45,'THEFT OF IDENTITY',275,'2020-02-01',36,577,0)
,(46,'THEFT OF IDENTITY',0,'2020-01-14',36,350,0)
,(47,'THEFT OF IDENTITY',214,'2020-05-17',36,512,0)
,(48,'THEFT OF IDENTITY',196,'2020-02-23',36,761,0)
,(49,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',207,'2020-07-07',24,173,0)
,(50,'THEFT OF IDENTITY',85,'2020-07-14',36,387,0)
,(51,'THEFT OF IDENTITY',291,'2020-08-01',36,505,0)
,(52,'THEFT OF IDENTITY',12,'2020-06-01',36,524,0)
,(53,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',272,'1010-11-13',4,114,0)
,(54,'THEFT PLAIN - PETTY ($950 & UNDER)',274,'2020-11-12',6,781,0)
,(55,'THEFT OF IDENTITY',194,'2020-05-08',36,525,0)
,(56,'THEFT OF IDENTITY',4,'2020-01-01',36,684,0)
,(57,'THEFT OF IDENTITY',127,'2020-03-29',36,539,0)
,(58,'THEFT OF IDENTITY',298,'2020-07-01',36,138,0)
,(59,'THEFT OF IDENTITY',144,'2020-07-09',36,44,0)
,(60,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',109,'2020-12-20',24,492,0)
,(61,'INTIMATE PARTNER - SIMPLE ASSAULT',257,'2020-09-13',9,427,0)
,(62,'THEFT PLAIN - PETTY ($950 & UNDER)',195,'2020-12-02',6,525,0)
,(63,'BURGLARY FROM VEHICLE',199,'2020-06-27',9,66,0)
,(64,'THEFT OF IDENTITY',111,'2020-09-02',36,459,0)
,(65,'THEFT OF IDENTITY',32,'2020-01-26',36,41,0)
,(66,'LEWD CONDUCT',73,'2020-01-01',24,279,0)
,(67,'THEFT PLAIN - ATTEMPT',9,'2020-05-20',6,683,0)
,(68,'THEFT OF IDENTITY',65,'2020-06-25',36,614,0)
,(69,'THEFT OF IDENTITY',253,'2020-04-05',36,734,0)
,(70,'BURGLARY',230,'2020-12-28',36,338,0)
,(71,'THEFT OF IDENTITY',288,'2020-10-12',36,310,0)
,(72,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',43,'2020-09-01',180,627,0)
,(73,'THEFT OF IDENTITY',163,'2020-04-02',36,450,0)
,(74,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',170,'2020-12-31',4,71,0)
,(75,'THEFT OF IDENTITY',21,'2020-08-23',36,540,0)
,(76,'THEFT OF IDENTITY',169,'2020-06-03',36,677,0)
,(77,'THEFT OF IDENTITY',174,'2020-06-23',36,564,0)
,(78,'VEHICLE - STOLEN',296,'2020-04-22',24,252,0)
,(79,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',217,'2020-11-12',4,704,0)
,(80,'BURGLARY FROM VEHICLE',156,'2020-12-27',9,669,0)
,(81,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',275,'2020-12-29',18,635,0)
,(82,'THEFT FROM MOTOR VEHICLE - GRAND ($950.01 AND OVER)',24,'2020-09-11',18,89,0)
,(83,'THEFT OF IDENTITY',76,'2020-10-27',36,445,0)
,(84,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',157,'2020-12-20',24,137,0)
,(85,'THEFT OF IDENTITY',97,'2020-04-14',36,739,0)
,(86,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',113,'2020-01-01',180,410,0)
,(87,'THEFT OF IDENTITY',103,'2020-03-16',36,664,0)
,(88,'THEFT OF IDENTITY',196,'2020-04-23',36,305,0)
,(89,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',14,'2020-04-26',18,47,0)
,(90,'INTIMATE PARTNER - SIMPLE ASSAULT',7,'2020-06-30',9,765,0)
,(91,'CHILD ANNOYING (17YRS & UNDER)',244,'2020-01-01',18,787,0)
,(92,'BURGLARY FROM VEHICLE',227,'2020-05-08',9,758,0)
,(93,'VEHICLE - STOLEN',142,'2020-11-24',24,582,0)
,(94,'THEFT OF IDENTITY',283,'2020-08-03',36,398,0)
,(95,'THEFT OF IDENTITY',190,'2020-02-28',36,568,0)
,(96,'ROBBERY',10,'2020-10-01',60,533,0)
,(97,'BUNCO, GRAND THEFT',288,'2020-03-10',24,653,0)
,(98,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',237,'2020-02-02',4,280,0)
,(99,'THEFT OF IDENTITY',43,'2020-12-17',36,105,0)
,(100,'INTIMATE PARTNER - SIMPLE ASSAULT',105,'2020-05-08',9,694,0)
,(101,'THEFT OF IDENTITY',188,'2020-04-01',36,506,0)
,(102,'THEFT OF IDENTITY',296,'2020-02-25',36,527,0)
,(103,'BURGLARY FROM VEHICLE',109,'2020-12-16',9,59,0)
,(104,'THEFT OF IDENTITY',34,'2020-07-27',36,700,0)
,(105,'BUNCO, GRAND THEFT',46,'2020-06-01',24,206,0)
,(106,'THEFT OF IDENTITY',1,'2020-03-10',36,487,0)
,(107,'VEHICLE - STOLEN',172,'2020-04-28',24,179,0)
,(108,'THEFT OF IDENTITY',61,'2020-12-14',36,409,0)
,(109,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',142,'2020-06-15',4,422,0)
,(110,'THEFT OF IDENTITY',127,'2020-12-20',36,145,0)
,(111,'THEFT OF IDENTITY',222,'2020-09-19',36,569,0)
,(112,'THEFT OF IDENTITY',140,'2020-05-08',36,106,0)
,(113,'THEFT OF IDENTITY',14,'2020-07-11',36,159,0)
,(114,'THEFT OF IDENTITY',31,'2020-01-01',36,731,0)
,(115,'BUNCO, GRAND THEFT',116,'2020-09-01',24,258,0)
,(116,'BATTERY WITH SEXUAL CONTACT',241,'2020-10-13',36,67,0)
,(117,'INTIMATE PARTNER - AGGRAVATED ASSAULT',208,'2020-08-27',48,438,0)
,(118,'ORAL COPULATION',150,'2020-10-10',60,579,0)
,(119,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',224,'2020-01-01',180,582,0)
,(120,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',136,'2020-07-01',180,773,0)
,(121,'UNAUTHORIZED COMPUTER ACCESS',186,'2020-03-20',12,42,0)
,(122,'THEFT OF IDENTITY',8,'2020-01-30',36,593,0)
,(123,'SEX,UNLAWFUL(INC MUTUAL CONSENT, PENETRATION W/ FRGN OBJ',9,'2020-06-01',36,97,0)
,(124,'THEFT OF IDENTITY',128,'2020-06-19',36,372,0)
,(125,'THEFT OF IDENTITY',39,'2020-11-19',36,792,0)
,(126,'CRIMINAL THREATS - NO WEAPON DISPLAYED',145,'2020-08-01',18,608,0)
,(127,'THEFT OF IDENTITY',283,'2020-02-21',36,578,0)
,(128,'THEFT OF IDENTITY',20,'2020-08-02',36,711,0)
,(129,'THEFT OF IDENTITY',196,'2020-07-31',36,171,0)
,(130,'THEFT OF IDENTITY',267,'2020-10-19',36,210,0)
,(131,'THEFT OF IDENTITY',85,'2020-06-25',36,589,0)
,(132,'VIOLATION OF RESTRAINING ORDER',244,'2020-02-02',12,756,0)
,(133,'THEFT OF IDENTITY',191,'2020-04-10',36,775,0)
,(134,'THEFT OF IDENTITY',65,'2020-04-03',36,766,0)
,(135,'SHOPLIFTING - PETTY THEFT ($950 & UNDER)',105,'2020-12-27',6,177,0)
,(136,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',13,'2020-01-01',180,308,0)
,(137,'THEFT OF IDENTITY',262,'2020-12-01',36,80,0)
,(138,'VANDALISM - FELONY ($400 & OVER, ALL CHURCH VANDALISMS)',20,'2020-09-15',24,458,0)
,(139,'THEFT OF IDENTITY',16,'2020-10-08',36,324,0)
,(140,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',114,'2020-01-01',180,428,0)
,(141,'THEFT OF IDENTITY',215,'2020-11-23',36,185,0)
,(142,'THEFT OF IDENTITY',279,'2020-06-01',36,276,0)
,(143,'OTHER MISCELLANEOUS CRIME',270,'2020-03-04',12,100,0)
,(144,'THEFT OF IDENTITY',142,'2020-10-13',36,603,0)
,(145,'THEFT OF IDENTITY',159,'2020-03-28',36,740,0)
,(146,'THEFT PLAIN - PETTY ($950 & UNDER)',263,'2020-04-10',6,351,0)
,(147,'BURGLARY',218,'2020-12-31',36,141,0)
,(148,'THEFT OF IDENTITY',161,'2020-03-20',36,155,0)
,(149,'BRANDISH WEAPON',46,'2020-07-24',24,266,0)
,(150,'INTIMATE PARTNER - SIMPLE ASSAULT',247,'2020-03-01',9,675,0)
,(151,'THEFT PLAIN - PETTY ($950 & UNDER)',11,'2020-03-13',6,601,0)
,(152,'THEFT OF IDENTITY',17,'2020-08-02',36,318,0)
,(153,'DOCUMENT FORGERY / STOLEN FELONY',25,'2020-08-23',48,610,0)
,(154,'THEFT OF IDENTITY',242,'2020-05-10',36,441,0)
,(155,'THEFT OF IDENTITY',202,'2020-01-18',36,118,0)
,(156,'THEFT FROM MOTOR VEHICLE - GRAND ($950.01 AND OVER)',53,'2020-01-19',18,381,0)
,(157,'THEFT OF IDENTITY',202,'2020-10-01',36,375,0)
,(158,'INTIMATE PARTNER - SIMPLE ASSAULT',164,'2020-01-01',9,724,0)
,(159,'THEFT OF IDENTITY',88,'2020-11-19',36,136,0)
,(160,'THEFT PLAIN - PETTY ($950 & UNDER)',75,'2020-11-20',6,221,0)
,(161,'BURGLARY',172,'2020-08-15',36,284,0)
,(162,'THEFT OF IDENTITY',222,'2020-08-09',36,785,0)
,(163,'THEFT OF IDENTITY',293,'2020-02-12',36,725,0)
,(164,'THEFT OF IDENTITY',156,'2020-07-30',36,742,0)
,(165,'THEFT OF IDENTITY',219,'2020-10-01',36,616,0)
,(166,'THEFT OF IDENTITY',241,'2020-06-09',36,194,0)
,(167,'VEHICLE - STOLEN',243,'2020-03-27',24,741,0)
,(168,'THEFT OF IDENTITY',265,'2020-12-02',36,555,0)
,(169,'THEFT OF IDENTITY',243,'2020-01-02',36,720,0)
,(170,'VEHICLE - STOLEN',183,'2020-04-06',24,584,0)
,(171,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',61,'2020-04-29',24,598,0)
,(172,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',84,'2020-10-19',180,14,0)
,(173,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',273,'2020-09-27',18,81,0)
,(174,'THEFT OF IDENTITY',70,'2020-02-09',36,20,0)
,(175,'THEFT OF IDENTITY',26,'2020-05-05',36,715,0)
,(176,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',62,'2020-11-20',18,648,0)
,(177,'EMBEZZLEMENT, GRAND THEFT ($950.01 & OVER)',8,'2020-03-20',36,196,0)
,(178,'THEFT PLAIN - PETTY ($950 & UNDER)',51,'2020-11-08',6,515,0)
,(179,'BUNCO, GRAND THEFT',229,'2020-07-26',24,322,0)
,(180,'THEFT OF IDENTITY',188,'2020-03-01',36,72,0)
,(181,'BURGLARY',164,'2020-12-28',36,710,0)
,(182,'BURGLARY FROM VEHICLE',2,'2020-08-24',9,26,0)
,(183,'THEFT OF IDENTITY',60,'2020-07-30',36,4,0)
,(184,'THEFT OF IDENTITY',270,'2020-05-15',36,625,0)
,(185,'RAPE, FORCIBLE',223,'2020-04-01',240,302,0)
,(186,'THEFT OF IDENTITY',242,'2020-06-20',36,687,0)
,(187,'INTIMATE PARTNER - SIMPLE ASSAULT',22,'2020-06-15',9,396,0)
,(188,'VANDALISM - MISDEAMEANOR ($399 OR UNDER)',173,'2020-01-23',3,628,0)
,(189,'THEFT OF IDENTITY',233,'2020-06-07',36,9,0)
,(190,'THEFT OF IDENTITY',232,'2020-03-01',36,691,0)
,(191,'THEFT OF IDENTITY',132,'2020-06-23',36,692,0)
,(192,'INTIMATE PARTNER - SIMPLE ASSAULT',55,'2020-05-27',9,107,0)
,(193,'THEFT OF IDENTITY',23,'2020-06-04',36,233,0)
,(194,'BATTERY - SIMPLE ASSAULT',239,'2020-12-20',9,110,0)
,(195,'THEFT OF IDENTITY',241,'2020-03-20',36,214,0)
,(196,'THEFT OF IDENTITY',111,'2020-10-19',36,82,0)
,(197,'THEFT OF IDENTITY',52,'2020-08-05',36,544,0)
,(198,'VEHICLE - STOLEN',173,'2020-07-30',24,464,0)
,(199,'OTHER MISCELLANEOUS CRIME',175,'2020-12-27',12,17,0)
,(200,'THEFT OF IDENTITY',91,'2020-01-01',36,120,0)
,(201,'CHILD ANNOYING (17YRS & UNDER)',170,'2020-08-01',18,762,0)
,(202,'ORAL COPULATION',285,'2020-01-01',60,35,0)
,(203,'DOCUMENT FORGERY / STOLEN FELONY',125,'2020-07-17',48,370,0)
,(204,'BATTERY - SIMPLE ASSAULT',113,'2020-07-11',9,573,0)
,(205,'THEFT OF IDENTITY',226,'2020-12-10',36,528,0)
,(206,'THEFT OF IDENTITY',35,'2020-01-07',36,227,0)
,(207,'CHILD ABUSE (PHYSICAL) - SIMPLE ASSAULT',136,'2020-02-17',24,574,0)
,(208,'ROBBERY',102,'2020-04-01',60,116,0)
,(209,'THEFT OF IDENTITY',68,'2020-06-01',36,542,0)
,(210,'THEFT OF IDENTITY',168,'2020-08-13',36,343,0)
,(211,'BATTERY WITH SEXUAL CONTACT',177,'2020-03-01',36,149,0)
,(212,'CREDIT CARDS, FRAUD USE ($950.01 & OVER)',222,'2020-10-26',24,56,0)
,(213,'THEFT OF IDENTITY',285,'2020-05-01',36,75,0)
,(214,'OTHER MISCELLANEOUS CRIME',35,'2020-07-15',12,773,0)
,(215,'SODOMY/SEXUAL CONTACT B/W PENIS OF ONE PERS TO ANUS OTH',2,'2020-06-01',96,294,0)
,(216,'THEFT OF IDENTITY',122,'2020-01-01',36,341,0)
,(217,'ASSAULT WITH DEADLY WEAPON, AGGRAVATED ASSAULT',286,'2020-12-01',48,20,0)
,(218,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',267,'2020-06-19',4,11,0)
,(219,'THEFT OF IDENTITY',92,'2020-11-17',36,529,0)
,(220,'THEFT OF IDENTITY',267,'2020-10-30',36,371,0)
,(221,'THEFT OF IDENTITY',122,'2020-07-01',36,598,0)
,(222,'INTIMATE PARTNER - SIMPLE ASSAULT',221,'2020-05-22',9,166,0)
,(223,'THEFT OF IDENTITY',113,'2020-06-24',36,124,0)
,(224,'THEFT PLAIN - PETTY ($950 & UNDER)',194,'2020-11-01',6,28,0)
,(225,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',260,'2020-05-06',24,215,0)
,(226,'THEFT OF IDENTITY',223,'2020-07-05',36,166,0)
,(227,'BURGLARY',136,'2020-01-01',36,503,0)
,(228,'ASSAULT WITH DEADLY WEAPON, AGGRAVATED ASSAULT',286,'2020-07-02',48,53,0)
,(229,'THEFT OF IDENTITY',151,'2020-10-09',36,501,0)
,(230,'BURGLARY',26,'2020-06-26',36,153,0)
,(231,'THEFT OF IDENTITY',258,'2020-11-01',36,556,0)
,(232,'THEFT OF IDENTITY',295,'2020-01-11',36,244,0)
,(233,'BUNCO, GRAND THEFT',192,'2020-03-20',24,89,0)
,(234,'THEFT OF IDENTITY',48,'2020-04-01',36,234,0)
,(235,'THEFT OF IDENTITY',261,'2020-10-21',36,240, 0)
,(236,'DOCUMENT FORGERY / STOLEN FELONY',122,'2020-10-22',48,697,0)
,(237,'THEFT OF IDENTITY',205,'2020-09-01',36,319,0)
,(238,'THEFT OF IDENTITY',151,'2020-01-06',36,470,0)
,(239,'THEFT OF IDENTITY',285,'2020-07-01',36,782,0)
,(240,'THREATENING PHONE CALLS/LETTERS',38,'2020-10-22',18,228,0)
,(241,'VEHICLE - STOLEN',245,'2020-10-01',24,509,0)
,(242,'THEFT OF IDENTITY',49,'2020-08-30',36,130,0)
,(243,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',164,'2020-10-01',24,249,0)
,(244,'THEFT OF IDENTITY',155,'2020-07-17',36,60,0)
,(245,'THEFT OF IDENTITY',250,'2020-09-06',36,774,0)
,(246,'CHILD ABUSE (PHYSICAL) - SIMPLE ASSAULT',219,'2020-02-01',24,493,0)
,(247,'BATTERY - SIMPLE ASSAULT',100,'2020-08-08',9,484,0)
,(248,'THEFT OF IDENTITY',198,'2020-01-20',36,701,0)
,(249,'VEHICLE - STOLEN',64,'2020-12-22',24,229,0)
,(250,'THEFT OF IDENTITY',150,'2020-03-01',36,32,0)
,(251,'BURGLARY',251,'2020-06-22',36,296,0)
,(252,'RAPE, FORCIBLE',294,'2020-06-01',240,163,0)
,(253,'ASSAULT WITH DEADLY WEAPON, AGGRAVATED ASSAULT',143,'2020-03-01',48,58,0)
,(254,'THEFT OF IDENTITY',135,'2020-09-01',36,230,0)
,(255,'BATTERY - SIMPLE ASSAULT',110,'2020-04-27',9,160,0)
,(256,'THEFT OF IDENTITY',262,'2020-12-05',36,290,0)
,(257,'THEFT OF IDENTITY',111,'2020-04-17',36,339,0)
,(258,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',289,'2020-01-01',180,65,0)
,(259,'ROBBERY',100,'2020-12-09',60,375,0)
,(260,'THEFT OF IDENTITY',123,'2020-03-21',36,381,0)
,(261,'BIKE - STOLEN',18,'2020-12-01',4,126,0)
,(262,'RAPE, FORCIBLE',33,'2020-11-25',240,253,0)
,(263,'THEFT OF IDENTITY',185,'2020-05-08',36,183,0)
,(264,'CHILD ANNOYING (17YRS & UNDER)',39,'2020-01-01',18,164,0)
,(265,'THEFT OF IDENTITY',97,'2020-04-20',36,508,0)
,(266,'THEFT OF IDENTITY',65,'2020-11-29',36,320,0)
,(267,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',260,'2020-10-16',18,695,0)
,(268,'THEFT OF IDENTITY',23,'2020-02-19',36,786,0)
,(269,'THEFT OF IDENTITY',10,'2020-10-09',36,521,0)
,(270,'DOCUMENT FORGERY / STOLEN FELONY',244,'2020-11-01',48,717,0)
,(271,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',271,'2020-08-23',180,127,0)
,(272,'THEFT OF IDENTITY',144,'2020-07-01',36,485,0)
,(273,'THEFT OF IDENTITY',188,'2020-10-01',36,352,0)
,(274,'THEFT OF IDENTITY',143,'2020-04-07',36,138,0)
,(275,'RAPE, FORCIBLE',166,'2020-01-25',240,188,0)
,(276,'CRIMINAL THREATS - NO WEAPON DISPLAYED',157,'2020-11-17',18,222,0)
,(277,'THEFT OF IDENTITY',121,'2020-01-25',36,742,0)
,(278,'THEFT OF IDENTITY',174,'2020-11-19',36,252,0)
,(279,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',136,'2020-01-01',18,222,0)
,(280,'THEFT OF IDENTITY',129,'2020-08-07',36,548,0)
,(281,'RAPE, FORCIBLE',299,'2020-10-31',240,240,0)
,(282,'SEXUAL PENETRATION W/FOREIGN OBJECT',217,'2020-03-19',96,150,0)
,(283,'SEX,UNLAWFUL(INC MUTUAL CONSENT, PENETRATION W/ FRGN OBJ',284,'2020-08-27',36,695,0)
,(284,'RAPE, FORCIBLE',37,'2020-11-28',240,415,0)
,(285,'THEFT FROM MOTOR VEHICLE - GRAND ($950.01 AND OVER)',65,'2020-12-23',18,51,0)
,(286,'INTIMATE PARTNER - SIMPLE ASSAULT',82,'2020-11-15',9,211,0)
,(287,'THEFT OF IDENTITY',8,'2020-03-23',36,382,0)
,(288,'ORAL COPULATION',255,'2020-04-01',60,94,0)
,(289,'ORAL COPULATION',42,'2020-01-01',60,654,0)
,(290,'THEFT OF IDENTITY',191,'2020-01-10',36,68,0)
,(291,'BATTERY WITH SEXUAL CONTACT',168,'2020-09-01',36,330,0)
,(292,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',123,'2020-04-01',18,590,0)
,(293,'VANDALISM - FELONY ($400 & OVER, ALL CHURCH VANDALISMS)',48,'2020-10-23',24,161,0)
,(294,'THEFT OF IDENTITY',90,'2020-03-04',36,192,0)
,(295,'THEFT OF IDENTITY',288,'2020-11-11',36,360,0)
,(296,'SEXUAL PENETRATION W/FOREIGN OBJECT',130,'2020-11-26',96,599,0)
,(297,'THEFT OF IDENTITY',36,'2020-04-22',36,789,0)
,(298,'EXTORTION',271,'2020-02-01',48,667,0)
,(299,'OTHER MISCELLANEOUS CRIME',71,'2020-11-12',12,255,0)
,(300,'OTHER MISCELLANEOUS CRIME',250,'2020-08-07',12,269,0)
,(301,'OTHER ASSAULT',25,'2020-05-20',12,415,0)
,(302,'THEFT OF IDENTITY',127,'2020-01-01',36,434,0)
,(303,'BURGLARY',167,'2020-12-13',36,456,0)
,(304,'BURGLARY',69,'2020-11-20',36,378,0)
,(305,'THEFT OF IDENTITY',272,'2020-11-01',36,336,0)
,(306,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',149,'2020-01-01',24,749,0)
,(307,'THEFT OF IDENTITY',281,'2020-07-14',36,200,0)
,(308,'THEFT FROM MOTOR VEHICLE - GRAND ($950.01 AND OVER)',34,'2020-07-19',18,570,0)
,(309,'THEFT OF IDENTITY',114,'2020-11-12',36,37,0)
,(310,'EXTORTION',267,'2020-11-15',48,768,0)
,(311,'BATTERY - SIMPLE ASSAULT',276,'2020-04-01',9,447,0)
,(312,'THEFT OF IDENTITY',293,'2020-06-16',36,480,0)
,(313,'THEFT OF IDENTITY',89,'2020-04-26',36,309,0)
,(314,'VEHICLE - STOLEN',82,'2020-07-01',24,201,0)
,(315,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',239,'2020-01-01',24,29,0)
,(316,'SEXUAL PENETRATION W/FOREIGN OBJECT',73,'2020-05-01',96,175,0)
,(317,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',238,'2020-09-01',18,363,0)
,(318,'ORAL COPULATION',3,'2020-01-01',60,247,0)
,(319,'BUNCO, GRAND THEFT',172,'2020-11-28',24,114,0)
,(320,'EMBEZZLEMENT, GRAND THEFT ($950.01 & OVER)',212,'2020-03-13',36,367,0)
,(321,'BURGLARY FROM VEHICLE',24,'2020-12-10',9,496,0)
,(322,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',236,'2020-02-02',24,108,0)
,(323,'INTIMATE PARTNER - AGGRAVATED ASSAULT',63,'2020-03-22',48,310,0)
,(324,'THEFT OF IDENTITY',91,'2020-07-06',36,636,0)
,(325,'THEFT OF IDENTITY',152,'2020-03-10',36,277,0)
,(326,'THEFT OF IDENTITY',167,'2020-11-01',36,295,0)
,(327,'THEFT OF IDENTITY',3,'2020-07-15',36,256,0)
,(328,'THEFT OF IDENTITY',1,'2020-06-15',36,681,0)
,(329,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',276,'2020-01-18',18,624,0)
,(330,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',290,'2020-08-01',180,605,0)
,(331,'INTIMATE PARTNER - SIMPLE ASSAULT',290,'2020-12-21',9,497,0)
,(332,'THEFT FROM MOTOR VEHICLE - GRAND ($950.01 AND OVER)',95,'2020-01-01',18,403,0)
,(333,'THEFT OF IDENTITY',47,'2020-11-19',36,534,0)
,(334,'THEFT OF IDENTITY',194,'2020-05-05',36,48,0)
,(335,'THEFT OF IDENTITY',78,'2020-08-23',36,620,0)
,(336,'THEFT OF IDENTITY',245,'2020-05-01',36,90,0)
,(337,'THEFT OF IDENTITY',32,'2020-10-01',36,575,0)
,(338,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',233,'2020-08-05',24,783,0)
,(339,'RAPE, FORCIBLE',84,'2020-09-01',240,235,0)
,(340,'THEFT OF IDENTITY',68,'2020-08-15',36,382,0)
,(341,'VANDALISM - MISDEAMEANOR ($399 OR UNDER)',12,'2020-07-23',3,423,0)
,(342,'CHILD ANNOYING (17YRS & UNDER)',177,'2020-02-10',18,236,0)
,(343,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',294,'2020-01-01',180,658,0)
,(344,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',69,'2020-07-01',18,353,0)
,(345,'THEFT OF IDENTITY',149,'2020-01-01',36,381,0)
,(346,'BURGLARY FROM VEHICLE',19,'2020-12-15',9,777,0)
,(347,'INTIMATE PARTNER - SIMPLE ASSAULT',163,'2020-09-01',9,287,0)
,(348,'THEFT OF IDENTITY',219,'2020-03-30',36,38,0)
,(349,'THEFT OF IDENTITY',19,'2020-03-14',36,141,0)
,(350,'PICKPOCKET',154,'2020-12-31',9,756,0)
,(351,'SEXUAL PENETRATION W/FOREIGN OBJECT',63,'2020-03-30',96,21,0)
,(352,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',169,'2020-01-01',180,659,0)
,(353,'BURGLARY FROM VEHICLE',18,'2020-04-21',9,84,0)
,(354,'THEFT OF IDENTITY',263,'2020-01-16',36,286,0)
,(355,'THEFT OF IDENTITY',83,'2020-05-15',36,145,0)
,(356,'THEFT OF IDENTITY',135,'2020-11-20',36,174,0)
,(357,'THEFT OF IDENTITY',168,'2020-08-14',36,75,0)
,(358,'THEFT OF IDENTITY',189,'2020-07-29',36,54,0)
,(359,'ARSON',231,'2020-01-30',120,52,0)
,(360,'THEFT OF IDENTITY',17,'2020-05-11',36,258,0)
,(361,'THEFT OF IDENTITY',17,'2020-02-18',36,134,0)
,(362,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',171,'2020-02-21',24,281,0)
,(363,'THEFT OF IDENTITY',80,'2020-09-26',36,688,0)
,(364,'THEFT OF IDENTITY',254,'2020-12-02',36,595,0)
,(365,'INTIMATE PARTNER - SIMPLE ASSAULT',137,'2020-05-01',9,331,0)
,(366,'VEHICLE - STOLEN',112,'2020-06-25',24,637,0)
,(367,'THEFT OF IDENTITY',148,'2020-12-04',36,388,0)
,(368,'BATTERY WITH SEXUAL CONTACT',75,'2020-02-01',36,602,0)
,(369,'THEFT OF IDENTITY',280,'2020-01-13',36,571,0)
,(370,'DISTURBING THE PEACE',23,'2020-04-20',4,364,0)
,(371,'RAPE, FORCIBLE',173,'2020-01-01',240,203,0)
,(372,'ORAL COPULATION',115,'2020-09-07',60,621,0)
,(373,'THEFT OF IDENTITY',14,'2020-07-20',36,251,0)
,(374,'VEHICLE - STOLEN',136,'2020-08-19',24,665,0)
,(375,'CRIMINAL THREATS - NO WEAPON DISPLAYED',146,'2020-06-01',18,639,0)
,(376,'BURGLARY FROM VEHICLE',238,'2020-07-01',9,764,0)
,(377,'THEFT OF IDENTITY',221,'2020-07-01',36,460,0)
,(378,'THEFT OF IDENTITY',58,'2020-08-07',36,208,0)
,(379,'THEFT OF IDENTITY',51,'2020-06-26',36,103,0)
,(380,'THEFT OF IDENTITY',261,'2020-02-02',36,640, 0)
,(381,'BURGLARY',127,'2020-03-01',36,596,0)
,(382,'BUNCO, ATTEMPT',73,'2020-11-01',6,300,0)
,(383,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',53,'2020-02-15',18,287,0)
,(384,'BUNCO, GRAND THEFT',129,'2020-12-01',24,112,0)
,(385,'THEFT OF IDENTITY',81,'2020-01-24',36,271,0)
,(386,'HUMAN TRAFFICKING - INVOLUNTARY SERVITUDE',149,'2020-01-01',180,326,0)
,(387,'THEFT OF IDENTITY',133,'2020-01-14',36,244,0)
,(388,'CRIMINAL THREATS - NO WEAPON DISPLAYED',280,'2020-01-17',18,735,0)
,(389,'VEHICLE - STOLEN',252,'2020-06-23',24,207,0)
,(390,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',247,'2020-06-30',18,483,0)
,(391,'RAPE, FORCIBLE',12,'2020-07-17',240,440,0)
,(392,'BURGLARY',179,'2020-01-11',36,471,0)
,(393,'THEFT OF IDENTITY',162,'2020-03-01',36,429,0)
,(394,'PIMPING',23,'2020-08-26',60,420,0)
,(395,'SHOPLIFTING - PETTY THEFT ($950 & UNDER)',15,'2020-08-22',6,392,0)
,(396,'INTIMATE PARTNER - SIMPLE ASSAULT',49,'2020-10-31',9,765,0)
,(397,'CRIMINAL THREATS - NO WEAPON DISPLAYED',15,'2020-01-01',18,378,0)
,(398,'THEFT OF IDENTITY',178,'2020-09-11',36,117,0)
,(399,'THEFT OF IDENTITY',142,'2020-10-24',36,1,0)
,(400,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',28,'2020-10-20',4,763,0)
,(401,'ORAL COPULATION',249,'2020-01-01',60,650,0)
,(402,'THEFT OF IDENTITY',125,'2020-02-20',36,223,0)
,(403,'THEFT PLAIN - PETTY ($950 & UNDER)',43,'2020-11-05',6,597,0)
,(404,'BURGLARY FROM VEHICLE',11,'2020-03-20',9,799,0)
,(405,'THEFT OF IDENTITY',169,'2020-03-17',36,76,0)
,(406,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',140,'2020-09-11',24,14,0)
,(407,'THEFT OF IDENTITY',224,'2020-08-02',36,220,0)
,(408,'THEFT OF IDENTITY',66,'2020-02-22',36,797,0)
,(409,'THEFT OF IDENTITY',186,'2020-02-12',36,451,0)
,(410,'THEFT OF IDENTITY',268,'2020-08-25',36,726,0)
,(411,'INTIMATE PARTNER - AGGRAVATED ASSAULT',85,'2020-03-21',48,154,0)
,(412,'VEHICLE - STOLEN',237,'2020-07-30',24,474,0)
,(413,'THEFT OF IDENTITY',129,'2020-05-08',36,472,0)
,(414,'THEFT OF IDENTITY',15,'2020-08-01',36,475,0)
,(415,'VEHICLE - STOLEN',268,'2020-02-02',24,272,0)
,(416,'THEFT FROM MOTOR VEHICLE - GRAND ($950.01 AND OVER)',174,'2020-12-29',18,611,0)
,(417,'THEFT OF IDENTITY',66,'2020-01-01',36,768,0)
,(418,'THEFT OF IDENTITY',80,'2020-05-06',36,591,0)
,(419,'THEFT OF IDENTITY',216,'2020-01-01',36,66,0)
,(420,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',59,'2020-06-29',24,330,0)
,(421,'CHILD ANNOYING (17YRS & UNDER)',241,'2020-10-25',18,573,0)
,(422,'THEFT OF IDENTITY',22,'2020-08-28',36,267,0)
,(423,'THEFT OF IDENTITY',173,'2020-08-27',36,609,0)
,(424,'VANDALISM - FELONY ($400 & OVER, ALL CHURCH VANDALISMS)',193,'2020-01-20',24,45,0)
,(425,'THEFT OF IDENTITY',0,'2020-02-09',36,629,0)
,(426,'BURGLARY',163,'2020-02-16',36,389,0)
,(427,'RAPE, FORCIBLE',46,'2020-12-01',240,507,0)
,(428,'PEEPING TOM',248,'2020-04-01',9,457,0)
,(429,'PICKPOCKET',127,'2020-04-24',9,162,0)
,(430,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',171,'2020-01-20',4,282,0)
,(431,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',82,'2020-03-01',24,431,0)
,(432,'BATTERY - SIMPLE ASSAULT',70,'2020-09-20',9,347,0)
,(433,'THEFT OF IDENTITY',95,'2020-02-01',36,189,0)
,(434,'SEX,UNLAWFUL(INC MUTUAL CONSENT, PENETRATION W/ FRGN OBJ',54,'2020-08-29',36,498,0)
,(435,'THEFT OF IDENTITY',163,'2020-05-09',36,237,0)
,(436,'BATTERY - SIMPLE ASSAULT',261,'2020-03-12',9,27,0)
,(437,'THEFT OF IDENTITY',76,'2020-09-01',36,117,0)
,(438,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',86,'2020-10-30',24,273,0)
,(439,'THEFT OF IDENTITY',222,'2020-01-01',36,415,0)
,(440,'THEFT OF IDENTITY',221,'2020-11-09',36,727,0)
,(441,'THEFT OF IDENTITY',215,'2020-07-24',36,557,0)
,(442,'THEFT OF IDENTITY',135,'2020-07-01',36,500,0)
,(443,'THEFT OF IDENTITY',208,'2020-07-18',36,504,0)
,(444,'THEFT PLAIN - PETTY ($950 & UNDER)',138,'2020-12-20',6,696,0)
,(445,'THEFT OF IDENTITY',66,'2020-01-01',36,150,0)
,(446,'BIKE - STOLEN',278,'2020-12-04',4,379,0)
,(447,'THEFT OF IDENTITY',152,'2020-03-05',36,513,0)
,(448,'THEFT OF IDENTITY',206,'2020-04-03',36,488,0)
,(449,'VEHICLE - STOLEN',279,'2020-08-01',24,383,0)
,(450,'THEFT OF IDENTITY',161,'2020-09-07',36,479,0)
,(451,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',170,'2020-06-04',18,13,0)
,(452,'DOCUMENT FORGERY / STOLEN FELONY',142,'2020-10-15',48,494,0)
,(453,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',270,'2020-01-01',24,77,0)
,(454,'THEFT OF IDENTITY',185,'2020-03-25',36,5,0)
,(455,'THEFT OF IDENTITY',154,'2020-09-18',36,143,0)
,(456,'THEFT OF IDENTITY',188,'2020-02-01',36,283,0)
,(457,'THEFT OF IDENTITY',6,'2020-11-01',36,519,0)
,(458,'VIOLATION OF COURT ORDER',258,'2020-11-17',12,699,0)
,(459,'DOCUMENT FORGERY / STOLEN FELONY',118,'2020-12-04',48,482,0)
,(460,'THEFT FROM MOTOR VEHICLE - GRAND ($950.01 AND OVER)',146,'2020-04-27',18,78,0)
,(461,'THEFT OF IDENTITY',77,'2020-09-03',36,1,0)
,(462,'THEFT PLAIN - PETTY ($950 & UNDER)',198,'2020-03-15',6,432,0)
,(463,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',83,'2020-05-09',4,109,0)
,(464,'THEFT OF IDENTITY',201,'2020-12-08',36,323,0)
,(465,'THEFT OF IDENTITY',214,'2020-03-15',36,49,0)
,(466,'THEFT OF IDENTITY',169,'2020-02-17',36,107,0)
,(467,'THEFT OF IDENTITY',124,'2020-08-10',36,231,0)
,(468,'CRIMINAL THREATS - NO WEAPON DISPLAYED',149,'2020-08-01',18,248,0)
,(469,'EMBEZZLEMENT, GRAND THEFT ($950.01 & OVER)',10,'2020-12-28',36,311,0)
,(470,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',244,'2020-06-09',18,448,0)
,(471,'ORAL COPULATION',154,'2020-11-27',60,401,0)
,(472,'EMBEZZLEMENT, GRAND THEFT ($950.01 & OVER)',71,'2020-07-01',36,232,0)
,(473,'THEFT OF IDENTITY',51,'2020-04-29',36,456,0)
,(474,'THEFT OF IDENTITY',91,'2020-01-01',36,678,0)
,(475,'RAPE, FORCIBLE',178,'2020-10-16',240,799,0)
,(476,'THEFT OF IDENTITY',279,'2020-02-25',36,689,0)
,(477,'THEFT OF IDENTITY',263,'2020-01-01',36,129,0)
,(478,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',237,'2020-01-09',24,578,0)
,(479,'THEFT OF IDENTITY',48,'2020-05-05',36,561,0)
,(480,'OTHER MISCELLANEOUS CRIME',21,'2020-01-17',12,738,0)
,(481,'PICKPOCKET',99,'2020-10-30',9,604,0)
,(482,'OTHER MISCELLANEOUS CRIME',139,'2020-04-11',12,651,0)
,(483,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',162,'2020-01-01',18,559,0)
,(484,'BUNCO, GRAND THEFT',131,'2020-12-11',24,259,0)
,(485,'SEXUAL PENETRATION W/FOREIGN OBJECT',109,'2020-05-01',96,453,0)
,(486,'THEFT OF IDENTITY',257,'2020-12-01',36,130,0)
,(487,'THEFT OF IDENTITY',243,'2020-05-13',36,435,0)
,(488,'THEFT PLAIN - PETTY ($950 & UNDER)',121,'2020-08-03',6,167,0)
,(489,'VANDALISM - MISDEAMEANOR ($399 OR UNDER)',116,'2020-12-30',3,184,0)
,(490,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',207,'2020-11-15',4,199,0)
,(491,'VEHICLE - STOLEN',293,'2020-04-20',24,790,0)
,(492,'THEFT OF IDENTITY',172,'2020-01-01',36,96,0)
,(493,'THEFT OF IDENTITY',13,'2020-10-01',36,22,0)
,(494,'SEX,UNLAWFUL(INC MUTUAL CONSENT, PENETRATION W/ FRGN OBJ',210,'2020-12-25',36,632,0)
,(495,'CHILD ABUSE (PHYSICAL) - SIMPLE ASSAULT',209,'2020-12-21',24,728,0)
,(496,'THEFT OF IDENTITY',30,'2020-02-23',36,757,0)
,(497,'THEFT OF IDENTITY',117,'2020-07-06',36,150,0)
,(498,'THEFT OF IDENTITY',4,'2020-06-08',36,121,0)
,(499,'VEHICLE - STOLEN',126,'2020-07-04',24,380,0)
,(500,'BURGLARY',34,'2020-06-01',36,776,0)
,(501,'BRANDISH WEAPON',166,'2020-02-13',24,139,0)
,(502,'VANDALISM - MISDEAMEANOR ($399 OR UNDER)',284,'2020-11-10',3,583,0)
,(503,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',183,'2020-10-06',180,243,0)
,(504,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',49,'2020-08-01',4,252,0)
,(505,'THEFT OF IDENTITY',131,'2020-10-17',36,148,0)
,(506,'THEFT OF IDENTITY',114,'2020-02-21',36,180,0)
,(507,'RAPE, FORCIBLE',176,'2020-06-25',240,665,0)
,(508,'THEFT OF IDENTITY',206,'2020-03-10',36,0,0)
,(509,'THEFT OF IDENTITY',185,'2020-12-01',36,327,0)
,(510,'THEFT OF IDENTITY',200,'2020-06-13',36,778,0)
,(511,'EMBEZZLEMENT, GRAND THEFT ($950.01 & OVER)',240,'2020-01-01',36,74,0)
,(512,'THEFT OF IDENTITY',72,'2020-6-15',36,98, 0)
,(513,'THEFT OF IDENTITY',50,'2020-10-01',36,465,0)
,(514,'VEHICLE - STOLEN',69,'2020-09-11',24,585,0)
,(515,'THEFT OF IDENTITY',285,'2020-07-31',36,468,0)
,(516,'THEFT OF IDENTITY',212,'2020-10-01',36,288,0)
,(517,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',96,'2020-10-01',18,744,0)
,(518,'RAPE, FORCIBLE',3,'2020-02-01',240,53,0)
,(519,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',234,'2020-12-01',24,190,0)
,(520,'THEFT OF IDENTITY',161,'2020-06-01',36,168,0)
,(521,'BUNCO, GRAND THEFT',184,'2020-04-27',24,335,0)
,(522,'THEFT OF IDENTITY',135,'2020-01-05',36,101,0)
,(523,'THEFT OF IDENTITY',167,'2020-03-20',36,617,0)
,(524,'THEFT OF IDENTITY',91,'2020-12-09',36,267,0)
,(525,'THEFT OF IDENTITY',97,'2020-01-01',36,91,0)
,(526,'THEFT OF IDENTITY',51,'2020-08-08',36,61,0)
,(527,'THEFT OF IDENTITY',288,'2020-05-29',36,653,0)
,(528,'CONTEMPT OF COURT',171,'2020-08-04',6,344,0)
,(529,'VEHICLE - STOLEN',233,'2020-07-20',24,246,0)
,(530,'VANDALISM - MISDEAMEANOR ($399 OR UNDER)',57,'2020-04-17',3,92,0)
,(531,'BURGLARY',275,'2020-12-15',36,687,0)
,(532,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',222,'2020-06-01',180,439,0)
,(533,'INTIMATE PARTNER - SIMPLE ASSAULT',85,'2020-07-03',9,174,0)
,(534,'INTIMATE PARTNER - AGGRAVATED ASSAULT',85,'2020-02-26',48,587,0)
,(535,'THEFT OF IDENTITY',115,'2020-05-24',36,50,0)
,(536,'THEFT OF IDENTITY',186,'2020-01-01',36,405,0)
,(537,'VEHICLE - STOLEN',213,'2020-07-10',24,357,0)
,(538,'BURGLARY',36,'2020-12-15',36,452,0)
,(539,'THEFT OF IDENTITY',129,'2020-04-01',36,660,0)
,(540,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',170,'2020-06-26',18,362,0)
,(541,'THEFT OF IDENTITY',201,'2020-03-07',36,670,0)
,(542,'THEFT OF IDENTITY',54,'2020-08-17',36,85,0)
,(543,'THEFT OF IDENTITY',24,'2020-08-19',36,191,0)
,(544,'INTIMATE PARTNER - AGGRAVATED ASSAULT',171,'2020-11-01',48,245,0)
,(545,'THEFT OF IDENTITY',169,'2020-03-16',36,618,0)
,(546,'THEFT OF IDENTITY',166,'2020-03-07',36,205,0)
,(547,'THEFT OF IDENTITY',107,'2020-06-01',36,630,0)
,(548,'THEFT OF IDENTITY',63,'2020-12-05',36,316,0)
,(549,'THEFT OF IDENTITY',14,'2020-05-08',36,580,0)
,(550,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',287,'2020-01-22',180,530,0)
,(551,'THEFT OF IDENTITY',12,'2020-12-17',36,650,0)
,(552,'BURGLARY FROM VEHICLE',150,'2020-02-19',9,776,0)
,(553,'THEFT OF IDENTITY',2,'2020-11-10',36,69,0)
,(554,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',114,'2020-03-28',18,708,0)
,(555,'EMBEZZLEMENT, GRAND THEFT ($950.01 & OVER)',4,'2020-10-31',36,17,0)
,(556,'CHILD ABUSE (PHYSICAL) - SIMPLE ASSAULT',26,'2020-06-01',24,232,0)
,(557,'BATTERY - SIMPLE ASSAULT',268,'2020-10-30',9,135,0)
,(558,'THEFT OF IDENTITY',143,'2020-12-24',36,278,0)
,(559,'THEFT OF IDENTITY',132,'2020-06-12',36,140,0)
,(560,'THEFT OF IDENTITY',215,'2020-01-01',36,424,0)
,(561,'RAPE, FORCIBLE',0,'2020-10-01',240,235,0)
,(562,'THEFT OF IDENTITY',74,'2020-12-01',36,197,0)
,(563,'VEHICLE - STOLEN',248,'2020-10-19',24,93,0)
,(564,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',269,'2020-12-03',24,430,0)
,(565,'VEHICLE - STOLEN',9,'2020-03-19',24,39,0)
,(566,'THEFT OF IDENTITY',88,'2020-12-16',36,554,0)
,(567,'THEFT OF IDENTITY',259,'2020-04-07',36,626,0)
,(568,'THEFT OF IDENTITY',36,'2020-11-12',36,295,0)
,(569,'THEFT OF IDENTITY',281,'2020-08-28',36,31,0)
,(570,'THEFT OF IDENTITY',170,'2020-06-05',36,513,0)
,(571,'THEFT OF IDENTITY',27,'2020-03-03',36,359,0)
,(572,'THEFT OF IDENTITY',85,'2020-08-01',36,172,0)
,(573,'VIOLATION OF COURT ORDER',27,'2020-12-05',12,33,0)
,(574,'THEFT OF IDENTITY',277,'2020-01-12',36,34,0)
,(575,'INTIMATE PARTNER - SIMPLE ASSAULT',263,'2020-10-14',9,304,0)
,(576,'DISTURBING THE PEACE',87,'2020-11-01',4,397,0)
,(577,'THEFT OF IDENTITY',280,'2020-04-01',36,646,0)
,(578,'VIOLATION OF RESTRAINING ORDER',150,'2020-03-01',12,131,0)
,(579,'CHILD ANNOYING (17YRS & UNDER)',163,'2020-01-01',18,517,0)
,(580,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',181,'2020-10-28',18,60,0)
,(581,'THEFT OF IDENTITY',119,'2020-12-13',36,447,0)
,(582,'THEFT OF IDENTITY',58,'2020-12-04',36,240,0)
,(583,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',166,'2020-10-21',24,705,0)
,(584,'CRIMINAL THREATS - NO WEAPON DISPLAYED',49,'2020-11-01',18,563,0)
,(585,'THEFT OF IDENTITY',13,'2020-03-01',36,10,0)
,(586,'THEFT OF IDENTITY',287,'2020-01-01',36,181,0)
,(587,'THEFT OF IDENTITY',162,'2020-06-05',36,440,0)
,(588,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',86,'2020-05-01',4,466,0)
,(589,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',194,'2020-12-12',18,732,0)
,(590,'INTIMATE PARTNER - AGGRAVATED ASSAULT',53,'2020-02-01',48,404,0)
,(591,'THEFT OF IDENTITY',7,'2020-08-11',36,499,0)
,(592,'SEXUAL PENETRATION W/FOREIGN OBJECT',246,'2020-04-15',96,522,0)
,(593,'THEFT OF IDENTITY',188,'2020-09-27',36,411,0)
,(594,'VEHICLE - STOLEN',271,'2020-02-17',24,241,0)
,(595,'BURGLARY',230,'2020-07-16',36,476,0)
,(596,'INTIMATE PARTNER - SIMPLE ASSAULT',6,'2020-03-01',9,489,0)
,(597,'THEFT OF IDENTITY',257,'2020-09-22',36,320,0)
,(598,'THEFT OF IDENTITY',165,'2020-08-16',36,332,0)
,(599,'RAPE, FORCIBLE',81,'2020-10-27',240,743,0)
,(600,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',259,'2020-08-01',4,490,0)
,(601,'INTIMATE PARTNER - SIMPLE ASSAULT',277,'2020-03-22',9,461,0)
,(602,'THEFT PLAIN - PETTY ($950 & UNDER)',144,'2020-12-25',6,633,0)
,(603,'VANDALISM - FELONY ($400 & OVER, ALL CHURCH VANDALISMS)',53,'2020-06-02',24,712,0)
,(604,'BURGLARY',271,'2020-08-01',36,314,0)
,(605,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',52,'2020-03-10',24,365,0)
,(606,'THEFT OF IDENTITY',273,'2020-10-20',36,619,0)
,(607,'THEFT OF IDENTITY',146,'2020-05-27',36,296,0)
,(608,'THEFT OF IDENTITY',282,'2020-06-07',36,58,0)
,(609,'THEFT OF IDENTITY',85,'2020-11-06',36,690,0)
,(610,'THEFT OF IDENTITY',109,'2020-06-01',36,562,0)
,(611,'CHILD ANNOYING (17YRS & UNDER)',90,'2020-01-01',18,234,0)
,(612,'RAPE, FORCIBLE',8,'2020-08-01',240,313,0)
,(613,'VEHICLE - STOLEN',59,'2020-05-28',24,612,0)
,(614,'BURGLARY',286,'2020-12-20',36,48,0)
,(615,'THEFT OF IDENTITY',11,'2020-03-15',36,794,0)
,(616,'THEFT OF IDENTITY',153,'2020-04-30',36,62,0)
,(617,'BUNCO, GRAND THEFT',5,'2020-10-28',24,685,0)
,(618,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',113,'2020-11-18',24,631,0)
,(619,'THEFT OF IDENTITY',198,'2020-04-15',36,545,0)
,(620,'THEFT OF IDENTITY',296,'2020-07-20',36,268,0)
,(621,'VEHICLE - STOLEN',195,'2020-04-02',24,740,0)
,(622,'THEFT OF IDENTITY',83,'2020-07-11',36,373,0)
,(623,'SEX,UNLAWFUL(INC MUTUAL CONSENT, PENETRATION W/ FRGN OBJ',179,'2020-01-04',36,632,0)
,(624,'THEFT OF IDENTITY',17,'2020-12-18',36,323,0)
,(625,'BURGLARY',72,'2020-05-30',36,132,0)
,(626,'FALSE POLICE REPORT',252,'2020-03-01',9,672,0)
,(627,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',20,'2020-08-12',18,152,0)
,(628,'THEFT OF IDENTITY',220,'2020-10-15',36,742,0)
,(629,'SHOPLIFTING - PETTY THEFT ($950 & UNDER)',267,'2020-03-11',6,560,0)
,(630,'THEFT OF IDENTITY',58,'2020-01-01',36,156,0)
,(631,'THEFT OF IDENTITY',29,'2020-08-23',36,782,0)
,(632,'THEFT OF IDENTITY',245,'2020-11-18',36,412,0)
,(633,'RAPE, FORCIBLE',81,'2020-01-01',240,36,0)
,(634,'SEXUAL PENETRATION W/FOREIGN OBJECT',25,'2020-06-01',96,406,0)
,(635,'BATTERY WITH SEXUAL CONTACT',197,'2020-08-15',36,384,0)
,(636,'BATTERY - SIMPLE ASSAULT',139,'2020-10-30',9,193,0)
,(637,'VIOLATION OF RESTRAINING ORDER',153,'2020-08-21',12,257,0)
,(638,'THEFT OF IDENTITY',220,'2020-03-28',36,769,0)
,(639,'RAPE, FORCIBLE',128,'2020-01-20',240,535,0)
,(640,'THEFT OF IDENTITY',254,'2020-01-01',36,605,0)
,(641,'VEHICLE - STOLEN',88,'2020-02-07',24,242,0)
,(642,'THEFT OF IDENTITY',0,'2020-10-30',36,536,0)
,(643,'INTIMATE PARTNER - SIMPLE ASSAULT',160,'2020-11-21',9,541,0)
,(644,'THEFT OF IDENTITY',241,'2020-04-08',36,366,0)
,(645,'THEFT OF IDENTITY',93,'2020-05-20',36,385,0)
,(646,'THEFT OF IDENTITY',115,'2020-09-01',36,531,0)
,(647,'THEFT OF IDENTITY',266,'2020-09-20',36,79,0)
,(648,'THEFT OF IDENTITY',117,'2020-01-15',36,592,0)
,(649,'THEFT OF IDENTITY',83,'2020-02-01',36,172,0)
,(650,'BATTERY - SIMPLE ASSAULT',99,'2020-11-16',9,551,0)
,(651,'EMBEZZLEMENT, GRAND THEFT ($950.01 & OVER)',115,'2020-11-16',36,606,0)
,(652,'BATTERY WITH SEXUAL CONTACT',111,'2020-11-01',36,673,0)
,(653,'VEHICLE - STOLEN',254,'2020-09-25',24,187,0)
,(654,'THEFT OF IDENTITY',216,'2020-12-17',36,238,0)
,(655,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',161,'2020-10-01',180,136,0)
,(656,'THEFT OF IDENTITY',242,'2020-09-01',36,204,0)
,(657,'THEFT OF IDENTITY',193,'2020-07-14',36,95,0)
,(658,'THEFT OF IDENTITY',107,'2020-01-08',36,367,0)
,(659,'THEFT OF IDENTITY',196,'2020-03-10',36,110,0)
,(660,'THEFT OF IDENTITY',96,'2020-10-17',36,285,0)
,(661,'VIOLATION OF COURT ORDER',234,'2020-01-01',12,462,0)
,(662,'THEFT OF IDENTITY',242,'2020-11-04',36,387,0)
,(663,'RAPE, FORCIBLE',198,'2020-08-22',240,394,0)
,(664,'THEFT OF IDENTITY',168,'2020-07-20',36,150,0)
,(665,'THEFT OF IDENTITY',163,'2020-03-15',36,291,0)
,(666,'CRIMINAL THREATS - NO WEAPON DISPLAYED',140,'2020-10-18',18,478,0)
,(667,'THEFT OF IDENTITY',213,'2020-01-01',36,254,0)
,(668,'THEFT OF IDENTITY',24,'2020-01-25',36,750,0)
,(669,'THEFT OF IDENTITY',265,'2020-02-02',36,436,0)
,(670,'THEFT OF IDENTITY',86,'2020-06-30',36,782,0)
,(671,'THEFT OF IDENTITY',30,'2020-01-04',36,18,0)
,(672,'VEHICLE - STOLEN',251,'2020-01-01',24,345,0)
,(673,'THEFT OF IDENTITY',189,'2020-01-01',36,212,0)
,(674,'THEFT OF IDENTITY',26,'2020-01-01',36,386,0)
,(675,'VEHICLE - STOLEN',204,'2020-03-24',24,714,0)
,(676,'RAPE, FORCIBLE',19,'2020-04-27',240,34,0)
,(677,'THEFT OF IDENTITY',115,'2020-08-05',36,607,0)
,(678,'THEFT OF IDENTITY',237,'2020-02-26',36,360,0)
,(679,'BURGLARY FROM VEHICLE',120,'2020-08-19',9,70,0)
,(680,'CREDIT CARDS, FRAUD USE ($950.01 & OVER)',280,'2020-10-01',24,19,0)
,(681,'THEFT PLAIN - PETTY ($950 & UNDER)',116,'2020-02-10',6,226,0)
,(682,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',46,'2020-04-22',24,265,0)
,(683,'THEFT OF IDENTITY',265,'2020-01-01',36,146,0)
,(684,'THEFT OF IDENTITY',82,'2020-12-01',36,165,0)
,(685,'EMBEZZLEMENT, GRAND THEFT ($950.01 & OVER)',6,'2020-11-01',36,771,0)
,(686,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',199,'2020-01-01',180,213,0)
,(687,'THEFT OF IDENTITY',266,'2020-06-22',36,706,0)
,(688,'THEFT OF IDENTITY',244,'2020-01-12',36,220,0)
,(689,'RAPE, FORCIBLE',26,'2020-07-08',240,483,0)
,(690,'SEX,UNLAWFUL(INC MUTUAL CONSENT, PENETRATION W/ FRGN OBJ',214,'2020-11-01',36,321,0)
,(691,'THEFT OF IDENTITY',232,'2020-04-01',36,30,0)
,(692,'THEFT OF IDENTITY',237,'2020-08-06',36,115,0)
,(693,'THEFT PLAIN - PETTY ($950 & UNDER)',222,'2020-11-14',6,698,0)
,(694,'THEFT OF IDENTITY',166,'2020-07-05',36,250,0)
,(695,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',297,'2020-11-18',4,359,0)
,(696,'DISTURBING THE PEACE',202,'2020-06-01',4,514,0)
,(697,'THEFT OF IDENTITY',37,'2020-08-31',36,586,0)
,(698,'THEFT OF IDENTITY',57,'2020-06-12',36,332,0)
,(699,'VANDALISM - FELONY ($400 & OVER, ALL CHURCH VANDALISMS)',5,'2020-11-03',24,2,0)
,(700,'INTIMATE PARTNER - AGGRAVATED ASSAULT',199,'2020-02-04',48,683,0)
,(701,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',52,'2020-03-01',24,140,0)
,(702,'INTIMATE PARTNER - AGGRAVATED ASSAULT',192,'2020-05-25',48,722,0)
,(703,'VEHICLE - STOLEN',213,'2020-07-05',24,649,0)
,(704,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',157,'2020-04-02',24,613,0)
,(705,'THEFT OF IDENTITY',276,'2020-05-01',36,340,0)
,(706,'THEFT OF IDENTITY',244,'2020-02-09',36,40,0)
,(707,'THEFT OF IDENTITY',282,'2020-11-12',36,299,0)
,(708,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',134,'2020-12-18',24,563,0)
,(709,'INTIMATE PARTNER - SIMPLE ASSAULT',68,'2020-11-20',9,399,0)
,(710,'THEFT OF IDENTITY',133,'2020-01-01',36,787,0)
,(711,'THEFT OF IDENTITY',186,'2020-04-17',36,776,0)
,(712,'THEFT OF IDENTITY',296,'2020-12-01',36,707,0)
,(713,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',179,'2020-04-01',180,265,0)
,(714,'THEFT OF IDENTITY',283,'2020-08-06',36,678,0)
,(715,'THEFT OF IDENTITY',98,'2020-03-02',36,624,0)
,(716,'THEFT OF IDENTITY',227,'2020-03-04',36,479,0)
,(717,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',236,'2020-06-01',18,328,0)
,(718,'THEFT OF IDENTITY',95,'2020-08-05',36,275,0)
,(719,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',271,'2020-01-01',180,272,0)
,(720,'BUNCO, GRAND THEFT',166,'2020-06-01',24,178,0)
,(721,'THEFT OF IDENTITY',38,'2020-05-01',36,736,0)
,(722,'SEXUAL PENETRATION W/FOREIGN OBJECT',92,'2020-01-01',96,784,0)
,(723,'THEFT OF IDENTITY',10,'2020-01-18',36,217,0)
,(724,'CONTRIBUTING',295,'2020-12-01',12,616,0)
,(725,'THEFT OF IDENTITY',61,'2020-07-02',36,306,0)
,(726,'THEFT OF IDENTITY',71,'2020-07-25',36,151,0)
,(727,'CHILD ABUSE (PHYSICAL) - SIMPLE ASSAULT',188,'2020-01-01',24,260,0)
,(728,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',265,'2020-09-19',4,121,0)
,(729,'VIOLATION OF COURT ORDER',131,'2020-04-07',12,336,0)
,(730,'THEFT OF IDENTITY',255,'2020-01-01',36,434,0)
,(731,'THEFT OF IDENTITY',216,'2020-08-11',36,622,0)
,(732,'THEFT OF IDENTITY',80,'2020-09-29',36,48,0)
,(733,'THEFT OF IDENTITY',121,'2020-12-08',36,737,0)
,(734,'VANDALISM - FELONY ($400 & OVER, ALL CHURCH VANDALISMS)',161,'2020-08-04',24,355,0)
,(735,'THEFT FROM MOTOR VEHICLE - GRAND ($950.01 AND OVER)',272,'2020-11-01',18,697,0)
,(736,'THEFT OF IDENTITY',147,'2020-06-03',36,755,0)
,(737,'THEFT OF IDENTITY',79,'2020-02-12',36,705,0)
,(738,'THEFT OF IDENTITY',292,'2020-08-28',36,674,0)
,(739,'THEFT OF IDENTITY',123,'2020-11-19',36,564,0)
,(740,'THEFT OF IDENTITY',200,'2020-07-06',36,786,0)
,(741,'EMBEZZLEMENT, GRAND THEFT ($950.01 & OVER)',92,'2020-11-01',36,142,0)
,(742,'THEFT OF IDENTITY',212,'2020-01-05',36,323,0)
,(743,'THEFT OF IDENTITY',136,'2020-12-15',36,325,0)
,(744,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',265,'2020-05-01',18,122,0)
,(745,'THEFT OF IDENTITY',205,'2020-05-15',36,721,0)
,(746,'THEFT OF IDENTITY',150,'2020-01-01',36,400,0)
,(747,'THEFT OF IDENTITY',255,'2020-06-25',36,723,0)
,(748,'THEFT OF IDENTITY',188,'2020-10-24',36,102,0)
,(749,'THEFT OF IDENTITY',247,'2020-11-17',36,578,0)
,(750,'CHILD ABUSE (PHYSICAL) - SIMPLE ASSAULT',67,'2020-01-09',24,751,0)
,(751,'THEFT OF IDENTITY',237,'2020-06-22',36,314,0)
,(752,'RAPE, FORCIBLE',1,'2020-01-01',240,62,0)
,(753,'THEFT OF IDENTITY',141,'2020-07-09',36,558,0)
,(754,'BURGLARY FROM VEHICLE',240,'2020-08-07',9,645,0)
,(755,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',190,'2020-08-01',18,108,0)
,(756,'VANDALISM - MISDEAMEANOR ($399 OR UNDER)',174,'2020-09-02',3,772,0)
,(757,'THEFT OF IDENTITY',297,'2020-01-20',36,301,0)
,(758,'BATTERY WITH SEXUAL CONTACT',164,'2020-05-01',36,565,0)
,(759,'THEFT OF IDENTITY',256,'2020-02-01',36,703,0)
,(760,'INTIMATE PARTNER - SIMPLE ASSAULT',256,'2020-01-01',9,679,0)
,(761,'THEFT OF IDENTITY',154,'2020-10-28',36,413,0)
,(762,'THEFT OF IDENTITY',279,'2020-07-16',36,157,0)
,(763,'BATTERY WITH SEXUAL CONTACT',221,'2020-01-15',36,336,0)
,(764,'VANDALISM - MISDEAMEANOR ($399 OR UNDER)',294,'2020-12-20',3,86,0)
,(765,'EXTORTION',259,'2020-11-02',48,144,0)
,(766,'THEFT OF IDENTITY',30,'2020-11-01',36,552,0)
,(767,'THEFT PLAIN - PETTY ($950 & UNDER)',137,'2020-12-18',6,161,0)
,(768,'THEFT OF IDENTITY',151,'2020-12-01',36,125,0)
,(769,'THEFT OF IDENTITY',165,'2020-01-14',36,587,0)
,(770,'THEFT OF IDENTITY',228,'2020-01-22',36,755,0)
,(771,'CHILD ABUSE (PHYSICAL) - SIMPLE ASSAULT',33,'2020-12-01',24,123,0)
,(772,'THEFT OF IDENTITY',104,'2020-02-24',36,430,0)
,(773,'BURGLARY',158,'2020-04-01',36,661,0)
,(774,'THEFT OF IDENTITY',262,'2020-01-01',36,510,0)
,(775,'EMBEZZLEMENT, GRAND THEFT ($950.01 & OVER)',17,'2020-12-14',36,87,0)
,(776,'BUNCO, GRAND THEFT',188,'2020-09-09',24,795,0)
,(777,'INTIMATE PARTNER - SIMPLE ASSAULT',54,'2020-11-16',9,542,0)
,(778,'RAPE, FORCIBLE',52,'2020-01-01',240,472,0)
,(779,'INTIMATE PARTNER - SIMPLE ASSAULT',226,'2020-07-11',9,623,0)
,(780,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',298,'2020-08-01',24,425,0)
,(781,'THEFT OF IDENTITY',187,'2020-02-02',36,491,0)
,(782,'THEFT OF IDENTITY',96,'2020-09-14',36,262,0)
,(783,'THEFT OF IDENTITY',59,'2020-03-26',36,594,0)
,(784,'THEFT OF IDENTITY',253,'2020-09-09',36,644,0)
,(785,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',99,'2020-01-01',180,546,0)
,(786,'THEFT OF IDENTITY',112,'2020-01-17',36,447,0)
,(787,'THEFT OF IDENTITY',61,'2020-08-01',36,20,0)
,(788,'INTIMATE PARTNER - SIMPLE ASSAULT',156,'2020-02-02',9,776,0)
,(789,'THEFT OF IDENTITY',150,'2020-10-31',36,526,0)
,(790,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',119,'2020-08-01',180,747,0)
,(791,'THEFT OF IDENTITY',218,'2020-11-06',36,638,0)
,(792,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',212,'2020-08-05',18,23,0)
,(793,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',223,'2020-03-16',24,641,0)
,(794,'THEFT OF IDENTITY',29,'2020-01-01',36,292,0)
,(795,'THEFT OF IDENTITY',183,'2020-12-30',36,270,0)
,(796,'RAPE, FORCIBLE',223,'2020-06-19',240,328,0)
,(797,'THEFT OF IDENTITY',3,'2020-08-03',36,454,0)
,(798,'BURGLARY',175,'2020-01-19',36,337,0)
,(799,'FALSE IMPRISONMENT',199,'2020-06-07',36,442,0)
,(800,'THEFT OF IDENTITY',198,'2020-06-02',36,376,0)
,(801,'BUNCO, ATTEMPT',43,'2020-07-10',6,547,0)
,(802,'BATTERY WITH SEXUAL CONTACT',290,'2020-07-02',36,182,0)
,(803,'THEFT OF IDENTITY',212,'2020-01-02',36,261,0)
,(804,'DOCUMENT FORGERY / STOLEN FELONY',203,'2020-09-22',48,99,0)
,(805,'THEFT OF IDENTITY',110,'2020-09-20',36,717,0)
,(806,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',56,'2020-01-15',18,346,0)
,(807,'RAPE, FORCIBLE',235,'2020-11-22',240,390,0)
,(808,'VEHICLE - STOLEN',182,'2020-06-09',24,73,0)
,(809,'THEFT OF IDENTITY',289,'2020-01-01',36,566,0)
,(810,'THEFT OF IDENTITY',16,'2020-10-15',36,293,0)
,(811,'THEFT OF IDENTITY',137,'2020-09-20',36,315,0)
,(812,'INTIMATE PARTNER - SIMPLE ASSAULT',102,'2020-12-31',9,759,0)
,(813,'THEFT OF IDENTITY',94,'2020-07-12',36,486,0)
,(814,'THEFT OF IDENTITY',22,'2020-03-02',36,134,0)
,(815,'THEFT OF IDENTITY',75,'2020-02-22',36,136,0)
,(816,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',243,'2020-04-12',18,416,0)
,(817,'THEFT OF IDENTITY',59,'2020-03-07',36,313,0)
,(818,'THEFT OF IDENTITY',69,'2020-02-15',36,720,0)
,(819,'THEFT OF IDENTITY',92,'2020-09-21',36,368,0)
,(820,'THEFT OF IDENTITY',149,'2020-11-04',36,303,0)
,(821,'VEHICLE - STOLEN',275,'2020-07-05',24,791,0)
,(822,'THEFT OF IDENTITY',252,'2020-06-09',36,603,0)
,(823,'BURGLARY FROM VEHICLE',111,'2020-12-19',9,581,0)
,(824,'THEFT OF IDENTITY',110,'2020-11-27',36,239,0)
,(825,'THEFT OF IDENTITY',217,'2020-02-01',36,147,0)
,(826,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',113,'2020-10-14',24,576,0)
,(827,'VEHICLE - STOLEN',201,'2020-10-15',24,713,0)
,(828,'THEFT PLAIN - PETTY ($950 & UNDER)',41,'2020-12-20',6,393,0)
,(829,'THEFT OF IDENTITY',97,'2020-05-06',36,543,0)
,(830,'BURGLARY FROM VEHICLE',6,'2020-08-20',9,752,0)
,(831,'VEHICLE - STOLEN',45,'2020-10-25',24,28,0)
,(832,'THEFT OF IDENTITY',187,'2020-02-09',36,342,0)
,(833,'THEFT OF IDENTITY',145,'2020-06-10',36,745,0)
,(834,'THEFT OF IDENTITY',286,'2020-12-20',36,746,0)
,(835,'THEFT OF IDENTITY',70,'2020-08-19',36,3,0)
,(836,'THEFT OF IDENTITY',131,'2020-06-16',36,470,0)
,(837,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',26,'2020-01-01',180,297,0)
,(838,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',147,'2020-01-02',4,755,0)
,(839,'THEFT OF IDENTITY',6,'2020-03-08',36,128,0)
,(840,'THEFT OF IDENTITY',228,'2020-01-01',36,764,0)
,(841,'THEFT OF IDENTITY',291,'2020-06-03',36,317,0)
,(842,'THEFT OF IDENTITY',97,'2020-01-22',36,634,0)
,(843,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',76,'2020-01-23',4,218,0)
,(844,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',6,'2020-05-08',24,711,0)
,(845,'THEFT OF IDENTITY',103,'2020-04-19',36,63,0)
,(846,'DOCUMENT FORGERY / STOLEN FELONY',237,'2020-07-01',48,675,0)
,(847,'THEFT OF IDENTITY',108,'2020-06-20',36,229,0)
,(848,'BATTERY - SIMPLE ASSAULT',139,'2020-12-30',9,647,0)
,(849,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',3,'2020-09-11',180,65,0)
,(850,'THEFT OF IDENTITY',52,'2020-11-19',36,473,0)
,(851,'THEFT OF IDENTITY',187,'2020-01-03',36,437,0)
,(852,'BUNCO, GRAND THEFT',250,'2020-12-15',24,716,0)
,(853,'THEFT OF IDENTITY',11,'2020-12-16',36,202,0)
,(854,'THEFT OF IDENTITY',236,'2020-06-30',36,549,0)
,(855,'CHILD ABUSE (PHYSICAL) - SIMPLE ASSAULT',267,'2020-07-01',24,111,0)
,(856,'THEFT OF IDENTITY',117,'2020-02-20',36,6,0)
,(857,'VEHICLE - STOLEN',150,'2020-07-01',24,622,0)
,(858,'THEFT OF IDENTITY',177,'2020-07-21',36,439,0)
,(859,'THEFT OF IDENTITY',125,'2020-08-12',36,186,0)
,(860,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',55,'2020-06-22',18,251,0)
,(861,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',198,'2020-07-10',180,718,0)
,(862,'BATTERY - SIMPLE ASSAULT',39,'2020-09-29',9,90,0)
,(863,'THEFT PLAIN - PETTY ($950 & UNDER)',121,'2020-07-20',6,155,0)
,(864,'THEFT OF IDENTITY',50,'2020-01-01',36,24,0)
,(865,'THEFT OF IDENTITY',34,'2020-03-19',36,553,0)
,(866,'THEFT OF IDENTITY',79,'2020-10-07',36,746,0)
,(867,'THEFT OF IDENTITY',183,'2020-03-03',36,662,0)
,(868,'SEXUAL PENETRATION W/FOREIGN OBJECT',222,'2020-09-01',96,12,0)
,(869,'VEHICLE - STOLEN',126,'2020-04-28',24,274,0)
,(870,'SEXUAL PENETRATION W/FOREIGN OBJECT',292,'2020-06-15',96,209,0)
,(871,'THEFT OF IDENTITY',60,'2020-07-07',36,312,0)
,(872,'THEFT OF IDENTITY',44,'2020-11-12',36,369,0)
,(873,'THEFT OF IDENTITY',109,'2020-08-19',36,15,0)
,(874,'THEFT OF IDENTITY',216,'2020-08-20',36,463,0)
,(875,'THEFT OF IDENTITY',63,'2020-07-16',36,89,0)
,(876,'SEX,UNLAWFUL(INC MUTUAL CONSENT, PENETRATION W/ FRGN OBJ',10,'2020-07-22',36,663,0)
,(877,'THEFT OF IDENTITY',208,'2020-11-19',36,502,0)
,(878,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',229,'2020-03-15',180,263,0)
,(879,'THEFT PLAIN - PETTY ($950 & UNDER)',82,'2020-11-18',6,446,0)
,(880,'THEFT OF IDENTITY',21,'2020-02-09',36,278,0)
,(881,'VANDALISM - FELONY ($400 & OVER, ALL CHURCH VANDALISMS)',65,'2020-10-30',24,334,0)
,(882,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',192,'2020-03-08',18,594,0)
,(883,'THEFT OF IDENTITY',178,'2020-11-17',36,224,0)
,(884,'THEFT OF IDENTITY',285,'2020-02-09',36,362,0)
,(885,'THEFT OF IDENTITY',77,'2020-07-27',36,788,0)
,(886,'VEHICLE - STOLEN',92,'2020-09-01',24,455,0)
,(887,'CHILD ABUSE (PHYSICAL) - SIMPLE ASSAULT',32,'2020-09-01',24,24,0)
,(888,'THEFT OF IDENTITY',286,'2020-07-04',36,184,0)
,(889,'THEFT OF IDENTITY',181,'2020-04-25',36,468,0)
,(890,'THEFT OF IDENTITY',101,'2020-02-06',36,414,0)
,(891,'THEFT OF IDENTITY',95,'2020-02-10',36,798,0)
,(892,'THEFT OF IDENTITY',149,'2020-06-30',36,329,0)
,(893,'THEFT OF IDENTITY',123,'2020-08-01',36,326,0)
,(894,'THEFT OF IDENTITY',155,'2020-09-03',36,588,0)
,(895,'BURGLARY',121,'2020-01-01',36,593,0)
,(896,'THEFT OF IDENTITY',68,'2020-01-27',36,62,0)
,(897,'THEFT OF IDENTITY',180,'2020-01-06',36,361,0)
,(898,'THEFT OF IDENTITY',245,'2020-10-24',36,379,0)
,(899,'THEFT OF IDENTITY',15,'2020-08-17',36,454,0)
,(900,'SEXUAL PENETRATION W/FOREIGN OBJECT',64,'2020-07-05',96,572,0)
,(901,'THEFT OF IDENTITY',62,'2020-11-19',36,55,0)
,(902,'VEHICLE - STOLEN',44,'2020-03-06',24,57,0)
,(903,'THEFT FROM MOTOR VEHICLE - GRAND ($950.01 AND OVER)',223,'2020-12-17',18,83,0)
,(904,'THEFT OF IDENTITY',246,'2020-12-29',36,307,0)
,(905,'THEFT OF IDENTITY',177,'2020-07-05',36,264,0)
,(906,'BUNCO, GRAND THEFT',98,'2020-06-01',24,793,0)
,(907,'PICKPOCKET',192,'2020-09-22',9,53,0)
,(908,'BURGLARY',64,'2020-12-20',36,92,0)
,(909,'THEFT OF IDENTITY',246,'2020-06-07',36,74,0)
,(910,'BUNCO, GRAND THEFT',148,'2020-03-01',24,796,0)
,(911,'THEFT OF IDENTITY',22,'2020-05-28',36,770,0)
,(912,'INTIMATE PARTNER - SIMPLE ASSAULT',62,'2020-01-01',9,407,0)
,(913,'VEHICLE - STOLEN',152,'2020-11-18',24,401,0)
,(914,'INTIMATE PARTNER - AGGRAVATED ASSAULT',122,'2020-01-01',48,29,0)
,(915,'THEFT OF IDENTITY',28,'2020-07-02',36,195,0)
,(916,'THEFT OF IDENTITY',88,'2020-01-02',36,655,0)
,(917,'THEFT OF IDENTITY',296,'2020-01-01',36,408,0)
,(918,'CHILD ABUSE (PHYSICAL) - AGGRAVATED ASSAULT',62,'2020-08-01',48,175,0)
,(919,'THEFT OF IDENTITY',137,'2020-01-09',36,538,0)
,(920,'THEFT OF IDENTITY',211,'2020-08-04',36,656,0)
,(921,'THEFT OF IDENTITY',184,'2020-04-01',36,518,0)
,(922,'THEFT PLAIN - PETTY ($950 & UNDER)',162,'2020-12-12',6,358,0)
,(923,'THEFT OF IDENTITY',264,'2020-01-06',36,729,0)
,(924,'THEFT OF IDENTITY',253,'2020-01-14',36,444,0)
,(925,'ATTEMPTED ROBBERY',265,'2020-04-19',36,289,0)
,(926,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',259,'2020-03-15',4,169,0)
,(927,'DOCUMENT FORGERY / STOLEN FELONY',99,'2020-10-26',48,456,0)
,(928,'BURGLARY',48,'2020-11-24',36,748,0)
,(929,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',270,'2020-05-28',24,680,0)
,(930,'RAPE, FORCIBLE',25,'2020-09-01',240,298,0)
,(931,'ASSAULT WITH DEADLY WEAPON, AGGRAVATED ASSAULT',194,'2020-11-18',48,18,0)
,(932,'RAPE, FORCIBLE',24,'2020-03-01',240,481,0)
,(933,'EMBEZZLEMENT, GRAND THEFT ($950.01 & OVER)',16,'2020-10-28',36,304,0)
,(934,'THEFT OF IDENTITY',106,'2020-01-01',36,333,0)
,(935,'UNAUTHORIZED COMPUTER ACCESS',290,'2020-01-03',12,567,0)
,(936,'VANDALISM - FELONY ($400 & OVER, ALL CHURCH VANDALISMS)',188,'2020-09-24',24,519,0)
,(937,'THEFT OF IDENTITY',221,'2020-01-01',36,401,0)
,(938,'THEFT OF IDENTITY',6,'2020-06-03',36,709,0)
,(939,'THEFT OF IDENTITY',284,'2020-09-20',36,753,0)
,(940,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',224,'2020-08-20',18,532,0)
,(941,'THEFT PLAIN - PETTY ($950 & UNDER)',225,'2020-11-03',6,170,0)
,(942,'THEFT OF IDENTITY',1,'2020-06-15',36,205,0)
,(943,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',112,'2020-01-01',24,421,0)
,(944,'VEHICLE - STOLEN',45,'2020-07-20',24,374,0)
,(945,'THEFT OF IDENTITY',19,'2020-01-01',36,523,0)
,(946,'THEFT OF IDENTITY',87,'2020-05-01',36,158,0)
,(947,'THEFT OF IDENTITY',261,'2020-01-01',36,216,0)
,(948,'SEX,UNLAWFUL(INC MUTUAL CONSENT, PENETRATION W/ FRGN OBJ',165,'2020-01-01',36,550,0)
,(949,'CREDIT CARDS, FRAUD USE ($950 & UNDER',289,'2020-01-09',12,779,0)
,(950,'BURGLARY FROM VEHICLE',16,'2020-12-24',9,105,0)
,(951,'BURGLARY',40,'2020-11-24',36,682,0)
,(952,'UNAUTHORIZED COMPUTER ACCESS',266,'2020-06-17',12,642,0)
,(953,'BURGLARY FROM VEHICLE',189,'2020-12-11',9,449,0)
,(954,'THEFT OF IDENTITY',211,'2020-08-01',36,348,0)
,(955,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',200,'2020-06-22',18,733,0)
,(956,'INTIMATE PARTNER - AGGRAVATED ASSAULT',248,'2020-06-18',48,780,0)
,(957,'BURGLARY FROM VEHICLE',133,'2020-02-13',9,159,0)
,(958,'ARSON',17,'2020-05-05',120,16,0)
,(959,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',62,'2020-12-25',18,219,0)
,(960,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',80,'2020-04-21',24,43,0)
,(961,'THEFT OF IDENTITY',286,'2020-10-14',36,443,0)
,(962,'THEFT OF IDENTITY',223,'2020-08-30',36,515,0)
,(963,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',204,'2020-06-19',24,477,0)
,(964,'RAPE, FORCIBLE',111,'2020-10-01',240,226,0)
,(965,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',189,'2020-01-21',24,784,0)
,(966,'THEFT OF IDENTITY',248,'2020-05-21',36,417,0)
,(967,'THEFT OF IDENTITY',115,'2020-05-31',36,418,0)
,(968,'THEFT OF IDENTITY',228,'2020-01-06',36,316,0)
,(969,'THEFT OF IDENTITY',28,'2020-09-15',36,261,0)
,(970,'THEFT OF IDENTITY',251,'2020-12-02',36,165,0)
,(971,'BATTERY - SIMPLE ASSAULT',233,'2020-03-01',9,252,0)
,(972,'THEFT OF IDENTITY',263,'2020-09-06',36,693,0)
,(973,'SHOPLIFTING - PETTY THEFT ($950 & UNDER)',177,'2020-12-31',6,776,0)
,(974,'THEFT OF IDENTITY',33,'2020-01-28',36,516,0)
,(975,'THEFT OF IDENTITY',215,'2020-02-25',36,719,0)
,(976,'SODOMY/SEXUAL CONTACT B/W PENIS OF ONE PERS TO ANUS OTH',251,'2020-12-01',96,754,0)
,(977,'THEFT OF IDENTITY',131,'2020-10-12',36,205,0)
,(978,'THEFT OF IDENTITY',234,'2020-06-10',36,701,0)
,(979,'THEFT OF IDENTITY',220,'2020-07-15',36,46,0)
,(980,'VANDALISM - FELONY ($400 & OVER, ALL CHURCH VANDALISMS)',90,'2020-06-25',24,395,0)
,(981,'THEFT OF IDENTITY',238,'2020-07-03',36,317,0)
,(982,'THEFT OF IDENTITY',280,'2020-12-23',36,794,0)
,(983,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',74,'2020-12-01',180,419,0)
,(984,'VEHICLE - STOLEN',176,'2020-04-30',24,64,0)
,(985,'INTIMATE PARTNER - SIMPLE ASSAULT',92,'2020-12-28',9,702,0)
,(986,'THEFT OF IDENTITY',156,'2020-02-10',36,676,0)
,(987,'THEFT OF IDENTITY',160,'2020-07-02',36,25,0)
,(988,'BURGLARY',181,'2020-12-02',36,469,0)
,(989,'THEFT OF IDENTITY',29,'2020-11-23',36,176,0)
,(990,'THEFT OF IDENTITY',161,'2020-08-10',36,349,0)
,(991,'CHILD STEALING',62,'2020-01-14',48,356,0)
,(992,'THEFT OF IDENTITY',40,'2020-01-01',36,767,0)
,(993,'THEFT OF IDENTITY',40,'2020-03-01',36,643,0)
,(994,'DOCUMENT FORGERY / STOLEN FELONY',69,'2020-11-22',48,686,0)
,(995,'THEFT OF IDENTITY',233,'2020-04-04',36,600,0)
,(996,'CHILD ABUSE (PHYSICAL) - SIMPLE ASSAULT',179,'2020-11-01',24,7,0)
,(997,'LEWD/LASCIVIOUS ACTS WITH CHILD',115,'2020-05-01',120,579,0)
,(998,'THEFT OF IDENTITY',199,'2020-09-01',36,495,0),
(999,'VEHICLE - STOLEN',506,'1963-05-07',47,546,0),
(1000,'BURGLARY FROM VEHICLE',810,'1984-10-13',43,1372,0),
(1001,'BIKE - STOLEN',654,'1984-08-12',14,1500,0),
(1002,'SHOPLIFTING-GRAND THEFT ($950.01 & OVER)',318,'2021-02-24',46,562,0),
(1003,'THEFT OF IDENTITY',899,'1982-07-17',16,354,0),
(1004,'THEFT OF IDENTITY',542,'1999-10-15',34,462,0),
(1005,'THEFT OF IDENTITY',210,'2017-07-26',10,1064,0),
(1006,'THEFT OF IDENTITY',895,'2011-08-27',31,1024,0),
(1007,'THEFT OF IDENTITY',22,'1958-06-23',49,741,0),
(1008,'BATTERY - SIMPLE ASSAULT',620,'1990-07-10',8,1367,0),
(1009,'THEFT OF IDENTITY',83,'1955-11-03',22,1379,0),
(1010,'SODOMY/SEXUAL CONTACT B/W PENIS OF ONE PERS TO ANUS OTH',615,'2022-11-21',11,521,0),
(1011,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',136,'2005-03-20',6,1199,0),
(1012,'VEHICLE - STOLEN',111,'1984-09-08',11,388,0),
(1013,'THEFT OF IDENTITY',601,'2015-01-24',6,47,0),
(1014,'THEFT OF IDENTITY',202,'1994-02-01',24,1377,0),
(1015,'THEFT OF IDENTITY',632,'1966-02-20',35,477,0),
(1016,'ASSAULT WITH DEADLY WEAPON, AGGRAVATED ASSAULT',134,'1954-07-29',4,420,0),
(1017,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',797,'2023-03-01',3,683,0),
(1018,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',196,'2009-05-01',30,1231,0),
(1019,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',542,'2005-02-09',26,955,0),
(1020,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',881,'1989-07-04',49,1122,0),
(1021,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',175,'1982-06-04',36,1001,0),
(1022,'VEHICLE - STOLEN',487,'1983-08-06',25,1363,0),
(1023,'THEFT OF IDENTITY',715,'1988-09-10',33,1035,0),
(1024,'CRIMINAL THREATS - NO WEAPON DISPLAYED',80,'2010-04-08',8,959,0),
(1025,'EMBEZZLEMENT, GRAND THEFT ($950.01 & OVER)',233,'1966-01-21',11,855,0),
(1026,'VEHICLE - STOLEN',276,'1967-07-28',13,607,0),
(1027,'THEFT OF IDENTITY',379,'1998-12-09',34,1300,0),
(1028,'BATTERY - SIMPLE ASSAULT',593,'1984-05-18',21,613,0),
(1029,'THEFT OF IDENTITY',17,'1950-05-30',41,480,0),
(1030,'THEFT OF IDENTITY',898,'1974-04-22',45,40,0),
(1031,'BURGLARY FROM VEHICLE',98,'1958-11-29',41,264,0),
(1032,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',82,'1986-03-19',28,115,0),
(1033,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',351,'1999-06-25',44,850,0),
(1034,'CRIMINAL THREATS - NO WEAPON DISPLAYED',524,'2012-07-15',36,804,0),
(1035,'THEFT OF IDENTITY',775,'1989-04-22',16,1395,0),
(1036,'THEFT OF IDENTITY',274,'2010-10-19',21,954,0),
(1037,'THEFT OF IDENTITY',642,'2001-02-25',28,444,0),
(1038,'THEFT OF IDENTITY',4,'1995-05-11',18,268,0),
(1039,'THEFT OF IDENTITY',301,'1988-01-20',4,422,0),
(1040,'THEFT OF IDENTITY',198,'2023-01-20',7,1057,0),
(1041,'CHILD ANNOYING (17YRS & UNDER)',414,'1972-10-15',28,830,0),
(1042,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',607,'2019-03-03',0,349,0),
(1043,'THEFT OF IDENTITY',303,'1957-06-16',18,439,0),
(1044,'THEFT OF IDENTITY',315,'1989-11-22',34,641,0),
(1045,'THEFT OF IDENTITY',636,'1999-12-24',23,430,0),
(1046,'THEFT OF IDENTITY',49,'1959-04-25',18,183,0),
(1047,'THEFT OF IDENTITY',652,'2007-05-27',1,1044,0),
(1048,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',165,'1980-04-12',38,145,0),
(1049,'THEFT OF IDENTITY',525,'1965-07-07',19,169,0),
(1050,'THEFT OF IDENTITY',669,'1962-03-06',17,321,0),
(1051,'THEFT OF IDENTITY',679,'1960-02-12',28,57,0),
(1052,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',389,'1984-04-18',34,870,0),
(1053,'THEFT PLAIN - PETTY ($950 & UNDER)',794,'1977-08-05',2,1090,0),
(1054,'THEFT OF IDENTITY',676,'1959-07-27',2,151,0),
(1055,'THEFT OF IDENTITY',411,'1953-07-02',42,276,0),
(1056,'THEFT OF IDENTITY',608,'1985-10-03',7,1382,0),
(1057,'THEFT OF IDENTITY',566,'1983-06-23',7,930,0),
(1058,'THEFT OF IDENTITY',112,'2011-12-16',24,261,0),
(1059,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',242,'2007-09-08',40,862,0),
(1060,'THEFT PLAIN - PETTY ($950 & UNDER)',398,'1990-09-26',46,966,0),
(1061,'BURGLARY FROM VEHICLE',770,'1979-07-24',42,1431,0),
(1062,'THEFT OF IDENTITY',262,'2004-03-29',18,575,0),
(1063,'THEFT OF IDENTITY',219,'2010-10-03',20,73,0),
(1064,'LEWD CONDUCT',53,'1959-12-29',4,998,0),
(1065,'THEFT PLAIN - ATTEMPT',784,'1982-09-01',10,1290,0),
(1066,'THEFT OF IDENTITY',382,'1957-03-13',31,503,0),
(1067,'THEFT OF IDENTITY',348,'1987-12-12',44,484,0),
(1068,'BURGLARY',5,'2011-01-10',33,915,0),
(1069,'THEFT OF IDENTITY',159,'2015-06-27',7,149,0),
(1070,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',593,'1974-12-18',18,110,0),
(1071,'THEFT OF IDENTITY',87,'1954-09-14',5,1358,0),
(1072,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',68,'2011-03-11',8,799,0),
(1073,'THEFT OF IDENTITY',821,'1982-02-01',29,1276,0),
(1074,'THEFT OF IDENTITY',449,'1998-06-14',20,574,0),
(1075,'THEFT OF IDENTITY',161,'2005-05-31',39,1155,0),
(1076,'VEHICLE - STOLEN',292,'1954-06-16',31,1127,0),
(1077,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',250,'1989-05-05',18,329,0),
(1078,'BURGLARY FROM VEHICLE',719,'2010-11-17',34,1191,0),
(1079,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',182,'1964-12-02',15,1254,0),
(1080,'THEFT FROM MOTOR VEHICLE - GRAND ($950.01 AND OVER)',199,'1983-01-28',40,1013,0),
(1081,'THEFT OF IDENTITY',887,'1951-08-09',16,1494,0),
(1082,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',129,'2022-04-21',49,1286,0),
(1083,'THEFT OF IDENTITY',155,'1977-07-21',6,330,0),
(1084,'BATTERY WITH SEXUAL CONTACT',638,'1980-11-11',18,845,0),
(1085,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',516,'1950-05-17',42,1264,0),
(1086,'THEFT OF IDENTITY',248,'1996-11-13',16,1326,0),
(1087,'THEFT OF IDENTITY',847,'1953-09-17',32,458,0),
(1088,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',464,'1954-08-22',50,420,0),
(1089,'INTIMATE PARTNER - SIMPLE ASSAULT',340,'1952-11-21',39,1456,0),
(1090,'CHILD ANNOYING (17YRS & UNDER)',626,'2022-03-25',18,1009,0),
(1091,'BURGLARY FROM VEHICLE',842,'1960-12-01',0,604,0),
(1092,'VEHICLE - STOLEN',242,'1952-09-13',1,773,0),
(1093,'THEFT OF IDENTITY',439,'1961-09-07',37,5,0),
(1094,'THEFT OF IDENTITY',402,'1954-10-10',11,1350,0),
(1095,'ROBBERY',508,'2001-07-02',3,480,0),
(1096,'BUNCO, GRAND THEFT',548,'1989-12-16',13,331,0),
(1097,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',639,'1993-07-18',31,142,0),
(1098,'THEFT OF IDENTITY',155,'1964-04-25',17,107,0),
(1099,'INTIMATE PARTNER - SIMPLE ASSAULT',536,'2024-06-30',28,1471,0),
(1100,'THEFT OF IDENTITY',164,'2011-03-19',44,1484,0),
(1101,'THEFT OF IDENTITY',579,'1981-04-24',24,1296,0),
(1102,'BURGLARY FROM VEHICLE',420,'1985-07-27',18,81,0),
(1103,'THEFT OF IDENTITY',263,'1978-04-06',39,610,0),
(1104,'BUNCO, GRAND THEFT',844,'2008-11-07',17,1369,0),
(1105,'THEFT OF IDENTITY',255,'2004-12-15',38,1040,0),
(1106,'VEHICLE - STOLEN',128,'2009-08-28',13,834,0),
(1107,'THEFT OF IDENTITY',548,'1991-06-11',40,1053,0),
(1108,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',162,'1980-06-25',29,223,0),
(1109,'THEFT OF IDENTITY',47,'1978-02-02',0,314,0),
(1110,'THEFT OF IDENTITY',291,'2003-10-23',2,1246,0),
(1111,'THEFT OF IDENTITY',364,'2016-05-08',14,764,0),
(1112,'THEFT OF IDENTITY',718,'1978-04-07',54,883,0),
(1113,'THEFT OF IDENTITY',347,'1952-01-03',15,535,0),
(1114,'BUNCO, GRAND THEFT',183,'2002-12-26',27,514,0),
(1115,'INTIMATE PARTNER - AGGRAVATED ASSAULT',208,'1966-02-10',58,731,0),
(1116,'ORAL COPULATION',620,'1970-03-10',65,1358,0),
(1117,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',175,'1993-07-29',51,815,0),
(1118,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',75,'2007-09-19',3,1012,0),
(1119,'UNAUTHORIZED COMPUTER ACCESS',54,'1992-01-09',35,491,0),
(1120,'THEFT OF IDENTITY',391,'1951-09-17',63,474,0),
(1121,'SEX,UNLAWFUL(INC MUTUAL CONSENT, PENETRATION W/ FRGN OBJ',416,'1989-12-09',1,849,0),
(1122,'BURGLARY FROM VEHICLE',773,'2007-02-01',10,1249,0),
(1123,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',420,'2009-01-17',30,180,0),
(1124,'THEFT OF IDENTITY',332,'2007-05-22',1,722,0),
(1125,'BURGLARY FROM VEHICLE',230,'1981-11-12',40,402,0),
(1126,'BURGLARY FROM VEHICLE',309,'2000-07-15',18,1500,0),
(1127,'THEFT OF IDENTITY',717,'1978-07-02',15,431,0),
(1128,'THEFT FROM MOTOR VEHICLE - GRAND ($950.01 AND OVER)',636,'1989-06-01',47,850,0),
(1129,'THEFT OF IDENTITY',284,'1998-01-23',9,1181,0),
(1130,'SEX,UNLAWFUL(INC MUTUAL CONSENT, PENETRATION W/ FRGN OBJ',682,'1980-04-14',14,513,0),
(1131,'SEX,UNLAWFUL(INC MUTUAL CONSENT, PENETRATION W/ FRGN OBJ',567,'2000-04-07',3,431,0),
(1132,'BURGLARY',737,'2021-01-09',35,218,0),
(1133,'BURGLARY FROM VEHICLE',99,'1996-07-03',31,298,0),
(1134,'THEFT OF IDENTITY',411,'2018-11-01',39,767,0),
(1135,'VEHICLE - STOLEN',276,'1970-09-13',36,1051,0),
(1136,'THEFT OF IDENTITY',245,'2024-07-18',50,849,0),
(1137,'THEFT OF IDENTITY',318,'1970-10-25',40,235,0),
(1138,'THEFT OF IDENTITY',179,'1975-01-19',35,576,0),
(1139,'BURGLARY FROM VEHICLE',359,'2013-11-01',29,204,0),
(1140,'BURGLARY FROM VEHICLE',732,'2009-04-02',42,417,0),
(1141,'THEFT OF IDENTITY',99,'1991-02-28',8,211,0),
(1142,'BURGLARY',225,'2018-12-21',16,399,0),
(1143,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',275,'2002-02-13',35,659,0),
(1144,'BURGLARY',157,'2006-04-07',30,778,0),
(1145,'VEHICLE - STOLEN',379,'1992-11-25',3,617,0),
(1146,'THEFT FROM MOTOR VEHICLE - GRAND ($950.01 AND OVER)',324,'2020-03-25',7,538,0),
(1147,'THEFT OF IDENTITY',226,'1999-04-01',5,893,0),
(1148,'THEFT FROM MOTOR VEHICLE - GRAND ($950.01 AND OVER)',87,'1999-07-11',21,998,0),
(1149,'BURGLARY FROM VEHICLE',704,'2008-02-05',19,1334,0),
(1150,'VEHICLE - STOLEN',519,'1981-09-21',30,431,0),
(1151, 'THEFT OF IDENTITY', 240, '1958-01-19', 60, 1178, 0),
(1152, 'DOCUMENT FORGERY / STOLEN FELONY', 253, '1996-11-12', 46, 836, 0),
(1153, 'THEFT OF IDENTITY', 13, '1958-07-23', 40, 662, 0),
(1154, 'THEFT OF IDENTITY', 659, '1991-11-27', 7, 304, 0),
(1155, 'THEFT FROM MOTOR VEHICLE - GRAND ($950.01 AND OVER)', 531, '1995-10-04', 55, 105, 0),
(1156, 'THEFT OF IDENTITY', 801, '1988-01-13', 39, 448, 0),
(1157, 'INTIMATE PARTNER - SIMPLE ASSAULT', 161, '1968-04-17', 48, 1013, 0),
(1158, 'THEFT OF IDENTITY', 230, '2002-05-25', 28, 1244, 0),
(1159, 'THEFT PLAIN - PETTY ($950 & UNDER)', 261, '1996-02-03', 64, 1285, 0),
(1160, 'BURGLARY', 388, '1972-12-04', 5, 3, 0),
(1161, 'THEFT OF IDENTITY', 488, '1959-01-08', 68, 1079, 0),
(1162, 'THEFT OF IDENTITY', 779, '1975-02-22', 34, 1422, 0),
(1163, 'THEFT OF IDENTITY', 165, '1977-07-31', 25, 238, 0),
(1164, 'THEFT OF IDENTITY', 371, '2022-03-10', 19, 544, 0),
(1165, 'THEFT OF IDENTITY', 559, '1996-03-04', 10, 714, 0),
(1166, 'VEHICLE - STOLEN', 624, '2015-11-21', 12, 1125, 0),
(1167, 'THEFT OF IDENTITY', 328, '1992-11-01', 68, 1239, 0),
(1168, 'THEFT OF IDENTITY', 559, '2012-01-12', 23, 1086, 0),
(1169, 'VEHICLE - STOLEN', 244, '2001-09-01', 59, 1282, 0),
(1170, 'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE', 556, '1951-04-29', 53, 1451, 0),
(1171, 'THEFT OF IDENTITY', 231, '2014-01-16', 41, 1475, 0),
(1172, 'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)', 103, '1963-05-22', 33, 239, 0),
(1173, 'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD', 453, '1963-01-30', 65, 768, 0),
(1174, 'THEFT OF IDENTITY', 762, '2013-04-14', 69, 1210, 0),
(1175, 'THEFT OF IDENTITY', 653, '1972-03-14', 27, 356, 0),
(1176, 'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD', 130, '1950-07-08', 26, 994, 0),
(1177, 'EMBEZZLEMENT, GRAND THEFT ($950.01 & OVER)', 243, '2001-11-08', 34, 1379, 0),
(1178, 'THEFT PLAIN - PETTY ($950 & UNDER)', 799, '2018-02-28', 23, 876, 0),
(1179, 'BUNCO, GRAND THEFT', 45, '2023-12-02', 30, 1250, 0),
(1180, 'THEFT OF IDENTITY', 728, '1970-05-12', 9, 855, 0),
(1181, 'BURGLARY', 172, '2015-11-24', 54, 337, 0),
(1182, 'BURGLARY FROM VEHICLE', 400, '1972-10-04', 69, 1249, 0),
(1183, 'THEFT OF IDENTITY', 631, '1956-09-27', 22, 89, 0),
(1184, 'THEFT OF IDENTITY', 502, '1966-12-01', 29, 737, 0),
(1185, 'RAPE, FORCIBLE', 397, '1983-01-20', 15, 289, 0),
(1186, 'THEFT OF IDENTITY', 895, '2006-10-31', 11, 1410, 0),
(1187, 'INTIMATE PARTNER - SIMPLE ASSAULT', 667, '1964-09-24', 66, 826, 0),
(1188, 'VANDALISM - MISDEAMEANOR ($399 OR UNDER)', 624, '1960-05-08', 62, 312, 0),
(1189, 'THEFT OF IDENTITY', 166, '2014-02-13', 51, 285, 0),
(1190, 'THEFT OF IDENTITY', 183, '1964-08-02', 22, 266, 0),
(1191, 'THEFT OF IDENTITY', 564, '2013-09-26', 4, 39, 0),
(1192, 'INTIMATE PARTNER - SIMPLE ASSAULT', 229, '1957-09-11', 67, 539, 0),
(1193, 'THEFT OF IDENTITY', 325, '2003-08-09', 36, 622, 0),
(1194, 'BATTERY - SIMPLE ASSAULT', 414, '1986-08-21', 1, 928, 0),
(1195, 'THEFT OF IDENTITY', 309, '2013-04-15', 56, 805, 0),
(1196, 'THEFT OF IDENTITY', 448, '1956-02-11', 45, 1192, 0),
(1197, 'THEFT OF IDENTITY', 444, '2019-07-18', 34, 1488, 0),
(1198, 'VEHICLE - STOLEN', 430, '1984-06-25', 58, 1318, 0),
(1199, 'OTHER MISCELLANEOUS CRIME', 176, '2004-09-14', 63, 1438, 0),
(1200, 'CHILD ANNOYING (17YRS & UNDER)', 741, '1959-06-21', 10, 133, 0),
(1201, 'ORAL COPULATION', 809, '1966-05-10', 60, 390, 0),
(1202, 'DOCUMENT FORGERY / STOLEN FELONY', 185, '1951-08-24', 49, 1207, 0),
(1203, 'BATTERY - SIMPLE ASSAULT', 554, '1995-02-13', 26, 893, 0),
(1204, 'THEFT OF IDENTITY', 138, '1975-11-21', 9, 550, 0),
(1205, 'THEFT OF IDENTITY', 345, '2005-12-11', 15, 1373, 0),
(1206, 'CHILD ABUSE (PHYSICAL) - SIMPLE ASSAULT', 834, '2021-07-01', 26, 1461, 0),
(1207, 'ROBBERY', 231, '2004-05-08', 22, 513, 0),
(1208, 'THEFT OF IDENTITY', 332, '1986-06-25', 1, 487, 0),
(1209, 'THEFT OF IDENTITY', 550, '1954-07-22', 36, 640, 0),
(1210, 'BATTERY WITH SEXUAL CONTACT', 424, '1973-08-21', 42, 1174, 0),
(1211, 'CREDIT CARDS, FRAUD USE ($950.01 & OVER)', 579, '1975-03-25', 0, 1176, 0),
(1212, 'THEFT OF IDENTITY', 433, '2024-08-17', 39, 1358, 0),
(1213, 'OTHER MISCELLANEOUS CRIME', 453, '1959-11-22', 0, 1392, 0),
(1214, 'SODOMY/SEXUAL CONTACT B/W PENIS OF ONE PERS TO ANUS OTH', 756, '2004-12-15', 1, 698, 0),
(1215, 'THEFT OF IDENTITY', 140, '1969-08-28', 47, 871, 0),
(1216, 'ASSAULT WITH DEADLY WEAPON, AGGRAVATED ASSAULT', 160, '1985-08-23', 47, 1393, 0),
(1217, 'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)', 693, '1964-06-06', 16, 476, 0),
(1218, 'THEFT OF IDENTITY', 257, '2009-04-24', 28, 1136, 0),
(1219, 'THEFT OF IDENTITY', 875, '1962-12-27', 47, 1498, 0),
(1220, 'THEFT OF IDENTITY', 106, '2013-04-27', 47, 1289, 0),
(1221, 'INTIMATE PARTNER - SIMPLE ASSAULT', 330, '2016-04-23', 43, 13, 0),
(1222, 'THEFT OF IDENTITY', 884, '1987-05-22', 3, 528, 0),
(1223, 'THEFT PLAIN - PETTY ($950 & UNDER)', 366, '1994-06-16', 19, 237, 0),
(1224, 'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE', 453, '1989-04-01', 54, 770, 0),
(1225, 'THEFT OF IDENTITY', 618, '1997-08-02', 39, 582, 0),
(1226, 'BURGLARY', 622, '1956-09-22', 39, 1265, 0),
(1227, 'THEFT OF IDENTITY', 47, '1985-03-20', 46, 99, 0),
(1228, 'ASSAULT WITH DEADLY WEAPON, AGGRAVATED ASSAULT', 546, '2014-11-23', 8, 504, 0),
(1229, 'THEFT OF IDENTITY', 118, '1975-08-12', 16, 1135, 0),
(1230, 'BURGLARY', 873, '1984-03-16', 5, 1248, 0),
(1231, 'THEFT OF IDENTITY', 68, '2001-07-22', 40, 904, 0),
(1232, 'THEFT OF IDENTITY', 712, '2002-11-14', 56, 680, 0),
(1233, 'BUNCO, GRAND THEFT', 427, '1991-09-28', 28, 821, 0),
(1234, 'THEFT OF IDENTITY', 235, '2006-08-12', 65, 913, 0),
(1235, 'THEFT OF IDENTITY', 393, '1971-04-03', 18, 1041, 0),
(1236, 'DOCUMENT FORGERY / STOLEN FELONY', 690, '1952-11-05', 22, 1212, 0),
(1237, 'THEFT OF IDENTITY', 183, '1955-04-22', 1, 1203, 0),
(1238, 'THEFT OF IDENTITY', 425, '2018-07-19', 69, 1379, 0),
(1239, 'THEFT OF IDENTITY', 826, '2019-05-23', 70, 735, 0),
(1240, 'THREATENING PHONE CALLS/LETTERS', 733, '1998-04-29', 47, 1426, 0),
(1241, 'VEHICLE - STOLEN', 456, '2016-11-28', 21, 543, 0),
(1242, 'THEFT OF IDENTITY', 173, '1967-05-20', 67, 897, 0),
(1243, 'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD', 316, '1984-02-20', 21, 146, 0),
(1244, 'THEFT OF IDENTITY', 751, '1961-02-17', 28, 152, 0),
(1245, 'THEFT OF IDENTITY', 653, '1963-10-19', 58, 1200, 0),
(1246, 'CHILD ABUSE (PHYSICAL) - SIMPLE ASSAULT', 213, '1960-04-27', 40, 1262, 0),
(1247, 'BATTERY - SIMPLE ASSAULT', 612, '2022-02-02', 2, 855, 0),
(1248, 'THEFT OF IDENTITY', 102, '1978-11-05', 48, 1224, 0),
(1249, 'VEHICLE - STOLEN', 810, '1960-06-26', 11, 1188, 0),
(1250, 'THEFT OF IDENTITY', 286, '1968-06-17', 13, 804, 0),
(1251, 'BURGLARY', 790, '2010-07-08', 66, 248, 0),
(1252, 'RAPE, FORCIBLE', 108, '1957-05-09', 12, 490, 0),
(1253, 'ASSAULT WITH DEADLY WEAPON, AGGRAVATED ASSAULT', 188, '1982-03-21', 10, 142, 0),
(1254, 'THEFT OF IDENTITY', 691, '2002-02-18', 35, 467, 0),
(1255, 'BATTERY - SIMPLE ASSAULT', 58, '1997-09-26', 18, 807, 0),
(1256, 'THEFT OF IDENTITY', 680, '1957-01-17', 19, 635, 0),
(1257, 'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)', 686, '2014-10-10', 28, 1084, 0),
(1258, 'ROBBERY', 861, '1976-08-21', 55, 1256, 0),
(1259, 'THEFT OF IDENTITY', 474, '1954-06-01', 22, 1128, 0),
(1260, 'BIKE - STOLEN', 72, '1972-11-16', 58, 804, 0),
(1261, 'ROBBERY', 339, '1984-05-19', 58, 1228, 0),
(1262, 'BATTERY WITH SEXUAL CONTACT', 155, '2003-11-18', 39, 215, 0),
(1263, 'ASSAULT WITH DEADLY WEAPON, AGGRAVATED ASSAULT', 669, '1977-01-09', 49, 1500, 0),
(1264, 'THEFT OF IDENTITY', 342, '1993-08-11', 17, 835, 0),
(1265, 'CHILD ABUSE (PHYSICAL) - SIMPLE ASSAULT', 226, '1991-07-14', 43, 811, 0),
(1266, 'THEFT OF IDENTITY', 706, '1990-12-05', 38, 1246, 0),
(1267, 'BURGLARY', 349, '1975-09-09', 50, 739, 0),
(1268, 'THEFT OF IDENTITY', 676, '1974-07-01', 21, 352, 0),
(1269, 'THEFT OF IDENTITY', 399, '2004-06-10', 45, 972, 0),
(1270, 'ROBBERY', 785, '1979-11-14', 57, 968, 0),
(1271, 'BURGLARY', 128, '1986-03-21', 26, 1272, 0),
(1272, 'DOCUMENT FORGERY / STOLEN FELONY', 545, '2008-05-09', 39, 365, 0),
(1273, 'THEFT OF IDENTITY', 55, '1998-06-07', 13, 916, 0),
(1274, 'DOCUMENT FORGERY / STOLEN FELONY', 868, '2016-04-11', 14, 1297, 0),
(1275, 'BURGLARY', 859, '1979-04-25', 48, 328, 0),
(1276, 'THEFT OF IDENTITY', 462, '2009-09-12', 29, 573, 0),
(1277, 'THEFT OF IDENTITY', 763, '2012-11-14', 31, 408, 0),
(1278, 'THEFT OF IDENTITY', 532, '2000-05-16', 33, 1349, 0),
(1279, 'THEFT OF IDENTITY', 823, '2006-01-20', 32, 1080, 0),
(1280, 'THEFT OF IDENTITY', 719, '2021-04-14', 56, 1400, 0),
(1281, 'BURGLARY', 802, '1994-11-02', 47, 889, 0),
(1282, 'THEFT OF IDENTITY', 665, '2017-10-13', 15, 1183, 0),
(1283, 'BURGLARY', 97, '1985-06-09', 33, 1426, 0),
(1284, 'ROBBERY', 100, '2015-11-01', 12, 337, 0),
(1285, 'THEFT OF IDENTITY', 102, '1982-12-02', 57, 396, 0),
(1286, 'BURGLARY', 13, '1991-01-01', 48, 393, 0),
(1287, 'BURGLARY', 52, '1998-12-05', 41, 118, 0),
(1288, 'ROBBERY', 795, '2005-03-11', 13, 983, 0),
(1289, 'THEFT OF IDENTITY', 182, '2004-10-25', 54, 343, 0),
(1290, 'THEFT OF IDENTITY', 744, '2012-07-20', 26, 93, 0),
(1291,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',838,'2009-12-26',55,548,0),
(1292,'VANDALISM - FELONY ($400 & OVER, ALL CHURCH VANDALISMS)',143,'1988-03-03',22,202,0),
(1293,'THEFT OF IDENTITY',28,'1991-11-23',18,1297,0),
(1294,'THEFT OF IDENTITY',703,'1968-12-07',24,822,0),
(1295,'SEXUAL PENETRATION W/FOREIGN OBJECT',375,'2023-04-15',50,1172,0),
(1296,'THEFT OF IDENTITY',89,'1981-07-13',62,712,0),
(1297,'EXTORTION',748,'2010-02-18',44,512,0),
(1298,'OTHER MISCELLANEOUS CRIME',143,'2015-12-31',58,1116,0),
(1299,'OTHER MISCELLANEOUS CRIME',224,'2021-03-23',16,1486,0),
(1300,'OTHER ASSAULT',627,'1951-04-30',32,785,0),
(1301,'THEFT OF IDENTITY',26,'1978-05-16',32,1149,0),
(1302,'BURGLARY',684,'1990-05-28',14,89,0),
(1303,'BURGLARY',411,'1999-01-01',34,129,0),
(1304,'THEFT OF IDENTITY',495,'1987-10-03',19,235,0),
(1305,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',641,'1983-10-11',52,1058,0),
(1306,'THEFT OF IDENTITY',390,'2013-10-26',62,1157,0),
(1307,'THEFT FROM MOTOR VEHICLE - GRAND ($950.01 AND OVER)',123,'2006-09-27',62,926,0),
(1308,'THEFT OF IDENTITY',505,'2010-11-12',42,1068,0),
(1309,'EXTORTION',7,'1996-04-19',45,435,0),
(1310,'BATTERY - SIMPLE ASSAULT',169,'1960-04-07',30,1418,0),
(1311,'THEFT OF IDENTITY',796,'1952-10-18',61,978,0),
(1312,'THEFT OF IDENTITY',742,'2012-11-03',38,364,0),
(1313,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',96,'1982-05-10',9,735,0),
(1314,'SEXUAL PENETRATION W/FOREIGN OBJECT',623,'2024-01-11',11,33,0),
(1315,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',68,'1969-11-18',25,825,0),
(1316,'ORAL COPULATION',31,'2005-06-16',54,1227,0),
(1317,'BUNCO, GRAND THEFT',399,'2009-05-24',48,1014,0),
(1318,'EMBEZZLEMENT, GRAND THEFT ($950.01 & OVER)',501,'1986-01-29',54,361,0),
(1319,'BURGLARY FROM VEHICLE',499,'1994-07-30',7,1212,0),
(1320,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',130,'2011-03-14',23,184,0),
(1321,'INTIMATE PARTNER - AGGRAVATED ASSAULT',490,'1998-06-07',25,1097,0),
(1322,'THEFT OF IDENTITY',279,'1988-12-30',60,88,0),
(1323,'THEFT OF IDENTITY',628,'1983-08-13',14,511,0),
(1324,'THEFT OF IDENTITY',195,'1987-05-03',33,867,0),
(1325,'THEFT OF IDENTITY',373,'1951-05-28',70,141,0),
(1326,'THEFT OF IDENTITY',852,'2021-07-24',26,928,0),
(1327,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',224,'2014-08-20',15,970,0),
(1328,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',131,'1996-01-10',57,96,0),
(1329,'INTIMATE PARTNER - SIMPLE ASSAULT',530,'2010-07-05',2,709,0),
(1330,'THEFT FROM MOTOR VEHICLE - GRAND ($950.01 AND OVER)',672,'1988-01-30',20,1245,0),
(1331,'THEFT OF IDENTITY',814,'1964-07-08',31,687,0),
(1332,'THEFT OF IDENTITY',549,'1959-08-01',18,365,0),
(1333,'THEFT OF IDENTITY',5,'1999-09-03',24,727,0),
(1334,'THEFT OF IDENTITY',353,'2003-10-07',41,1324,0),
(1335,'THEFT OF IDENTITY',89,'1968-07-20',50,863,0),
(1336,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',754,'1963-02-16',48,1456,0),
(1337,'VEHICLE - STOLEN',201,'2010-08-17',9,613,0),
(1338,'THEFT OF IDENTITY',625,'1951-03-21',0,917,0),
(1339,'RAPE, FORCIBLE',332,'1993-10-14',67,197,0),
(1340,'THEFT OF IDENTITY',129,'1978-03-25',50,1391,0),
(1341,'VANDALISM - MISDEAMEANOR ($399 OR UNDER)',577,'1952-10-31',11,1325,0),
(1342,'CHILD ANNOYING (17YRS & UNDER)',831,'2003-07-19',25,834,0),
(1343,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',537,'1974-11-24',60,327,0),
(1344,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',893,'1953-05-22',9,633,0),
(1345,'THEFT OF IDENTITY',29,'2018-08-20',54,565,0),
(1346,'BURGLARY FROM VEHICLE',394,'2007-01-25',21,290,0),
(1347,'INTIMATE PARTNER - SIMPLE ASSAULT',781,'1973-01-23',51,138,0),
(1348,'THEFT OF IDENTITY',345,'1955-09-28',39,51,0),
(1349,'THEFT OF IDENTITY',345,'1994-01-31',60,1216,0),
(1350,'PICKPOCKET',239,'1952-06-29',61,543,0),
(1351,'SEXUAL PENETRATION W/FOREIGN OBJECT',873,'1978-01-04',35,1323,0),
(1352,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',775,'1979-12-04',39,1168,0),
(1353,'BURGLARY FROM VEHICLE',83,'2004-11-27',19,910,0),
(1354,'THEFT OF IDENTITY',678,'1974-09-13',33,1417,0),
(1355,'THEFT OF IDENTITY',605,'1959-01-24',32,201,0),
(1356,'THEFT OF IDENTITY',726,'1974-12-31',6,1367,0),
(1357,'THEFT OF IDENTITY',514,'2015-03-11',52,99,0),
(1358,'THEFT OF IDENTITY',257,'1977-09-17',66,566,0),
(1359,'ARSON',467,'1984-04-16',35,814,0),
(1360,'THEFT OF IDENTITY',783,'1995-08-15',3,1451,0),
(1361,'THEFT OF IDENTITY',234,'2016-02-15',26,240,0),
(1362,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',592,'1972-04-19',55,1017,0),
(1363,'THEFT OF IDENTITY',262,'2022-02-13',20,774,0),
(1364,'THEFT OF IDENTITY',152,'1961-02-09',24,547,0),
(1365,'INTIMATE PARTNER - SIMPLE ASSAULT',267,'1979-10-17',7,1449,0),
(1366,'VEHICLE - STOLEN',845,'2017-05-25',9,841,0),
(1367,'BATTERY WITH SEXUAL CONTACT',559,'2000-10-30',15,451,0),
(1368,'THEFT OF IDENTITY',682,'1964-08-26',24,420,0),
(1369,'DISTURBING THE PEACE',182,'1954-08-17',64,1434,0),
(1370,'RAPE, FORCIBLE',589,'1963-03-04',17,228,0),
(1371,'ORAL COPULATION',578,'2011-04-08',50,923,0),
(1372,'THEFT OF IDENTITY',558,'2000-04-08',47,1295,0),
(1373,'VEHICLE - STOLEN',427,'1959-07-24',53,175,0),
(1374,'CRIMINAL THREATS - NO WEAPON DISPLAYED',585,'2018-06-16',56,57,0),
(1375,'BURGLARY FROM VEHICLE',95,'1987-12-28',31,718,0),
(1376,'THEFT OF IDENTITY',482,'1955-11-19',51,696,0),
(1377,'THEFT OF IDENTITY',527,'1973-02-19',4,671,0),
(1378,'THEFT OF IDENTITY',309,'2001-09-21',58,263,0),
(1379,'THEFT OF IDENTITY',896,'1987-07-15',2,68,0),
(1380,'BURGLARY',407,'2011-12-04',18,463,0),
(1381,'BUNCO, ATTEMPT',611,'1975-11-06',46,936,0),
(1382,'LETTERS, LEWD - TELEPHONE CALLS, LEWD',413,'1994-02-14',35,1280,0),
(1383,'BUNCO, GRAND THEFT',609,'1968-07-14',43,1096,0),
(1384,'THEFT OF IDENTITY',229,'1980-08-17',5,1095,0),
(1385,'HUMAN TRAFFICKING - INVOLUNTARY SERVITUDE',224,'2002-01-07',68,660,0),
(1386,'THEFT OF IDENTITY',330,'1973-10-22',55,811,0),
(1387,'CRIMINAL THREATS - NO WEAPON DISPLAYED',230,'2011-01-13',8,1292,0),
(1388,'VEHICLE - STOLEN',539,'2004-10-26',51,1143,0),
(1389,'LETTERS, LEWD - TELEPHONE CALLS, LEWD',392,'2001-09-12',51,1267,0),
(1390,'RAPE, FORCIBLE',474,'1988-08-20',29,385,0),
(1391,'BURGLARY',123,'2018-06-10',0,1422,0),
(1392,'THEFT OF IDENTITY',546,'1990-07-21',16,979,0),
(1393,'PIMPING',810,'2003-03-16',65,281,0),
(1394,'SHOPLIFTING - PETTY THEFT ($950 & UNDER)',560,'2012-08-16',16,692,0),
(1395,'OTHER MISCELLANEOUS CRIME',789,'1959-07-03',37,824,0),
(1396,'INTIMATE PARTNER - SIMPLE ASSAULT',707,'2008-02-15',29,324,0),
(1397,'CRIMINAL THREATS - NO WEAPON DISPLAYED',870,'2015-04-22',36,300,0),
(1398,'THEFT OF IDENTITY',245,'1972-01-24',17,1435,0),
(1399,'THEFT OF IDENTITY',324,'1980-07-25',8,715,0),
(1400,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',561,'1998-01-19',63,609,0),
(1401,'ORAL COPULATION',513,'2013-09-21',58,1448,0),
(1402,'THEFT OF IDENTITY',511,'2003-02-17',3,1215,0),
(1403,'THEFT PLAIN - PETTY ($950 & UNDER)',772,'2014-12-21',67,564,0),
(1404,'BURGLARY FROM VEHICLE',422,'2021-06-25',60,1201,0),
(1405,'THEFT OF IDENTITY',179,'2004-06-15',31,522,0),
(1406,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',744,'1985-04-09',9,578,0),
(1407,'THEFT OF IDENTITY',191,'1973-06-25',2,780,0),
(1408,'THEFT OF IDENTITY',876,'1961-02-26',30,1427,0),
(1409,'THEFT OF IDENTITY',228,'1996-12-23',62,673,0),
(1410,'THEFT OF IDENTITY',788,'1983-04-30',8,403,0),
(1411,'INTIMATE PARTNER - AGGRAVATED ASSAULT',128,'2015-07-10',27,809,0),
(1412,'VEHICLE - STOLEN',350,'1978-08-05',55,1431,0),
(1413,'THEFT OF IDENTITY',432,'1976-10-19',47,1470,0),
(1414,'THEFT OF IDENTITY',253,'1998-04-14',65,1041,0),
(1415,'VEHICLE - STOLEN',330,'1958-08-27',30,836,0),
(1416,'THEFT FROM MOTOR VEHICLE - GRAND ($950.01 AND OVER)',455,'1997-03-10',58,627,0),
(1417,'THEFT OF IDENTITY',701,'1972-02-11',13,808,0),
(1418,'THEFT OF IDENTITY',587,'1974-01-17',17,983,0),
(1419,'THEFT OF IDENTITY',589,'1979-05-26',49,208,0),
(1420,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',131,'2019-10-07',38,907,0),
(1421,'CHILD ANNOYING (17YRS & UNDER)',374,'2001-02-11',58,581,0),
(1422,'THEFT OF IDENTITY',495,'1952-06-22',70,167,0),
(1423,'THEFT OF IDENTITY',171,'1995-07-20',69,675,0),
(1424,'VANDALISM - FELONY ($400 & OVER, ALL CHURCH VANDALISMS)',218,'1999-08-15',44,1457,0),
(1425,'THEFT OF IDENTITY',388,'1979-10-06',15,1330,0),
(1426,'BURGLARY',484,'2020-05-31',11,1390,0),
(1427,'RAPE, FORCIBLE',736,'1957-08-27',18,961,0),
(1428,'PEEPING TOM',103,'1993-03-09',20,1399,0),
(1429,'PICKPOCKET',731,'1962-09-05',9,1465,0),
(1430,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',265,'1994-07-13',43,1473,0),
(1431,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',494,'2003-03-17',40,1376,0),
(1432,'BATTERY - SIMPLE ASSAULT',736,'2007-05-28',18,1133,0),
(1433,'THEFT OF IDENTITY',132,'2016-05-25',10,96,0),
(1434,'SEX,UNLAWFUL(INC MUTUAL CONSENT, PENETRATION W/ FRGN OBJ',344,'1969-12-29',56,689,0),
(1435,'THEFT OF IDENTITY',864,'2021-05-25',62,735,0),
(1436,'BATTERY - SIMPLE ASSAULT',757,'1976-03-24',45,776,0),
(1437,'THEFT OF IDENTITY',874,'1954-11-01',14,421,0),
(1438,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',853,'1958-09-02',21,932,0),
(1439,'THEFT OF IDENTITY',185,'1953-06-28',23,261,0),
(1440,'THEFT OF IDENTITY',463,'1962-07-18',51,156,0),
(1441,'THEFT OF IDENTITY',97,'1972-12-17',56,309,0),
(1442,'THEFT OF IDENTITY',162,'2006-02-20',26,462,0),
(1443,'THEFT OF IDENTITY',511,'2022-07-03',23,905,0),
(1444,'THEFT PLAIN - PETTY ($950 & UNDER)',514,'1996-09-22',21,732,0),
(1445,'THEFT OF IDENTITY',787,'1965-09-17',26,818,0),
(1446,'BIKE - STOLEN',648,'1956-08-01',35,1324,0),
(1447,'THEFT OF IDENTITY',624,'1960-04-25',26,1212,0),
(1448,'THEFT OF IDENTITY',592,'1961-01-31',14,62,0),
(1449,'VEHICLE - STOLEN',25,'2019-08-18',25,111,0),
(1450,'THEFT OF IDENTITY',838,'1953-10-16',66,125,0),
(1451,'LETTERS, LEWD - TELEPHONE CALLS, LEWD',200,'1959-06-07',46,671,0),
(1452,'DOCUMENT FORGERY / STOLEN FELONY',738,'1998-10-29',56,224,0),
(1453,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',384,'1987-09-10',6,1127,0),
(1454,'THEFT OF IDENTITY',698,'1961-01-22',58,502,0),
(1455,'THEFT OF IDENTITY',511,'1983-09-19',14,369,0),
(1456,'THEFT OF IDENTITY',126,'2012-11-19',1,1203,0),
(1457,'THEFT OF IDENTITY',439,'2004-10-04',57,527,0),
(1458,'VIOLATION OF COURT ORDER',423,'1965-06-01',59,1418,0),
(1459,'DOCUMENT FORGERY / STOLEN FELONY',838,'1960-05-01',24,229,0),
(1460,'THEFT FROM MOTOR VEHICLE - GRAND ($950.01 AND OVER)',639,'1982-12-11',51,1214,0),
(1461,'THEFT OF IDENTITY',412,'2002-08-06',44,362,0),
(1462,'THEFT PLAIN - PETTY ($950 & UNDER)',129,'2003-03-18',27,1410,0),
(1463,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',274,'1982-07-07',28,1475,0),
(1464,'THEFT OF IDENTITY',707,'1957-11-17',59,769,0),
(1465,'THEFT OF IDENTITY',592,'2007-03-01',62,85,0),
(1466,'THEFT OF IDENTITY',339,'1958-12-04',34,827,0),
(1467,'THEFT OF IDENTITY',855,'2011-04-08',70,536,0),
(1468,'CRIMINAL THREATS - NO WEAPON DISPLAYED',796,'2004-09-22',42,416,0),
(1469,'EMBEZZLEMENT, GRAND THEFT ($950.01 & OVER)',61,'2023-08-31',14,20,0),
(1470,'LETTERS, LEWD - TELEPHONE CALLS, LEWD',705,'2002-12-16',65,1310,0),
(1471,'ORAL COPULATION',306,'2019-11-30',55,283,0),
(1472,'EMBEZZLEMENT, GRAND THEFT ($950.01 & OVER)',355,'2016-01-04',13,998,0),
(1473,'THEFT OF IDENTITY',508,'2017-04-29',40,1425,0),
(1474,'THEFT OF IDENTITY',185,'2008-07-01',29,449,0),
(1475,'RAPE, FORCIBLE',163,'1973-12-28',66,1263,0),
(1476,'THEFT OF IDENTITY',151,'1957-08-07',14,1318,0),
(1477,'THEFT OF IDENTITY',573,'1971-07-13',26,1141,0),
(1478,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',335,'2022-01-12',11,950,0),
(1479,'THEFT OF IDENTITY',588,'1973-05-02',11,1205,0),
(1480,'OTHER MISCELLANEOUS CRIME',13,'2021-05-07',49,29,0),
(1481,'PICKPOCKET',674,'2015-03-30',5,1264,0),
(1482,'LETTERS, LEWD - TELEPHONE CALLS, LEWD',733,'2002-11-25',46,1042,0),
(1483,'BUNCO, GRAND THEFT',79,'1964-08-05',30,499,0),
(1484,'SEXUAL PENETRATION W/FOREIGN OBJECT',476,'1984-08-19',38,789,0),
(1485,'THEFT OF IDENTITY',697,'2014-08-05',38,1294,0),
(1486,'THEFT OF IDENTITY',104,'1958-02-01',29,938,0),
(1487,'THEFT PLAIN - PETTY ($950 & UNDER)',225,'1978-01-31',15,554,0),
(1488,'VANDALISM - MISDEAMEANOR ($399 OR UNDER)',27,'1962-08-23',25,908,0),
(1489,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',835,'2017-11-12',44,183,0),
(1490,'VEHICLE - STOLEN',483,'1994-11-01',4,126,0),
(1491,'THEFT OF IDENTITY',224,'1964-10-03',63,851,0),
(1492,'THEFT OF IDENTITY',79,'2016-04-07',53,486,0),
(1493,'SEX,UNLAWFUL(INC MUTUAL CONSENT, PENETRATION W/ FRGN OBJ',517,'2019-10-14',10,1038,0),
(1494,'CHILD ABUSE (PHYSICAL) - SIMPLE ASSAULT',163,'1984-03-21',13,325,0),
(1495,'THEFT OF IDENTITY',93,'1958-04-07',39,411,0),
(1496,'THEFT OF IDENTITY',371,'2021-07-26',30,675,0),
(1497,'THEFT OF IDENTITY',460,'2019-07-19',67,166,0),
(1498,'VEHICLE - STOLEN',556,'1984-09-03',57,293,0),
(1499,'BURGLARY',32,'2013-05-29',54,816,0),
(1500,'BRANDISH WEAPON',113,'1959-06-08',70,1412,0),
(1501,'VANDALISM - MISDEAMEANOR ($399 OR UNDER)',326,'1958-04-21',1,809,0),
(1502,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',812,'1955-04-14',70,329,0),
(1503,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',386,'2007-09-28',6,957,0),
(1504,'THEFT OF IDENTITY',691,'1967-06-10',52,1213,0),
(1505,'THEFT OF IDENTITY',75,'1987-03-11',60,1400,0),
(1506,'RAPE, FORCIBLE',798,'2001-04-16',37,865,0),
(1507,'THEFT OF IDENTITY',460,'2016-09-19',48,243,0),
(1508,'THEFT OF IDENTITY',599,'1987-12-17',34,377,0),
(1509,'THEFT OF IDENTITY',66,'1968-11-03',31,672,0),
(1510,'EMBEZZLEMENT, GRAND THEFT ($950.01 & OVER)',184,'2014-11-10',20,321,0),
(1511,'THEFT OF IDENTITY',265,'1969-02-08',59,439,0),
(1512,'THEFT OF IDENTITY',113,'1952-04-18',29,938,0),
(1513,'VEHICLE - STOLEN',606,'1968-05-27',16,913,0),
(1514,'THEFT OF IDENTITY',496,'1995-12-28',4,985,0),
(1515,'THEFT OF IDENTITY',705,'2006-12-23',58,1397,0),
(1516,'LETTERS, LEWD - TELEPHONE CALLS, LEWD',249,'1973-07-15',49,1349,0),
(1517,'RAPE, FORCIBLE',426,'1952-10-10',40,971,0),
(1518,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',797,'1966-01-06',49,237,0),
(1519,'THEFT OF IDENTITY',412,'2016-05-03',65,1012,0),
(1520,'BUNCO, GRAND THEFT',397,'1956-12-28',45,184,0),
(1521,'THEFT FROM MOTOR VEHICLE - GRAND ($950.01 AND OVER)',539,'2009-09-08',15,1297,0),
(1522,'BURGLARY',243,'1985-03-28',50,1135,0),
(1523,'THEFT OF IDENTITY',707,'2023-02-03',13,675,0),
(1524,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',174,'2005-09-17',29,222,0),
(1525,'THEFT OF IDENTITY',576,'2010-02-02',26,337,0),
(1526,'THEFT OF IDENTITY',580,'2000-04-19',51,88,0),
(1527,'THEFT OF IDENTITY',512,'1982-07-11',63,1402,0),
(1528,'THEFT OF IDENTITY',700,'1985-10-02',18,91,0),
(1529,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',314,'1986-12-17',15,1149,0),
(1530,'BURGLARY',361,'2004-06-22',39,326,0),
(1531,'THEFT OF IDENTITY',612,'1997-06-17',56,1073,0),
(1532,'BURGLARY',734,'1985-09-19',40,383,0),
(1533,'SEXUAL PENETRATION W/FOREIGN OBJECT',545,'1987-06-08',43,971,0),
(1534,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',285,'1994-09-14',60,1278,0),
(1535,'BURGLARY',752,'2013-09-12',41,740,0),
(1536,'RAPE, FORCIBLE',682,'1998-07-05',31,710,0),
(1537,'CRIMINAL THREATS - NO WEAPON DISPLAYED',139,'2018-12-09',60,931,0),
(1538,'DOCUMENT FORGERY / STOLEN FELONY',514,'1974-05-20',64,248,0),
(1539,'RAPE, FORCIBLE',563,'2016-12-21',22,981,0),
(1540,'BURGLARY',567,'1995-11-03',54,370,0),
(1541,'THEFT OF IDENTITY',671,'2014-09-30',35,228,0),
(1542,'THEFT OF IDENTITY',151,'2023-06-09',6,752,0),
(1543,'BURGLARY',727,'2017-08-02',27,1120,0),
(1544,'BURGLARY',601,'2010-07-16',55,348,0),
(1545,'THEFT FROM MOTOR VEHICLE - GRAND ($950.01 AND OVER)',412,'2018-03-20',35,242,0),
(1546,'VEHICLE - STOLEN',651,'2004-07-21',30,122,0),
(1547,'THEFT OF IDENTITY',746,'2022-12-19',55,372,0),
(1548,'THEFT FROM MOTOR VEHICLE - GRAND ($950.01 AND OVER)',476,'2017-12-05',43,187,0),
(1549,'THEFT OF IDENTITY',170,'2020-06-22',41,108,0),
(1550,'THEFT OF IDENTITY',324,'1998-12-03',21,1362,0),
(1551,'BURGLARY FROM VEHICLE',96,'1963-04-23',34,1223,0),
(1552,'THEFT OF IDENTITY',855,'1951-12-21',29,1304,0),
(1553,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',16,'2001-08-07',36,359,0),
(1554,'EMBEZZLEMENT, GRAND THEFT ($950.01 & OVER)',180,'1963-06-15',29,1216,0),
(1555,'CHILD ABUSE (PHYSICAL) - SIMPLE ASSAULT',37,'1997-02-02',27,792,0),
(1556,'BATTERY - SIMPLE ASSAULT',124,'2011-04-15',64,1369,0),
(1557,'THEFT OF IDENTITY',75,'1995-06-29',6,790,0),
(1558,'THEFT OF IDENTITY',305,'2003-09-26',3,480,0),
(1559,'THEFT OF IDENTITY',601,'1991-07-25',63,1367,0),
(1560,'RAPE, FORCIBLE',248,'1958-09-12',56,754,0),
(1561,'THEFT OF IDENTITY',102,'1952-11-10',67,811,0),
(1562,'VEHICLE - STOLEN',229,'2004-12-29',4,254,0),
(1563,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',562,'2008-09-24',37,943,0),
(1564,'VEHICLE - STOLEN',78,'2021-10-06',42,922,0),
(1565,'THEFT OF IDENTITY',880,'1966-06-29',50,223,0),
(1566,'THEFT OF IDENTITY',316,'1960-11-21',40,1391,0),
(1567,'THEFT OF IDENTITY',659,'1998-07-28',21,253,0),
(1568,'THEFT OF IDENTITY',170,'2019-08-08',51,382,0),
(1569,'THEFT OF IDENTITY',743,'1979-08-01',55,1195,0),
(1570,'THEFT OF IDENTITY',774,'2010-01-03',39,472,0),
(1571,'THEFT OF IDENTITY',29,'2002-10-27',18,368,0),
(1572,'VIOLATION OF COURT ORDER',18,'1971-05-05',48,95,0),
(1573,'THEFT OF IDENTITY',637,'2001-06-03',45,1427,0),
(1574,'INTIMATE PARTNER - SIMPLE ASSAULT',391,'2012-12-10',48,360,0),
(1575,'DISTURBING THE PEACE',243,'2012-11-06',43,795,0),
(1576,'THEFT OF IDENTITY',277,'2016-01-20',16,206,0),
(1577,'CHILD ANNOYING (17YRS & UNDER)',733,'1968-08-15',68,741,0),
(1578,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',8,'2013-02-26',28,1446,0),
(1579,'THEFT OF IDENTITY',645,'2005-03-03',2,1425,0),
(1580,'THEFT OF IDENTITY',851,'1978-12-07',6,125,0),
(1581,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',370,'2011-01-14',0,1027,0),
(1582,'CRIMINAL THREATS - NO WEAPON DISPLAYED',46,'1961-06-20',3,734,0),
(1583,'THEFT OF IDENTITY',550,'1962-11-01',47,1143,0),
(1584,'THEFT OF IDENTITY',62,'1965-08-27',17,1114,0),
(1585,'THEFT OF IDENTITY',862,'1973-12-18',43,275,0),
(1586,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',537,'1954-06-06',33,1001,0),
(1587,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',152,'2015-10-02',41,1044,0),
(1588,'INTIMATE PARTNER - AGGRAVATED ASSAULT',492,'1970-12-18',37,496,0),
(1589,'THEFT OF IDENTITY',767,'1991-06-21',4,1271,0),
(1590,'SEXUAL PENETRATION W/FOREIGN OBJECT',457,'1991-05-07',11,512,0),
(1591,'THEFT OF IDENTITY',533,'1964-11-01',55,125,0),
(1592,'VEHICLE - STOLEN',626,'2022-03-17',53,181,0),
(1593,'BURGLARY',292,'1959-08-02',18,1227,0),
(1594,'INTIMATE PARTNER - SIMPLE ASSAULT',410,'1991-04-08',48,1127,0),
(1595,'THEFT OF IDENTITY',765,'1986-05-18',18,521,0),
(1596,'THEFT OF IDENTITY',115,'2008-04-07',59,668,0),
(1597,'RAPE, FORCIBLE',789,'1987-07-21',60,61,0),
(1598,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',348,'2013-10-04',59,578,0),
(1599,'INTIMATE PARTNER - SIMPLE ASSAULT',21,'2013-11-02',11,1236,0),
(1600,'THEFT PLAIN - PETTY ($950 & UNDER)',846,'1977-01-06',59,1170,0),
(1601,'VANDALISM - FELONY ($400 & OVER, ALL CHURCH VANDALISMS)',482,'1964-02-28',7,1476,0),
(1602,'BURGLARY',543,'1999-12-01',2,966,0),
(1603,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',744,'2004-10-18',70,770,0),
(1604,'THEFT OF IDENTITY',198,'1952-04-06',27,245,0),
(1605,'THEFT OF IDENTITY',165,'2012-05-09',21,262,0),
(1606,'THEFT OF IDENTITY',656,'1958-02-23',33,1242,0),
(1607,'THEFT OF IDENTITY',85,'2004-07-03',42,830,0),
(1608,'THEFT OF IDENTITY',762,'1997-08-25',35,1309,0),
(1609,'CHILD ANNOYING (17YRS & UNDER)',833,'2019-09-07',34,775,0),
(1610,'RAPE, FORCIBLE',398,'1994-06-30',27,1180,0),
(1611,'VEHICLE - STOLEN',205,'2021-03-20',45,1419,0),
(1612,'BURGLARY',718,'1959-03-17',45,1347,0),
(1613,'THEFT OF IDENTITY',351,'2020-03-26',64,1329,0),
(1614,'THEFT OF IDENTITY',88,'1982-06-11',69,303,0),
(1615,'BUNCO, GRAND THEFT',849,'1980-06-13',15,361,0),
(1616,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',494,'2009-06-23',21,584,0),
(1617,'THEFT OF IDENTITY',215,'2019-08-20',49,288,0),
(1618,'THEFT OF IDENTITY',189,'2012-05-28',59,480,0),
(1619,'VEHICLE - STOLEN',68,'2015-10-29',17,249,0),
(1620,'THEFT OF IDENTITY',900,'1968-01-11',31,1272,0),
(1621,'SEX,UNLAWFUL(INC MUTUAL CONSENT, PENETRATION W/ FRGN OBJ',477,'1956-12-08',37,1355,0),
(1622,'THEFT OF IDENTITY',688,'1980-12-13',58,716,0),
(1623,'BURGLARY',691,'2021-02-23',1,44,0),
(1624,'FALSE POLICE REPORT',225,'1974-02-15',0,416,0),
(1625,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',669,'2007-04-04',51,1075,0),
(1626,'THEFT OF IDENTITY',438,'1963-12-05',37,785,0),
(1627,'SHOPLIFTING - PETTY THEFT ($950 & UNDER)',399,'2004-01-08',13,746,0),
(1628,'THEFT OF IDENTITY',741,'1969-12-02',66,1126,0),
(1629,'THEFT OF IDENTITY',286,'1971-11-27',16,751,0),
(1630,'THEFT OF IDENTITY',688,'2018-03-31',34,308,0),
(1631,'RAPE, FORCIBLE',333,'1981-01-19',23,615,0),
(1632,'SEXUAL PENETRATION W/FOREIGN OBJECT',700,'1968-07-21',43,1271,0),
(1633,'BATTERY WITH SEXUAL CONTACT',883,'2013-05-10',13,265,0),
(1634,'BATTERY - SIMPLE ASSAULT',747,'1966-09-05',59,861,0),
(1635,'VIOLATION OF RESTRAINING ORDER',343,'2008-07-22',39,1223,0),
(1636,'THEFT OF IDENTITY',875,'2019-05-24',29,529,0),
(1637,'RAPE, FORCIBLE',829,'2009-02-02',49,967,0),
(1638,'THEFT OF IDENTITY',465,'1982-01-07',54,313,0),
(1639,'VEHICLE - STOLEN',342,'1992-06-17',34,69,0),
(1640,'THEFT OF IDENTITY',217,'2017-10-23',65,1195,0),
(1641,'INTIMATE PARTNER - SIMPLE ASSAULT',642,'1969-12-18',67,730,0),
(1642,'THEFT OF IDENTITY',84,'1955-05-21',53,1246,0),
(1643,'THEFT OF IDENTITY',822,'2003-02-05',42,140,0),
(1644,'THEFT OF IDENTITY',789,'2000-03-14',38,828,0),
(1645,'THEFT OF IDENTITY',102,'1973-02-18',33,1238,0),
(1646,'THEFT OF IDENTITY',422,'1960-11-05',9,889,0),
(1647,'THEFT OF IDENTITY',614,'2007-04-16',49,541,0),
(1648,'BATTERY - SIMPLE ASSAULT',235,'1973-02-27',6,658,0),
(1649,'EMBEZZLEMENT, GRAND THEFT ($950.01 & OVER)',314,'2019-12-01',21,159,0),
(1650,'BATTERY WITH SEXUAL CONTACT',814,'1970-01-20',6,397,0),
(1651,'VEHICLE - STOLEN',301,'1950-08-21',35,786,0),
(1652,'THEFT OF IDENTITY',216,'1984-01-02',24,552,0),
(1653,'BUNCO, GRAND THEFT',812,'1953-02-08',49,459,0),
(1654,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',747,'1990-12-08',43,1434,0),
(1655,'THEFT OF IDENTITY',657,'2003-01-13',27,393,0),
(1656,'THEFT OF IDENTITY',835,'1990-12-29',28,735,0),
(1657,'THEFT OF IDENTITY',229,'1993-05-07',46,1140,0),
(1658,'THEFT OF IDENTITY',807,'1977-05-18',19,733,0),
(1659,'THEFT OF IDENTITY',502,'1950-01-14',31,1419,0),
(1660,'VIOLATION OF COURT ORDER',414,'1963-05-11',14,1233,0),
(1661,'THEFT OF IDENTITY',102,'1954-07-03',8,754,0),
(1662,'RAPE, FORCIBLE',299,'2002-06-08',29,337,0),
(1663,'THEFT OF IDENTITY',735,'2011-07-03',41,1407,0),
(1664,'THEFT OF IDENTITY',218,'2000-11-01',7,1270,0),
(1665,'CRIMINAL THREATS - NO WEAPON DISPLAYED',665,'2004-01-20',29,1,0),
(1666,'THEFT OF IDENTITY',898,'1991-10-18',13,292,0),
(1667,'THEFT OF IDENTITY',571,'1976-07-25',19,975,0),
(1668,'THEFT OF IDENTITY',271,'1955-12-04',29,955,0),
(1669,'THEFT OF IDENTITY',414,'1950-01-31',21,1446,0),
(1670,'THEFT OF IDENTITY',735,'1989-12-23',18,19,0),
(1671,'VEHICLE - STOLEN',725,'2006-01-30',31,401,0),
(1672,'THEFT OF IDENTITY',328,'2022-06-05',50,1206,0),
(1673,'THEFT OF IDENTITY',23,'1990-05-29',44,371,0),
(1674,'VEHICLE - STOLEN',341,'1985-03-04',27,368,0),
(1675,'RAPE, FORCIBLE',8,'2000-10-23',13,230,0),
(1676,'THEFT OF IDENTITY',547,'2016-02-19',44,5,0),
(1677,'THEFT OF IDENTITY',66,'2013-02-05',35,578,0),
(1678,'BURGLARY FROM VEHICLE',506,'1992-02-28',5,1170,0),
(1679,'CREDIT CARDS, FRAUD USE ($950.01 & OVER)',240,'2002-07-28',35,654,0),
(1680,'THEFT PLAIN - PETTY ($950 & UNDER)',886,'1955-12-05',49,883,0),
(1681,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',670,'1958-09-19',2,1130,0),
(1682,'THEFT OF IDENTITY',244,'1975-11-15',20,563,0),
(1683,'THEFT OF IDENTITY',507,'1996-04-13',12,592,0),
(1684,'EMBEZZLEMENT, GRAND THEFT ($950.01 & OVER)',241,'1986-06-28',22,1445,0),
(1685,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',559,'1970-01-27',16,1080,0),
(1686,'THEFT OF IDENTITY',694,'1953-08-24',35,644,0),
(1687,'THEFT OF IDENTITY',344,'1997-01-02',40,1475,0),
(1688,'RAPE, FORCIBLE',153,'1963-08-18',35,893,0),
(1689,'SEX,UNLAWFUL(INC MUTUAL CONSENT, PENETRATION W/ FRGN OBJ',873,'2000-05-25',4,496,0),
(1690,'THEFT OF IDENTITY',41,'2016-11-11',12,1217,0),
(1691,'THEFT OF IDENTITY',25,'2001-11-12',0,679,0),
(1692,'THEFT PLAIN - PETTY ($950 & UNDER)',605,'1960-03-27',27,1365,0),
(1693,'THEFT OF IDENTITY',570,'1960-05-26',44,891,0),
(1694,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',201,'1964-01-01',15,123,0),
(1695,'DISTURBING THE PEACE',511,'1971-12-13',38,583,0),
(1696,'THEFT OF IDENTITY',149,'2010-07-07',36,451,0),
(1697,'THEFT OF IDENTITY',549,'1966-09-24',9,84,0),
(1698,'VANDALISM - FELONY ($400 & OVER, ALL CHURCH VANDALISMS)',100,'2002-03-06',11,1357,0),
(1699,'INTIMATE PARTNER - AGGRAVATED ASSAULT',69,'1975-08-18',43,1175,0),
(1700,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',541,'2000-01-10',43,263,0),
(1701,'INTIMATE PARTNER - AGGRAVATED ASSAULT',486,'1983-04-03',39,753,0),
(1702,'VEHICLE - STOLEN',343,'1953-04-22',28,771,0),
(1703,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',143,'1953-10-17',15,188,0),
(1704,'THEFT OF IDENTITY',564,'1964-12-15',45,1488,0),
(1705,'THEFT OF IDENTITY',697,'2005-02-09',23,62,0),
(1706,'THEFT OF IDENTITY',803,'1953-12-23',44,894,0),
(1707,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',559,'2008-12-11',41,1132,0),
(1708,'INTIMATE PARTNER - SIMPLE ASSAULT',107,'1994-11-27',34,821,0),
(1709,'THEFT OF IDENTITY',11,'1951-01-24',2,1292,0),
(1710,'THEFT OF IDENTITY',656,'2016-12-08',29,691,0),
(1711,'THEFT OF IDENTITY',473,'1968-06-04',32,1486,0),
(1712,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',649,'2022-01-22',28,1209,0),
(1713,'THEFT OF IDENTITY',149,'2018-12-06',25,1496,0),
(1714,'THEFT OF IDENTITY',263,'1988-02-09',47,205,0),
(1715,'THEFT OF IDENTITY',262,'1994-10-29',20,1282,0),
(1716,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',850,'1999-09-13',44,1284,0),
(1717,'THEFT OF IDENTITY',480,'1995-12-07',16,557,0),
(1718,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',504,'1987-08-28',2,794,0),
(1719,'BUNCO, GRAND THEFT',348,'1970-02-21',39,523,0),
(1720,'THEFT OF IDENTITY',570,'2014-07-11',16,150,0),
(1721,'THEFT OF IDENTITY',702,'2023-03-25',33,1269,0),
(1722,'VEHICLE - STOLEN',118,'1989-12-07',16,694,0),
(1723,'THEFT OF IDENTITY',824,'1990-09-18',44,134,0),
(1724,'THEFT OF IDENTITY',462,'1990-09-25',19,799,0),
(1725,'RAPE, FORCIBLE',181,'2004-11-16',31,51,0),
(1726,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',885,'1999-10-23',3,58,0),
(1727,'THEFT OF IDENTITY',239,'1991-02-17',29,478,0),
(1728,'VEHICLE - STOLEN',319,'1998-10-01',40,924,0),
(1729,'VEHICLE - STOLEN',411,'1980-10-03',9,81,0),
(1730,'THEFT OF IDENTITY',297,'2023-07-04',46,296,0),
(1731,'THEFT OF IDENTITY',209,'1980-04-14',21,1082,0),
(1732,'THEFT OF IDENTITY',378,'1998-03-07',16,1353,0),
(1733,'THEFT OF IDENTITY',13,'2023-01-04',10,1053,0),
(1734,'THEFT OF IDENTITY',842,'2022-02-22',48,928,0),
(1735,'VEHICLE - STOLEN',396,'2001-09-15',32,726,0),
(1736,'THEFT OF IDENTITY',474,'1993-08-14',42,848,0),
(1737,'VEHICLE - STOLEN',538,'1989-04-01',32,1361,0),
(1738,'THEFT OF IDENTITY',742,'2004-06-03',25,1043,0),
(1739,'BURGLARY FROM VEHICLE',645,'1979-10-02',44,612,0),
(1740,'BURGLARY FROM VEHICLE',824,'2019-12-03',38,1378,0),
(1741,'BURGLARY FROM VEHICLE',533,'1988-09-21',50,60,0),
(1742,'BURGLARY FROM VEHICLE',367,'2002-02-09',49,1375,0),
(1743,'THEFT OF IDENTITY',429,'2017-11-15',26,462,0),
(1744,'THEFT OF IDENTITY',354,'2008-09-11',31,56,0),
(1745,'THEFT OF IDENTITY',563,'2002-04-02',37,404,0),
(1746,'THEFT OF IDENTITY',695,'2013-05-01',14,301,0),
(1747,'THEFT OF IDENTITY',106,'2010-08-18',23,1057,0),
(1748,'THEFT OF IDENTITY',206,'2011-10-29',50,1420,0),
(1749,'THEFT OF IDENTITY',839,'1991-06-12',30,76,0),
(1750,'BURGLARY FROM VEHICLE',69,'1977-12-04',16,1033,0),
(1751,'RAPE, FORCIBLE',230,'2012-03-16',37,306,0),
(1752,'THEFT OF IDENTITY',459,'2022-01-20',50,986,0),
(1753,'BURGLARY FROM VEHICLE',728,'2001-01-12',31,1147,0),
(1754,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',134,'2006-04-20',32,1281,0),
(1755,'VANDALISM - MISDEAMEANOR ($399 OR UNDER)',635,'2012-10-19',28,817,0),
(1756,'THEFT OF IDENTITY',698,'2007-10-23',7,409,0),
(1757,'BATTERY WITH SEXUAL CONTACT',149,'2014-11-07',38,257,0),
(1758,'THEFT OF IDENTITY',773,'2004-04-06',14,743,0),
(1759,'INTIMATE PARTNER - SIMPLE ASSAULT',574,'2002-11-07',6,1272,0),
(1760,'THEFT OF IDENTITY',618,'2024-10-28',48,904,0),
(1761,'THEFT OF IDENTITY',494,'2009-10-15',50,18,0),
(1762,'BATTERY WITH SEXUAL CONTACT',43,'2021-01-03',26,99,0),
(1763,'VANDALISM - MISDEAMEANOR ($399 OR UNDER)',881,'2002-05-08',21,1000,0),
(1764,'EXTORTION',669,'2001-11-02',25,148,0),
(1765,'THEFT OF IDENTITY',477,'2002-06-13',38,304,0),
(1766,'THEFT PLAIN - PETTY ($950 & UNDER)',8,'2022-03-03',20,321,0),
(1767,'THEFT OF IDENTITY',191,'2012-11-03',32,1447,0),
(1768,'THEFT OF IDENTITY',872,'2021-05-15',49,597,0),
(1769,'THEFT OF IDENTITY',713,'2012-01-24',31,165,0),
(1770,'CHILD ABUSE (PHYSICAL) - SIMPLE ASSAULT',842,'2020-01-08',31,380,0),
(1771,'THEFT OF IDENTITY',655,'2003-12-04',28,76,0),
(1772,'BURGLARY',280,'2022-07-29',5,507,0),
(1773,'THEFT OF IDENTITY',788,'2008-05-21',18,124,0),
(1774,'EMBEZZLEMENT, GRAND THEFT ($950.01 & OVER)',816,'2023-10-11',0,135,0),
(1775,'BUNCO, GRAND THEFT',281,'2014-01-13',15,31,0),
(1776,'INTIMATE PARTNER - SIMPLE ASSAULT',843,'2014-10-20',48,1064,0),
(1777,'RAPE, FORCIBLE',55,'2017-07-19',34,43,0),
(1778,'INTIMATE PARTNER - SIMPLE ASSAULT',717,'2003-02-25',4,990,0),
(1779,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',360,'2022-01-12',1,685,0),
(1780,'THEFT OF IDENTITY',123,'2009-10-02',28,263,0),
(1781,'THEFT OF IDENTITY',268,'2006-07-23',40,958,0),
(1782,'THEFT OF IDENTITY',862,'2011-09-14',9,679,0),
(1783,'THEFT OF IDENTITY',370,'2022-06-14',31,1474,0),
(1784,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',555,'2005-09-26',43,762,0),
(1785,'THEFT OF IDENTITY',720,'2002-11-30',43,16,0),
(1786,'THEFT OF IDENTITY',656,'2004-02-10',21,857,0),
(1787,'INTIMATE PARTNER - SIMPLE ASSAULT',415,'2010-09-29',3,694,0),
(1788,'THEFT OF IDENTITY',434,'2017-09-30',20,540,0),
(1789,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',493,'2018-09-02',49,1216,0),
(1790,'THEFT OF IDENTITY',761,'2021-02-22',36,492,0),
(1791,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',855,'2015-09-20',10,160,0),
(1792,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',181,'2014-11-22',20,528,0),
(1793,'THEFT OF IDENTITY',447,'2001-10-24',10,382,0),
(1794,'THEFT OF IDENTITY',748,'2023-10-21',12,248,0),
(1795,'THEFT OF IDENTITY',878,'2015-08-26',27,819,0),
(1796,'RAPE, FORCIBLE',867,'2016-02-20',32,1472,0),
(1797,'THEFT OF IDENTITY',157,'2016-05-10',4,263,0),
(1798,'BURGLARY',713,'2006-06-04',29,1032,0),
(1799,'FALSE IMPRISONMENT',163,'2001-10-09',42,1083,0),
(1800,'THEFT OF IDENTITY',642,'2018-09-27',49,362,0),
(1801,'BUNCO, ATTEMPT',444,'2004-03-16',24,393,0),
(1802,'BATTERY WITH SEXUAL CONTACT',496,'2015-04-24',38,409,0),
(1803,'THEFT OF IDENTITY',354,'2001-09-10',41,1255,0),
(1804,'DOCUMENT FORGERY / STOLEN FELONY',858,'2008-08-02',36,330,0),
(1805,'THEFT OF IDENTITY',237,'2017-01-28',50,957,0),
(1806,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',570,'2005-06-18',24,92,0),
(1807,'RAPE, FORCIBLE',621,'2001-05-10',40,1143,0),
(1808,'VEHICLE - STOLEN',264,'2008-01-20',10,59,0),
(1809,'THEFT OF IDENTITY',250,'2008-05-07',39,306,0),
(1810,'THEFT OF IDENTITY',144,'2004-06-22',17,1334,0),
(1811,'THEFT OF IDENTITY',104,'2015-11-13',38,1270,0),
(1812,'INTIMATE PARTNER - SIMPLE ASSAULT',642,'2002-01-07',13,931,0),
(1813,'THEFT OF IDENTITY',685,'2012-10-16',5,362,0),
(1814,'THEFT OF IDENTITY',879,'2002-11-21',26,792,0),
(1815,'THEFT OF IDENTITY',694,'2009-11-20',4,1364,0),
(1816,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',477,'2015-09-18',40,928,0),
(1817,'THEFT OF IDENTITY',17,'2014-04-04',6,20,0),
(1818,'THEFT OF IDENTITY',896,'2006-03-31',49,414,0),
(1819,'THEFT OF IDENTITY',253,'2023-11-29',45,99,0),
(1820,'THEFT OF IDENTITY',196,'2014-08-27',5,1423,0),
(1821,'VEHICLE - STOLEN',795,'2006-08-15',1,6,0),
(1822,'THEFT OF IDENTITY',424,'2008-04-01',39,745,0),
(1823,'BURGLARY FROM VEHICLE',681,'2015-12-18',39,663,0),
(1824,'BURGLARY',593,'2005-03-03',31,9,0),
(1825,'THEFT OF IDENTITY',385,'2010-12-23',11,473,0),
(1826,'THEFT OF IDENTITY',306,'2023-09-23',38,186,0),
(1827,'INTIMATE PARTNER - SIMPLE ASSAULT',346,'2024-08-27',43,531,0),
(1828,'THEFT OF IDENTITY',745,'2021-12-04',32,1150,0),
(1829,'THEFT OF IDENTITY',394,'2011-06-28',24,479,0),
(1830,'BATTERY WITH SEXUAL CONTACT',322,'2005-10-02',47,99,0),
(1831,'THEFT OF IDENTITY',676,'2001-11-13',16,19,0),
(1832,'BURGLARY FROM VEHICLE',55,'2020-01-13',35,1113,0),
(1833,'BURGLARY',284,'2008-06-07',23,593,0),
(1834,'THEFT OF IDENTITY',648,'2022-10-01',5,206,0),
(1835,'THEFT OF IDENTITY',69,'2022-02-20',50,752,0),
(1836,'THEFT OF IDENTITY',622,'2001-08-17',50,1500,0),
(1837,'BURGLARY',501,'2014-07-01',7,1127,0),
(1838,'THEFT OF IDENTITY',493,'2002-04-16',40,708,0),
(1839,'BURGLARY FROM VEHICLE',346,'2009-05-20',10,929,0),
(1840,'THEFT OF IDENTITY',679,'2004-01-01',48,878,0),
(1841,'THEFT OF IDENTITY',681,'2020-09-22',26,706,0),
(1842,'BURGLARY',614,'2003-06-16',47,1253,0),
(1843,'THEFT OF IDENTITY',524,'2013-11-13',25,362,0),
(1844,'BURGLARY FROM VEHICLE',647,'2002-01-17',9,1085,0),
(1845,'THEFT OF IDENTITY',276,'2009-04-12',49,1020,0),
(1846,'THEFT OF IDENTITY',158,'2006-09-10',3,119,0),
(1847,'BURGLARY',406,'2023-05-13',39,243,0),
(1848,'THEFT OF IDENTITY',449,'2007-07-20',7,270,0),
(1849,'BURGLARY FROM VEHICLE',89,'2017-02-06',45,1455,0),
(1850,'THEFT OF IDENTITY',289,'2020-06-13',6,1069,0),
(1851,'THEFT OF IDENTITY',505,'2016-01-14',11,30,0),
(1852,'BUNCO, GRAND THEFT',648,'2023-07-01',15,474,0),
(1853,'THEFT OF IDENTITY',668,'2010-04-18',44,1094,0),
(1854,'THEFT OF IDENTITY',632,'2016-04-10',2,868,0),
(1855,'CHILD ABUSE (PHYSICAL) - SIMPLE ASSAULT',444,'2017-10-25',21,365,0),
(1856,'THEFT OF IDENTITY',404,'2010-03-21',7,1148,0),
(1857,'VEHICLE - STOLEN',120,'2021-06-02',22,564,0),
(1858,'THEFT OF IDENTITY',179,'2010-05-06',48,1434,0),
(1859,'THEFT OF IDENTITY',732,'2015-02-19',23,969,0),
(1860,'LETTERS, LEWD - TELEPHONE CALLS, LEWD',818,'2022-04-02',37,1427,0),
(1861,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',527,'2018-06-07',36,1063,0),
(1862,'BATTERY - SIMPLE ASSAULT',690,'2022-05-10',38,901,0),
(1863,'THEFT PLAIN - PETTY ($950 & UNDER)',522,'2022-10-17',25,889,0),
(1864,'THEFT OF IDENTITY',423,'2016-11-22',39,927,0),
(1865,'THEFT OF IDENTITY',248,'2024-03-08',41,1440,0),
(1866,'THEFT OF IDENTITY',323,'2020-01-28',2,872,0),
(1867,'THEFT OF IDENTITY',821,'2016-06-17',31,875,0),
(1868,'SEXUAL PENETRATION W/FOREIGN OBJECT',517,'2013-12-04',27,203,0),
(1869,'VEHICLE - STOLEN',517,'2017-09-25',29,1361,0),
(1870,'SEXUAL PENETRATION W/FOREIGN OBJECT',830,'2015-06-23',4,407,0),
(1871,'THEFT OF IDENTITY',800,'2020-04-28',23,1001,0),
(1872,'THEFT OF IDENTITY',46,'2014-04-18',9,179,0),
(1873,'THEFT OF IDENTITY',263,'2015-10-05',22,758,0),
(1874,'THEFT OF IDENTITY',664,'2023-02-28',27,561,0),
(1875,'THEFT OF IDENTITY',790,'2013-09-10',9,1167,0),
(1876,'SEX, UNLAWFUL (INC MUTUAL CONSENT, PENETRATION W/ FRGN OBJ)',699,'2024-09-29',26,775,0),
(1877,'THEFT OF IDENTITY',392,'2011-11-03',26,1136,0),
(1878,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',71,'2010-05-18',47,121,0),
(1879,'THEFT PLAIN - PETTY ($950 & UNDER)',581,'2024-02-20',16,285,0),
(1880,'THEFT OF IDENTITY',495,'2024-06-06',46,919,0),
(1881,'VANDALISM - FELONY ($400 & OVER, ALL CHURCH VANDALISMS)',418,'2015-09-12',11,722,0),
(1882,'LETTERS, LEWD - TELEPHONE CALLS, LEWD',493,'2020-12-17',26,1067,0),
(1883,'THEFT OF IDENTITY',858,'2010-02-27',20,103,0),
(1884,'THEFT OF IDENTITY',155,'2012-05-15',12,1097,0),
(1885,'THEFT OF IDENTITY',541,'2024-06-11',15,1203,0),
(1886,'VEHICLE - STOLEN',194,'2023-05-22',28,293,0),
(1887,'CHILD ABUSE (PHYSICAL) - SIMPLE ASSAULT',547,'2019-08-04',46,1185,0),
(1888,'THEFT OF IDENTITY',774,'2019-07-19',35,1478,0),
(1889,'THEFT OF IDENTITY',757,'2024-07-15',2,1456,0),
(1890,'THEFT OF IDENTITY',852,'2020-05-19',23,935,0),
(1891,'THEFT OF IDENTITY',686,'2022-06-01',30,96,0),
(1892,'THEFT OF IDENTITY',744,'2013-08-04',3,1292,0),
(1893,'THEFT OF IDENTITY',787,'2014-06-08',17,740,0),
(1894,'THEFT OF IDENTITY',522,'2018-02-14',36,381,0),
(1895,'BURGLARY',546,'2023-06-01',12,1264,0),
(1896,'THEFT OF IDENTITY',145,'2020-08-21',30,1227,0),
(1897,'THEFT OF IDENTITY',831,'2017-02-06',12,54,0),
(1898,'THEFT OF IDENTITY',567,'2012-09-22',45,205,0),
(1899,'THEFT OF IDENTITY',884,'2014-01-22',46,1219,0),
(1900,'SEXUAL PENETRATION W/FOREIGN OBJECT',877,'2010-01-26',12,859,0),
(1901,'THEFT OF IDENTITY',174,'2016-11-05',17,482,0),
(1902,'VEHICLE - STOLEN',688,'2022-01-02',23,346,0),
(1903,'THEFT FROM MOTOR VEHICLE - GRAND ($950.01 AND OVER)',808,'2021-06-21',34,1161,0),
(1904,'THEFT OF IDENTITY',186,'2024-01-30',21,576,0),
(1905,'THEFT OF IDENTITY',446,'2019-01-14',35,473,0),
(1906,'BUNCO, GRAND THEFT',640,'2017-12-23',19,483,0),
(1907,'PICKPOCKET',422,'2018-12-18',48,807,0),
(1908,'BURGLARY',62,'2014-09-24',15,114,0),
(1909,'THEFT OF IDENTITY',645,'2024-06-17',39,492,0),
(1910,'BUNCO, GRAND THEFT',649,'2020-01-04',8,29,0),
(1911,'THEFT OF IDENTITY',452,'2011-08-22',30,1468,0),
(1912,'INTIMATE PARTNER - SIMPLE ASSAULT',424,'2023-07-06',26,731,0),
(1913,'VEHICLE - STOLEN',648,'2020-01-27',21,1163,0),
(1914,'INTIMATE PARTNER - AGGRAVATED ASSAULT',44,'2021-01-21',48,869,0),
(1915,'THEFT OF IDENTITY',778,'2013-06-19',9,694,0),
(1916,'THEFT OF IDENTITY',549,'2013-02-27',2,1386,0),
(1917,'THEFT OF IDENTITY',100,'2018-12-20',5,230,0),
(1918,'CHILD ABUSE (PHYSICAL) - AGGRAVATED ASSAULT',692,'2011-03-30',2,1370,0),
(1919,'THEFT OF IDENTITY',470,'2016-11-17',21,771,0),
(1920,'THEFT OF IDENTITY',481,'2012-02-08',1,1329,0),
(1921,'THEFT OF IDENTITY',854,'2022-12-21',7,33,0),
(1922,'THEFT PLAIN - PETTY ($950 & UNDER)',34,'2010-03-07',34,429,0),
(1923,'THEFT OF IDENTITY',7,'2018-07-15',10,878,0),
(1924,'THEFT OF IDENTITY',827,'2022-07-01',18,644,0),
(1925,'THEFT OF IDENTITY',722,'2021-07-02',11,671,0),
(1926,'THEFT OF IDENTITY',577,'2014-10-07',6,902,0),
(1927,'BURGLARY',271,'2018-05-06',16,1400,0),
(1928,'BURGLARY',431,'2016-05-19',30,56,0),
(1929,'THEFT OF IDENTITY',479,'2011-04-13',21,1410,0),
(1930,'BURGLARY',407,'2023-07-02',12,299,0),
(1931,'THEFT OF IDENTITY',707,'2017-06-06',3,758,0),
(1932,'THEFT OF IDENTITY',609,'2024-01-20',12,607,0),
(1933,'VEHICLE - STOLEN',837,'2018-01-10',35,1290,0),
(1934,'VEHICLE - STOLEN',475,'2020-05-03',19,1268,0),
(1935,'THEFT OF IDENTITY',390,'2020-03-19',25,1223,0),
(1936,'THEFT OF IDENTITY',789,'2020-09-14',35,1082,0),
(1937,'VEHICLE - STOLEN',604,'2017-02-13',23,290,0),
(1938,'THEFT OF IDENTITY',267,'2012-10-30',23,980,0),
(1939,'VEHICLE - STOLEN',295,'2015-06-17',8,170,0),
(1940,'THEFT OF IDENTITY',451,'2015-03-14',7,911,0),
(1941,'VEHICLE - STOLEN',876,'2011-05-12',28,1040,0),
(1942,'THEFT OF IDENTITY',481,'2020-06-12',45,325,0),
(1943,'THEFT OF IDENTITY',564,'2021-08-22',4,328,0),
(1944,'THEFT OF IDENTITY',231,'2016-09-04',14,542,0),
(1945,'THEFT OF IDENTITY',307,'2019-09-26',28,523,0),
(1946,'THEFT OF IDENTITY',900,'2017-10-17',35,879,0),
(1947,'VEHICLE - STOLEN',779,'2018-03-11',34,869,0),
(1948,'THEFT OF IDENTITY',317,'2024-07-01',38,1269,0),
(1949,'VEHICLE - STOLEN',602,'2024-03-01',13,635,0),
(1950,'VEHICLE - STOLEN',748,'2019-07-06',15,179,0),
(1951,'BURGLARY',842,'2019-10-06',11,115,0),
(1952,'UNAUTHORIZED COMPUTER ACCESS',236,'2012-07-11',8,710,0),
(1953,'BURGLARY FROM VEHICLE',650,'2014-11-06',49,566,0),
(1954,'THEFT OF IDENTITY',578,'2010-12-07',46,1057,0),
(1955,'LETTERS, LEWD - TELEPHONE CALLS, LEWD',532,'2021-01-07',28,891,0),
(1956,'INTIMATE PARTNER - AGGRAVATED ASSAULT',132,'2011-10-25',25,318,0),
(1957,'BURGLARY FROM VEHICLE',274,'2014-10-21',43,923,0),
(1958,'ARSON',547,'2023-06-03',13,779,0),
(1959,'LETTERS, LEWD - TELEPHONE CALLS, LEWD',600,'2021-08-05',13,549,0),
(1960,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',311,'2012-03-30',49,1104,0),
(1961,'THEFT OF IDENTITY',310,'2015-02-07',42,1196,0),
(1962,'THEFT OF IDENTITY',97,'2015-11-15',36,1083,0),
(1963,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',763,'2013-08-04',12,1308,0),
(1964,'RAPE, FORCIBLE',633,'2024-05-01',14,833,0),
(1965,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',189,'2023-12-14',44,215,0),
(1966,'THEFT OF IDENTITY',384,'2018-08-16',1,781,0),
(1967,'THEFT OF IDENTITY',290,'2021-02-06',24,1030,0),
(1968,'THEFT OF IDENTITY',348,'2012-11-15',9,335,0),
(1969,'THEFT OF IDENTITY',366,'2023-01-09',9,710,0),
(1970,'THEFT OF IDENTITY',165,'2022-02-11',43,782,0),
(1971,'BATTERY - SIMPLE ASSAULT',503,'2015-02-09',15,481,0),
(1972,'THEFT OF IDENTITY',783,'2010-10-06',0,270,0),
(1973,'SHOPLIFTING - PETTY THEFT ($950 & UNDER)',712,'2020-03-09',32,1225,0),
(1974,'THEFT OF IDENTITY',61,'2022-12-10',36,711,0),
(1975,'THEFT OF IDENTITY',524,'2023-08-23',42,525,0),
(1976,'SODOMY/SEXUAL CONTACT B/W PENIS OF ONE PERS TO ANUS OTH',900,'2013-09-09',36,697,0),
(1977,'THEFT OF IDENTITY',687,'2011-10-23',9,306,0),
(1978,'THEFT OF IDENTITY',205,'2023-12-29',0,765,0),
(1979,'THEFT OF IDENTITY',243,'2014-01-04',17,1019,0),
(1980,'VANDALISM - FELONY ($400 & OVER, ALL CHURCH VANDALISMS)',855,'2012-01-01',16,1174,0),
(1981,'THEFT OF IDENTITY',622,'2018-03-27',20,1165,0),
(1982,'THEFT OF IDENTITY',298,'2014-08-16',14,1329,0),
(1983,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',380,'2012-05-09',12,1197,0),
(1984,'VEHICLE - STOLEN',793,'2013-04-07',0,1438,0),
(1985,'INTIMATE PARTNER - SIMPLE ASSAULT',371,'2019-03-13',12,1207,0),
(1986,'THEFT OF IDENTITY',219,'2012-04-17',10,677,0),
(1987,'THEFT OF IDENTITY',515,'2023-08-15',46,431,0),
(1988,'BURGLARY',81,'2016-08-31',40,585,0),
(1989,'THEFT OF IDENTITY',30,'2015-09-01',30,1487,0),
(1990,'THEFT OF IDENTITY',52,'2018-05-29',19,1193,0),
(1991,'CHILD STEALING',26,'2014-10-14',26,1459,0),
(1992,'THEFT OF IDENTITY',679,'2019-02-26',27,1150,0),
(1993,'THEFT OF IDENTITY',217,'2011-01-09',35,1395,0),
(1994,'DOCUMENT FORGERY / STOLEN FELONY',408,'2012-09-01',9,355,0),
(1995,'THEFT OF IDENTITY',265,'2023-05-20',10,1007,0),
(1996,'CHILD ABUSE (PHYSICAL) - SIMPLE ASSAULT',281,'2017-01-18',50,1202,0),
(1997,'LEWD/LASCIVIOUS ACTS WITH CHILD',855,'2024-05-09',37,1054,0),
(1998,'THEFT OF IDENTITY',662,'2018-01-17',47,448,0),
(1999,'EMBEZZLEMENT, GRAND THEFT ($950.01 & OVER)',195,'2015-01-25',0,968,0),
(2000,'THEFT PLAIN - PETTY ($950 & UNDER)',777,'2012-08-28',35,293,0);

INSERT INTO officer_station_history (badge_number, jail_code, start_date, end_date) VALUES
(0, 1, '2019-12-01', '2020-03-14'),
(1, 4, '2020-01-01', '2021-06-21'),
(2, 3, '2021-01-01', '2022-11-06'),
(3, 9, '2022-01-01', '2023-01-18'),
(4, 3, '2023-01-01', '2024-05-29'),
(5, 9, '2020-01-01', '2020-09-11'),
(6, 4, '2020-01-01', '2021-04-04'),
(7, 9, '2021-01-01', '2022-08-13'),
(8, 2, '2023-01-01', '2023-11-30'),
(9, 3, '2023-01-01', '2024-02-19'),
(10, 1, '2020-01-01', '2020-11-10'),
(11, 6, '2020-01-01', '2021-07-24'),
(12, 9, '2021-01-01', '2022-03-29'),
(13, 5, '2023-01-01', '2023-10-05'),
(14, 2, '2023-01-01', '2024-05-14'),
(15, 9, '2020-01-01', '2020-06-17'),
(16, 5, '2020-01-01', '2021-12-08'),
(17, 9, '2021-01-01', '2022-01-21'),
(18, 5, '2022-01-01', '2023-07-10'),
(19, 1, '2023-01-01', '2024-04-03'),
(20, 4, '2020-01-01', '2020-08-27'),
(21, 6, '2020-01-01', '2021-05-01'),
(22, 0, '2022-01-01', '2022-09-28'),
(23, 9, '2023-01-01', '2023-11-02'),
(24, 6, '2023-01-01', '2024-02-10'),
(25, 2, '2020-01-01', '2020-03-20'),
(26, 0, '2020-01-01', '2021-06-29'),
(27, 9, '2020-01-01', '2022-10-16'),
(28, 3, '2023-01-01', '2023-04-22'),
(29, 8, '2023-01-01', '2024-12-04'),
(30, 2, '2020-01-01', '2020-01-13'),
(31, 5, '2020-01-01', '2021-02-24'),
(32, 4, '2020-01-01', '2022-07-08'),
(33, 5, '2022-01-01', '2023-03-17'),
(34, 0, '2024-01-01', '2024-08-11'),
(35, 4, '2020-01-01', '2020-05-14'),
(36, 2, '2021-01-01', '2021-09-03'),
(37, 9, '2020-01-01', '2022-11-28'),
(38, 2, '2023-01-01', '2023-06-12'),
(39, 0, '2024-01-01', '2024-10-21'),
(40, 4, '2020-01-01', '2020-12-29'),
(41, 4, '2020-01-01', '2021-01-07'),
(42, 7, '2022-01-01', '2022-04-25'),
(43, 9, '2023-01-01', '2023-08-10'),
(44, 1, '2024-01-01', '2024-02-13'),
(45, 2, '2020-01-01', '2020-09-18'),
(46, 2, '2020-01-01', '2021-03-23'),
(47, 2, '2020-01-01', '2022-06-06'),
(48, 9, '2020-01-01', '2020-01-14'),
(49, 4, '2020-01-01', '2021-03-21'),
(50, 4, '2020-01-01', '2022-06-17'),
(51, 9, '2023-01-01', '2023-09-10'),
(52, 4, '2024-01-01', '2024-02-27'),
(53, 8, '2020-01-01', '2020-07-23'),
(54, 8, '2020-01-01', '2021-11-21'),
(55, 1, '2022-01-01', '2022-10-22'),
(56, 0, '2023-01-01', '2023-05-18'),
(57, 4, '2024-01-01', '2024-04-28'),
(58, 5, '2020-01-01', '2020-08-21'),
(59, 0, '2021-01-01', '2021-12-24'),
(60, 5, '2022-01-01', '2022-03-26'),
(61, 2, '2023-01-01', '2023-01-08'),
(62, 2, '2024-01-01', '2024-06-14'),
(63, 6, '2020-01-01', '2020-02-05'),
(64, 8, '2020-01-01', '2021-04-11'),
(65, 8, '2020-01-01', '2022-05-29'),
(96, 3, '2022-01-01', '2023-01-07'),
(97, 4, '2019-01-01', '2020-01-25'),
(98, 9, '2020-01-01', '2021-02-03'),
(99, 7, '2021-01-01', '2022-03-01'),
(100, 7, '2022-01-01', '2023-04-04'),
(101, 1, '2023-01-01', '2024-05-28'),
(102, 6, '2020-01-01', '2020-06-14'),
(103, 9, '2020-01-01', '2021-07-04');



INSERT INTO incarceration_history(criminal_code,jail_code,start_date,end_date,status) VALUES 
(1,7,'2020-10-24','2022-03-09','Transferred'),
(3,5,'2020-08-24','2021-03-29','Transferred'), 
(3,1,'2021-03-29','2022-04-15','Transferred'),
(4,0,'2020-07-30','2022-01-03','Transferred'),
(5,3,'2020-03-25','2023-03-03','Transferred'),
(42,0,'2020-03-20','2024-02-25','Transferred'),
(46,3,'2020-07-15','2022-09-06','Transferred'),
(53,9,'2020-06-07','2024-06-11','Transferred'),
(57,2,'2020-03-06','2020-11-13','Transferred'),
(63,7,'2020-04-29','2022-02-01','Transferred'),
(73,6,'2020-06-09','2022-12-07','Transferred'),
(80,7,'2020-12-01','2024-04-29','Transferred'),
(93,3,'2020-10-19','2023-04-09','Transferred'),
(94,7,'2020-04-01','2024-11-01','Transferred'),
(132,8,'2020-05-30','2023-10-10','Transferred'),
(138,1,'2020-07-01','2023-06-21','Transferred'),
(138,3,'2023-06-21','2024-03-03','Transferred'),
(162,0,'2020-06-24','2021-04-12','Transferred'),
(175,8,'2020-08-01','2021-04-03','Transferred'),
(193,3,'2020-10-31','2020-12-25','Transferred'),
(198,0,'2020-03-01','2022-03-05','Transferred'),
(246,2,'2020-07-25','2022-04-15','Transferred'),
(262,3,'2020-09-14','2020-12-31','Transferred'),
(264,9,'2020-07-05','2021-04-02','Transferred'),
(340,6,'2020-05-01','2024-04-04','Transferred'),
(386,6,'2020-01-01','2022-09-05','Transferred'),
(425,0,'2020-08-01','2023-01-31','Transferred'),
(432,7,'2020-03-19','2022-03-09','Transferred'),
(437,3,'2020-01-03','2020-12-31','Transferred'),
(473,7,'2020-11-19','2024-04-16','Transferred'),
(515,3,'2020-08-30','2023-12-20','Transferred'),
(613,7,'2020-04-02','2022-03-15','Transferred'),
(624,9,'2020-03-05','2023-02-19','Transferred'),
(672,0,'2020-03-01','2021-02-05','Transferred'),
(763,0,'2020-10-20','2020-11-29','Transferred'),
(778,2,'2020-06-13','2023-06-11','Transferred');
