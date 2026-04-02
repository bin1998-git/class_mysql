use employees;



desc employees;
desc salaries;
desc titles;
desc departments;
desc dept_emp;
desc dept_manager;


--   문제1  employees, salaries : 현재 유효한 연봉 기준으로 연봉이 높은 순서대로 출력하세요. 
select 
	e.first_name,
    e.last_name,
	e.emp_no,
	s.salary
from employees e
inner join salaries s on e.emp_no = s.emp_no
where s.to_date = '9999-01-01'
order by s.salary desc;

-- join후 where 필터를 사용할수 있음(사후 필터)

select * from titles;

-- 문제 2 현재 직원 목록
-- 사번, 이름(first_name), 성(last_name), 현재 직급(title), 현재 연봉(salary)을 한 화면에 보여주세요.
	
select
	e.emp_no,
    e.first_name,
    e.last_name,
    t.title,
    s.salary
from employees e
join titles t on e.emp_no = t.emp_no and t.to_date = '9999-01-01'
join salaries s on e.emp_no = s.emp_no and s.to_date = '9999-01-01';

-- JOIN 문법에서 ON절뒤에 AND를 붙여 조인 조건과 필터링을 한꺼번에 걸 수 있음
-- (사전 필터), 인라인 필터
-- 공식 명칭 : 조인 조건


select
	e.emp_no,
    e.first_name,
    e.last_name,
    t.title,
    s.salary
from employees e
join titles t on e.emp_no = t.emp_no 
join salaries s on e.emp_no = s.emp_no
where t.to_date = '9999-01-01'
	and s.to_date = '9999-01-01';
    
-- INNER JOIN에서는 사전 필터 결과 값과 사후 필터 결과 값 동일

select * from departments;
select * from dept_manager;
select * from employees;
-- 한 사원이 여러 부서의 관리자 될 수 있다(드물지만), 
-- 한 부서에는 시간의 흐름에 따라서 여러명의 사원이 거쳐 갈 수 있다
-- 문제 3
-- employees e, departments d
-- left join 사전 필터링 사용
select
	e.emp_no,
	e.first_name,
    d.dept_name,
    dm.from_date
from employees e
left join dept_manager dm on e.emp_no = dm.emp_no and dm.to_date = '9999-01-01'
inner join departments d on dm.dept_no = d.dept_no ;

-- 사후 필터로 수정

select
	e.emp_no,
	e.first_name,
	d.dept_name,
	dm.from_date
from employees e
left join dept_manager dm on e.emp_no = dm.emp_no inner join departments d on dm.dept_no = d.dept_no 
where dm.to_date = '9999-01-01';

-- 아우터 조인을 사용할 떄 (left join)사후 필터로 적용을 하게 되면 
-- left join의 의미가 없어지게 된다. 즉 inner join으로 사용한거와 같아지게 된다.
-- 실무에서 90 퍼센트 실수를 하는 부분이 된다.
-- 즉 아우터 필터를 적용할떄는 사후필터 x 사전필터로 사용해서 아우터 조인에 특성을 살린다

select *
FROM employees
WHERE gender = 'F'
  AND hire_date > '1991-01-01'
ORDER BY hire_date ASC;

select * from salaries;


SELECT
    e.emp_no,
    e.first_name,
    s.salary,
    t.title
FROM employees e
INNER JOIN titles   t ON e.emp_no = t.emp_no
INNER JOIN salaries s ON e.emp_no = s.emp_no
WHERE t.title       = 'Senior Engineer'
  AND e.first_name  LIKE 'Ram%'
  AND s.salary      >= 100000
  AND t.to_date     = '9999-01-01'
  AND s.to_date     = '9999-01-01';
  






select
	e.emp_no,
    e.last_name,
    s.to_date,
    t.title,
    s.to_date
from
	employees e
left join titles t on e.emp_no = t.emp_no
left join salaries s on e.emp_no = s.emp_no
where
	e.first_name = '%S' or
    t.title = 'Senior Engineer' or
    s.to_date = '1990-01-01';
    
    
select * from employees;
    
select
	*
from employees e
where
	gender = 'F' and
	birth_date  between '1960-01-01' and '1969-12-31';



select * from salaries;
    
select
	e.emp_no,
    e.first_name,
    s.salary
from employees e
inner join salaries s on e.emp_no = s.emp_no
where
	e.last_name like '%J'
	AND s.to_date = '9999-01-01';
    
select
	e.emp_no as 사원번호,
    e.gender as 성별,
    s.salary as  현재연봉
from employees e
join salaries s on e.emp_no = s.emp_no
where
	e.emp_no     <= 10020
    AND s.to_date = '9999-01-01'
    order by e.emp_no asc;
    
select
	e.emp_no,
    e.first_name,
    d.dept_name
FROM employees e
INNER JOIN dept_emp    de ON e.emp_no  = de.emp_no
INNER JOIN departments d  ON de.dept_no = d.dept_no
where
	de.to_date = '9999-01-01';
	
    