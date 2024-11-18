DROP DATABASE IF EXISTS `criminaldb`;
CREATE DATABASE `criminaldb`;
USE `criminaldb`;

DROP TABLE IF EXISTS Jails;
CREATE TABLE Jails(
    `Jail_Code`             int(100)  NOT NULL DEFAULT '0' PRIMARY KEY,
    `Area_of_Jurisdiction`  char(100) NOT NULL DEFAULT '',
    `Years_Active`          int(100)  NOT NULL DEFAULT '0'
);

DROP TABLE IF EXISTS Criminals;
CREATE TABLE Criminals(
    `Criminal_Code`     int(100)  NOT NULL DEFAULT '0' PRIMARY KEY,
    `First_Name`        char(100) NOT NULL DEFAULT '',
    `Last_Name`         char(100)  NOT NULL DEFAULT '',
    `Total_Sentence`    int(100) NOT NULL DEFAULT '0',
    `Jail_Code`         int(100)  DEFAULT '0',
    FOREIGN KEY(`Jail_Code`) REFERENCES Jails(`Jail_Code`)
);

DROP TABLE IF EXISTS officers;
CREATE TABLE officers(
    `Badge_Number`      INTEGER  NOT NULL DEFAULT '0' PRIMARY KEY, 
    `First_Name`        char(100) NOT NULL DEFAULT '',
    `Last_Name`         char(100)  NOT NULL DEFAULT '',
    `Jail_Code`         INTEGER DEFAULT '0',
    `Start_Date_Current`  DATE,
    `Active`            char(1) NOT NULL DEFAULT '', 
    FOREIGN KEY(`Jail_Code`) REFERENCES Jails(`Jail_Code`)
);

DROP TABLE IF EXISTS Crimes;
CREATE TABLE Crimes(
    `Crime_Code`     int(100)  NOT NULL DEFAULT '0' PRIMARY KEY,
    `Crime_Type`     char(100) NOT NULL DEFAULT '',
    `Badge_Number`   int(100)  NOT NULL DEFAULT '0',
    `Date_Committed` char(100) NOT NULL DEFAULT '',
    `Sentence`       int(100)  NOT NULL DEFAULT '0',
    `Criminal_Code`  int(100)  DEFAULT '0',
    FOREIGN KEY(`Criminal_Code`) REFERENCES criminals(`Criminal_Code`),
    FOREIGN KEY(`Badge_Number`) REFERENCES officers(`Badge_Number`)
);

DROP TABLE IF EXISTS officer_station_history;
CREATE TABLE officer_station_history(
   Badge_Number INTEGER  NOT NULL,
   Jail_Code    INTEGER NOT NULL, 
   start_date   DATE  NOT NULL, 
   end_date     DATE NOT NULL,
   FOREIGN KEY(Badge_Number) REFERENCES officers(Badge_Number),
   FOREIGN KEY(Jail_Code) REFERENCES jails(Jail_Code)
);

DROP TABLE IF EXISTS incarceration_history;
CREATE TABLE incarceration_history(
   Criminal_Code   INTEGER, 
   Jail_Code       INTEGER,
   start_date      DATE  NOT NULL,
   end_date        DATE  NOT NULL, 
   status		   char(100) NOT NULL,
  FOREIGN KEY(Criminal_Code) REFERENCES criminals(Criminal_Code),
  FOREIGN KEY(Jail_Code) REFERENCES jails(Jail_Code)
);

INSERT INTO `Jails` VALUES
 (0,'Manila',12)
,(1,'Makati',39)
,(2,'Taguig',34)
,(3,'Mandaluyong',68)
,(4,'Muntinlupa',1)
,(5,'Quezon',90)
,(6,'Bulacan',33)
,(7,'Laguna',14)
,(8,'Cavite',44)
,(9,'Pasay',15);

INSERT INTO `Criminals` VALUES
 (0,'Kon','Haider',36,8)
,(1,'Por','Attanasova',72,5)
,(2,'Lorea','Moshayedi',24,2)
,(3,'Mockus','Diner',36,2)
,(4,'Raffaella','Smith',36,3)
,(5,'Rebecca','Alavi',36,1)
,(6,'Rusnakova','Schnapp',36,1)
,(7,'Aureo','Piccioli',24,8)
,(8,'Feliks','Vanderhoop',36,7)
,(9,'Ivana','Tassé',36,4)
,(10,'Levesque','Dalton',36,8)
,(11,'Mika','Stark',4,3)
,(12,'Nataliia','Biersack',96,5)
,(13,'Scarlett','Dints',18,6)
,(14,'Solomon','Earl',204,8)
,(15,'Carrie','Hagendorf',36,2)
,(16,'Forfoni','Frese',120,1)
,(17,'Jairo','Saurty',48,2)
,(18,'Milko','Duran',84,8)
,(19,'Riza','Fortini',24,6)
,(20,'Denis','Pett',120,2)
,(21,'Esmeralda','Bibancos',96,4)
,(22,'Gal','Rateau',36,4)
,(23,'Joyce','Tucker',18,4)
,(24,'Ale','Iqbal',60,5)
,(25,'Amdia','Sjoholm',36,6)
,(26,'Blythe','Knetter',9,2)
,(27,'Carolynn','Roderick',9,3)
,(28,'Moises','Cama',30,9)
,(29,'Rolando','Aistars',72,3)
,(30,'Salvador','Bogdanski',36,2)
,(31,'Thanassis','Brillante',36,3)
,(32,'Thorbjoern','Video',216,0)
,(33,'Jaclyn','Torres',12,8)
,(34,'Rosana','Rodrigues',276,6)
,(35,'Shrabya','Schmidt',96,2)
,(36,'April','Horgan',240,3)
,(37,'Germaine','Koloski',36,1)
,(38,'Paul','Schembri',36,1)
,(39,'Talitha','Jellins',24,4)
,(40,'Nisha','Hauser',36,7)
,(41,'Phillip','Mendoza',36,2)
,(42,'Alyx','Paredes',12,8)
,(43,'Barry','Shienbaum',24,0)
,(44,'Brie','Ezratty',36,6)
,(45,'Family','Hill',24,8)
,(46,'Olsen','Edment',36,6)
,(47,'Abogados','Doucet',18,4)
,(48,'Chapman','Nicholson',108,6)
,(49,'Delia','Alexander',36,3)
,(50,'Gopal','Infante',36,3)
,(51,'Hilario','Saleem',18,6)
,(52,'Wheatley','Stzoser',120,3)
,(53,'Cole','Dinn',297,6)
,(54,'Dafni','Harmon',36,4)
,(55,'Jenora','Cirsa',36,1)
,(56,'Nicolle','Ascoe',24,4)
,(57,'Paulin','Pope',24,2)
,(58,'Racquel','Issacs',84,2)
,(59,'Jacko','Rochdi',9,8)
,(60,'Lille','Marchetti',54,3)
,(61,'Yahir','Kundler',36,1)
,(62,'Cristina','Bird',312,3)
,(63,'Leticia','Donald',36,3)
,(64,'Simone','Ashbaugh',24,6)
,(65,'Storm','Seneca',360,2)
,(66,'Adar','Frazer',45,1)
,(67,'Frederic','Sparaco',36,5)
,(68,'Joan','Medina',36,3)
,(69,'Livingston','Boggi',36,8)
,(70,'Osvelia','Manrique',9,5)
,(71,'Camila','Mahley',4,9)
,(72,'Dereck','Della',36,5)
,(73,'Liliya','Byrne',24,5)
,(74,'Luc','Bali',72,8)
,(75,'Moral','Tanner',72,2)
,(76,'Nannette','Scuras',36,8)
,(77,'Rima','Kersten',24,7)
,(78,'Meaghan','Jeyapal',18,5)
,(79,'Sabrina','Budini',36,4)
,(80,'Tayler','Underwood',36,0)
,(81,'Xasmin','Bibr',18,6)
,(82,'Carly','Brown',36,5)
,(83,'Denise','Rincon',18,9)
,(84,'Krawczyk','Danielle',9,8)
,(85,'Lettie','Valdez',36,7)
,(86,'Negin','Steffens',3,8)
,(87,'Sabina','Krantzberg',36,6)
,(88,'Agathe','Becker',36,2)
,(89,'Brittnay','Trueman',78,6)
,(90,'Gwynne','Warner',45,0)
,(91,'Lauren','Messina',36,6)
,(92,'Cezar','Candlish',39,0)
,(93,'Fred','Collins',24,9)
,(94,'Jesper','Driller',60,7)
,(95,'Libi','Aspinwall',36,8)
,(96,'Rasika','Dattilo',60,6)
,(97,'Lila','Mondanaro',36,1)
,(98,'Loni','Giordanengo',36,3)
,(99,'Chiho','Dakhil',48,8)
,(100,'Madeline','Michael',12,4)
,(101,'Nidhi','Barber',36,0)
,(102,'Wilson','Greenberg',36,5)
,(103,'Hadar','Batey',72,1)
,(104,'Iana','Jennie',4,5)
,(105,'Mazariegos','Benidze',45,6)
,(106,'Phung','Espinel',36,3)
,(107,'Ralf','Taibi',45,4)
,(108,'Ruchika','Pelaes',42,7)
,(109,'Tata','Coehn',4,6)
,(110,'Vikki','Yoder',45,6)
,(111,'Malcolm','Monfrecola',24,5)
,(112,'Mayalla','Reserva',24,3)
,(113,'Stefani','Sminoff',96,7)
,(114,'Arleta','Nystrom',28,6)
,(115,'Brad','Javier',36,3)
,(116,'Candyce','Cervera',60,8)
,(117,'Milan','Ranegie',72,1)
,(118,'Bettina','Gooden',36,8)
,(119,'Dhia','Lola',4,0)
,(120,'Geri','Julian',36,9)
,(121,'Gretta','Karr',40,4)
,(122,'Leader','Favalero',18,6)
,(123,'Victorino','Mitchell',24,5)
,(124,'Aaron','Fahy',36,8)
,(125,'Shawn','Spa',36,3)
,(126,'Alexandrea','Alegria',4,5)
,(127,'Antonio','Siegel',180,7)
,(128,'Avila','Estrella',36,2)
,(129,'Blathnaid','Jackintell',36,0)
,(130,'Elaine','Genis',72,1)
,(131,'Jaye','Minionis',12,8)
,(132,'Silk','Shahinfar',36,8)
,(133,'Aruni','Mcdermott',24,7)
,(134,'Dyna','Newborne',72,6)
,(135,'Fani','Villanueva',9,6)
,(136,'Gauthieo','Passarelli',252,3)
,(137,'Micheal','Rothman',24,0)
,(138,'Pearl','Corson',72,6)
,(139,'Raina','Lubrenecki',24,3)
,(140,'Teryl','Mccarthy',96,9)
,(141,'Angie','Ansel',72,6)
,(142,'Barreau','Yam',72,8)
,(143,'Baruch','Chaia',36,4)
,(144,'Gerbert','Boncelet',48,3)
,(145,'Jhony','Piecuch',72,8)
,(146,'Maryam','Gillman',36,7)
,(147,'Milana','Baroni',36,4)
,(148,'Alayne','Menke',36,4)
,(149,'Isac','Julee',36,2)
,(150,'Maitri','Kalach',204,3)
,(151,'Anouk','Harrison',36,1)
,(152,'Dilan','Milea',18,4)
,(153,'Maestro','Pezzotti',36,7)
,(154,'Nagy','Turino',48,3)
,(155,'Allyn','Chinta',42,4)
,(156,'Beach','Traytele',36,2)
,(157,'Bob','Cannestra',36,2)
,(158,'Gabrille','Borenstein',36,4)
,(159,'Hilda','Hansen',45,4)
,(160,'Meir','Buller',9,4)
,(161,'Adele','Theo',30,1)
,(162,'Domenico','Anonymous',9,4)
,(163,'James','Marshall',240,4)
,(164,'Rossana','Bertolino',18,5)
,(165,'Thu','Baldasare',72,7)
,(166,'Debbi','O''Shea',45,5)
,(167,'Lotte','Hoffman',6,5)
,(168,'Saranel','Donovan',36,6)
,(169,'Sibylla','Manny',4,2)
,(170,'Thanh','Halcyon',6,1)
,(171,'Trevor','Alp',36,7)
,(172,'Steven','Lekach',72,7)
,(173,'Amanda','Dass',24,1)
,(174,'Crisanta','Porter',45,6)
,(175,'Mallorie','Irene',144,2)
,(176,'Yev','Hugonot',36,5)
,(177,'Bobby','Gracida',6,4)
,(178,'Chelsy','Elena',24,7)
,(179,'Jacques','Priecel',24,1)
,(180,'Jennifer','Mazariegos',36,6)
,(181,'Kerstens','Melissa''S',36,8)
,(182,'Maryu','Orca',36,7)
,(183,'Vagram','Bausa',36,2)
,(184,'Ekebil','Louis',39,2)
,(185,'Isidoro','Southwell',36,5)
,(186,'Arizona','Catona',36,8)
,(187,'Belgica','Bracamonte',24,6)
,(188,'Campos','Cullinae',240,7)
,(189,'Rhonda','Umhoefer',36,8)
,(190,'Danny','Strack',24,5)
,(191,'Grace','Lorena',36,0)
,(192,'Herman','Zaitz',36,7)
,(193,'Whai','Shingle',9,3)
,(194,'Christophe','Ellis',36,7)
,(195,'Katia','Eichel',36,1)
,(196,'Tahir','Pavan',36,7)
,(197,'Debbie','Herrington',36,7)
,(198,'Giacomo','Grifit',24,6)
,(199,'Kris','Romney',4,5)
,(200,'Meenakshi','Lange',36,3)
,(201,'Tydeman','Holtz',24,7)
,(202,'Dermot','Robertson',36,5)
,(203,'Ewa','Cobrarle',240,7)
,(204,'Giovanni','Herrerra',36,0)
,(205,'Patrick','Zandri',108,6)
,(206,'Ren','Andrea',24,5)
,(207,'Chinitas','Morehouse',24,1)
,(208,'Contenti','Birnbaum',36,4)
,(209,'Ginny','Ospina',96,6)
,(210,'Griffin','Reeser',36,8)
,(211,'Malone','Bedsole',9,0)
,(212,'Monika','Kinglake',36,4)
,(213,'Nedim','Italo',180,8)
,(214,'Piero','Romero',36,7)
,(215,'Briana','Mougenot',24,6)
,(216,'Casandra','Rallo',36,4)
,(217,'Cynthia','Christoph',36,3)
,(218,'Felicity','Thiermann',4,3)
,(219,'Haleh','Mylan',18,5)
,(220,'Hope','Ruotolo.',72,4)
,(221,'Kenneth','Deamoer',6,8)
,(222,'Marty','Milan',36,3)
,(223,'General','Herd',36,2)
,(224,'Janaina','Welch',36,1)
,(225,'Jennie','Kramberg',24,1)
,(226,'Jonas','Abito',246,2)
,(227,'Krystal','Falcone',36,4)
,(228,'Robert','Bayat',18,6)
,(229,'Emilio','Wayne',60,2)
,(230,'Lotus','Marotta',36,3)
,(231,'Shabon','Mutio',36,1)
,(232,'Willian','Claire',60,1)
,(233,'Adriane','Butzer',36,5)
,(234,'Kent','Percasky',54,1)
,(235,'Sitara','Levin',480,6)
,(236,'Amma','Quirk',18,9)
,(237,'Braden','Pearl',36,7)
,(238,'Jayesh','Pueblo',36,5)
,(239,'Mardian','Abaldo',36,5)
,(240,'Nissim','Magana',312,7)
,(241,'Bracelet','Escalante',24,3)
,(242,'Giovana','Cauchi',24,6)
,(243,'Britny','Beli',180,3)
,(244,'Iwona','Edmondson',72,3)
,(245,'Kane','Badillo',48,5)
,(246,'Nicolaios','Macneille',24,1)
,(247,'Prof','Gaedke',60,8)
,(248,'Zuzana','Steen',18,0)
,(249,'Cintia','Decamp',24,9)
,(250,'Coby','Sloofman',36,8)
,(251,'Gizelle','Schwegel',54,4)
,(252,'Grazia','Palma',73,1)
,(253,'Arianna','Mr.',240,5)
,(254,'Corinne','Boundy',36,1)
,(255,'Emery','Tbd',12,6)
,(256,'Gali','Pickett',36,3)
,(257,'Jimena','Rosas',12,8)
,(258,'Kimmi','Giangrasso',60,3)
,(259,'Lucina','Todd',24,6)
,(260,'Robb','Guérette',24,0)
,(261,'Ahmed','Quiñones',72,6)
,(262,'Girish','Kramm',36,5)
,(263,'Lea','Besancon',180,4)
,(264,'Nola','Klopp',36,3)
,(265,'Dray','Mccafferty',204,3)
,(266,'Lorena','Bayardo',24,1)
,(267,'Sybille','Denise',72,7)
,(268,'Vahe','Benitez',36,7)
,(269,'William','Tomasovich',12,7)
,(270,'Canosa','Jefaza',72,8)
,(271,'Carling','Mkay',60,7)
,(272,'Greissy','Erika',204,6)
,(273,'Breton','Jana',24,6)
,(274,'Caroline','Marion',24,3)
,(275,'Entrenadores','Rojas',72,7)
,(276,'Indigo','Alper',36,7)
,(277,'Kavuzlu','Gardner',36,8)
,(278,'Key','Toone',72,5)
,(279,'Marine','Veson',24,6)
,(280,'Reserved','Kassamani',4,4)
,(281,'Alessandro','Brambah',24,8)
,(282,'Courtney','Coco',4,5)
,(283,'Felice','Kemp',36,9)
,(284,'Fernando','Canto',36,1)
,(285,'Puja','Risser',36,7)
,(286,'Zach','Boyd',36,4)
,(287,'Alida','Bellinger',27,2)
,(288,'Basia','Brandon',36,5)
,(289,'Flora','Munoz',36,2)
,(290,'Sue','Elizabeth',36,7)
,(291,'Bellin','Charge',36,6)
,(292,'Kaiden','Shepley',36,0)
,(293,'Luka','Melissa',36,5)
,(294,'Mert','Misener',96,3)
,(295,'Stanley','Elaine',72,6)
,(296,'Joe','Bukhari',72,4)
,(297,'Macarena','Lean',180,4)
,(298,'Selin','Kravchenko',240,0)
,(299,'Holly','Conner',36,8)
,(300,'Jessie','Bloqueo',6,7)
,(301,'Ma.','Friadnar',36,7)
,(302,'Mads','Huot',240,3)
,(303,'Sebastien','Olivera',36,4)
,(304,'Annalee','Guide',45,1)
,(305,'Borka','Schneider',36,6)
,(306,'Fahamu','Perez',36,3)
,(307,'Genaoveva','Finiochetti',36,2)
,(308,'Heidy','Kelleher',180,2)
,(309,'Ducros','Passalacqua',36,6)
,(310,'Maya','Hovananian',84,9)
,(311,'Suraj','Xieveria',36,0)
,(312,'Tiffany','Monroy',36,2)
,(313,'Blockeado','Leonard',276,5)
,(314,'Gill','Bowen',72,3)
,(315,'Nikolaos','Geissler',36,2)
,(316,'Aleshia','Owens',72,6)
,(317,'Clases','Rhoades',72,6)
,(318,'Fellahi','Stuart',36,7)
,(319,'Lauber','Borson',36,9)
,(320,'Alma','Silveira',72,5)
,(321,'Annie','Agin',36,8)
,(322,'Doreen','Alex',24,0)
,(323,'Elisa','Kaye',108,8)
,(324,'Montse','Truscott',36,5)
,(325,'Orry','Andrews',36,1)
,(326,'Shalane','Denglee',216,7)
,(327,'Beverly','Hrycyk',36,6)
,(328,'Keisha','Rieder',258,8)
,(329,'Liseth','Heggle',36,7)
,(330,'Manish','Gratton',60,6)
,(331,'João','Zohrenejad',9,5)
,(332,'Laurence','Mielcarek',72,7)
,(333,'Pernille','Maynard',36,2)
,(334,'Piotr','Pack',24,9)
,(335,'Chong','Salgado',24,2)
,(336,'Niko','Shanon',84,3)
,(337,'Tatiana','Garibay',36,5)
,(338,'Baili','Holme',36,4)
,(339,'Green','Drake',36,8)
,(340,'Juha','Reicherter',36,8)
,(341,'Labedz','Cioffi',36,0)
,(342,'Robinson','Connely',36,2)
,(343,'Roselli','Llano',36,8)
,(344,'Amar','Khanna',6,3)
,(345,'Delphine','Puley',24,1)
,(346,'Felix','Jen',18,8)
,(347,'Janeth','Montoya',45,5)
,(348,'Marguerite','Villaseñor',72,3)
,(349,'Bieta','Kristen',36,6)
,(350,'Cintya','Evens',36,4)
,(351,'Hal','Fandos',6,9)
,(352,'Vicente','Butcher',36,7)
,(353,'Candace','Arnold',18,4)
,(354,'Diana','Coughlin',180,2)
,(355,'Ingvild','Caban',24,6)
,(356,'Kaelin','Marchant',48,3)
,(357,'Lizzie','Kildrow',24,3)
,(358,'Beata','Benegas',6,7)
,(359,'Bleachclub','Olga',40,8)
,(360,'Fdferg','Fernandes',72,5)
,(361,'Graciela','Roy',36,2)
,(362,'Jeniffer','Heiser',54,0)
,(363,'Yamel','Suzuki',18,6)
,(364,'Cori','Ingoglia',4,4)
,(365,'Kennedy','Stock',24,5)
,(366,'Tami','Biondo',36,5)
,(367,'Teri','Feese',72,3)
,(368,'Tulip','Balazs',72,4)
,(369,'Vittorio','Caroline',36,6)
,(370,'Yin','Nottingham',48,1)
,(371,'Gabrielle','Benjamin',36,9)
,(372,'Lee','Caldwell',36,7)
,(373,'Sahle','Gerassimo',36,2)
,(374,'Aracely','Zeitoun',24,1)
,(375,'Daynia','Braga',96,3)
,(376,'Eder','Maclean',36,0)
,(377,'Garrick','Wade',9,1)
,(378,'Ilze','Berdichevskiy',54,2)
,(379,'Martina','Bell',40,2)
,(380,'Rahel','Ducong',24,5)
,(381,'Dennise','Akavova',90,5)
,(382,'Harrison','Jenkins',72,1)
,(383,'Shazia','Hayes',24,8)
,(384,'Vijay','Escudero',36,3)
,(385,'Adamn','Colabianchi',36,9)
,(386,'Kathlenn','Room',36,9)
,(387,'Krauskopf','Chunya',72,8)
,(388,'Massy','Chalmers',36,0)
,(389,'Tal','Streif',36,3)
,(390,'Fabiola','Bryant',240,3)
,(391,'Faris','Quintana',36,1)
,(392,'Julianne','Piere',6,5)
,(393,'Jurgen','Belz',6,2)
,(394,'Katelyn','Booz',240,2)
,(395,'Kori','Mcvey',24,3)
,(396,'Yuval','Olguin',9,3)
,(397,'Kari','Choucri',4,6)
,(398,'Nerijus','Kaminer',36,0)
,(399,'Mandeep','Weinberg',9,4)
,(400,'Modelo','Goya',36,0)
,(401,'Ravi','Espinosa',120,1)
,(402,'Valeri','Pablo',36,4)
,(403,'Armonia','Boxer',18,4)
,(404,'Bradbury','Jean',48,3)
,(405,'Colin','Berse',36,6)
,(406,'Kallie','Opshaug',96,2)
,(407,'Kyle','Praeger',9,8)
,(408,'Remo','Grumhaus',36,5)
,(409,'Chica','Cutwright',36,7)
,(410,'Eliveg','Employee',180,8)
,(411,'Mckayla','Georges',36,8)
,(412,'Monia','Mahuad',36,7)
,(413,'Strom','Cole',36,1)
,(414,'Allesandro','Tolibas',36,2)
,(415,'Candince','Pereira',288,1)
,(416,'Graeme','Galardi',18,3)
,(417,'Koenig','Ait',36,6)
,(418,'Lyndsey','Bagheri',36,5)
,(419,'Ofek','Downer',180,7)
,(420,'Piere','Roberson',60,6)
,(421,'Sharon','Von',24,1)
,(422,'Elsie','Golitz',4,1)
,(423,'Kristin','Rey',3,8)
,(424,'Shireen','Debeer',36,5)
,(425,'Dee','Clabecq',24,3)
,(426,'Stallard','Lagreula',24,4)
,(427,'Sun','Klum',9,2)
,(428,'Class','Rierson',180,7)
,(429,'Instructora','Romboli',36,1)
,(430,'Matthew','Biros',60,6)
,(431,'Palpu','Ryder',24,9)
,(432,'Richarc','Zabel',6,7)
,(433,'Rubem','Monserrat',36,7)
,(434,'Ivona','Giugno',72,0)
,(435,'Alosnos','Rebecca',36,3)
,(436,'Bercy','Cardona',36,3)
,(437,'Bryan','Chris',36,1)
,(438,'Joyanne','Swenson',48,7)
,(439,'Orvin','Benesh',216,2)
,(440,'Carol','Bonnet',276,1)
,(441,'Andrea','Bruhmuller',36,6)
,(442,'Jessey','Cito',36,4)
,(443,'Libbey','Hurley',36,9)
,(444,'Ophira','Gina',36,3)
,(445,'Oswaldo','Mcgrady',36,5)
,(446,'Shelbey','Hau',6,4)
,(447,'Tulik','Walker',81,7)
,(448,'Asusena','Matute',18,4)
,(449,'Jaesoon','Flugal',9,7)
,(450,'Egar','Barksdale',36,7)
,(451,'Fredricson','Beaumont',36,9)
,(452,'Jody','Unter',36,1)
,(453,'Marjolaine','Herrera',96,4)
,(454,'Nitsanne','Raffan',72,1)
,(455,'Catherine','Neuman',24,6)
,(456,'Jodie','Miles',120,1)
,(457,'Ashley','Quesada',9,3)
,(458,'From','Ogilvie',48,0)
,(459,'Karin','Feldenkris',36,7)
,(460,'Kashmir','Grenfell',36,1)
,(461,'Eugenio','Links',9,1)
,(462,'Hajjar','Niedfeldt',12,2)
,(463,'Sr.','Claesson',36,4)
,(464,'Sunny','Raskin',24,3)
,(465,'Test','Hernández',36,8)
,(466,'Ceres','Hold',4,5)
,(467,'Javid','Myklatun',180,3)
,(468,'Whitnee','Albiter',72,0)
,(469,'Zachary','Caballero',36,0)
,(470,'Nalini','Perpar',72,3)
,(471,'Alberto','Krooke',36,4)
,(472,'Eran','Barbé',276,4)
,(473,'Melotti','Hovda',36,7)
,(474,'Belson','Chepe',24,0)
,(475,'Deena','Iversen',36,2)
,(476,'Jeanie','Trabado',36,3)
,(477,'Layne','Ewald',24,1)
,(478,'Mirna','Buckley',18,3)
,(479,'Noa','Malvarosa',72,8)
,(480,'Nosheen','Mccourt',36,8)
,(481,'Sansara','Crenshaw',240,4)
,(482,'Betzy','Casanova',48,4)
,(483,'Iker','Pastor',258,2)
,(484,'Kicki','Bugeau',9,4)
,(485,'Kimberlie','Faircloth',36,6)
,(486,'Marianne','Lack',36,6)
,(487,'Prue','Subbaraman',36,5)
,(488,'Rainer','Arcery',36,1)
,(489,'Tooner','Wren',9,6)
,(490,'Aden','Camara',4,5)
,(491,'Coleen','Gregori',36,8)
,(492,'Greatz','Ahaa',24,6)
,(493,'Zena','Steinz',24,1)
,(494,'Diederik','Coomber',48,5)
,(495,'Diego','Leal',36,7)
,(496,'Flor','Miller',9,2)
,(497,'Pima','Guffey',9,3)
,(498,'Florine','Colwell',36,1)
,(499,'Harold','Mercado',36,6)
,(500,'Philippe','Zacarias',36,4)
,(501,'Cheslea','Goodhart',36,5)
,(502,'Kristine','Deangelis',36,2)
,(503,'Morad','Rude',36,6)
,(504,'Stefanie','Estivalet',36,5)
,(505,'Eliane','Goodis',36,8)
,(506,'Gian','Kennyk',36,6)
,(507,'Tip','Cantú',240,6)
,(508,'Anayeli','Garibo',36,7)
,(509,'Charee','Naime',24,3)
,(510,'Doris','Harrington',36,7)
,(511,'Maeve','Antonio',36,9)
,(512,'Mellissa','Erhard',36,2)
,(513,'Rici','Paine',72,5)
,(514,'Tanner','Shumate',4,1)
,(515,'Teck','Morgenthau',42,0)
,(516,'Elisabetta','Maspes',36,5)
,(517,'Yoana','Schemansky',18,5)
,(518,'Adolfo','Toro',36,6)
,(519,'Alanna','Hugh',60,4)
,(520,'Banelly','Wells',36,2)
,(521,'Irina','Betsy',36,7)
,(522,'Caity','Folberg',96,1)
,(523,'Downing','Grapes',36,8)
,(524,'Suzannah','Nilsson',36,7)
,(525,'Ermicely','Monford',42,2)
,(526,'Pit','Backus',36,8)
,(527,'Bruna','Mamula',36,7)
,(528,'Hannah','Raoult',36,7)
,(529,'Manpreet','Hayhurst',36,7)
,(530,'Trace','Boice',180,9)
,(531,'Alejandro','Bowser',36,5)
,(532,'Anthea','David',18,3)
,(533,'Geckos','Vanburen',60,5)
,(534,'Ivin','Second',36,5)
,(535,'Nomi','Mccabe',240,4)
,(536,'Enrique','Morse',36,0)
,(537,'Estin','Acairol',18,6)
,(538,'Jana','Marzuki',36,4)
,(539,'Laura/Bryan','Casasola',36,2)
,(540,'Makuin','Jamieson',36,9)
,(541,'Roger','Duff',9,7)
,(542,'Romualdo','Klish',45,2)
,(543,'Thue','Cerbone',36,4)
,(544,'Maura','Mcdole',36,0)
,(545,'Osborn','Faulkner',36,8)
,(546,'Ryanne','Naylor',180,7)
,(547,'Tolin','Mawer',6,6)
,(548,'Demetri','Weber',36,6)
,(549,'Fatima','Basilio',36,5)
,(550,'Lomelin','Carter',36,9)
,(551,'Lucas','Hayward',9,6)
,(552,'Via','Mackenzie',36,4)
,(553,'Cheyenne','Samantha',36,0)
,(554,'Maryanne','Perlin',36,6)
,(555,'Ernest','Alanis',36,6)
,(556,'Eunhee','Troisi',36,6)
,(557,'Gina','Castellano',36,6)
,(558,'Leo','Raquel',36,3)
,(559,'Nahid','Silver',18,5)
,(560,'Owen','Grubb',6,1)
,(561,'Thalia','Valdivia',36,5)
,(562,'Ilhan','Louisa',36,7)
,(563,'Ishtar','Rattenbury',42,7)
,(564,'Juliet','Paulo',72,1)
,(565,'Vesi','Hindsley',36,4)
,(566,'Josua','Biddlecombe',36,6)
,(567,'Testing','Kaiser',12,0)
,(568,'Joana','Ahner',36,6)
,(569,'Katrina','Tobiasen',36,7)
,(570,'Linus','Marinos',18,6)
,(571,'Sjoerd','Viu',36,3)
,(572,'Vinita','Rouhani',96,3)
,(573,'Bowen','Valentina',27,2)
,(574,'Carla','Coronado',24,8)
,(575,'Charlene','Yun',36,6)
,(576,'Martinat','Chaparro',24,2)
,(577,'Sophia','Tavares',36,3)
,(578,'Claire','Keegan',96,4)
,(579,'Mauro','Ortquist',180,4)
,(580,'Alisa','Haimo',36,5)
,(581,'Attree','Behr',9,8)
,(582,'Edith','Barshan',204,4)
,(583,'Jaynee','Ellison',3,8)
,(584,'Lorraine','Nightingale',24,5)
,(585,'Restaurant','Saluja',24,4)
,(586,'Tootsie','Cristina',36,3)
,(587,'Moore','Ciminelli',84,8)
,(588,'Velina','Scholfield',36,3)
,(589,'Blocked','Mako',36,3)
,(590,'Paco','Jensen',18,8)
,(591,'Gert','Donde',36,5)
,(592,'Shigei','Millner',36,1)
,(593,'Zack','Samsara',72,0)
,(594,'Estelle','Shorr',54,6)
,(595,'Ferdinando','Wung',36,5)
,(596,'Oscar','Goergen',36,4)
,(597,'Yury','Massicot',6,3)
,(598,'Barbro','Soltero',60,7)
,(599,'Daniels','Tinyo',96,3)
,(600,'Sherri','Gold',36,6)
,(601,'Abbie','Rizo',6,8)
,(602,'Ileana','Borock',36,4)
,(603,'Luciana','Alama',72,4)
,(604,'Genesis','Laufer',9,0)
,(605,'Stefana','Eden',216,1)
,(606,'Whitney','Goodloe',36,2)
,(607,'Shayna','Corrales',36,4)
,(608,'Usiel','Tba',18,9)
,(609,'Leann','Claypool',36,8)
,(610,'Amigos','Lasting',48,2)
,(611,'Cara','Mccambly',18,3)
,(612,'Danna','Moscatelli',24,5)
,(613,'Heidi','Kanowsky',24,4)
,(614,'Kellen','Viviana',36,3)
,(615,'Orysia','Billingsley',48,7)
,(616,'Richardson','Burg',48,4)
,(617,'Azalea','Gaxiola',36,5)
,(618,'Lychota','Warat',36,8)
,(619,'Margit','Margron',36,8)
,(620,'Reem','Marimar',45,1)
,(621,'Caren','O''Hare',60,6)
,(622,'Jacylyn','Lehman',60,5)
,(623,'Huesped','Gastelum',9,7)
,(624,'Kitzberger','Stronberg',54,2)
,(625,'Sara','Frianela',36,3)
,(626,'Guillem','Vendruscolo',36,7)
,(627,'Martinez','Encargada',180,7)
,(628,'Mckenna','Carrera',3,9)
,(629,'Srisakuna','Ivanna',36,8)
,(630,'Victoria','Miner',36,3)
,(631,'Conrado','Perrina',24,3)
,(632,'Ernesto','Alvarado',72,0)
,(633,'Iris','Youelles',6,4)
,(634,'Reparacion','Lindemann',36,9)
,(635,'Cayetana','Assistant',18,6)
,(636,'Devara','Lachance',36,6)
,(637,'Parrish','Walter',24,9)
,(638,'Veida','Rimer',36,6)
,(639,'Consuelo','Frauen',18,8)
,(640,'Joleen','Mather',36,8)
,(641,'Roisin','Paquette',24,1)
,(642,'Crowley','Pulido',12,6)
,(643,'Faysal','Crager',36,4)
,(644,'Leonard','Fauvain',36,4)
,(645,'Carin','Eiseman',9,4)
,(646,'Halleh','Bailliu',36,3)
,(647,'Noemi','Whiteside',9,1)
,(648,'Servaes','Durand',18,8)
,(649,'Yuvi','Szablowska',24,1)
,(650,'Alice','Senn',96,3)
,(651,'Asha','Hanners',12,5)
,(652,'Chenin','Megan',9,4)
,(653,'Fisher','Berezdivin',60,1)
,(654,'Honor','Mejilla',60,6)
,(655,'Jarrod','Salinas',36,1)
,(656,'Nalleli','Pertler',36,1)
,(657,'Philip','Wright',18,0)
,(658,'Hocking','Elaco',180,3)
,(659,'Hunt','Alcapone',180,2)
,(660,'Kerri','Hui',36,3)
,(661,'Silva','Muir',36,4)
,(662,'Dora','Laing',36,2)
,(663,'Elhassan','Sowter',36,1)
,(664,'Layton','Olivares',36,7)
,(665,'Romain','Hegeler',264,6)
,(666,'Glynn','Anna',4,8)
,(667,'Irfan','Venegas',48,5)
,(668,'Janette','Sarlo',36,0)
,(669,'Rupa','Olaru',9,1)
,(670,'Yohara','Halenda',36,6)
,(671,'Yvan','Richards',36,2)
,(672,'Anibal','Zambrano',9,1)
,(673,'Dilshad','Whitehead',36,4)
,(674,'Liliana','Scarnatto',36,7)
,(675,'Nikki','Evelyn',57,2)
,(676,'Tasiopoulos','Carlos',36,6)
,(677,'Brigid','Landy',36,5)
,(678,'Ginger','Jagust',72,3)
,(679,'Jacinta','Kaminski',9,2)
,(680,'Jaques','Charters',24,8)
,(681,'Marin','Lund',36,7)
,(682,'Newguest','Fuller',36,5)
,(683,'Lorri','Norris',54,0)
,(684,'Mariya','Castanares',36,1)
,(685,'Ramchandra','Heimann',24,3)
,(686,'Raquel','Contador',48,5)
,(687,'Second','Onieal',72,7)
,(688,'Visitor','Josey',36,2)
,(689,'Daskey','Beddingfield',36,3)
,(690,'Gery','Jessie',36,3)
,(691,'Nanan','Roth',36,3)
,(692,'Aleta','Lacy',36,1)
,(693,'Lauryn','Connolly',36,1)
,(694,'Maryblair','Bowers',9,6)
,(695,'Nicolette','Madrini',54,5)
,(696,'Pasquale','Lefrock',6,8)
,(697,'Rafael','Ditomasso',66,2)
,(698,'Seb','Ashmore',6,1)
,(699,'Shar','Banks',48,1)
,(700,'Sokphea','Katrina',36,5)
,(701,'Evaristo','Pummer',72,7)
,(702,'Maree','Peleg',9,1)
,(703,'Meddings','Schwabsky',36,4)
,(704,'Shana','Llse',4,2)
,(705,'Dhana','Norris.',60,9)
,(706,'Ramandeep','Cuatro',36,8)
,(707,'Perihan','Long',36,8)
,(708,'Pouneh','Gulisano',18,6)
,(709,'Viaventure','Sandro',36,6)
,(710,'Vit','Nogales',36,4)
,(711,'Watson','Staff',60,3)
,(712,'Zuleica','Nourish',24,0)
,(713,'Erinn','Lin',24,4)
,(714,'Anne','Romeu',24,1)
,(715,'Barrow','Husar',36,2)
,(716,'Brenna','Vides',24,4)
,(717,'Jamison','Nottle',84,6)
,(718,'Margarita','Callaway',180,2)
,(719,'Saba','Dipalma',36,3)
,(720,'Selina','Mayotte',72,3)
,(721,'Shira','Heap',36,3)
,(722,'Bashi','Spence',48,1)
,(723,'Joelle','Jaffe',36,2)
,(724,'Maria','Butler',9,2)
,(725,'Spike','Baeza',36,3)
,(726,'Amyjo','Maksoud',36,3)
,(727,'Jane','Alger',36,4)
,(728,'Brehan','Kavanaugh',24,4)
,(729,'Britt','Bina',36,7)
,(730,'Kathalina','Kircalioglu',36,5)
,(731,'Omar','Ekholm',36,5)
,(732,'Rangel','Kravis',18,3)
,(733,'Retreat','Gaucher',18,6)
,(734,'Shanna','Staedeli',36,4)
,(735,'Body','Parke',18,2)
,(736,'Efrain','Urtiaga',36,7)
,(737,'Halkan','Bloggs',36,2)
,(738,'Kortney','Shimono',12,0)
,(739,'Marien','Bennoune',36,2)
,(740,'Freya','Mohammad',60,8)
,(741,'Lizet','Corona',24,8)
,(742,'Melissa','Welsh',108,1)
,(743,'Paulette','Con',240,7)
,(744,'Photo','Doherty',18,8)
,(745,'Aki','Hearn',36,7)
,(746,'Cloud','Galsky',72,7)
,(747,'Idit','Indigo',180,8)
,(748,'Kimberlee','Webster',36,7)
,(749,'Lenavitt','Wilks',24,8)
,(750,'Tobie','Cochrane',36,1)
,(751,'Warneke','Bock',24,2)
,(752,'Dallard','Hueber',9,2)
,(753,'Dar','Fitschen',36,6)
,(754,'Jimmy','Charles',96,6)
,(755,'Kotler','Callahan',76,1)
,(756,'Lian','Beachclub',21,5)
,(757,'Meg','Olan',36,7)
,(758,'Mikayla','Hamingway',9,6)
,(759,'Audrey','Sivalon',9,1)
,(760,'Cathleen','Trentalancia',36,4)
,(761,'Leini','Henriquez',36,6)
,(762,'Sireesha','Henley',18,4)
,(763,'Bahman','Girffiths',4,3)
,(764,'Fillipo','Portocarrero',45,4)
,(765,'Henrietta','Rezanour',18,1)
,(766,'Jamil','Kramer',36,6)
,(767,'Pawluk','Dimas',36,4)
,(768,'Seamus','Brock',84,4)
,(769,'Dastgiri','Boulos',36,6)
,(770,'Ferreyra','Carey',72,7)
,(771,'Jay','Zoe',36,2)
,(772,'Mareen','Ciconte',3,7)
,(773,'Morgan','Cofinas',192,0)
,(774,'Satin','Alan',36,1)
,(775,'Vainius','Dineen',36,5)
,(776,'Venta','Lohrer',96,4)
,(777,'Atsuko','Rivera',9,7)
,(778,'Del','Pattanyus',36,6)
,(779,'Ivon','Tufino',192,6)
,(780,'Phoebe','Bergstein',48,3)
,(781,'Reza','Belinda',6,3)
,(782,'Savanna','Peyser',108,5)
,(783,'Alna','Adrian',33,2)
,(784,'Jadyn','Thalji',120,6)
,(785,'Lindsay','Hudgins',36,4)
,(786,'Homero','Hunt',72,4)
,(787,'Rayco','Mccarell',54,6)
,(788,'Brandon','Chedikian',36,2)
,(789,'Hend','Lucille',36,7)
,(790,'Ivonne','Sanders',24,0)
,(791,'Lluvia','Damas',24,2)
,(792,'Malik','Goebl',36,8)
,(793,'Otilia','Powell',24,5)
,(794,'Richika','Johnston',72,1)
,(795,'Tba','Ahrens',24,6)
,(796,'Almadelia','Stein',24,1)
,(797,'Poonam','Sfakianos',36,2)
,(798,'Mark','Cohen',36,3)
,(799,'Venus','Villeneuve',249,4);

INSERT INTO `Officers` VALUES
(0,'Vivian','Murray',1,'2020-03-15','T'),
(1,'Vanessa','Moore',3,'2021-06-22','T'),
(2,'Leonardo','Foster',2,'2022-11-07','T'),
(3,'Violet','Crawford',0,'2023-01-19','T'),
(4,'Reid','Perkins',2,'2024-05-30','T'),
(5,'Maya','Thompson',NULL,'2020-09-12','F'),
(6,'Heather','Smith',3,'2021-04-05','T'),
(7,'Tara','Cooper',0,'2022-08-14','T'),
(8,'John','Roberts',7,'2023-12-01','T'),
(9,'Tyler','Scott',2,'2024-02-20','T'),
(10,'Abigail','Howard',1,'2020-11-11','T'),
(11,'Ted','Warren',5,'2021-07-25','T'),
(12,'Darcy','Harris',NULL,'2022-03-30','F'),
(13,'Adelaide','Cunningham',4,'2023-10-06','T'),
(14,'Bruce','Murray',7,'2024-05-15','T'),
(15,'Freddie','Johnson',0,'2020-06-18','T'),
(16,'Jacob','Payne',4,'2021-12-09','T'),
(17,'Jenna','Holmes',0,'2022-01-22','T'),
(18,'Isabella','Hawkins',4,'2023-07-11','T'),
(19,'Adrian','Tucker',1,'2024-04-04','T'),
(20,'Daniel','Evans',3,'2020-08-28','T'),
(21,'Paige','Parker',5,'2021-05-02','T'),
(22,'Darcy','Turner',9,'2022-09-29','T'),
(23,'Kelsey','Stewart',NULL,'2023-11-03','F'),
(24,'Julian','Davis',5,'2024-02-11','T'),
(25,'Kimberly','Holmes',7,'2020-03-21','T'),
(26,'Lenny','Morris',9,'2021-06-30','T'),
(27,'John','Johnston',0,'2022-10-17','T'),
(28,'Maria','Harrison',2,'2023-04-23','T'),
(29,'Brooke','Smith',8,'2024-12-05','T'),
(30,'Caroline','Hunt',7,'2020-01-14','T'),
(31,'Lucy','Sullivan',4,'2021-02-25','T'),
(32,'Sophia','Miller',3,'2022-07-09','T'),
(33,'Aiden','Adams',4,'2023-03-18','T'),
(34,'Aiden','Holmes',9,'2024-08-12','T'),
(35,'James','Martin',3,'2020-05-15','T'),
(36,'Ryan','Tucker',7,'2021-09-04','T'),
(37,'Emily','Morgan',0,'2022-11-29','T'),
(38,'Gianna','Campbell',7,'2023-06-13','T'),
(39,'Dominik','Ryan',9,'2024-10-22','T'),
(40,'Alexander','Morrison',3,'2020-12-30','T'),
(41,'Richard','Montgomery',3,'2021-01-08','T'),
(42,'Violet','Murphy',6,'2022-04-26','T'),
(43,'Alina','Stewart',NULL,'2023-08-11','F'),
(44,'Adam','Stewart',1,'2024-02-14','T'),
(45,'Antony','Baker',7,'2020-09-19','T'),
(46,'Adelaide','Mitchell',7,'2021-03-24','T'),
(47,'Arnold','Gray',7,'2022-06-07','T'),
(48,'Rosie','Smith',0,'2020-01-15','T'),
(49,'Carina','Crawford',3,'2021-03-22','T'),
(50,'Lenny','Scott',3,'2022-06-18','T'),
(51,'Natalie','Watson',0,'2023-09-11','T'),
(52,'Alen','Casey',3,'2024-02-28','T'),
(53,'Kristian','Montgomery',8,'2020-07-24','T'),
(54,'Bruce','Murphy',8,'2021-11-22','T'),
(55,'Frederick','Cole',1,'2022-10-23','T'),
(56,'Charlie','Taylor',9,'2023-05-19','T'),
(57,'Daniel','Smith',3,'2024-04-29','T'),
(58,'Henry','Ellis',4,'2020-08-22','T'),
(59,'Olivia','Martin',9,'2021-12-25','T'),
(60,'Alina','Henderson',4,'2022-03-27','T'),
(61,'Sawyer','Harris',7,'2023-01-09','T'),
(62,'Vanessa','Thomas',7,'2024-06-15','T'),
(63,'Chester','Foster',5,'2020-02-06','T'),
(64,'Sabrina','Farrell',8,'2021-04-12','T'),
(65,'Cadie','Martin',8,'2022-05-30','T'),
(66,'Melanie','Kelly',0,'2023-07-11','T'),
(67,'Valeria','Elliott',8,'2024-09-07','T'),
(68,'Eleanor','Douglas',4,'2020-10-29','T'),
(69,'Arianna','Nelson',9,'2021-11-18','T'),
(70,'Rafael','Robinson',1,'2022-12-13','T'),
(71,'Sam','Campbell',9,'2023-03-20','T'),
(72,'Brooke','Taylor',7,'2024-08-12','T'),
(73,'Abigail','Perkins',1,'2020-01-11','T'),
(74,'Sam','Russell',5,'2021-02-28','T'),
(75,'Chester','Reed',1,'2022-04-12','T'),
(76,'Ashton','Craig',1,'2023-05-27','T'),
(77,'Catherine','Owens',3,'2024-06-01','T'),
(78,'Victoria','Elliott',0,'2020-07-25','T'),
(79,'Evelyn','Campbell',9,'2021-08-07','T'),
(80,'Lydia','Thompson',2,'2022-09-14','T'),
(81,'Aldus','Hunt',7,'2023-10-03','T'),
(82,'Ted','Turner',6,'2024-11-04','T'),
(83,'Vivian','Dixon',5,'2020-12-25','T'),
(84,'Lydia','Smith',4,'2021-01-13','T'),
(85,'Jordan','Davis',6,'2022-02-21','T'),
(86,'Brooke','Reed',7,'2023-03-30','T'),
(87,'Kristian','Scott',3,'2024-04-11','T'),
(88,'Gianna','Farrell',1,'2020-05-22','T'),
(89,'Spike','Kelley',7,'2021-06-16','T'),
(90,'Tiana','Turner',0,'2022-07-11','T'),
(91,'Derek','Turner',7,'2023-08-27','T'),
(92,'Dexter','Rogers',3,'2024-09-02','T'),
(93,'Amy','Cole',3,'2020-10-23','T'),
(94,'Edgar','Higgins',3,'2021-11-10','T'),
(95,'Alen','Williams',6,'2022-12-20','T'),
(96,'Daniel','Roberts',2,'2023-01-08','T'),
(97,'Isabella','Higgins',3,'2020-01-26','T'),
(98,'Stella','Morgan',0,'2021-02-04','T'),
(99,'Robert','Morris',6,'2022-03-02','T'),
(100,'Oliver','Grant',6,'2023-04-05','T'),
(101,'Sydney','Morris',1,'2024-05-29','T'),
(102,'Joyce','Andrews',5,'2020-06-15','T'),
(103,'Alina','Johnston',0,'2021-07-05','T'),
(104,'Rafael','Sullivan',8,'2022-08-20','T'),
(105,'Ryan','Cameron',8,'2023-09-03','T'),
(106,'Camila','Stewart',4,'2024-10-15','T'),
(107,'Carlos','Fowler',0,'2020-11-29','T'),
(108,'Daryl','Kelley',9,'2021-12-28','T'),
(109,'Gianna','Casey',1,'2022-01-03','T'),
(110,'Jordan','Stevens',4,'2023-02-10','T'),
(111,'Frederick','Alexander',5,'2024-03-09','T'),
(112,'William','Montgomery',7,'2020-04-19','T'),
(113,'Catherine','Cooper',4,'2021-05-26','T'),
(114,'Emily','Lloyd',7,'2022-06-23','T'),
(115,'Leonardo','Grant',8,'2023-07-30','T'),
(116,'Jack','Sullivan',3,'2024-08-18','T'),
(117,'Valeria','Kelley',5,'2020-09-22','T'),
(118,'Ashton','Wells',4,'2021-10-11','T'),
(119,'Rafael','Gray',7,'2022-11-21','T'),
(120,'Daryl','Davis',9,'2023-12-09','T'),
(121,'Amber','Smith',6,'2024-01-04','T'),
(122,'Ashton','Williams',4,'2020-02-26','T'),
(123,'Maddie','Crawford',2,'2021-03-15','T'),
(124,'Oliver','Alexander',7,'2022-04-13','T'),
(125,'Robert','Douglas',5,'2023-05-30','T'),
(126,'Dale','Grant',9,'2024-06-12','T'),
(127,'Eric','Rogers',8,'2020-07-16','T'),
(128,'Adison','Johnson',5,'2021-08-20','T'),
(129,'Lily','Mason',9,'2022-09-14','T'),
(130,'Daryl','Smith',6,'2023-10-08','T'),
(131,'Miller','Stewart',2,'2024-11-02','T'),
(132,'Ned','Taylor',7,'2020-12-22','T'),
(133,'Kellan','Payne',2,'2021-01-14','T'),
(134,'Dainton','Davis',8,'2022-02-20','T'),
(135,'Maria','Crawford',3,'2023-03-16','T'),
(136,'Marcus','Holmes',1,'2024-04-06','T'),
(137,'Catherine','Watson',0,'2020-05-29','T'),
(138,'Melanie','Cameron',8,'2021-06-18','T'),
(139,'Richard','Henderson',7,'2022-07-19','T'),
(140,'William','Scott',1,'2023-08-22','T'),
(141,'Ted','Riley',5,'2024-09-17','T'),
(142,'Valeria','Davis',5,'2020-10-01','T'),
(143,'Harold','Ferguson',3,'2021-11-12','T'),
(144,'Clark','Smith',6,'2022-12-14','T'),
(145,'Lydia','Payne',6,'2023-01-10','T'),
(146,'Eddy','Ryan',5,'2024-02-05','T'),
(147,'Chelsea','Harris',2,'2020-01-12','T'),
(148,'Anna','Richards',7,'2021-02-14','T'),
(149,'Maddie','Elliott',9,'2022-03-30','T'),
(150,'Paul','Allen',9,'2023-04-18','T'),
(151,'Andrew','Hawkins',8,'2024-05-14','T'),
(152,'Dominik','Douglas',4,'2020-06-11','T'),
(153,'Rosie','Davis',7,'2021-07-10','T'),
(154,'Ashton','Richardson',7,'2022-08-16','T'),
(155,'Lyndon','Owens',9,'2023-09-11','T'),
(156,'Maddie','Chapman',6,'2024-10-17','T'),
(157,'Maya','Payne',4,'2020-11-27','T'),
(158,'Savana','Reed',4,'2021-12-05','T'),
(159,'Aldus','Allen',6,'2022-01-12','T'),
(160,'Ryan','Hawkins',2,'2023-02-17','T'),
(161,'Elian','Taylor',1,'2024-03-27','T'),
(162,'Deanna','Craig',6,'2020-04-26','T'),
(163,'Connie','Walker',9,'2021-05-19','T'),
(164,'Lucia','Scott',9,'2022-06-07','T'),
(165,'Tiana','Wells',3,'2023-07-27','T'),
(166,'Gianna','Murphy',4,'2024-08-09','T'),
(167,'Lydia','Brooks',8,'2020-09-29','T'),
(168,'Ellia','Williams',4,'2021-10-11','T'),
(169,'Vincent','Allen',3,'2022-11-02','T'),
(170,'Miley','Perry',0,'2023-12-21','T'),
(171,'Victor','Wells',6,'2024-01-21','T'),
(172,'William','Howard',5,'2020-02-16','T'),
(173,'Jack','Hall',7,'2021-03-17','T'),
(174,'Nicole','Johnson',3,'2022-04-17','T'),
(175,'Alissa','Cunningham',2,'2023-05-05','T'),
(176,'Edwin','Cameron',2,'2024-06-17','T'),
(177,'Max','Ryan',9,'2020-07-11','T'),
(178,'Marcus','Richardson',6,'2021-08-10','T'),
(179,'Roland','Murphy',5,'2022-09-24','T'),
(180,'Samantha','Thompson',5,'2023-10-23','T'),
(181,'Lucas','Brooks',6,'2024-11-30','T'),
(182,'Kimberly','Howard',1,'2020-12-07','T'),
(183,'Garry','Taylor',1,'2021-01-21','T'),
(184,'Adrianna','Jones',1,'2022-02-27','T'),
(185,'Roman','Murray',0,'2023-03-24','T'),
(186,'Roman','Thompson',5,'2024-04-24','T'),
(187,'Reid','Morris',7,'2020-05-03','T'),
(188,'Alexia','Hamilton',0,'2021-06-05','T'),
(189,'Sofia','Carter',9,'2022-07-14','T'),
(190,'Alina','Myers',2,'2023-08-23','T'),
(191,'Connie','Spencer',9,'2024-09-10','T'),
(192,'Olivia','Parker',1,'2020-10-24','T'),
(193,'Eddy','Miller',3,'2021-11-10','T'),
(194,'Edgar','Hunt',7,'2022-12-15','T'),
(195,'Arthur','Evans',4,'2023-01-08','T'),
(196,'Violet','Morgan',7,'2024-02-10','T'),
(197,'Amber','Allen',6,'2020-01-03','T'),
(198,'Antony','Armstrong',2,'2021-02-07','T'),
(199,'Miley','Russell',8,'2022-03-26','T'),
(200,'Ryan','Warren',8,'2023-04-19','T'),
(201,'Reid','Morrison',9,'2024-05-10','T'),
(202,'James','Crawford',0,'2020-06-01','T'),
(203,'Audrey','Allen',8,'2021-07-01','T'),
(204,'Vincent','Craig',9,'2022-08-30','T'),
(205,'David','Mason',6,'2023-09-03','T'),
(206,'Audrey','Robinson',8,'2024-10-25','T'),
(207,'Amy','Brown',8,'2020-11-11','T'),
(208,'Belinda','Ellis',1,'2021-12-30','T'),
(209,'Annabella','Adams',6,'2022-01-20','T'),
(210,'Aida','Ferguson',1,'2023-02-03','T'),
(211,'Eric','Perry',6,'2024-03-19','T'),
(212,'Abigail','Adams',8,'2020-04-13','T'),
(213,'Kristian','Perry',6,'2021-05-30','T'),
(214,'Roland','Douglas',2,'2022-06-03','T'),
(215,'Edward','Tucker',8,'2023-07-27','T'),
(216,'Agata','Parker',0,'2024-08-23','T'),
(217,'Camila','Watson',8,'2020-09-01','T'),
(218,'Alan','Myers',0,'2021-10-05','T'),
(219,'Michelle','Gibson',6,'2022-11-21','T'),
(220,'Alfred','Hall',4,'2023-12-05','T'),
(221,'Alissa','Morris',0,'2024-01-04','T'),
(222,'Eleanor','Chapman',2,'2020-02-24','T'),
(223,'Jacob','Cunningham',2,'2021-03-01','T'),
(224,'Charlie','Gibson',2,'2022-04-02','T'),
(225,'Ashton','Wright',4,'2023-05-06','T'),
(226,'Melissa','Roberts',2,'2024-06-08','T'),
(227,'Marcus','Kelly',4,'2020-07-07','T'),
(228,'Adison','Mitchell',7,'2021-08-15','T'),
(229,'Oliver','Martin',0,'2022-09-15','T'),
(230,'Heather','Phillips',8,'2023-10-21','T'),
(231,'Max','Henderson',8,'2024-11-03','T'),
(232,'Tony','Lloyd',3,'2020-12-03','T'),
(233,'Darcy','Morgan',2,'2021-01-04','T'),
(234,'Joyce','Armstrong',1,'2022-02-01','T'),
(235,'Paul','West',3,'2023-03-26','T'),
(236,'Steven','Thomas',8,'2024-04-25','T'),
(237,'Henry','Evans',6,'2020-05-27','T'),
(238,'Tiana','Thomas',0,'2021-06-23','T'),
(239,'Jenna','Casey',2,'2020-01-23','T'),
(240,'Lucia','Brown',9,'2021-02-19','T'),
(241,'Carina','Campbell',5,'2022-03-04','T'),
(242,'Bruce','Morrison',5,'2023-04-17','T'),
(243,'Kevin','Brown',7,'2024-05-03','T'),
(244,'Stuart','Andrews',7,'2020-06-14','T'),
(245,'Mike','Stevens',5,'2021-07-22','T'),
(246,'Elian','Montgomery',6,'2022-08-09','T'),
(247,'Vivian','Gibson',8,'2023-09-17','T'),
(248,'Deanna','Holmes',2,'2024-10-18','T'),
(249,'Spike','Wright',5,'2020-11-01','T'),
(250,'Brianna','Crawford',8,'2021-12-03','T'),
(251,'Andrew','Reed',6,'2022-01-29','T'),
(252,'Aldus','Murray',5,'2023-02-01','T'),
(253,'Emily','Richards',8,'2024-03-03','T'),
(254,'Agata','Roberts',6,'2020-04-11','T'),
(255,'Jessica','Carter',6,'2021-05-20','T'),
(256,'Sabrina','Morrison',1,'2022-06-24','T'),
(257,'Victoria','Moore',5,'2023-07-13','T'),
(258,'Lana','Johnson',2,'2024-08-17','T'),
(259,'Walter','Scott',5,'2020-09-24','T'),
(260,'Albert','Johnson',3,'2021-10-01','T'),
(261,'Melissa','Craig',4,'2022-11-02','T'),
(262,'Annabella','Rogers',4,'2023-12-23','T'),
(263,'Kelvin','Cooper',0,'2024-01-12','T'),
(264,'Paul','Martin',7,'2020-02-17','T'),
(265,'Honey','Johnson',5,'2021-03-17','T'),
(266,'Annabella','Owens',6,'2022-04-04','T'),
(267,'Elise','Anderson',0,'2023-05-20','T'),
(268,'Adam','Hill',9,'2024-06-16','T'),
(269,'Owen','Nelson',9,'2020-07-09','T'),
(270,'Robert','Wells',4,'2021-08-13','T'),
(271,'Elise','Evans',8,'2022-09-20','T'),
(272,'Myra','Sullivan',5,'2023-10-27','T'),
(273,'Oscar','Henderson',9,'2024-11-07','T'),
(274,'Rebecca','Roberts',1,'2020-12-21','T'),
(275,'Melissa','Kelley',9,'2021-01-03','T'),
(276,'Gianna','Payne',3,'2022-02-01','T'),
(277,'Brooke','Ryan',5,'2023-03-09','T'),
(278,'Camila','Spencer',3,'2024-04-10','T'),
(279,'Aida','Hill',4,'2020-05-23','T'),
(280,'Alford','Dixon',7,'2021-06-12','T'),
(281,'Kevin','West',3,'2022-07-25','T'),
(282,'Daisy','Kelly',7,'2023-08-14','T'),
(283,'Alissa','Tucker',2,'2024-09-01','T'),
(284,'Kelsey','Alexander',2,'2020-10-29','T'),
(285,'Nicholas','Payne',3,'2021-11-11','T'),
(286,'Tony','Rogers',7,'2022-12-24','T'),
(287,'Edith','Cooper',0,'2023-01-06','T'),
(288,'Cherry','Johnston',7,'2024-02-27','T'),
(289,'Belinda','Barrett',6,'2020-01-03','T'),
(290,'Aston','Farrell',9,'2021-02-23','T'),
(291,'Daisy','Harris',1,'2022-03-11','T'),
(292,'Edith','Hamilton',0,'2023-04-08','T'),
(293,'Sofia','Henderson',4,'2024-05-14','T'),
(294,'Leonardo','Mitchell',1,'2020-06-11','T'),
(295,'Wilson','Roberts',3,'2021-07-07','T'),
(296,'Daisy','Casey',5,'2022-08-12','T'),
(297,'Vincent','Payne',2,'2023-09-12','T'),
(298,'Eleanor','Cole',8,'2024-10-27','T'),
(299,'Henry','West',6,'2020-11-24','T');

INSERT INTO `Crimes` VALUES
 (0,'VEHICLE - STOLEN',4,'03/01/2020 12:00:00 AM',24,198)
,(1,'BURGLARY FROM VEHICLE',201,'02/08/2020 12:00:00 AM',9,783)
,(2,'BIKE - STOLEN',132,'11/04/2020 12:00:00 AM',4,104)
,(3,'SHOPLIFTING-GRAND THEFT ($950.01 & OVER)',151,'03/10/2020 12:00:00 AM',24,426)
,(4,'THEFT OF IDENTITY',222,'08/17/2020 12:00:00 AM',36,730)
,(5,'THEFT OF IDENTITY',158,'12/01/2020 12:00:00 AM',36,402)
,(6,'THEFT OF IDENTITY',231,'07/03/2020 12:00:00 AM',36,433)
,(7,'THEFT OF IDENTITY',181,'05/12/2020 12:00:00 AM',36,520)
,(8,'THEFT OF IDENTITY',27,'12/09/2020 12:00:00 AM',36,671)
,(9,'BATTERY - SIMPLE ASSAULT',132,'12/31/2020 12:00:00 AM',9,652)
,(10,'THEFT OF IDENTITY',30,'07/01/2020 12:00:00 AM',36,770)
,(11,'SODOMY/SEXUAL CONTACT B/W PENIS OF ONE PERS TO ANUS OTH',101,'10/01/2020 12:00:00 AM',96,113)
,(12,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',269,'02/01/2020 12:00:00 AM',180,779)
,(13,'VEHICLE - STOLEN',250,'11/01/2020 12:00:00 AM',24,225)
,(14,'THEFT OF IDENTITY',16,'02/02/2020 12:00:00 AM',36,140)
,(15,'THEFT OF IDENTITY',185,'07/01/2020 12:00:00 AM',36,668)
,(16,'THEFT OF IDENTITY',206,'01/09/2020 12:00:00 AM',36,275)
,(17,'ASSAULT WITH DEADLY WEAPON, AGGRAVATED ASSAULT',173,'11/27/2020 12:00:00 AM',48,615)
,(18,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',45,'01/01/2020 12:00:00 AM',18,657)
,(19,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',198,'02/11/2020 12:00:00 AM',24,458)
,(20,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',175,'01/01/2020 12:00:00 AM',24,271)
,(21,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',154,'03/15/2020 12:00:00 AM',180,467)
,(22,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',178,'07/01/2020 12:00:00 AM',180,32)
,(23,'VEHICLE - STOLEN',239,'09/09/2020 12:00:00 AM',24,96)
,(24,'THEFT OF IDENTITY',105,'07/01/2020 12:00:00 AM',36,348)
,(25,'CRIMINAL THREATS - NO WEAPON DISPLAYED',286,'02/09/2020 12:00:00 AM',18,368)
,(26,'EMBEZZLEMENT, GRAND THEFT ($950.01 & OVER)',158,'08/14/2020 12:00:00 AM',36,35)
,(27,'VEHICLE - STOLEN',197,'05/02/2020 12:00:00 AM',24,133)
,(28,'THEFT OF IDENTITY',242,'07/01/2020 12:00:00 AM',36,8)
,(29,'BATTERY - SIMPLE ASSAULT',31,'03/30/2020 12:00:00 AM',9,377)
,(30,'THEFT OF IDENTITY',162,'01/27/2020 12:00:00 AM',36,142)
,(31,'THEFT OF IDENTITY',115,'01/01/2020 12:00:00 AM',36,760)
,(32,'BURGLARY FROM VEHICLE',137,'05/08/2020 12:00:00 AM',9,620)
,(33,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',210,'01/18/2020 12:00:00 AM',4,666)
,(34,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',104,'05/26/2020 12:00:00 AM',4,119)
,(35,'CRIMINAL THREATS - NO WEAPON DISPLAYED',292,'11/26/2020 12:00:00 AM',18,537)
,(36,'THEFT OF IDENTITY',232,'03/10/2020 12:00:00 AM',36,88)
,(37,'THEFT OF IDENTITY',151,'04/01/2020 12:00:00 AM',36,103)
,(38,'THEFT OF IDENTITY',40,'06/28/2020 12:00:00 AM',36,391)
,(39,'THEFT OF IDENTITY',123,'09/02/2020 12:00:00 AM',36,347)
,(40,'THEFT OF IDENTITY',124,'10/23/2020 12:00:00 AM',36,699)
,(41,'THEFT OF IDENTITY',295,'01/01/2020 12:00:00 AM',36,270)
,(42,'CHILD ANNOYING (17YRS & UNDER)',27,'01/01/2020 12:00:00 AM',18,368)
,(43,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',81,'10/30/2020 12:00:00 AM',180,354)
,(44,'THEFT OF IDENTITY',19,'12/10/2020 12:00:00 AM',36,511)
,(45,'THEFT OF IDENTITY',275,'02/01/2020 12:00:00 AM',36,577)
,(46,'THEFT OF IDENTITY',0,'01/14/2020 12:00:00 AM',36,350)
,(47,'THEFT OF IDENTITY',214,'05/17/2020 12:00:00 AM',36,512)
,(48,'THEFT OF IDENTITY',196,'02/23/2020 12:00:00 AM',36,761)
,(49,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',207,'07/07/2020 12:00:00 AM',24,173)
,(50,'THEFT OF IDENTITY',85,'07/14/2020 12:00:00 AM',36,387)
,(51,'THEFT OF IDENTITY',291,'08/01/2020 12:00:00 AM',36,505)
,(52,'THEFT OF IDENTITY',12,'06/01/2020 12:00:00 AM',36,524)
,(53,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',272,'11/13/2020 12:00:00 AM',4,114)
,(54,'THEFT PLAIN - PETTY ($950 & UNDER)',274,'11/12/2020 12:00:00 AM',6,781)
,(55,'THEFT OF IDENTITY',194,'05/08/2020 12:00:00 AM',36,525)
,(56,'THEFT OF IDENTITY',4,'01/01/2020 12:00:00 AM',36,684)
,(57,'THEFT OF IDENTITY',127,'03/29/2020 12:00:00 AM',36,539)
,(58,'THEFT OF IDENTITY',298,'07/01/2020 12:00:00 AM',36,138)
,(59,'THEFT OF IDENTITY',144,'07/09/2020 12:00:00 AM',36,44)
,(60,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',109,'12/20/2020 12:00:00 AM',24,492)
,(61,'INTIMATE PARTNER - SIMPLE ASSAULT',257,'09/13/2020 12:00:00 AM',9,427)
,(62,'THEFT PLAIN - PETTY ($950 & UNDER)',195,'12/02/2020 12:00:00 AM',6,525)
,(63,'BURGLARY FROM VEHICLE',199,'06/27/2020 12:00:00 AM',9,66)
,(64,'THEFT OF IDENTITY',111,'09/02/2020 12:00:00 AM',36,459)
,(65,'THEFT OF IDENTITY',32,'01/26/2020 12:00:00 AM',36,41)
,(66,'LEWD CONDUCT',73,'01/01/2020 12:00:00 AM',24,279)
,(67,'THEFT PLAIN - ATTEMPT',9,'05/20/2020 12:00:00 AM',6,683)
,(68,'THEFT OF IDENTITY',65,'06/25/2020 12:00:00 AM',36,614)
,(69,'THEFT OF IDENTITY',253,'04/05/2020 12:00:00 AM',36,734)
,(70,'BURGLARY',230,'12/28/2020 12:00:00 AM',36,338)
,(71,'THEFT OF IDENTITY',288,'10/12/2020 12:00:00 AM',36,310)
,(72,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',43,'09/01/2020 12:00:00 AM',180,627)
,(73,'THEFT OF IDENTITY',163,'04/02/2020 12:00:00 AM',36,450)
,(74,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',170,'12/31/2020 12:00:00 AM',4,71)
,(75,'THEFT OF IDENTITY',21,'08/23/2020 12:00:00 AM',36,540)
,(76,'THEFT OF IDENTITY',169,'06/03/2020 12:00:00 AM',36,677)
,(77,'THEFT OF IDENTITY',174,'06/23/2020 12:00:00 AM',36,564)
,(78,'VEHICLE - STOLEN',296,'04/22/2020 12:00:00 AM',24,252)
,(79,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',217,'11/12/2020 12:00:00 AM',4,704)
,(80,'BURGLARY FROM VEHICLE',156,'12/27/2020 12:00:00 AM',9,669)
,(81,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',275,'12/29/2020 12:00:00 AM',18,635)
,(82,'THEFT FROM MOTOR VEHICLE - GRAND ($950.01 AND OVER)',24,'09/11/2020 12:00:00 AM',18,89)
,(83,'THEFT OF IDENTITY',76,'10/27/2020 12:00:00 AM',36,445)
,(84,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',157,'12/20/2020 12:00:00 AM',24,137)
,(85,'THEFT OF IDENTITY',97,'04/14/2020 12:00:00 AM',36,739)
,(86,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',113,'01/01/2020 12:00:00 AM',180,410)
,(87,'THEFT OF IDENTITY',103,'03/16/2020 12:00:00 AM',36,664)
,(88,'THEFT OF IDENTITY',196,'04/23/2020 12:00:00 AM',36,305)
,(89,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',14,'04/26/2020 12:00:00 AM',18,47)
,(90,'INTIMATE PARTNER - SIMPLE ASSAULT',7,'06/30/2020 12:00:00 AM',9,765)
,(91,'CHILD ANNOYING (17YRS & UNDER)',244,'01/01/2020 12:00:00 AM',18,787)
,(92,'BURGLARY FROM VEHICLE',227,'05/08/2020 12:00:00 AM',9,758)
,(93,'VEHICLE - STOLEN',142,'11/24/2020 12:00:00 AM',24,582)
,(94,'THEFT OF IDENTITY',283,'08/03/2020 12:00:00 AM',36,398)
,(95,'THEFT OF IDENTITY',190,'02/28/2020 12:00:00 AM',36,568)
,(96,'ROBBERY',10,'10/01/2020 12:00:00 AM',60,533)
,(97,'BUNCO, GRAND THEFT',288,'03/10/2020 12:00:00 AM',24,653)
,(98,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',237,'02/02/2020 12:00:00 AM',4,280)
,(99,'THEFT OF IDENTITY',43,'12/17/2020 12:00:00 AM',36,105)
,(100,'INTIMATE PARTNER - SIMPLE ASSAULT',105,'05/08/2020 12:00:00 AM',9,694)
,(101,'THEFT OF IDENTITY',188,'04/01/2020 12:00:00 AM',36,506)
,(102,'THEFT OF IDENTITY',296,'02/25/2020 12:00:00 AM',36,527)
,(103,'BURGLARY FROM VEHICLE',109,'12/16/2020 12:00:00 AM',9,59)
,(104,'THEFT OF IDENTITY',34,'07/27/2020 12:00:00 AM',36,700)
,(105,'BUNCO, GRAND THEFT',46,'06/01/2020 12:00:00 AM',24,206)
,(106,'THEFT OF IDENTITY',1,'03/10/2020 12:00:00 AM',36,487)
,(107,'VEHICLE - STOLEN',172,'04/28/2020 12:00:00 AM',24,179)
,(108,'THEFT OF IDENTITY',61,'12/14/2020 12:00:00 AM',36,409)
,(109,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',142,'06/15/2020 12:00:00 AM',4,422)
,(110,'THEFT OF IDENTITY',127,'12/20/2020 12:00:00 AM',36,145)
,(111,'THEFT OF IDENTITY',222,'09/19/2020 12:00:00 AM',36,569)
,(112,'THEFT OF IDENTITY',140,'05/08/2020 12:00:00 AM',36,106)
,(113,'THEFT OF IDENTITY',14,'07/11/2020 12:00:00 AM',36,159)
,(114,'THEFT OF IDENTITY',31,'01/01/2020 12:00:00 AM',36,731)
,(115,'BUNCO, GRAND THEFT',116,'09/01/2020 12:00:00 AM',24,258)
,(116,'BATTERY WITH SEXUAL CONTACT',241,'10/13/2020 12:00:00 AM',36,67)
,(117,'INTIMATE PARTNER - AGGRAVATED ASSAULT',208,'08/27/2020 12:00:00 AM',48,438)
,(118,'ORAL COPULATION',150,'10/10/2020 12:00:00 AM',60,579)
,(119,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',224,'01/01/2020 12:00:00 AM',180,582)
,(120,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',136,'07/01/2020 12:00:00 AM',180,773)
,(121,'UNAUTHORIZED COMPUTER ACCESS',186,'03/20/2020 12:00:00 AM',12,42)
,(122,'THEFT OF IDENTITY',8,'01/30/2020 12:00:00 AM',36,593)
,(123,'SEX,UNLAWFUL(INC MUTUAL CONSENT, PENETRATION W/ FRGN OBJ',9,'06/01/2020 12:00:00 AM',36,97)
,(124,'THEFT OF IDENTITY',128,'06/19/2020 12:00:00 AM',36,372)
,(125,'THEFT OF IDENTITY',39,'11/19/2020 12:00:00 AM',36,792)
,(126,'CRIMINAL THREATS - NO WEAPON DISPLAYED',145,'08/01/2020 12:00:00 AM',18,608)
,(127,'THEFT OF IDENTITY',283,'02/21/2020 12:00:00 AM',36,578)
,(128,'THEFT OF IDENTITY',20,'08/02/2020 12:00:00 AM',36,711)
,(129,'THEFT OF IDENTITY',196,'07/31/2020 12:00:00 AM',36,171)
,(130,'THEFT OF IDENTITY',267,'10/19/2020 12:00:00 AM',36,210)
,(131,'THEFT OF IDENTITY',85,'06/25/2020 12:00:00 AM',36,589)
,(132,'VIOLATION OF RESTRAINING ORDER',244,'02/20/2020 12:00:00 AM',12,756)
,(133,'THEFT OF IDENTITY',191,'04/10/2020 12:00:00 AM',36,775)
,(134,'THEFT OF IDENTITY',65,'04/03/2020 12:00:00 AM',36,766)
,(135,'SHOPLIFTING - PETTY THEFT ($950 & UNDER)',105,'12/27/2020 12:00:00 AM',6,177)
,(136,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',13,'01/01/2020 12:00:00 AM',180,308)
,(137,'THEFT OF IDENTITY',262,'12/01/2020 12:00:00 AM',36,80)
,(138,'VANDALISM - FELONY ($400 & OVER, ALL CHURCH VANDALISMS)',20,'09/15/2020 12:00:00 AM',24,458)
,(139,'THEFT OF IDENTITY',16,'10/08/2020 12:00:00 AM',36,324)
,(140,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',114,'01/01/2020 12:00:00 AM',180,428)
,(141,'THEFT OF IDENTITY',215,'11/23/2020 12:00:00 AM',36,185)
,(142,'THEFT OF IDENTITY',279,'06/01/2020 12:00:00 AM',36,276)
,(143,'OTHER MISCELLANEOUS CRIME',270,'03/04/2020 12:00:00 AM',12,100)
,(144,'THEFT OF IDENTITY',142,'10/13/2020 12:00:00 AM',36,603)
,(145,'THEFT OF IDENTITY',159,'03/28/2020 12:00:00 AM',36,740)
,(146,'THEFT PLAIN - PETTY ($950 & UNDER)',263,'04/10/2020 12:00:00 AM',6,351)
,(147,'BURGLARY',218,'12/31/2020 12:00:00 AM',36,141)
,(148,'THEFT OF IDENTITY',161,'03/20/2020 12:00:00 AM',36,155)
,(149,'BRANDISH WEAPON',46,'07/24/2020 12:00:00 AM',24,266)
,(150,'INTIMATE PARTNER - SIMPLE ASSAULT',247,'03/01/2020 12:00:00 AM',9,675)
,(151,'THEFT PLAIN - PETTY ($950 & UNDER)',11,'03/13/2020 12:00:00 AM',6,601)
,(152,'THEFT OF IDENTITY',17,'08/02/2020 12:00:00 AM',36,318)
,(153,'DOCUMENT FORGERY / STOLEN FELONY',25,'08/23/2020 12:00:00 AM',48,610)
,(154,'THEFT OF IDENTITY',242,'05/10/2020 12:00:00 AM',36,441)
,(155,'THEFT OF IDENTITY',202,'01/18/2020 12:00:00 AM',36,118)
,(156,'THEFT FROM MOTOR VEHICLE - GRAND ($950.01 AND OVER)',53,'01/19/2020 12:00:00 AM',18,381)
,(157,'THEFT OF IDENTITY',202,'10/01/2020 12:00:00 AM',36,375)
,(158,'INTIMATE PARTNER - SIMPLE ASSAULT',164,'01/01/2020 12:00:00 AM',9,724)
,(159,'THEFT OF IDENTITY',88,'11/19/2020 12:00:00 AM',36,136)
,(160,'THEFT PLAIN - PETTY ($950 & UNDER)',75,'11/20/2020 12:00:00 AM',6,221)
,(161,'BURGLARY',172,'08/15/2020 12:00:00 AM',36,284)
,(162,'THEFT OF IDENTITY',222,'08/09/2020 12:00:00 AM',36,785)
,(163,'THEFT OF IDENTITY',293,'02/12/2020 12:00:00 AM',36,725)
,(164,'THEFT OF IDENTITY',156,'07/30/2020 12:00:00 AM',36,742)
,(165,'THEFT OF IDENTITY',219,'10/01/2020 12:00:00 AM',36,616)
,(166,'THEFT OF IDENTITY',241,'06/09/2020 12:00:00 AM',36,194)
,(167,'VEHICLE - STOLEN',243,'03/27/2020 12:00:00 AM',24,741)
,(168,'THEFT OF IDENTITY',265,'12/02/2020 12:00:00 AM',36,555)
,(169,'THEFT OF IDENTITY',243,'01/02/2020 12:00:00 AM',36,720)
,(170,'VEHICLE - STOLEN',183,'04/06/2020 12:00:00 AM',24,584)
,(171,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',61,'04/29/2020 12:00:00 AM',24,598)
,(172,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',84,'10/19/2020 12:00:00 AM',180,14)
,(173,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',273,'09/27/2020 12:00:00 AM',18,81)
,(174,'THEFT OF IDENTITY',70,'02/09/2020 12:00:00 AM',36,20)
,(175,'THEFT OF IDENTITY',26,'05/05/2020 12:00:00 AM',36,715)
,(176,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',62,'11/20/2020 12:00:00 AM',18,648)
,(177,'EMBEZZLEMENT, GRAND THEFT ($950.01 & OVER)',8,'03/20/2020 12:00:00 AM',36,196)
,(178,'THEFT PLAIN - PETTY ($950 & UNDER)',51,'11/08/2020 12:00:00 AM',6,515)
,(179,'BUNCO, GRAND THEFT',229,'07/26/2020 12:00:00 AM',24,322)
,(180,'THEFT OF IDENTITY',188,'03/01/2020 12:00:00 AM',36,72)
,(181,'BURGLARY',164,'12/28/2020 12:00:00 AM',36,710)
,(182,'BURGLARY FROM VEHICLE',2,'08/24/2020 12:00:00 AM',9,26)
,(183,'THEFT OF IDENTITY',60,'07/30/2020 12:00:00 AM',36,4)
,(184,'THEFT OF IDENTITY',270,'05/15/2020 12:00:00 AM',36,625)
,(185,'RAPE, FORCIBLE',223,'04/01/2020 12:00:00 AM',240,302)
,(186,'THEFT OF IDENTITY',242,'06/20/2020 12:00:00 AM',36,687)
,(187,'INTIMATE PARTNER - SIMPLE ASSAULT',22,'06/15/2020 12:00:00 AM',9,396)
,(188,'VANDALISM - MISDEAMEANOR ($399 OR UNDER)',173,'01/23/2020 12:00:00 AM',3,628)
,(189,'THEFT OF IDENTITY',233,'06/07/2020 12:00:00 AM',36,9)
,(190,'THEFT OF IDENTITY',232,'03/01/2020 12:00:00 AM',36,691)
,(191,'THEFT OF IDENTITY',132,'06/23/2020 12:00:00 AM',36,692)
,(192,'INTIMATE PARTNER - SIMPLE ASSAULT',55,'05/27/2020 12:00:00 AM',9,107)
,(193,'THEFT OF IDENTITY',23,'06/04/2020 12:00:00 AM',36,233)
,(194,'BATTERY - SIMPLE ASSAULT',239,'12/20/2020 12:00:00 AM',9,110)
,(195,'THEFT OF IDENTITY',241,'03/20/2020 12:00:00 AM',36,214)
,(196,'THEFT OF IDENTITY',111,'10/19/2020 12:00:00 AM',36,82)
,(197,'THEFT OF IDENTITY',52,'08/05/2020 12:00:00 AM',36,544)
,(198,'VEHICLE - STOLEN',173,'07/30/2020 12:00:00 AM',24,464)
,(199,'OTHER MISCELLANEOUS CRIME',175,'12/27/2020 12:00:00 AM',12,17)
,(200,'THEFT OF IDENTITY',91,'01/01/2020 12:00:00 AM',36,120)
,(201,'CHILD ANNOYING (17YRS & UNDER)',170,'08/01/2020 12:00:00 AM',18,762)
,(202,'ORAL COPULATION',285,'01/01/2020 12:00:00 AM',60,35)
,(203,'DOCUMENT FORGERY / STOLEN FELONY',125,'07/17/2020 12:00:00 AM',48,370)
,(204,'BATTERY - SIMPLE ASSAULT',113,'07/11/2020 12:00:00 AM',9,573)
,(205,'THEFT OF IDENTITY',226,'12/10/2020 12:00:00 AM',36,528)
,(206,'THEFT OF IDENTITY',35,'01/07/2020 12:00:00 AM',36,227)
,(207,'CHILD ABUSE (PHYSICAL) - SIMPLE ASSAULT',136,'02/17/2020 12:00:00 AM',24,574)
,(208,'ROBBERY',102,'04/01/2020 12:00:00 AM',60,116)
,(209,'THEFT OF IDENTITY',68,'06/01/2020 12:00:00 AM',36,542)
,(210,'THEFT OF IDENTITY',168,'08/13/2020 12:00:00 AM',36,343)
,(211,'BATTERY WITH SEXUAL CONTACT',177,'03/01/2020 12:00:00 AM',36,149)
,(212,'CREDIT CARDS, FRAUD USE ($950.01 & OVER)',222,'10/26/2020 12:00:00 AM',24,56)
,(213,'THEFT OF IDENTITY',285,'05/01/2020 12:00:00 AM',36,75)
,(214,'OTHER MISCELLANEOUS CRIME',35,'07/15/2020 12:00:00 AM',12,773)
,(215,'SODOMY/SEXUAL CONTACT B/W PENIS OF ONE PERS TO ANUS OTH',2,'06/01/2020 12:00:00 AM',96,294)
,(216,'THEFT OF IDENTITY',122,'01/01/2020 12:00:00 AM',36,341)
,(217,'ASSAULT WITH DEADLY WEAPON, AGGRAVATED ASSAULT',286,'12/01/2020 12:00:00 AM',48,20)
,(218,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',267,'06/19/2020 12:00:00 AM',4,11)
,(219,'THEFT OF IDENTITY',92,'11/17/2020 12:00:00 AM',36,529)
,(220,'THEFT OF IDENTITY',267,'10/30/2020 12:00:00 AM',36,371)
,(221,'THEFT OF IDENTITY',122,'07/01/2020 12:00:00 AM',36,598)
,(222,'INTIMATE PARTNER - SIMPLE ASSAULT',221,'05/22/2020 12:00:00 AM',9,166)
,(223,'THEFT OF IDENTITY',113,'06/24/2020 12:00:00 AM',36,124)
,(224,'THEFT PLAIN - PETTY ($950 & UNDER)',194,'11/01/2020 12:00:00 AM',6,28)
,(225,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',260,'05/06/2020 12:00:00 AM',24,215)
,(226,'THEFT OF IDENTITY',223,'07/05/2020 12:00:00 AM',36,166)
,(227,'BURGLARY',136,'01/01/2020 12:00:00 AM',36,503)
,(228,'ASSAULT WITH DEADLY WEAPON, AGGRAVATED ASSAULT',286,'07/02/2020 12:00:00 AM',48,53)
,(229,'THEFT OF IDENTITY',151,'10/09/2020 12:00:00 AM',36,501)
,(230,'BURGLARY',26,'06/26/2020 12:00:00 AM',36,153)
,(231,'THEFT OF IDENTITY',258,'11/01/2020 12:00:00 AM',36,556)
,(232,'THEFT OF IDENTITY',295,'01/11/2020 12:00:00 AM',36,244)
,(233,'BUNCO, GRAND THEFT',192,'03/20/2020 12:00:00 AM',24,89)
,(234,'THEFT OF IDENTITY',48,'04/01/2020 12:00:00 AM',36,234)
,(235,'THEFT OF IDENTITY',261,'10/21/2020 12:00:00 AM',36,240)
,(236,'DOCUMENT FORGERY / STOLEN FELONY',122,'10/22/2020 12:00:00 AM',48,697)
,(237,'THEFT OF IDENTITY',205,'09/01/2020 12:00:00 AM',36,319)
,(238,'THEFT OF IDENTITY',151,'01/06/2020 12:00:00 AM',36,470)
,(239,'THEFT OF IDENTITY',285,'07/01/2020 12:00:00 AM',36,782)
,(240,'THREATENING PHONE CALLS/LETTERS',38,'10/22/2020 12:00:00 AM',18,228)
,(241,'VEHICLE - STOLEN',245,'10/01/2020 12:00:00 AM',24,509)
,(242,'THEFT OF IDENTITY',49,'08/30/2020 12:00:00 AM',36,130)
,(243,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',164,'10/01/2020 12:00:00 AM',24,249)
,(244,'THEFT OF IDENTITY',155,'07/17/2020 12:00:00 AM',36,60)
,(245,'THEFT OF IDENTITY',250,'09/06/2020 12:00:00 AM',36,774)
,(246,'CHILD ABUSE (PHYSICAL) - SIMPLE ASSAULT',219,'02/01/2020 12:00:00 AM',24,493)
,(247,'BATTERY - SIMPLE ASSAULT',100,'08/08/2020 12:00:00 AM',9,484)
,(248,'THEFT OF IDENTITY',198,'01/20/2020 12:00:00 AM',36,701)
,(249,'VEHICLE - STOLEN',64,'12/22/2020 12:00:00 AM',24,229)
,(250,'THEFT OF IDENTITY',150,'03/01/2020 12:00:00 AM',36,32)
,(251,'BURGLARY',251,'06/22/2020 12:00:00 AM',36,296)
,(252,'RAPE, FORCIBLE',294,'06/01/2020 12:00:00 AM',240,163)
,(253,'ASSAULT WITH DEADLY WEAPON, AGGRAVATED ASSAULT',143,'03/01/2020 12:00:00 AM',48,58)
,(254,'THEFT OF IDENTITY',135,'09/01/2020 12:00:00 AM',36,230)
,(255,'BATTERY - SIMPLE ASSAULT',110,'04/27/2020 12:00:00 AM',9,160)
,(256,'THEFT OF IDENTITY',262,'12/05/2020 12:00:00 AM',36,290)
,(257,'THEFT OF IDENTITY',111,'04/17/2020 12:00:00 AM',36,339)
,(258,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',289,'01/01/2020 12:00:00 AM',180,65)
,(259,'ROBBERY',100,'12/09/2020 12:00:00 AM',60,375)
,(260,'THEFT OF IDENTITY',123,'03/21/2020 12:00:00 AM',36,381)
,(261,'BIKE - STOLEN',18,'12/01/2020 12:00:00 AM',4,126)
,(262,'RAPE, FORCIBLE',33,'11/25/2020 12:00:00 AM',240,253)
,(263,'THEFT OF IDENTITY',185,'05/08/2020 12:00:00 AM',36,183)
,(264,'CHILD ANNOYING (17YRS & UNDER)',39,'01/01/2020 12:00:00 AM',18,164)
,(265,'THEFT OF IDENTITY',97,'04/20/2020 12:00:00 AM',36,508)
,(266,'THEFT OF IDENTITY',65,'11/29/2020 12:00:00 AM',36,320)
,(267,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',260,'10/16/2020 12:00:00 AM',18,695)
,(268,'THEFT OF IDENTITY',23,'02/19/2020 12:00:00 AM',36,786)
,(269,'THEFT OF IDENTITY',10,'10/09/2020 12:00:00 AM',36,521)
,(270,'DOCUMENT FORGERY / STOLEN FELONY',244,'11/01/2020 12:00:00 AM',48,717)
,(271,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',271,'08/23/2020 12:00:00 AM',180,127)
,(272,'THEFT OF IDENTITY',144,'07/01/2020 12:00:00 AM',36,485)
,(273,'THEFT OF IDENTITY',188,'10/01/2020 12:00:00 AM',36,352)
,(274,'THEFT OF IDENTITY',143,'04/07/2020 12:00:00 AM',36,138)
,(275,'RAPE, FORCIBLE',166,'01/25/2020 12:00:00 AM',240,188)
,(276,'CRIMINAL THREATS - NO WEAPON DISPLAYED',157,'11/17/2020 12:00:00 AM',18,222)
,(277,'THEFT OF IDENTITY',121,'01/25/2020 12:00:00 AM',36,742)
,(278,'THEFT OF IDENTITY',174,'11/19/2020 12:00:00 AM',36,252)
,(279,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',136,'01/01/2020 12:00:00 AM',18,222)
,(280,'THEFT OF IDENTITY',129,'08/07/2020 12:00:00 AM',36,548)
,(281,'RAPE, FORCIBLE',299,'10/31/2020 12:00:00 AM',240,240)
,(282,'SEXUAL PENETRATION W/FOREIGN OBJECT',217,'03/19/2020 12:00:00 AM',96,150)
,(283,'SEX,UNLAWFUL(INC MUTUAL CONSENT, PENETRATION W/ FRGN OBJ',284,'08/27/2020 12:00:00 AM',36,695)
,(284,'RAPE, FORCIBLE',37,'11/28/2020 12:00:00 AM',240,415)
,(285,'THEFT FROM MOTOR VEHICLE - GRAND ($950.01 AND OVER)',65,'12/23/2020 12:00:00 AM',18,51)
,(286,'INTIMATE PARTNER - SIMPLE ASSAULT',82,'11/15/2020 12:00:00 AM',9,211)
,(287,'THEFT OF IDENTITY',8,'03/23/2020 12:00:00 AM',36,382)
,(288,'ORAL COPULATION',255,'04/01/2020 12:00:00 AM',60,94)
,(289,'ORAL COPULATION',42,'01/01/2020 12:00:00 AM',60,654)
,(290,'THEFT OF IDENTITY',191,'01/10/2020 12:00:00 AM',36,68)
,(291,'BATTERY WITH SEXUAL CONTACT',168,'09/01/2020 12:00:00 AM',36,330)
,(292,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',123,'04/01/2020 12:00:00 AM',18,590)
,(293,'VANDALISM - FELONY ($400 & OVER, ALL CHURCH VANDALISMS)',48,'10/23/2020 12:00:00 AM',24,161)
,(294,'THEFT OF IDENTITY',90,'03/04/2020 12:00:00 AM',36,192)
,(295,'THEFT OF IDENTITY',288,'11/11/2020 12:00:00 AM',36,360)
,(296,'SEXUAL PENETRATION W/FOREIGN OBJECT',130,'11/26/2020 12:00:00 AM',96,599)
,(297,'THEFT OF IDENTITY',36,'04/22/2020 12:00:00 AM',36,789)
,(298,'EXTORTION',271,'02/01/2020 12:00:00 AM',48,667)
,(299,'OTHER MISCELLANEOUS CRIME',71,'11/12/2020 12:00:00 AM',12,255)
,(300,'OTHER MISCELLANEOUS CRIME',250,'08/07/2020 12:00:00 AM',12,269)
,(301,'OTHER ASSAULT',25,'05/20/2020 12:00:00 AM',12,415)
,(302,'THEFT OF IDENTITY',127,'01/01/2020 12:00:00 AM',36,434)
,(303,'BURGLARY',167,'12/13/2020 12:00:00 AM',36,456)
,(304,'BURGLARY',69,'11/20/2020 12:00:00 AM',36,378)
,(305,'THEFT OF IDENTITY',272,'11/01/2020 12:00:00 AM',36,336)
,(306,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',149,'01/01/2020 12:00:00 AM',24,749)
,(307,'THEFT OF IDENTITY',281,'07/14/2020 12:00:00 AM',36,200)
,(308,'THEFT FROM MOTOR VEHICLE - GRAND ($950.01 AND OVER)',34,'07/19/2020 12:00:00 AM',18,570)
,(309,'THEFT OF IDENTITY',114,'11/12/2020 12:00:00 AM',36,37)
,(310,'EXTORTION',267,'11/15/2020 12:00:00 AM',48,768)
,(311,'BATTERY - SIMPLE ASSAULT',276,'04/01/2020 12:00:00 AM',9,447)
,(312,'THEFT OF IDENTITY',293,'06/16/2020 12:00:00 AM',36,480)
,(313,'THEFT OF IDENTITY',89,'04/26/2020 12:00:00 AM',36,309)
,(314,'VEHICLE - STOLEN',82,'07/01/2020 12:00:00 AM',24,201)
,(315,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',239,'01/01/2020 12:00:00 AM',24,29)
,(316,'SEXUAL PENETRATION W/FOREIGN OBJECT',73,'05/01/2020 12:00:00 AM',96,175)
,(317,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',238,'09/01/2020 12:00:00 AM',18,363)
,(318,'ORAL COPULATION',3,'01/01/2020 12:00:00 AM',60,247)
,(319,'BUNCO, GRAND THEFT',172,'11/28/2020 12:00:00 AM',24,114)
,(320,'EMBEZZLEMENT, GRAND THEFT ($950.01 & OVER)',212,'03/13/2020 12:00:00 AM',36,367)
,(321,'BURGLARY FROM VEHICLE',24,'12/10/2020 12:00:00 AM',9,496)
,(322,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',236,'02/02/2020 12:00:00 AM',24,108)
,(323,'INTIMATE PARTNER - AGGRAVATED ASSAULT',63,'03/22/2020 12:00:00 AM',48,310)
,(324,'THEFT OF IDENTITY',91,'07/06/2020 12:00:00 AM',36,636)
,(325,'THEFT OF IDENTITY',152,'03/10/2020 12:00:00 AM',36,277)
,(326,'THEFT OF IDENTITY',167,'11/01/2020 12:00:00 AM',36,295)
,(327,'THEFT OF IDENTITY',3,'07/15/2020 12:00:00 AM',36,256)
,(328,'THEFT OF IDENTITY',1,'06/15/2020 12:00:00 AM',36,681)
,(329,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',276,'01/18/2020 12:00:00 AM',18,624)
,(330,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',290,'08/01/2020 12:00:00 AM',180,605)
,(331,'INTIMATE PARTNER - SIMPLE ASSAULT',290,'12/21/2020 12:00:00 AM',9,497)
,(332,'THEFT FROM MOTOR VEHICLE - GRAND ($950.01 AND OVER)',95,'01/01/2020 12:00:00 AM',18,403)
,(333,'THEFT OF IDENTITY',47,'11/19/2020 12:00:00 AM',36,534)
,(334,'THEFT OF IDENTITY',194,'05/05/2020 12:00:00 AM',36,48)
,(335,'THEFT OF IDENTITY',78,'08/23/2020 12:00:00 AM',36,620)
,(336,'THEFT OF IDENTITY',245,'05/01/2020 12:00:00 AM',36,90)
,(337,'THEFT OF IDENTITY',32,'10/01/2020 12:00:00 AM',36,575)
,(338,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',233,'08/05/2020 12:00:00 AM',24,783)
,(339,'RAPE, FORCIBLE',84,'09/01/2020 12:00:00 AM',240,235)
,(340,'THEFT OF IDENTITY',68,'08/15/2020 12:00:00 AM',36,382)
,(341,'VANDALISM - MISDEAMEANOR ($399 OR UNDER)',12,'07/23/2020 12:00:00 AM',3,423)
,(342,'CHILD ANNOYING (17YRS & UNDER)',177,'02/10/2020 12:00:00 AM',18,236)
,(343,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',294,'01/01/2020 12:00:00 AM',180,658)
,(344,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',69,'07/01/2020 12:00:00 AM',18,353)
,(345,'THEFT OF IDENTITY',149,'01/01/2020 12:00:00 AM',36,381)
,(346,'BURGLARY FROM VEHICLE',19,'12/15/2020 12:00:00 AM',9,777)
,(347,'INTIMATE PARTNER - SIMPLE ASSAULT',163,'09/01/2020 12:00:00 AM',9,287)
,(348,'THEFT OF IDENTITY',219,'03/30/2020 12:00:00 AM',36,38)
,(349,'THEFT OF IDENTITY',19,'03/14/2020 12:00:00 AM',36,141)
,(350,'PICKPOCKET',154,'12/31/2020 12:00:00 AM',9,756)
,(351,'SEXUAL PENETRATION W/FOREIGN OBJECT',63,'03/30/2020 12:00:00 AM',96,21)
,(352,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',169,'01/01/2020 12:00:00 AM',180,659)
,(353,'BURGLARY FROM VEHICLE',18,'04/21/2020 12:00:00 AM',9,84)
,(354,'THEFT OF IDENTITY',263,'01/16/2020 12:00:00 AM',36,286)
,(355,'THEFT OF IDENTITY',83,'05/15/2020 12:00:00 AM',36,145)
,(356,'THEFT OF IDENTITY',135,'11/20/2020 12:00:00 AM',36,174)
,(357,'THEFT OF IDENTITY',168,'08/14/2020 12:00:00 AM',36,75)
,(358,'THEFT OF IDENTITY',189,'07/29/2020 12:00:00 AM',36,54)
,(359,'ARSON',231,'01/30/2020 12:00:00 AM',120,52)
,(360,'THEFT OF IDENTITY',17,'05/11/2020 12:00:00 AM',36,258)
,(361,'THEFT OF IDENTITY',17,'02/18/2020 12:00:00 AM',36,134)
,(362,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',171,'02/21/2020 12:00:00 AM',24,281)
,(363,'THEFT OF IDENTITY',80,'09/26/2020 12:00:00 AM',36,688)
,(364,'THEFT OF IDENTITY',254,'12/02/2020 12:00:00 AM',36,595)
,(365,'INTIMATE PARTNER - SIMPLE ASSAULT',137,'05/01/2020 12:00:00 AM',9,331)
,(366,'VEHICLE - STOLEN',112,'06/25/2020 12:00:00 AM',24,637)
,(367,'THEFT OF IDENTITY',148,'12/04/2020 12:00:00 AM',36,388)
,(368,'BATTERY WITH SEXUAL CONTACT',75,'02/01/2020 12:00:00 AM',36,602)
,(369,'THEFT OF IDENTITY',280,'01/13/2020 12:00:00 AM',36,571)
,(370,'DISTURBING THE PEACE',23,'04/20/2020 12:00:00 AM',4,364)
,(371,'RAPE, FORCIBLE',173,'01/01/2020 12:00:00 AM',240,203)
,(372,'ORAL COPULATION',115,'09/07/2020 12:00:00 AM',60,621)
,(373,'THEFT OF IDENTITY',14,'07/20/2020 12:00:00 AM',36,251)
,(374,'VEHICLE - STOLEN',136,'08/19/2020 12:00:00 AM',24,665)
,(375,'CRIMINAL THREATS - NO WEAPON DISPLAYED',146,'06/01/2020 12:00:00 AM',18,639)
,(376,'BURGLARY FROM VEHICLE',238,'07/01/2020 12:00:00 AM',9,764)
,(377,'THEFT OF IDENTITY',221,'07/01/2020 12:00:00 AM',36,460)
,(378,'THEFT OF IDENTITY',58,'08/07/2020 12:00:00 AM',36,208)
,(379,'THEFT OF IDENTITY',51,'06/26/2020 12:00:00 AM',36,103)
,(380,'THEFT OF IDENTITY',261,'02/02/2020 12:00:00 AM',36,640)
,(381,'BURGLARY',127,'03/01/2020 12:00:00 AM',36,596)
,(382,'BUNCO, ATTEMPT',73,'11/01/2020 12:00:00 AM',6,300)
,(383,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',53,'02/15/2020 12:00:00 AM',18,287)
,(384,'BUNCO, GRAND THEFT',129,'12/01/2020 12:00:00 AM',24,112)
,(385,'THEFT OF IDENTITY',81,'01/24/2020 12:00:00 AM',36,271)
,(386,'HUMAN TRAFFICKING - INVOLUNTARY SERVITUDE',149,'01/01/2020 12:00:00 AM',180,326)
,(387,'THEFT OF IDENTITY',133,'01/14/2020 12:00:00 AM',36,244)
,(388,'CRIMINAL THREATS - NO WEAPON DISPLAYED',280,'01/17/2020 12:00:00 AM',18,735)
,(389,'VEHICLE - STOLEN',252,'06/23/2020 12:00:00 AM',24,207)
,(390,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',247,'06/30/2020 12:00:00 AM',18,483)
,(391,'RAPE, FORCIBLE',12,'07/17/2020 12:00:00 AM',240,440)
,(392,'BURGLARY',179,'01/11/2020 12:00:00 AM',36,471)
,(393,'THEFT OF IDENTITY',162,'03/01/2020 12:00:00 AM',36,429)
,(394,'PIMPING',23,'08/26/2020 12:00:00 AM',60,420)
,(395,'SHOPLIFTING - PETTY THEFT ($950 & UNDER)',15,'08/22/2020 12:00:00 AM',6,392)
,(396,'INTIMATE PARTNER - SIMPLE ASSAULT',49,'10/31/2020 12:00:00 AM',9,765)
,(397,'CRIMINAL THREATS - NO WEAPON DISPLAYED',15,'01/01/2020 12:00:00 AM',18,378)
,(398,'THEFT OF IDENTITY',178,'09/11/2020 12:00:00 AM',36,117)
,(399,'THEFT OF IDENTITY',142,'10/24/2020 12:00:00 AM',36,1)
,(400,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',28,'10/20/2020 12:00:00 AM',4,763)
,(401,'ORAL COPULATION',249,'01/01/2020 12:00:00 AM',60,650)
,(402,'THEFT OF IDENTITY',125,'02/20/2020 12:00:00 AM',36,223)
,(403,'THEFT PLAIN - PETTY ($950 & UNDER)',43,'11/05/2020 12:00:00 AM',6,597)
,(404,'BURGLARY FROM VEHICLE',11,'03/20/2020 12:00:00 AM',9,799)
,(405,'THEFT OF IDENTITY',169,'03/17/2020 12:00:00 AM',36,76)
,(406,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',140,'09/11/2020 12:00:00 AM',24,14)
,(407,'THEFT OF IDENTITY',224,'08/02/2020 12:00:00 AM',36,220)
,(408,'THEFT OF IDENTITY',66,'02/22/2020 12:00:00 AM',36,797)
,(409,'THEFT OF IDENTITY',186,'02/12/2020 12:00:00 AM',36,451)
,(410,'THEFT OF IDENTITY',268,'08/25/2020 12:00:00 AM',36,726)
,(411,'INTIMATE PARTNER - AGGRAVATED ASSAULT',85,'03/21/2020 12:00:00 AM',48,154)
,(412,'VEHICLE - STOLEN',237,'07/30/2020 12:00:00 AM',24,474)
,(413,'THEFT OF IDENTITY',129,'05/08/2020 12:00:00 AM',36,472)
,(414,'THEFT OF IDENTITY',15,'08/01/2020 12:00:00 AM',36,475)
,(415,'VEHICLE - STOLEN',268,'02/02/2020 12:00:00 AM',24,272)
,(416,'THEFT FROM MOTOR VEHICLE - GRAND ($950.01 AND OVER)',174,'12/29/2020 12:00:00 AM',18,611)
,(417,'THEFT OF IDENTITY',66,'01/01/2020 12:00:00 AM',36,768)
,(418,'THEFT OF IDENTITY',80,'05/06/2020 12:00:00 AM',36,591)
,(419,'THEFT OF IDENTITY',216,'01/01/2020 12:00:00 AM',36,66)
,(420,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',59,'06/29/2020 12:00:00 AM',24,330)
,(421,'CHILD ANNOYING (17YRS & UNDER)',241,'10/25/2020 12:00:00 AM',18,573)
,(422,'THEFT OF IDENTITY',22,'08/28/2020 12:00:00 AM',36,267)
,(423,'THEFT OF IDENTITY',173,'08/27/2020 12:00:00 AM',36,609)
,(424,'VANDALISM - FELONY ($400 & OVER, ALL CHURCH VANDALISMS)',193,'01/20/2020 12:00:00 AM',24,45)
,(425,'THEFT OF IDENTITY',0,'02/09/2020 12:00:00 AM',36,629)
,(426,'BURGLARY',163,'02/16/2020 12:00:00 AM',36,389)
,(427,'RAPE, FORCIBLE',46,'12/01/2020 12:00:00 AM',240,507)
,(428,'PEEPING TOM',248,'04/01/2020 12:00:00 AM',9,457)
,(429,'PICKPOCKET',127,'06/24/2020 12:00:00 AM',9,162)
,(430,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',171,'01/20/2020 12:00:00 AM',4,282)
,(431,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',82,'03/01/2020 12:00:00 AM',24,431)
,(432,'BATTERY - SIMPLE ASSAULT',70,'09/20/2020 12:00:00 AM',9,347)
,(433,'THEFT OF IDENTITY',95,'02/01/2020 12:00:00 AM',36,189)
,(434,'SEX,UNLAWFUL(INC MUTUAL CONSENT, PENETRATION W/ FRGN OBJ',54,'08/29/2020 12:00:00 AM',36,498)
,(435,'THEFT OF IDENTITY',163,'05/09/2020 12:00:00 AM',36,237)
,(436,'BATTERY - SIMPLE ASSAULT',261,'03/12/2020 12:00:00 AM',9,27)
,(437,'THEFT OF IDENTITY',76,'09/01/2020 12:00:00 AM',36,117)
,(438,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',86,'10/30/2020 12:00:00 AM',24,273)
,(439,'THEFT OF IDENTITY',222,'01/01/2020 12:00:00 AM',36,415)
,(440,'THEFT OF IDENTITY',221,'11/09/2020 12:00:00 AM',36,727)
,(441,'THEFT OF IDENTITY',215,'07/24/2020 12:00:00 AM',36,557)
,(442,'THEFT OF IDENTITY',135,'07/01/2020 12:00:00 AM',36,500)
,(443,'THEFT OF IDENTITY',208,'07/18/2020 12:00:00 AM',36,504)
,(444,'THEFT PLAIN - PETTY ($950 & UNDER)',138,'12/20/2020 12:00:00 AM',6,696)
,(445,'THEFT OF IDENTITY',66,'01/01/2020 12:00:00 AM',36,150)
,(446,'BIKE - STOLEN',278,'12/04/2020 12:00:00 AM',4,379)
,(447,'THEFT OF IDENTITY',152,'03/05/2020 12:00:00 AM',36,513)
,(448,'THEFT OF IDENTITY',206,'04/03/2020 12:00:00 AM',36,488)
,(449,'VEHICLE - STOLEN',279,'01/08/2020 12:00:00 AM',24,383)
,(450,'THEFT OF IDENTITY',161,'09/07/2020 12:00:00 AM',36,479)
,(451,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',170,'06/04/2020 12:00:00 AM',18,13)
,(452,'DOCUMENT FORGERY / STOLEN FELONY',142,'10/15/2020 12:00:00 AM',48,494)
,(453,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',270,'01/01/2020 12:00:00 AM',24,77)
,(454,'THEFT OF IDENTITY',185,'03/25/2020 12:00:00 AM',36,5)
,(455,'THEFT OF IDENTITY',154,'09/18/2020 12:00:00 AM',36,143)
,(456,'THEFT OF IDENTITY',188,'02/01/2020 12:00:00 AM',36,283)
,(457,'THEFT OF IDENTITY',6,'11/01/2020 12:00:00 AM',36,519)
,(458,'VIOLATION OF COURT ORDER',258,'11/17/2020 12:00:00 AM',12,699)
,(459,'DOCUMENT FORGERY / STOLEN FELONY',118,'12/04/2020 12:00:00 AM',48,482)
,(460,'THEFT FROM MOTOR VEHICLE - GRAND ($950.01 AND OVER)',146,'04/27/2020 12:00:00 AM',18,78)
,(461,'THEFT OF IDENTITY',77,'09/03/2020 12:00:00 AM',36,1)
,(462,'THEFT PLAIN - PETTY ($950 & UNDER)',198,'03/15/2020 12:00:00 AM',6,432)
,(463,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',83,'05/09/2020 12:00:00 AM',4,109)
,(464,'THEFT OF IDENTITY',201,'12/08/2020 12:00:00 AM',36,323)
,(465,'THEFT OF IDENTITY',214,'03/15/2020 12:00:00 AM',36,49)
,(466,'THEFT OF IDENTITY',169,'02/17/2020 12:00:00 AM',36,107)
,(467,'THEFT OF IDENTITY',124,'08/10/2020 12:00:00 AM',36,231)
,(468,'CRIMINAL THREATS - NO WEAPON DISPLAYED',149,'08/01/2020 12:00:00 AM',18,248)
,(469,'EMBEZZLEMENT, GRAND THEFT ($950.01 & OVER)',10,'12/28/2020 12:00:00 AM',36,311)
,(470,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',244,'06/09/2020 12:00:00 AM',18,448)
,(471,'ORAL COPULATION',154,'11/27/2020 12:00:00 AM',60,401)
,(472,'EMBEZZLEMENT, GRAND THEFT ($950.01 & OVER)',71,'07/01/2020 12:00:00 AM',36,232)
,(473,'THEFT OF IDENTITY',51,'04/29/2020 12:00:00 AM',36,456)
,(474,'THEFT OF IDENTITY',91,'01/01/2020 12:00:00 AM',36,678)
,(475,'RAPE, FORCIBLE',178,'10/16/2020 12:00:00 AM',240,799)
,(476,'THEFT OF IDENTITY',279,'02/25/2020 12:00:00 AM',36,689)
,(477,'THEFT OF IDENTITY',263,'01/01/2020 12:00:00 AM',36,129)
,(478,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',237,'01/09/2020 12:00:00 AM',24,578)
,(479,'THEFT OF IDENTITY',48,'05/05/2020 12:00:00 AM',36,561)
,(480,'OTHER MISCELLANEOUS CRIME',21,'01/17/2020 12:00:00 AM',12,738)
,(481,'PICKPOCKET',99,'10/30/2020 12:00:00 AM',9,604)
,(482,'OTHER MISCELLANEOUS CRIME',139,'04/11/2020 12:00:00 AM',12,651)
,(483,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',162,'01/01/2020 12:00:00 AM',18,559)
,(484,'BUNCO, GRAND THEFT',131,'12/11/2020 12:00:00 AM',24,259)
,(485,'SEXUAL PENETRATION W/FOREIGN OBJECT',109,'05/01/2020 12:00:00 AM',96,453)
,(486,'THEFT OF IDENTITY',257,'12/01/2020 12:00:00 AM',36,130)
,(487,'THEFT OF IDENTITY',243,'05/13/2020 12:00:00 AM',36,435)
,(488,'THEFT PLAIN - PETTY ($950 & UNDER)',121,'08/03/2020 12:00:00 AM',6,167)
,(489,'VANDALISM - MISDEAMEANOR ($399 OR UNDER)',116,'12/30/2020 12:00:00 AM',3,184)
,(490,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',207,'11/15/2020 12:00:00 AM',4,199)
,(491,'VEHICLE - STOLEN',293,'04/20/2020 12:00:00 AM',24,790)
,(492,'THEFT OF IDENTITY',172,'01/01/2020 12:00:00 AM',36,96)
,(493,'THEFT OF IDENTITY',13,'10/01/2020 12:00:00 AM',36,22)
,(494,'SEX,UNLAWFUL(INC MUTUAL CONSENT, PENETRATION W/ FRGN OBJ',210,'12/25/2020 12:00:00 AM',36,632)
,(495,'CHILD ABUSE (PHYSICAL) - SIMPLE ASSAULT',209,'12/21/2020 12:00:00 AM',24,728)
,(496,'THEFT OF IDENTITY',30,'02/23/2020 12:00:00 AM',36,757)
,(497,'THEFT OF IDENTITY',117,'07/06/2020 12:00:00 AM',36,150)
,(498,'THEFT OF IDENTITY',4,'06/08/2020 12:00:00 AM',36,121)
,(499,'VEHICLE - STOLEN',126,'07/04/2020 12:00:00 AM',24,380)
,(500,'BURGLARY',34,'06/01/2020 12:00:00 AM',36,776)
,(501,'BRANDISH WEAPON',166,'02/13/2020 12:00:00 AM',24,139)
,(502,'VANDALISM - MISDEAMEANOR ($399 OR UNDER)',284,'11/10/2020 12:00:00 AM',3,583)
,(503,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',183,'10/06/2020 12:00:00 AM',180,243)
,(504,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',49,'08/01/2020 12:00:00 AM',4,252)
,(505,'THEFT OF IDENTITY',131,'10/17/2020 12:00:00 AM',36,148)
,(506,'THEFT OF IDENTITY',114,'02/21/2020 12:00:00 AM',36,180)
,(507,'RAPE, FORCIBLE',176,'06/25/2020 12:00:00 AM',240,665)
,(508,'THEFT OF IDENTITY',206,'03/10/2020 12:00:00 AM',36,0)
,(509,'THEFT OF IDENTITY',185,'12/01/2020 12:00:00 AM',36,327)
,(510,'THEFT OF IDENTITY',200,'06/13/2020 12:00:00 AM',36,778)
,(511,'EMBEZZLEMENT, GRAND THEFT ($950.01 & OVER)',240,'01/01/2020 12:00:00 AM',36,74)
,(512,'THEFT OF IDENTITY',72,'06/15/2020 12:00:00 AM',36,98)
,(513,'THEFT OF IDENTITY',50,'10/01/2020 12:00:00 AM',36,465)
,(514,'VEHICLE - STOLEN',69,'09/11/2020 12:00:00 AM',24,585)
,(515,'THEFT OF IDENTITY',285,'07/31/2020 12:00:00 AM',36,468)
,(516,'THEFT OF IDENTITY',212,'10/01/2020 12:00:00 AM',36,288)
,(517,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',96,'10/01/2020 12:00:00 AM',18,744)
,(518,'RAPE, FORCIBLE',3,'02/01/2020 12:00:00 AM',240,53)
,(519,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',234,'12/01/2020 12:00:00 AM',24,190)
,(520,'THEFT OF IDENTITY',161,'06/01/2020 12:00:00 AM',36,168)
,(521,'BUNCO, GRAND THEFT',184,'04/27/2020 12:00:00 AM',24,335)
,(522,'THEFT OF IDENTITY',135,'01/05/2020 12:00:00 AM',36,101)
,(523,'THEFT OF IDENTITY',167,'03/20/2020 12:00:00 AM',36,617)
,(524,'THEFT OF IDENTITY',91,'12/09/2020 12:00:00 AM',36,267)
,(525,'THEFT OF IDENTITY',97,'01/01/2020 12:00:00 AM',36,91)
,(526,'THEFT OF IDENTITY',51,'08/08/2020 12:00:00 AM',36,61)
,(527,'THEFT OF IDENTITY',288,'05/29/2020 12:00:00 AM',36,653)
,(528,'CONTEMPT OF COURT',171,'08/04/2020 12:00:00 AM',6,344)
,(529,'VEHICLE - STOLEN',233,'07/20/2020 12:00:00 AM',24,246)
,(530,'VANDALISM - MISDEAMEANOR ($399 OR UNDER)',57,'04/17/2020 12:00:00 AM',3,92)
,(531,'BURGLARY',275,'12/15/2020 12:00:00 AM',36,687)
,(532,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',222,'06/01/2020 12:00:00 AM',180,439)
,(533,'INTIMATE PARTNER - SIMPLE ASSAULT',85,'07/03/2020 12:00:00 AM',9,174)
,(534,'INTIMATE PARTNER - AGGRAVATED ASSAULT',85,'02/26/2020 12:00:00 AM',48,587)
,(535,'THEFT OF IDENTITY',115,'05/24/2020 12:00:00 AM',36,50)
,(536,'THEFT OF IDENTITY',186,'01/01/2020 12:00:00 AM',36,405)
,(537,'VEHICLE - STOLEN',213,'07/10/2020 12:00:00 AM',24,357)
,(538,'BURGLARY',36,'12/15/2020 12:00:00 AM',36,452)
,(539,'THEFT OF IDENTITY',129,'04/01/2020 12:00:00 AM',36,660)
,(540,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',170,'06/26/2020 12:00:00 AM',18,362)
,(541,'THEFT OF IDENTITY',201,'03/07/2020 12:00:00 AM',36,670)
,(542,'THEFT OF IDENTITY',54,'08/17/2020 12:00:00 AM',36,85)
,(543,'THEFT OF IDENTITY',24,'08/19/2020 12:00:00 AM',36,191)
,(544,'INTIMATE PARTNER - AGGRAVATED ASSAULT',171,'11/01/2020 12:00:00 AM',48,245)
,(545,'THEFT OF IDENTITY',169,'03/16/2020 12:00:00 AM',36,618)
,(546,'THEFT OF IDENTITY',166,'03/07/2020 12:00:00 AM',36,205)
,(547,'THEFT OF IDENTITY',107,'06/01/2020 12:00:00 AM',36,630)
,(548,'THEFT OF IDENTITY',63,'12/05/2020 12:00:00 AM',36,316)
,(549,'THEFT OF IDENTITY',14,'05/08/2020 12:00:00 AM',36,580)
,(550,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',287,'01/22/2020 12:00:00 AM',180,530)
,(551,'THEFT OF IDENTITY',12,'12/17/2020 12:00:00 AM',36,650)
,(552,'BURGLARY FROM VEHICLE',150,'02/19/2020 12:00:00 AM',9,776)
,(553,'THEFT OF IDENTITY',2,'11/10/2020 12:00:00 AM',36,69)
,(554,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',114,'03/28/2020 12:00:00 AM',18,708)
,(555,'EMBEZZLEMENT, GRAND THEFT ($950.01 & OVER)',4,'10/31/2020 12:00:00 AM',36,17)
,(556,'CHILD ABUSE (PHYSICAL) - SIMPLE ASSAULT',26,'06/01/2020 12:00:00 AM',24,232)
,(557,'BATTERY - SIMPLE ASSAULT',268,'10/30/2020 12:00:00 AM',9,135)
,(558,'THEFT OF IDENTITY',143,'12/24/2020 12:00:00 AM',36,278)
,(559,'THEFT OF IDENTITY',132,'06/12/2020 12:00:00 AM',36,140)
,(560,'THEFT OF IDENTITY',215,'01/01/2020 12:00:00 AM',36,424)
,(561,'RAPE, FORCIBLE',0,'10/01/2020 12:00:00 AM',240,235)
,(562,'THEFT OF IDENTITY',74,'12/01/2020 12:00:00 AM',36,197)
,(563,'VEHICLE - STOLEN',248,'10/19/2020 12:00:00 AM',24,93)
,(564,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',269,'12/03/2020 12:00:00 AM',24,430)
,(565,'VEHICLE - STOLEN',9,'03/19/2020 12:00:00 AM',24,39)
,(566,'THEFT OF IDENTITY',88,'12/16/2020 12:00:00 AM',36,554)
,(567,'THEFT OF IDENTITY',259,'04/07/2020 12:00:00 AM',36,626)
,(568,'THEFT OF IDENTITY',36,'11/12/2020 12:00:00 AM',36,295)
,(569,'THEFT OF IDENTITY',281,'08/28/2020 12:00:00 AM',36,31)
,(570,'THEFT OF IDENTITY',170,'06/05/2020 12:00:00 AM',36,513)
,(571,'THEFT OF IDENTITY',27,'03/03/2020 12:00:00 AM',36,359)
,(572,'THEFT OF IDENTITY',85,'08/01/2020 12:00:00 AM',36,172)
,(573,'VIOLATION OF COURT ORDER',27,'12/05/2020 12:00:00 AM',12,33)
,(574,'THEFT OF IDENTITY',277,'01/12/2020 12:00:00 AM',36,34)
,(575,'INTIMATE PARTNER - SIMPLE ASSAULT',263,'10/14/2020 12:00:00 AM',9,304)
,(576,'DISTURBING THE PEACE',87,'11/01/2020 12:00:00 AM',4,397)
,(577,'THEFT OF IDENTITY',280,'04/01/2020 12:00:00 AM',36,646)
,(578,'VIOLATION OF RESTRAINING ORDER',150,'03/01/2020 12:00:00 AM',12,131)
,(579,'CHILD ANNOYING (17YRS & UNDER)',163,'01/01/2020 12:00:00 AM',18,517)
,(580,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',181,'10/28/2020 12:00:00 AM',18,60)
,(581,'THEFT OF IDENTITY',119,'12/13/2020 12:00:00 AM',36,447)
,(582,'THEFT OF IDENTITY',58,'12/04/2020 12:00:00 AM',36,240)
,(583,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',166,'10/21/2020 12:00:00 AM',24,705)
,(584,'CRIMINAL THREATS - NO WEAPON DISPLAYED',49,'11/01/2020 12:00:00 AM',18,563)
,(585,'THEFT OF IDENTITY',13,'03/01/2020 12:00:00 AM',36,10)
,(586,'THEFT OF IDENTITY',287,'01/01/2020 12:00:00 AM',36,181)
,(587,'THEFT OF IDENTITY',162,'06/05/2020 12:00:00 AM',36,440)
,(588,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',86,'05/01/2020 12:00:00 AM',4,466)
,(589,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',194,'12/12/2020 12:00:00 AM',18,732)
,(590,'INTIMATE PARTNER - AGGRAVATED ASSAULT',53,'02/01/2020 12:00:00 AM',48,404)
,(591,'THEFT OF IDENTITY',7,'08/11/2020 12:00:00 AM',36,499)
,(592,'SEXUAL PENETRATION W/FOREIGN OBJECT',246,'04/15/2020 12:00:00 AM',96,522)
,(593,'THEFT OF IDENTITY',188,'09/27/2020 12:00:00 AM',36,411)
,(594,'VEHICLE - STOLEN',271,'02/17/2020 12:00:00 AM',24,241)
,(595,'BURGLARY',230,'07/16/2020 12:00:00 AM',36,476)
,(596,'INTIMATE PARTNER - SIMPLE ASSAULT',6,'03/01/2020 12:00:00 AM',9,489)
,(597,'THEFT OF IDENTITY',257,'09/22/2020 12:00:00 AM',36,320)
,(598,'THEFT OF IDENTITY',165,'08/16/2020 12:00:00 AM',36,332)
,(599,'RAPE, FORCIBLE',81,'10/27/2020 12:00:00 AM',240,743)
,(600,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',259,'08/01/2020 12:00:00 AM',4,490)
,(601,'INTIMATE PARTNER - SIMPLE ASSAULT',277,'03/22/2020 12:00:00 AM',9,461)
,(602,'THEFT PLAIN - PETTY ($950 & UNDER)',144,'12/25/2020 12:00:00 AM',6,633)
,(603,'VANDALISM - FELONY ($400 & OVER, ALL CHURCH VANDALISMS)',53,'06/02/2020 12:00:00 AM',24,712)
,(604,'BURGLARY',271,'08/01/2020 12:00:00 AM',36,314)
,(605,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',52,'03/10/2020 12:00:00 AM',24,365)
,(606,'THEFT OF IDENTITY',273,'10/20/2020 12:00:00 AM',36,619)
,(607,'THEFT OF IDENTITY',146,'05/27/2020 12:00:00 AM',36,296)
,(608,'THEFT OF IDENTITY',282,'06/07/2020 12:00:00 AM',36,58)
,(609,'THEFT OF IDENTITY',85,'11/06/2020 12:00:00 AM',36,690)
,(610,'THEFT OF IDENTITY',109,'06/01/2020 12:00:00 AM',36,562)
,(611,'CHILD ANNOYING (17YRS & UNDER)',90,'01/01/2020 12:00:00 AM',18,234)
,(612,'RAPE, FORCIBLE',8,'08/01/2020 12:00:00 AM',240,313)
,(613,'VEHICLE - STOLEN',59,'05/28/2020 12:00:00 AM',24,612)
,(614,'BURGLARY',286,'12/20/2020 12:00:00 AM',36,48)
,(615,'THEFT OF IDENTITY',11,'03/15/2020 12:00:00 AM',36,794)
,(616,'THEFT OF IDENTITY',153,'04/30/2020 12:00:00 AM',36,62)
,(617,'BUNCO, GRAND THEFT',5,'10/28/2020 12:00:00 AM',24,685)
,(618,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',113,'11/18/2020 12:00:00 AM',24,631)
,(619,'THEFT OF IDENTITY',198,'04/15/2020 12:00:00 AM',36,545)
,(620,'THEFT OF IDENTITY',296,'07/20/2020 12:00:00 AM',36,268)
,(621,'VEHICLE - STOLEN',195,'04/02/2020 12:00:00 AM',24,740)
,(622,'THEFT OF IDENTITY',83,'07/11/2020 12:00:00 AM',36,373)
,(623,'SEX,UNLAWFUL(INC MUTUAL CONSENT, PENETRATION W/ FRGN OBJ',179,'01/04/2020 12:00:00 AM',36,632)
,(624,'THEFT OF IDENTITY',17,'12/18/2020 12:00:00 AM',36,323)
,(625,'BURGLARY',72,'05/30/2020 12:00:00 AM',36,132)
,(626,'FALSE POLICE REPORT',252,'03/01/2020 12:00:00 AM',9,672)
,(627,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',20,'08/12/2020 12:00:00 AM',18,152)
,(628,'THEFT OF IDENTITY',220,'10/15/2020 12:00:00 AM',36,742)
,(629,'SHOPLIFTING - PETTY THEFT ($950 & UNDER)',267,'03/11/2020 12:00:00 AM',6,560)
,(630,'THEFT OF IDENTITY',58,'01/01/2020 12:00:00 AM',36,156)
,(631,'THEFT OF IDENTITY',29,'08/23/2020 12:00:00 AM',36,782)
,(632,'THEFT OF IDENTITY',245,'11/18/2020 12:00:00 AM',36,412)
,(633,'RAPE, FORCIBLE',81,'01/01/2020 12:00:00 AM',240,36)
,(634,'SEXUAL PENETRATION W/FOREIGN OBJECT',25,'06/01/2020 12:00:00 AM',96,406)
,(635,'BATTERY WITH SEXUAL CONTACT',197,'08/15/2020 12:00:00 AM',36,384)
,(636,'BATTERY - SIMPLE ASSAULT',139,'10/30/2020 12:00:00 AM',9,193)
,(637,'VIOLATION OF RESTRAINING ORDER',153,'08/21/2020 12:00:00 AM',12,257)
,(638,'THEFT OF IDENTITY',220,'03/28/2020 12:00:00 AM',36,769)
,(639,'RAPE, FORCIBLE',128,'01/20/2020 12:00:00 AM',240,535)
,(640,'THEFT OF IDENTITY',254,'01/01/2020 12:00:00 AM',36,605)
,(641,'VEHICLE - STOLEN',88,'02/07/2020 12:00:00 AM',24,242)
,(642,'THEFT OF IDENTITY',0,'10/30/2020 12:00:00 AM',36,536)
,(643,'INTIMATE PARTNER - SIMPLE ASSAULT',160,'11/21/2020 12:00:00 AM',9,541)
,(644,'THEFT OF IDENTITY',241,'04/08/2020 12:00:00 AM',36,366)
,(645,'THEFT OF IDENTITY',93,'05/20/2020 12:00:00 AM',36,385)
,(646,'THEFT OF IDENTITY',115,'09/01/2020 12:00:00 AM',36,531)
,(647,'THEFT OF IDENTITY',266,'09/20/2020 12:00:00 AM',36,79)
,(648,'THEFT OF IDENTITY',117,'01/15/2020 12:00:00 AM',36,592)
,(649,'THEFT OF IDENTITY',83,'02/01/2020 12:00:00 AM',36,172)
,(650,'BATTERY - SIMPLE ASSAULT',99,'11/16/2020 12:00:00 AM',9,551)
,(651,'EMBEZZLEMENT, GRAND THEFT ($950.01 & OVER)',115,'11/16/2020 12:00:00 AM',36,606)
,(652,'BATTERY WITH SEXUAL CONTACT',111,'11/01/2020 12:00:00 AM',36,673)
,(653,'VEHICLE - STOLEN',254,'09/25/2020 12:00:00 AM',24,187)
,(654,'THEFT OF IDENTITY',216,'12/17/2020 12:00:00 AM',36,238)
,(655,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',161,'10/01/2020 12:00:00 AM',180,136)
,(656,'THEFT OF IDENTITY',242,'09/01/2020 12:00:00 AM',36,204)
,(657,'THEFT OF IDENTITY',193,'07/14/2020 12:00:00 AM',36,95)
,(658,'THEFT OF IDENTITY',107,'01/08/2020 12:00:00 AM',36,367)
,(659,'THEFT OF IDENTITY',196,'03/10/2020 12:00:00 AM',36,110)
,(660,'THEFT OF IDENTITY',96,'10/17/2020 12:00:00 AM',36,285)
,(661,'VIOLATION OF COURT ORDER',234,'01/01/2020 12:00:00 AM',12,462)
,(662,'THEFT OF IDENTITY',242,'11/04/2020 12:00:00 AM',36,387)
,(663,'RAPE, FORCIBLE',198,'08/22/2020 12:00:00 AM',240,394)
,(664,'THEFT OF IDENTITY',168,'07/20/2020 12:00:00 AM',36,150)
,(665,'THEFT OF IDENTITY',163,'03/15/2020 12:00:00 AM',36,291)
,(666,'CRIMINAL THREATS - NO WEAPON DISPLAYED',140,'10/18/2020 12:00:00 AM',18,478)
,(667,'THEFT OF IDENTITY',213,'01/01/2020 12:00:00 AM',36,254)
,(668,'THEFT OF IDENTITY',24,'01/25/2020 12:00:00 AM',36,750)
,(669,'THEFT OF IDENTITY',265,'02/02/2020 12:00:00 AM',36,436)
,(670,'THEFT OF IDENTITY',86,'06/30/2020 12:00:00 AM',36,782)
,(671,'THEFT OF IDENTITY',30,'01/04/2020 12:00:00 AM',36,18)
,(672,'VEHICLE - STOLEN',251,'01/01/2020 12:00:00 AM',24,345)
,(673,'THEFT OF IDENTITY',189,'01/01/2020 12:00:00 AM',36,212)
,(674,'THEFT OF IDENTITY',26,'01/01/2020 12:00:00 AM',36,386)
,(675,'VEHICLE - STOLEN',204,'03/24/2020 12:00:00 AM',24,714)
,(676,'RAPE, FORCIBLE',19,'04/27/2020 12:00:00 AM',240,34)
,(677,'THEFT OF IDENTITY',115,'08/05/2020 12:00:00 AM',36,607)
,(678,'THEFT OF IDENTITY',237,'02/26/2020 12:00:00 AM',36,360)
,(679,'BURGLARY FROM VEHICLE',120,'08/19/2020 12:00:00 AM',9,70)
,(680,'CREDIT CARDS, FRAUD USE ($950.01 & OVER)',280,'10/01/2020 12:00:00 AM',24,19)
,(681,'THEFT PLAIN - PETTY ($950 & UNDER)',116,'02/10/2020 12:00:00 AM',6,226)
,(682,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',46,'04/22/2020 12:00:00 AM',24,265)
,(683,'THEFT OF IDENTITY',265,'01/01/2020 12:00:00 AM',36,146)
,(684,'THEFT OF IDENTITY',82,'12/01/2020 12:00:00 AM',36,165)
,(685,'EMBEZZLEMENT, GRAND THEFT ($950.01 & OVER)',6,'11/01/2020 12:00:00 AM',36,771)
,(686,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',199,'01/01/2020 12:00:00 AM',180,213)
,(687,'THEFT OF IDENTITY',266,'06/22/2020 12:00:00 AM',36,706)
,(688,'THEFT OF IDENTITY',244,'01/12/2020 12:00:00 AM',36,220)
,(689,'RAPE, FORCIBLE',26,'07/08/2020 12:00:00 AM',240,483)
,(690,'SEX,UNLAWFUL(INC MUTUAL CONSENT, PENETRATION W/ FRGN OBJ',214,'11/01/2020 12:00:00 AM',36,321)
,(691,'THEFT OF IDENTITY',232,'04/01/2020 12:00:00 AM',36,30)
,(692,'THEFT OF IDENTITY',237,'08/06/2020 12:00:00 AM',36,115)
,(693,'THEFT PLAIN - PETTY ($950 & UNDER)',222,'11/14/2020 12:00:00 AM',6,698)
,(694,'THEFT OF IDENTITY',166,'07/05/2020 12:00:00 AM',36,250)
,(695,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',297,'11/18/2020 12:00:00 AM',4,359)
,(696,'DISTURBING THE PEACE',202,'06/01/2020 12:00:00 AM',4,514)
,(697,'THEFT OF IDENTITY',37,'08/31/2020 12:00:00 AM',36,586)
,(698,'THEFT OF IDENTITY',57,'06/12/2020 12:00:00 AM',36,332)
,(699,'VANDALISM - FELONY ($400 & OVER, ALL CHURCH VANDALISMS)',5,'11/03/2020 12:00:00 AM',24,2)
,(700,'INTIMATE PARTNER - AGGRAVATED ASSAULT',199,'02/04/2020 12:00:00 AM',48,683)
,(701,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',52,'03/01/2020 12:00:00 AM',24,140)
,(702,'INTIMATE PARTNER - AGGRAVATED ASSAULT',192,'05/25/2020 12:00:00 AM',48,722)
,(703,'VEHICLE - STOLEN',213,'07/05/2020 12:00:00 AM',24,649)
,(704,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',157,'04/02/2020 12:00:00 AM',24,613)
,(705,'THEFT OF IDENTITY',276,'05/01/2020 12:00:00 AM',36,340)
,(706,'THEFT OF IDENTITY',244,'02/09/2020 12:00:00 AM',36,40)
,(707,'THEFT OF IDENTITY',282,'11/12/2020 12:00:00 AM',36,299)
,(708,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',134,'12/18/2020 12:00:00 AM',24,563)
,(709,'INTIMATE PARTNER - SIMPLE ASSAULT',68,'11/20/2020 12:00:00 AM',9,399)
,(710,'THEFT OF IDENTITY',133,'01/01/2020 12:00:00 AM',36,787)
,(711,'THEFT OF IDENTITY',186,'04/17/2020 12:00:00 AM',36,776)
,(712,'THEFT OF IDENTITY',296,'12/01/2020 12:00:00 AM',36,707)
,(713,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',179,'04/01/2020 12:00:00 AM',180,265)
,(714,'THEFT OF IDENTITY',283,'08/06/2020 12:00:00 AM',36,678)
,(715,'THEFT OF IDENTITY',98,'03/02/2020 12:00:00 AM',36,624)
,(716,'THEFT OF IDENTITY',227,'03/04/2020 12:00:00 AM',36,479)
,(717,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',236,'06/01/2020 12:00:00 AM',18,328)
,(718,'THEFT OF IDENTITY',95,'08/05/2020 12:00:00 AM',36,275)
,(719,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',271,'01/01/2020 12:00:00 AM',180,272)
,(720,'BUNCO, GRAND THEFT',166,'06/01/2020 12:00:00 AM',24,178)
,(721,'THEFT OF IDENTITY',38,'05/01/2020 12:00:00 AM',36,736)
,(722,'SEXUAL PENETRATION W/FOREIGN OBJECT',92,'01/01/2020 12:00:00 AM',96,784)
,(723,'THEFT OF IDENTITY',10,'01/18/2020 12:00:00 AM',36,217)
,(724,'CONTRIBUTING',295,'12/01/2020 12:00:00 AM',12,616)
,(725,'THEFT OF IDENTITY',61,'07/02/2020 12:00:00 AM',36,306)
,(726,'THEFT OF IDENTITY',71,'07/25/2020 12:00:00 AM',36,151)
,(727,'CHILD ABUSE (PHYSICAL) - SIMPLE ASSAULT',188,'01/01/2020 12:00:00 AM',24,260)
,(728,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',265,'09/19/2020 12:00:00 AM',4,121)
,(729,'VIOLATION OF COURT ORDER',131,'04/07/2020 12:00:00 AM',12,336)
,(730,'THEFT OF IDENTITY',255,'01/01/2020 12:00:00 AM',36,434)
,(731,'THEFT OF IDENTITY',216,'08/11/2020 12:00:00 AM',36,622)
,(732,'THEFT OF IDENTITY',80,'09/29/2020 12:00:00 AM',36,48)
,(733,'THEFT OF IDENTITY',121,'12/08/2020 12:00:00 AM',36,737)
,(734,'VANDALISM - FELONY ($400 & OVER, ALL CHURCH VANDALISMS)',161,'08/04/2020 12:00:00 AM',24,355)
,(735,'THEFT FROM MOTOR VEHICLE - GRAND ($950.01 AND OVER)',272,'11/01/2020 12:00:00 AM',18,697)
,(736,'THEFT OF IDENTITY',147,'06/03/2020 12:00:00 AM',36,755)
,(737,'THEFT OF IDENTITY',79,'02/12/2020 12:00:00 AM',36,705)
,(738,'THEFT OF IDENTITY',292,'08/28/2020 12:00:00 AM',36,674)
,(739,'THEFT OF IDENTITY',123,'11/19/2020 12:00:00 AM',36,564)
,(740,'THEFT OF IDENTITY',200,'07/06/2020 12:00:00 AM',36,786)
,(741,'EMBEZZLEMENT, GRAND THEFT ($950.01 & OVER)',92,'11/01/2020 12:00:00 AM',36,142)
,(742,'THEFT OF IDENTITY',212,'01/05/2020 12:00:00 AM',36,323)
,(743,'THEFT OF IDENTITY',136,'12/15/2020 12:00:00 AM',36,325)
,(744,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',265,'05/01/2020 12:00:00 AM',18,122)
,(745,'THEFT OF IDENTITY',205,'05/15/2020 12:00:00 AM',36,721)
,(746,'THEFT OF IDENTITY',150,'01/01/2020 12:00:00 AM',36,400)
,(747,'THEFT OF IDENTITY',255,'06/25/2020 12:00:00 AM',36,723)
,(748,'THEFT OF IDENTITY',188,'10/24/2020 12:00:00 AM',36,102)
,(749,'THEFT OF IDENTITY',247,'11/17/2020 12:00:00 AM',36,578)
,(750,'CHILD ABUSE (PHYSICAL) - SIMPLE ASSAULT',67,'01/09/2020 12:00:00 AM',24,751)
,(751,'THEFT OF IDENTITY',237,'06/22/2020 12:00:00 AM',36,314)
,(752,'RAPE, FORCIBLE',1,'01/01/2020 12:00:00 AM',240,62)
,(753,'THEFT OF IDENTITY',141,'07/09/2020 12:00:00 AM',36,558)
,(754,'BURGLARY FROM VEHICLE',240,'08/07/2020 12:00:00 AM',9,645)
,(755,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',190,'08/01/2020 12:00:00 AM',18,108)
,(756,'VANDALISM - MISDEAMEANOR ($399 OR UNDER)',174,'09/02/2020 12:00:00 AM',3,772)
,(757,'THEFT OF IDENTITY',297,'01/20/2020 12:00:00 AM',36,301)
,(758,'BATTERY WITH SEXUAL CONTACT',164,'05/01/2020 12:00:00 AM',36,565)
,(759,'THEFT OF IDENTITY',256,'02/01/2020 12:00:00 AM',36,703)
,(760,'INTIMATE PARTNER - SIMPLE ASSAULT',256,'01/01/2020 12:00:00 AM',9,679)
,(761,'THEFT OF IDENTITY',154,'10/28/2020 12:00:00 AM',36,413)
,(762,'THEFT OF IDENTITY',279,'07/16/2020 12:00:00 AM',36,157)
,(763,'BATTERY WITH SEXUAL CONTACT',221,'01/15/2020 12:00:00 AM',36,336)
,(764,'VANDALISM - MISDEAMEANOR ($399 OR UNDER)',294,'12/20/2020 12:00:00 AM',3,86)
,(765,'EXTORTION',259,'11/02/2020 12:00:00 AM',48,144)
,(766,'THEFT OF IDENTITY',30,'11/01/2020 12:00:00 AM',36,552)
,(767,'THEFT PLAIN - PETTY ($950 & UNDER)',137,'12/18/2020 12:00:00 AM',6,161)
,(768,'THEFT OF IDENTITY',151,'12/01/2020 12:00:00 AM',36,125)
,(769,'THEFT OF IDENTITY',165,'01/14/2020 12:00:00 AM',36,587)
,(770,'THEFT OF IDENTITY',228,'01/22/2020 12:00:00 AM',36,755)
,(771,'CHILD ABUSE (PHYSICAL) - SIMPLE ASSAULT',33,'12/01/2020 12:00:00 AM',24,123)
,(772,'THEFT OF IDENTITY',104,'02/24/2020 12:00:00 AM',36,430)
,(773,'BURGLARY',158,'04/01/2020 12:00:00 AM',36,661)
,(774,'THEFT OF IDENTITY',262,'01/01/2020 12:00:00 AM',36,510)
,(775,'EMBEZZLEMENT, GRAND THEFT ($950.01 & OVER)',17,'12/14/2020 12:00:00 AM',36,87)
,(776,'BUNCO, GRAND THEFT',188,'09/09/2020 12:00:00 AM',24,795)
,(777,'INTIMATE PARTNER - SIMPLE ASSAULT',54,'11/16/2020 12:00:00 AM',9,542)
,(778,'RAPE, FORCIBLE',52,'01/01/2020 12:00:00 AM',240,472)
,(779,'INTIMATE PARTNER - SIMPLE ASSAULT',226,'07/11/2020 12:00:00 AM',9,623)
,(780,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',298,'08/01/2020 12:00:00 AM',24,425)
,(781,'THEFT OF IDENTITY',187,'02/02/2020 12:00:00 AM',36,491)
,(782,'THEFT OF IDENTITY',96,'09/14/2020 12:00:00 AM',36,262)
,(783,'THEFT OF IDENTITY',59,'03/26/2020 12:00:00 AM',36,594)
,(784,'THEFT OF IDENTITY',253,'09/09/2020 12:00:00 AM',36,644)
,(785,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',99,'01/01/2020 12:00:00 AM',180,546)
,(786,'THEFT OF IDENTITY',112,'01/17/2020 12:00:00 AM',36,447)
,(787,'THEFT OF IDENTITY',61,'08/01/2020 12:00:00 AM',36,20)
,(788,'INTIMATE PARTNER - SIMPLE ASSAULT',156,'02/02/2020 12:00:00 AM',9,776)
,(789,'THEFT OF IDENTITY',150,'10/31/2020 12:00:00 AM',36,526)
,(790,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',119,'08/01/2020 12:00:00 AM',180,747)
,(791,'THEFT OF IDENTITY',218,'11/06/2020 12:00:00 AM',36,638)
,(792,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',212,'08/05/2020 12:00:00 AM',18,23)
,(793,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',223,'03/16/2020 12:00:00 AM',24,641)
,(794,'THEFT OF IDENTITY',29,'01/01/2020 12:00:00 AM',36,292)
,(795,'THEFT OF IDENTITY',183,'12/30/2020 12:00:00 AM',36,270)
,(796,'RAPE, FORCIBLE',223,'06/19/2020 12:00:00 AM',240,328)
,(797,'THEFT OF IDENTITY',3,'08/03/2020 12:00:00 AM',36,454)
,(798,'BURGLARY',175,'01/19/2020 12:00:00 AM',36,337)
,(799,'FALSE IMPRISONMENT',199,'06/07/2020 12:00:00 AM',36,442)
,(800,'THEFT OF IDENTITY',198,'06/02/2020 12:00:00 AM',36,376)
,(801,'BUNCO, ATTEMPT',43,'07/10/2020 12:00:00 AM',6,547)
,(802,'BATTERY WITH SEXUAL CONTACT',290,'07/02/2020 12:00:00 AM',36,182)
,(803,'THEFT OF IDENTITY',212,'01/02/2020 12:00:00 AM',36,261)
,(804,'DOCUMENT FORGERY / STOLEN FELONY',203,'09/22/2020 12:00:00 AM',48,99)
,(805,'THEFT OF IDENTITY',110,'09/20/2020 12:00:00 AM',36,717)
,(806,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',56,'01/15/2020 12:00:00 AM',18,346)
,(807,'RAPE, FORCIBLE',235,'11/22/2020 12:00:00 AM',240,390)
,(808,'VEHICLE - STOLEN',182,'06/09/2020 12:00:00 AM',24,73)
,(809,'THEFT OF IDENTITY',289,'01/01/2020 12:00:00 AM',36,566)
,(810,'THEFT OF IDENTITY',16,'10/15/2020 12:00:00 AM',36,293)
,(811,'THEFT OF IDENTITY',137,'09/20/2020 12:00:00 AM',36,315)
,(812,'INTIMATE PARTNER - SIMPLE ASSAULT',102,'12/31/2020 12:00:00 AM',9,759)
,(813,'THEFT OF IDENTITY',94,'07/12/2020 12:00:00 AM',36,486)
,(814,'THEFT OF IDENTITY',22,'03/02/2020 12:00:00 AM',36,134)
,(815,'THEFT OF IDENTITY',75,'02/22/2020 12:00:00 AM',36,136)
,(816,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',243,'04/12/2020 12:00:00 AM',18,416)
,(817,'THEFT OF IDENTITY',59,'03/07/2020 12:00:00 AM',36,313)
,(818,'THEFT OF IDENTITY',69,'02/15/2020 12:00:00 AM',36,720)
,(819,'THEFT OF IDENTITY',92,'09/21/2020 12:00:00 AM',36,368)
,(820,'THEFT OF IDENTITY',149,'11/04/2020 12:00:00 AM',36,303)
,(821,'VEHICLE - STOLEN',275,'07/05/2020 12:00:00 AM',24,791)
,(822,'THEFT OF IDENTITY',252,'06/09/2020 12:00:00 AM',36,603)
,(823,'BURGLARY FROM VEHICLE',111,'12/19/2020 12:00:00 AM',9,581)
,(824,'THEFT OF IDENTITY',110,'11/27/2020 12:00:00 AM',36,239)
,(825,'THEFT OF IDENTITY',217,'02/01/2020 12:00:00 AM',36,147)
,(826,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',113,'10/14/2020 12:00:00 AM',24,576)
,(827,'VEHICLE - STOLEN',201,'10/15/2020 12:00:00 AM',24,713)
,(828,'THEFT PLAIN - PETTY ($950 & UNDER)',41,'12/20/2020 12:00:00 AM',6,393)
,(829,'THEFT OF IDENTITY',97,'05/06/2020 12:00:00 AM',36,543)
,(830,'BURGLARY FROM VEHICLE',6,'08/20/2020 12:00:00 AM',9,752)
,(831,'VEHICLE - STOLEN',45,'10/25/2020 12:00:00 AM',24,28)
,(832,'THEFT OF IDENTITY',187,'02/09/2020 12:00:00 AM',36,342)
,(833,'THEFT OF IDENTITY',145,'06/10/2020 12:00:00 AM',36,745)
,(834,'THEFT OF IDENTITY',286,'12/20/2020 12:00:00 AM',36,746)
,(835,'THEFT OF IDENTITY',70,'08/19/2020 12:00:00 AM',36,3)
,(836,'THEFT OF IDENTITY',131,'06/16/2020 12:00:00 AM',36,470)
,(837,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',26,'01/01/2020 12:00:00 AM',180,297)
,(838,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',147,'01/02/2020 12:00:00 AM',4,755)
,(839,'THEFT OF IDENTITY',6,'03/08/2020 12:00:00 AM',36,128)
,(840,'THEFT OF IDENTITY',228,'01/01/2020 12:00:00 AM',36,764)
,(841,'THEFT OF IDENTITY',291,'06/03/2020 12:00:00 AM',36,317)
,(842,'THEFT OF IDENTITY',97,'01/22/2020 12:00:00 AM',36,634)
,(843,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',76,'01/23/2020 12:00:00 AM',4,218)
,(844,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',6,'05/08/2020 12:00:00 AM',24,711)
,(845,'THEFT OF IDENTITY',103,'04/19/2020 12:00:00 AM',36,63)
,(846,'DOCUMENT FORGERY / STOLEN FELONY',237,'07/01/2020 12:00:00 AM',48,675)
,(847,'THEFT OF IDENTITY',108,'06/20/2020 12:00:00 AM',36,229)
,(848,'BATTERY - SIMPLE ASSAULT',139,'12/30/2020 12:00:00 AM',9,647)
,(849,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',3,'09/11/2020 12:00:00 AM',180,65)
,(850,'THEFT OF IDENTITY',52,'11/19/2020 12:00:00 AM',36,473)
,(851,'THEFT OF IDENTITY',187,'01/03/2020 12:00:00 AM',36,437)
,(852,'BUNCO, GRAND THEFT',250,'12/15/2020 12:00:00 AM',24,716)
,(853,'THEFT OF IDENTITY',11,'12/16/2020 12:00:00 AM',36,202)
,(854,'THEFT OF IDENTITY',236,'06/30/2020 12:00:00 AM',36,549)
,(855,'CHILD ABUSE (PHYSICAL) - SIMPLE ASSAULT',267,'07/01/2020 12:00:00 AM',24,111)
,(856,'THEFT OF IDENTITY',117,'02/20/2020 12:00:00 AM',36,6)
,(857,'VEHICLE - STOLEN',150,'07/01/2020 12:00:00 AM',24,622)
,(858,'THEFT OF IDENTITY',177,'07/21/2020 12:00:00 AM',36,439)
,(859,'THEFT OF IDENTITY',125,'08/12/2020 12:00:00 AM',36,186)
,(860,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',55,'06/22/2020 12:00:00 AM',18,251)
,(861,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',198,'07/10/2020 12:00:00 AM',180,718)
,(862,'BATTERY - SIMPLE ASSAULT',39,'09/29/2020 12:00:00 AM',9,90)
,(863,'THEFT PLAIN - PETTY ($950 & UNDER)',121,'07/20/2020 12:00:00 AM',6,155)
,(864,'THEFT OF IDENTITY',50,'01/01/2020 12:00:00 AM',36,24)
,(865,'THEFT OF IDENTITY',34,'03/19/2020 12:00:00 AM',36,553)
,(866,'THEFT OF IDENTITY',79,'10/07/2020 12:00:00 AM',36,746)
,(867,'THEFT OF IDENTITY',183,'03/03/2020 12:00:00 AM',36,662)
,(868,'SEXUAL PENETRATION W/FOREIGN OBJECT',222,'09/01/2020 12:00:00 AM',96,12)
,(869,'VEHICLE - STOLEN',126,'04/28/2020 12:00:00 AM',24,274)
,(870,'SEXUAL PENETRATION W/FOREIGN OBJECT',292,'06/15/2020 12:00:00 AM',96,209)
,(871,'THEFT OF IDENTITY',60,'07/07/2020 12:00:00 AM',36,312)
,(872,'THEFT OF IDENTITY',44,'11/12/2020 12:00:00 AM',36,369)
,(873,'THEFT OF IDENTITY',109,'08/19/2020 12:00:00 AM',36,15)
,(874,'THEFT OF IDENTITY',216,'08/20/2020 12:00:00 AM',36,463)
,(875,'THEFT OF IDENTITY',63,'07/16/2020 12:00:00 AM',36,89)
,(876,'SEX,UNLAWFUL(INC MUTUAL CONSENT, PENETRATION W/ FRGN OBJ',10,'07/22/2020 12:00:00 AM',36,663)
,(877,'THEFT OF IDENTITY',208,'11/19/2020 12:00:00 AM',36,502)
,(878,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',229,'03/15/2020 12:00:00 AM',180,263)
,(879,'THEFT PLAIN - PETTY ($950 & UNDER)',82,'11/18/2020 12:00:00 AM',6,446)
,(880,'THEFT OF IDENTITY',21,'02/09/2020 12:00:00 AM',36,278)
,(881,'VANDALISM - FELONY ($400 & OVER, ALL CHURCH VANDALISMS)',65,'10/30/2020 12:00:00 AM',24,334)
,(882,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',192,'03/08/2020 12:00:00 AM',18,594)
,(883,'THEFT OF IDENTITY',178,'11/17/2020 12:00:00 AM',36,224)
,(884,'THEFT OF IDENTITY',285,'02/09/2020 12:00:00 AM',36,362)
,(885,'THEFT OF IDENTITY',77,'07/27/2020 12:00:00 AM',36,788)
,(886,'VEHICLE - STOLEN',92,'09/01/2020 12:00:00 AM',24,455)
,(887,'CHILD ABUSE (PHYSICAL) - SIMPLE ASSAULT',32,'09/01/2020 12:00:00 AM',24,24)
,(888,'THEFT OF IDENTITY',286,'07/04/2020 12:00:00 AM',36,184)
,(889,'THEFT OF IDENTITY',181,'04/25/2020 12:00:00 AM',36,468)
,(890,'THEFT OF IDENTITY',101,'02/06/2020 12:00:00 AM',36,414)
,(891,'THEFT OF IDENTITY',95,'02/10/2020 12:00:00 AM',36,798)
,(892,'THEFT OF IDENTITY',149,'06/30/2020 12:00:00 AM',36,329)
,(893,'THEFT OF IDENTITY',123,'08/01/2020 12:00:00 AM',36,326)
,(894,'THEFT OF IDENTITY',155,'09/03/2020 12:00:00 AM',36,588)
,(895,'BURGLARY',121,'01/01/2020 12:00:00 AM',36,593)
,(896,'THEFT OF IDENTITY',68,'01/27/2020 12:00:00 AM',36,62)
,(897,'THEFT OF IDENTITY',180,'01/06/2020 12:00:00 AM',36,361)
,(898,'THEFT OF IDENTITY',245,'10/24/2020 12:00:00 AM',36,379)
,(899,'THEFT OF IDENTITY',15,'08/17/2020 12:00:00 AM',36,454)
,(900,'SEXUAL PENETRATION W/FOREIGN OBJECT',64,'07/05/2020 12:00:00 AM',96,572)
,(901,'THEFT OF IDENTITY',62,'11/19/2020 12:00:00 AM',36,55)
,(902,'VEHICLE - STOLEN',44,'03/06/2020 12:00:00 AM',24,57)
,(903,'THEFT FROM MOTOR VEHICLE - GRAND ($950.01 AND OVER)',223,'12/17/2020 12:00:00 AM',18,83)
,(904,'THEFT OF IDENTITY',246,'12/29/2020 12:00:00 AM',36,307)
,(905,'THEFT OF IDENTITY',177,'07/05/2020 12:00:00 AM',36,264)
,(906,'BUNCO, GRAND THEFT',98,'06/01/2020 12:00:00 AM',24,793)
,(907,'PICKPOCKET',192,'09/22/2020 12:00:00 AM',9,53)
,(908,'BURGLARY',64,'12/20/2020 12:00:00 AM',36,92)
,(909,'THEFT OF IDENTITY',246,'06/07/2020 12:00:00 AM',36,74)
,(910,'BUNCO, GRAND THEFT',148,'03/01/2020 12:00:00 AM',24,796)
,(911,'THEFT OF IDENTITY',22,'05/28/2020 12:00:00 AM',36,770)
,(912,'INTIMATE PARTNER - SIMPLE ASSAULT',62,'01/01/2020 12:00:00 AM',9,407)
,(913,'VEHICLE - STOLEN',152,'11/18/2020 12:00:00 AM',24,401)
,(914,'INTIMATE PARTNER - AGGRAVATED ASSAULT',122,'01/01/2020 12:00:00 AM',48,29)
,(915,'THEFT OF IDENTITY',28,'07/02/2020 12:00:00 AM',36,195)
,(916,'THEFT OF IDENTITY',88,'01/02/2020 12:00:00 AM',36,655)
,(917,'THEFT OF IDENTITY',296,'01/01/2020 12:00:00 AM',36,408)
,(918,'CHILD ABUSE (PHYSICAL) - AGGRAVATED ASSAULT',62,'08/01/2020 12:00:00 AM',48,175)
,(919,'THEFT OF IDENTITY',137,'01/09/2020 12:00:00 AM',36,538)
,(920,'THEFT OF IDENTITY',211,'08/04/2020 12:00:00 AM',36,656)
,(921,'THEFT OF IDENTITY',184,'04/01/2020 12:00:00 AM',36,518)
,(922,'THEFT PLAIN - PETTY ($950 & UNDER)',162,'12/12/2020 12:00:00 AM',6,358)
,(923,'THEFT OF IDENTITY',264,'01/06/2020 12:00:00 AM',36,729)
,(924,'THEFT OF IDENTITY',253,'01/14/2020 12:00:00 AM',36,444)
,(925,'ATTEMPTED ROBBERY',265,'04/19/2020 12:00:00 AM',36,289)
,(926,'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)',259,'03/15/2020 12:00:00 AM',4,169)
,(927,'DOCUMENT FORGERY / STOLEN FELONY',99,'10/26/2020 12:00:00 AM',48,456)
,(928,'BURGLARY',48,'11/24/2020 12:00:00 AM',36,748)
,(929,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',270,'05/28/2020 12:00:00 AM',24,680)
,(930,'RAPE, FORCIBLE',25,'09/01/2020 12:00:00 AM',240,298)
,(931,'ASSAULT WITH DEADLY WEAPON, AGGRAVATED ASSAULT',194,'11/18/2020 12:00:00 AM',48,18)
,(932,'RAPE, FORCIBLE',24,'03/01/2020 12:00:00 AM',240,481)
,(933,'EMBEZZLEMENT, GRAND THEFT ($950.01 & OVER)',16,'10/28/2020 12:00:00 AM',36,304)
,(934,'THEFT OF IDENTITY',106,'01/01/2020 12:00:00 AM',36,333)
,(935,'UNAUTHORIZED COMPUTER ACCESS',290,'01/03/2020 12:00:00 AM',12,567)
,(936,'VANDALISM - FELONY ($400 & OVER, ALL CHURCH VANDALISMS)',188,'09/24/2020 12:00:00 AM',24,519)
,(937,'THEFT OF IDENTITY',221,'01/01/2020 12:00:00 AM',36,401)
,(938,'THEFT OF IDENTITY',6,'06/03/2020 12:00:00 AM',36,709)
,(939,'THEFT OF IDENTITY',284,'09/20/2020 12:00:00 AM',36,753)
,(940,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',224,'08/20/2020 12:00:00 AM',18,532)
,(941,'THEFT PLAIN - PETTY ($950 & UNDER)',225,'11/03/2020 12:00:00 AM',6,170)
,(942,'THEFT OF IDENTITY',1,'06/15/2020 12:00:00 AM',36,205)
,(943,'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD',112,'01/01/2020 12:00:00 AM',24,421)
,(944,'VEHICLE - STOLEN',45,'07/20/2020 12:00:00 AM',24,374)
,(945,'THEFT OF IDENTITY',19,'01/01/2020 12:00:00 AM',36,523)
,(946,'THEFT OF IDENTITY',87,'05/01/2020 12:00:00 AM',36,158)
,(947,'THEFT OF IDENTITY',261,'01/01/2020 12:00:00 AM',36,216)
,(948,'SEX,UNLAWFUL(INC MUTUAL CONSENT, PENETRATION W/ FRGN OBJ',165,'01/01/2020 12:00:00 AM',36,550)
,(949,'CREDIT CARDS, FRAUD USE ($950 & UNDER',289,'01/09/2020 12:00:00 AM',12,779)
,(950,'BURGLARY FROM VEHICLE',16,'12/24/2020 12:00:00 AM',9,105)
,(951,'BURGLARY',40,'11/24/2020 12:00:00 AM',36,682)
,(952,'UNAUTHORIZED COMPUTER ACCESS',266,'06/17/2020 12:00:00 AM',12,642)
,(953,'BURGLARY FROM VEHICLE',189,'12/11/2020 12:00:00 AM',9,449)
,(954,'THEFT OF IDENTITY',211,'08/01/2020 12:00:00 AM',36,348)
,(955,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',200,'06/22/2020 12:00:00 AM',18,733)
,(956,'INTIMATE PARTNER - AGGRAVATED ASSAULT',248,'06/18/2020 12:00:00 AM',48,780)
,(957,'BURGLARY FROM VEHICLE',133,'02/13/2020 12:00:00 AM',9,159)
,(958,'ARSON',17,'05/05/2020 12:00:00 AM',120,16)
,(959,'LETTERS, LEWD  -  TELEPHONE CALLS, LEWD',62,'12/25/2020 12:00:00 AM',18,219)
,(960,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',80,'04/21/2020 12:00:00 AM',24,43)
,(961,'THEFT OF IDENTITY',286,'10/14/2020 12:00:00 AM',36,443)
,(962,'THEFT OF IDENTITY',223,'08/30/2020 12:00:00 AM',36,515)
,(963,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',204,'06/19/2020 12:00:00 AM',24,477)
,(964,'RAPE, FORCIBLE',111,'10/01/2020 12:00:00 AM',240,226)
,(965,'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE',189,'01/21/2020 12:00:00 AM',24,784)
,(966,'THEFT OF IDENTITY',248,'05/21/2020 12:00:00 AM',36,417)
,(967,'THEFT OF IDENTITY',115,'05/31/2020 12:00:00 AM',36,418)
,(968,'THEFT OF IDENTITY',228,'01/06/2020 12:00:00 AM',36,316)
,(969,'THEFT OF IDENTITY',28,'09/15/2020 12:00:00 AM',36,261)
,(970,'THEFT OF IDENTITY',251,'12/02/2020 12:00:00 AM',36,165)
,(971,'BATTERY - SIMPLE ASSAULT',233,'03/01/2020 12:00:00 AM',9,252)
,(972,'THEFT OF IDENTITY',263,'09/06/2020 12:00:00 AM',36,693)
,(973,'SHOPLIFTING - PETTY THEFT ($950 & UNDER)',177,'12/31/2020 12:00:00 AM',6,776)
,(974,'THEFT OF IDENTITY',33,'01/28/2020 12:00:00 AM',36,516)
,(975,'THEFT OF IDENTITY',215,'02/25/2020 12:00:00 AM',36,719)
,(976,'SODOMY/SEXUAL CONTACT B/W PENIS OF ONE PERS TO ANUS OTH',251,'12/01/2020 12:00:00 AM',96,754)
,(977,'THEFT OF IDENTITY',131,'10/12/2020 12:00:00 AM',36,205)
,(978,'THEFT OF IDENTITY',234,'06/10/2020 12:00:00 AM',36,701)
,(979,'THEFT OF IDENTITY',220,'07/15/2020 12:00:00 AM',36,46)
,(980,'VANDALISM - FELONY ($400 & OVER, ALL CHURCH VANDALISMS)',90,'06/25/2020 12:00:00 AM',24,395)
,(981,'THEFT OF IDENTITY',238,'07/03/2020 12:00:00 AM',36,317)
,(982,'THEFT OF IDENTITY',280,'12/23/2020 12:00:00 AM',36,794)
,(983,'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)',74,'12/01/2020 12:00:00 AM',180,419)
,(984,'VEHICLE - STOLEN',176,'04/30/2020 12:00:00 AM',24,64)
,(985,'INTIMATE PARTNER - SIMPLE ASSAULT',92,'12/28/2020 12:00:00 AM',9,702)
,(986,'THEFT OF IDENTITY',156,'02/10/2020 12:00:00 AM',36,676)
,(987,'THEFT OF IDENTITY',160,'07/02/2020 12:00:00 AM',36,25)
,(988,'BURGLARY',181,'12/02/2020 12:00:00 AM',36,469)
,(989,'THEFT OF IDENTITY',29,'11/23/2020 12:00:00 AM',36,176)
,(990,'THEFT OF IDENTITY',161,'08/10/2020 12:00:00 AM',36,349)
,(991,'CHILD STEALING',62,'01/14/2020 12:00:00 AM',48,356)
,(992,'THEFT OF IDENTITY',40,'01/01/2020 12:00:00 AM',36,767)
,(993,'THEFT OF IDENTITY',40,'03/01/2020 12:00:00 AM',36,643)
,(994,'DOCUMENT FORGERY / STOLEN FELONY',69,'11/22/2020 12:00:00 AM',48,686)
,(995,'THEFT OF IDENTITY',233,'04/04/2020 12:00:00 AM',36,600)
,(996,'CHILD ABUSE (PHYSICAL) - SIMPLE ASSAULT',179,'11/01/2020 12:00:00 AM',24,7)
,(997,'LEWD/LASCIVIOUS ACTS WITH CHILD',115,'05/01/2020 12:00:00 AM',120,579)
,(998,'THEFT OF IDENTITY',199,'09/01/2020 12:00:00 AM',36,495);

-- Historical data for officers before their current assignments
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
(1,7,'2020-10-24','2022-03-09','Transfer'),
(3,5,'2020-08-24','2021-03-29','Transfer'), 
(3,1,'2021-03-29','2022-04-15','Transfer'),
(4,0,'2020-07-30','2022-01-03','Transfer'),
(5,3,'2020-03-25','2023-03-03','Transfer'),
(42,0,'2020-03-20','2024-02-25','Transfer'),
(46,3,'2020-07-15','2022-09-06','Transfer'),
(53,9,'2020-06-07','2024-06-11','Transfer'),
(57,2,'2020-03-06','2020-11-13','Transfer'),
(63,7,'2020-04-29','2022-02-01','Transfer'),
(73,6,'2020-06-09','2022-12-07','Transfer'),
(80,7,'2020-12-01','2024-04-29','Transfer'),
(93,3,'2020-10-19','2023-04-09','Transfer'),
(94,7,'2020-04-01','2024-11-01','Transfer'),
(132,8,'2020-05-30','2023-10-10','Transfer'),
(138,1,'2020-07-01','2023-06-21','Transfer'),
(138,3,'2023-06-21','2024-03-03','Transfer'),
(162,0,'2020-06-24','2021-04-12','Transfer'),
(175,8,'2020-08-01','2021-04-03','Transfer'),
(193,3,'2020-10-31','2020-12-25','Transfer'),
(198,0,'2020-03-01','2022-03-05','Transfer'),
(246,2,'2020-07-25','2022-04-15','Transfer'),
(262,3,'2020-09-14','2020-12-31','Transfer'),
(264,9,'2020-07-05','2021-04-02','Transfer'),
(340,6,'2020-05-01','2024-04-04','Transfer'),
(386,6,'2020-01-01','2022-09-05','Transfer'),
(425,0,'2020-08-01','2023-01-31','Transfer'),
(432,7,'2020-03-19','2022-03-09','Transfer'),
(437,3,'2020-01-03','2020-12-31','Transfer'),
(473,7,'2020-11-19','2024-04-16','Transfer'),
(515,3,'2020-08-30','2023-12-20','Transfer'),
(613,7,'2020-04-02','2022-03-15','Transfer'),
(624,9,'2020-03-05','2023-02-19','Transfer'),
(672,0,'2020-03-01','2021-02-05','Transfer'),
(763,0,'2020-10-20','2020-11-29','Transfer'),
(778,2,'2020-06-13','2023-06-11','Transfer');