USE shop;

select * from member;
desc member;

CREATE TABLE member_address (
    id        INT          PRIMARY KEY AUTO_INCREMENT,
    address   VARCHAR(200) NOT NULL,
    member_id bigint          UNIQUE,    -- UNIQUE = 1:1 설정
    FOREIGN KEY (member_id) REFERENCES member(id)
);

INSERT INTO member_address (address, member_id) VALUES
('서울시 강남구 역삼동', 1),
('부산시 해운대구', 2);

select * from member_address;





