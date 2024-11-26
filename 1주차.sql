create database Compony;

use Compony;

create table Department(
 DeptNo int not null, 
 Deptname char(10),
 Floor int,
 primary key(DeptNo)
 );

Insert into Department Values(1,'¿µ¾÷',8);
Insert into Department Values(2,'±âÈ¹',10);
Insert into Department Values(3,'°³¹ß',9);

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

insert into Employee values(2106, '±èÃ¢¼·', '´ë¸®',2,200000);
insert into Employee values(3426, '¹Ú¿µ±Ç', '°úÀå',3,250000);
insert into Employee values(3011, 'ÀÌ¼ö¹Î', 'ºÎÀå',1,300000);
insert into Employee values(1003, 'Á¶¹ÎÈñ', '´ë¸®',1,200000);
insert into Employee values(3427, 'ÃÖÁ¾Ã¶', '»ç¿ø',3,150000);

select *
From Employee;