-- 메뉴테이블에서 민트미역국과 같은 카데고리 코드를가지고 있는 메뉴 조회
-- 민트미역국의 카테고리 코드
select category_code from tbl_menu where menu_name = '민트미역국';
select * from tbl_menu where category_code = 4;

-- 여러분이 반칙을 쓰지 않는 이상 1개의 쿼리문으로 절대 할 수 없다.

-- 위에까지는 왜 쓰는지 이유를 설명해주심.

-- subquery란?
-- main query에서 수행되는(다른 쿼리문에서 실행되는) 쿼리문이다.
-- 위 두가지의 쿼리문을 하나로 합침. = 아래 () 안이 subquery 문이다.
select * from tbl_menu where category_code = (select category_code from tbl_menu where menu_name = '민트미역국');

-- 가장 많은 메뉴가 포함된 카테고리 조회
-- 1. 서브쿼리 작성
select count(*) as 'CNT' from tbl_menu group by category_code;
-- 2. 메인쿼리 작성 
-- MAX() 함수 : 최대값 / MIN() 함수 최소값
-- from절에 사용하는 subquery는 (derived table : 파생 테이블)이고, 파생 테이블은 반드시 별칭을 가지고 있어야 한다.
select max(CNT) from (select count(*) as 'CNT' from tbl_menu group by category_code) as dt;

-- 상관 서브쿼리
-- 메인쿼리문이 서브쿼리의 결과에 영향을 주는 경우를 "상관 서브쿼리"라고 한다.
-- 카테고리 별 평균 가격보다 높은 메뉴를 조회.
select a.menu_code, a.menu_name, a.menu_price, a.category_code, a.orderable_status from tbl_menu a
where menu_price > (select round(avg(menu_price)) from tbl_menu where category_code = a.category_code);

-- CTE(Common Table Expression) : 파생 테이블과 비슷한 개념이며, 코드의 가독성과 재사용성을 위해 파생 테이블 대신 사용한다.
-- from★ 절에서만 사용이 된다. (join이면, join 구문에서도 사용이 가능)
-- with : 가상의 테이블(1회성)을 만든 후, select로 조회.
with menucte as (select menu_name, category_name from tbl_menu w join tbl_category j on w.category_code = j.category_code)
select * from menucte order by menu_name asc; -- 사용 가능!!
select * from menucte order by category_name asc; -- 사용불가 !!!

