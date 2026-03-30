use shop;
show tables;

-- member 회원가입
-- orders 테이블 1번 회원이 주문한 목록 데이터가 있다고 가정
-- 두 테이블에 fk관계 일떄 member테이블에 접근해서 1번 회원을 삭제할 수 있을까
select * from member;

select * from orders;

insert into orders(member_id, total_price) values (1, 10000);

-- fk위반으로 인하여 삭제 안됨 (orders tb에 memberid 인 1번 데이터가 존재하기 때문에
-- member 테이블에 1번 회원을 삭제하면 orders tb 에 member_id은 무의미한 데이터가 된다
delete from
	member
where
	id = 1;
    
-- 맴버 2번은 삭제가 가능하다 
-- 결론 orders테이블에 존재하는 member_id 값 을 먼저 삭제하고 member  테이블에 pk 인 1번 회원을 삭제 가능
delete from
	member
where
	id = 2;
    
-- orders 테이블에 데이터 삭제
delete from
	orders
where
	member_id = 1;
    
-- 현재 orders 테이블에 걸린 정확한 FK 이름을 확인 (명령문 또는 GUI로 확인)
show create table orders;

-- 1 기존 제약 조건을 삭제합니다.
alter table orders drop foreign key orders_ibfk_1;

-- 2 CASCADE 옵션을 추가하여 제약 조건을 추후 새로 정의할 수 있다.
-- 기존에는 테이블 생성시 키 제약을 추가 했다면 테이블 생성 후에도 키를 변경 수정 삭제 가능함.
alter table orders
add constraint fk_orders_member
foreign key(member_id) references member(id)
on delete cascade -- 부모 삭제시 자식도 삭제 됨
on update cascade; -- 부모 pk 수정시 fk도 수정

-- 테스트
select * from member;
select * from orders;

insert into member(email, name) values ('hong@test.com', '홍길동');
insert into member(email, name) values ('kim@test.com', '김영희');

insert into orders(member_id, total_price) values (6, 10000);

-- 연쇄 수정 확인
update member set id = 99 where id =4;

-- 연쇄 삭제 확인
delete from member where id = 99; 


CREATE DATABASE IF NOT EXISTS practice_db;
USE practice_db;

-- 저자 테이블 (PK + UNIQUE)
CREATE TABLE author (
    author_id  INT          PRIMARY KEY AUTO_INCREMENT,
    name       VARCHAR(50)  NOT NULL,
    email      VARCHAR(100) NOT NULL UNIQUE,
    phone      VARCHAR(20)  UNIQUE
);

-- 도서 테이블 (PK + FK)
CREATE TABLE book (
    book_id    INT           PRIMARY KEY AUTO_INCREMENT,
    title      VARCHAR(100)  NOT NULL,
    author_id  INT           NOT NULL,
    price      DECIMAL(10,2) NOT NULL,
    isbn       VARCHAR(20)   UNIQUE,
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

-- 저자 데이터 입력
INSERT INTO author (name, email, phone) VALUES
('김자바',   'java@test.com',   '010-1111-1111'),
('이디비',   'db@test.com',     '010-2222-2222'),
('박스프링', 'spring@test.com', '010-3333-3333');

-- 도서 데이터 입력
INSERT INTO book (title, author_id, price, isbn) VALUES
('자바 완전정복',      1, 32000, 'ISBN-001'),
('MySQL 입문',          2, 28000, 'ISBN-002'),
('스프링 부트 실전',    3, 35000, 'ISBN-003'),
('자바 심화학습',        1, 29000, 'ISBN-004');

select * from author;

INSERT INTO author (name, email, phone)
VALUES ('정테스트', 'java@test.com', '010-9999-9999'); -- 포링키 제약

select * from book;

INSERT INTO book (title, author_id, price, isbn)
VALUES ('신규 도서', 1, 20000, 'ISBN-005'); -- 외래키 제약조건 위반


-- 시도 1: 중복 ISBN 입력
INSERT INTO book (title, author_id, price, isbn)
VALUES ('또 다른 책', 1, 15000, 'ISBN-001'); -- 유니크키가 걸려있는데 1번에 사용중

-- 시도 2: isbn 에 NULL 입력
INSERT INTO book (title, author_id, price, isbn)
VALUES ('염리는 책', 2, 18000, NULL); -- 가능함 널값 허용

select * from author;

DELETE FROM author WHERE author_id = 1; -- cascade로 제약 풀어줘야함


create table review(
	review_id int primary key auto_increment,
    book_id int not null,
    author_id int not null,
    rating int not null,
    content text not null,
    created_at datetime default current_timestamp,
    foreign key (book_id) references book(book_id),
	foreign key (author_id) references author(author_id)
);

