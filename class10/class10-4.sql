-- 도서 대출 시스템

create database libary;
-- 학생id 이름 빌린기간
-- 도서책 테이블 제목 저자 빌린날짜 
-- 대출된 도서는 대출일, 반납예정일, 연체여부 (빌린 학생 id 도서책 id로 포링키 만들어서 조회)

create table students(
	students_id int primary key auto_increment,
    name varchar(30) not null
);

create table books(
	books_id int primary key auto_increment,
    students_id int not null,
    name varchar(50) not null unique,
    author varchar(50) not null,
	Borrowed Date not null,
	foreign key (students_id) references students(students_id)
);

create table borrowed_book(
	load_id int primary key auto_increment,
    students_id int not null,
    books_id int not null,
	late boolean not null,
	return_day datetime default current_timestamp,
	foreign key (students_id) references students(students_id),
	foreign key (books_id) references books(books_id)
);

select * from students;

insert into students (name) values
('김김김'),
('박수기');

insert into students (name) values
('김두시'),
('박박박');

select * from books;

insert into books(students_id, name, author, Borrowed) values
(1, '책이다', '이이', '2026-10-10'),
(2, '김가루', '비비', '2026-08-22');

insert into books(students_id, name, author, Borrowed) values
(3, '책철기', '기기', '2026-05-22'),
(4, '백설기', '철기', '2026-03-22');


select * from borrowed_book;
insert into borrowed_book(students_id, books_id, late) values
(1,2,'1'),
(1,1,'1');


 -- 스터디 카페 예약관리 시스템
 
create database korea_it;
use  korea_it;

-- 학원학생 테이블
create  table academy_st(
	id int primary key auto_increment,
    name varchar(30) not null,
    age int not null,
	phone varchar(50) not null,
    course boolean default false
);

-- 강의 테이블
create table class (
    class_id int primary key auto_increment not null,
    class_name varchar(50) not null,
    price decimal(20,2),
    class_date varchar(30),
    class_time varchar(30),
    face_to_face boolean default true
);

-- 강사 테이블
create table instructor(
	instructor_id int primary key auto_increment,
    class_id int not null,
    name varchar(30) not null,
    age int not null,
	phone varchar(50) not null,
    foreign key (class_id) references class(class_id)
);


-- 강의실 테이블
create table companyroom(
    classroom_id int primary key auto_increment,
    name varchar(20) not null,
    capacity int not null,
    computers int not null,
    id int not null,
    instructor_id int not null,
    foreign key(id) references academy_st(id),
    foreign key(instructor_id) references instructor(instructor_id)
);

-- 5. 수강 신청 테이블 (학생과 강의를 연결하는 중간 테이블)
CREATE TABLE enrollment (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    class_id INT,
    enroll_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES academy_st(id),
    FOREIGN KEY (class_id) REFERENCES class(class_id)
);

-- 멘토 테이블
CREATE TABLE mento(
    mento_id INT PRIMARY KEY AUTO_INCREMENT,
    mento_name VARCHAR(50) NOT NULL,
    mento_phone VARCHAR(20) NOT NULL UNIQUE
);


-- 1. class 먼저
INSERT INTO class (class_name, price, class_date, class_time, face_to_face) VALUES
('Java 기초', 300000, '2025-03-01', '09:00~12:00', true),
('Python 입문', 250000, '2025-03-05', '13:00~16:00', true),
('데이터분석', 350000, '2025-03-10', '10:00~13:00', false),
('AI 머신러닝', 400000, '2025-03-15', '14:00~17:00', false),
('웹개발 기초', 280000, '2025-03-20', '09:00~12:00', true);

-- 2. academy_st
INSERT INTO academy_st (name, age, phone, course) VALUES
('김민준', 22, '010-2345-2678', true),
('이서연', 25, '010-2345-6789' , false),
('박지훈', 28, '010-3456-7890', true),
('최수아', 23, '010-4567-8901', false),
('정태양', 30, '010-5678-9012', true);

-- 3. instructor
INSERT INTO instructor (class_id, name, age, phone) VALUES
(1, '홍길동', 35, '010-9876-5432'),
(2, '이영희', 40, '010-8765-4321'),
(3, '박철수', 38, '010-7654-3210'),
(4, '김유진', 45, '010-6543-2109'),
(5, '최민수', 33, '010-5432-1098');

-- 4. companyroom
INSERT INTO companyroom (name, capacity, computers, id, instructor_id) VALUES
('A', 20, 16, 1, 1),
('B', 24, 20, 2, 2),
('C', 28, 28, 3, 3),
('D', 24, 24, 4, 4),
('E', 16, 16, 5, 5);

-- 5. mento 
INSERT INTO mento (mento_name, mento_phone) VALUES
('강멘토', '010-1111-2222'),
('윤멘토', '010-2222-3333'),
('임멘토', '010-3333-4444'),
('한멘토', '010-4444-5555'),
('조멘토', '010-5555-6666');

INSERT INTO enrollment (student_id, class_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

SELECT
    s.id            AS 학생ID,
    s.name          AS 학생명,
    s.age           AS 나이,
    s.phone         AS 연락처,
    s.course        AS 수강여부,
    r.name          AS 강의실,
    r.capacity      AS 수용인원,
    r.computers     AS 컴퓨터수,
    i.name          AS 담당강사,
    c.class_name    AS 강의명,
    c.price         AS 수강료,
    c.class_date    AS 강의날짜,
    c.class_time    AS 강의시간,
    c.face_to_face  AS 대면여부
FROM academy_st s
JOIN companyroom r  ON s.id            = r.id
JOIN instructor  i  ON r.instructor_id = i.instructor_id
JOIN class       c  ON i.class_id      = c.class_id
ORDER BY s.id;


