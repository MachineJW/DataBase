/*서브쿼리*/
-- 쿼리문안에 쿼리문이 들어갈수 있다.

USE market_db;
SELECT mem_name, height FROM member
	WHERE height > (SELECT height FROM member WHERE mem_name = '에이핑크');
-- member라는 테이블의 mem_name과 height 컬럼에서을 조회한다. 조건은 member테이블의 height 컬럼에서 에이핑크의 컬럼 값 보다 큰 데이터를 가져온다.

/*ORDER BY*/
SELECT mem_id, mem_name, debut_date FROM member ORDER BY debut_date;
-- ORDER BY 절의 정렬 기본 디폴트는 ASC 내림차순이다.
-- SELECT FROM WHERE ORDER BY 이 순서는 지켜야한다. 하나의 문법이다. 차례를 지키지않으면 오류가 발생한다.

SELECT mem_id, mem_name, debut_date FROM member ORDER BY debut_date DESC;
-- DESC는 지정해주어야하는데 이것은 오름차순이다.

SELECT mem_id, mem_name, debut_date FROM member ORDER BY height DESC, debut_date ASC;
-- 2개의 컬럼명을 ORDER BY절로 지정할수 있다. 앞에나오는 height를 우선으로 정렬하고 만약 정렬이 동률이라면 뒤에 조건으로 정렬한다.alter

/*LIMIT*/
SELECT * FROM member LIMIT 3;
-- 앞에 3개의 데이터만 보겠다. 할때 LIMIT 절을 사용한다.

SELECT * FROM member LIMIT 3,2;
-- ,로 구분하면 3행부터 2번째 데이터를 조회한다.

SELECT mem_id, mem_name, debut_date FROM member ORDER BY debut_date LIMIT 3;
-- ORDER BY절과 혼용하여 사용할수 있다. 이때 순서는 꼭 지켜야한다. LIMIT절은 ORDER BY절 뒤에...

/*DISTINCT*/
SELECT DISTINCT addr FROM member;
-- 열 이름 앞에 DISTINCT를 쓰면 중복된 데이터를 1개만 남기고 제거한다.

/*GROUP BY*/
SELECT mem_id, SUM(amount) FROM buy GROUP BY mem_id;
-- mem_id를 하나의 그룹으로 묶어서 합계를 낸다.
-- SUM()은 집계함수
-- SUM(),AVG(),MIN(),MAX(),COUNT(),COUNT(DISTINCT) 등의 집계함수가 있다.
-- 이 함수들은 WHERE 절에서 쓸수 없다.

SELECT mem_id "회원 아이디", SUM(amount)"총 구매 금액" FROM buy GROUP BY mem_id;
-- 별칭을 써서 더 보기 좋게 만든다.

SELECT mem_id, SUM(price*amount) FROM buy GROUP BY mem_id;
-- 합계 함수를 이용해 총 이용 금액을 보여준다.

SELECT mem_id, AVG(amount) FROM buy GROUP BY mem_id;
-- AVG 함수를 사용하여 평균 구매량을 조회

SELECT COUNT(*) FROM member;
-- 갯수를 세는 함수는 COUNT 함수 이다.
-- ()에 컬럼명이 인수로 들어 갈떄는 NULL 값을 제외한 데이터의 갯수를 샌다.

/*HAVING*/
SELECT mem_id "회원 아이디", SUM(price*amount)"총 구매 금액" FROM buy GROUP BY mem_id HAVING SUM(price*amount) > 1000;
-- 집계함수는 WHERE 절에 사용할수 없다. 집계함수에 대한 조건을 사용할때는 HAVING 절을 사용한다. HAVING절은 GROUP BY 절 뒤에 나와야한다.
-- 순서를 꼭 지켜줘야한다.

SELECT mem_id "회원 아이디", SUM(price*amount)"총 구매 금액" FROM buy GROUP BY mem_id HAVING SUM(price*amount) > 1000 ORDER BY SUM(price*amount) DESC ;
-- ORDER BY 절은 GROUP BY절 뒤에 사용한다.
