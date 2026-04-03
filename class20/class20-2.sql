
-- 1단계 distinct 
select * from student;
select * from book;
select * from borrow;
select * from review;

-- 문제 : 학생들 중 책을 한번이라도 빌린 학생의 학번과 이름을 출력하시오.
select
	s.id,
    s.name
from student s
join borrow b on s.id = b.student_id;

-- 명단에 중복을 없애주세요
select
	distinct s.id,
    s.name
from student s
join borrow b on s.id = b.student_id;

-- 문제2. 리뷰가 등록된 책 이름만 알고 싶다
select
	b.title
from book b
join review r on b.id = r.book_id;


select
distinct b.title
from book b
join review r on b.id = r.book_id;
