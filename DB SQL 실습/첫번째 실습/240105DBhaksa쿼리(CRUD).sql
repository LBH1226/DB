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
limit 1;

-- 컴퓨터공학과에 소속된 교수 이름을 출력하세요.(학과명, 교수이름)
select*from professor;
select*from student;
select*from department;

select  d.department_name, p.professor_name
from department d
inner join professor p
on d.department_code=p.department_code
where d.department_name='컴퓨터공학과';

-- 학과별 교수의 수를 출력하세요
select d.department_name, count(*) as cnt
from department d
inner join professor p
on d.department_code=p.department_code
group by department_name;

-- 교수의 수가 2명이상인 학과 출력

select d.department_name, count(*) as cnt
from department d
inner join professor p
on d.department_code=p.department_code
group by department_name
having cnt>=2;

-- 가장 많은 학생이 있는 학과명과 학생수 출력


select d.department_name, count(*) cnt
from department d
inner join student s
on d.department_code=s.department_code
group by department_name
order by cnt desc
limit 1;
 
 
 -- 카운트수가 4인 학과코드 출력
select department_code, count(*) cnt from student 
group by department_code
having cnt=4;

select department_code from student 
group by department_code
having count(department_code)=4;

-- 서브쿼리
select department_name
from department
where department_code=(
select department_code from student 
group by department_code
having count(department_code)=(
select count(department_code) cnt from student 
group by department_code
order by  cnt desc 
limit 1
)
);

-- 학생중 성이 아인 학생이 속한 학과명과 학생명을 출력

select d.department_name, s.student_name
from department d
inner join student s
-- on d.department_code=s.department_code
where student_name like '아%';

select*from professor;
select*from student;
select*from department;

-- 학생 중 키가 175~180 사이에 속한 학생수를 출력
select count(student_id) cnt
from student
where student_height>=175 and student_height<=180;

-- 다길동 학생과 같은 학과에 속한 학생의 이름을 출력
-- 서브쿼리 이용
-- 먼저 다길동이의 department_code를 구하고
-- 구한 department_code를 다시 학생테이블에서 같은 department_code의 학생들만 출력

select student_name
from student
where department_code=(
select department_code
from student
where student_name = '다길동'
);

-- 학과별 키의 최고값과 평균값을 출력
select d.department_name, min(s.student_height), max(s.student_height), avg(s.student_height)
from department d
inner join student s
on d.department_code=s.department_code
group by d.department_name;

-- 빌 게이츠 교수가 가르치는 과목이름을 출력하세요
select p.professor_name, c.course_name
from professor p
inner join course c
on p.professor_code=c.professor_code
where p.professor_name='빌 게이츠';

-- max값 확인후 계속 1씩 더해주는 방법으로 고유의 id 대체가능
select max(id) from student_course;
-- max(id)가 null이면 ~~
select ifnull(max(id),0)+1 num from student_course;

select *from student_course;

