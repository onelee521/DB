SELECT menu_code, menu_name, menu_price FROM tbl_menu;

SELECT
		 menu_code
	  , menu_name
	  , menu_price
	FROM tbl_menu;
	
SELECT
		 category_code
	  , category_name
	FROM tbl_category;


SELECT
		 menu_name
	  , category_name 
	FROM tbl_menu a
	JOIN tbl_category b ON (a.category_code = b.category_code);
	
-- ------------------------
-- 별칭 달아보기
SELECT 7 + 3;
SELECT 10 * 2;
SELECT 7 + 3 AS '합', 10 * 2 '곱';

-- 특수기호가 들어간 별칭은 싱글쿼테이션이(')이 반드시 필요하다.
SELECT 7 + 3 합 입니다., 10 * 2 곱 입니다.;


-- ------------
-- 현재 시간 출력
SELECT NOW() AS '현재시간';

-- 들어온 재료를 다 이어붙임 select '유 관순'과 동일한 결과
SELECT CONCAT('유', ' ', '관순');