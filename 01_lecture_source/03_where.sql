-- where 절
-- 특정 조건에 일치하는 행(레코드)만 선택하는데 사용되며 다양한 조건으로 설정 할 수 있다.

-- tbl_menu 테이블에서 이름,가격,판매상태를 조회
-- 판매상태가 Y인 친구들만 조회한다.

select menu_name, menu_price, orderable_status from tbl_menu
where orderable_status = 'Y';

-- Q. tbl_menu 에서 이름, 가격, 판매상태를 조회하고
-- 메뉴 가격이 13000원인 메뉴만 조회를 한다.

select menu_name, menu_price, orderable_status from tbl_menu
where menu_price = 13000; -- int의 경우에는 '' 필요없음.

-- Q2. 메뉴테이블에서 코드, 이름, 판매상태를 조회하고
-- 단, 판매상태가 Y가 아닌 애들만 조회.
select menu_name, menu_price, orderable_status from tbl_menu
where orderable_status != 'Y';
-- where orderable_status <> 'Y'; 이것도 부정의 의미 != 과 같다.

-- Q3. 메뉴테이블에서 전체 컬럼을 조회하는데, 가격이 20000 초과인 컬럼만 조회
select * from tbl_menu
where menu_price > 20000;

-- Q4. 메뉴테이블에서 모든 컬럼을 조회하는데, 가격이 10000원 이상 - 20000 미만인것만 조회
select * from tbl_menu
-- where menu_price >= 10000 && menu_price < 20000;
where menu_price >= 10000 and menu_price < 20000;

-- and / or 연산자
-- where 절과 함께 사용하며 자바와 같다.

-- Q5. 메뉴테이블에서 모든 컬럼을 조회하는데, 단 판매상태가 Y "이거나" 카테고리코드가 10인 메뉴만 조회
-- 그리고 카테고리 코드로 오름차순 정렬
select * from tbl_menu
where orderable_status = 'Y' or category_code = '10' order by category_code asc;

-- Q6. 메뉴테이블에서 모든 컬럼을 조회하는데, 단 판매상태가 Y "이면서" 카테고리코드가 10인 메뉴만 조회
-- 그리고 카테고리 코드로 오름차순 정렬
select * from tbl_menu
where orderable_status = 'Y' and category_code = '10' order by category_code asc;

-- and 둘 중 하나라도 true 가 아니면 false 이다.
-- or 둘 중 하나라도 true 면 true 이다.

-- between : ~ 사이
-- between a and b
-- Q7. 메뉴테이블에서 모든 컬럼 조회 후,  메뉴 가격이 10000 ~ 20000원 사이 "인" 메뉴만 조회
select * from tbl_menu
where menu_price between 10000 and 20000;

-- Q8. 메뉴테이블에서 모든 컬럼 조회 후,  메뉴 가격이 10000 ~ 20000원 사이 "아닌" 메뉴만 조회
-- not between 은 부정 키워드! 다른곳에서도 사용가능
select * from tbl_menu
where menu_price not between 10000 and 20000;

-- like 연산자
-- 반드시 일치하는 행만 return '전체이름 포함해야함'!
-- %는 "일부 단어"만 포함하는것도 return
-- %의 위치에 따라 시작한거나, 끝나거나, 포함하는 식을 만들 수 있다.
-- 메뉴테이블에서 이름과 가격 조회를하는데, 메뉴 이름이 '마늘'을 포함하고 있는 메뉴만 조회
select menu_price, menu_name from tbl_menu
where menu_name like '%마늘%';

-- Q9. 메뉴테이블에서 전체 컬럼 조회, 가격이 5000원이 넘으면서 카테고리 코드가 10이면서 '갈치'를 포함하는 메뉴조회
select * from tbl_menu
where menu_price > 5000 and category_code = 10 and menu_name like '%갈치%';

-- in 연산자 활용
-- 메뉴테이블에서 이름, 카테고리를 조회하고 카테고리코드가 4,5,6인 애들만 조회

select menu_name,category_code from tbl_menu
where category_code in(4, 5, 6) order by category_code asc;
-- category_code = 4 or category_code = 5 or category_code = 6 과 같은 의미이다.

-- is Null : null 값을 가진 모든 데이터를 조회한다.
-- 카테고리테이블에 모든 데디터 조회를 하되, null 값을 포함한것은 제외
select ref_category_code from tbl_category
where not isnull(ref_category_code);