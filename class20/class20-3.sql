-- count 와 count(distinct)

select * from student;
select * from book;
select * from borrow;
select * from review;

-- 전체 대출 정보 출력 학생id, 이름 ,책 id , 책이름
select 
	s.id as 학생id,
    s.name as 학생이름,
    b.id as 책id,
    b.title as 책이름
from student s
join borrow br on s.id = br.student_id
join book b on b.id = br.book_id
order by s.name asc;

-- 전체 대출이 일어난 횟수만 알고싶다면?
select count(*) as 총대출횟수 from borrow;
select * from borrow;



-- 대출한 학생수만 확인 (한 학생이 여러번 대출 가능하다)
select count(distinct student_id) as 대출학생수 from borrow;

-- distinct는 문법적으로 select절 바로 앞에만 사용할 수 있다
-- 단 count 함수안에 distinct를 사용할 수 있다 (뭉쳐진 바구니안에 중복된 데이터는 제거하고 count한다)

-- 대출 테이블에서 총대출횟수, 대출학생수 각각 출력하시오
select
	count(*) as 총대출횟수,
    count(distinct student_id) as 대출학생수
from borrow;

select * from orders;

-- 


-- 120만원 상품들을 중복된사람 빼고 출력
select
	count(distinct total_price = 1200000.00) as 구매한사람수
from orders;

