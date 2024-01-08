
INSERT INTO customer (customer_code, customer_name, customer_adress) VALUES
 ('001', '가길동', '수원시'),
 ('002', '나길동', '안산시'),
 ('003', '조길동', '서울시'),
 ('004', '홍길동', '안양시');
 
 INSERT INTO orders (orders_code, orders_name, orders_qty, orders_price, customer_code) VALUES
 ('101','사과',2,300,'001'),
('102','우유',3,200,'001'),
('103','시금치',4,100,'002'),
('104','콜라',7,200,'002'),
('105','두부',5,300,'003'),
('106','햄버거',2,200,'003'),
('107','빵',3,100,'003'),
('108','감자',1,200,'003'),
('109', '오이',5,200,'004');

select*from customer;
select*from orders;

select customer_name, customer_adress, orders_name, orders_qty, orders_price
from customer c
inner join orders d
on c.customer_code=d.customer_code
where c.customer_name='조길동';

select sum(orders_price)
from customer c
inner join orders d
on c.customer_code=d.customer_code
where c.customer_code='002';

select c.customer_code, sum(d.orders_price)
from customer c
inner join orders d
on c.customer_code=d.customer_code
group by c.customer_code;

select customer_code, customer_name, customer_adress
from customer 
group by customer_code
order by customer_code desc;

update customer
set customer_name='홍길순', customer_adress='인천시'
where customer_code='004';

select orders_code, orders_name
from orders
where char_length(orders_name)>=3








