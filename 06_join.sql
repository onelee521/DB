SELECT
		 *
	FROM tbl_menu
	JOIN tbl_category ON tbl_menu.category_code = tbl_category.category_code;
-- ---------------------	
SELECT
		 *
	FROM tbl_menu;
	
SELECT
		*
	FROM tbl_category;
	
-- 메뉴명과 카테고리명만 조회
SELECT
		 menu_name
	  , category_name
	FROM tbl_menu
	JOIN tbl_category ON (tbl_menu.category_code = tbl_menu.category_code);
	

-- 테이블도 별칭(alias)을 붙일 수 있다.
SELECT
		 menu_name
	  , category_name
	FROM tbl_menu a
	JOIN tbl_category b ON (a.category_code = b.category_code);
	
-- 두 테이블에 같은 칼럼명이 있는 상태에서 조인 시 주의할 점
SELECT
		 menu_name
	  , category_name
	FROM tbl_menu a
	JOIN tbl_category b ON (category_code = category_code);
	
-- 두 테이블이 동일한 컬럼일 시 별칭 필수	
SELECT
		 menu_name
	  , category_name
	FROM tbl_menu a
	JOIN tbl_category b ON (a.category_code = b.category_code);
	

SELECT
		 menu_name
	  , category_name
	  , a.category_code
	FROM tbl_menu a
	JOIN tbl_category b ON (a.category_code = b.category_code);	
	

-- 관례상 join시에는 쿼리에 사용되는 모든 컬럼에 별칭을 다는 것을 원칙으로 한다.
SELECT
		 a.menu_name
	  , b.category_name
	  , a.category_code
	FROM tbl_menu a
	JOIN tbl_category b ON (a.category_code = b.category_code)
	WHERE b.category = 8;
-- a, b, c 순으로 별칭을 달면 우선순위를 알 수 있어서 좋음
	
	
	
	
	
	
-- ---------------------------------------
-- 1) inner join: on 또는 using 뒤에 오는 join의 조건을 만족하여 매핑되는 결과들만 join 됨

SELECT
		 *
	FROM tbl_menu a
	JOIN tbl_category b ON (a.category_code = b.category_code)
	WHERE b.category_code = 7; -- 조회 결과 x (7번 카테고리 퓨전은 존재하지만 join에는 존재x)

-- 2) left join: join 키워드 기준 왼쪽 테이블의 행이 모두 나오도록 join
UPDATE tbl_menu
   SET category_code = NULL 
 WHERE menu_code = 1;
 
 DESC tbl_menu;
 
 
 
 
 
 
 
 
 SELECT
       a.menu_name
     , b.category_name
  FROM tbl_menu a
  LEFT JOIN tbl_category b ON a.category_code = b.category_code;

-- 3) right join: join 키워드 기준 오른쪽 테이블의 행이 모두 나오도록 join
SELECT
       a.menu_name
     , b.category_name
  FROM tbl_menu a
  RIGHT JOIN tbl_category b ON a.category_code = b.category_code;

-- 4) cross join
SELECT
		 *
	FROM tbl_menu a
	JOIN tbl_category b ON (1 = 1); -- 모든 경우의 수를 곱한 값이 나옴 

SELECT
		 *
	FROM tbl_menu a
	CROSS JOIN tbl_category b;

-- 5) self join
-- 하나의 테이블에 상위 개념과 하위개념이 모두 들어가 있을 때
-- 자기자신의 테이블을 join하게 되는 경우에 사용
-- (ex 신입사원 vs 사수(선배사원)
-- 하위 카테고리 vs 상위 카테고리,
-- 댓글 vs 대댓글 등)
SELECT
		 *
	FROM tbl_category;
	
-- 왜 같은 테이블은 조인하지?	
SELECT
		 a.category_name
	  , b.category_name
	FROM tbl_category a
	JOIN tbl_category b ON (a.category_code = b.ref_category_code);
-- a가 자식 b가 부모	

