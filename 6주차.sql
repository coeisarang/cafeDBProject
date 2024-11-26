create database ���θ�;

use ���θ�;

create table ��(
����ȣ char(10) not null,
���� char(10),
�ּ� char(20),
primary key(����ȣ)
);

insert into �� values('C100','�����','���Ｍ�ʱ�');
insert into �� values('C200','��⿵','null');
insert into �� values('C300','���ֿ�','�������α�');

select *
From ��;


create table ��ǰ(
��ǰ��ȣ char(10) not null,
��ǰ�� char(10),
�ܰ� int,
primary key(��ǰ��ȣ)
);

insert into ��ǰ values('p_001','���콺',20000);
insert into ��ǰ values('p_002','Ű����',30000);
insert into ��ǰ values('p_003','�����',300000);

select *
From ��ǰ;

create table �ֹ�(
��ID char(10) not null,
��ǰID char(10) not null,
�ֹ����� int,
primary key(��ID,��ǰID),
foreign key(��ID) references ��(����ȣ),
foreign key(��ǰID) references ��ǰ(��ǰ��ȣ)
);


insert into �ֹ� values('C100','p_001',10);
insert into �ֹ� values('C100','p_003',6);
insert into �ֹ� values('C300','p_002',1);
insert into �ֹ� values('C200','p_001',20);

select *
From �ֹ�;


--1)����� ���� �ֹ��� ��ǰID�� �ֹ� ������ �˻��Ͻÿ�.(����/��ø)

Select ��ǰID, �ֹ����� --(��ø)
From �ֹ�
Where ��ID =(
               Select ����ȣ
               From ��
			   Where ����='�����'
     );


Select ��ǰID, �ֹ����� --(����)
From  �ֹ�,��
Where �ֹ�.��ID = ��.����ȣ AND ���� = '�����'


--2)��ϵ� ���� ��� �� ������ ���Ͻÿ�.

Select Count(����)
From ��

--3)���θ��� �� �ֹ� ������ ���Ͻÿ�.

Select Sum(�ֹ�����)
From �ֹ�

--4-1)��ǰ��ȣ�� �� �ֹ������� ���Ͻÿ�

Select ��ǰID, sum(�ֹ�����) AS '��ǰID�� �� �ֹ�����'
From �ֹ�
Group By ��ǰID  


--4-2) ��ǰ�� �� �ֹ������� ���Ͻÿ�.  

Select ��ǰID, sum(�ֹ�����)
From ��ǰ, �ֹ�
Where  ��ǰ.��ǰ��ȣ = �ֹ�.��ǰID
Group By ��ǰ��;

--5)��ǰ�� ��մܰ��� ���Ͻÿ�.

Select AVG(�ܰ�)
From ��ǰ

--6)�ֹ������� 5~10�� ��ǰ���� ���ϰ� �ֹ������� ������������ �˻��Ͻÿ�.

Select ��ǰ��
From ��ǰ, �ֹ�
Where ��ǰ.��ǰ��ȣ = �ֹ�.��ǰID and �ֹ����� Between 5 AND 10
Order By �ֹ����� DESC

--7)���￡ �����ϴ� ���� �̸��� ������������ �˻��Ͻÿ�

Select ����
From ��
Where �ּ� Like '����%'
Order By ���� ASC;

--8)Ű���� �Ǵ� ����͸� �ֹ��� ��ID��?

Select ��ID
From �ֹ�
Where ��ǰID In(
              Select ��ǰ��ȣ
              From ��ǰ
			  Where ��ǰ��='Ű����' OR ��ǰ��='�����'
);

--9)�ּҰ� �Էµ��� ���� ���� �̸���? 

Select ����
From ��
Where �ּ� is null;

--10)����� ���� �ֹ��� ��ǰ����?(����/��ø)

Select ��ǰ��
From ��ǰ, �ֹ�,��
Where ��ǰ.��ǰ��ȣ = �ֹ�.��ǰID AND ��.����ȣ = �ֹ�.��ID AND ����='�����'


Select ��ǰ��
From ��ǰ
Where ��ǰ��ȣ IN (
              Select ��ǰID
			  From �ֹ�
			  Where ��ID IN (
			             Select ����ȣ
						 From ��
						 Where ����= '�����'
                       )
              )

--11)����� ���� �ֹ��� ��ǰ��� �ֹ������� �˻��Ͻÿ�(����/��øX)

Select ��ǰ��, �ֹ�����
From ��ǰ, �ֹ�,��
Where ����='�����' AND ��ǰ.��ǰ��ȣ = �ֹ�.��ǰID AND ��.����ȣ = �ֹ�.��ID

--12)����͸� �ֹ��� ���� �̸��� �ּҸ� �˻��Ͻÿ�(����0,/��ø0)

Select ����, �ּ�
From ��ǰ, �ֹ�,��
Where ��ǰ��= '�����' AND ��ǰ.��ǰ��ȣ = �ֹ�.��ǰID AND ��.����ȣ = �ֹ�.��ID

Select ����, �ּ�
From ��
Where ����ȣ IN (
              Select ��ID
			  From �ֹ�
			  Where ��ǰID IN (
			             Select ��ǰ��ȣ
						 From ��ǰ
						 Where ��ǰ��= '�����'
                       )
              )

--13)��մܰ����� ���� ��ǰ����?


Select ��ǰ��
From ��ǰ
Where �ܰ� > (
            Select AVG(�ܰ�)
            From ��ǰ
			  ); 

--14)p_001 ��ǰ���� �������콺�� �����Ͻÿ�.

Update ��ǰ
Set ��ǰ�� = ��ǰ.��ǰ��
Where ��ǰ��ȣ = 'p_001'

--15)��⿵ �������� �����Ͻÿ�.

Delete 
From ��
Where ����= '��⿵' 
