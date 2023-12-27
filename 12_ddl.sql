-- 테이블 생성
CREATE TABLE IF NOT EXISTS tb1(
   pk INT PRIMARY  KEY, -- PRIMARY KEY 설정하면 자동으로 not null
   fk INT,
   col1 VARCHAR(255)
   CHECK(col1 IN ('Y', 'N'))
) ENGINE = INNODB;

DESC tb1;

INSERT
  INTO tb1
VALUES
(
  1, 1, 'Y'
);

-- --------------------------------------
-- auto_increment 알아서 숫자 생성
-- 테이블 생성
CREATE TABLE IF NOT EXISTS tb2(
   pk INT PRIMARY  KEY auto_increment, 
   fk INT,
   col1 VARCHAR(255)
   CHECK(col1 IN ('Y', 'N'))
) ENGINE = INNODB;

DESC tb2;

INSERT
  INTO tb2
VALUES
(
  null, 1, 'Y'
);

SELECT * from tb2;

-- -----------------------------
-- alter
-- 컬럼 추가
ALTER TABLE tb2 ADD col2 INT NOT NULL;
DESC tb2;

-- 컬럼 삭제
ALTER TABLE tb2 DROP COLUMN col2;
DESC tb2;

-- 컬럼 이름 및 컬럼 정의 변경
ALTER TABLE tb2
CHANGE COLUMN fk change_fk INT NOT NULL;

DESC tb2;
SELECT * FROM tb2;

-- 제약조건 제거
ALTER TABLE tb2 DROP PRIMARY KEY; -- 오류발생

-- auto_increment 제거
ALTER TABLE tb2
MODIFY pk INT;

DESCRIBE tb2;

-- 다시 primary key제거
ALTER TABLE tb2 DROP PRIMARY KEY; 

-- ----------------------------------
-- truncate
-- tb6 테이블 생성
CREATE TABLE if NOT EXISTS tb6(
   pk INT AUTO_INCREMENT PRIMARY KEY,
	fk INT,
	col1 VARCHAR(255),
	CHECK(col1 IN ('Y', 'N'))
) ENGINE = INNODB;

-- 4개의 행 insert
INSERT 
  INTO tb6 
VALUES 
 (NULL, 10, 'Y'),
 (NULL, 20, 'Y'),
 (NULL, 30, 'Y'),
 (NULL, 40, 'Y');

-- 제대로 insert 되었는지 확임
SELECT * FROM tb6;

-- 테이블 초기화 하기
-- TRUNCATE TABLE tb6; 
TRUNCATE tb6; -- table 키워드 생략 가능ㅇ