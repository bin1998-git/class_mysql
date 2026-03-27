--  테이블 복사 쿼리 만들어 보기

use employees;
select * from employees;

-- 기존에 데이터 테스트를 할 때 값을 마구 변경하면 상용서비스에 문제
-- 테스트를 먼저 하기 위해 테이블 복사를 하고 여기서 테스트를 많이 진행한다.

-- 테이블 복사시 구조만 복사
create table tb_employees
AS select 
* 
from 
employees 
WHERE 1 = 0;

select * from tb_employees;
drop table tb_employees;

-- 테이블 복사시 구조 + 데이터까지 
create table tb_employees
AS select 
* 
from 
employees ;

-- 1일1쿼리 (하루에 한개씩 직접 문제를 분석해서 만들고 풀기)

-- 1 . employees DB 각 테이블 어떤 의미인지 파악
-- 2. 파악을 한 후 자기가 배운거에 있어서 스스로 직접 문제만들어 풀기 (코드 공유에 올리기)

select * from employees;

-- employees 테이블에 emp_no : 1, first_name : kim, last_name : hong , birth_date : 2000-10-10, gender : M,  hire_date : 2022-03-04 를 추가해주세요
-- 추가후 employees에서 first_name 이 kim이라는 사람의 결과값을 추출 
INSERT INTO employees VALUES
(1, '2000-10-10', 'kim', 'hong', 'M', '2022-03-04');

select
	*
from
	employees
where
	first_name = 'kim';
	



