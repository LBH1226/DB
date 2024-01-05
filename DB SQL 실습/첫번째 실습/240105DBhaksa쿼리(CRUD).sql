create database haksa;
select*from student;
 
 select*from department;
 
 -- 학생의 학과정보 출력(학생이름,학과명)
 
 select s.student_name, d.department_name
 from student s
 inner join department d
 on d.department_code=s.department_code;

select  s.student_name, d.department_name
from student s, department d
where d.department_code=s.department_code;

-- 학과별 학생수를 구하여 출력하시오(학과명, 학생수)

select*from student;
select*from department;

select  d.department_name, count(s.department_code) as tatal
from student s
inner join department d
on d.department_code=s.department_code
group by department_name;
 
select  d.department_name, count(*) as cnt
from student s
inner join department d
on d.department_code=s.department_code
group by department_name;


-- 학과별 학생수를 구하여 출력하시오(학과명, 학생수), 학생수가 2명이상인 학과를 출력하시오.

select d.department_name, count(*) as cnt
from student s
inner join department d
on d.department_code=s.department_code
group by department_name
having cnt>=2;

-- 국어국문과에 다니는 학생을 출력하세요(학과명 학생이름)

select*from student;
select*from department;

select d.department_name, s.student_name
from student s
inner join department d
on d.department_code=s.department_code
where d.department_name = '국어국문학과';

-- 학생이름이 바로 시작하는, 길동으로 끝나는 , 길이 포함되는 학생 출력
-- like는 검색할때 사용

select*from student
where student_name like '바%';

select*from student
where student_name like '%길동';

select*from student
where student_name like '%길%';

-- 학생의 키가 170이상, 170이상 180이하인 학생만 출력

select*from student
having 170<=student_height;

select*from student
where student_height>=170;

select*from student
where student_height>=170 and student_height<=180;

select*from student
where student_height between 170 and 180;

-- 키가 가장 큰 사람을 출력하시오

select student_name
from student
order by student_height desc
limit 1