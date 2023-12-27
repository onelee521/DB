-- 1. 문자열 관련 함수
-- ascii(아스키 코드), char(숫자)
SELECT ASCII('a'), CHAR(97);

-- bit_lenght(문자열), char_length(문자열), lenght(문자열)
-- 영어, 숫자, 특수기호 제외 한문자 당 3바이트 할당
SELECT
		 BIT_LENGTH('한글')
	  , CHAR_LENGTH('한글')
	  , LENGTH('한글');

-- contcat(문자열1, 문자열2, ...), concat_ws(구분자, 문자열1, 문자열2)
SELECT CONCAT('nice', ' to', ' meet', ' you');
SELECT CONCAT_WS(' ', 'nice', 'to', 'meet', 'you');
SELECT CONCAT(CAST(menu_price AS CHAR), '원') FROM tbl_menu;

-- ELT(위치, 문자열1, 문자열2, ...), FIELD(찾을 문자열, 준자열1, 문자열2, ...),
-- FIND_IN_SET(찾을 문자열, 문자열 리스트), INSERT(기준 문자열, 부분 문자열),
-- LOCATE(부분 문자열, 기준 문자열)
SELECT
		 ELT(2, '축구', '야구', '농구')
	  , FIELD('축구', '야구', '농구', '축구')
	  , FIND_IN_SET('축구', '야구,농구,축구') -- 콤마 사이에 띄어쓰기X
	  , INSTR('축구농구야구', '농구')
	  , LOCATE('야구', '축구농구야구'); -- INSTR과 LOCATE는 서로 인자가 반대  

-- INSERT(기준 문자열, 위치, 해당 위치에서 지울 길이, 삽입할 문자열)
SELECT INSERT('나와라 피카츄!', 5, 3, '꼬부기'); -- 나와라 꼬부기!
SELECT INSERT('나와라 피카츄!', 5, 1, '꼬부기'); -- 나와라 꼬부기카츄!

-- LEFT(문자열, 길이), RIGHT(문자열, 길이)
SELECT LEFT('Hello World!'), RIGHT('Nice Shot!', 5);

-- UPPER(문자열), LOWER(문자열)
SELECT LOWER('Hello World!'), UPPER('Hello World!');

-- LPAD(문자열, 길이, 채울 문자열), RPAD(문자열, 길이, 채울 문자열)
SELECT LPAD('왼쪽', 10, '#'), RPAD('오른쪽', 10, '#');

-- LTRIM(문자열), RTRIM(문자열)
-- TRIM(문자열), TRIM(방향 자를_문자열 FROM 문자열)
SELECT LTRIM('           왼쪽'), RTRIM('오른쪽              '), '오른쪽      '
SELECT TRIM('    MySQL    '), TRIM(BOTH '@' FROM '@@@@MySQL@@@@');
SELECT TRIM('    MySQL    '), TRIM(LEADING '@' FROM '@@@@MySQL@@@@'); -- LRIM
SELECT TRIM('    MySQL    '), TRIM(TRAILING '@' FROM '@@@@MySQL@@@@'); -- RLIM

-- 2. 숫자 관련 함수

-- 3. 날짜 및 시간 관련 함수