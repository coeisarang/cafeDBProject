select *
from ��;

select*
from ��ǰ;

select*
from ����ó;

create view ������ǰ
as select*
  from ��ǰ
  where �ܰ� <= 1000;

select*
from ������ǰ;

create view ���˻�ǰ
as select ��ǰ��ȣ, ��ǰ��, ��
��, ����
  from ��ǰ
  where �ܰ� <= 2000;

 select *
 from ���˻�ǰ;

 create view �����»�ǰ
as select ��ǰ��ȣ, ��ǰ��, ����ó��, �ܰ�, ����
  from ��ǰ, ����ó
  where ��ǰ.����ó��ȣ=����ó.����ó��ȣ And ����ó�� = '������';
  
 select *
 from �����»�ǰ;

 select *
 from �����»�ǰ
 where ���� <= 100;


