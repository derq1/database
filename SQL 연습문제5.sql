create database `BookStore`;
create user 'bookstore'@'%' identified by '1234';
grant all privileges on `BookStore`.* to 'bookstore'@'%';
flush privileges;
use `BookStore`;

create table `Customer` (
`custId` int Auto_increment primary key,
`name` varchar(10) not null,
`address` varchar(20) null, 
`phone` char(13) null
);

create table `Book` (
`bookId` int primary key,
`bookName` varchar(20) not null,
`publisher` varchar(20) not null,
`price` int
);

create table `Order` (
`orderId` int primary key,
`custId` int not null,
`bookId` int not null,
`salePrice` int not null,
`orderDate` date not null
);

insert into `Customer` values (1, '박지성', '영국 맨체스타', '000-5000-0001');
insert into `Customer` values (2, '김연아', '대한민국 서울', '000-6000-0001');
insert into `Customer` values (3, '장미란', '대한민국 강원도', '000-7000-0001');
insert into `Customer` values (4, '추신수', '미국 클리블랜드', '000-8000-0001');
insert into `Customer` values (5, '박세리', '대한민국 대전', null);

insert into `Book` values (1, '축구의 역사', '굿스포츠', 7000);
insert into `Book` values (2, '축구아는 여자', '나무수', 13000);
insert into `Book` values (3, '축구의 이해', '대한미디어', 22000);
insert into `Book` values (4, '골프 바이블', '대한미디어', 35000);
insert into `Book` values (5, '피겨 교본', '굿스포츠', 8000);
insert into `Book` values (6, '역도 단계별기술', '굿스포츠', 6000);
insert into `Book` values (7, '야구의 추억', '이상미디어', 20000);
insert into `Book` values (8, '야구를 부탁해', '이상미디어', 13000);
insert into `Book` values (9, '올림픽 이야기', '삼성당', 7500);
insert into `Book` values (10, 'Olynpic Champions', 'Pearson', 13000);

insert into `Order` values (1, 1, 1, 6000,'2014-07-01');
insert into `Order` values (2, 1, 3, 21000,'2014-07-03');
insert into `Order` values (3, 2, 5, 8000,'2014-07-03');
insert into `Order` values (4, 3, 6, 6000,'2014-07-04');
insert into `Order` values (5, 4, 7, 20000,'2014-07-05');
insert into `Order` values (6, 1, 2, 12000,'2014-07-07');
insert into `Order` values (7, 4, 8, 13000,'2014-07-07');
insert into `Order` values (8, 3, 10, 12000,'2014-07-08');
insert into `Order` values (9, 2, 10, 7000,'2014-07-09');
insert into `Order` values (10, 3, 8, 13000,'2014-07-10');

#실습 5-4 모든 회원의 회원번호, 이름, 주소를 조회하시오.
select `custid`, `name`, `address` from `customer` ;


#실습 5-5 모든 도서의 이름과 가격을 조회하시오.
select `bookname` , `price` from `book`; 

#실습 5-6 모든 도서의 가격과 이름을 조회하시오.
select `price`, `bookname` from `book`;

#실습 5-7 모든 도서의 도서번호, 도서이름, 출판사, 가격을 조회하시오.
select * from `book`;

#실습 5-8 도서 테이블에 있는 모든 출판사를 조회하시오.
select `publisher` from `book`;

#실습 5-9 도서 테이블에 있는 모든 출판사를 조회하시오. 단 조회 결과에서 중복을 제거하시오.
select  distinct `publisher` from `book`;
select `publisher` from `book` group by `publisher`;

#실습 5-10 가격이 20,000원 이상인 도서를 조회하시오.
select * from `book` where `price` >= 20000;

#실습 5-11 가격이 20,000원 미만인 도서를 조회하시오.
select * from `book` where `price` < 20000;

#실습 5-12 가격이 10,000원 이상 20,000 이하인 도서를 조회하시오.
select * from `book` where `price` >= 10000 and `price` <=20000;

#실습 5-13 가격이 15,000원 이상 30,000 이하인 도서의 도서번호, 도서명, 도서가격을 조회하시오.
select `bookid`, `bookname`,`price` from `book` where `price` >=15000 and price <=30000;

#실습 5-14 도서번호가 2, 3, 5 인 도서를 조회하시오.
select * from `book` where `bookid` in (2,3,5) ;
SELECT * FROM `Book` WHERE `bookId`=2 OR `bookId`=3 OR `bookId`=5;

#실습 5-15 도서번호가 짝수인 도서를 조회하시오.
select * from `book` where `bookid` %2 = 0;
SELECT * FROM `book` WHERE MOD(bookId, 2) =0;

#실습 5-16 박씨 성 고객을 조회하시오.
select * from `customer` where `name` like '박%'; 

#실습 5-17 대한민국에 거주하는 고객을 조회하시오.
select * from `customer` where `address` like '%대한민국%';

#실습 5-18 휴대폰 번호가 유효한 고객만 조회하시오.
select * from `customer` where `phone` is not null;

#실습 5-19 출판사가 '굿스포츠' 혹은 '대한미디어'인 도서를 조회하시오.
select * from `book` where `publisher` in('굿스포츠','대한미디어');
SELECT * FROM `Book` WHERE `publisher`='굿스포츠' OR `publisher`='대한미디어';

#실습 5-20 '축구의 역사'를 출간한 출판사를 조회하시오.
select `publisher` from `book` where `bookname` = '축구의 역사'; 

#실습 5-21 도서이름에 '축구'가 포함된 출판사를 조회하시오.
select `publisher` from `book`where `bookname` like '%축구%';

#실습 5-22 도서이름의 왼쪽 두 번째 위치에 '구'라는 문자열을 갖는 도서를 조회하시오.
select * from `book` where `bookname` like '_구%';

#실습 5-23 축구에 관한 도서 중 가격이 20,000원 이상인 도서를 조회하시오.
select * from `book` where `bookname` like '%축구%' and price >=20000 ;

#실습 5-24 도서를 이름순으로 조회하시오.
select * from `book` order by `bookname`; 

#실습 5-25 도서를 가격순으로 조회하고, 가격이 같으면 이름순으로 조회하시오.
select * from `book` order by `price`, `bookname`;

#실습 5-26 도서를 가격의 내림차순으로 조회하시오. 단 가격이 같다면 출판사를 오름차순으로 조회하시오.
select * from `book` order by `price` desc, `publisher` asc;

#실습 5-27 도서가격이 큰 1,2,3위 도서를 조회하시오
select * from `book` order by `price` desc limit 3;

#실습 5-28 도서가격이 작은 1,2,3위 도서를 조회하시오
select * from `book` order by `price` asc limit 3;

#실습 5-29 고객이 주문한 도서의 총 판매액을 조회하시오.
select sum(`salePrice`) as `총판매액` from `order`; 

#실습 5-30 고객이 주문한 도서의 총 판매액, 평균값, 최저값, 최고가를 조회하시오.
SELECT 
    SUM(`salePrice`) AS '총 판매액',
    AVG(`salePrice`) AS '평균값',
    MIN(`salePrice`) AS '최저값',
    MAX(`salePrice`) AS '최고값'
FROM `order`;
#실습 5-31 도서 판매 건수를 조회하시오.
select count(*) as '판매건수' from `Order`;

#실습 5-32 도서제목에 야구가 포함한 도서를 농구로 변경한 후 도서 목록을 조회하시오.
select `bookid`, replace(`bookName`, '야구', '농구') as `bookName`, `publisher`, `price` from `book`;

#실습 5-33 가격이 8,000원 이상인 도서를 구매한 고객에 대하여 고객별 주분도서의 총 수량을 조회하시오. 단, 두 권 이상 구매한 고객만 조회할 것 ※
SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
select  `custid`, 
count(*) as `수량` 
from `order` 
where `saleprice` >= 8000
 group by `custid` 
 having `수량` >= 2;

#실습 5-34 고객과 고객의 주문에 관한 데이터를 모두 조회하시오.
select * from `customer` as a
join `order` as b on a.custid = b. custid; #방법1

select * from `customer` join `order` using(`custid`); # 방법2

select * from `customer` a, `order` b where a.custid = b.custid; # 방법3

#실습 5-35 고객과 고객의 주문에 관한 데이터를 고객번호 순으로 정렬하여 조회하시오.
select * from `customer` as a
 join `order` as b on a.custid = b.custid order by a.`custid`;

#실습 5-36 고객의 이름과 고객이 주문한 도서의 판매가격을 조회하시오.
select `name`,
	`saleprice`
from `customer`  as a
join `order` as b on a. `custid` = b. `custid`;

#실습 5-37 고객별로 주문한 모든 도서의 총 판매액을 조회하고. 고객별로 정렬하시오.
select `name`,
	sum(`saleprice`)
from `customer` as a
join `order` as b on a.`custid` = b.`custid`
group by `name`
order by `name` ;

#실습 5-38 고객의 이름과 고객이 주문한 도서의 이름을 조회하시오.
select  `name`,
		`bookName`
from `Customer` as a
join `order` as b on a.custid = b.custid
join `book` as c on b.bookid = c.bookid;

#실습 5-39 가격이 20,000원인 도서를 주문한 고객의 이름과 도서의 이름을 조회하시오.
select  `name`,
		`bookName`
from `Customer` as a
join `order` as b on a.custid = b.custid
join `book` as c on b.bookid = c.bookid
where `saleprice` = 20000;

#실습 5-40 도서를 구매하지 않은 고객을 포함해서 고객명과 주문한 도서의 판매가격을 조회하시오
select 
	`name`,
	`saleprice`
from `customer`	as a
left join `order` as b on a.custid = b.custid;

#실습 5-41 김연아 고객이 주문한 도서의 총 판매액을 조회하시오
SELECT 
	SUM(`salePrice`) AS `총매출`
FROM `Customer` AS a
JOIN `Order` AS b ON a.custId = b.custId
WHERE `name`='김연아';

SELECT 
	SUM(`salePrice`) AS `총매출`
FROM `Order`
WHERE `custId`=(SELECT `custId` FROM `Customer` WHERE `name`='김연아');


#실습 5-42 가장 비싼 도서의 이름을 조회하시오
SELECT `bookName` FROM `Book` ORDER BY `price` DESC LIMIT 1;
SELECT `bookName` FROM `Book` WHERE `price`=(SELECT MAX(`price`) FROM `Book`);

#실습5-43 도서를 주문하지 않은 고객의 이름을 조회하시오
SELECT `name` FROM `Customer` AS a 
LEFT JOIN `Order` AS b ON a.custId = b.custId
WHERE `orderId` IS NULL;

#실습 5-44 book 테이블에 새로운 도서 '스포의 의학'을 삽입하시오. 스포츠 의학은 한솔의학서적에서 출간 했으며 가격은 미정이다.
INSERT INTO `Book` SET
					`bookId` = 11,
					`bookName` = '스포츠의학',
					`publisher` = '한솔의학서적';

#실습 5-45 Customer 테이블에서 고객번호가 5인 고객의 주소를 ‘대한민국 부산’으로 변경하시오.
UPDATE `Customer` SET `address`='대한민국 부산' WHERE `custId`=5;

#실습 5-46. Customer 테이블에서 고객번호가 5인 고객을 삭제하시오.
DELETE FROM `Customer` WHERE `custId`=5;










 