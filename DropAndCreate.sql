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

DROP VIEW IF EXISTS books_detail;
DROP VIEW IF EXISTS books_ranking;

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



