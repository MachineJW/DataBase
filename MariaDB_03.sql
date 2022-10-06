/*USE 문*/
-- USE DB명;
USE training_db;

/*INSERT 삽입*/
-- INSERT INTO my_phone VALUE (NULL,'jiwoo','jiwoo','20769990','man',26);
-- 두 건 이상의 데이터 INSERT (가족 데이터 넣기)

-- INSERT INTO my_phone VALUE (NULL,'friend','hakjin','51336641','man',26);

-- INSERT INTO my_phone VALUE (NULL,'friend','jinwoo','20769990','man',26); -- 잘못된 데이터 일부러 넣기

/* INSERT INTO my_phone VALUE 
(NULL,'sister','jihyun','87771445','women',29)
,(NULL,'mother','mikyung','44400280','women',55)
,(NULL,'father','seokin','28809996','man',61); */

/*UPDATE 수정*/
-- UPDATE 테이블_이름 SET 열1=값1,열2=값2,.. WHERE 조건;
-- UPDATE my_phone SET phone_id = 'me' WHERE nick_name = 'jiwoo';
-- UPDATE에서 WHERE 절을 사용하지 않으면 모든 열이 바뀌어 버린다. 주의 할 것
/*DELETE 삭제*/
-- DELETE FROM 테이블이름 WHERE 조건;
DELETE FROM my_phone WHERE phone_id = 'jinwoo';



/*SELECT 조회*/
SELECT * FROM my_phone;
