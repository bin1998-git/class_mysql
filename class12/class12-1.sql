-- DDL 

-- product tb에 is_deleted 컬럼을 추가 (소프트 삭제용)
alter table product add column is_deleted boolean default false;
select * from product;

select * from orders;

alter table orders add index idx_created_at (created_at);
show index from orders;

-- DML
select * from member;
select 
	*
from
	member
where
	grade = 'VIP';

select * from orders;

select
	*
from
	orders
where
	status = '배송중';

select * from product;

select
	*
from
	product
where
	stock < 50;

select
	*
from
	product
where
	category_id = 4;
select * from category;

-- update  연습 (반드시 실수를 하지말자)

-- 김영희 등급을 GOLD로 업그레이드
select * from member where name = '김영희';

update
	member
set
	grade = 'GOLD'
where
	name = '김영희';
    
-- 주문 상태 변경(결제대기 --> 결제완료)
select * from orders where id = 6;
update 
	orders
set
	status = '결제완료'
where
	id = 6;
    
-- 상품 재고 감소 (구매시 처리 되어야 함)
select * from product;
update
	product
set
	stock = stock -1
where
	id = 1;
    
update
	product
set
	price = price * 0.967
where
	id = 1;
    
-- delete(소프트 삭제)
select * from product;
update
	product
set
	is_deleted = true
where
	id = 1;
    
select
	*
from
	product
where
	is_deleted = false;


select * from member;

-- 유니크 키 추가, 안되는이유 확인 처리
alter table member add constraint uk_email unique (email);
-- 또는 짧은 구문으로도 유니크 추가가능
alter table member add unique (email);

-- unique 위반
insert into member(email, name) values
('hong@test.com', '홍길동2');


-- fk 위반
insert into orders(member_id, total_price) values
(999, 5000);


-- name이 not null임
insert into product(category_id, price, stock) values
(1, 500, 10);


select name, price 
from product 
where price between 100000 and 1500000;

-- 2.
select * 
from product 
where name like '%삼성%';

-- 3.
select name, email, grade
from member
where grade in ('VIP', 'GOLD');

-- 4.
select * 
from product 
order by price desc limit 3;

-- 5.
ALTER TABLE product ADD COLUMN is_deleted BOOLEAN DEFAULT FALSE; 
select name, stock, price 
from product 
where stock > 30 and price < 50000 and is_deleted = false;

-- 6.
select * from product;

update product
set stock = stock + 10
where stock < 30 and category_id = 1;

select * from product where stock < 30 and category_id = 1;

-- 7. 
select * from orders;
update orders
set status = '결제완료'
where status = '결제대기';

select * from orders where status = '결제완료';

-- 8.
select * from member;

update member
set grade = 'GOLD'
where email in ('hong@tset.com', 'lee@test.com');

select * from member where email in ('hong@tset.com', 'lee@test.com');

-- 9.

-- 재고가 0인 테스트 상품 3개 추가
INSERT INTO product (category_id, name, price, stock, description, is_deleted) VALUES
(2, '단종 청바지',   89000.00, 0, '재고 소진으로 판매 종료 예정', FALSE),
(3, '품절 과자 세트', 15000.00, 0, '일시 품절 상태',              FALSE),
(1, '구형 이어폰',   35000.00, 0, '신모델 출시로 재고 소진',      FALSE);

-- 추가 확인
SELECT name, stock, is_deleted FROM product WHERE stock = 0;

update product 
set is_deleted = true
where stock = 0 and is_deleted = false;

select * from product where stock = 0;

-- 10.
select * from product;

update product
set is_deleted = true
where category_id = 4 and price >= 40000;

select * from product where category_id = 4;
	

    
