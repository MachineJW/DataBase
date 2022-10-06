USE market_DB;

/*내부 조인*/

SELECT * -- SELET 열이름
FROM buy -- FROM 첫번째 테이블
	INNER JOIN member -- INNER JOIN 두번쨰 테이블
    ON buy.mem_id = member.mem_id -- ON 조인될 조건
  WHERE buy.mem_id = 'GRL';  -- WHERE 검색조건
  
-- 두개의 테이블을 조인할떄 동일한 열 이름이 존재 한다면 꼭 테이블.열 형식으로 표기하여한다.

-- 1. SELECT 모든 열 이름을 가져오곘다.
-- 2. FROM buy 테이블과
-- 3. JOIN member 테이블을 합치겠다.
-- 4. ON 열 이름 buy.mem_id 와 member.mem_id 가 같은 것끼리
-- 5. WHERE 이 떄 조건은  buy.mem_id 가 'GRL'인 것
  
SELECT * -- SELET 열이름
FROM buy -- FROM 첫번째 테이블
	INNER JOIN member -- INNER JOIN 두번쨰 테이블
    ON buy.mem_id = member.mem_id ; -- ON 조인될 조건
  
-- 1. SELECT 모든 열 이름을 가져오곘다.
-- 2. FROM buy 테이블과
-- 3. JOIN member 테이블을 합치겠다.
-- 4. ON 열 이름 buy.mem_id 와 member.mem_id 가 같은 것끼리

DESC member; -- 테이블 구조 확인
DESC buy; -- 테이블 구조확인

SELECT buy.mem_id, mem_name, prod_name, addr, CONCAT(phone1,phone2) '연락처' -- SELET 열이름
FROM buy -- FROM 첫번째 테이블
	INNER JOIN member -- INNER JOIN 두번쨰 테이블
    ON buy.mem_id = member.mem_id ; -- ON 조인될 조건
    
-- 두개의 테이블을 조인할떄 동일한 열 이름이 존재 한다면 꼭 테이블.열 형식으로 표기하여한다.
-- 1. SELECT 조회 할 것이다. mem_id, mem_name, prod_name, addr 열과 phone1,phone2를 묶어서 '연락처'라는 별칭으로...
-- 2. buy 테이블과 INNER JOIN으로 member 테이블을 묶을 것,
-- 3. ON buy.mem_id = member.mem_id 조건으로.

SELECT M.mem_id, M.mem_name, B.prod_name, M.addr -- SELET 열이름
FROM buy B -- FROM 첫번째 테이블
	INNER JOIN member M -- INNER JOIN 두번쨰 테이블
    ON B.mem_id = M.mem_id -- ON 조인될 조건
    ORDER BY M.mem_id; -- ORDER BY 오름차순 내림차순.....
    
-- 테이블의 별칭 사용

/*외부조인*/
SELECT M.mem_id, M.mem_name, B.prod_name, M.addr -- SELET 열이름
FROM member M -- FROM 첫번째 테이블
	LEFT OUTER JOIN buy B -- INNER JOIN 두번쨰 테이블
    ON B.mem_id = M.mem_id -- ON 조인될 조건
    ORDER BY M.mem_id; -- ORDER BY 오름차순 내림차순.....

SELECT * FROM buy;
SELECT * FROM member;

-- 1. SELECT로 M.mem_id, M.mem_name, B.prod_name, M.addr열을 조회 한다.
-- 2. member는 첫번 쨰 테이블이고 buy는 두번 째 테이블 인데 왼쪽의 buy테이블을 기준으로 조인한다.

SELECT M.mem_id, M.mem_name, B.prod_name, M.addr -- SELET 열이름
FROM buy B -- FROM 첫번째 테이블
	RIGHT OUTER JOIN member M -- INNER JOIN 두번쨰 테이블
    ON B.mem_id = M.mem_id -- ON 조인될 조건
    ORDER BY M.mem_id; -- ORDER BY 오름차순 내림차순.....
    
-- 1. SELECT로 M.mem_id, M.mem_name, B.prod_name, M.addr열을 조회 한다.
-- 2. buy는 첫번 쨰 테이블이고 member는 두번 째 테이블 인데 오른쪽의 buy테이블을 기준으로 조인한다.


/*기타조인*/

/*크로스 조인*/
-- 테스트용도로 많은 양의 데이터를 만들어 낼 때, 사용한다.
-- 내용적인 의미는 없다...
SELECT * FROM buy CROSS JOIN member;

/*자체 조인*/
-- 굉장히 어렵다...

-- 테이블 새로 만들고, 데이터 삽입
USE market_db;
CREATE TABLE emp_table (emp CHAR(4), manager CHAR(4), phone VARCHAR(8));

INSERT INTO emp_table VALUES('대표', NULL, '0000')
,('영업이사', '대표', '1111')
,('관리이사', '대표', '2222')
,('정보이사', '대표', '3333')
,('영업과장', '영업이사', '1111-1')
,('경리부장', '관리이사', '2222-1')
,('인사부장', '관리이사', '2222-2')
,('개발팀장', '정보이사', '3333-1')
,('개발주임', '정보이사', '3333-1-1');

-- 상황 : 경리 부장의 직속상관의 연락처를 알고 싶다...
SELECT A.emp "직원" , B.emp "직속상관", B.phone "직속상관연락처"
FROM emp_table A
	INNER JOIN emp_table B
	ON A.manager = B.emp
	WHERE A.emp = '경리부장';



