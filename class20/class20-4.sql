-- 각 도서별 대출 통계 (그룹바이 사용)

select * from student;
select * from book;
select * from borrow;
select * from review;

-- 자바 기초라는 책이 몇번 대출 되었을까? (각 책에 대한 대출 횟수, 대출 학생수)
select
	b.title as 도서명,
    count(br.student_id) as 총대출횟수,
    count(distinct br.student_id) as 대출학생수
from book b
left join borrow br on b.id = br.book_id
group by b.id, b.title;

select * from product;
select * from orders;
select * from member;
select * from category;



-- 도서명과 총대출횟수 그리고 대출한 학생수를 중복없이 나타내세요



select * from student;
select * from book;
select * from borrow;
select * from review;


select
	b.title as 도서명,
    count(br.student_id) as 총대출횟수,
    count(distinct br.student_id) as 대출학생수
from book b
left join borrow br on b.id = br.book_id
group by b.id, b.title;







select * from book;




select * from student;
select * from book;
select * from borrow;










-- 김철수 학생이 자바기초이전에 대출한적이 있지만 한번 더 대출함
insert into borrow(student_id, book_id) values(1, 1);

delete from borrow where id = 8;

-- 행 별로 중복을 제거 하고 싶다면 distinct 사용하면 된다
-- 집계 함수 count 경우 중복된 값을 카운트에 제거하고 싶다면 distinct