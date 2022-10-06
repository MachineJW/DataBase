SHOW DATABASES; -- 현재 데이터 베이스 목록
DROP DATABASE training_db; -- 데이터 베이스 삭제
SHOW DATABASES; -- 다시 데이터 베이스 목록을 확인
CREATE DATABASE phone_db; -- phone 데이터베이스를 생성 하기지
SHOW DATABASES;

USE phone_db; -- USE문으로 데이터 베이스 선택

/* 기본키의 속성 */ 
-- 1. 테이블에 저장된 행을 식별할 수 있는 유일한 값이어야 한다.
-- 2. 값의 중복이 없어야 한다.
-- 3. NULL 값을 가질 수 없다.

CREATE TABLE contact 
( phone_num CHAR(20) NOT NULL PRIMARY KEY,
  member_id CHAR(20) NULL,
  name_id CHAR(20) NOT NULL,
  addr CHAR(10) NULL,
  email CHAR(30) NULL
); -- 연락처 테이블 생성

DESC contact; -- 연락처 테이블 생성 확인

DEFAULT CHARSET = utf8;

INSERT INTO contact VALUE
('01020769990', '자신', '홍지우', '경기','dieze4795@gmail.com'),
('01044400280', '가족','엄마','경기', NULL),
('01028809996', '가족','아버지','경기', NULL),
('01087771445', '가족','누나','경기', NULL),
('01041272480', '친구','광민','경기', NULL),
('01029267553', '친구','이준표','경기', NULL),
('01089306361', '친구','준현','경기', NULL),
('01051336641', '친구','학진','경기', NULL),
('01035993294', '친구','동운','경기', NULL);

SELECT * FROM contact; -- 테이블조회

CREATE TABLE history
( his_date DATETIME() NOT NULL PRIMARY KEY,
  FOREIGN KEY(phone_num) REFERENCES contact(phone_num),
  his_type CHAR(20) NOT NULL,
  con_type CHAR(20) NOT NULL,
); -- 연락기록 테이블 생성




