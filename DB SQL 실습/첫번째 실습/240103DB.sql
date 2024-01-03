-- Drop the tables if they exist
DROP TABLE IF EXISTS t_sales;
DROP TABLE IF EXISTS t_customer;
DROP TABLE IF EXISTS t_product;
DROP TABLE IF EXISTS t_region;
-- Create the t_region table
CREATE TABLE t_region (
region_code varchar(3) not null,
region_name varchar(10) not null,
primary key(region_code)
);
-- Create the t_customer table
CREATE TABLE t_customer (
id int not null auto_increment,
customer_name varchar(10) not null,
phone varchar(20) not null unique,
email varchar(50) not null unique,
address varchar(100) not null,
regist_date datetime default now(),
region_code varchar(3) not null,
primary key(id)
);
-- Create the t_product table
CREATE TABLE t_product(
id int not null auto_increment,
product_code varchar(12) not null unique,
product_name varchar(50) not null,
price int,
primary key(id)
);
-- Create the t_sales table
CREATE TABLE t_sales (
id int not null auto_increment,
customer_id int not null,
product_code varchar(12) not null,
qty int not null,
sales_date datetime default now(),
primary key(id)
);

ALTER TABLE t_customer
ADD CONSTRAINT fk_region_code FOREIGN KEY (region_code) 
REFERENCES t_region(region_code);

ALTER TABLE t_sales
ADD CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES t_customer (id),
ADD CONSTRAINT fk_product_code FOREIGN KEY (product_code) REFERENCES t_product (product_code);

select * from information_schema.table_constraints;

INSERT INTO t_region (region_code, region_name) 
VALUES
('02', '서울특별시'),
('031', '경기도'),
('032', '인천광역시'),
('033', '강원특별자치도'),
('041', '충청남도'),
('042', '대전광역시'),
('043', '충청북도'),
('044', '세종특별자치시'),
('051', '부산광역시'),
('052', '울산광역시'),
('053', '대구광역시'),
('054', '경상북도'),
('055', '경상남도'),
('061', '전라남도'),
('062', '광주광역시'),
('063', '전라북도'),
('064', '제주특별자치도');