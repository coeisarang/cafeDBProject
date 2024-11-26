use 회사DB;

Select *
from Employee;

Select *
From Department;


--김창섭이 근무하는 부서의 이름은?(중첩질의)
Select DeptName
From Department
Where DeptNo =(
               Select Dno
               From Employee
			   Where EmpName='김창섭'
     );

--영업 부서에 근무하는 직원들의 이름과 직책은?(중첩질의)
Select EmpName, Title
From Employee
Where Dno =(
            Select DeptNo
            From Department
            Where DeptName='영업'
           );
-- +플러스 문제 영업 부서나 시획부서에 근무하는 직원들의 이름과 직책은?(중첩질의)
Select EmpName, Title
From Employee
Where Dno In(
            Select DeptNo
            From Department
            Where DeptName In('영업','기획')
           );

 -- 9층에 근무하는 직원들의 이름과 급여?(중첩질의)
 Select EmpName, Salary
 From Employee
 Where Dno=(
            Select DeptNo
			From Department
			Where Floor=9
			);
--과장인 직원들의 근무부서이름은?(중첩질의)

Select DeptName
From Department
Where DeptNo In (
           Select Dno
		   From Employee
		   Where Title= '과장'
		   );

--매니저가 없는 직원의 근무부서 이름은?(중첩질의)

 Select DeptName
 From Department
 Where DeptNo=(
            Select Dno
			From Employee
			Where Manager is NULL
			);

--기획부서에 근무하는 직원들의 이름과 급여는?(중첩질의)

 Select EmpName, Salary
 From Employee
 Where Dno=(
            Select DeptNo
			From Department
			Where DeptName='기획'
			);

--영업 또는 기획 부서에 근무하는 직원들의 이름과 직책은?(조인질의)

Select EmpName, Title
From Employee, Department
Where Employee.Dno= Department.DeptNo AND DeptName In ('기획','영업')

--박영권과 같은 부서에서 일하는 직원들의 이름은?

Select EmpName
From Employee
Where Dno=( 
           Select Dno
		   From Employee
		   Where EmpName = '박영권'
		   );

--박영권과 같은 직책인 직원들의 이름과 직책은?

Select EmpName, Title
From Employee
Where Title =(
        Select Title
		From Employee
		Where EmpName ='박영권'
		);

--직원들의 평균급여는?

Select AVG(Salary)
From Employee

--직원의 평균급여보다 많은 급여를 받는 직원들의 이름, 직책, 월급은? (중첩으로만!!)

Select EmpName, Title, Salary
From Employee
Where  Salary>(
       Select AVG(Salary)
       From Employee
		);

--이수민 직원의 직책과 근무부서 이름은?(조인질의)

Select Title, DeptName
From Employee, Department
Where Employee.Dno= Department.DeptNo AND EmpName='이수민'

--이수민 직원과 같은 부서에 근무하는 직원의 이름과 부서번호는?(중첩질의)

Select EmpName, Dno
From Employee
Where Dno =(
        Select Dno
		From Employee, Department
        Where Employee.Dno= Department.DeptNo AND EmpName='이수민'

		);
