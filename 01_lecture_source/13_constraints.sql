-- constraints (제약조건) : 테이블에 데이터가 입력되거나 변경될 때 규칙을 정의한다.
-- "데이터의 무결성" - 이상한 데이터가 못들어옴.

-- not null

drop table if exists user_notnull;

create table if not exists user_notnull(
	user_no int not null,
    user_id varchar(3) not null,
    user_pass varchar(40) not null
)engine=innordb;


-- foreign key(외래키) : 참조(연관된) 다른 테이블에서 제공하는 값만 사용할 수 있음
-- foreign key 제약조건에 의해 테이블 간의 관계가 형성이 될 수 있다.
-- 부모테이블, 자식테이블

drop table if exists user_grade;
create table if not exists user_grade(
	grade_code int primary key,
    grade_name varchar(30) not null
)engine=innodb;

insert into user_grade values(1, '일반'), (2, '우수'), (3, '특별');

select * from user_grade;
 
drop table if exists user_fk;
create table if not exists user_fk(
	user_no int primary key,
    user_id varchar(30) not null,
    user_pw varchar(40) not null,
    user_name varchar(30) not null,
    gender varchar(3),
    phone varchar(30) not null,
    email varchar(50),
    grade_no int,
    foreign key (grade_no)
	references user_grade(grade_code)
)engine=innodb;

describe user_fk;

drop table if exists user_uniqe;
create table if not exists user_uniqe(
	user_no int primary key,
    user_id varchar(30) not null,
    user_pw varchar(40) not null,
    user_name varchar(30) not null,
    gender varchar(3),
    phone varchar(30) not null,
    email varchar(50)
)engine=innodb;

insert into user_uniqe
values(1, 'user1', 'pass1', '홍길동', '남', '010-5555-5666','sff@gmail.com'),
(2, 'user2', 'pass2', '홍길순', '여', '010-5555-5555', 'sdoff@gmail.com');

insert into user_fk
-- error 1062: 참조하고 있는 테이블(부모 테이블)에는 존재하지 않는 값을 집어넣을 때
-- 발생하는 에러 => foreign key 제약조건 위반
values(3, 'user3', 'pass3', '홍길숙', '여', '010-3333-5555', 'sdf@gmail.com', 5);


-- check 제약조건 : 조건을 위반할 시 허용하지 않는 제약조건

-- 술을 파는 사이트, 미성년자 입장불가, 성별은 2가지 값만 입력가능.
drop table if exists user_check;
create table if not exists user_check(
	user_no int auto_increment primary key,
    user_name varchar(30) not null,
    gender varchar(3) check(gender in('남','여')),
    age int	check (age >= 19)
)engine=innodb;

insert into user_check values(null, '홍길동', '남', 20), (null, '홍길순', '여', 17);

describe user_check;
select * from user_check;

-- default : 기본값. nullable한 컬럼에 비어있는 값 대신 우리가 설정한 기본값 적용이 가능하다.

drop table if exists tbl_country;
create table if not exists tbl_country(
	country_code int auto_increment primary key,
    country_name varchar(255) default '한국',
    population varchar(255) default '0명',
    add_time datetime default(current_time()),
    add_day date default(current_date())
)engine=innodb;

insert into tbl_country values(null, default, default, default, default);

select * from tbl_country;