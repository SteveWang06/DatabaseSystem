CREATE DATABASE restaurant;
SHOW DATABASES;

DROP TABLE kitchen;

CREATE TABLE customer(
	customer_name varchar(30) not null,
    customer_phone varchar(10) not null unique,
    PRIMARY KEY (customer_name,customer_phone)
);

insert into `customer` values('劉美玉','0911234567');
insert into `customer` values('陳大偉','0922345678');
insert into `customer` values('林小婷','0933456789');
insert into `customer` values('林花綸','0912345678');
insert into `customer` values('張美環','0923456789');
insert into `customer` values('王小玉','0945678901');

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

insert into `member` values('林花綸', '0912345678', 80, 3, "1990-05-10", 1, "password1", "AlanLin", "user1\@gmail.com");
insert into `member` values('張美環', '0923456789', 50, 2, "1988-12-15", 2, "password2", "Mary1215", "user2\@gmail.com");
insert into `member` values('王小玉', '0945678901', 2, 1, "1995-07-20", 3, "password3", "tina0720", "user3\@gmail.com");

CREATE TABLE employee(
	employee_name varchar(30) not null,
    employee_phone varchar(10) not null,
    employee_living varchar(50),
    employee_number varchar(5) not null,
    PRIMARY KEY (employee_number)
);

insert into `employee` values('張三','0912345678','台中市北屯區文心路四段57號','C0001');
insert into `employee` values('李四','0923456789','台中市南屯區中和里黎明路一段263號','C0002');
insert into `employee` values('陳小美','0987654321','台中市北屯區橫坑巷28-1號','W0001');
insert into `employee` values('張大志','0976543210','台中市西屯區至善路61號','W0002');

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

insert into `history` values(1,'2023-05-20 17:20:00','美式早餐:1, 咖啡:2');
insert into `history` values(2,'2023-05-20 17:50:00','韓式炸雞:1, 泡菜:1, 飯:1');
insert into `history` values(3,'2023-05-19 18:30:00','日式拉麵:2, 炸豬排:1');

CREATE TABLE kitchen(
	ingredient_name varchar(30) not null,
	ingredient_number int default 0,
    ingredient_set varchar(10) not null,
    PRIMARY KEY (ingredient_name)
);

insert into `kitchen` values('雞胸肉',500,'公克');
insert into `kitchen` values('蔬菜沙拉',1,'包');
insert into `kitchen` values('鮮奶油',200,'毫升');

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

insert into `schedule` values('張三','C0001','09:00:00','17:00:00');
insert into `schedule` values('李四','C0002','13:00:00','21:00:00');
insert into `schedule` values('陳小美','W0001','10:00:00','18:00:00');
insert into `schedule` values('張大志','W0002','10:00:00','16:00:00');

CREATE TABLE seat(
	seat_number int AUTO_INCREMENT,
    seat_idle tinyint(1) default 1,
    #空閒=1,有人=0
    PRIMARY KEY (seat_number)
);

insert into `seat` values(1,1);
insert into `seat` values(2,0);
insert into `seat` values(3,1);

CREATE TABLE store(
	store_number int AUTO_INCREMENT,
    store_living varchar(50) not null,
    store_open time not null,
    store_close time not null,
    PRIMARY KEY (store_number)
);

insert into `store` values(1,'台北市中山區明水路581巷15號1樓','09:00:00','21:00:00');
insert into `store` values(2,'新北市板橋區文化路二段229號1樓','10:00:00','20:00:00');
insert into `store` values(3,'台中市西屯區中平路279號','11:00:00','22:00:00');

#UPDATE store SET store_living='新北市板橋區文化路二段229號1樓' where store_number=2;

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

insert into `pay` values(1,'現金','-10%',1,500);
insert into `pay` values(2,'信用卡','-20%',1,800);
insert into `pay` values(3,'現金',null,0,350);

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

insert into `orderpaper` values(1,'2023-05-20 17:20:00','美式早餐:1, 咖啡:2',1);
insert into `orderpaper` values(2,'2023-05-20 17:50:00','韓式炸雞:1, 泡菜:1, 飯:1',2);
insert into `orderpaper` values(3,'2023-05-19 18:30:00','日式拉麵:2, 炸豬排:1',3);

SHOW TABLES;
SHOW COLUMNS FROM customer;

select *
from store
