-- 실습 1
-- 게시글 별 좋아요 수를 출력하시오
-- 좋아요가 없는 게시글도 출력이 되어야함

select * from post;

select
	p.title,
	count(l.id) as 좋아요수
from post p
left join like_log l on l.post_id = p.id
group by p.id, p.title
having count(*);




select * from post;
select * from user;
select * from comment;
select id from user;

-- 실습 2
-- 사용자 별 작성 게시글 수, 게시글 하나도 작성안한 회원도 포힘
-- 닉네임, 작성글수

select
	u.nickname,
	p.title,
    count(*) as 게시글수 
from
	user u
left join post p on u.id = p.user_id
group by u.nickname, p.title
having count(*);


select * from user;
select * from post;

-- 실습 3
-- 사용자별 평균 게시글 조회수 (단 2개 이상인 사람만)
-- 닉네임 , 게시글수, 평균 조회수

-- 사용자별 최대 게시글 조회수 
-- 닉네임 , 게시글수, 최대 조회수를 나타내주세요

select
	u.nickname,
    count(p.id) as 게시글수,
    max(view_count) as 최대조회수
from
	user u
left join post p on u.id = p.user_id
group by u.id, u.nickname
having count(p.id);

select
	u.nickname,
    count(p.id) as 게시글수,
    avg(view_count) as 평균조회수
from user u
join post p on u.id = p.user_id
group by u.id , u.nickname
having count(p.id) >= 2;