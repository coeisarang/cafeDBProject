create database 쇼핑몰;

use 쇼핑몰;

create table 고객(
고객번호 char(10) not null,
고객명 char(10),
주소 char(20),
primary key(고객번호)
);

insert into 고객 values('C100','이희경','서울서초구');
insert into 고객 values('C200','배기영','null');
insert into 고객 values('C300','성주원','서울종로구');

select *
From 고객;


create table 제품(
제품번호 char(10) not null,
제품명 char(10),
단가 int,
primary key(제품번호)
);

insert into 제품 values('p_001','마우스',20000);
insert into 제품 values('p_002','키보드',30000);
insert into 제품 values('p_003','모니터',300000);

select *
From 제품;

create table 주문(
고객ID char(10) not null,
제품ID char(10) not null,
주문수량 int,
primary key(고객ID,제품ID),
foreign key(고객ID) references 고객(고객번호),
foreign key(제품ID) references 제품(제품번호)
);


insert into 주문 values('C100','p_001',10);
insert into 주문 values('C100','p_003',6);
insert into 주문 values('C300','p_002',1);
insert into 주문 values('C200','p_001',20);

select *
From 주문;


--1)이희경 고객이 주문한 제품ID와 주문 수량을 검색하시오.(조인/중첩)

Select 제품ID, 주문수량 --(중첩)
From 주문
Where 고객ID =(
               Select 고객번호
               From 고객
			   Where 고객명='이희경'
     );


Select 제품ID, 주문수량 --(조인)
From  주문,고객
Where 주문.고객ID = 고객.고객번호 AND 고객명 = '이희경'


--2)등록된 고객은 모두 몇 명인지 구하시오.

Select Count(고객명)
From 고객

--3)쇼핑몰의 총 주문 수량을 구하시오.

Select Sum(주문수량)
From 주문

--4-1)제품번호명별 총 주문수량을 구하시오

Select 제품ID, sum(주문수량) AS '제품ID별 총 주문수량'
From 주문
Group By 제품ID  


--4-2) 제품명별 총 주문수량을 구하시오.  

Select 제품ID, sum(주문수량)
From 제품, 주문
Where  제품.제품번호 = 주문.제품ID
Group By 제품명;

--5)제품의 평균단가를 구하시오.

Select AVG(단가)
From 제품

--6)주문수량이 5~10인 제품명을 구하고 주문수량의 내림차순으로 검색하시오.

Select 제품명
From 제품, 주문
Where 제품.제품번호 = 주문.제품ID and 주문수량 Between 5 AND 10
Order By 주문수량 DESC

--7)서울에 거주하는 고객의 이름을 오름차순으로 검색하시오

Select 고객명
From 고객
Where 주소 Like '서울%'
Order By 고객명 ASC;

--8)키보드 또는 모니터를 주문한 고객ID는?

Select 고객ID
From 주문
Where 제품ID In(
              Select 제품번호
              From 제품
			  Where 제품명='키보드' OR 제품명='모니터'
);

--9)주소가 입력되지 않은 고객의 이름은? 

Select 고객명
From 고객
Where 주소 is null;

--10)이희경 고객이 주문한 제품명은?(조인/중첩)

Select 제품명
From 제품, 주문,고객
Where 제품.제품번호 = 주문.제품ID AND 고객.고객번호 = 주문.고객ID AND 고객명='이희경'


Select 제품명
From 제품
Where 제품번호 IN (
              Select 제품ID
			  From 주문
			  Where 고객ID IN (
			             Select 고객번호
						 From 고객
						 Where 고객명= '이희경'
                       )
              )

--11)이희경 고객이 주문한 제품명과 주문수량을 검색하시오(조인/중첩X)

Select 제품명, 주문수량
From 제품, 주문,고객
Where 고객명='이희경' AND 제품.제품번호 = 주문.제품ID AND 고객.고객번호 = 주문.고객ID

--12)모니터를 주문한 고객의 이름과 주소를 검색하시오(조인0,/중첩0)

Select 고객명, 주소
From 제품, 주문,고객
Where 제품명= '모니터' AND 제품.제품번호 = 주문.제품ID AND 고객.고객번호 = 주문.고객ID

Select 고객명, 주소
From 고객
Where 고객번호 IN (
              Select 고객ID
			  From 주문
			  Where 제품ID IN (
			             Select 제품번호
						 From 제품
						 Where 제품명= '모니터'
                       )
              )

--13)평균단가보다 높은 제품명은?


Select 제품명
From 제품
Where 단가 > (
            Select AVG(단가)
            From 제품
			  ); 

--14)p_001 제품명을 무선마우스로 수정하시오.

Update 제품
Set 제품명 = 제품.제품명
Where 제품번호 = 'p_001'

--15)배기영 고객정보를 삭제하시오.

Delete 
From 고객
Where 고객명= '배기영' 
