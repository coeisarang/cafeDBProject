Select *
From Department;

Select *
From Employee;

Insert Into Department Values(4,'�ѹ�',7);

Insert Into Employee Values(5000,'��â��','���',4,2600000);
Insert Into Employee Values(5001,'������','�븮',3,2900000);
Insert Into Employee Values(5002,'����','����',1,3100000);
Insert Into Employee Values(5003,'�ھ���','����',2,3600000);
Insert Into Employee Values(5004,'�ڸ��','���',2,2600000);

--�޿��� 250���� �̻� 350���� ������ ������ �̸�, ��å, �޿��� �˻��Ͻÿ�

Select EmpName, Title, Salary
From Employee
Where Salary Between 2500000 And 3500000

--�������� �̸��� �������, �׸��� 10% �λ�� ������ �˻��Ͻÿ�

Select Empname, Salary, Salary*1.1 As NewSalary
From Employee;

Insert Into Employee Values (6000,'�ڼ���','���',null,2400000);

--�λ��ȣ�� �������� �ʾ� null���� ������ ��� ������ �˻��Ͻÿ�

Select *
From Employee
Where Dno is not null;

--��� ������ �޿��� �����?

Select AVG(Salary) As ��ձ޿�
From Employee

--�ִ�޿��� �ּұ޿���?

Select Max(Salary) As �ִ�޿�, Min(Salary) As �ּұ޿�
From Employee;

--ȸ���� ��å�� �� ���ΰ�?
Select Count(Distinct Title)
From Employee;

--����(��) ����

Delete
From Employee
Where Dno is null;

Select *
From Employee;

--��Ʃ����Ʈ(��)�� ����

Update Employee
Set Salary=Salary*0.9
Where Empname='������';

--�μ��� ��ձ޿��� �˻��Ͻÿ�

Select Dno, AVG(Salary) As '�μ��� ��ձ޿�'
From Employee
Group By Dno;

--�μ�(��ȣ)�� ��ձ޿��� 250���� �̻��� �μ�(��ȣ)�� �� ��� �޿���?

Select Dno, AVG(Salary)
From Employee
Group By Dno
Having AVG(Salary)>=2500000;

--�븮�� ������ ��� �� ���ΰ���?

Select Count(*)
From Employee
Where Title= '�븮';

--���� �Ǵ� �븮�� ������ ��� ����ΰ���?

Select Count(*)
From Employee
Where Title='����' OR Title= '�븮';

--��å�� �������� �˻��Ͻÿ�

Select Title, Count(*)
From Employee
Group By Title

--�μ��� �ִ�޿��� �ּұ޿��� ���Ͻÿ�.

Select Dno, Max(Salary) As �ִ�޿�, Min(Salary) As �ּұ޿�
From Employee
Group By Dno

--��å�� ��ձ޿��� ���Ͻÿ�

Select Title, AVG(Salary) As ��ձ޿�
From Employee
Group By Title

--��å�� ��ձ޿��� 300���� �̻��� ��å�� �� ���

Select Title, AVG(Salary) As ��ձ޿�
From Employee
Group By Title
Having AVG(Salary)>=3000000;



