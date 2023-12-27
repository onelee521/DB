-- distint 중복제거
SELECT
 		 DISTINCT category_code
 	FROM tbl_menu;
 	
-- distinct 사용시에는 일반 컬럼을 사용할 수 없다.(distinct 의미가 무의미)
SELECT
 		 DISTINCT category_code
 	--	, menu_name
 	FROM tbl_menu;
 	
-- null 값을 포함한 컬럼의 distinct
SELECT
		 DISTINCT ref_category_code
	FROM tbl_category;
	
--  null을 나중으로 정렬해보자
SELECT
		 DISTINCT ref_category_code
	FROM tbl_category
	ORDER BY 1 DESC;
	
-- 기본 정렬의 개념(순번이나 별칭을 사용하지 않고는 정렬을  할 수 없다.)
-- -> syntax 에러 발생

SELECT
		 DISTINCT ref_category_code
	FROM tbl_category
	ORDER BY DISTINCT ref_category_code DESC; -- 에러
	
SELECT
		 DISTINCT ref_category_code AS 'rcc'
	FROM tbl_category
	ORDER BY rcc DESC;


-- -------------------------------
-- anti code 예시
-- 컬럼 두개 이상도 distinct로 묶을 수는 있지만 좋은 형태는 아님
-- group by절을 통해 중복 제거 하는 것이 좋음
SELECT
		 DISTINCT category_code, orderable_status
	FROM tbl_menu;	
