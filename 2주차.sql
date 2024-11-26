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

insert into Department values(1,'����',8);
insert into Department values(2,'��ȹ',10);
insert into Department values(3,'����',9);

create table Employee (
EmpNo int not null,
Empname char (10),
Title char(10),
Dno int,
Salary int,
primary key (EmpNo),
foreign key(Dno) references Department(DeptNo)
);

insert into Employee Values(2106,'��â��','�븮',2,2000000);
insert into Employee Values(3426,'�ڿ���','����',3,2500000);
insert into Employee Values(3011,'�̼���','����',1,3000000);
insert into Employee Values(1003,'������','�븮',1,2000000);
insert into Employee Values(3427,'����ö','���',3,1500000);

Select *
From Employee;


--�븮�� ������ �̸��� �ҼӺμ���ȣ��?

Select Empname, Dno
From Employee
Where Title<>'�븮';

--��â�� ������ ��� ������ �˻��Ͻÿ�

Select *
From Employee
Where Empname='��â��';

-- �����μ��� ��ġ(Floor)��?

Select Floor
From Department
Where Deptname='����';

--�޿��� 2500000 �̻��� ������ �̸��� �޿��� �˻��Ͻÿ�

Select Empname, Salary
From Employee
Where Salary>= 2500000

--���� �Ǵ� �븮�� ������ �̸��� �޿�, ��å��?

Select Empname, Salary, Title
From Employee
where Title='����' OR Title='�븮';

--2�� �μ��� �ƴ� ������ �̸��� ��å, �ҼӺμ���ȣ��?

Select Empname, Title, EmpNo
From Employee
where Dno<>2

--�޿��� 2000000 �̻� 2500000 ������ ������ �̸��� �޿��� �˻��Ͻÿ�

Select Empname, salary
From Employee
where 2000000<=Salary AND Salary<=2500000;

--�达 ���� ���� ������ �̸��� �ҼӺμ���ȣ��?

Select Empname,EmpNo
From Employee
where Empname Like '��%';

--1�Ǵ� 3�� �μ��� ���ϴ� ������ �̸��� �ҼӺμ���ȣ��?

Select Empname,EmpNo
From Employee
where Dno IN (1,3);

--��� ������ ���Ͽ� �ݿ��� ������������ �̸��� �޿��� �˻��Ͻÿ�

Select Empname, Salary
From Employee
Order By Salary Asc;

--1�� �μ��� �ٹ��ϴ� ������ ���Ͽ� �޿��� ������������ �̸��� �޿��� �˻��Ͻÿ�

Select Empname, Salary
From Employee 
where Dno=1
Order By Salary Desc ;
