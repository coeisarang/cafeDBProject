create database ī�����ʰ���;

use ī�����ʰ���;

create table ��(
 ��ID char(20) not null,
 ���� char(20),
 ��PW char(20),
 ��ȭ��ȣ int,
 �ּ� char(20),
 �̸��� char(20),
 ������� int,
 ���� char(10),
 ����ʰ�����ȣ int,
 foreign key(����ʰ�����ȣ) references ����ʾ���(����ʰ�����ȣ),
 primary key(��ID)
 );

 insert into �� values ('c001', '�̼���', 'a1234',0108934738, '����� û�㵿..','fhldkjs@naver.com',980927,'��',202101);
 insert into �� values ('c002', '�赵��', 'b4566',0108936738, '�Ȼ�� ��ϱ�..','ghksjs@naver.com',910627,'��',202102);
 insert into �� values ('c003', '������', 'c6435',0108934338, '�Ȼ�� ���ܵ�..','sfrtd@naver.com',011207,'��',202103);
 insert into �� values ('c004', '���ϳ�', 'd2464',0108134738, '�泲 ������ ..','rsfsedss@naver.com',990210,'��',202104);
 insert into �� values ('c005', '������', 'e6535',0108934938, 'ȭ���� ���ֵ�..','fhrtwsd90s@naver.com',990827,'��',202105);
 insert into �� values ('c006', '������', 'f8645',0108936938, '����� ���ﵿ..','faedae23s@naver.com',020407,'��',202106);

 select *
 from ��;

 create table ȸ��(
 ����ī�������ȣ int not null,
 ȸ��� char(20),
 primary key(����ī�������ȣ)
 );

 insert into ȸ�� values (1111, 'Aī��');
 insert into ȸ�� values (2222, 'Bī��');
 insert into ȸ�� values (3333, 'Cī��');
 insert into ȸ�� values (4444, 'Dī��');
 insert into ȸ�� values (5555, 'Eī��');
 insert into ȸ�� values (6666, 'Fī��');

  select *
 from ȸ��;

 create table �޴�(
 �޴���ȣ int not null,
 �޴��� char(20),
 �޴����� char(20),
 ����ī�������ȣ int,
 foreign key(����ī�������ȣ) references ȸ��(����ī�������ȣ),
 primary key(�޴���ȣ)
 );

 insert into �޴� values (111,'�ٴҶ�','���б��Զ�����', 1111);
 insert into �޴� values (222,'�޸�����','���б��Զ�����', 2222);
 insert into �޴� values (333,'����������','���б��Զ�����',  3333);
 insert into �޴� values (444,'���������̵�','���б��Զ�����', 4444);
 insert into �޴� values (555,'�Ƹ޸�ĭġ������ũ','���б��Զ�����', 5555);
 insert into �޴� values (666,'ī���','���б��Զ�����',  6666);

 select *
 from �޴�;

 create table ����ʾ���(
 ����ʰ�����ȣ int not null,
 ������̸� char(20),
 ���� char(20),
 ��ȿ�Ⱓ int,
 ����ī�������ȣ int,
 foreign key(����ī�������ȣ) references ȸ��(����ī�������ȣ),
 primary key(����ʰ�����ȣ)
 );

 
 insert into ����ʾ��� values (202101,'�̼���','��������1', 20211231,1111);
 insert into ����ʾ��� values (202102,'�赵��','3000����������', 20211231,2222);
 insert into ����ʾ��� values (202103,'������','3000����������',  20211231,3333);
 insert into ����ʾ��� values (202104,'���ϳ�','10%��������', 20211231,4444);
 insert into ����ʾ��� values (202105,'������','��������2', 20211231,5555);
 insert into ����ʾ��� values (202106,'������','1000����������',  20211231,6666);

  select *
 from ����ʾ���;


 create table ����(
 ����������ȣ int not null,
 ī�������� char(20),
 ������������뿩�� char(10),
 ����ī�������ȣ int,
 foreign key(����ī�������ȣ) references ȸ��(����ī�������ȣ),
 primary key(����������ȣ)
 );


 insert into ���� values (111,'�Ȼ���','����', 1111);
 insert into ���� values (222,'õ����','�Ұ���',2222);
 insert into ���� values (333,'������','����',  3333);
 insert into ���� values (444,'������','����', 4444);
 insert into ���� values (555,'ȭ����','����', 5555);
 insert into ���� values (666,'������','�Ұ���',6666);

  select *
 from ����;


 create table ���(
 ��ID char(20) not null,
 ����ī�������ȣ int,
  primary key(��ID, ����ī�������ȣ)
 );

 insert into ��� values ('c001', 1111);
 insert into ��� values ('c002', 2222);
 insert into ��� values ('c003', 3333);
 insert into ��� values ('c004', 4444);
 insert into ��� values ('c005', 5555);
 insert into ��� values ('c006', 6666);

 select *
 from ���;

 --1.�̼��� ȸ���� ����� ������ȣ��?

 select ����ʰ�����ȣ
 from ��
 where ���� = '�̼���';

 --2.���ϳ� ȸ���� ���� ���ð� ��ȿ�Ⱓ��?

 select ����, ��ȿ�Ⱓ
 from ����ʾ���
 where ������̸� = '���ϳ�';

 --3.���ϳ� ȸ���� ��� ī�� ��������?

 select ī��������
 from ����, ����ʾ���
 where ������̸� = '���ϳ�'AND ����.����ī�������ȣ = ����ʾ���.����ī�������ȣ;


 --4.�Ȼ��� ī���� ī�������ȣ��?

 select ����ī�������ȣ
 from ����
 where  ī�������� = '�Ȼ���';

 --5.������ ���� �̸��ϰ� ��ȭ��ȣ��?

 select �̸���, ��ȭ��ȣ
 from ��
 where  ���� = '������';

 --6.����ȸ���� �̸��� �����ټ����� �����Ͻÿ�

select ����
 from ��
 where  ���� = '��'
 Order By ���� DESC;

--7.����ȸ���� ����ȸ���� �̸��� �����ټ����� �����Ͻÿ�

select ����
 from ��
 where  ���� = '��'
 Order By ���� DESC;

 --8.���￡ �����ϰ� �ִ� ȸ���� �̸��� �����Ͻÿ�
 select ����
 from ��
 where �ּ� Like '�����%'

 --��������� ������ ������ �������� ��� �˻��Ͻÿ�

 select ī��������
 from ����
 where ������������뿩�� ='����'

  --9.��������� ������ ������ �������� ��� �˻��Ͻÿ�
  
 select ī��������
 from ����
 where ������������뿩�� ='�Ұ���'

 --10.�赵��ȸ���� ������ �ִ� ������ ������?

 select ����
 from ����ʾ���
 where ������̸� ='�赵��'

 --11.10%���� ������ ��ȿ�Ⱓ��?

 select ��ȿ�Ⱓ
 from ����ʾ���
 where ���� ='10%��������'

--12. ������������ �޴���ȣ��?

 select �޴���ȣ
 from �޴�
 where �޴��� ='����������'

 --13. Aī���� ī����������?

 select ī��������
 from ����, ȸ��
 where ȸ��� = 'Aī��' AND ����.����ī�������ȣ = ȸ��.����ī�������ȣ;
