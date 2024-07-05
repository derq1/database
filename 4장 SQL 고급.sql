#날짜 : 2024/07/03
#이름 : 박서홍
#내용 : 4장 SQL 고급

#실습 4-1
CREATE TABLE `Member` (
	`uid` VARCHAR(10) PRIMARY KEY,
	`name` VARCHAR(10) NOT NULL,
	`hp` CHAR(13) UNIQUE NOT NULL,
	`pos` VARCHAR(10) default '사원',
	`dep` TINYINT,
	`rdate` DATETIME NOT NULL
);
 
CREATE TABLE `Department` (
	`depNo` TINYINT PRIMARY KEY,
	`name` VARCHAR(10) NOT NULL,
	`tel` CHAR(12) NOT NULL
);

CREATE TABLE `Sales` (
	`no` INT auto_increment primary key,
    `uid` varchar(10) not null,
    `year` year not null,
    `month` tinyint not null,
    `sale` int
);


#실습 4-2
INSERT INTO `Member` VALUES ('a101', '박혁거세', '010-1234-1001', '부장', '101', now());
INSERT INTO `Member` VALUES ('a102', '김유신', '010-1234-1002', '차장', '101', now());
INSERT INTO `Member` VALUES ('a103', '김춘추', '010-1234-1003', '사원', '101', now());
INSERT INTO `Member` VALUES ('a104', '장보고', '010-1234-1004', '대리', '102', now());
INSERT INTO `Member` VALUES ('a105', '강감찬', '010-1234-1005', '과장', '102', now());
INSERT INTO `Member` VALUES ('a106', '이성계', '010-1234-1006', '차장', '103', now());
INSERT INTO `Member` VALUES ('a107', '정철', '010-1234-1007', '차장', '103', now());
INSERT INTO `Member` VALUES ('a108', '이순신', '010-1234-1008', '부장', '104', now());
INSERT INTO `Member` VALUES ('a109', '허균', '010-1234-1009', '부장', '104', now());
INSERT INTO `Member` VALUES ('a110', '정약용', '010-1234-1010', '사원', '105', now());
INSERT INTO `Member` VALUES ('a111', '박지원', '010-1234-1011', '사원', '105', now());


INSERT INTO `Department` values (101, '영업1부', '051-512-1001');
INSERT INTO `Department` values (102, '영업2부', '051-512-1002');
INSERT INTO `Department` values (103, '영업3부', '051-512-1003');
INSERT INTO `Department` values (104, '영업4부', '051-512-1004');
INSERT INTO `Department` values (105, '영업5부', '051-512-1005');
INSERT INTO `Department` values (106, '영업지원부', '051-512-1006');
INSERT INTO `Department` values (107, '인사부', '051-512-1007');

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2018, 1, 98100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2018, 1, 136000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2018, 1, 80100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2018, 1, 78000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2018, 1, 93000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2018, 2, 23500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2018, 2, 126000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2018, 2, 18500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2018, 2, 19000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2018, 2, 53000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2019, 1, 24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2019, 1, 109000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2019, 1, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2019, 1, 53500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', 2019, 1, 24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2019, 2, 160000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2019, 2, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2019, 2, 43000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2019, 2, 24000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2019, 1, 109000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2020, 1, 201000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2020, 1, 63000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2020, 1, 74000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2020, 1, 122000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', 2020, 1, 111000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2020, 2, 120000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2020, 2, 93000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2020, 2, 84000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2020, 2, 180000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a108', 2020, 2, 76000);


#실습 4-3
SELECT * FROM `Member` where `name` = '김유신';
SELECT * FROM `Member` where `pos` = '차장' AND dep=101;
SELECT * FROM `Member` where `pos` = '차장' OR dep=101;
SELECT * FROM `Member` where `name` != '김춘추';
SELECT * FROM `Member` where `name` <> '김춘추';
SELECT * FROM `Member` where `pos` = '사원' OR `pos`='대리';
SELECT * FROM `Member` where `pos` IN('사원', '대리');
SELECT * FROM `Member` where `dep` IN(101, 102, 103);
SELECT * FROM `Member` where `name` LIKE '%신';
SELECT * FROM `Member` where `name` LIKE '김%';
SELECT * FROM `Member` where `name` LIKE '김__';
SELECT * FROM `Member` where `name` LIKE '%_성_';
SELECT * FROM `Member` where `name` LIKE '정_';
SELECT * FROM `Sales` where `sale` > 50000;
SELECT * FROM `Sales` where `sale` >= 50000 AND `sale` < 100000 AND `month`=1;
SELECT * FROM `Sales` where `sale` BETWEEN 50000 AND 100000;
SELECT * FROM `Sales` where `sale` NOT BETWEEN 50000 AND 100000;
SELECT * FROM `Sales` where `year` IN(2020);
SELECT * FROM `Sales` where `month` IN(1,2);

#실습 4-4
SELECT * FROM `Sales` order by `sale`;
SELECT * FROM `Sales` order by `sale` ASC;
SELECT * FROM `Sales` order by `sale`DESC;
SELECT * FROM `Member` order by `name`;
SELECT * FROM `Member` order by `name`DESC;
SELECT * FROM `Member` order by `rdate` ASC;
SELECT * FROM `Sales` where `sale` > 50000 order by `sale` DESC;
SELECT * FROM `Sales` 
where `sale` > 50000
ORDER BY `year`, `month`, `sale` DESC;
SELECT * FROM `Sales`
WHERE `sale` > 50000
ORDER BY `year`, `month`, `sale` DESC; #연도순으로 매출큰순서
#실습 4-5
SELECT * FROM `Sales` LIMIT 3;
SELECT * FROM `Sales` LIMIT 0, 3;  #ex)2, 20 하면2번이후부터 20개 조회
SELECT * FROM `Sales` LIMIT 1, 2;
SELECT * FROM `Sales` LIMIT 5, 3;
SELECT * FROM `Sales` order by `sale` DESC LIMIT 3, 5;
SELECT * FROM `Sales` where `sale` < 50000 order by `sale` desc limit 3;
select * from `Sales`
WHERE `sale` > 50000
ORDER BY `year` DESC, `month`, `sale` DESC
LIMIT 5;

#실습 4-6
select SUM(`sale`) AS `합계` FROM `Sales`;
SELECT AVG(`sale`) AS `평균` FROM `Sales`;
select max(`sale`) as `최대값` from `Sales`;
select min(`sale`) as `최소값` from `Sales`;
select ceiling(1.2);
select ceiling(1.2);
select floor(1.2);
select floor(1.8);
select round(1.2);
select round(1.8);
select rand(); # 0 ~ 1 사이의 임의의 실수
select ceiling(rand() * 10);
select count(`sale`) as `갯수` from `Sales`;
select count(*) as `갯수` from `Sales`;
select left('HelloWorld', 5);
select right('HelloWorld', 5);
select substring('HelloWorld', 6, 5);
select CONCAT('Hello', 'World') as `결과`;
select CONCAT(`uid`, `name`, `hp`) FROM `member` WHERE `uid` = 'a108';
select curdate();
select curtime();
select now();
INSERT INTO `Member` VALUES ('a112', '유관순', '010-1234-1012', '대리', 107, NOW());

#실습 4-7
SELECT SUM(`sale`) as `2018년 1월 매출 총합`
from `Sales` where `year` = 2018 and `month`=1;

#실습 4-8
select
	SUM(`sale`) as `총합`,
    AVG(`sale`) as `평균` 
    from `Sales`
where
	`year` = 2019 and
    `month` = 2 and
    `sale` >= 50000;

#실습 4-9
select
MIN(`Sale`) as `최저매출`,
MAX(`Sale`) as `최고매출`
from `Sales`
where `year`=2020;

#실습 4-10
SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
select * from `Sales` group by `uid`;
select * from `Sales` group by `year`;
select * from `Sales` group by `uid`, `year`;
select `uid`, COUNT(*) as `건수` from `Sales` GROUP BY `uid`;
select `uid`, SUM(`sale`) as `합계` from `Sales` GROUP BY `uid`;
select `uid`, AVG(`sale`) as `평균` from `Sales` group by `uid`;

select `uid`, `year`, SUM(`sale`) as `합계`
from `Sales`
GROUP BY `uid`, `year`;

select `uid`, `year`, SUM(`sale`) as `합계`
from `Sales`
GROUP BY `uid`, `year`
ORDER BY `year` ASC, `합계` DESC;

select `uid`, `year`, SUM(`sale`) as `합계`
from `Sales`
WHERE `sale` >= 50000
GROUP BY `uid`, `year`
order by `합계` desc;

#실습 4-11
select `uid`, SUM(`sale`) as `합계` 
from `Sales` 
GROUP BY `uid`
HAVING `합계` >= 200000;      	# 20만원 이상만 조회
#실습 4-12
create table `Sales2` like `Sales`;  # 테이블 복사 sales - sales2 로 복사
insert into `Sales2` select *from `Sales`; #데이터복사

set sql_safe_updates=0; #조건 없이 update 모드 해제
update `Sales2` SET `year` = `year` + 3;

select * from `Sales` where `sale` >= 100000
UNION 
select * from `SaleS2` where `sale` >= 100000; # `Sales 와 Sales2의 sale 데이터를 합쳐서보여줌 

select `uid`, `year`, `sale` from Sales
UNION 
select `uid`, `year`, `sale` from Sales2;

select `uid`, `year`, SUM(`sale`) as `합계`
from `Sales`
GROUP BY `uid`, `year`
UNION
select `uid`, `year`, SUM(`sale`) as `합계`
from `Sales2`
GROUP BY `uid`, `year`
order by `year` asc, `합계` desc;

#실습 4-13
select * from `Sales` 
INNER JOIN `member` ON `Sales` .`uid` = `Member`. `uid`;
select * from `Member` 
INNER JOIN `Department` ON `Member`.dep = `Department`.depNo;


select * from `Sales` as a #a라는 별칭줌
join `member` as b #b라는 별칭줌
on a.uid = b.uid;

select * from `Member` as a
join `Department` as b
on a.dep = b.depNo;

select 
	a.`no`, 
	a.`uid`,
	a.`sale`, 
    b.`name`,
    b. `pos`
    from `Sales` as a
    join `member` as b
    on a.`uid` = b.`uid`;
select 
	a.`no`,
    a.`uid`,
    a.`sale`,
    b.`name`,
	b.`pos`
from `Sales` as a 
join `Member` as b 
using (`uid`);

select 
	a.`no`,
	a.`uid`,
    a.`sale`,
    b.`name`,
    b.`pos`
    from `Sales` as a
    join `member` as b
    on a.`uid` = b.`uid`
    where `sale` >= 100000;
   
   select
	a.`no`,
	a.`uid`,
    b.`name`,
    b.`pos`,
    b.`yaer`,
    SUM(`Sale`) as `합계` 
    from `Sales` as a
    join `Member` as b
    on a.`uid` = b.`uid`
    GROUP BY a.`uid`, a.`year` 
    HAVING `합계` >= 100000
    ORDER BY a.`year` asc, `합계` desc;
    
 

#실습 4-14
select * from `Sales` as a
left join `Member` as b
on a.`uid` = b.`uid`;

select * from `Sales` as a
right join `Member` as b
on a.`uid` = b.`uid`;

select a.`no`, a.`uid`, a.`sale`, b.`name`, b.`pos` 
from `Sales` as a left join member as b using(`uid`);

select a.`no`, a.`uid`, a.`sale`, b.`name`, b.`pos` 
from `Sales` as a right join member as b using(`uid`);
 
 

#실습 4-15

select 
`uid`, 
a.`name` as `직원명`,
 `pos`,
 b.`name` as `부서명` 
 from `member` as a
join `department` as b
on a.dep = b.depNo;

#실습 4-16

select
	SUM(`sale`) as `2019년도 매출합`
from `Sales` as a
join `member` as b
on a.uid = b.uid
 where 
		`year` =2019 and
		`name` = '김유신';
        
#실습 4-17
select 
	b. `name`,
    c. `name`,
    `pos`,
    `year`,
	SUM(`sale`) as `합계` 
from `Sales` as a
join `member` as b on a.uid = b.uid
join `department` as c on b.dep = c.depNo
where `year`=2019 and `sale` >= 50000
group by a.`uid`
having `합계` >= 100000
order by `합계` desc
limit 2;

