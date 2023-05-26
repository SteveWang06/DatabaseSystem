CREATE DATABASE restaurant;
SHOW DATABASES;

DROP TABLE schedule;

CREATE TABLE customer(
	customer_name varchar(30) not null,
    customer_phone varchar(10) not null unique,
    PRIMARY KEY (customer_name,customer_phone)
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
);

ALTER TABLE member
ADD FOREIGN KEY (member_phone)
REFERENCES customer(customer_phone)
ON DELETE NO ACTION;

ALTER TABLE member
ADD FOREIGN KEY (member_name)
REFERENCES customer(customer_name)
ON DELETE NO ACTION;

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

ALTER TABLE history
ADD FOREIGN KEY (history_ID)
REFERENCES orderpaper(order_ID)
ON DELETE NO ACTION;

CREATE TABLE kitchen(
	ingredient_name varchar(30) not null,
	ingredient_number int(2) default 0,
    ingredient_set varchar(10) not null,
    PRIMARY KEY (ingredient_name)
);

CREATE TABLE schedule(
	employee_name varchar(30) not null,
    employee_number varchar(5) not null,
    workstart time not null,
    workfinish time not null,
    PRIMARY KEY (employee_name)
);

ALTER TABLE schedule
ADD FOREIGN KEY (employee_number)
REFERENCES employee(employee_number)
ON DELETE NO ACTION; 

ALTER TABLE schedule
ADD FOREIGN KEY (employee_name)
REFERENCES employee(employee_name)
ON DELETE NO ACTION; 


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

ALTER TABLE pay
ADD FOREIGN KEY (pay_ID)
REFERENCES orderpaper(order_ID)
ON DELETE NO ACTION;

CREATE TABLE orderpaper(
	order_ID int AUTO_INCREMENT,
    order_time datetime not null,
    order_content varchar(1000) not null,
    seat_number int not null,
    PRIMARY KEY (order_ID)
);

ALTER TABLE orderpaper
ADD FOREIGN KEY (seat_number)
REFERENCES seat(seat_number)
ON DELETE NO ACTION;

SHOW TABLES;
SHOW COLUMNS FROM customer;

#insert into `member` values("張三", 0987654321, 80, 3, "1990-05-10", 1, "password1", "張三", "user1\@gmail.com")

select *
from member
