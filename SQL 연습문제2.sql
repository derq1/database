CREATE DATABASE `Bank`;
CREATE USER 'bank'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON Bank.* TO 'bank'@'%';
FLUSH PRIVILEGES;

use `Bank`;



CREATE TABLE `bank_customer` (
	`c_no` CHAR(14) primary key,
    `c_name` VARCHAR(20) not null,
    `c_dist` tinyint not null default 0,
    `c_phone` varchar(20) unique not null,
    `c_addr` varchar(100)
    );
    
    create table `bank_account` (
    `a_no` CHAR(11) primary key,
    `a_item_dist` CHAR(2) not null,
    `a_item_name` varchar(20) not null,
    `a_c_no` char(14) not null,
    `a_balance`  int not null default 0,
    `a_open_date` date not null
    );
    
    CREATE TABLE `bank_transaction` (
	`t_no` int auto_increment primary key,
    `t_a_no` CHAR(11) not null,
    `t_dist` tinyint not null,
    `t_amount` int not null default 0,
    `t_datetime` datetime not null
    );
    
    INSERT INTO `bank_customer` VALUES ('102-22-51094', '부산의원', 2, '051-518-1010', '부산시 남구');
    INSERT INTO `bank_customer` VALUES ('220-82-52237', '(주)한국전산', 2, '02-1234-1045', '서울시 강서구');
    INSERT INTO `bank_customer` VALUES ('361-22-42687', '(주)정보산업', 2, '031-563-1253', '경기도 광명시');
    INSERT INTO `bank_customer` VALUES ('730423-1000001', '김유신', 1, '010-1234-1001', '경기도 수원시');
    INSERT INTO `bank_customer` VALUES ('750210-1000002', '김춘추', 1, '010-1234-1002', '경기도 광주시');
	INSERT INTO `bank_customer` VALUES ('830513-2000003', '선덕여왕', 1, '010-1234-1003', '서울시 마포구');
	INSERT INTO `bank_customer` VALUES ('870830-1000004', '강감찬', 1, '010-1234-1004', '서울시 영등포구');
	INSERT INTO `bank_customer` VALUES ('910912-2000005', '신사임당', 1, '010-1234-1005', '강원도 강릉시');
	INSERT INTO `bank_customer` VALUES ('941127-1000006', '이순신', 1, '010-1234-1006', '부산시 영도구');
    
     INSERT INTO `bank_account` VALUES ('101-11-1001', 'S1', '자유저축예금', '730423-1000001', 420000, 2005-07-21);
     INSERT INTO `bank_account` VALUES ('101-11-1003', 'S1', '자유저축예금', '870830-1000004', 53000, 2007-02-17);
     INSERT INTO `bank_account` VALUES ('101-11-2001', 'S1', '자유저축예금', '220-82-52237', 23000000, 2003-04-14);
	 INSERT INTO `bank_account` VALUES ('101-11-2002', 'S1', '자유저축예금', '361-22-42487', 4201000, 2008-12-30);
     INSERT INTO `bank_account` VALUES ('101-11-2003', 'S1', '자유저축예금', '102-22-51094', 8325010, 2010-06-07);
	 INSERT INTO `bank_account` VALUES ('101-12-1002', 'S2', '정기적립예금', '830513-2000003', 1020000, 2011-05-13);
	 INSERT INTO `bank_account` VALUES ('101-13-1005', 'S3', '주택청약예금', '941127-1000006', 720800, 2012-10-15);
	 INSERT INTO `bank_account` VALUES ('101-21-1004', 'L1', '고객신용대출', '910912-2000005', 1200500, 2009-08-25);
	 INSERT INTO `bank_account` VALUES ('101-22-1006', 'L2', '예금담보대출', '730423-1000001', 25000, 2013-12-11);
	 INSERT INTO `bank_account` VALUES ('101-23-1007', 'L3', '주택담보대출', '750210-1000002', 2700000, 2020-09-23);
     
     INSERT INTO `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) VALUES ('101-11-1001', 1, 50000, NOW());
	 INSERT INTO `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) VALUES ('101-11-1003', 2, 120000, NOW());
	 INSERT INTO `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) VALUES ('101-11-2001', 2, 300000, NOW());
	 INSERT INTO `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) VALUES ('101-12-1002', 1, 1000000, NOW());
	 INSERT INTO `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) VALUES ('101-11-1001', 3, 0, NOW());
	 INSERT INTO `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) VALUES ('101-13-1005', 1, 200000, NOW());
	 INSERT INTO `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) VALUES ('101-11-1001', 1, 450000, NOW());
	 INSERT INTO `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) VALUES ('101-11-2002', 2, 32000, NOW());
	 INSERT INTO `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) VALUES ('101-11-2003', 3, 0, NOW());
     INSERT INTO `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) VALUES ('101-11-1003', 1, 75000, NOW());
     
     select * from `bank_account`;

	select * from `









    
    
    
    
    
    
    
    
    
    
    
    
    
    
   