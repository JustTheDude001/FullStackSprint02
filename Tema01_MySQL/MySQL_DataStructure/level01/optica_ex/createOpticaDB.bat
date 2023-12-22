
-- NOTES:
-- DROP DATABASE optica;

-- Create Database Named optica:
CREATE DATABASE optica;

-- Use DATABASE optica:
USE optica;

-- Create Tables START (ALL LOWER CASE)



-- addresses Table For all
CREATE TABLE addresses (
  ID_address int NOT NULL AUTO_INCREMENT,
  street varchar(256),
  street_number varchar(16),
  floor varchar(8),
  door varchar(8),
  city varchar(126) NOT NULL,
  postal_code varchar(64),
  country varchar(128) NOT NULL,
  
  UNIQUE(ID_address)
  );

-- Proveidor Table
CREATE TABLE proveidor (
    ID_proveidor int NOT NULL AUTO_INCREMENT,
    name varchar(256) NOT NULL,
    ID_address int NOT NULL,
    telephone varchar(64) NOT NULL,
    fax varchar(64) NOT NULL,
    NIF varchar(64) NOT NULL,
    UNIQUE(ID_proveidor),
    FOREIGN KEY address_fk (ID_address)
	REFERENCES addresses(ID_address)
  );

-- Marca Table:
CREATE TABLE marca (
	ID_marca int NOT NULL AUTO_INCREMENT,
	ID_proveidor int,
	brand varchar(64) NOT NULL,
	
	UNIQUE(ID_marca)
	);


-- DROP TABLE proveidor; -- IN ORDER TO DELETE A TABLE!!!


  
-- Ulleres Table
CREATE TABLE ulleres (
  ID_glasses int NOT NULL AUTO_INCREMENT,
  ID_marca int,
  brand varchar(64),
  graduation_glass_1 float,
  graduation_glass_2  float,
  mount_type ENUM('flotant','pasta','metal·lica'),
  mount_color varchar(128),
  color_glass_1 varchar(128),
  color_glass_2 varchar(128),
  price_eu float,
  UNIQUE(ID_glasses),
  
  FOREIGN KEY marca_fk (ID_marca)
  REFERENCES marca(ID_marca)
  
  );


-- Client Table
CREATE TABLE clients (
  ID_client int NOT NULL AUTO_INCREMENT,
  name varchar(128),
  ID_address int NOT NULL,
  telephone varchar(64) NOT NULL,
  email varchar(128) NOT NULL,
  -- registration_date DATATIME DEFAULT CURRENT_DATETIME,
  registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  ID_recommendation int,
  UNIQUE(ID_client),
  
  FOREIGN KEY address_fk (ID_address)
  REFERENCES addresses(ID_address),
  FOREIGN KEY recommendation_fk (ID_recommendation)
  REFERENCES clients(ID_client)
  );


-- Worker Tables / Optional Choice
CREATE TABLE workers (
  ID_worker int NOT NULL AUTO_INCREMENT,
  name varchar(128),
  ID_address int NOT NULL,
  telephone varchar(64) NOT NULL,
  email varchar(128) NOT NULL,
  registration_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  
  UNIQUE(ID_worker),
  
  FOREIGN KEY address_fk (ID_address)
  REFERENCES addresses(ID_address)
  );

-- Ventes/Sells Table
CREATE TABLE ventes (
  ID_venta int NOT NULL AUTO_INCREMENT,
  ID_glasses int NOT NULL,
  ID_worker int NOT NULL,
  ID_client int NOT NULL,
  sell_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  
  UNIQUE(ID_venta),
  
  FOREIGN KEY glasses_fk (ID_glasses)
  REFERENCES ulleres(ID_glasses),
  FOREIGN KEY worker_fk (ID_worker)
  REFERENCES workers(ID_worker),
  FOREIGN KEY clients_fk (ID_client)
  REFERENCES clients(ID_client)
  );
 



-- Create Tables END:

-- Tests START
-- 1. List the total sells for a client
-- 2. List all the glasses sold for a worker.
-- 3. List all the suppliers/providers which have provided sold glasses (succesfully)



-- Tests END
