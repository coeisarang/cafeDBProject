Select *
From Department;

Select *
From Employee;

Insert Into Department Values(4,'총무',7);

Insert Into Employee Values(5000,'김창수','사원',4,2600000);
Insert Into Employee Values(5001,'이정아','대리',3,2900000);
Insert Into Employee Values(5002,'배희선','과장',1,3100000);
Insert Into Employee Values(5003,'박아현','부장',2,3600000);
Insert Into Employee Values(5004,'박명수','사원',2,2600000);

--급여가 250만원 이상 350만원 이하인 직원의 이름, 직책, 급여를 검색하시오

Select EmpName, Title, Salary
From Employee
Where Salary Between 2500000 And 3500000

--직원들의 이름과 현재월급, 그리고 10% 인상된 월급을 검색하시오

Select Empname, Salary, Salary*1.1 As NewSalary
From Employee;

Insert Into Employee Values (6000,'박수정','사원',null,2400000);

--부사번호가 정해지지 않아 null값인 직원의 모든 정보를 검색하시오

Select *
From Employee
Where Dno is not null;

--모든 직원의 급여의 평균은?

Select AVG(Salary) As 평균급여
From Employee

--최대급여와 최소급여는?

Select Max(Salary) As 최대급여, Min(Salary) As 최소급여
From Employee;

--회사의 직책은 몇 개인가?
Select Count(Distinct Title)
From Employee;

--투플(행) 삭제

Delete
From Employee
Where Dno is null;

Select *
From Employee;

--애튜리뷰트(열)값 수정

Update Employee
Set Salary=Salary*0.9
Where Empname='조민희';

--부서별 평균급여를 검색하시오

Select Dno, AVG(Salary) As '부서별 평균급여'
From Employee
Group By Dno;

--부서(번호)별 평균급여가 250만원 이상인 부서(번호)와 그 평균 급여는?

Select Dno, AVG(Salary)
From Employee
Group By Dno
Having AVG(Salary)>=2500000;

--대리인 직원은 모두 몇 명인가요?

Select Count(*)
From Employee
Where Title= '대리';

--과장 또는 대리인 직원은 모두 몇명인가요?

Select Count(*)
From Employee
Where Title='과장' OR Title= '대리';

--직책별 직원수를 검색하시오

Select Title, Count(*)
From Employee
Group By Title

--부서별 최대급여와 최소급여를 구하시오.

Select Dno, Max(Salary) As 최대급여, Min(Salary) As 최소급여
From Employee
Group By Dno

--직책별 평균급여를 구하시오

Select Title, AVG(Salary) As 평균급여
From Employee
Group By Title

--직책별 평균급여가 300만원 이상인 직책과 그 평균

Select Title, AVG(Salary) As 평균급여
From Employee
Group By Title
Having AVG(Salary)>=3000000;



