-- Create database

DROP DATABASE IF EXISTS bookstoredb;
CREATE DATABASE bookstoredb;
USE bookstoredb;

-- Clear db

DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS publisher;
DROP TABLE IF EXISTS publish_detail;
DROP TABLE IF EXISTS author;
DROP TABLE IF EXISTS author_detail;
DROP TABLE IF EXISTS genre;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS order_detail;

DROP TRIGGER IF EXISTS update_book_quantity;
DROP TRIGGER IF EXISTS order_total_bill;

DROP FUNCTION IF EXISTS book_count;
DROP PROCEDURE IF EXISTS book_in_price_range;

-- Create tables

CREATE TABLE publisher (
	publisher_id int PRIMARY KEY,
	name nvarchar(200) NOT NULL,
	address nvarchar(200)
);

CREATE TABLE book (
	book_id int PRIMARY KEY,
	title varchar(200) NOT NULL,
	price int NOT NULL CHECK (price > 0),
	inventory_qty int NOT NULL CHECK (inventory_qty >= 0),
	publisher_id int NOT NULL,
	FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id)
);

CREATE TABLE author (
	author_id int PRIMARY KEY,
	name varchar(200) NOT NULL,
	country varchar(50) NOT NULL
);

CREATE TABLE author_detail (
	author_id int,
	book_id int,
	PRIMARY KEY (author_id, book_id),
	FOREIGN KEY (author_id) REFERENCES author(author_id),
	FOREIGN KEY (book_id) REFERENCES book(book_id)
);

CREATE TABLE genre (
	book_id int,
	genre varchar(200),
	PRIMARY KEY (book_id, genre),
	FOREIGN KEY (book_id) REFERENCES book(book_id)
);

CREATE TABLE customer (
	customer_id int PRIMARY KEY,
	name varchar(200) NOT NULL,
	address varchar(200),
	phone varchar(15) NOT NULL,
	email varchar(200)
);

CREATE TABLE staff (
	staff_id int PRIMARY KEY,
	name varchar(200) NOT NULL,
	hire_date date NOT NULL,
	end_date date,
	dob date,
	address varchar(200) NOT NULL,
	phone varchar(15) NOT NULL,
	email varchar(200) UNIQUE NOT NULL,
	`password` varchar(200) NOT NULL,
	`position` varchar(200) NOT NULL
);

CREATE TABLE orders (
	order_id int PRIMARY KEY,
	customer_id int NOT NULL,
	staff_id int NOT NULL,
	order_date date NOT NULL DEFAULT (CURRENT_DATE),
	total_bill int NOT NULL CHECK (total_bill >= 0),
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

CREATE TABLE order_detail (
	book_id int,
	order_id int,
	quantity int NOT NULL CHECK (quantity >= 0),
	PRIMARY KEY (book_id, order_id),
	FOREIGN KEY (book_id) REFERENCES book(book_id),
	FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- Create triger
-- Update the number of book in table book when books are bought
CREATE TRIGGER update_book_quantity BEFORE INSERT ON order_detail
FOR EACH ROW 
	UPDATE book 
	SET inventory_qty = inventory_qty - NEW.quantity
	WHERE book_id = NEW.book_id;


-- Update table orders to get the total_bill of an order when books are added into order
CREATE TRIGGER order_total_bill BEFORE INSERT ON order_detail
FOR EACH ROW
	UPDATE orders
	SET total_bill = total_bill + (
		SELECT (price * NEW.quantity)
		FROM book
		WHERE book_id = NEW.book_id
	)
	WHERE order_id = NEW.order_id;

-- Create function & Procedure
-- Function to get the number of books published by 1 publisher
DELIMITER $$

CREATE FUNCTION book_count(publisherID INT) RETURNS INT
LANGUAGE SQL
DETERMINISTIC
BEGIN
	DECLARE number_of_book INT;
	SELECT COUNT(book_id) 
	INTO number_of_book
	FROM book
	WHERE publisher_id = publisherID
	GROUP BY publisher_id;
	RETURN number_of_book;
END $$

DELIMITER ;

-- Procedure retrieve book in a price range
DELIMITER $$
CREATE PROCEDURE book_in_price_range(IN low int, IN high int)
BEGIN
	SELECT book.*
    FROM book
    WHERE price >= low AND price <= HIGH;
END; $$
DELIMITER ;


