create database shop2;
use shop2;

CREATE TABLE member (
    id    INT         PRIMARY KEY,
    email VARCHAR(100) NOT NULL,  -- NULL 불가, 반드시 입력
    name  VARCHAR(50)  NOT NULL,  -- NULL 불가
    phone VARCHAR(20)              -- NULL 허용 (선택 입력)
);

-- NOT NULL 컬럼에 값을 넣지 않으면 오류
INSERT INTO member (id, name) VALUES (1, '김철수');
-- → 오류: email 은 NOT NULL 이라 반드시 값이 있어야 함

-- 올바른 입력
INSERT INTO member (id, email, name)
VALUES (1, 'kim@test.com', '김철수');

select * from member;

CREATE TABLE member (
    id       INT         PRIMARY KEY AUTO_INCREMENT,
    email    VARCHAR(100) NOT NULL,
    name     VARCHAR(50)  NOT NULL,
    grade    VARCHAR(10)  DEFAULT '일반',  -- 기본값 '일반'
    is_active BOOLEAN     DEFAULT TRUE,   -- 기본값 TRUE
    created_at DATETIME   DEFAULT CURRENT_TIMESTAMP -- 현재 시간 자동 입력
);

-- grade, is_active, created_at 생략 → 기본값 자동 적용
INSERT INTO member (email, name)
VALUES ('kim@test.com', '김철수');

SELECT * FROM member;
-- grade='일반', is_active=1, created_at=현재시간 으로 저장됨


-- DEFAULT - 값을 입력하지 않으면 기본값 자동 입력

drop table member;

CREATE TABLE member (
    id       INT         PRIMARY KEY AUTO_INCREMENT,
    email    VARCHAR(100) NOT NULL,
    name     VARCHAR(50)  NOT NULL,
    grade    VARCHAR(10)  DEFAULT '일반',  -- 기본값 '일반'
    is_active BOOLEAN     DEFAULT TRUE,   -- 기본값 TRUE
    created_at DATETIME   DEFAULT CURRENT_TIMESTAMP -- 현재 시간 자동 입력
);

-- grade, is_active, created_at 생략 → 기본값 자동 적용
INSERT INTO member (email, name)
VALUES ('kim@test.com', '김철수');

SELECT * FROM member;
-- grade='일반', is_active=1, created_at=현재시간 으로 저장됨


-- -- -- -- - -- ---------------------
-- id 를 직접 넣지 않아도 자동으로 1, 2, 3... 증가
INSERT INTO member (email, name) VALUES
('hong@test.com',  '홍길동'),
('lee@test.com',  '이영희'),
('park@test.com', '박민준');

SELECT 
    *
FROM
    member;
-- id: 1, 2, 3 자동 부여


delete from member;
-- ---------------------------------
-- 방법 1: 문자열 형식 (권장)
INSERT INTO enrollment (enrollment_id, student_id, subject_id, score, enrolled_at)
VALUES (1, 1001, 101, 88.5, '2024-03-02');

-- 방법 2: 구분자 없는 문자열 형식
VALUES (2, 1001, 102, 92.0, '20240302');

-- 잘못된 날짜 → 오류 발생
VALUES (3, 1001, 103, 90.0, '20241325'); -- 13월은 없음 → 오류!


-- -------------------------------------
-- 실습용 DB 생성
CREATE DATABASE IF NOT EXISTS practice_db;
USE practice_db;

-- 도서 테이블
CREATE TABLE book (
    book_id    INT          PRIMARY KEY AUTO_INCREMENT,
    title      VARCHAR(100) NOT NULL,
    author     VARCHAR(50)  NOT NULL,
    price      DECIMAL(10,2) NOT NULL,
    stock      INT          DEFAULT 0,
    published_at DATE,
    created_at DATETIME     DEFAULT CURRENT_TIMESTAMP
);

-- 회원 테이블
CREATE TABLE customer (
    customer_id INT          PRIMARY KEY AUTO_INCREMENT,
    name        VARCHAR(50)  NOT NULL,
    email       VARCHAR(100) NOT NULL,
    phone       VARCHAR(20),
    grade       VARCHAR(10)  DEFAULT '일반'
);

-- 구매 테이블
CREATE TABLE purchase (
    purchase_id  INT  PRIMARY KEY AUTO_INCREMENT,
    customer_id  INT  NOT NULL,
    book_id      INT  NOT NULL,
    quantity     INT  NOT NULL,
    total_price  DECIMAL(10,2) NOT NULL,
    purchased_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (book_id)     REFERENCES book(book_id)
);

select * from book;

INSERT INTO book (title, author, price, stock, published_at) VALUES
('자바 완전정복','김자바', 32000,50,'2023-06-15');

INSERT INTO book (title, author, price, stock, published_at) VALUES
('MySQL 입문', '이디비',28000, 30, '2022-03-10'),
('스프링 부트 실전', '박스프링',35000, 20, '2023-11-01'),
('파이썬 기초', '최파이',25000, 100, '2021-08-20');

select * from customer;

insert into customer (name, email) VALUES
('홍길동', 'hong@test.com'),
('김영희','kim@test.com' );

select * from purchase;

insert into purchase(customer_id, book_id , quantity, total_price  ) VALUES
(1, 1, 2, 64000);

INSERT INTO purchase (customer_id, book_id, quantity, total_price)
VALUES (1, 1, 1, 32000.00);
-- 포링키로 받아와서 안되는거 999라는게 없어서


