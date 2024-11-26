use ȸ��DB;

Select *
from Employee;

Select *
From Department;


--��â���� �ٹ��ϴ� �μ��� �̸���?(��ø����)
Select DeptName
From Department
Where DeptNo =(
               Select Dno
               From Employee
			   Where EmpName='��â��'
     );

--���� �μ��� �ٹ��ϴ� �������� �̸��� ��å��?(��ø����)
Select EmpName, Title
From Employee
Where Dno =(
            Select DeptNo
            From Department
            Where DeptName='����'
           );
-- +�÷��� ���� ���� �μ��� ��ȹ�μ��� �ٹ��ϴ� �������� �̸��� ��å��?(��ø����)
Select EmpName, Title
From Employee
Where Dno In(
            Select DeptNo
            From Department
            Where DeptName In('����','��ȹ')
           );

 -- 9���� �ٹ��ϴ� �������� �̸��� �޿�?(��ø����)
 Select EmpName, Salary
 From Employee
 Where Dno=(
            Select DeptNo
			From Department
			Where Floor=9
			);
--������ �������� �ٹ��μ��̸���?(��ø����)

Select DeptName
From Department
Where DeptNo In (
           Select Dno
		   From Employee
		   Where Title= '����'
		   );

--�Ŵ����� ���� ������ �ٹ��μ� �̸���?(��ø����)

 Select DeptName
 From Department
 Where DeptNo=(
            Select Dno
			From Employee
			Where Manager is NULL
			);

--��ȹ�μ��� �ٹ��ϴ� �������� �̸��� �޿���?(��ø����)

 Select EmpName, Salary
 From Employee
 Where Dno=(
            Select DeptNo
			From Department
			Where DeptName='��ȹ'
			);

--���� �Ǵ� ��ȹ �μ��� �ٹ��ϴ� �������� �̸��� ��å��?(��������)

Select EmpName, Title
From Employee, Department
Where Employee.Dno= Department.DeptNo AND DeptName In ('��ȹ','����')

--�ڿ��ǰ� ���� �μ����� ���ϴ� �������� �̸���?

Select EmpName
From Employee
Where Dno=( 
           Select Dno
		   From Employee
		   Where EmpName = '�ڿ���'
		   );

--�ڿ��ǰ� ���� ��å�� �������� �̸��� ��å��?

Select EmpName, Title
From Employee
Where Title =(
        Select Title
		From Employee
		Where EmpName ='�ڿ���'
		);

--�������� ��ձ޿���?

Select AVG(Salary)
From Employee

--������ ��ձ޿����� ���� �޿��� �޴� �������� �̸�, ��å, ������? (��ø���θ�!!)

Select EmpName, Title, Salary
From Employee
Where  Salary>(
       Select AVG(Salary)
       From Employee
		);

--�̼��� ������ ��å�� �ٹ��μ� �̸���?(��������)

Select Title, DeptName
From Employee, Department
Where Employee.Dno= Department.DeptNo AND EmpName='�̼���'

--�̼��� ������ ���� �μ��� �ٹ��ϴ� ������ �̸��� �μ���ȣ��?(��ø����)

Select EmpName, Dno
From Employee
Where Dno =(
        Select Dno
		From Employee, Department
        Where Employee.Dno= Department.DeptNo AND EmpName='�̼���'

		);
