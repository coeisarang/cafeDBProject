create database �б�

use �б�;

create table �л�(
�й� int not null,
�̸� char(10),
�̸��� char(20),
���� float,
�а���ȣ char(10),
primary key(�й�),
foreign key(�а���ȣ) references �а�(�а���ȣ)
);

insert into �л� values(11002,'��ȫ��','lee@naver.com',4,'D1');
insert into �л� values(24036,'�����',null, 3.2, 'D2');
insert into �л� values(30419,'�����','kim@gmail.com',2.8,'D1');

Select *
From �л�;

create table ����(
�й� int not null,
�����ȣ char(10),
���� char(10),
primary key(�й�,�����ȣ),
foreign key(�й�) references �л�(�й�),
foreign key(�����ȣ) references ����(�����ȣ)
);

insert into ���� values(11002,'CS310','A0');
insert into ���� values(11002,'CS313','B+');
insert into ���� values(24036,'CS345','B0');
insert into ���� values(30419,'CS310','A+');

Select *
From ����;

create table ����(
�����ȣ char(10),
�����̸� char(20),
primary key(�����ȣ)
);

insert into ���� values('CS310','�����ͺ��̽�');
insert into ���� values('CS313','�ü��');
insert into ���� values('CS345','�ڷᱸ��');
insert into ���� values('CS326','�ڹ�');

Select *
From ����;

create table �а�(
�а���ȣ char(10) not null,
�а��� char(10),
primary key(�а���ȣ)
);

insert into �а� values('D1','��ǻ�Ͱ���');
insert into �а� values('D2','������');

Select *
From �а�;

--1)������ 3.0���� 4.0 ������ �л����� �̸��� ������ ������ ������������ �˻��Ͻÿ�.

Select �̸�, ����
From �л�
Where ���� Between 3 AND 4
Order By ���� DESC;

--2)��ȫ�� �л��� �Ҽ� �а����� �˻��Ͻÿ�(����/��ø)

Select �а���
From �а�, �л�
Where �̸�='��ȫ��' AND �а�.�а���ȣ = �л�.�а���ȣ

Select �а���
From �а�
Where �а���ȣ = (
              Select �а���ȣ
              From �л�
			  Where �̸�='��ȫ��'
);

--3)��ϵ� �л��� ��� �� ������ ���Ͻÿ�.

Select Count(�̸�)
From �л�

--4) D1 �а��� �Ҽ��л��� ��� �� ������ ���Ͻÿ�.

Select Count(�л�.�а���ȣ)
From �а�, �л�
Where �а�.�а���ȣ='D1' AND �а�.�а���ȣ = �л�.�а���ȣ

Select Count(�а���ȣ)
From �л�
Where �а���ȣ = (
              Select �а���ȣ
              From �а�
			  Where �а���ȣ='D1'
);

--5) ��ǻ�Ͱ��� �а��� �Ҽ� �л��� ��� �� ������ ���Ͻÿ�.

Select Count(�л�.�а���ȣ)
From �а�, �л�
Where �а���='��ǻ�Ͱ���' AND �а�.�а���ȣ = �л�.�а���ȣ

Select Count(�а���ȣ)
From �л�
Where �а���ȣ = (
              Select �а���ȣ
              From �а�
			  Where �а���='��ǻ�Ͱ���'
);

--6)�а��� �Ҽ� �л� ���� �а���ȣ���� ���Ͻÿ�.

Select Count(�а���ȣ) AS '�а��� �л� ��'
From �л�
Group By �а���ȣ

--7)�а��� �Ҽ� �л� ���� �а����� ���Ͻÿ�.

Select �а���, Count(�л�.�а���ȣ) 
From �л�, �а�
Where �л�.�а���ȣ = �а�.�а���ȣ
Group By �а���

--8)��� �л����� ��� ������ ���Ͻÿ�

Select AVG(����)
From �л�

--9)��� �л����� ��� �������� ���� �л��� �̸���?

Select �̸�
From �л�
Where ���� > (
               Select AVG(����)
               From �л�
			   );


--10)���� ���� ������ ���� �л����� �̸��� ������ �˻��Ͻÿ�.

Select �̸�,����
From �л�
Where ���� = (
               Select MAX(����)
               From �л�
			   );

--11)�̸����� �Էµ��� ���� �л��� �̸���?

Select �̸�
From �л�
Where �̸��� is null

--12)�达 ���� ���� �л����� �̸���?

Select �̸�
From �л�
Where �̸�  LIKE '��%'

--13)��� �л��� �й�, �̸�, �Ҽ� �а���, ������ ������ ������������ �˻��Ͻÿ�.

Select �й�, �̸�, �а���, ����
From �л�, �а�
Where �л�.�а���ȣ = �а�.�а���ȣ
Order By ���� DESC

--14)������ 3.0 ���� ���� �л��� �й�, �̸�, �Ҽ� �а����� �̸��� �����ټ��ɷ� ���̽ÿ�.

Select �й�, �̸�, �а���
From �л�, �а�
Where �л�.�а���ȣ = �а�.�а���ȣ AND ���� > 3
Order By �̸� ASC;

--15)��ȫ�� �л��� �����ϴ� �����̸��� �˻��Ͻÿ�(����/��ø)

Select �����̸�
From ����, �л�,����
Where �л�.�й� = ����.�й� AND ����.�����ȣ = ����.�����ȣ AND �̸� = '��ȫ��'

Select �����̸�
From ����
Where �����ȣ IN (
              Select �����ȣ
              From ����
			  Where �й� = (
                          Select �й�
                          From �л�
			              Where �̸� = '��ȫ��'
                     )
);
