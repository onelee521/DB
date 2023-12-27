-- 조회의 6가지 절을 모두 사용한 예제
-- select: group by 절에서 group을 묶는 조건으로 활용한 컬럼만 조회
-- from: 테이블 또는 join을 활용한 result set을 작성한다.
-- where: from절의 각 행마다 적용될 조건을 작성한다.
-- group by: where 절까지 만족하는 행들에 대해 그룹이 될 컬럼을 작성한다.
-- having: 그룹졀로 적용할 조건을 group by에서 작성한 컬럼 또는 그룹 함수를 통해 조회한다.
-- order by: 제일 마지막에 해석 되며 select의 결과(result set)의 순법, 별칭, 컬럼명 등으로 오름차순 또는 내림차순 한다.

SELECT
		 category_code -- 그룹을 묶은 컬럼을 제외한 그룹 함수만 가능
	  , COUNT(*) -- 카테고리 종류의 개수(모든 행)
	  , COUNT(category_code) -- 컬럼의 null이 아닌 값을 출력(category_code가 null이 아닌 행만 갯수 출력)
	  , SUM(menu_price) -- 카테고리 별 메뉴 가격의 합
	  , AVG(menu_price) -- 카테고리 별 메뉴 가격의 평균
	FROM tbl_menu
  WHERE category_code IS NOT NULL
  GROUP BY category_code
 HAVING SUM(menu_price) >= 24000
  ORDER BY 2;

-- ----------------------------------------
-- 메뉴가 없는 카테고리까지 셀건지 구분해서 count 해보기
SELECT 
		 COUNT(*)
	  , COUNT(menu_name)
	FROM tbl_menu a
  RIGHT JOIN tbl_category b ON (a.category_code = b.category_code);
  
  
  
-- ---------------------------
-- 함수의 종류
--  단일 행 함수: 단일 행마다 적용되어 행의 갯수만 큼 결과가 나오는 경우(ex.NVL, IFNULL)
-- 그룹 함수: 그룹마다 적용되어 그룹의 갯수만큼 결과가 나오는 경우(ex. COUNT, SUM, AVG)
-- (단 GROUP BY절이 없는 조회는 그룹 함수의 결과가 단일행(행 하나)이다.)

-- ----------------------------
-- group by에서 두 개 이상의 컬럼으로 그룹형성 시

-- 앞의 컬럼을 기준으로 중간 합계가 나오게 된다.
SELECT
		 menu_price
	  , category_code
	  , SUM(menu_price)
	FROM tbl_menu
  GROUP BY menu_price, category_code
	WITH ROLLUP;
-- --------------------------
	
CREATE TABLE sales (
	CODE INT AUTO_INCREMENT, -- 자체적으로 번호 생성(번호 발생기)
	YEAR VARCHAR(4),
	MONTH VARCHAR(2),
	product VARCHAR(50),
	amount DECIMAL(10,2),
	PRIMARY KEY(code)
);

INSERT INTO sales(CODE, YEAR, MONTH, product, amount) VALUES
(NULL, '2023', LPAD('1', 2, '0'), 'Product A', 1000.00),
(NULL, '2023', LPAD('1', 2, '0'), 'Product B', 1500.00),
(NULL, '2023', LPAD('2', 2, '0'), 'Product A', 2000.00),
(NULL, '2023', LPAD('2', 2, '0'), 'Product B', 2500.00),
(NULL, '2023', LPAD('3', 2, '0'), 'Product A', 1200.00),
(NULL, '2024', LPAD('3', 2, '0'), 'Product B', 1700.00);

-- 연, 월, 상품명을 모두 하나의 그룹으로 묶어
-- 연, 월 중간 합계 및 전체 합계를 rollup 으로 구해보자. 
SELECT 
		 year
	  , month
	  , product
	  , SUM(amount) AS total_sales
	FROM sales
  GROUP BY YEAR, MONTH, product
  	WITH ROLLUP; 
  	
SELECT
		 a.category_code
	  , a.category_name
	FROM tbl_category a
	JOIN tbl_menu b ON (a.category_code = b.category_code) -- 중복 포함
  GROUP BY a.category_code, a.category_name -- 중복X
  ORDER BY 1;
  
SELECT
		 category_code
     , category_name
  FROM tbl_category a
 WHERE EXISTS(SELECT 1
                FROM tbl_menu b
                WHERE b.category_code = a.category_code);
 ORDER BY 1;

SELECT
		 category_code
     , category_name
  FROM tbl_category a
 WHERE EXISTS(SELECT 0
                FROM tbl_menu b
                WHERE b.category_code = a.category_code)
	 ORDER BY 1; 	