DROP DATABASE phone_db;

CREATE DATABASE phone_db;

CREATE TABLE phone_number
( num CHAR(20) NOT NULL PRIMARY KEY,
  mem_name VARCHAR(20) NOT NULL,
  adress_num CHAR(3) NULL CHECK (adress_num IN (031,02,051,053,032,062,042,052,044,033,043,041,063,061,054,055,064)),
  relation CHAR(10) NULL CHECK (relation IN ('친구','가족','회사','지인','기타')) 
);

SHOW TABLES;
DESC phone_number;


CREATE TABLE records 
( mem_name VARCHAR(20) NOT NULL PRIMARY KEY,
  num CHAR(20) NOT NULL,
  type_value CHAR(10) NULL CHECK (type_value IN ('메세지','전화')),
  trans CHAR(10) NOT NULL CHECK (trans IN ('발신','수신')),
  FOREIGN KEY (num) REFERENCES phone_number(num)
);

SHOW TABLES;
DESC records;


INSERT INTO phone_number VALUES 
('어머니','0000000000','031','가족'),
('아버지','0000000000','031','가족'),
('누나','0000000000','031','가족'),
('동운','0000000000','031','친구'),
('학진','0000000000','031','친구'),
('준표','0000000000','02','친구'),
('차장님','0000000000','053','회사'),
('박성민','0000000000000','02','회사'),
('대표님','00000000000','02','회사');

SELECT * FROM phone_number;