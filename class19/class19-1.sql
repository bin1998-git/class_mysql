use sns;

-- group by 없이 전체 좋아요 갯수 출력
select count(*) as 전체좋아요수
from like_log;

select * from like_log;

-- 게시글 별 좋아요 수

select post_id, count(*) as 좋아요수
from like_log
group by post_id;

-- 그룹바이와 집계함수 모두 사용해보기
select
	post_id,
    count(*) as 좋아요수,
    min(created_at) as 첫번쨰좋아요,
    max(created_at) as 마지막좋아요
from like_log
group by post_id
order by 좋아요수 desc;

select * from post;

-- 그룹바이 사용시 안되는 쿼리

SELECT 
    user_id,title, COUNT(*)
FROM
    post
GROUP BY user_id;

-- title 컬럼을 넣는순간
-- (오늘 날씨가 정말 좋네요, 맛집 추천 받아요) 두개 데이터중 무엇을 출력해야 될지 판단 불가


-- 그룹바이 사용시 안되는 쿼리2
SELECT 
    id, COUNT(*)
FROM
    post
where count(*) >= 3
GROUP BY id;

-- 오류 발생: where 절에는 집계 함수를 사용할수 없습니다
-- 이유 : where절은 그룹이 만들어지기전에 실행이 됩니다.
-- 즉 아직 count 결과가 존재하지 않는 시점이라 사용이 불가능합니다.
--  group by 는 where을 사용 못한다
-- 대신 having 절을 사용해야 함


