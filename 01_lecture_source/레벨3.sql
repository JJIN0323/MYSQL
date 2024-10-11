use chundb;

select * from tb_student;
select * from tb_class;
select * from tb_professor;
select * from tb_grade;
select * from tb_department;


-- 1. 학생이름과 주소지를 표시하시오. 단, 출력 헤더는 "학생 이름", "주소지"로 하고, 정렬은 이름으로 오름차순 표시하도록 한다.

select STUDENT_NAME as '학생 이름', STUDENT_ADDRESS as '주소지' from tb_student order by STUDENT_NAME asc;

-- 2. 휴학중인 학생들의 이름과 주민번호를 나이가 적은 순서로 화면에 출력하시오.

select STUDENT_NAME, STUDENT_SSN from tb_student where ABSENCE_YN like 'Y' order by STUDENT_SSN;

-- 3. 주소지가 강원도나 경기도인 학생들 중 2020년대 학번을 가진 학생들의 이름과 학번, 주소를 이름의 오름차순으로 화면에 출력하시오. 단, 출력헤더에는 "학생이름","학번", "거주지 주소" 가 출력되도록 한다.

select STUDENT_NAME as '이름', left(STUDENT_NO, 4) as '학번', STUDENT_ADDRESS as '거주지 주소' from tb_student where (STUDENT_ADDRESS like '강원도%' or STUDENT_ADDRESS like '경기도%') and ENTRANCE_DATE like '202%' order by STUDENT_NAME asc;

-- 4. 현재 법학과 교수 중 가장 나이가 많은 사람부터 이름을 확인할 수 있는 SQL 문장을 작성하시오. (법학과의 '학과코드'는 학과 테이블(TB_DEPARTMENT)을 조회해서 찾아 내도록 하자 / 005)

select PROFESSOR_NAME, PROFESSOR_SSN from tb_professor where DEPARTMENT_NO like '005' order by PROFESSOR_SSN asc;

-- 5. 2022년 2학기에 C3118100 과목을 수강한 학생들의 학점을 조회하려고 한다. 학점이 높은 학생부터 표시하고, 학점이 같으면 학번이 낮은 학생부터 표시하는 구문을 작성해보시오.

select STUDENT_NO, POINT from tb_grade where CLASS_NO like 'C3118100' order by POINT desc, STUDENT_NO asc;

-- 6. 학생 번호, 학생 이름, 학과 이름을 학생 이름으로 오름차순 정렬하여 출력하는 SQL 문을 작성하시오.

select STUDENT_NO, STUDENT_NAME from tb_student order by STUDENT_NAME;
