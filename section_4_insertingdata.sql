-- #######################################################################################
-- Insert defined data into created sql tables
-- #######################################################################################

-- show current dbs
show databases;

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

-- Insert data into table
INSERT INTO cats(
  age,
  name
)
VALUES (12, 
'Victoria');

INSERT INTO cats(
  name,
  age
)
VALUES ('Draco', 
11);

-- check table with SELECT
SELECT * FROM cats;

-- Multi insert
INSERT INTO cats(name,
age)
VALUES ('Peanut', 2),
('Butter', 4),
('Jelly', 7);

SELECT * FROM cats;

-- NOTE: Insert a string (VARCHAR) value that contains quotations, then here's how.

-- Escape the quotes with a backslash: 
-- "This text has \"quotes\" in it" or 'This text has \'quotes\' in it'

-- Alternate single and double quotes: 
-- "This text has 'quotes' in it" or 'This text has "quotes" in it'

-- #######################################################################################
-- EXERCISE 
-- #######################################################################################

-- create table
CREATE TABLE people
(
  first_name VARCHAR(20),
  last_name VARCHAR(20),
  age INT
);

SHOW COLUMNS FROM people;

-- insert data 
INSERT INTO people(
  first_name,
  last_name,
  age
)
VALUES ('Tina', 'Belcher', 12),
('Bob', 'Belcher', 42),
('Lind', 'Belcher', 45),
('Phillip', 'Frond', 38),
('Calvin', 'Fischoeder', 70);

-- show data in table
SELECT * FROM people;

-- drop if needed
DROP TABLE people;

-- WARNINGS --

-- set mode first to issue warning rather than erros
set sql_mode='';

-- If you enter query that incurs warnings e.g. insert str that exceeds VARCHAR charactet limit, MySQL will issue a warning
INSERT INTO cats(name, 
age)
VALUES('Lima', 
'dnwnwendwoidn');

-- See more detaild around warning with
SHOW WARNINGS; -- eg truncated warning for above 
-- and each auto set to 0 as entered wrong data type
SELECT * FROM cats;

-- NULL in SQL --
-- i.e value is not known (not 0)

-- e.g.
INSERT INTO cats(name)
VALUES ("Alabama");

SELECT * FROM cats;
-- Alabama has a age of NULL

-- and can describe table and see NULL is permitted value for age (in default field)
DESC cats;

-- Can define as NOT NULL and any attempted NULL entry means records has no default value - and auto defines to 0 for INT type
CREATE TABLE cats2
( 
  name VARCHAR(100) NOT NULL,
  age INT NOT NUll
);

DESC cats2;

-- attempt insert
INSERT INTO cats2(name)
VALUES("Texas");

SHOW WARNINGS;

SELECT * FROM cats2;

-- and for name and VARCHAR defines as empty string
INSERT INTO cats2 (age)
VALUES(7);

SELECT * FROM cats2;

-- Specifying default values

CREATE TABLE cats3
(
  name VARCHAR(20) DEFAULT 'NO NAME',
  age INT DEFAULT 99
);

DESC cats3;

INSERT INTO cats3 (age)
VALUES (13);

SELECT * FROM cats3;

-- can also explictly state that field is not allowed to be NULL as well as having specifiying default value
-- e.g. so users can not manually enter NULL into the field, but either is given your default value or has as valid entry 
CREATE TABLE cats4
(
  name VARCHAR(20) NOT NULL DEFAULT 'unamed',
  age INT NOT NULL DEFAULT 99
);

-- following statement then returns error 
INSERT INTO cats4(name,age)
VALUES('cali', NULL);

-- Primary key assignment
CREATE TABLE unique_cats (cat_id INT NOT NULL,
name VARCHAR(100),
age INT,
PRIMARY KEY (cat_id));

-- and see PRI id in key field
DESCRIBE unique_cats;

INSERT INTO unique_cats(cat_id,name,age)
VALUES(1, "Fred", 32),
(2, "Louise", 3);

-- trying tu creatr duplicate id will not return erro
INSERT INTO unique_cats(cat_id,name,age)
VALUES(1,"James", 3);

-- can also auto-generate primary keys e.g. with AUTO_INCREMENT - adding new pk every time record is added
CREATE TABLE unique_cats2 (cat_id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(100),
age INT,
PRIMARY KEY (cat_id));

DESCRIBE unique_cats2;

-- so can add new records and auto assign pk
INSERT INTO unique_cats2(name,age)
VALUES("Jiff", 3),
("jiff", 3);

SELECT * FROM unique_cats2;



-- often want to also make usernames etc a PK in a database 


-- #######################################################################################
-- EXERCISE 
-- #######################################################################################

