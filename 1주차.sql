create database Compony;

use Compony;

create table Department(
 DeptNo int not null, 
 Deptname char(10),
 Floor int,
 primary key(DeptNo)
 );

Insert into Department Values(1,'����',8);
Insert into Department Values(2,'��ȹ',10);
Insert into Department Values(3,'����',9);

Select *
From Department;

create table Employee (
 EmpNo int not null,
 EmpName char(10),
 Title char (10),
 Dno int,
 Salary int,
 primary key(EmpNo)
);

insert into Employee values(2106, '��â��', '�븮',2,200000);
insert into Employee values(3426, '�ڿ���', '����',3,250000);
insert into Employee values(3011, '�̼���', '����',1,300000);
insert into Employee values(1003, '������', '�븮',1,200000);
insert into Employee values(3427, '����ö', '���',3,150000);

select *
From Employee;