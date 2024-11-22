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
   PRIMARY KEY(`Badge_Number`, `start_date`), 
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
   PRIMARY KEY(Criminal_Code, start_date),
  FOREIGN KEY(Criminal_Code) REFERENCES criminals(Criminal_Code),
  FOREIGN KEY(Jail_Code) REFERENCES jails(Jail_Code) ON DELETE SET NULL
);

INSERT INTO `Jails` VALUES
 (0,'Manila','2012-01-01', 0)
,(1,'Makati','1985-01-01', 0)
,(2,'Taguig','1990-01-01', 0)
,(3,'Mandaluyong','1956-01-01', 0)
,(4,'Muntinlupa','2023-01-01', 0)
,(5,'Quezon','1934-01-01', 0)
,(6,'Bulacan','1991-01-01', 0)
,(7,'Laguna','2010-01-01', 0)
,(8,'Cavite','1980-01-01', 0)
,(9,'Pasay','2009-01-01', 0);

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
,(799,'Venus','Villeneuve',249,4,0);

INSERT INTO `officers` VALUES
(0,'Vivian','Murray',1,'2020-03-15','T', 0),
(1,'Vanessa','Moore',3,'2021-06-22','T', 0),
(2,'Leonardo','Foster',2,'2022-11-07','T', 0),
(3,'Violet','Crawford',0,'2023-01-19','T', 0),
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
(299,'Henry','West',6,'2020-11-24','T', 0);

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
,(998,'THEFT OF IDENTITY',199,'2020-09-01',36,495,0);

INSERT INTO officer_station_history (badge_number, jail_code, start_date, end_date) VALUES
(0, 1, '2019-12-01', '2020-03-14'),
(1, 3, '2020-01-01', '2021-06-21'),
(2, 2, '2021-01-01', '2022-11-06'),
(3, 0, '2022-01-01', '2023-01-18'),
(4, 2, '2023-01-01', '2024-05-29'),
(5, 0, '2020-01-01', '2020-09-11'),
(6, 3, '2020-01-01', '2021-04-04'),
(7, 0, '2021-01-01', '2022-08-13'),
(8, 7, '2023-01-01', '2023-11-30'),
(9, 2, '2023-01-01', '2024-02-19'),
(10, 1, '2020-01-01', '2020-11-10'),
(11, 5, '2020-01-01', '2021-07-24'),
(12, 0, '2021-01-01', '2022-03-29'),
(13, 4, '2023-01-01', '2023-10-05'),
(14, 7, '2023-01-01', '2024-05-14'),
(15, 0, '2020-01-01', '2020-06-17'),
(16, 4, '2020-01-01', '2021-12-08'),
(17, 0, '2021-01-01', '2022-01-21'),
(18, 4, '2022-01-01', '2023-07-10'),
(19, 1, '2023-01-01', '2024-04-03'),
(20, 3, '2020-01-01', '2020-08-27'),
(21, 5, '2020-01-01', '2021-05-01'),
(22, 9, '2022-01-01', '2022-09-28'),
(23, 0, '2023-01-01', '2023-11-02'),
(24, 5, '2023-01-01', '2024-02-10'),
(25, 7, '2020-01-01', '2020-03-20'),
(26, 9, '2020-01-01', '2021-06-29'),
(27, 0, '2020-01-01', '2022-10-16'),
(28, 2, '2023-01-01', '2023-04-22'),
(29, 8, '2023-01-01', '2024-12-04'),
(30, 7, '2020-01-01', '2020-01-13'),
(31, 4, '2020-01-01', '2021-02-24'),
(32, 3, '2020-01-01', '2022-07-08'),
(33, 4, '2022-01-01', '2023-03-17'),
(34, 9, '2024-01-01', '2024-08-11'),
(35, 3, '2020-01-01', '2020-05-14'),
(36, 7, '2021-01-01', '2021-09-03'),
(37, 0, '2020-01-01', '2022-11-28'),
(38, 7, '2023-01-01', '2023-06-12'),
(39, 9, '2024-01-01', '2024-10-21'),
(40, 3, '2020-01-01', '2020-12-29'),
(41, 3, '2020-01-01', '2021-01-07'),
(42, 6, '2022-01-01', '2022-04-25'),
(43, 0, '2023-01-01', '2023-08-10'),
(44, 1, '2024-01-01', '2024-02-13'),
(45, 7, '2020-01-01', '2020-09-18'),
(46, 7, '2020-01-01', '2021-03-23'),
(47, 7, '2020-01-01', '2022-06-06'),
(48, 0, '2020-01-01', '2020-01-14'),
(49, 3, '2020-01-01', '2021-03-21'),
(50, 3, '2020-01-01', '2022-06-17'),
(51, 0, '2023-01-01', '2023-09-10'),
(52, 3, '2024-01-01', '2024-02-27'),
(53, 8, '2020-01-01', '2020-07-23'),
(54, 8, '2020-01-01', '2021-11-21'),
(55, 1, '2022-01-01', '2022-10-22'),
(56, 9, '2023-01-01', '2023-05-18'),
(57, 3, '2024-01-01', '2024-04-28'),
(58, 4, '2020-01-01', '2020-08-21'),
(59, 9, '2021-01-01', '2021-12-24'),
(60, 4, '2022-01-01', '2022-03-26'),
(61, 7, '2023-01-01', '2023-01-08'),
(62, 7, '2024-01-01', '2024-06-14'),
(63, 5, '2020-01-01', '2020-02-05'),
(64, 8, '2020-01-01', '2021-04-11'),
(65, 8, '2020-01-01', '2022-05-29'),
(96, 2, '2022-01-01', '2023-01-07'),
(97, 3, '2019-01-01', '2020-01-25'),
(98, 0, '2020-01-01', '2021-02-03'),
(99, 6, '2021-01-01', '2022-03-01'),
(100, 6, '2022-01-01', '2023-04-04'),
(101, 1, '2023-01-01', '2024-05-28'),
(102, 5, '2020-01-01', '2020-06-14'),
(103, 0, '2020-01-01', '2021-07-04');


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
