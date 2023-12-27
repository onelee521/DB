-- autocommit 비활성화
SET autocommit = 0;

START TRANSACTION ; -- 없으면 업뎃3번 인설트 3번하고 롤백했을 때 인설트 부분이 다 롤백?

INSERT
  INTO tbl_menu
VALUES 
(
  NULL, '바나나해장국', 8500
, 4, 'Y'
);

UPDATE tbl_menu
   SET menu_name = '수정된 메뉴1'
 WHERE menu_code = 5; 
 
UPDATE tbl_menu
   SET menu_name = '수정된 메뉴2'
 WHERE menu_code = 6;
 
SELECT * FROM tbl_menu; -- 조회된 데이터는 실제 DB에 적용된 것이 X

COMMIT;

ROLLBACK; 

SELECT * FROM tbl_menu; -- rollback 또는 commit 이후 select한 것이 실제 DB에 적용된 값