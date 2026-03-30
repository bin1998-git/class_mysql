use school;

-- 2학년인 학생들 조회
select
	*
from
	student
where
	grade = 2;
    
-- 컴퓨터공학전공 학생들 조호ㅓㅣ
select
	student_id as 학번, name as 이름
from
	student
where
	major = '컴퓨터공학';
    
    
select
	name as 이름
from
	student
where
	phone is null;
    
-- ---------------
select 
	*
from
	enrollment;

-- 점수가 90 이상인 수강 기록
select
	*
from
	enrollment
where
	score >= 90;
    
-- 점수가 80 90 사이
select
	*
from
	enrollment
where
	score between 80 and 90;
    
-- 78.00 95.00
select 
	*
from
	enrollment
where
	score in (78.00, 95.00);