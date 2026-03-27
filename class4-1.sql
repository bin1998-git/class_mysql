-- 데이터 베이스 구축하기
CREATE DATABASE school;

-- 어떤 데이터베이스를 사용하겠다.
use school; 

-- 테이블 생성

-- 1. 학생 테이블 만들기
CREATE TABLE student(
	student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    grade INT NOT NULL,
    major VARCHAR(50) NOT NULL,
    phone VARCHAR(20)
);

select * from student;

-- 2. 과목 테이블 만들기
CREATE TABLE subject(
	subject_id INT PRIMARY KEY,
    subject_name VARCHAR(50) NOT NULL,
    credit INT NOT NULL,
	professor VARCHAR(30) NOT NULL
);


-- 3. 수강 테이블(student 테이블 subject 테이블 연결) -> FK 
CREATE TABLE enrollment(
	enrollment_id INT PRIMARY KEY,
    student_id INT NOT NULL, -- 일반적으로 FK를 선언시 not null로 설정함
    subject_id int not null,
	score		deciMAL(5, 2),
    enrolleD_AT DATE nOT null,
    foreign KEY(student_id) reFERENCEs STUdent(student_id),
    foreign Key(subject_id) reFERENCEs SUBject(subject_id)
);

-- 테이블 목록 확인
SHow tableS;




