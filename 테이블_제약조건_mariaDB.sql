/*테이블의 제약 조건*/

-- 제약조건은 테이블을 견고하게 만들어준다.

/* 기본키(PK) */
-- 1. 데이터를 구분할 수 있는 식별자
-- 2. 중복이 허용될 수 없으며, NULL을 허용하지 않는다.
-- 3. 한 테이블 당 1개 만 가질 수 있다.

USE phone_db;
CREATE TABLE member
( mem_id CHAR(8) NOT NULL PRIMARY KEY, -- 열 선언 마지막에 PRIMARY KEY를 추가하면 기본키로 설정됨
  mem_name VARCHAR(10) NOT NULL,
  height TINYINT UNSIGNED NULL
);

DROP TABLE member;

CREATE TABLE member
( mem_id CHAR(8) NOT NULL,
  mem_name VARCHAR(10) NOT NULL,
  height TINYINT UNSIGNED NULL,
  PRIMARY KEY(mem_id) -- 컬럼 선언 뒤에 마지막에 기본키를 지정할 수도 있다.
);

-- 기본키 없이 설정 후에 ALTER문으로 테이블 제약조건을 변경하여 기본키 설정이 가능하다.
CREATE TABLE member
( mem_id CHAR(8) NOT NULL,
  mem_name VARCHAR(10) NOT NULL,
  height TINYINT UNSIGNED NULL
);

ALTER TABLE member
	ADD CONSTRAINT
	PRIMARY KEY(mem_id);

SHOW TABLES;
DESC member;


/*외래키 FK*/
-- 1. 테이블 사이의 관계를 연결해준다.
-- 2. 대부분 기본 키 - 외래키의 관계를 사용한다.
-- 3. 이떄 기본키가 있는 테이블을 기준 테이블이라고 부르고
-- 4. 외래키가 있는 테이블을 참조 테이블이라고 한다.
-- 5. 참조테이블이 참조하는 기준 테이블의 열은 반드시 기본키나, 고유키로 설정되어있어야 함.

-- 외래키를 생성하는 방법은 CRATE TABLE 끝에 FOREIGN KEY 문을 설정하는것이다.

CREATE TABLE buy
(num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
 mem_id CHAR(8) NOT NULL, -- 열이름은 기준 테이블의 열이름과 꼭 동일해야하는것은 아니다.
 prod_name CHAR(8) NOT NULL,
 FOREIGN KEY(mem_id) REFERENCES member(mem_id)
);

-- FOREIGN KEY(외래키, 열 이름 ) REFERENCES 기준테이블(참조 할 열이름)
SHOW TABLES;
DESC buy;

DROP TABLE buy;

-- 마찬가지로 테이블 설정후에 ALTER 문으로 외래키 제약 조건을 추가 할 수 있다.
CREATE TABLE buy
(num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
 mem_id CHAR(8) NOT NULL, -- 열이름은 기준 테이블의 열이름과 꼭 동일해야하는것은 아니다.
 prod_name CHAR(8) NOT NULL
);

ALTER TABLE buy
	ADD CONSTRAINT
	FOREIGN KEY(mem_id)
	REFERENCES member(mem_id);
	
SHOW TABLES;
DESC buy;

-- 기준테이블의 열 이름이 변경되는경우?

-- 1. 기본 키 - 외래 키로 맺어진 후에는 기준 테이블의 열 이름이 변경되지 않는다.
-- 2. 열이름이 변경된다면 참조 테이블의 테이터에 문제가 발생하기 떄문이다.
-- 3. 만약 외래키에 데이터가 없다면 기준 테이블의 열 이름은 변경 할 수있다.
-- 4. ON UPDATE CASCADE, ON DELETE CASCADE 문을 활용하면 기준테이블의 열이름이 수정되면 자동으로 바뀌거나 삭제된다.

ALTER TABLE buy
	ADD CONSTRAINT
	FOREIGN KEY(mem_id) REFERENCES member(mem_id)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
	
/*고유키 UK */
-- 1. 고유키 제약 조건은 중복되지 않는 유일한 값 을 입력해야 하는 조건이다.
-- 2. 고유키 제약 조건은 NULL 값을 허용한다.
-- 3. 고유키는 테이블에 여러개를 설정할 수 있다.

CREATE TABLE member
( mem_id CHAR(8) NOT NULL PRIMARY KEY
  mem_name VARCHAR(10) NOT NULL,
  height TINYINT UNSIGNED NULL
  email CHAR(8) NULL UNIQUE -- 열 선언 뒤에 유니크 키 설정.
);


/* 체크 제약 조건 */

-- 1. 데이터 입력 시에 특정 데이터만 입력되도록 하는 제약조건이다.
-- 2. 열의 정의 뒤에 체크(조건)을 추가해서 설정한다.

CREATE TABLE member
( mem_id CHAR(8) NOT NULL PRIMARY KEY
  mem_name VARCHAR(10) NOT NULL,
  height TINYINT UNSIGNED NULL CHECK(height<200)
  email CHAR(8) NULL UNIQUE
  phone_num CHAR(8) 
);