create database A���θ�;

use A���θ�;

create table ��(
 ��ID char(10) not null,
 ���� char(10),
 ��ȭ��ȣ char(20),
 primary key(��ID)
 );

 insert into �� values ('c001', '�̼���', '010-1234-5678');
 insert into �� values ('c002', '�赵��', '010-2345-5678');
 insert into �� values ('c003', '������', '010-2930-4935');
 insert into �� values ('c004', '���ϳ�', '010-1784-5356');
 insert into �� values ('c005', '������', '010-5839-5342');
 insert into �� values ('c006', '������', '010-6748-5829');

 select *
 from ��;

 create table ����ó(
 ����ó��ȣ int not null,
 ����ó�� char(10),
 ����ó char(20),
 primary key(����ó��ȣ)
 );

 insert into ����ó values (111,'������',  '031-123-568');
 insert into ����ó values (222,'���°���', '02-2345-568');
 insert into ����ó values (333,'�Ե�',  '031-145-548');
 insert into ����ó values (444,'���',  '02-2445-558');
 insert into ����ó values (555,'����',  '031-123-5681');
 insert into ����ó values (666,'�������',  '02-435-568');
 select *
 from ����ó;

 create table �������(
 ���ID char(10) not null,
 �Ⱓ char(30),
 ���� char(20),
 primary key(���ID)
 );

 insert into ������� values ('H0', '200415-200615', 'ȭ�����ڸ���');
 insert into ������� values ('H1', '200515-200520', '������ ��');
 insert into ������� values ('H2', '200616-200615', '��̳�');
 insert into ������� values ('H3', '200716-200520', '�������̵���');
 insert into ������� values ('H4', '200827-200615', '����̳�');
 insert into ������� values ('H5', '200915-200520', '�ѱ۳�');

 select *
 from �������;

 create table ��ǰ(
 ��ǰ��ȣ int not null,
 ��ǰ�� char(10),
 �ܰ� int,
 ���� int,
 ����ó��ȣ int,
 ���ID char(10),
 ������ real,
 primary key(��ǰ��ȣ),
 foreign key(����ó��ȣ) references ����ó(����ó��ȣ),
 foreign key(���ID) references �������(���ID)
 );

 insert into ��ǰ values (1234,'��������',3000,200,111,'H0',0.5);
 insert into ��ǰ values (5678,'Ȩ����',  1000, 50, 222,null,0.9);
 insert into ��ǰ values (1256,'����',3500,200,333,'H0',0.7);
 insert into ��ǰ values (5621,'��īĨ',  1500, 100, 444,null,0.7);
 insert into ��ǰ values (1289,'������',1000,100,555,'H0',0.5);
 insert into ��ǰ values (5634,'����Ĩ',  1500, 50, 666,null,0.5);

 select *
 from ��ǰ;

 create table ����(
 ��ID char(10) not null,
 ��ǰ��ȣ int not null,
 ��¥ char(20),
 ���ż��� int,
 ����ó��ȣ int,
 primary key(��ID,��ǰ��ȣ),
 foreign key(��ID) references ��(��ID),
 foreign key(��ǰ��ȣ) references ��ǰ(��ǰ��ȣ)
 );

 insert into ���� values ('c001',1234,'20-05-28',10,345);
 insert into ���� values ('c002',5678,'20-05-28',1,234);
 insert into ���� values ('c003',1256,'20-05-28',15,145);
 insert into ���� values ('c004',5621,'20-05-28',13,434);
 insert into ���� values ('c005',1289,'20-05-28',12,235);
 insert into ���� values ('c006',5634,'20-05-28',5,238);

  select *
 from ����;

 --1'��������'�� ������ ���� ����� ��ȭ��ȣ�� �˻��Ͻÿ�.

 select ����, ��ȭ��ȣ
 from ��, ����, ��ǰ
 where ��.��ID=����.��ID AND ����.��ǰ��ȣ=��ǰ.��ǰ��ȣ AND ��ǰ�� = '��������';

 select ����, ��ȭ��ȣ
 from ��
 where ��ID IN(
                 select ��ID
                 from ����
                 where ��ǰ��ȣ =(
				                   select ��ǰ��ȣ
								   from ��ǰ
								   where ��ǰ�� ='��������'
								   )
								   )

-- 2.'ȭ�����ڸ���' ��翡 ������ ��ǰ�� ��ǰ��� �ܰ�(��������), ���ε� ������ �˻��Ͻÿ�.

select ��ǰ��, �ܰ�, �ܰ�*������ AS '���ε� ����'
from ��ǰ, �������
where ��ǰ.���ID=�������.���ID AND ���� = 'ȭ�����ڸ���';

--3 '������'���� �����ϴ� ��ǰ���� �˻��Ͻÿ�

select ��ǰ��
from ��ǰ,����ó 
where ��ǰ.����ó��ȣ = ����ó.����ó��ȣ AND ����ó�� = '������';

--4 �������� ������ ����SQL�� �ۼ��ϼ���. �� �� ���̺� �����͸� 5�� �Է��ؾ� �մϴ�!!
-- ���������� ��Ų ��ǰ��� ������ �˻��Ͻÿ�(��������)

select ����, ��ǰ��, ���ż���
 from ��, ����, ��ǰ
 where ��.��ID=����.��ID AND ����.��ǰ��ȣ=��ǰ.��ǰ��ȣ AND ���� = '������';

--5 �������� ������ ���� SQL�� �ۼ��ϼ���
-- ����ó ��ȣ�� 333�� ����ó��� ����ó�� �˻��Ͻÿ�

select ����ó��, ����ó
 from ����ó
 where ����ó��ȣ = 333;
