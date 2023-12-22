#!/bin/bash

#NOT EXECUTABLE - (For the moment)

#Log in as root
mysql -u root -p


#Create Databases (Tienda & Universidad)
create database Tienda;
create database Universidad;

#Import Databases From .SQL Files For Exercises:
mysql -u root -p Tienda < schema_tienda.sql
mysql -u root -p Universidad < schema_universidad.sql

#In order to show databases:
show databases;
