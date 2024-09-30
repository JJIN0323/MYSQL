-- distinct : 중복 값 제외
-- 중복된 값을 제거하는 것에 사용된다.
-- 컬럼에 있는 걸럼 값들의 종류를 쉽게 파악 할 수 있다.

select category_code from tbl_menu order by category_code asc;

-- 데이터 통계 낼 때 많이 쓰임.
-- 삭제한게 아니고, 묶어둔것이라서 걱정 안해도됨.

-- 단일 열(컬럼) 중복 제거(사실은 묶어둔것)
select distinct category_code from tbl_menu; 

-- 다중 열(컬럼) distinct 사용
-- 다중열의 값들이 "모두 동일하면" 중복된 것으로 판단한다.
select distinct category_code, orderable_status from tbl_menu order by category_code asc;
-- 완벽하게 두가지의 조건이 아니면, 완벽하게 일치하는것만 묶어준다.
select distinct category_code, orderable_status from tbl_menu order by category_code asc;