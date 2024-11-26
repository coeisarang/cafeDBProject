create database 회사DB;

use 회사DB;

create table Department(
DeptNo int not null,
DeptName char(10),
Floor int,
primary key(DeptNo)
);

insert into Department values(1,'영업',8);
insert into Department values(2,'기획',10);
insert into Department values(3,'개발',9);
insert into Department values(4,'총무',7);

Select *
From Department

create table Employee(
EmpNo int not null,
EmpName char(10),
Title char(10),
Manager int,
Salary int,
Dno int,
primary key(EmpNo),
foreign key(Dno) references Department(DeptNo),
foreign key(Manager) references Employee(EmpNo)
);

insert into Employee values(4377,'이성래','사장',null,5000000,2);
insert into Employee values(1003,'조민희','과장',4377,3000000,2);
insert into Employee values(2016,'김창섭','대리',1003,2500000,2);
insert into Employee values(3426,'박영권','과장',4377,3000000,1);
insert into Employee values(3011,'이수민','부장',4377,4000000,3);
insert into Employee values(3427,'최종철','사원',3011,1500000,3);
insert into Employee values(1365,'김상원','사원',3426,1500000,1);

Select *
From Employee
 
 --이성래 사원의 직책과 소속 부서번호는?
 Select Title, Dno
 From Employee
 Where EmpName='이성래'

 --이씨 성을 가진 사원의 이름, 직책, 소속부서번호는?
 Select EmpName, Title, Dno
 From Employee
 Where EmpName LIKE '이%';

 -- 과장이면서 1번 부서가 아닌 사원의 이름과 직책, 소속부서번호는?
 Select EmpName, Title, Dno
 From Employee
 Where Title='과장' AND Dno <> 1

 --급여가 300만원 이상이고 450만원 이하인 사원의 이름, 직책 급여는?
 Select EmpName, Title, Salary
 From Employee
 Where Salary Between 3000000 AND 4500000

 --매니저가 없는 사원의 이름과 직책은?

 Select EmpName, Title
 From Employee
 Where Manager is null

 --2번 부서에 근무하는 사원의 이름, 급여, 직책을 급여의 내림차순으로 검색하시오

 Select EmpName, Salary, Title
 From Employee
 Where Dno=2 
 Order By Salary DESC;

 --사원이름 중 가나다순으로 가장 앞인 이름과 마지막인 이름을 검색하시오

 Select DeptName
 Where Employee
 Order By Title ASC;

 -- 직책별 사원의 수가 2명 이상인 직책과 그 직책의 사원수를 검색하시오

 Select Title, Count(Manager)
 From Employee
 Order By  Count(Manager)  

--김창섭이 근무하는 부서번호는?
Select Dno
From Employee
where EmpName='김창섭'

--김창섭이 근무하는 부서이름은? 

Select DeptName
From Employee, Department
Where Employee.Dno= Department.DeptNo AND EmpName ='김창섭';

--1번 부서에 근무하는 직원들의 이름은?

Select EmpName
From Employee
Where Dno=1;

--영업 부서에 근무하는 직원들의 이름과 직책은?

Select EmpName, Title
From Department, Employee
Where Department.DeptNo=Employee.Dno AND DeptName='영업';

--모든 직원의 이름과 근무 부서명을 검색하시오.
Select EmpName, DeptName
From Employee, Department
Where Employee.Dno=Department.DeptNo;



