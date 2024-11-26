create database ȸ��DB;

use ȸ��DB;

create table Department(
DeptNo int not null,
DeptName char(10),
Floor int,
primary key(DeptNo)
);

insert into Department values(1,'����',8);
insert into Department values(2,'��ȹ',10);
insert into Department values(3,'����',9);
insert into Department values(4,'�ѹ�',7);

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

insert into Employee values(4377,'�̼���','����',null,5000000,2);
insert into Employee values(1003,'������','����',4377,3000000,2);
insert into Employee values(2016,'��â��','�븮',1003,2500000,2);
insert into Employee values(3426,'�ڿ���','����',4377,3000000,1);
insert into Employee values(3011,'�̼���','����',4377,4000000,3);
insert into Employee values(3427,'����ö','���',3011,1500000,3);
insert into Employee values(1365,'����','���',3426,1500000,1);

Select *
From Employee
 
 --�̼��� ����� ��å�� �Ҽ� �μ���ȣ��?
 Select Title, Dno
 From Employee
 Where EmpName='�̼���'

 --�̾� ���� ���� ����� �̸�, ��å, �ҼӺμ���ȣ��?
 Select EmpName, Title, Dno
 From Employee
 Where EmpName LIKE '��%';

 -- �����̸鼭 1�� �μ��� �ƴ� ����� �̸��� ��å, �ҼӺμ���ȣ��?
 Select EmpName, Title, Dno
 From Employee
 Where Title='����' AND Dno <> 1

 --�޿��� 300���� �̻��̰� 450���� ������ ����� �̸�, ��å �޿���?
 Select EmpName, Title, Salary
 From Employee
 Where Salary Between 3000000 AND 4500000

 --�Ŵ����� ���� ����� �̸��� ��å��?

 Select EmpName, Title
 From Employee
 Where Manager is null

 --2�� �μ��� �ٹ��ϴ� ����� �̸�, �޿�, ��å�� �޿��� ������������ �˻��Ͻÿ�

 Select EmpName, Salary, Title
 From Employee
 Where Dno=2 
 Order By Salary DESC;

 --����̸� �� �����ټ����� ���� ���� �̸��� �������� �̸��� �˻��Ͻÿ�

 Select DeptName
 Where Employee
 Order By Title ASC;

 -- ��å�� ����� ���� 2�� �̻��� ��å�� �� ��å�� ������� �˻��Ͻÿ�

 Select Title, Count(Manager)
 From Employee
 Order By  Count(Manager)  

--��â���� �ٹ��ϴ� �μ���ȣ��?
Select Dno
From Employee
where EmpName='��â��'

--��â���� �ٹ��ϴ� �μ��̸���? 

Select DeptName
From Employee, Department
Where Employee.Dno= Department.DeptNo AND EmpName ='��â��';

--1�� �μ��� �ٹ��ϴ� �������� �̸���?

Select EmpName
From Employee
Where Dno=1;

--���� �μ��� �ٹ��ϴ� �������� �̸��� ��å��?

Select EmpName, Title
From Department, Employee
Where Department.DeptNo=Employee.Dno AND DeptName='����';

--��� ������ �̸��� �ٹ� �μ����� �˻��Ͻÿ�.
Select EmpName, DeptName
From Employee, Department
Where Employee.Dno=Department.DeptNo;



