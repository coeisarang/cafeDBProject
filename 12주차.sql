create database A쇼핑몰;

use A쇼핑몰;

create table 고객(
 고객ID char(10) not null,
 고객명 char(10),
 전화번호 char(20),
 primary key(고객ID)
 );

 insert into 고객 values ('c001', '이수진', '010-1234-5678');
 insert into 고객 values ('c002', '김도윤', '010-2345-5678');
 insert into 고객 values ('c003', '김지윤', '010-2930-4935');
 insert into 고객 values ('c004', '오하나', '010-1784-5356');
 insert into 고객 values ('c005', '이진영', '010-5839-5342');
 insert into 고객 values ('c006', '주혜원', '010-6748-5829');

 select *
 from 고객;

 create table 공급처(
 공급처번호 int not null,
 공급처명 char(10),
 연락처 char(20),
 primary key(공급처번호)
 );

 insert into 공급처 values (111,'오리온',  '031-123-568');
 insert into 공급처 values (222,'혜태과자', '02-2345-568');
 insert into 공급처 values (333,'롯데',  '031-145-548');
 insert into 공급처 values (444,'농심',  '02-2445-558');
 insert into 공급처 values (555,'설록',  '031-123-5681');
 insert into 공급처 values (666,'좋은기업',  '02-435-568');
 select *
 from 공급처;

 create table 세일행사(
 행사ID char(10) not null,
 기간 char(30),
 행사명 char(20),
 primary key(행사ID)
 );

 insert into 세일행사 values ('H0', '200415-200615', '화이팅코리아');
 insert into 세일행사 values ('H1', '200515-200520', '성년의 날');
 insert into 세일행사 values ('H2', '200616-200615', '어린이날');
 insert into 세일행사 values ('H3', '200716-200520', '블랙프라이데이');
 insert into 세일행사 values ('H4', '200827-200615', '어버이날');
 insert into 세일행사 values ('H5', '200915-200520', '한글날');

 select *
 from 세일행사;

 create table 상품(
 상품번호 int not null,
 상품명 char(10),
 단가 int,
 수량 int,
 공급처번호 int,
 행사ID char(10),
 할인율 real,
 primary key(상품번호),
 foreign key(공급처번호) references 공급처(공급처번호),
 foreign key(행사ID) references 세일행사(행사ID)
 );

 insert into 상품 values (1234,'초코파이',3000,200,111,'H0',0.5);
 insert into 상품 values (5678,'홈런볼',  1000, 50, 222,null,0.9);
 insert into 상품 values (1256,'몽쉘',3500,200,333,'H0',0.7);
 insert into 상품 values (5621,'포카칩',  1500, 100, 444,null,0.7);
 insert into 상품 values (1289,'떡볶이',1000,100,555,'H0',0.5);
 insert into 상품 values (5634,'꼬북칩',  1500, 50, 666,null,0.5);

 select *
 from 상품;

 create table 구입(
 고객ID char(10) not null,
 상품번호 int not null,
 날짜 char(20),
 구매수량 int,
 공급처번호 int,
 primary key(고객ID,상품번호),
 foreign key(고객ID) references 고객(고객ID),
 foreign key(상품번호) references 상품(상품번호)
 );

 insert into 구입 values ('c001',1234,'20-05-28',10,345);
 insert into 구입 values ('c002',5678,'20-05-28',1,234);
 insert into 구입 values ('c003',1256,'20-05-28',15,145);
 insert into 구입 values ('c004',5621,'20-05-28',13,434);
 insert into 구입 values ('c005',1289,'20-05-28',12,235);
 insert into 구입 values ('c006',5634,'20-05-28',5,238);

  select *
 from 구입;

 --1'초코파이'를 구입한 고객의 고객명과 전화번호를 검색하시오.

 select 고객명, 전화번호
 from 고객, 구입, 상품
 where 고객.고객ID=구입.고객ID AND 구입.상품번호=상품.상품번호 AND 상품명 = '초코파이';

 select 고객명, 전화번호
 from 고객
 where 고객ID IN(
                 select 고객ID
                 from 구입
                 where 상품번호 =(
				                   select 상품번호
								   from 상품
								   where 상품명 ='초코파이'
								   )
								   )

-- 2.'화이팅코리아' 행사에 참여한 상품의 상품명과 단가(원래가격), 할인된 가격을 검색하시오.

select 상품명, 단가, 단가*할인율 AS '할인된 가격'
from 상품, 세일행사
where 상품.행사ID=세일행사.행사ID AND 행사명 = '화이팅코리아';

--3 '오리온'에서 공급하는 상품명을 검색하시오

select 상품명
from 상품,공급처 
where 상품.공급처번호 = 공급처.공급처번호 AND 공급처명 = '오리온';

--4 여러분이 문제를 쓰고SQL을 작성하세요. 단 각 테이블에 데이터를 5개 입력해야 합니다!!
-- 김지윤고객이 시킨 상품명과 수량을 검색하시오(고객명포함)

select 고객명, 상품명, 구매수량
 from 고객, 구입, 상품
 where 고객.고객ID=구입.고객ID AND 구입.상품번호=상품.상품번호 AND 고객명 = '김지윤';

--5 여러분이 문제를 쓰고 SQL을 작성하세요
-- 공급처 번호가 333인 공급처명과 연락처를 검색하시오

select 공급처명, 연락처
 from 공급처
 where 공급처번호 = 333;
