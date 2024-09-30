-- DML (Data Manipulation Language)의 약자
-- Manipulation : 조작
-- 테이블의 값을 삽입, 수정, 삭제하는 SQL의 한 부분을 의미한다.

-- 삽입(insert) : 새로운 행을 추가하는 구문이다. 즉, 테이블의 행의 수가 증가한다.

insert into tbl_menu values (null, '카페라떼', 3100, 4, 'Y'); -- 제약조건이 걸려있음
insert into tbl_menu values (null, '바나나해장국', 8500, 8, 'Y');

-- not null 제약조건이 붙은 컬럼은 반드시 값을 넣어줘야 한다.
-- insert into tbl_menu values (null, '츄로스라떼', null, 8, 'Y'); null값은 안됨.

-- 테이블에 대한 컬럼 설명
describe tbl_menu;

-- dml 동작 확인용 select 구문
select * from tbl_menu;

-- 컬럼을 명시하게 된다면, insert시 데이터 입력 순서를 바꿔도 상관없다.
-- 컬럼을 명시하지 않는다면, 꼭 순서를 유지 시켜줘야 한다.
insert into tbl_menu (orderable_status, menu_name, menu_price, category_code, menu_code)
values('Y', '우동', 3000, 8, null);

insert into tbl_menu (orderable_status, menu_name, menu_price, category_code)
values('Y', '비빔밥', 8000, 8); -- null이 허용되는 컬럼은 auto_increment가 적용된 컬럼은 알아서 추가해준다.

-- Multi row 추가
insert into tbl_menu values (null, '마카롱', 2100, 12, 'Y'), (null, '당고', 2100, 12, 'Y'), (null, '씨앗호떡', 3100, 12, 'Y');

select * from tbl_menu;

-- UPDATE : 테이블에 기록된 컬럼들의 값을 수정하는 구문이다.
-- 테이블의 행 갯수에 영향을 미치지 않는다.
select category_code from tbl_menu where menu_name="마카롱";

update tbl_menu set category_code = 7 where menu_code = 23;

select * from tbl_menu;
-- subquery를 사용해서 update
-- 주의사항 : update/delete시에 자기 자신의 테이블 데이터를 사용하게되면 1093 error 발생

-- Q1. 메뉴의 이름이 마카롱인 메뉴의 카테고리코드를 6으로 수정
--     where 조건절에 '마카롱' 사용하면 안되고, 메뉴 코드를 통해서 추론하기

select category_code from tbl_menu where menu_code = 26;
-- update tbl_menu set category_code = 6 where menu_code = 26;
-- 문제 발생
-- update tbl_menu set category_code = 6 where menu_code = (select menu_code from tbl_menu where menu_name = '마카롱');
-- 문제 해결 : 가상의 테이블에는 무조건 별칭을 붙여줘야한다.
update tbl_menu set category_code = 6 where menu_code = (select mcr.menu_code from (select menu_code from tbl_menu where menu_name = '마카롱') mcr );
select * from tbl_menu;

-- delete : 테이블의 행을 삭제하는 구문, 테이블의 행의 갯수가 줄어든다.
-- limit을 사용해서 delete를 쓴다.
delete from tbl_menu order by menu_name limit 2;
-- where을 사용해서 삭제에 대한 조건을 걸자
delete from tbl_menu where menu_name = '바나나해장국';

delete from tbl_menu;


-- replace : insert시 primary key 또는 >>> unique key가 충돌이 발생한다면,
-- replace를 통해 중복 된 데이터를 덮어쓸 수 있다.alter
insert into tbl_menu values(null, '소주', 6000, 10, 'Y');
replace into tbl_menu values('23', '처음처럼', 7000, 10, 'Y');
select * from tbl_menu;