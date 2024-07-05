#날짜 : 2024/07/01
#이름 : 박서홍
#내용 : 2장 SQL 기본

#실습 2-1. 테이블 생성, 제거
use StudyDB;

CREATE TABLE `User1` (
	`uid` VARCHAR(10),
    `name` VARCHAR(10),
    `hp` CHAR(13),
    `age` INT
    );
    
    DROP TABLE `User1`;
    
    #실습 2-2. 데이터 입력
    user1user1INSERT INTO `User1` VALUES ('A101', '김유신', '010-1234-1111', 25);
	INSERT INTO `User1` VALUES ('A102', '김춘추', '010-1234-2222', 23);
	INSERT INTO `User1` VALUES ('A103', '장보고', '010-1234-3333', 32);
	INSERT INTO `User1` (`uid`, `name`, `age`) VALUES ('A104', '강감찬',45);
    INSERT INTO `User1` SET 
							`uid`='A105', 
							`name`='이순신',
							`hp`='010-1234-5555';
	#실습 2-3. 데이터 조회
    SELECT * FROM `User1`;
    SELECT * FROM `User1` WHERE `uid`='A101';
    SELECT * FROM `User1` WHERE `name`='김춘추';
    SELECT * FROM `User1` WHERE `age` < 30;
    SELECT * FROM `User1` WHERE `age` >= 30;
    SELECT `uid`, `name`, `age` FROM `User1`;
    
    #실습 2-4. 데이터 수정
    UPDATE `User1` SET `hp`='010-1234-4444' WHERE `uid`='A104';
    UPDATE `User1` SET `age`=51 WHERE `uid`='A105';
    UPDATE `User1` SET `hp`='010-1234-1001', `age`=27 WHERE `uid`='A101';
    set sql_safe_updates=0;
    
   #실습 2-5. 데이터 삭제
    DELETE FROM `User1` WHERE `uid`='A101';
    DELETE FROM `User1` WHERE `uid`='A102' AND `age`=25;
    DELETE FROM `User1` WHERE `age` >=30;
    set sql_safe_updates=0;
    
    #실습 2-6. 테이블 컬럼 수정
	ALTER TABLE `User1` ADD `gender` TINYINT;
	ALTER TABLE `User1` ADD `birth` CHAR(10) AFTER `name`;
	ALTER TABLE `User1` MODIFY `gender` CHAR(1);
	ALTER TABLE `User1` MODIFY `age` TINYINT;
	ALTER TABLE `User1` DROP `gender`;
    
    #실습 2-7. 테이블 복사
CREATE TABLE `User1Copy` LIKE `User1`;
INSERT INTO `User1Copy` SELECT * FROM `User1`;

    
    #실습 2-8.
    create table `TblUser` (
	`user_id`	VARCHAR(10),
	`user_name`	VARCHAR(10),
	`user_hp`	CHAR(13),
	`user_age`	TINYINT,
	`user_addr`	VARCHAR(100)
    );
    
     INSERT INTO `TblUser` VALUES ('p101', '김유신', '010-1234-1001', 25, '경남 김해시');
     INSERT INTO `TblUser` VALUES ('p102', '김춘추', '010-1234-1002', 23, '경남 경주시');
	 INSERT INTO `TblUser` VALUES ('p103', '장보고', NULL, 31, '전남 완도군');
     INSERT INTO `TblUser` VALUES ('p104', '강감찬', '서울시 중구');
     INSERT INTO `TblUser` VALUES ('p105', '이순신', '010-1234-1005', 50, NULL);


   
    
    
    
    
    
    
    
	
    