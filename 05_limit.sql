-- 0, 1, 2, 3, 4 인덱스 출력
SELECT
		 *
	FROM tbl_menu
  LIMIT 0, 5; -- limit 시작인덱스, 조회할 행의 갯수
  
-- 6행부터 5개의 메뉴 행조회
SELECT
		 *
	FROM tbl_menu
  LIMIT 5, 5;
  
  
-- limit offset 생략
SELECT
		 *
	FROM tbl_menu
  LIMIT 5;
--   LIMIT 0, 5; -- 같은 표현

-- limit을 자주 쓰진 않지만 이루 TOP_N분석이나 paging 처리를 할 때 사용한다 