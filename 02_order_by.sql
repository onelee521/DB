-- 오름차순 정렬
SELECT 
		 menu_code
	  , menu_name
	  , menu_price
  FROM tbl_menu
-- ORDER BY menu_price ASC; ascending: 오름차순, desecding: 내림차순
 ORDER BY menu_price ; 
 
 -- 내림차순 정렬
 
 SELECT 
 		 menu_code
 	  , menu_name
 	  , menu_price
 	FROM tbl_menu
 ORDER BY menu_price DESC;
 
 -- 컬럼의 순번을 활용한 정렬(실제 칼럼의 순서가 아닌 조회할 때의 칼럼의 순서 기준)
 select
 		 menu_price -- 조회할 때 순번 1
 	  , menu_name -- 조회할 때 순번 2
 	FROM tbl_menu
 ORDER BY 1 ASC;
 
 -- 별칭을 활용한 정렬
 SELECT 
 		 menu_price AS 'mp'
 	  , menu_name AS 'mn' 
 	FROM tbl_menu
 ORDER BY mp DESC; -- 별칭으로 정렬할때는 별칭명에 single quatation(')을 붙이면 안된다.
 
 -- 컬럼의 복수개로 정렬
 SELECT 
 		 menu_price
 	  , menu_name
 	FROM tbl_menu
 ORDER BY 1 DESC, 2 ASC; -- 가격으로 내림차순 후 같은 가격일 시 메뉴이름을 오름차순으로 조회 
 
 
 -- --------------------
 
 -- field
 SELECT FIELD('a', 'b', 'z', 'a'); -- 2번째 이후 인자 중에 1번째 인자의 값이 위하는 값이 나옴(=3) 
 
 -- table에서 조회 시 field 활용
 SELECT -- result set(결과 값)
 		 FIELD(orderable_status, 'N', 'Y') -- 하브루타에 써야지
	  , orderable_status
	  , menu_name
	  , menu_code
	FROM tbl_menu;


-- field를 활용한 order by
SELECT
		 menu_name
	  , orderable_stastus
	FROM tbl_menu
 ORDER BY FIELD(orderable_status, 'N', 'Y') DESC;
	 

-- -------------------------------------
-- NULL 값에 대한 정렬
-- 1) 오름차순 시: null 값이 먼저 나옴
SELECT 
		 *
	FROM tbl_category
 ORDER BY ref_category_code ASC; -- -를 붙이면 null 빼고 뒤집힘
 
 -- 2) 내림차순 시: null값이 나중에 나옴
 SELECT 
		 *
	FROM tbl_category
 ORDER BY ref_category_code DESC;
 
 -- 3) 오름차순에서 null이 나중에 나오도록 바꿈
 -- -는 정렬을 뒤집어준다. null을 제외하고!
 SELECT 
		 *
	FROM tbl_category
 ORDER BY -ref_category_code DESC; -- desc를 통해 null을 나중에 보냄 -> -로 null이 아닌 값을 asc로 바꿈
 
 -- 4) 내림차순에서 null이 먼저 나오도록 바꿈
 SELECT 
		 *
	FROM tbl_category
 ORDER BY -ref_category_code ASC; -- asc를 통해 null을 나중에 보냄 -> -로 null이 아닌 값을 desc로 바꿈
 