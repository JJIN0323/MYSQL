use employee;

select * from employee;

-- 1.부서코드가 노옹철 사원과 같은 소속의 직원 명단 조회

select EMP_NAME from employee where DEPT_CODE like 'D9';

-- 2.전 직원의 평균 급여보다 많은 급여를 받고 있는 직원의 사번, 이름, 직급코드, 급여를 조회하세요

select e.EMP_ID, e.EMP_NAME, e.JOB_CODE from employee e where SALARY > (select round(avg(SALARY)) from employee);


-- 3.노옹철 사원의 급여보다 많이 받는 직원의 사번, 이름, 부서, 직급, 급여를 조회하세요

select EMP_ID, EMP_NAME, JOB_CODE, SALARY from employee where SALARY > '3700000';

-- 4.가장 적은 급여를 받는 직원의 사번, 이름, 직급, 부서, 급여, 입사일을 조회하세요 (MIN)
-- 서브쿼리는 SELECT, FROM, WHERE, HAVING, ORDER BY절에도 사용할 수 있다.

select e.EMP_ID, e.EMP_NAME, e.JOB_CODE, e.SALARY, e.HIRE_DATE from employee e where SALARY = (select min(SALARY) from employee);

-- 5.부서별 최고 급여를 받는 직원의 이름, 직급, 부서, 급여 조회
-- 힌트 : where 절에 subquery

select e.EMP_NAME, e.JOB_CODE, e.DEPT_CODE, e.SALARY from employee e where DEPT_CODE in (select (max(SALARY)) from employee);

-- 여기서부터 난이도 극상

-- 6.관리자에 해당하는 직원에 대한 정보와 관리자가 아닌 직원의 
-- 정보를 추출하여 조회
-- 사번, 이름, 부서명, 직급, '관리자' AS 구분 / '직원' AS 구분
-- 힌트 : is not null, union(혹은 then, else), distinct

-- 7.자기 직급의 평균 급여를 받고 있는 직원의
-- 사번, 이름, 직급코드, 급여를 조회하세요
-- 단, 급여와 급여 평균은 만원단위로 계산하세요
-- 힌트 : round(컬럼명, -5)

-- 8.퇴사한 여직원과 같은 부서, 같은 직급에 해당하는
-- 사원의 이름, 직급, 부서, 입사일을 조회


-- 9.급여 평균 3위 안에 드는 부서의 
-- 부서 코드와 부서명, 평균급여를 조회하세요
-- limit 사용


-- 10.직원 정보에서 급여를 가장 많이 받는 순으로 이름, 급여, 순위 조회
-- 힌트 : DENSE_RANK() OVER or RANK() OVER


-- 11.부서별 급여 합계가 전체 급여의 총 합의 20%보다 많은
-- 부서의 부서명과, 부서별 급여 합계 조회
-- 힌트 : SUM(E2.SALARY) * 0.2