-- DML (데이터를 다룬다)

SELECT
	*
FROM
	student;
    
-- 데이터 추가
INSERT INTO student(student_id, name, grade, major, phone) values
(1001, '김철수', 2 , '컴퓨터공학', '010-1234-1234');

INSERT INTO student(student_id, name, grade, major, phone) values
(1002, '이영희', 3 , '경영학', '010-2222-2222'),
(1003, '박민준', 1 , '전자공학', '010-3333-3333');

-- 데이터 조회 (SELECT)
SELECT
	*
FROM
	student;
    
-- 조건절 추가하기
SELECT
	name, major, grade
FROM
	student
WHERE
	grade = 2;
    
-- 데이터 수정(UPDATE) *조건절이 없으면 전체 수정이 됨 조심*
UPDATE
	student SET
    grade = 3;


-- 데이터 삭제(DELETE) *조건절이 없으면 전체 수정이 됨 조심*
DELETE FROM
	student
WHERE
	student_id = 1003;
    
DELETE FROM
	student;
	