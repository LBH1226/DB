 

 -- Q4.제품별로 판매된 총 수량과 가격을 계산하는질의
 -- sum() : 집계함수
select*from t_sales;
select*from t_product;

select ts.product_code, tp.product_name, sum(ts.qty) as tatal, sum(ts.qty*tp.price) as total_price
from t_sales ts
inner join t_product tp
on ts.product_code=tp.product_code
group by product_code;




