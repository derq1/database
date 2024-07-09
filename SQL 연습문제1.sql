create database `Shop`;
create user 'shop'@'%' identified by '1234';
grant all privileges on `Shop`.* to 'shop'@'%';
flush privileges;