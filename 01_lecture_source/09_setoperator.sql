-- set은 두 개 이상의 select문 결과 집합을 결합하는데 사용한다.
-- 주의해야 할 점은 ★"결합하는 결과 집합의 컬럼이 일치"★해야 한다.

-- union 두 개 이상의 select문의 결과를 결합하여 중복된 레코드는 제거한 후, 반환을 해준다.

select * from tbl_menu where category_code = 10 union all -- 세미콜론이 없다.
select * from tbl_menu where menu_price < 9000; 

-- intersect : 두 쿼리문의 결과 중 공통되는 레코드만 반환하는 연산자.
-- 하지만, mysql에서는 제공하지 않는다.
-- mysql에서는 inner join 또는 in 연산자를 통해서 intersect를 대체할 수 있다.

select * from tbl_menu as tm 
inner join (select * from tbl_menu where menu_price < 9000) as vt 
on (tm.menu_code = vt.menu_code)
where tm.category_code = 10; -- inner join으로 교집합만 출력.

-- in을 이용한 intersect
select * from tbl_menu where category_code = 10 
and menu_code in (select menu_code from tbl_menu where menu_price < 9000);

-- MINUS 기능 : 첫 번째 select문의 결과에서 두 번째 select문의 결과가 포함된 레코드를 제외한 레코드를 반환하는 연산자.
-- 하지만, MYSQL에서는 MINUS를 지원하지 않는다.
-- left join을 이용해 구현 할 수 있다.
select * from tbl_menu tm left join (select * from tbl_menu where menu_price < 9000) lj on (tm.menu_code = lj.menu_code) where tm.category_code = 10 and lj.menu_code is null; 
