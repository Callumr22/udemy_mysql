-- #######################################################################################
-- Create SQL DB within MYSQL server e.g. set up locally on mac on MySQL community server
-- #######################################################################################

-- Onening SQL server - start up server system preferences > mysql > Start MySQL Server

-- Run in terminal
export PATH=${PATH}:/usr/local/mysql/bin/ 
-- and 


-- show current dbs
show databases;
-- MySQL monitor terminal should start up and allow you to enter mysql commands

-- create a test db
CREATE DATABASE hello_world_db;
show databases;

-- delete db
DROP DATABASE hello_world_db;
show databases;

-- using dbs - switching from one db to another
USE hello_world_db;
 
-- return which db currently using
SELECT database();

-- create a table in your own db
CREATE DATABASE cat_app;

use cat_app;

CREATE TABLE cats
  (
    name VARCHAR(100),
    age INT
  );

  -- test creation of table worked, show tables in current DB
SHOW TABLES;

  -- show column info
SHOW COLUMNS FROM cats;

  -- or can use describe
DESC cats;

-- dropping tables
DROP TABLE cats;

SHOW TABLES;

-- #######################################################################################
-- EXERCISE 
-- #######################################################################################

-- create table
CREATE TABLE pastries
(
    name VARCHAR(50),
    quantity INT
);

-- inspect
DESC pastries

-- drop 
DROP TABLE pastries;