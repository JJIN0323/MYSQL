-- use menudb;

-- groub by절
-- 결과 집합을 특정 열의 값에 따라 그룹화 하는것에 사용한다.

-- having 절은 group by절과 함께 사용이 되며, group에 대한 조건을 정의할 때 사용된다.

-- where 조건절 / having 조건절의 차이점
-- where 조건절의 경우 : 그룹화를 하기 전 개별 행에 대한 조건을 적용하는 것.
-- having 조건절의 경우 : 생성 된 그룹에 대한 조건을 적용하는 것.

-- 메뉴가 존재하는 카테고리 그룹 조회
-- 중복을 제거한것 처럼 보임. distinct 같음.
select category_code from tbl_menu group by category_code;

-- 위에서 만들어둔 카테고리 코드를 기준으로 포함된 행의 수를 조회.
-- count() 함수 : 행의 수를 몇개인지 조회.
select category_code as 'CTG CODE', count(*) as 'in the row' from tbl_menu group by category_code;

-- sum() : 합계를 조회해 준다.
-- 메뉴DB에서 CTG CODE를 기준으로 그룹화 한 후, 메뉴가격의 합계 조회.
select * from tbl_menu; -- 일단 메뉴에대한 모든것을 조회.
select category_code, sum(menu_price) as 'CTG CODE' from tbl_menu group by category_code;

-- avg() : 메뉴가격의 평균값을 조회
select category_code, round(avg(menu_price)) as 'CTG CODE' from tbl_menu group by category_code;

-- CTG CODE와 price가 같은 애들끼리만 묶임.
select menu_price, category_code from tbl_menu group by menu_price, category_code;

-- having 사용해보기 ( group by 와 avg, sum 등은 하나의 셋트)
-- 5번 CTG 부터 8번 CTG 까지의 메뉴 카테고리 번호 조회.
select category_code from tbl_menu group by category_code having category_code not between 5 and 8;

-- with rollup : 
select category_code, sum(menu_price) from tbl_menu group by category_code with rollup; -- 총 합계 조회.

-- 컬럼 2개를 이용해 같은 메뉴 가격별 총합 및 해당 메뉴 가격별 같은 카데고리 합계 조회.
-- rollup을 통해 먼저 나온 컬럼의 총합을 구하고 이후 나오는 컬럼의 총합도 구하는 방식이다.
select menu_price, category_code, sum(menu_price) from tbl_menu group by menu_price, category_code with rollup;