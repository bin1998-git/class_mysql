select
	s.name          AS 학생이름,
	su.subject_name AS 과목명,
    e.score         AS 점수
from enrollment e
inner join student s on e.student_id = s.student_id
inner join subject su on e.subject_id = su.subject_id;


select * from enrollment;
select * from subject;
select * from student;
SELECT
    s.name          AS 학생이름,
    su.subject_name AS 과목명,
    e.score         AS 점수
from student s
left join enrollment e on s.student_id = e.student_id
left join subject su on e.subject_id = su.subject_id;

use shop;

select * from orders;
select * from member;
select * from order_item;

SELECT
    m.name        AS 회원명,
    o.id          AS 주문번호,
    o.total_price AS 주문금액,
    o.status      AS 주문상태
from orders o
left join member m on o.id = m.id;

SELECT
    m.name        AS 회원명,
    o.id          AS 주문번호,
    o.total_price AS 주문금액,
    o.status      AS 주문상태
from orders o
left join member m on o.id = m.id;

SELECT
    o.id        AS 주문번호,
    m.name      AS 회원명,
    p.name      AS 상품명,
    oi.quantity AS 수량,
    oi.price    AS 상품가격
from order_item oi
inner join orders o on oi.id = o.id
inner join product p on oi.id = p.id
inner join member m on o.id = m.id;

