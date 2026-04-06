use shop2;

-- 테이블이 없다면 아래를 실행하세요
create database shop2;
USE shop2;

CREATE TABLE IF NOT EXISTS product2 (
    id          INT           PRIMARY KEY AUTO_INCREMENT,
    name        VARCHAR(100)  NOT NULL,
    price       INT           NOT NULL,
    stock       INT           DEFAULT 0,
    description VARCHAR(200)
);

-- 기존 데이터 확인
SELECT * FROM product2;
SELECT * FROM product2;


insert into product2(name,price,stock, description)
values("테스트1", 1000, 5, '테스트 값');

update product2
set price = 1
where name = '테스트1';

delete from
product2
where id = 1;

