use shop;

-- 1페이지에 5번 보여줌
select * from product order by id limit 5 offset 0;

-- 2페이지에 6부터 5번 보여줌
-- 1페이지당 5건 / 3페이지면 10번 11 ~ 15 / 4페이지면 15번 16~20
select * from product order by id limit 5 offset 5;


select * from category;
select * from product;

select * from product order by id limit 



