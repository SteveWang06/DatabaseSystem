CREATE DATABASE restaurant;
SHOW DATABASES;

DROP TABLE orderpaper;

CREATE TABLE customer(
	customer_name varchar(30) not null,
    customer_phone varchar(10) not null,
    PRIMARY KEY (customer_name)
);

CREATE TABLE member(
	member_name varchar(30) not null,
    member_phone varchar(10) not null,
    member_score int(20) default 0,
    member_level int(2) default 1,
    member_birthday date,
    member_ID int AUTO_INCREMENT, #AUTO_INCREMENT會以遞增數字自動填入id
    member_password varchar(20) not null,
    member_nickname varchar(30),
    member_account varchar(30) not null,
    PRIMARY KEY (member_ID)
    #,
    #FOREIGN KEY (member_phone) REFERENCES customer(customer_phone),
    #FOREIGN KEY (member_name) REFERENCES customer(customer_name)
);

CREATE TABLE employee(
	employee_name varchar(30) not null,
    employee_phone varchar(10) not null,
    employee_living varchar(50),
    employee_number varchar(5) not null,
    PRIMARY KEY (employee_number)
);

CREATE TABLE history(
	history_ID int AUTO_INCREMENT,
    history_time datetime not null,
    history_content varchar(1000) not null,
    PRIMARY KEY (history_ID)
);

CREATE TABLE kitchen(
	ingredient_name varchar(30) not null,
	ingredient_number int(2) default 0,
    ingredient_set varchar(10) not null,
    PRIMARY KEY (ingredient_name)
);

CREATE TABLE schedule(
	employee_name int(30) not null,
    employee_number varchar(5) not null,
    workstart time not null,
    workfinish time not null,
    PRIMARY KEY (employee_name)
);

CREATE TABLE seat(
	seat_number int AUTO_INCREMENT,
    seat_idle tinyint(1) default 1,
    #空閒=1,有人=0
    PRIMARY KEY (seat_number)
);

CREATE TABLE store(
	store_number int AUTO_INCREMENT,
    store_living varchar(50) not null,
    store_open time not null,
    store_close time not null,
    PRIMARY KEY (store_number)
);

CREATE TABLE pay(
	pay_ID int AUTO_INCREMENT,
	pay_type varchar(10) not null,
    pay_discount varchar(10),
    pay_complete tinyint(1) not null,
    #已付款=1,未付款=0
    pay_money int not null,
    PRIMARY KEY (pay_ID)
);

CREATE TABLE orderpaper(
	order_ID int AUTO_INCREMENT,
    order_time datetime not null,
    order_content varchar(1000) not null,
    PRIMARY KEY (order_ID)
);

SHOW TABLES;
SHOW COLUMNS FROM customer;

#insert into `member` values("張三", 0987654321, 80, 3, "1990-05-10", 1, "password1", "張三", "user1\@gmail.com")

select *
from member
