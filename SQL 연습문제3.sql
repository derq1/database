#날짜 : 2024/07/10
#이름 : 박서홍
#내용 : SQL 연습문제3


#실습 3-1
create database `College`;
create user 'college'@'%' identified by '1234';
grant all privileges on College.* to 'college'@'%';
flush privileges;
use `college`;

#실습 3-2 아래 표를 참고하여 테이블을 생성하시오.
create table `Student` (
	`stdNo` char(8) primary key,
    `stdName`varchar(20) not null,
    `stdHp` char(13) not null,
    `stdYear` tinyint not null,
    `stdAddress` varchar(100) default null
    );
    
    
   create table `Lecture` (
		`lecNo` int primary key not null,
        `lecName` varchar(20) not null,
        `lecCredit` tinyint not null,
        `lecTime` tinyint not null,
        `lecClass` varchar(10) default null
        );
        
        create table `Register` (
			`regStdNo` char(8) not null,
            `regLecNo` int not null,
            `regMidScore` int default null,
            `regFinalScore` int default null,
            `regTotalScore` int default null,
            `regGrade` char(1) default null
            );
            
        #실습 3-3 테이블에 아래 그림과 같이 데이터를 입력하시오.
        
        insert into `student` values ('20201016', '김유신', '010-1234-1001', 3 , null);
        insert into `student` values ('20201126', '김춘추', '010-1234-1002', 3 , '경상남도 경주시');
        insert into `student` values ('20210216', '장보고', '010-1234-1003', 2 , '전라남도 완주시');
        insert into `student` values ('20210326', '강감찬', '010-1234-1004', 2 , '서울시 영등포구');
        insert into `student` values ('20220416', '이순신', '010-1234-1005', 1 , '부산시 부산진구');
        insert into `student` values ('20220521', '송상현', '010-1234-1006', 1 , '부산시 동래구');
        
        insert into `Lecture` values (159, '인지행동심리학', 3, 40, '본304');
        insert into `Lecture` values (167, '운영체제론', 3, 25, '본805');
        insert into `Lecture` values (234, '중급 영문법', 3, 20, '본201');
        insert into `Lecture` values (239, '세법개론', 3, 40, '본204');
        insert into `Lecture` values (248, '빅데이터 개론', 3, 20, '본801');
        insert into `Lecture` values (253, '컴퓨팅사과와 코딩', 2, 10, '본802');
        insert into `Lecture` values (349, '사회복지 마케팅', 2, 50, '본301');
        
        insert into `Register` values ('20201126', 234, null, null, null, null);
        insert into `Register` values ('20201016', 248, null, null, null, null);
        insert into `Register` values ('20201016', 253, null, null, null, null);
        insert into `Register` values ('20201126', 239, null, null, null, null);
        insert into `Register` values ('20210216', 349, null, null, null, null);
        insert into `Register` values ('20210326', 349, null, null, null, null);
        insert into `Register` values ('20201016', 167, null, null, null, null);
        insert into `Register` values ('20220416', 349, null, null, null, null);
   
   
#실습 3-4 강좌를 조회하시오.
select * from `lecture`;

#실습 3-5 학생을 조회하시오.
select * from `student`;

#실습 3-6 수강신청 내역을 조회하시오.
select * from `Register`;

#실습 3-7  3학년 학생을 조회하시오.
select * from `Student` where `stdYear` = 3;

#실습 3-8 2학점 짜리 강좌를 조회하시오.
select * from `Lecture` where `lecCredit` = 2;

#실습 3-9 아래와 같이 중간고사, 기말고 점수를 입력 후 조회하시오.
#Edit > Preferences > safe update 체크 해제 후 다시 로이인 후 실행 또는 밑에 
set sql_safe_updates = 0;


 UPDATE `Register` SET `regMidScore` = 36, `regFinalScore`= 42 WHERE
`regStdNo`='20201126' AND `regLecNo`=234;
UPDATE `Register` SET `regMidScore`= 24, `regFinalScore` = 62 where 
`regStdNo`='20201016' and `regLecNo`=248; 
UPDATE `Register` SET `regMidScore`= 28, `regFinalScore` = 40 where 
`regStdNo`='20201016' and `regLecNo`=253; 
UPDATE `Register` SET `regMidScore`= 37, `regFinalScore` = 57 where 
`regStdNo`='20201126' and `regLecNo`=239; 
UPDATE `Register` SET `regMidScore`= 28, `regFinalScore` = 68 where 
`regStdNo`='20210216' and `regLecNo`=349; 
UPDATE `Register` SET `regMidScore`= 16, `regFinalScore` = 65 where 
`regStdNo`='20210326' and `regLecNo`=349;
UPDATE `Register` SET `regMidScore`= 18, `regFinalScore` = 38 where 
`regStdNo`='20201016' and `regLecNo`=167;  
UPDATE `Register` SET `regMidScore`= 25, `regFinalScore` = 58 where 
`regStdNo`='20220416' and `regLecNo`=349; 

#실습 3-10 아래와 같이 총점과 등급을 입력 후 조회하시오.
update `Register` set
`regTotalScore`= `regMidScore` + `regFinalScore`,
`regGrade` = if(`regTotalScore` >= 90, 'A',
			 if(`regTotalScore` >= 80, 'B',
			 if(`regTotalScore` >= 70, 'C',
			 if(`regTotalScore` >= 60, 'D', 'F'))));
select * from `Register`;

#실습 3-11 점수가 큰 순서로 정렬하시오.
select * from `Register` order by `regTotalScore` desc;

#실습 3-12 강좌번호가 349번이면서 총점이 가장 큰 순서로 조회하시오.
select * from `Register` where `regLecNo` = 349 order by `regTotalScore` desc;

#실습 3-13  30시간 이상인 강좌를 조회하시오.
select * from `Lecture` where `lecTime` >= 30;

#실습 3-14 강좌명과 강의실을 조회하시오.※
select `lecName`, `lecClass` from `lecture`;

#실습 3-15 학번과 이름을 조회하시오.
select `stdNo`, `stdName` from `student`;

#실습 3-16 주소를 입력하지 않은 학생을 조회하시오.
select * from `Student` where `stdAddress` is null;

#실습 3-17 부산에 거주하는 학생을 조회하시오.※
select * from `Student` where `stdAddress` like '부산%';


#실습 3-18 학생과 수강 테이블을 결합하시오. 단 수강신청 하지 않아 점수가 없어도 조회 될 것
select * from `Student` as a left join `Register` as b on a.stdNo = b.regStdNo;

#실습 3-19 아래와 같이 조회하시오.

select 
`stdNo`,
`stdName`,
`regLecNo`,
`regMidScore`,
`regFinalScore`,
`regTotalScore`,
`regGrade`
from 
`Student` as a, `Register` as b 
where a.stdNo = b.regStdNo;

#실습 3-20 강좌번호 349를 수강 신청한 학생의 이름과 학번을 조회하시오. ※
select `stdName`, `stdNo`, `regLecNo`
from `Student` as a
join `Register` as b
on a.stdNo = b.regStdNo where `regLecNo` = 349 ;

#실습 3-21 학생별 수강 신청 건수와 모든 수강과목의 전체점수 합계, 평균을 조회하시오.※
select
	`stdNo`,
    `stdName`,
    count(`stdNo`) as `수강신청건수`,
    sum(`regTotalScore`) as `종합점수`,
    sum(`regTotalScore`) / count(`stdno`) as `평균`
    from `Student` as a
    join `Register` as b
    on a.stdNo = b.regStdNo
    group by `stdNo`;

#실습 3-22 수강 테이블과 강좌 테이블을 결합하시오.
select * from `Register` as a
join `Lecture` as b
on a.regLecNo = b.lecNo;

#실습 3-23 아래와 같이 조회하시오.
select
`regStdNo`,
`regLecNo`,
`lecName`,
`regMidScore`,
`regFinalScore`,
`regTotalScore`,
`regGrade`
from 
	`Register` as a
join 
	`Lecture` as b
on a.regLecNo = b.lecNo;


#실습 3-24 '사회복지 마케팅' 강좌를 신청한 건수와 평균을 조회하시오.
SELECT
COUNT(*) AS `사회복지 마케팅 수강 신청건수`,
AVG(`regTotalScore`) AS `사회복지 마케팅 평균`
FROM `Register` AS a JOIN `Lecture` AS b ON a.regLecNo = b.lecNo
where `lecName` = '사회복지 마케팅';


#실습 3-25 'A' 등급을 받은 학번과 강좌명을 조회하시오. ※※
select
	`regStdNo`,
    `lecName`
from `Register` as a 
join `Lecture` as b 
on a.regLecNo = b.lecNo
where `regGrade` = 'A';


#실습 3-26 학생테이블과 수강테이블 그리고 강좌테이블을 결합하시오.
select * from `Student` as a
join `register` as b
on a.stdNo = b.regStdNo
join `lecture` as c 
on b.regLecNo = c.lecNo;

#실습 3-27 아래와 같이 조회하시오.
select
`stdNo`,
`stdName`,
`lecNo`,
`lecName`,
`regMidScore`,
`regFinalScore`,
`regTotalScore`,
`regGrade`
from `Student` as a
join `Register` as b
on a.StdNo = b.regStdNo
join `lecture` as c
on b.regLecNo = c.lecNo
order by `regGrade`;



#실습 3-28 'F'학점을 받은 학번과 이름, 수강과목명, 점수 그리고 등급을 조회하시오.
select
`stdNo`,
`stdName`,
`lecName`,
`regTotalScore`,
`regGrade`
from `Student` as a
JOIN `Register` AS b
 ON a.stdNo = b.regStdNo
JOIN `Lecture` AS c 
ON b.regLecNo = c.lecNo
WHERE `regGrade` = 'F';
#실습 3-29 학생별 이수학점을 조회하시오. 단 F등급을 받은 과목은 학점으로 인정되지 않음


#실습 3-30 신청과목과 이수과목을 조회하시오. 단 F등급을 받은 과목은 이수과목으로 인정 안됨.


