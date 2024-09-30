-- ★transction★은 데이터베이스에서 "한번에 수행되는 작업"의 단위이다.
-- 시작, 진행, 종료 단계를 거치게 되면서 만약 중간에 예기치 못한 값 또는 에러가 발생할 시 rollback(시작하기 이전 단계로 돌아감)을 진행한다.
-- MYSQL은 defalut 설정이 auto-commit(자동저장)이기 때문에 우리가 수행한 쿼리문을 돌릴 수 없다.
-- 따라서, transction 기능을 사용하기 위해서는 auto-commit을 해제 해야한다.

-- java 복습 : boolean 기본값은 false = 정수로는 0
-- 1은 true / 0은 false

-- autocommit 1은 활성화 시킨다.
set autocommit = off; -- off와 0을 주로 쓴다.

-- start transaction : 작성하면 이제 하나의 과정으로 인식을하고 commit, rollback 과정을 수행 할 수 있다.
-- start transaction 이후의 쿼리들은 보호를 받기 때문에, rollback을 만나게 되면 transaction 전으로 돌아간다.
start transaction;

select * from tbl_menu;

-- dml 삽입, 수정, 삭제 진행을 해보자.
insert into tbl_menu values(null, '해장국', 9000, 8, 'Y');
update tbl_menu set menu_name='선지해장국' where menu_code = 30;

-- 작성한 dml 구문이 에러나 이상한 값이 없다면 직접 commit을 해줘야 반영이 된다.
commit; -- 이걸 해주면 저장이 된다.

rollback; -- 이걸 해주면 이전으로 돌아간다.
