--  oderable_status = 'N'인 행들 조회하기
-- 주문 불가능한 메뉴 조회(메뉴명, 메뉴코드)
SELECT
		 menu_name
	  , menu_code
--	  , orderable_status
	FROM tbl_menu
  WHERE orderable_status = 'N';
 
-- DESC를 통한 컬럼명 빠르게 확인 
DESC tbl_menu;

-- ----------------
-- '기타' 카테고리에 해당하지 않는 메뉴를 조회하시오.
-- 1) '기타' 카테고리의 번호 파악하기
SELECT * FROM tbl_category;
SELECT * FROM tbl_category WHERE category_name = '기타';

-- 2) 해당번호를 가지지 않는 메뉴조회
SELECT * FROM tbl_menu WHERE category_code != 10;
SELECT * FROM tbl_menu WHERE category_code <> 10;


-- --------------------
-- 10,000원 이상의 메뉴 조회
SELECT 
		 * 
	FROM tbl_menu 
  WHERE menu_price >= 10000;
  
-- 10,000원 미만의 메뉴 조회
SELECT 
		 * 
	FROM tbl_menu 
  WHERE menu_price < 10000;
  
-- 10,000원 이상  12,000원 이하 메뉴 조회
SELECT 
		 * 
	FROM tbl_menu 
  WHERE menu_price >= 10000 
    AND menu_price <= 12000;
    

-- -------------------------------
-- and와 or 결과 비교
SELECT
		 menu_code
	  , menu_name
	  , menu_price
	  , category_code
	  , orderable_status
	FROM tbl_menu
  WHERE menu_price > 5000
  AND category_code= 10;
  
SELECT
		 menu_code
	  , menu_name
	  , menu_price
	  , category_code
	  , orderable_status
	FROM tbl_menu
  WHERE menu_price > 5000
  OR category_code= 10;
  
-- -------------------------------
-- between 연산자 활용(이상, 이하만 가능)
-- 가격이 5000원 이상 9000원 이하 메누 전체 컬럼 조회

SELECT
		 *
	FROM tbl_menu
  WHERE menu_price >= 5000
    AND menu_price <= 9000;
    
SELECT
		 *
	FROM tbl_menu
  WHERE menu_price BETWEEN 5000 AND 9000;
  

-- 초과 미만 테스트
SELECT
		 *
	FROM tbl_menu
  WHERE menu_price < 5000
     OR menu_price > 9000;
    
SELECT
		 *
	FROM tbl_menu
  -- WHERE NOT menu_price BETWEEN 5000 AND 9000;
  WHERE menu_price NOT BETWEEN 5000 AND 9000; -- NOT의 위치는 상관 없음 
  
-- ------------------------------
-- LIKE
-- 메뉴 중에 밥이 들어간 메뉴 조회
SELECT
		 *
	FROM tbl_menu
  WHERE menu_name LIKE '%밥%';
  
-- 메뉴 중에 밥이 들어가지 않는 메뉴 조회  
SELECT
		 *
	FROM tbl_menu
  -- WHERE menu_name NOT LIKE '%밥%';
  WHERE NOT menu_name LIKE '%밥%'; -- NOT 위치 상관 ㅌ

-- -----------------------------
-- in연산자

-- or을 활용한 '중식', '커피', '기타' 카테고리의 메뉴 조회
SELECT
		 *
	FROM tbl_menu
  WHERE category_code = 5
     OR category_code = 8
     OR category_code = 10;
     
-- in연산자 활용
SELECT
		 *
	FROM tbl_menu
  WHERE category_code IN (5, 8, 10);


-- -----------------------------
-- is null 연산자 활용

-- ref_category_code(상위 카테고리 번호)가 없는 카테고리 조회
SELECT
		 *
	FROM tbl_category
  WHERE ref_category_code IS NULL;

-- ref_category_code(상위 카테고리 번호)가 있는  카테고리 조회
SELECT
		 *
	FROM tbl_category
  WHERE ref_category_code IS NOT NULL;
  
SELECT
		 *
	FROM tbl_category
  WHERE NOT ref_category_code IS NULL;
  
SELECT 
        menu_name
      , category_code
   FROM tbl_menu
  WHERE menu_name IN ('민트미역국', '생마늘샐러드', '한우딸기국밥')
  ORDER BY menu_name;
  
SELECT
		 *
	FROM tbl_menu;
	
-- SELECT 
--         menu_name
--       , category_code
--    FROM tbl_menu
--   WHERE category_code IN (4, 5, 6)
--   ORDER BY category_code;