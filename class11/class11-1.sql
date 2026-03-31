create  database demo2;
use demo2;

-- 테이블 생성시 인덱스를 추가하는 방법

create table product(
	id int primary key auto_increment,
    category_id int not null,
    name varchar(100) not null,
    price decimal (10, 2) not null,
    stock int default 0,
    index idx_category (category_id),
    index idx_name (name)
);

select * from product;
desc product;

-- 테이블 생성 이후에 인덱스 추가하는 법
alter table product 
add index idx_price(price);

-- 또는 CREATE  사용해도됨
create index idx_price
on product(price);


-- 인덱스를 확인 하는 방법
show index from product;

-- 인덱스 삭제
drop index idx_price on product;