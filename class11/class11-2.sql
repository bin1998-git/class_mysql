-- 인덱스 실습

use shop;

-- 문제 1. product, orders, member 테이블에 현재 인덱스 확인
show index from product;
show index from orders;
show index from member;

desc member;
desc orders;
-- 문제 2
-- 멤버 테이블에 grade 컬럼에 인덱스 추가( vip회원 조회시 자주 사용)
alter table member
add index idx_grade(grade);
-- orders 테이에 status 인덱스 추가 (주문 상태별 조회 시 자주 사용)
alter table orders
add index idx_status(status);
 -- member 테이블에 grade에 걸린 인덱스 삭제
drop index idx_grade on member;
