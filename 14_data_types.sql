-- 명시적 형변환
SELECT AVG(menu_price) FROM tbl_menu;

-- 1) 숫자 -> 숫자
--  소수점에서 반올림해 정수까지 반환
SELECT CAST(AVG(menu_price) AS UNSIGNED INTEGER) AS '가격평균' FROM tbl_menu;
-- 소수점 이하 한자리까지 반환
SELECT CAST(AVG(menu_price) AS FLOAT) AS '가격평균' FROM tbl_menu;
-- 소수점 이라 12자리까지 변환
SELECT CAST(AVG(menu_price) AS DOUBLE AS ''가격평균 FROM tbl_menu;

-- 2) 문자 -> 숫자
-- 2023년12월 27일을 date형으로 변환

SELECT '1' + '2';    -- 각 문자가 정수로 변환됨
