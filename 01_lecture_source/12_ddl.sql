-- DDL (Data Definition Language)
-- 데이터를 정의하는 언어
-- 데이터베이스의 스키마(Schema)를 정의하거나 수정하는데 사용되는 SQL의 부분이다.

-- CREATE : 테이블을 생성하기 위한 구문
-- IF NOT EXISTS : 만약 존재하지 않는다면-
-- 위에 구문을 적용하면 기존에 존재하는 테이블이 있더라도 에러가 발생하지 않는다.

-- 표현식 : 테이블의 칼럼 설정 표현식 ( [] 대괄호는 생략가능)
-- COLUMN_NAME ▶ DATA_TYPE(LENGTH) ▶  [NOT NULL, DEFAULT VALUE, AUTO_INCREMENT : 제약조건] COLUMN_CONSTRAINT;

-- tb_one 테이블 생성
create table if not exists tb_one (pk int primary key, fk int, col_one varchar(255), check(col_one IN ('Y', 'N'))) engine=InnoDB;
-- engin=innodb : 해당하는 테이블을 innodb라는 스토레지 엔진으로 만든다는 의미를 가지고 있다.
-- MYSQL에서 가장 많이 사용하는 엔진으로서, 데이터의 무결성, 안전성, 동시성 제어를 하는 것에 적합하다.

describe tb_two;

-- 만든 테이블에 값 insert 테스트
-- pk 컬럼은 null을 허용하지 않음.
-- insert into tb_one values(null, 10, 'O');
-- col_one 컬럼은 Y / N 외에 값은 허용하지 않음
-- insert into tb_one values(1, null, 'O');
insert into tb_one values(2, null, 'N');

select * from tb_one;

-- tb_two 생성
create table if not exists tb_two (pk int auto_increment primary key, fk int, col_one varchar(255), check(col_one IN ('Y', 'N'))) engine=InnoDB;

drop table tb_two;

-- auto_increment
-- insert시에 pk라고 하는 컬럼에 자동으로 번호를 발생시킨며, 중복되지 않는 값을 발생시킨다.

insert into tb_two values (null, 10, 'Y');
insert into tb_two values (null, 20, 'Y');

select * from tb_two;

-- alter : 테이블에 추가/변경/수정/삭제하는 모든 것을 alter 명령어를 사용해서 적용할 수 있다.

alter table tb_two
add col_two int not null;

-- 컬럼 삭제
alter table tb_two
drop column col_two;

-- 이름 변경 및 데이터 타입 변경
-- change
alter table tb_two
change column fk change_fk int not null;

describe tb_two; 

-- 열의 조건 삭제 (EXTRA가 비어있어야 삭제 가능)
alter table tb_two
drop primary key;

-- auto_increment가 있는 컬럼은 primary key가 삭제 불가능, auto_increment는 modify로 바꾼다.
alter table tb_two
modify column pk int;

create table if not exists tb_three (pk int auto_increment primary key, fk int, col_one varchar(255), check(col_one IN ('Y', 'N'))) engine=InnoDB;

-- 존재한다면 삭제 시킨다. (안전하게)
drop table if exists tb_three;

create table if not exists tb_four (pk int auto_increment primary key, fk int, col_one varchar(255), check(col_one IN ('Y', 'N'))) engine=InnoDB;
create table if not exists tb_five (pk int auto_increment primary key, fk int, col_one varchar(255), check(col_one IN ('Y', 'N'))) engine=InnoDB;

drop table if exists tb_four, tb_five;

-- truncate : 행별로 하나씩 삭제하는 것이 아닌, 그냥 테이블을 통째로 날려버리고 다시 만들어줌.

create table if not exists tb_six (pk int auto_increment primary key, fk int, col_one varchar(255), check(col_one IN ('Y', 'N'))) engine=InnoDB;

-- 초기화 확인용 더미데이터
insert into tb_six values(null, 1, 'Y');
insert into tb_six values(null, 2, 'Y');
insert into tb_six values(null, 3, 'Y');

select * from tb_six;

-- 테이블 초기화
truncate table tb_six;

-- truncate가 데이터를 수정하는 dml은 아니고, table을 drop하고 create를 하기 때문에 schema를 변경한것이다.

create table if not exists tb_seven (pk int auto_increment primary key, fk int, col_one varchar(255), check(col_one IN ('Y', 'N'))) engine=InnoDB;
