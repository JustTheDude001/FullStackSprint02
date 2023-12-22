
-- Examples for CHAT GPT To Generate database Data:

USE pizzeria;

-- Table Addresses
INSERT INTO addresses 
VALUES(
  NULL,
  "C. Gipuzcuoa",
  "18",
  "3rd",
  "2A",
  "Barcelona",
  "091234",
  "Barcelona",
  "Spain"
  );
  
INSERT INTO addresses 
VALUES(
  NULL,
  "C. Salamandra",
  "15",
  "3rd",
  "2A",
  "Barcelona",
  "091234",
  "Barcelona",
  "Spain"
  );

-- Clients Table:
INSERT INTO clients 
VALUES(
	NULL,
	"Perico",
	"Gonzalez",
	"Picaso",
	1,
	"987123582"
);

-- Table botigues:
INSERT INTO botigues
VALUES(
	NULL,
	"Le Pizzeria",
	1
);

INSERT INTO botigues
VALUES(
	NULL,
	"Le Pizzeria 2",
	1
);

INSERT INTO botigues
VALUES(
	NULL,
	"Le Pizzeria 3",
	1
);

-- Table empleats
INSERT INTO empleats
VALUES(
  NULL,
  1,
  "TheCookingGuy",
  "Pizzerio",
  "Saez",
  "7123991203-a",
  "8129391823",
  "cuiner"
);

INSERT INTO empleats VALUES(
  NULL,
  2,
  "TheCookingGuy",
  "Pizzerio",
  "Saez",
  "7123991203-a",
  "8129391823",
  "repartidor"
);


-- Table Comandes
INSERT INTO comandes VALUES(
  NULL,
  1,
  1,
  1,
  '2023-09-05 10:25:00',
  '2023-09-05 12:25:00',
  "domicili",
  24.98
 );
 
INSERT INTO comandes VALUES(
  NULL,
  1,
  1,
  1,
  '2023-09-05 10:25:00',
  '2023-09-05 12:25:00',
  "recollida",
  28.98
 );
 
 
-- Table Productes
INSERT INTO productes
VALUES(
  NULL,
  "La Cabra",
  "Burguer with goath Cheese",
  "./imgs/lacabra.png",
  9.85
);

-- Table Categories
INSERT INTO categories
VALUES(
	NULL,
	"Pizzes Italianes"
);


-- Table pizza_categories
INSERT INTO pizza_categories
VALUES(
	1,
	1
);

-- Table productes_comanda
INSERT INTO productes_comanda
VALUES(
  1,
  1,
  2
);

-- ONE LINE COMMANDS FOR CHAT GPT ------------------------------------------------

-- Table Addresses
INSERT INTO addresses VALUES( NULL, "C. Gipuzcuoa", "18", "3rd", "2A", "Barcelona", "091234", "Barcelona", "Spain");
  
INSERT INTO addresses VALUES(NULL, "C. Salamandra", "15", "3rd", "2A", "Barcelona", "091234", "Barcelona", "Spain");

-- Clients Table:
INSERT INTO clients VALUES( NULL, "Perico", "Gonzalez","Picaso", 1, "987123582");

-- Table botigues:
INSERT INTO botigues VALUES(NULL, "Le Pizzeria", 1);

INSERT INTO botigues VALUES( NULL, "Le Pizzeria 2",  1);

INSERT INTO botigues VALUES( NULL, "Le Pizzeria 3", 1);

-- Table empleats
INSERT INTO empleats VALUES( NULL, 1, "TheCookingGuy", "Pizzerio", "Saez", "7123991203-a", "8129391823", "cuiner");

INSERT INTO empleats VALUES( NULL, 2, "TheCookingGuy", "Pizzerio", "Saez", "7123991203-a", "8129391823", "repartidor");


-- Table Comandes
INSERT INTO comandes VALUES( NULL, 1, 1, 1, '2023-09-05 10:25:00', '2023-09-05 12:25:00', "domicili", 24.98 );
 
INSERT INTO comandes VALUES( NULL, 1, 1, 1, '2023-09-05 10:25:00', '2023-09-05 12:25:00', "recollida", 28.98);
 
 
-- Table Productes
INSERT INTO productesVALUES(  NULL,  "La Cabra",  "Burguer with goath Cheese",  "./imgs/lacabra.png","pizza",  9.85);

-- Table Categories
INSERT INTO categoriesVALUES(	NULL,	"Pizzes Italianes");

-- Table pizza_categories
INSERT INTO pizza_categoriesVALUES(	1,	1);

-- Table productes_comanda
INSERT INTO productes_comandaVALUES(  1,  1,  2);

