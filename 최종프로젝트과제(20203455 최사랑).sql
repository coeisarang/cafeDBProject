create database 카페멤버십관리;

use 카페멤버십관리;

create table 고객(
 고객ID char(20) not null,
 고객명 char(20),
 고객PW char(20),
 전화번호 int,
 주소 char(20),
 이메일 char(20),
 생년월일 int,
 성별 char(10),
 멤버십고유번호 int,
 foreign key(멤버십고유번호) references 멤버십어플(멤버십고유번호),
 primary key(고객ID)
 );

 insert into 고객 values ('c001', '이수진', 'a1234',0108934738, '서울시 청담동..','fhldkjs@naver.com',980927,'여',202101);
 insert into 고객 values ('c002', '김도윤', 'b4566',0108936738, '안산시 상록구..','ghksjs@naver.com',910627,'남',202102);
 insert into 고객 values ('c003', '김지윤', 'c6435',0108934338, '안산시 고잔동..','sfrtd@naver.com',011207,'여',202103);
 insert into 고객 values ('c004', '오하나', 'd2464',0108134738, '충남 당진시 ..','rsfsedss@naver.com',990210,'여',202104);
 insert into 고객 values ('c005', '이진영', 'e6535',0108934938, '화성시 새솔동..','fhrtwsd90s@naver.com',990827,'남',202105);
 insert into 고객 values ('c006', '주혜원', 'f8645',0108936938, '서울시 역삼동..','faedae23s@naver.com',020407,'여',202106);

 select *
 from 고객;

 create table 회사(
 전국카페고유번호 int not null,
 회사명 char(20),
 primary key(전국카페고유번호)
 );

 insert into 회사 values (1111, 'A카페');
 insert into 회사 values (2222, 'B카페');
 insert into 회사 values (3333, 'C카페');
 insert into 회사 values (4444, 'D카페');
 insert into 회사 values (5555, 'E카페');
 insert into 회사 values (6666, 'F카페');

  select *
 from 회사;

 create table 메뉴(
 메뉴번호 int not null,
 메뉴명 char(20),
 메뉴정보 char(20),
 전국카페고유번호 int,
 foreign key(전국카페고유번호) references 회사(전국카페고유번호),
 primary key(메뉴번호)
 );

 insert into 메뉴 values (111,'바닐라떼','성분기입란참고', 1111);
 insert into 메뉴 values (222,'메리딸기','성분기입란참고', 2222);
 insert into 메뉴 values (333,'구슬스무디','성분기입란참고',  3333);
 insert into 메뉴 values (444,'오렌지에이드','성분기입란참고', 4444);
 insert into 메뉴 values (555,'아메리칸치즈케이크','성분기입란참고', 5555);
 insert into 메뉴 values (666,'카페라떼','성분기입란참고',  6666);

 select *
 from 메뉴;

 create table 멤버십어플(
 멤버십고유번호 int not null,
 멤버십이름 char(20),
 혜택 char(20),
 유효기간 int,
 전국카페고유번호 int,
 foreign key(전국카페고유번호) references 회사(전국카페고유번호),
 primary key(멤버십고유번호)
 );

 
 insert into 멤버십어플 values (202101,'이수진','음료쿠폰1', 20211231,1111);
 insert into 멤버십어플 values (202102,'김도윤','3000원할인쿠폰', 20211231,2222);
 insert into 멤버십어플 values (202103,'김지윤','3000원할인쿠폰',  20211231,3333);
 insert into 멤버십어플 values (202104,'오하나','10%할인쿠폰', 20211231,4444);
 insert into 멤버십어플 values (202105,'이진영','음료쿠폰2', 20211231,5555);
 insert into 멤버십어플 values (202106,'주혜원','1000원할인쿠폰',  20211231,6666);

  select *
 from 멤버십어플;


 create table 지점(
 지점고유번호 int not null,
 카페지점명 char(20),
 지점별쿠폰사용여부 char(10),
 전국카페고유번호 int,
 foreign key(전국카페고유번호) references 회사(전국카페고유번호),
 primary key(지점고유번호)
 );


 insert into 지점 values (111,'안산점','가능', 1111);
 insert into 지점 values (222,'천안점','불가능',2222);
 insert into 지점 values (333,'서울점','가능',  3333);
 insert into 지점 values (444,'강남점','가능', 4444);
 insert into 지점 values (555,'화성점','가능', 5555);
 insert into 지점 values (666,'수원점','불가능',6666);

  select *
 from 지점;


 create table 등록(
 고객ID char(20) not null,
 전국카페고유번호 int,
  primary key(고객ID, 전국카페고유번호)
 );

 insert into 등록 values ('c001', 1111);
 insert into 등록 values ('c002', 2222);
 insert into 등록 values ('c003', 3333);
 insert into 등록 values ('c004', 4444);
 insert into 등록 values ('c005', 5555);
 insert into 등록 values ('c006', 6666);

 select *
 from 등록;

 --1.이수진 회원의 멤버십 고유번호는?

 select 멤버십고유번호
 from 고객
 where 고객명 = '이수진';

 --2.오하나 회원의 쿠폰 혜택과 유효기간은?

 select 혜택, 유효기간
 from 멤버십어플
 where 멤버십이름 = '오하나';

 --3.오하나 회원의 등록 카페 지점명은?

 select 카페지점명
 from 지점, 멤버십어플
 where 멤버십이름 = '오하나'AND 지점.전국카페고유번호 = 멤버십어플.전국카페고유번호;


 --4.안산점 카페의 카페고유번호는?

 select 전국카페고유번호
 from 지점
 where  카페지점명 = '안산점';

 --5.주혜원 고객의 이메일과 전화번호는?

 select 이메일, 전화번호
 from 고객
 where  고객명 = '주혜원';

 --6.남성회원의 이름을 가나다순으로 나열하시오

select 고객명
 from 고객
 where  성별 = '남'
 Order By 고객명 DESC;

--7.여성회원의 남성회원의 이름을 가나다순으로 나열하시오

select 고객명
 from 고객
 where  성별 = '여'
 Order By 고객명 DESC;

 --8.서울에 거주하고 있는 회원의 이름을 나열하시오
 select 고객명
 from 고객
 where 주소 Like '서울시%'

 --쿠폰사용이 가능한 지점의 지점명을 모두 검색하시오

 select 카페지점명
 from 지점
 where 지점별쿠폰사용여부 ='가능'

  --9.쿠폰사용이 가능한 지점의 지점명을 모두 검색하시오
  
 select 카페지점명
 from 지점
 where 지점별쿠폰사용여부 ='불가능'

 --10.김도윤회원이 가지고 있는 쿠폰의 혜택은?

 select 혜택
 from 멤버십어플
 where 멤버십이름 ='김도윤'

 --11.10%할인 쿠폰의 유효기간은?

 select 유효기간
 from 멤버십어플
 where 혜택 ='10%할인쿠폰'

--12. 구슬스무디의 메뉴번호는?

 select 메뉴번호
 from 메뉴
 where 메뉴명 ='구슬스무디'

 --13. A카페의 카페지점명은?

 select 카페지점명
 from 지점, 회사
 where 회사명 = 'A카페' AND 지점.전국카페고유번호 = 회사.전국카페고유번호;
