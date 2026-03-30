use school;

-- 특정 컬럼만 조회
select name, major from student;

-- where 조건 추가
select 
	*
from
	student
where
	name = '김철수';

-- 별칭 (AS) 사용
select
	student_id as 학번, name as 이름
from
	student;

-- mysql에서도 연산자를 사용 할 수 있다
select 
	*
from
	student
where
	not name = '김철수'; -- 김철수의 이름을 안가진 모든 사람 추출

SELECT 
    *
FROM
    student
WHERE
	grade between 1 and 2; -- 1 ~ 2학년을 포함된 자료를 출력
    
select
	*
from
	student
where
	name like '김%';
    

select
	*
from
	student
where
	major like '%학'; -- major 뒤에 학이라는 거를 가진 학과 추출
    
    
 --  null 컬럼에 null 값을 찾을때는 ==는 사용하면 결과가 안나온다. *주의* is null 이라고 정의해야함
select
	*
from
	student
where
	phone is not null; -- null값이 아닌애들(값이 있는애들이라고 생각하면 쉬움)
    

    
    




