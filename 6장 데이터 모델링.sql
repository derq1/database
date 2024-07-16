#날짜 : 2024/07/15
#이름 : 박서홍
#내용 : 데이터 모델링 실습하기

#실습 6-2
insert into `customer` values ('c101', '김유신', '010-1234-1001', '경남 김해시', '2023-01-01');
insert into `customer` values ('c102', '김춘추', '010-1234-1002', '경남 경주시', '2023-01-02');
insert into `customer` values ('c103', '장보고', '010-1234-1003', '전남 완도군', '2023-01-03');
insert into `customer` values ('c104', '강감찬', '010-1234-1004', '서울시 관악구', '2023-01-04');
insert into `customer` values ('c105', '이순신', '010-1234-1005', '부산시 금정구', '2023-01-05');

insert into `product` values (1, '새우깡', 5000, 1500, '농심');
insert into `product` values (2, '초코파이', 2500, 2500, '오리온');
insert into `product` values (3, '포카칩', 3600, 1700, '오리온');
insert into `product` values (4, '양파링', 1250, 1800, '농심');
insert into `product` values (5, '죠리퐁', 2200, null, '크라운');

insert into `order` set `orderId`='c102', `orderProduct` = 3, `orderCount`=2, `orderDate`=now();
insert into `order` set `orderId`='c101', `orderProduct` = 4, `orderCount`=1, `orderDate`=now();
insert into `order` set `orderId`='c102', `orderProduct` = 1, `orderCount`=1, `orderDate`=now();
insert into `order` set `orderId`='c105', `orderProduct` = 2, `orderCount`=1, `orderDate`=now();

insert into `order` set `orderNo`=11, `orderId`='c103', `orderProduct` = 6, `orderCount`=5, `orderDate`=now();

#실습 6-3 다음데이터를 조회하시오

#모든 주문의 주문번호, 주문한 고객명, 주문한 상품명, 주문 수량, 주문일을 조회하시오.
select 
`orderNo`,
`name`,
`prodName`,
`orderCount`,
`orderDate`
from `Order` as a
join `customer` as b on a.orderId = b.custId
join `product` as c on a.orderProduct = c.proNo;


# 김유신이 주문한 상품의 주문번호, 상품번호, 상품명, 가격, 주문수량, 주문일을 조회하시오.

select
`orderNo`,
`name`,
`prodName`,
`orderCount`,
`orderDate`
from `Order` as a
join `customer` as b on a.orderId = b.custId
join `product` as c on a.orderProduct = c.prodNo
where `name` = '김유신';

#주문한 상품의 총 주문 금액을 조회하시오.
select
	sum(`price` * `orderCount`)
    from `order` as a
    join `product` as b on a.orderProduct = b.prodNo;
    
    #실습 6-4 
    -- BankERD 모델링 실습
    
    #실습 6-5
    insert into `bank_customer` values ('730423-1000001', '김유신', 1, '010-1234-1001', '경남 김해시');
	insert into `bank_customer` values ('730423-1000002', '김춘추', 1, '010-1234-1002', '경남 경주시');
	insert into `bank_customer` values ('750423-1000003', '장보고', 1, '010-1234-1003', '전남 완도군');
   	insert into `bank_customer` values ('102-12-51094', '(주)정보산업', 2, '051-500-1004', '부산시 부산진구');
	insert into `bank_customer` values ('930423-1000005', '이순신', 1, '010-1234-1005', '서울 종로구');
    
    insert into `bank_account` values ('101-11-1001', 'S1', '자유저축예금', '730423-1000001', 1550000, '2011-04-11');
    insert into `bank_account` values ('101-11-1002', 'S1', '자유저축예금', '930423-1000005', 260000, '2011-05-12');
    insert into `bank_account` values ('101-11-1003', 'S1', '자유저축예금', '750423-1000003', 75000, '2011-06-13');
    insert into `bank_account` values ('101-12-1001', 'S2', '기업전용예금', '102-12-51094', 15000000, '2011-07-14');
    insert into `bank_account` values ('101-13-1001', 'S3', '정기저축예금', '730423-1000002', 1200000, '2011-08-15');
    
    
    SET foreign_key_checks = 0;
    
    insert into `bank_transaction` values (1, '101-11-1001', 1, 50000, '2023-01-01');
    insert into `bank_transaction` values (2, '101-12-1001', 2, 1000000, '2023-01-02');
    insert into `bank_transaction` values (3, '101-11-1002', 3, 260000, '2023-01-03');
    insert into `bank_transaction` values (4, '101-11-1002', 2, 100000, '2023-01-04');
    insert into `bank_transaction` values (5, '101-11-1003', 3, 75000, '2023-01-05');
    insert into `bank_transaction` values (6, '101-11-1001', 1, 150000, '2023-01-05');
    SET foreign_key_checks = 1; 
    
    
    
	
    
    
	







