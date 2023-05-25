CREATE DATABASE restaurant;
SHOW DATABASES;

DROP TABLE member;

CREATE TABLE customer(
	customer_name varchar(30),
	customer_phone varchar(10),
	PRIMARY KEY (customer_name)
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
    member_account varchar(30),
    PRIMARY KEY (member_ID)
    #,
    #FOREIGN KEY (member_phone) REFERENCES customer(customer_phone),
    #FOREIGN KEY (member_name) REFERENCES customer(customer_name)
);

CREATE TABLE employee(
	employee_name varchar(30),
    employee_phone varchar(10),
    employee_living varchar(50),
    employee_number varchar(5),
    PRIMARY KEY (employee_number)
);

CREATE TABLE history(
	history_ID varchar(10),
    history_time datetime,
    history_content varchar(1000),
    PRIMARY KEY (history_ID)
);

CREATE TABLE kitchen(
	ingredient_name varchar(30),
	ingredient_number int(2),
    ingredient_set varchar(10),
    PRIMARY KEY (ingredient_name)
);

CREATE TABLE schedule(
	employee_name int(30),
    employee_number varchar(5),
    workstart time,
    workfinish time,
    PRIMARY KEY (employee_name)
);

CREATE TABLE seat(
	seat_number varchar(5),
    seat_idle tinyint(1),
    PRIMARY KEY (seat_number)
);

CREATE TABLE store(
	store_number varchar(5),
    store_living varchar(50),
    store_open time,
    store_close time,
    PRIMARY KEY (store_number)
);

CREATE TABLE pay(
	pay_ID varchar(10),
	pay_type varchar(10),
    pay_discount varchar(10),
    pay_complete tinyint(1),
    pay_money int(5),
    PRIMARY KEY (pay_ID)
);

CREATE TABLE orderpaper(
	order_ID varchar(10),
    order_time datetime,
    order_content varchar(1000),
    PRIMARY KEY (order_ID)
);

SHOW TABLES;
SHOW COLUMNS FROM pay;

#insert into `member` values("張三", 0987654321, 80, 3, "1990-05-10", 1, "password1", "張三", "user1\@gmail.com")

select *
from member
