/*TABLE 만들기*/

USE training_db;
CREATE TABLE my_phone (
	cnt_id INT AUTO_INCREMENT PRIMARY KEY,
	nick_name CHAR(20),
	phone_id CHAR(20),
	phone_num CHAR(10),
	sex_id CHAR(10),
	age INT);
DESC my_phone;
	
	
-- CREATE TABLE 테이블명 (컬럼명, 데이터 형식)
-- AUTO_INCREMENT는 자동 증가/ AUTO_INCREMENT로 지정한 열은 기본키로 지정해야함
	
	