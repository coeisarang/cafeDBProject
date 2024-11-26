select *
from 고객;

select*
from 상품;

select*
from 공급처;

create view 저가상품
as select*
  from 상품
  where 단가 <= 1000;

select*
from 저가상품;

create view 판촉상품
as select 상품번호, 상품명, 단
가, 수량
  from 상품
  where 단가 <= 2000;

 select *
 from 판촉상품;

 create view 오리온상품
as select 상품번호, 상품명, 공급처명, 단가, 수량
  from 상품, 공급처
  where 상품.공급처번호=공급처.공급처번호 And 공급처명 = '오리온';
  
 select *
 from 오리온상품;

 select *
 from 오리온상품
 where 수량 <= 100;


