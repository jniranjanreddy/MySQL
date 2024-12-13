CREATE DATABASE pet_shop;
USE pet_shop;
CREATE TABLE cats (name VARCHAR(100), age INT);
INSERT INTO cats (name, age) VALUES ('Jetson', 2);
INSERT INTO cats (name, age) VALUES 
('Jebkins', 7),
('Mittens', 10),
('Fluffy', 3);



CREATE TABLE people
  (
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    age INT
  );



INSERT INTO people(first_name, last_name, age)
VALUES ('Tina', 'Belcher', 13);

INSERT INTO people(first_name, last_name, age)
VALUES
    ('Linda', 'Belcher', 45),
    ('Phillip', 'Frond', 38),
    ('Calvin', 'Fischoeder', 70);

-- DEFAULT VALUES
CREATE TABLE cats3  (    
    name VARCHAR(20) DEFAULT 'no name provided',    
    age INT DEFAULT 99  
);

INSERT INTO cats3(NAME,age) VALUES('NIRANJAN', 13);

-- not null and default
CREATE TABLE cats4  (    
    name VARCHAR(20) NOT NULL DEFAULT 'unnamed',    
    age INT NOT NULL DEFAULT 99 
);

select * FROM cats3

-- Primary Key and Auto Increment
CREATE table unique_cats
(
  cat_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  age INT NOT NULL);

-- one way to add a primary key
CREATE TABLE unique_cats (
	cat_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL
);

-- another way to add a primary key
CREATE TABLE unique_cats (
    cat_id INT,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY (cat_id)
);

-- Defining employees table
CREATE TABLE employees (
    id INT AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    middle_name VARCHAR(255),
    age INT NOT NULL,
    current_status VARCHAR(255) NOT NULL DEFAULT 'employed',
    PRIMARY KEY(id)
);

-- Another way of defining the primary key:
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    middle_name VARCHAR(255),
    age INT NOT NULL,
    current_status VARCHAR(255) NOT NULL DEFAULT 'employed'
);

-- A test INSERT:
INSERT INTO employees(first_name, last_name, age) VALUES
('Dora', 'Smith', 58);


mysql> select cat_id AS ID,name AS Pets,age AS Gender  from cats; 

-- update the table name
UPDATE cats SET breed='Shorthair' WHERE breed='Tabby';

-- another way to update the table name
UPDATE cats SET age=14 WHERE name='Misty';

-- update multiple fields
UPDATE cats 
SET breed = 'rare', name = 'gound' 
WHERE cat_id = 3;


INSERT INTO unique_cats (name, age)
VALUES ('Jebkins', 7),
       ('Mittens', 10),
      ('Fluffy', 3);

SELECT * FROM unique_cats;

DESCRIBE unique_cats;


use pet_shop;
SELECT * FROM cats

show TABLES

DELETE from cats WHERE name = 'miss';

DELETE FROM cats;

-- String Functions: 
SELECT CONCAT('Hello', 'World');

SELECT CONCAT('pi', 'ckle');
SELECT CONCAT(author_fname,' ', author_lname) AS author_name FROM books;
 
SELECT CONCAT_WS('-',title, author_fname, author_lname) FROM books;

SELECT title, pages FROM books
WHERE pages = (SELECT MAX(pages) FROM books);
 
SELECT MIN(released_year) FROM books;
 
SELECT title, released_year FROM books 
WHERE released_year = (SELECT MIN(released_year) FROM books);

SELECT author_fname, author_lname, COUNT(*) 
FROM books 
GROUP BY author_lname, author_fname;
 
 
SELECT CONCAT(author_fname, ' ', author_lname) AS author,  COUNT(*)
FROM books
GROUP BY author;


SELECT author_lname, MIN(released_year) FROM books GROUP BY author_lname;
 
SELECT author_lname, MAX(released_year), MIN(released_year) FROM books GROUP BY author_lname;
 
SELECT 
	author_lname, 
	COUNT(*) as books_written, 
	MAX(released_year) AS latest_release,
	MIN(released_year)  AS earliest_release,
      MAX(pages) AS longest_page_count
FROM books GROUP BY author_lname;
 
 
SELECT 
	author_lname, 
        author_fname,
	COUNT(*) as books_written, 
	MAX(released_year) AS latest_release,
	MIN(released_year)  AS earliest_release
FROM books GROUP BY author_lname, author_fname;


SELECT SUM(pages) FROM books;
 
 
SELECT author_lname, COUNT(*), SUM(pages)
FROM books
GROUP BY author_lname;


SELECT AVG(pages) FROM books;
 
SELECT AVG(released_year) FROM books;
 
SELECT 
    released_year, 
    AVG(stock_quantity), 
    COUNT(*) FROM books
GROUP BY released_year;


CREATE TABLE people (
	name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birthdatetime DATETIME
);
 
INSERT INTO people (name, birthdate, birthtime, birthdatetime)
VALUES ('Elton', '2000-12-25', '11:00:00', '2000-12-25 11:00:00');
 
INSERT INTO people (name, birthdate, birthtime, birthdatetime)
VALUES ('Lulu', '1985-04-11', '9:45:10', '1985-04-11 9:45:10');
 
INSERT INTO people (name, birthdate, birthtime, birthdatetime)
VALUES ('Juan', '2020-08-15', '23:59:00', '2020-08-15 23:59:00');

SELECT 
    birthdate,
    DAY(birthdate),
    DAYOFWEEK(birthdate),
    DAYOFYEAR(birthdate)
FROM people;
 
SELECT 
    birthdate,
    MONTHNAME(birthdate),
    YEAR(birthdate)
FROM people;
