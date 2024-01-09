create database test2;
INSERT INTO customer (customer_id, password, customer_name, age, rating, occupation, reserves)
 VALUES
 ('CUST001', 'CUST001', '홍길동', 30, 'Gold', '엔지니어', 100),
 ('CUST002', 'CUST002', '이영희', 25, 'Silver', '교사', 50),
 ('CUST003', 'CUST003', '김철수', 40, 'VIP', '의사', 75),
 ('CUST004', 'CUST004', '박영훈', 35, 'Silver', '변호사', 25),
 ('CUST005', 'CUST005', '최미영', 28, 'Gold', '예술가', 150);
 INSERT INTO product (product_name, inventory, price, manufacturer)
 VALUES
 ('제품 A', 50, 20000, 'ABC 주식회사'),
 ('제품 B', 30, 35000, 'XYZ 기업'),
 ('제품 C', 80, 15000, 'LMN 산업'),
 ('제품 D', 40, 25000, 'PQR 주식회사'),
 ('제품 E', 20, 30000, 'JKL 기업');
 
 INSERT INTO customer_product (customer_id, product_number, quantity)
 VALUES
 ('CUST001', 1, 2),
 ('CUST002', 3, 1),
 ('CUST003', 2, 3),
 ('CUST004', 4, 2),
 ('CUST005', 5, 1),
 ('CUST001', 2, 1),
 ('CUST002', 4, 2),
 ('CUST003', 1, 3),
 ('CUST004', 5, 1),
 ('CUST005', 3, 2);
 
 
select*from customer;
select*from customer_product;
select*from product;

-- 주문테이블에서 CUST005고객이 주문한 제품의 이름을 출력하세요

select product_name
from customer_product cp
inner join product p
on cp.product_number=p.product_number
where cp.customer_id='CUST005';

