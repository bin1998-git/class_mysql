-- DCL(Data Control Language) - 권한을 관리한다

-- 사용자 생성 (사람, 시스템에게 줄 수 있다)
create user 'user1'@'localhost' identified by 'password123';

-- 조회 권한 부여
grant select on school.student to 'user1'@'localhost';

-- 권환 회수
revoke select on school.student FROM 'user1'@'localhost';


-- 도전 문제
-- 외부 사용자가 사용할 계정을 생성하고 조회 권한만 주고 접속 확인

CREATE USER 'user1'@'%' IDENTIFIED BY 'password123'; -- 모든 사용자 외부접속 허용
grant select on school.student to 'user1'@'%';

-- 1. 로컬 접속 계정과 별개로 외부 접속용 계정 모두 만들어줘야한다 ./ 필요없다면 로컬은 생성안해도됨
CREATE USER 'tenco'@'localhost' identified BY 'asd1234!';
CREATE USER 'tenco'@'%' identified BY 'asd1234!'; -- 모든 Ip 허용

-- 2. 모든 권한 부여(ALL PRIVILEGES)
-- *.* 모든 테이블 권한 부여
grant all privileges on school.* to 'tenco'@'localhost';
grant all privileges on school.* to 'tenco'@'%';

--  권한 확인 
show grants for 'tenco'@'localhost';
show grants for 'tenco'@'%';

-- 참고, 추가된 권한이 바로 적용 안될 수 있음
flush privileges; -- 바로적용 명령어 


-- 3. 권한 회수
revoke all privileges on *.* FROM 'tenco'@'localhost';
revoke all privileges on *.* FROM 'tenco'@'%';


