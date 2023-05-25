CREATE DATABASE restaurant;
SHOW DATABASES;

CREATE TABLE customer(	
	customer_name varchar(30),
	customer_phone varchar(10)
);

CREATE TABLE member(
	member_name varchar(30),
	member_phone varchar(10),
	member_score int(20),
	member_level int(2),
	member_birthday date,
	member_ID varchar(10),
	member_password varchar(20),
	member_nickname varchar(30),
	member_account varchar(30)
);

CREATE TABLE cook(
	employee_name varchar(30),
	employee_phone varchar(10),
	cook_number varchar(5),
	employee_living varchar(50),
	employee_number varchar(5)
);

CREATE TABLE waiter(
	employee_name varchar(30),
	employee_phone varchar(10),
	waiter_number varchar(5),
	employee_living varchar(50),
	employee_number varchar(5)
);

CREATE TABLE history(
	history_ID varchar(10),
	history_time datetime,
	history_content varchar(1000)
);


CREATE TABLE kitchen(
	ingredient_number int(2),
	ingredient_name varchar(30)
);

CREATE TABLE schedule(
	employee_name int(30),
	employee_number varchar(5),
	workstart time,
	workfinish time
);

CREATE TABLE seat(
	seat_number varchar(5),
	seat_idle tinyint(1)
);

CREATE TABLE store(
	store_number varchar(5),
	store_living varchar(50),
	store_open time,
	store_close time
);

CREATE TABLE pay(
	pay_type varchar(10),
	pay_discount varchar(10),
	pay_complete tinyint(1),
	pay_money int(5)
);

CREATE TABLE orderpaper(
	order_ID varchar(10),
	order_time datetime,
	order_content varchar(1000)
);

SHOW TABLES;
SHOW COLUMNS FROM waiter;
