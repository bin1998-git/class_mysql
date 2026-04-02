-- 좋아요가 2개 이상인 게시글만 조회하고 싶다
-- 좋아요 개수 --> like log 7개의 좋아요 저장되어 있음

select
	post_id, count(*) as 좋아요수
from like_log
group by
	post_id
having count(*) >= 2;

-- 예제 2
-- where 와 having은 역할이 달라서 한 쿼리에 함꼐 쓸 수 있습니다
-- 조회수 200이상 게시글 중 좋아요 2개 이상인 게시글만 출력
-- 닉네임 타이틀 좋아요수가 나와야함

select * from post;
select * from like_log;

select
	p.title,
	count(l.id) as 좋아요수
from post p
join like_log l on p.id = l.post_id
where p.view_count >= 120
group by p.id, p.title
having count(l.id) >= 2
order by 좋아요수  desc;

-- where 절 조회수 120 이상인 게시글만 먼저 추림
-- 남은 게시글로 group by 실행
-- having으로 좋아요 2개 이상 그룹만 출력 



