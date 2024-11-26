create database Company;

use Company;

create table Department(
DeptNo int not null,
Deptname char (10),
Floor int,
primary key (DeptNo)
);

select *
From Department;

insert into Department values(1,'영업',8);
insert into Department values(2,'기획',10);
insert into Department values(3,'개발',9);

create table Employee (
EmpNo int not null,
Empname char (10),
Title char(10),
Dno int,
Salary int,
primary key (EmpNo),
foreign key(Dno) references Department(DeptNo)
);

insert into Employee Values(2106,'김창섭','대리',2,2000000);
insert into Employee Values(3426,'박영권','과장',3,2500000);
insert into Employee Values(3011,'이수민','부장',1,3000000);
insert into Employee Values(1003,'조민희','대리',1,2000000);
insert into Employee Values(3427,'최종철','사원',3,1500000);

Select *
From Employee;


--대리인 직원의 이름과 소속부서번호는?

Select Empname, Dno
From Employee
Where Title<>'대리';

--김창섭 직원의 모든 정보를 검색하시오

Select *
From Employee
Where Empname='김창섭';

-- 영업부서의 위치(Floor)는?

Select Floor
From Department
Where Deptname='영업';

--급여가 2500000 이상인 직원의 이름과 급여를 검색하시오

Select Empname, Salary
From Employee
Where Salary>= 2500000

--과장 또는 대리인 직원의 이름과 급여, 직책은?

Select Empname, Salary, Title
From Employee
where Title='과장' OR Title='대리';

--2번 부서가 아닌 직원의 이름과 직책, 소속부서번호는?

Select Empname, Title, EmpNo
From Employee
where Dno<>2

--급여가 2000000 이상 2500000 이하인 직원의 이름과 급여를 검색하시오

Select Empname, salary
From Employee
where 2000000<=Salary AND Salary<=2500000;

--김씨 성을 가진 직원의 이름과 소속부서번호는?

Select Empname,EmpNo
From Employee
where Empname Like '김%';

--1또는 3번 부서에 속하는 직원의 이름과 소속부서번호는?

Select Empname,EmpNo
From Employee
where Dno IN (1,3);

--모든 직원에 대하여 금여의 오름차순으로 이름과 급여를 검색하시오

Select Empname, Salary
From Employee
Order By Salary Asc;

--1번 부서에 근무하는 직원에 대하여 급여의 내림차순으로 이름과 급여를 검색하시오

Select Empname, Salary
From Employee 
where Dno=1
Order By Salary Desc ;
