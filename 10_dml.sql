-- 권장하는 방식
DESC tbl_menu;
INSERT
  INTO tbl_menu
(
  menu_code
, menu_name
, menu_price
, category_code
, orderable_status
)
VALUE
(
  NULL
, '바나나해장국'
, 8500
, 4
, 'Y'
);

SELECT * FROM tbl_menu ORDER BY 1 DESC; 

-- -----------------
-- update
UPDATE tbl_menu
   SET menu_name = '딸기해장국'
 WHERE menu_code = 22; 
 
-- ----------------------------------
-- INSERT INTO tbl_menu VALUES (17, '참기름소주', 5000, 10, 'Y'); -- 에러 발생
REPLACE INTO tbl_menu VALUES (17, '참기름소주', 5000, 10, 'Y');


SELECT
       menu_price
     , category_code
     , SUM(menu_price)
     , COUNT(menu_code)
  FROM tbl_menu
 GROUP BY menu_price, category_code
  WITH ROLLUP;