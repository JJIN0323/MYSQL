-- limit : 영문 번역 그대로 제한, 한계에 사용된다.
-- select 조회 결과에 반환할 행 갯수의 제한 등에 사용이 된다.

select * from tbl_menu;

select * from tbl_menu order by menu_name asc limit 5; -- 5는 반환받을 행의 수 지정

-- where -> order by -> limit 순서로 진행된다.
-- limit은 파라메터 2개까지 전달 가능

-- 위에 작성한 식은 반환받을 행의 수
-- [] 안에 작성하는 것은 생략이 가능하다~
-- limit[offset, ] row_count
-- offset : 시작할 행의 번호(인덱스 체계)
-- row_count : 이후 행부터 반환 받은 행의 갯수

select menu_code, menu_name, menu_price from tbl_menu order by menu_price desc limit 1, 4;
-- 2번째 행부터 5번째 행까지의 결과만 보고싶다. 0부터 시작함.



