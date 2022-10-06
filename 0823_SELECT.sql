/*USE 문 : 데이터베이스 (스키마) 를 사용하겠다.*/
-- 한 서버에 데이터 베이스가 여러개 있을수 있기 때문에 지정을 해주어야 한다. 그렇지 않으면 조회문을 입력할때마다 DB명을 입력해주어야함...
USE market_db; 

/*기본중에 기본... SELECT 열이름 FROM 테이블*/
SELECT * FROM member;
-- "*"은 모든열을 의미. member테이블의 모든 열을 가져오겠다.
-- USE 문으로 데이터베이스를 선택하지 않았다면 DB명.테이블명으로 조회해야 가능하다.
SELECT * FROM market_db.member;

/*더 나아가서 WHERE */
SELECT * FROM member WHERE mem_name = '오마이걸';
-- WHERE 이후에 열(컬럼) 조건문으로 해당하는 행(로우)=데이터를 조회
SELECT * FROM member WHERE height >= 160;
-- 조건 연산 사용가능.. 단 같다의 의미는 '==' 가 아닌 '='만 사용가능하다.
SELECT * FROM member WHERE addr = '서울' AND height > 160 ;
-- AND 연산과 OR 연산 사용 가능.

SELECT addr, debut_date, mem_name FROM member;
-- 특정열을 조회한다. 이 떄 여러개의 열(컬럼)을 조회할때에는 ,로 구분하여 여러개를 불러올수 있다.
SELECT addr 주소, debut_date "데뷔 날짜", mem_name FROM member;
-- 열(컬럼) 이름 끝에 별칭을 붙여 준다. 이 때 별칭에 '띄어쓰기'가 있을때에는 ""로 묶는다.


/*~사이에 있는 데이터를 조회할땐 , BETWEEN~AND */
SELECT * FROM member WHERE height > 160 AND height < 170;
SELECT * FROM member WHERE height BETWEEN 160 AND 170;
-- 두 SQL문은 동일한 쿼리.

/*여러개의 문자형 데이터를 조회할땐 IN */
SELECT * FROM member WHERE addr = '경기' OR addr = '서울' ;
SELECT * FROM member WHERE addr IN('경기','서울');
-- 두 SQL문은 동일한 쿼리.

/*문자열의 일부 글자를 검색하려면.... LIKE*/
SELECT * FROM member WHERE mem_name LIKE '우%' ;
-- %는 무엇이든지 허용.
SELECT * FROM member WHERE mem_name LIKE '_주_녀' ;
-- 한 글자 씩 매치할떈 _를 사용.

/*서브쿼리*/
SELECT mem_name, height FROM member WHERE height > (SELECT height FROM member WHERE mem_name = '에이핑크');
-- 에이핑크의 평균 키 보다 높은 걸그룹을 조회함..
-- 이를 서브쿼리 또는 하위쿼리라고 함.