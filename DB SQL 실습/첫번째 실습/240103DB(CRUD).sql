-- Q : 모든고객의정보를출력하세요
select*from t_customer;
-- 하나의 항목만 가져오는법
select customer_name,phone from t_customer;

insert into t_customer(customer_name, phone, email, address, region_code)
values('손흥민','010-1234-7894','son@gmail.com','서울특별시 강남구 삼성동','02');

insert into t_customer(customer_name, phone, email, address, region_code)
values('박태환','010-1234-5555','park@gmail.com','제주특별자치도 제주시 일도','064');

-- Q:손흥민고객의주소를수정하세요(서울특별시 강남구 일동)
update t_customer
set adress='서울특별시 강남구 일동'
where id=5;

--  Q:홍길동고객을삭제하세요 -> 구매한고객정보는 삭제안됨
delete from t_customer where id=1;

--  Q.서울에거주하는고객을출력하세요
select*from t_customer where region_code='02';

select*from t_product;

insert into t_sales(customer_id, product_code, qty)
values(14,'P003',2);

select*from t_sales;

-- Q2. 특정 지역(예:'서울특별시')에 사는 고객의 이름과 전화번호를 가져오는 질의
select customer_name, email
from t_customer
where region_code='02';


-- Q. 모든 고객의 정보를 출력하시오(단 고객번호, 이름, 지역명)
select id, customer_name,region_code 
from t_customer;

select*
from t_customer tc
inner join t_region tr
on tc.region_code=tr.region_code;

select  tc.id, tc.customer_name, tr.region_name
from t_customer tc
inner join t_region tr
on tc.region_code=tr.region_code;

select  tc.id, tc.customer_name, tr.region_name
from t_customer tc
left join t_region tr
on tc.region_code=tr.region_code;

select  tc.id, tc.customer_name, tr.region_name
from t_customer tc
right join t_region tr
on tc.region_code=tr.region_code;








 
