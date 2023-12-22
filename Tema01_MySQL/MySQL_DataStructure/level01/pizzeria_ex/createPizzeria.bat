

CREATE DATABASE pizzeria;

USE pizzeria;


-- addresses Table For all
CREATE TABLE addresses (
  ID_address int NOT NULL AUTO_INCREMENT,
  street varchar(256),
  street_number varchar(16),
  floor varchar(8),
  door varchar(8),
  city varchar(126) NOT NULL,
  postal_code varchar(64),
  province varchar(64),
  country varchar(128) NOT NULL,
  
  UNIQUE(ID_address)
  );


CREATE TABLE clients (
	ID_client int NOT NULL AUTO_INCREMENT,
	nom varchar(256),
	cognom_1 varchar(256),
	cognom_2 varchar(256),
	ID_address int,
	telephone varchar(64),
	UNIQUE(ID_client),
	
	FOREIGN KEY address_fk (ID_address)
	REFERENCES addresses(ID_address)
);

-- Table botigues:
CREATE TABLE botigues(
	ID_botiga int NOT NULL AUTO_INCREMENT,
	nom varchar(128),
	ID_address int,
	
	UNIQUE(ID_botiga),
	FOREIGN KEY address_fk (ID_address)
	REFERENCES addresses(ID_address)
);


-- Table empleats
CREATE TABLE empleats (
  ID_empleat int NOT NULL AUTO_INCREMENT,
  ID_botiga int NOT NULL,
  nom varchar(128),
  cognom_1 varchar(128),
  cognom_2 varchar(128),
  NIF varchar(32),
  telefon varchar(32),
  types ENUM("cuiner", "repartidor"),
  
  UNIQUE(ID_empleat),
  
  FOREIGN KEY botiga_fk (ID_botiga)
  REFERENCES botigues(ID_botiga)
);




-- Table Comandes
CREATE TABLE comandes (
  ID_comanda int NOT NULL AUTO_INCREMENT,
  ID_botiga int NOT NULL,
  ID_client int NOT NULL,
  ID_repartidor int NOT NULL,
  comanda_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  deliver_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  tipus ENUM("domicili","recollida"),
  preu_total float,
  UNIQUE(ID_comanda),
  
  FOREIGN KEY botiga_fk (ID_botiga)
  REFERENCES botigues(ID_botiga),
  FOREIGN KEY client_fk (ID_client)
  REFERENCES clients(ID_client),
  FOREIGN KEY repartidor_fk (ID_repartidor)
  REFERENCES empleats(ID_empleat)
 );
 
-- Table Productes
CREATE TABLE productes(
  ID_product int NOT NULL AUTO_INCREMENT,
  nom varchar(256) NOT NULL,
  description varchar(1024),
  image_path varchar(2048),
  product_type ENUM("pizza", "hamburguesa", "beguda"),
  -- image LONGBLOB,
  -- WARNING HOW TO STORE IMAGE
  -- LOAD_FILE('path')
  preu double,
  UNIQUE(ID_product)
);


CREATE TABLE categories(
	ID_categoria int NOT NULL AUTO_INCREMENT,
	nom varchar(512),
	UNIQUE(ID_categoria)
);


CREATE TABLE pizza_categories(
	ID_pizza int NOT NULL,
	ID_categoria int NOT NULL,
	
	UNIQUE(ID_pizza),
  FOREIGN KEY categoria_fk (ID_categoria)
  REFERENCES categories(ID_categoria),
   FOREIGN KEY producte_fk (ID_pizza)
  REFERENCES productes(ID_product)
  
);

CREATE TABLE productes_comanda(
  ID_comanda int NOT NULL,
  ID_producte int NOT NULL,
  amount int NOT NULL,
  
   FOREIGN KEY comanda_fk (ID_comanda)
  REFERENCES comandes(ID_comanda),
   FOREIGN KEY producte_fk (ID_producte)
  REFERENCES productes(ID_product)

);
