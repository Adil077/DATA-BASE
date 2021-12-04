--DDL
CREATE TABLE products(
    upc varchar(12) PRIMARY KEY unique,
    product_name varchar,
    cost integer,
    type varchar
);

CREATE TABLE brands(
    brand_id integer primary key unique ,
    brand_name varchar
);

CREATE TABLE product_types(
    type_name varchar,
    size_of_package varchar,
    brand_id integer,
    product_upc varchar,
    FOREIGN KEY (product_upc) references products(upc),
    FOREIGN KEY (brand_id) references brands(brand_id)
);

CREATE TABLE stores(
    stores_name varchar primary key unique,
    location varchar,
    address varchar,
    time_of_work varchar,
    storage_id integer unique
);

CREATE TABLE vendors(
    vendor_id integer primary key unique,
    vendor_lastname varchar,
    job_store varchar,
    FOREIGN KEY (job_store) references stores(stores_name)
);

CREATE TABLE storages(
    storage_id integer primary key unique,
    product_upc varchar,
    unit integer,
    FOREIGN KEY (product_upc) references products(upc),
    FOREIGN KEY (storage_id) references stores(storage_id)
);

CREATE TABLE customers(
    customer_id integer primary key unique,
    customer_name varchar,
    gender varchar,
    date_of_birth date,
    location varchar
);

CREATE TABLE sell(
    receipt_id integer primary key unique,
    store_name varchar,
    product_upc varchar,
    customer_id integer,
    vendor_id integer,
    price integer,
    date_of_sell date,
    FOREIGN KEY (product_upc) references products(upc),
    FOREIGN KEY (customer_id) references customers(customer_id),
    FOREIGN KEY (vendor_id) references vendors(vendor_id),
    FOREIGN KEY (store_name) references stores(stores_name)
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------
--DML

insert into products (upc, product_name, cost, type) values ('74-052-7344', 'PEPSI', 306, 'drink');
insert into products (upc, product_name, cost, type) values ('75-584-7913', 'COCA-COLA', 146, 'drink');
insert into products (upc, product_name, cost, type) values ('76-763-4380', 'Fish', 393, 'meat');
insert into products (upc, product_name, cost, type) values ('00-938-2796', 'SNICKERS', 493, 'chocolate');
insert into products (upc, product_name, cost, type) values ('71-822-7588', 'kitkat', 288, 'chocolate');
insert into products (upc, product_name, cost, type) values ('76-783-3139', 'apple', 58, 'fruit');
insert into products (upc, product_name, cost, type) values ('09-793-6580', 'cake', 260, 'chocolate');
insert into products (upc, product_name, cost, type) values ('86-349-5897', 'candy', 122, 'chocolate');
insert into products (upc, product_name, cost, type) values ('07-261-7703', 'meat', 13, 'meat');
insert into products (upc, product_name, cost, type) values ('45-424-1199', 'chicken', 202, 'meat');
insert into products (upc, product_name, cost, type) values ('73-175-2063', 'Tomato', 296, 'vegetable');
insert into products (upc, product_name, cost, type) values ('15-476-7964', 'sandwich', 234, 'food');
insert into products (upc, product_name, cost, type) values ('65-650-4533', 'fairy', 211, 'soap');
insert into products (upc, product_name, cost, type) values ('81-029-6643', 'chicken', 141, 'meat');
insert into products (upc, product_name, cost, type) values ('38-618-7752', 'ice cream', 206, 'sweet');
insert into products (upc, product_name, cost, type) values ('86-141-8169', 'albeni', 421, 'chocolate');
insert into products (upc, product_name, cost, type) values ('77-543-0691', 'milka', 144, 'chocolate');
insert into products (upc, product_name, cost, type) values ('87-319-6001', 'Coffee', 495, 'drink');
insert into products (upc, product_name, cost, type) values ('89-690-8842', 'Tea', 360, 'drink');
insert into products (upc, product_name, cost, type) values ('54-056-6529', 'potato', 15, 'vegetable');


insert into brands (brand_id, brand_name) values (581298202, 'Pepsico');
insert into brands (brand_id, brand_name) values (298197292, 'Rakhat');
insert into brands (brand_id, brand_name) values (871596860, 'Bahyt');
insert into brands (brand_id, brand_name) values (678777190, 'Bizhan meat');
insert into brands (brand_id, brand_name) values (279600885, 'Alatau qus');
insert into brands (brand_id, brand_name) values (347283759, 'Almas and co');
insert into brands (brand_id, brand_name) values (474478497, 'home food');
insert into brands (brand_id, brand_name) values (658758549, 'Urker');
insert into brands (brand_id, brand_name) values (302673088, 'Mars');
insert into brands (brand_id, brand_name) values (780312874, 'MC');


insert into product_types (type_name, size_of_package, brand_id, product_upc) values ('drink', 'L', 581298202, '74-052-7344');
insert into product_types (type_name, size_of_package, brand_id, product_upc) values ('drink', 'L', 581298202, '75-584-7913');
insert into product_types (type_name, size_of_package, brand_id, product_upc) values ('meat', 'L', 678777190, '76-763-4380');
insert into product_types (type_name, size_of_package, brand_id, product_upc) values ('chocolate', 'XS', 302673088, '00-938-2796');
insert into product_types (type_name, size_of_package, brand_id, product_upc) values ('chocolate', 'XS', 302673088, '71-822-7588');
insert into product_types (type_name, size_of_package, brand_id, product_upc) values ('chocolate', 'XS', 302673088, '77-543-0691');
insert into product_types (type_name, size_of_package, brand_id, product_upc) values ('fruit', 'XL', 871596860, '76-783-3139');
insert into product_types (type_name, size_of_package, brand_id, product_upc) values ('vegetable', 'S', 347283759, '73-175-2063');
insert into product_types (type_name, size_of_package, brand_id, product_upc) values ('vegetable', 'S', 347283759, '54-056-6529');
insert into product_types (type_name, size_of_package, brand_id, product_upc) values ('food', 'XL', 474478497, '15-476-7964');
insert into product_types (type_name, size_of_package, brand_id, product_upc) values ('soap', 'XL', 474478497, '65-650-4533');
insert into product_types (type_name, size_of_package, brand_id, product_upc) values ('sweet', 'XL', 658758549, '38-618-7752');
insert into product_types (type_name, size_of_package, brand_id, product_upc) values ('chocolate', 'XL', 658758549, '86-141-8169');
insert into product_types (type_name, size_of_package, brand_id, product_upc) values ('tea', 'XL', 780312874, '89-690-8842');
insert into product_types (type_name, size_of_package, brand_id, product_upc) values ('coffee', 'XL', 780312874, '87-319-6001');


insert into stores (stores_name, location, address, time_of_work, storage_id) values ('Raynor-Cormier', 'Jiufang', '5186 North Circle', '10:00-23:00', 9);
insert into stores (stores_name, location, address, time_of_work, storage_id) values ('Harris-Carroll', 'Los Angeles', '8 Colorado Alley', '10:00-23:00', 68);
insert into stores (stores_name, location, address, time_of_work, storage_id) values ('Kertzmann, Waters and Kris', 'Pindaré Mirim', '282 Bartelt Avenue', '10:00-23:00', 86);


insert into vendors (vendor_id, vendor_lastname, job_store) values (9474, 'Iacovides', 'Raynor-Cormier');
insert into vendors (vendor_id, vendor_lastname, job_store) values (7330, 'Fraser', 'Raynor-Cormier');
insert into vendors (vendor_id, vendor_lastname, job_store) values (7958, 'Aysik', 'Raynor-Cormier');
insert into vendors (vendor_id, vendor_lastname, job_store) values (6066, 'Brolly', 'Harris-Carroll');
insert into vendors (vendor_id, vendor_lastname, job_store) values (6354, 'Smullen', 'Harris-Carroll');
insert into vendors (vendor_id, vendor_lastname, job_store) values (7043, 'Kingswoode', 'Harris-Carroll');
insert into vendors (vendor_id, vendor_lastname, job_store) values (9289, 'Muggleston', 'Harris-Carroll');
insert into vendors (vendor_id, vendor_lastname, job_store) values (8546, 'Howgego', 'Kertzmann, Waters and Kris');
insert into vendors (vendor_id, vendor_lastname, job_store) values (5773, 'William', 'Kertzmann, Waters and Kris');
insert into vendors (vendor_id, vendor_lastname, job_store) values (6686, 'Ewings', 'Kertzmann, Waters and Kris');


insert into storages (storage_id, product_upc, unit) values (9, '74-052-7344', 192);
insert into storages (storage_id, product_upc, unit) values (68, '75-584-7913', 130);
insert into storages (storage_id, product_upc, unit) values (86, '73-175-2063', 174);


insert into customers (customer_id, customer_name, gender, date_of_birth, location) values (525418, 'Mick', 'Male', '1987/06/30', 'Los Angeles');
insert into customers (customer_id, customer_name, gender, date_of_birth, location) values (302572, 'Suzie', 'Male', '1995/10/15', 'Los Angeles');
insert into customers (customer_id, customer_name, gender, date_of_birth, location) values (650013, 'Elisha', 'Female', '1999/03/27', 'Los Angeles');
insert into customers (customer_id, customer_name, gender, date_of_birth, location) values (341469, 'Candace', 'Male', '1996/07/29', 'Los Angeles');
insert into customers (customer_id, customer_name, gender, date_of_birth, location) values (281370, 'Adora', 'Female', '1992/11/14', 'Pindaré Mirim');
insert into customers (customer_id, customer_name, gender, date_of_birth, location) values (185517, 'Jesse', 'Female', '2000/03/13', 'Pindaré Mirim');
insert into customers (customer_id, customer_name, gender, date_of_birth, location) values (645564, 'Ethelyn', 'Male', '2000/07/18', 'Pindaré Mirim');
insert into customers (customer_id, customer_name, gender, date_of_birth, location) values (820112, 'Cher', 'Female', '1985/02/11', 'Jiufang');
insert into customers (customer_id, customer_name, gender, date_of_birth, location) values (764370, 'Fidole', 'Female', '1993/10/04', 'Jiufang');
insert into customers (customer_id, customer_name, gender, date_of_birth, location) values (429259, 'Dora', 'Female', '1990/11/01', 'Jiufang');


insert into sell (receipt_id, store_name, product_upc, customer_id, vendor_id, price, date_of_sell) values (2516300, 'Raynor-Cormier', '74-052-7344', 525418, 9474, 1818, '2020-12-21');
insert into sell (receipt_id, store_name, product_upc, customer_id, vendor_id, price, date_of_sell) values (2516301, 'Raynor-Cormier', '74-052-7344', 525418, 9474, 1818, '2020-12-21');
insert into sell (receipt_id, store_name, product_upc, customer_id, vendor_id, price, date_of_sell) values (3348801, 'Raynor-Cormier', '74-052-7344', 302572, 9474, 1080, '2021-09-21');
insert into sell (receipt_id, store_name, product_upc, customer_id, vendor_id, price, date_of_sell) values (2029361, 'Raynor-Cormier', '74-052-7344', 302572, 9474, 1047, '2020-12-12');
insert into sell (receipt_id, store_name, product_upc, customer_id, vendor_id, price, date_of_sell) values (3318634, 'Raynor-Cormier', '74-052-7344', 650013, 7330, 1485, '2021-10-17');
insert into sell (receipt_id, store_name, product_upc, customer_id, vendor_id, price, date_of_sell) values (1949196, 'Raynor-Cormier', '75-584-7913', 525418, 7330, 325, '2020-12-13');
insert into sell (receipt_id, store_name, product_upc, customer_id, vendor_id, price, date_of_sell) values (4619287, 'Raynor-Cormier', '75-584-7913', 650013, 7330, 497, '2021-04-10');
insert into sell (receipt_id, store_name, product_upc, customer_id, vendor_id, price, date_of_sell) values (8459958, 'Raynor-Cormier', '00-938-2796', 650013, 7958, 1660, '2021-05-17');
insert into sell (receipt_id, store_name, product_upc, customer_id, vendor_id, price, date_of_sell) values (8669713, 'Harris-Carroll', '75-584-7913', 341469, 7958, 259, '2021-04-16');
insert into sell (receipt_id, store_name, product_upc, customer_id, vendor_id, price, date_of_sell) values (4057567, 'Harris-Carroll', '75-584-7913', 341469, 7958, 1553, '2021-08-25');
insert into sell (receipt_id, store_name, product_upc, customer_id, vendor_id, price, date_of_sell) values (9365150, 'Harris-Carroll', '75-584-7913', 525418, 6066, 1237, '2021-07-23');
insert into sell (receipt_id, store_name, product_upc, customer_id, vendor_id, price, date_of_sell) values (6841919, 'Harris-Carroll', '75-584-7913', 341469, 6066, 1083, '2021-03-19');
insert into sell (receipt_id, store_name, product_upc, customer_id, vendor_id, price, date_of_sell) values (8888294, 'Harris-Carroll', '00-938-2796', 281370, 6066, 431, '2021-02-01');
insert into sell (receipt_id, store_name, product_upc, customer_id, vendor_id, price, date_of_sell) values (8446117, 'Harris-Carroll', '00-938-2796', 281370, 6354, 1117, '2021-01-12');
insert into sell (receipt_id, store_name, product_upc, customer_id, vendor_id, price, date_of_sell) values (8869585, 'Harris-Carroll', '87-319-6001', 185517, 6354, 1560, '2021-05-25');
insert into sell (receipt_id, store_name, product_upc, customer_id, vendor_id, price, date_of_sell) values (7310292, 'Harris-Carroll', '00-938-2796', 185517, 6354, 1990, '2021-04-22');
insert into sell (receipt_id, store_name, product_upc, customer_id, vendor_id, price, date_of_sell) values (4583624, 'Harris-Carroll', '87-319-6001', 525418, 7043, 926, '2021-04-11');
insert into sell (receipt_id, store_name, product_upc, customer_id, vendor_id, price, date_of_sell) values (2662532, 'Harris-Carroll', '89-690-8842', 302572, 7043, 215, '2021-04-13');
insert into sell (receipt_id, store_name, product_upc, customer_id, vendor_id, price, date_of_sell) values (8354163, 'Kertzmann, Waters and Kris', '74-052-7344', 302572, 7043, 523, '2021-05-12');
insert into sell (receipt_id, store_name, product_upc, customer_id, vendor_id, price, date_of_sell) values (2831337, 'Kertzmann, Waters and Kris', '74-052-7344', 302572, 9289, 459, '2021-05-08');
insert into sell (receipt_id, store_name, product_upc, customer_id, vendor_id, price, date_of_sell) values (6379619, 'Kertzmann, Waters and Kris', '00-938-2796', 281370, 9289, 1464, '2020-12-21');
insert into sell (receipt_id, store_name, product_upc, customer_id, vendor_id, price, date_of_sell) values (6601649, 'Kertzmann, Waters and Kris', '75-584-7913', 645564, 9289, 1138, '2021-08-05');
insert into sell (receipt_id, store_name, product_upc, customer_id, vendor_id, price, date_of_sell) values (9956496, 'Kertzmann, Waters and Kris', '89-690-8842',429259, 9289, 908, '2021-10-15');
insert into sell (receipt_id, store_name, product_upc, customer_id, vendor_id, price, date_of_sell) values (6991041, 'Kertzmann, Waters and Kris', '74-052-7344', 645564, 8546, 111, '2021-01-09');
insert into sell (receipt_id, store_name, product_upc, customer_id, vendor_id, price, date_of_sell) values (8651992, 'Kertzmann, Waters and Kris', '00-938-2796', 764370, 8546, 133, '2021-08-26');
insert into sell (receipt_id, store_name, product_upc, customer_id, vendor_id, price, date_of_sell) values (9050796, 'Kertzmann, Waters and Kris', '75-584-7913', 429259, 8546, 1916, '2021-09-23');
insert into sell (receipt_id, store_name, product_upc, customer_id, vendor_id, price, date_of_sell) values (4684347, 'Kertzmann, Waters and Kris', '75-584-7913', 429259, 5773, 1884, '2021-08-23');
insert into sell (receipt_id, store_name, product_upc, customer_id, vendor_id, price, date_of_sell) values (5965865, 'Raynor-Cormier', '74-052-7344', 645564, 5773, 1131, '2021-07-12');
insert into sell (receipt_id, store_name, product_upc, customer_id, vendor_id, price, date_of_sell) values (9042680, 'Raynor-Cormier', '77-543-0691', 645564, 5773, 1317, '2021-11-10');
insert into sell (receipt_id, store_name, product_upc, customer_id, vendor_id, price, date_of_sell) values (8303569, 'Raynor-Cormier', '00-938-2796', 820112, 6686, 1068, '2021-05-31');
insert into sell (receipt_id, store_name, product_upc, customer_id, vendor_id, price, date_of_sell) values (8615563, 'Raynor-Cormier', '74-052-7344', 820112, 6686, 156, '2021-04-05');
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--QUERIES
--4.1. What are the 20 top-selling products at each store?
SELECT product_name,store_name,count(sell.product_upc)
from sell
inner join products p on sell.product_upc = p.upc
GROUP BY product_name, store_name
ORDER BY count(sell.product_upc) DESC;

--4.2. What are the 20 top-selling products in each state?
SELECT s.location,count(sell.product_upc)
from sell
inner join products p on sell.product_upc = p.upc
inner join stores s on sell.store_name = s.stores_name
GROUP BY s.location
ORDER BY count(sell.product_upc) DESC;

--4.3. What are the 5 stores with the most sales so far this year?
SELECT store_name,count(store_name)
from sell
where date_of_sell >= '2021-01-01'
GROUP BY store_name
ORDER BY count(sell.product_upc) DESC;

--4.4. • In how many stores does Coke outsell Pepsi?
CREATE VIEW pepsi as
    SELECT store_name,count(*) as cnt1
from sell
    inner join products p on p.upc = sell.product_upc
WHERE product_name = 'PEPSI'
group by store_name;

CREATE VIEW cola as
    SELECT store_name,count(*) as cnt2
from sell
    inner join products p on p.upc = sell.product_upc
WHERE product_name = 'COCA-COLA'
group by store_name;

SELECT pepsi.store_name,count(pepsi.store_name)
from pepsi
inner join cola  on pepsi.store_name = cola.store_name
where cnt1 > cnt2
group by pepsi.store_name;

--4.5. What are the top 3 types of product that customers buy in addition to milk?
SELECT product_name, count(sell.product_upc)
from sell
inner join products p on p.upc = sell.product_upc
where product_name != 'SNICKERS' --OR MILK
group by product_name
ORDER BY count(sell.product_upc) DESC LIMIT 3;