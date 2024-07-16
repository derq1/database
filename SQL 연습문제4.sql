#날짜 : 2024/07/10
#이름 : 박서홍
#내용 : SQL 연습문제4

CREATE DATABASE `Theater`;
CREATE USER 'theater'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON Theater.* TO 'theater'@'%';
FLUSH PRIVILEGES;
use `Theater`;

create table `Movies` (
`movie_id` int auto_increment primary key,
`title` varchar(30) not null,
`genre` varchar(10) not null,
`release_date` date 
);

 create table `Customers` (
 `customer_id` int auto_increment primary key,
 `name` varchar(20) not null,
 `email` varchar(50) not null,
 `phone` char(13) not null
 );
 
 create table `Bookings` (
 `booking_id` int primary key,
 `customer_id` int ,
 `movie_id` int ,
 `num_tickets` int ,
 `booking_date` datetime 
 );
 
 
insert into `Movies` values (1, '쇼생크의 탈출', '드라마', '1994-10-14');
insert into `Movies` values (2, '타이타닉', '로맨스', '1997-03-24');
insert into `Movies` values (3, '탑건', '액션', '1987-07-16');
insert into `Movies` values (4, '쥬라기공원', '액션', '1994-02-11');
insert into `Movies` values (5, '글래디에이터', '액션', '2000-05-03');
insert into `Movies` values (6, '시네마천국', '드라마', '1995-04-12');
insert into `Movies` values (7, '미션임파서블', '액션', '1995-11-11');
insert into `Movies` values (8, '노트북', '로맨스', '2003-08-23');
insert into `Movies` values (9, '인터스텔라', 'SF', '2011-05-26');
insert into `Movies` values (10, '아바타', 'SF', '2010-02-10');

 insert into `Customers` values (1, '김유신', 'kys@example.com', '010-1234-1001');
 insert into `Customers` values (2, '김춘추', 'kcc@example.com', '010-1234-1002');
 insert into `Customers` values (3, '장보고', 'jbg@example.com', '010-1234-1003');
 insert into `Customers` values (4, '강감찬', 'kgc@example.com', '010-1234-1004');
 insert into `Customers` values (5, '이순신', 'lss@example.com', '010-1234-1005');
 
insert into `Bookings` values (101, 1, 1, 2, '2023-01-10');
insert into `Bookings` values (102, 2, 2, 3, '2023-01-11');
insert into `Bookings` values (103, 3, 2, 2, '2023-01-13');
insert into `Bookings` values (104, 4, 3, 1, '2023-01-17');
insert into `Bookings` values (105, 5, 5, 2, '2023-01-21');
insert into `Bookings` values (106, 3, 8, 2, '2023-01-21');
insert into `Bookings` values (107, 1, 10, 4, '2023-01-21');
insert into `Bookings` values (108, 2, 9, 1, '2023-01-22');
insert into `Bookings` values (109, 5, 7, 2, '2023-01-23');
insert into `Bookings` values (110, 3, 4, 2, '2023-01-23');
insert into `Bookings` values (111, 1, 6, 1, '2023-01-24');
insert into `Bookings` values (112, 3, 5, 3, '2023-01-25');

#실습4-4 모든 영화의 제목을 조회하시오.
select title FROM `Movies`;

#실습 4-5 '로맨스' 장르의 모든 영화 제목을 조회하시오.
select * from Movies where `genre` = '로맨스';

#실습 4-6 개봉일이 2010년 이후인 모든 연화의 제목과 개봉일을 조회하시오.
select
	title,
    release_date
    from Movies where release_date > '2010-01-01'; 
    
    #실습 4-7 예매된 티켓 수가 3장 이상인 예약 ID와 예약일자를 조회하시오.
    select
		booking_id, booking_date
        from Bookings where num_tickets >= 3;
	
    #실습 4-8 예약일자가 '2023-01-20' 이전 예약 ID와 고객 ID를 조회하시오.
    select * from Bookings where booking_date <'2023-01-20';
    
    #실습 4-9 90년대 영화를 조회하시오. ※
    select * from Movies where release_date between'1990-01-01' and'1999-12-31';
    
    #실습 4-10 가장 최근에 이루어진 예매 3건의 예약 ID와 예약일자를 조회하시오. ※
    select * from Bookings
    order by booking_date desc
    LIMIT 3;
    
    #실습4-11 개봉일이 가장 오래된 영화의 제목과 개봉일을 조회하시오.
    select title, release_date from Movies
    order by release_date asc
    limit 1;
    
    #실습 4-12 '액션' 장르의 영화 제목과 개봉일을 문자열 결합하여 조회하고, 제목에 공원'이 포함된 영화만 선택하여 개봉일 기준 오름차순으로 정렬한 후, 상위 1개만 조회하시오.
    select
		concat(title, ' - ', release_date) as movie_info
        from Movies
        where genre = '액션' and title like '%공원%'
        order by release_date asc
        limit 1;
        
        # 실습 4-13 고객 id가 2인 고객이 한 예매의 예약일자와 예매한 영화 제목을 함께 조회하시오. ※
        select booking_date, title
        from Bookings 
        join Movies 
        using (movie_id)
        where customer_id = 2;
        
        # 실습 4-14 영화를 예매한 고객 이름, 휴대폰, 예매일자, 예매한 영화제목을 조회하시오.
        select
		C.name,
		C.phone,
		B.booking_date,
		M.title
        from bookings B
        join Customers C on b.customer_id = C.customer_id
        join Movies M on B.movie_id = M.movie_id;
       
        # 실습 4-15 장르별로 평균 예매 티켓 수를 조회하시오.
        select
			M.genre,
			AVG(B.num_tickets) as avg_tickets
        from bookings B
        join Movies M on B.movie_id = M.movie_id
		GROUP BY M.genre;
        
        
        # 실습 4-16 고객별 평균 예매 티켓 수를 조회하시오.
        select
			C.name,
            avg(B.num_tickets) as avg_tickets
		from Bookings B
        join Customers C on B.customer_id = C.customer_id
        GROUP BY C.name;
        
        #실습4-17 고객별 전체 예매 티켓 수가 가장 많은 고객순으로 이름과, 전체 티켓수를 조회하시오.
        select
			c.name,
            sum(B.num_tickets) as `전체 예매 티켓 수`
            from bookings B
            join Customers C on B.customer_id = C.customer_id
            group by C.customer_id
            order by `전체 예매 티켓 수` desc;
            
            #실습 4-18 예매일자가 가장 오래된 예매번호, 영화번호, 고객이름, 예매일을 조회하시오.
            select
            B.booking_id,
			B.movie_id,
			C.name,
			B.booking_date
            from Bookings B
            join Customers C on B.customer_id = C.customer_id
            order by B.booking_date asc
            limit 1;
            
            # 실습 4-19 각 영화의 장르별로 개봉일이 가장 최근인 영화의 제목을 조회하시오.
            select 
            genre, title, release_date
            from Movies
            where (genre, release_date) in 
            (select genre, MAX(release_date)
            from Movies
            group by genre
            );
            
            # 실습 4-20 '김유신' 고객이 예매한 모든 영화정보를 조회하시오.
            select * from movies
            where movie_id in (
            select movie_id from Bookings
            where customer_id = (select customer_id from Customers where name = '김유신')
            );
            # 실습 4-21 예매한 영화 중 가장 많은 티켓을 예매한 고객의 이름과 이메일 조회하시오.
            select name, email from Customers
            where customer_id = (
            select customer_id
            from Bookings
            group by customer_id
            order by sum(num_tickets) desc
            limit 1
            );
            
            # 실습 4-22 예약된 티켓 수가 평균 예매 티켓 수보다 많은 예매정보를 조회하시오.
            select * from bookings
            where num_tickets > (select avg(num_tickets) from Bookings);
            
            # 실습 4-23 각 영화별로 예매된 총 티켓 수를 조회하시오.
            select
            M.title, sum(B.num_tickets) as total_tickets
            from Bookings B
            join Movies M on B.movie_id = M.movie_id
            group by title;
            
            # 실습 4-24 각 고객별로 예매한 총 티켓 수와 평균 티켓 수를 조회하시오.
            
            select
            c.name,
            SUM(b.num_tickets) as total_tickets,
            avg(b.num_tickets) as avg_tickets
            from Bookings b
            join Customers c on b.customer_id = C.customer_id
            group by c.name;
            
            # 실습 4-25 예매 티켓 수가 가장 많은 고객의 아이디와 이름, 이메일을 조회하시오.
            select
				c.customer_id,
                c.name,
                c.email,
                sum(b.num_tickets) as `예매 티켓수`
                from Bookings b
                join Customers c on b.customer_id = c.customer_id
                group by c.customer_id
                order by `예매 티켓수` desc;
                
                # 실습 4-26 예매된 티켓 수가 가장 큰 순서로 고객명, 영화제목, 예매 티켓수, 예매일을 조회하시오.
                select
                c.name,
                m.title,
                b.num_tickets,
                b.booking_date
                from bookings b
                join customers c on b.customer_id = c.customer_id
                join movies m on b.movie_id = m.movie_id
                order by num_tickets desc;
                
                # 실습 4-27 장르가 '액션'이고 평균 예매 티켓 수가 가장 높은 순으로 영화의 제목을 조회하시오.
                select
                M.title,
                M.genre,
                sum(b.num_tickets) as `예매 티켓 수`,
                avg(b.num_tickets) as `평균 티켓 수`
                from bookings B
                join Movies M on B.movie_id = M.movie_id
                where M.genre = '액션'
                group by M.title
                order by `평균 티켓 수` desc;
                
                #실습 4-28 회원별 예매 티켓 수가 큰 순서로 고객아이디, 고객명, 티켓 총합 조회하시오.
                select
                B.customer_id,
                C.name,
                sum(`num_tickets`) as `ticket_total`
                from  bookings B
                join Customers C on B.customer_id = C.customer_id
                group by customer_id
                order by ticket_total desc;
                
                #실습 4-29 각 영화별로 예약된 티켓 수가 가장 많은 예매 ID, 고객 ID, 최대 티켓 수를 조회하시오.
                select
                B.booking_id,
                B.customer_id,
                B.movie_id,
                Maxtickets.max_tickets
                from Bookings B
                join (
                select movie_id, MAX(num_tickets) as max_tickets
                from Bookings
                GROUP BY movie_id
                ) as Maxtickets
                on B.movie_id = Maxtickets.movie_id and b.num_tickets = Maxtickets.max_tickets;
                
                # 실습 4-30 각 장르별로 예매 티켓 수가 가장 많은 영화정보의 예매번호, 고객아이디, 고객명,
					# 영화제목, 장르, 예매 티켓 수를 조회하시오. 단 예매 티켓 수로 내림차순 정렬
                    
                    select
                    B.booking_id,
                    B.customer_id,
                    C.name,
                    M.title,
                    M.genre,
                    SUM(B.num_tickets) AS `예매 티켓 수`
FROM bookings B
JOIN movies M ON B.movie_id = M.movie_id
JOIN customers C ON B.customer_id = C.customer_id
GROUP BY M.title
HAVING `예매 티켓 수` = (
SELECT MAX(total_tickets)
FROM (
SELECT SUM(B2.num_tickets) AS total_tickets
FROM Bookings B2
JOIN Movies M2 ON B2.movie_id = M2.movie_id
WHERE M2.genre = M.genre
GROUP BY M2.title
) AS SelectMAX
)
ORDER BY `예매 티켓 수` DESC;

	
