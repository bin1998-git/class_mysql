-- 연습용 db 생성
create database mydb;

use mydb;

create table student_tb(
	student_id int primary key,
    student_name varchar(30) not null,
    student_age int not null,
    phone int not null
);

create table subject_tb(
	subject_id int primary key,
    subject_name varchar(30) not null,
    professor varchar(30) not null
);

create table enrollment_tb(
	enrollment_id int primary key,
    student_id int not null,
    subject_id int not null,
    score int not null,
	foreign KEY(student_id) reFERENCEs student_tb(student_id),
    foreign Key(subject_id) reFERENCEs subject_tb(subject_id)
);

insert into student_tb(student_id, student_name, student_age, phone) values
(1, '빅때땡', 21, 01034342),
(2, '빅때', 22, 01034432),
(3, '빅땡', 23, 010342432),
(4, '빅김', 24, 0103433432);

insert into subject_tb(subject_id, subject_name, professor) values
(1, '수학', '박강사'),
(2, '과학', '이강사'),
(3, '사회', '김강사'),
(4, '영어', '최강사');

insert into enrollment_tb(enrollment_id,student_id, subject_id, score ) values
(1,1,1,80),
(2,2,2,70),
(3,3,3,67),
(4,4,4,60);

select * from student_tb;
select * from subject_tb;
select * from enrollment_tb;

select
	*
from 
	student_tb
where 
	student_id = 1;

	


