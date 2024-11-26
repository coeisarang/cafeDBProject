create database MyCompony;

use MyCompony;

create table Department (
        DeptNo int not null,
		DeptName char(10),
		floor int,
		primary key(DeptNo)
);

insert into Department values(1,'영업',8);
insert into Department values(2,'기획',10);
insert into Department values(3,'개발',9);
insert into Department values(4,'총무',7);

select *
from Department;

create table Employee (
     EmpNo int not null,
	 EmpName char(10) unique,
	 Title char(10) default'사원',
	 Manager int,
	 Salary int check (Salary<6000000),
	 Dno int check ( Dno in (1,2,3,4,5,6) )  default 1,
	 primary key(EmpNo),
	 foreign key (Manager) references Employee(EmpNo),
	 foreign key (Dno) references Department (DeptNo) on Delete Set Default on Update Cascade
);


insert into Employee values(4377,'이성래','사장',null,5000000,2);
insert into Employee values(3426,'박영권','과장',4377,5000000,1);
insert into Employee values(3011,'이수민','부장',4377,5000000,3);
insert into Employee values(1003,'조민희','과장',4377,5000000,2);
insert into Employee values(2106,'김창섭','대리',1003,5000000,2);
insert into Employee values(1365,'김상원','사원',3426,5000000,1);
insert into Employee values(3427,'최종철','사원',3011,5000000,3);

select *
from Employee;


--1)새로운 직원에 대한 정보(1000,'홍길동', default,1003, 25000000, 2) 를 입력 후 확인

==> check(Saraly <6000000)로 인해 도메인 제약조건 위반

insert into Employee values(1000,'홍길동',default,1003,2500000,2);

--2) Employee에 Phone 애튜리뷰트를 추가하시오.

alter table Employee add Phone char(20)

--2-1)이수민 직원의 전화번호를 '010-123-4567'로 수정

Update Employee
Set Phone = '010-123-4567'
Where EmpName = '이수민';

--2-2)홍길동 직원 정보 삭제

Delete 
from Employee
Where EmpName = '홍길동';

--3)새로운 직원 '김창섭'에 대한 정보를 입력하시오.

insert into Employee values(5000,'김창수',default,3001,2000000,1,'010-103-4567');

--4) Department 에서 3번 부서번호를 10으로 변경하고 확인

update Department
set DeptNo = 10
Where DeptNo=3;

--5) Department 에서 2번 부서번호를 6으로 변경하고 확인

update Department
set DeptNo = 6
Where DeptNo=2;

--6) Department에서 3번 부서정보를 삭제하시오.

Delete 
from Department
Where DeptNo = 3;

--7)Employee에 Phone 애튜리뷰트를 제거하시오.(drop column)

alter table Employee drop column Phone;

--8) Department 제거하시오.

drop table Department;
drop table Employee;