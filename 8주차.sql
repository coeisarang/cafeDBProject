create database MyCompony;

use MyCompony;

create table Department (
        DeptNo int not null,
		DeptName char(10),
		floor int,
		primary key(DeptNo)
);

insert into Department values(1,'����',8);
insert into Department values(2,'��ȹ',10);
insert into Department values(3,'����',9);
insert into Department values(4,'�ѹ�',7);

select *
from Department;

create table Employee (
     EmpNo int not null,
	 EmpName char(10) unique,
	 Title char(10) default'���',
	 Manager int,
	 Salary int check (Salary<6000000),
	 Dno int check ( Dno in (1,2,3,4,5,6) )  default 1,
	 primary key(EmpNo),
	 foreign key (Manager) references Employee(EmpNo),
	 foreign key (Dno) references Department (DeptNo) on Delete Set Default on Update Cascade
);


insert into Employee values(4377,'�̼���','����',null,5000000,2);
insert into Employee values(3426,'�ڿ���','����',4377,5000000,1);
insert into Employee values(3011,'�̼���','����',4377,5000000,3);
insert into Employee values(1003,'������','����',4377,5000000,2);
insert into Employee values(2106,'��â��','�븮',1003,5000000,2);
insert into Employee values(1365,'����','���',3426,5000000,1);
insert into Employee values(3427,'����ö','���',3011,5000000,3);

select *
from Employee;


--1)���ο� ������ ���� ����(1000,'ȫ�浿', default,1003, 25000000, 2) �� �Է� �� Ȯ��

==> check(Saraly <6000000)�� ���� ������ �������� ����

insert into Employee values(1000,'ȫ�浿',default,1003,2500000,2);

--2) Employee�� Phone ��Ʃ����Ʈ�� �߰��Ͻÿ�.

alter table Employee add Phone char(20)

--2-1)�̼��� ������ ��ȭ��ȣ�� '010-123-4567'�� ����

Update Employee
Set Phone = '010-123-4567'
Where EmpName = '�̼���';

--2-2)ȫ�浿 ���� ���� ����

Delete 
from Employee
Where EmpName = 'ȫ�浿';

--3)���ο� ���� '��â��'�� ���� ������ �Է��Ͻÿ�.

insert into Employee values(5000,'��â��',default,3001,2000000,1,'010-103-4567');

--4) Department ���� 3�� �μ���ȣ�� 10���� �����ϰ� Ȯ��

update Department
set DeptNo = 10
Where DeptNo=3;

--5) Department ���� 2�� �μ���ȣ�� 6���� �����ϰ� Ȯ��

update Department
set DeptNo = 6
Where DeptNo=2;

--6) Department���� 3�� �μ������� �����Ͻÿ�.

Delete 
from Department
Where DeptNo = 3;

--7)Employee�� Phone ��Ʃ����Ʈ�� �����Ͻÿ�.(drop column)

alter table Employee drop column Phone;

--8) Department �����Ͻÿ�.

drop table Department;
drop table Employee;