-- SELECT 절은 MySql 의 가장 기본적인 명령어로 특정 테이블에서 원하는 데이터를 조회할 수 있는 명령어이다.

select -- 조회해줘
	menu_name -- 무엇을?
from -- 어디서?
	tbl_menu; -- 여기에서
    
-- tbl_menu 테이블에서 메뉴 코드, 메뉴 카데고리코드, 메뉴 가격을 조회해줘

select -- 조회해줘
	menu_code, category_code, menu_price -- 메뉴 코드, 메뉴 카데고리코드, 메뉴 가격을 조회해줘
from
	tbl_menu; -- 여기에서
    
-- tbl_menu 에서 모든 컬럼 조회해줘
select * from tbl_menu;

-- mysql 자체도 내장된 함수가 존재한다.

-- 현재 시간 조회
select now();

-- concat()
select concat('홍', '길동');

-- 컬럼에 별칭을 지정 할 수 있다.
select concat('홍','길동') as 허균소설;

-- 별칭을 띄어쓰기가 포함된 문자열을 적용할 때는 ''를 사용해야 한다.
select concat('홍','길동') as '허균 소설 주인공';
