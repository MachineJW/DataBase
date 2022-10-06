/* INSERT,DELETE,UPDATE */
-- 데이터 변경을 위한 SQL 문

USE market_db;
CREATE TABLE hongong1 (toy_id INT, toy_name CHAR(4),age INT);
-- 연습용 테이블을 만듬 
INSERT INTO hongong1 VALUES (1, '우디', 25);
SELECT * FROM hongong1;
-- INSERT INTO 테이블명(컬럼명, 컬럼명) VALUES (컬럼에 넣을 데이터, 컬럼에 넣을 데이터);

INSERT INTO hongong1 (toy_id, toy_name) VALUES ( 2, '버즈' );
-- 열이름을 지정해주어서 넣는다. 이떄 VALUES절에 들어가는 데이터 순서는 INTO절에서 지정했던 열 이름 순서로 넣는다.
-- 차례를 바꿔도 좋지만 데이터를 넣을떈 순서를 맞추어 준다.
SELECT * FROM hongong1;

/*자동생성 AUTO_INCREMENT */
CREATE TABLE hongong2 (toy_id INT AUTO_INCREMENT PRIMARY KEY, toy_name CHAR(40),age INT);
-- 자동생성 되는 AUTO_INCREMENT는 널이 허용되지않는, 반드시 들어가야하는 기본키로 지정해줘야한다.

INSERT INTO hongong2 (toy_name,age) VALUE ('지우',26);
SELECT * FROM hongong2;
INSERT INTO hongong2 (toy_name,age) VALUE ('리눅스',26);
SELECT * FROM hongong2 ORDER BY toy_id ASC;
INSERT INTO hongong2 (toy_name,age) VALUE ('마리아',29);
SELECT * FROM hongong2 ORDER BY toy_id ASC;

SELECT LAST_INSERT_ID();
-- 자동증가의 마지막 값 조회...

/*ALTER TABLE*/
-- 테이블을 변경할떄 사용한다.

ALTER TABLE hongong2 AUTO_INCREMENT=100;
-- 자동증가를 100부터 시작하도록 변경하였다.

INSERT INTO hongong2 VALUE (NULL, '재남', 35);
SELECT * FROM hongong2 ORDER BY toy_id DESC;
SET @@auto_increment_increment=3; 
-- 증가 값을 3으로 지정
-- '@@변수명'은 mysql에서 자체적으로 가지고 있는 시스템 변수이다.
-- SELECT @@시스템변수명을 입력하면 설정 값을 알 수 있다.
-- 전체 시스템 변수의 종류를 알고 싶다면 SHOW GROBAL VARIABLES 명령어를 실행한다.

/*INSERT INTO ~ SLECT*/
CREATE TABLE city_popul (city_name CHAR(35),popualtion INT);

INSERT INTO city_popul
	SELECT NAME , city_name FROM member.mem_name;

/*UPDATE ~ SET ~ WHERE*/
USE market_db;
-- mysql 워크벤치에서 UPDATE와 DELETE를 허용하도록 설정해준다.

UPDATE hongong2 SET toy_name = '홍지우' WHERE toy_name = '지우';
-- update 테이블명 set 열이름 = 바꿀데이터 where 열이름에서 '지우'인 것을
UPDATE hongong2 SET toy_name = '지우홍' WHERE toy_name = '홍지우';
SELECT * FROM hongong2;

/*DELECTE FROM WHERE*/
-- DELETE FROM 테이블명 WHERE 조건;

DELETE FROM city_popul WHERE city_name;
SELECT * FROM city_popul;