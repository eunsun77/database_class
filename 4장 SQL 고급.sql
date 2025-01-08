#날짜 : 2025/01/08
#이름 : 이은선
#내용 : 4장 SQL 고급

use Studydb;
create table `Member` (
	`uid` VARCHAR(10) PRIMARY KEY,
	`name` VARCHAR(10) not null, 
	`hp` CHAR(13) unique not null,
	`pos` VARCHAR(10) default'사원',
    `deq` INT, 
	`rdate` datetime not null
); 

create table `Department` (
	`depNo` INT PRIMARY KEY,
	`name` VARCHAR(10) not null, 
	`tel` CHAR(12) not null
); 

create table `Sales` (
	`seq` int auto_increment not null PRIMARY KEY,
	`uid` VARCHAR(10) not null, 
	`year` YEAR NOT NULL,
	`month` INT NOT NULL,
    `sale` INT DEFAULT NULL   
); 


insert into `Member` values ('a101', '박혁거세', '010-1234-1001', '부장', 101, now());
insert into `Member` values ('a102', '김유신', '010-1234-1002', '차장', 101, now());
insert into `Member` values ('a103', '김춘추', '010-1234-1003', '사원', 101, now());
insert into `Member` values ('a104', '장보고', '010-1234-1004', '대리', 102, now());
insert into `Member` values ('a105', '강감찬', '010-1234-1005', '과장', 102, now());
insert into `Member` values ('a106', '이성계', '010-1234-1006', '차장', 103, now());
insert into `Member` values ('a107', '정철', '010-1234-1007', '차장', 103, now());
insert into `Member` values ('a108', '이순신', '010-1234-1008', '부장', 104, now());
insert into `Member` values ('a109', '허균', '010-1234-1009', '부장', 104, now());
insert into `Member` values ('a110', '정약용', '010-1234-1010', '사원', 105, now());
insert into `Member` values ('a111', '박지원', '010-1234-1011', '사원', 105, now());

insert into `department` values (101, '영업1부', '051-512-1001');
insert into `department` values (102, '영업2부', '051-512-1002');
insert into `department` values (103, '영업3부', '051-512-1003');
insert into `department` values (104, '영업4부', '051-512-1004');
insert into `department` values (105, '영업5부', '051-512-1005');
insert into `department` values (106, '영업지원부', '051-512-1006');
insert into `department` values (107, '인사부', '051-512-1007');

insert into `sales` (`uid`, `year`, `month`, `sale`) values ('a101', 2018, 1, 98100);
insert into `sales` (`uid`, `year`, `month`, `sale`) values ('a102', 2018, 1, 136000);
insert into `sales` (`uid`, `year`, `month`, `sale`) values ('a103', 2018, 1, 80100);
insert into `sales` (`uid`, `year`, `month`, `sale`) values ('a104', 2018, 1, 78000);
insert into `sales` (`uid`, `year`, `month`, `sale`) values ('a105', 2018, 1, 93000);

insert into `sales` (`uid`, `year`, `month`, `sale`) values ('a101', 2018, 2, 23500);
insert into `sales` (`uid`, `year`, `month`, `sale`) values ('a102', 2018, 2, 126000);
insert into `sales` (`uid`, `year`, `month`, `sale`) values ('a103', 2018, 2, 18500);
insert into `sales` (`uid`, `year`, `month`, `sale`) values ('a104', 2018, 2, 19000);
insert into `sales` (`uid`, `year`, `month`, `sale`) values ('a105', 2018, 2, 53000);

insert into `sales` (`uid`, `year`, `month`, `sale`) values ('a101', 2019, 1, 24000);
insert into `sales` (`uid`, `year`, `month`, `sale`) values ('a102', 2019, 1, 109000);
insert into `sales` (`uid`, `year`, `month`, `sale`) values ('a103', 2019, 1, 101000);
insert into `sales` (`uid`, `year`, `month`, `sale`) values ('a104', 2019, 1, 53500);
insert into `sales` (`uid`, `year`, `month`, `sale`) values ('a105', 2019, 1, 24000);

insert into `sales` (`uid`, `year`, `month`, `sale`) values ('a101', 2019, 2, 160000);
insert into `sales` (`uid`, `year`, `month`, `sale`) values ('a102', 2019, 2, 101000);
insert into `sales` (`uid`, `year`, `month`, `sale`) values ('a103', 2019, 2, 43000);
insert into `sales` (`uid`, `year`, `month`, `sale`) values ('a104', 2019, 2, 24000);
insert into `sales` (`uid`, `year`, `month`, `sale`) values ('a105', 2019, 2, 109000);

insert into `sales` (`uid`, `year`, `month`, `sale`) values ('a101', 2020, 1, 201000);
insert into `sales` (`uid`, `year`, `month`, `sale`) values ('a102', 2020, 1, 63000);
insert into `sales` (`uid`, `year`, `month`, `sale`) values ('a103', 2020, 1, 74000);
insert into `sales` (`uid`, `year`, `month`, `sale`) values ('a104', 2020, 1, 122000);
insert into `sales` (`uid`, `year`, `month`, `sale`) values ('a105', 2020, 1, 111000);

insert into `sales` (`uid`, `year`, `month`, `sale`) values ('a101', 2020, 2, 120000);
insert into `sales` (`uid`, `year`, `month`, `sale`) values ('a102', 2020, 2, 93000);
insert into `sales` (`uid`, `year`, `month`, `sale`) values ('a103', 2020, 2, 84000);
insert into `sales` (`uid`, `year`, `month`, `sale`) values ('a104', 2020, 2, 180000);
insert into `sales` (`uid`, `year`, `month`, `sale`) values ('a105', 2020, 2, 76000);

#실습 4-3 
select * from `Member` where `name` = '김유신';
select * from `Member` where `name` <> '김춘추';
select * from `Member` where `pos` in ('사원', '대리');
select * from `Member` where `pos` = '사원' or `pos` = '대리';
select * from `Member` where `name` like `%신`; #신으로 끝나느 이름
select * from `Member` where `name` like `정_`; #정으로 시작하고 이름이 두글자. 세글자 이상은 안나옴.


#실습 4-4
select * from `Sales` order by `sale`;
select * from `Sales` order by `sale` ASC;
select * from `Sales` order by `sale` DESC;

#실습 4-5
select * from `Sales` limit 3;
select * from `Sales` limit 0, 3; #(인덱스, 사이즈 0부터 3번째까지)
select * from `Sales` limit 1, 2; #(인덱스, 사이즈 1부터 2번째까지니까 2,3

#실습 4-6
select SUM(`sale`) as `합계` from `Sales`;
select CEILiNG(1.2);
select CEILiNG(1.8);
SELECT RAND();
SELECT CEILING(RAND() * 10);

SELECT LEFT('HelloWorld', 5);
SELECT RIGHT('HelloWorld', 5);
SELECT SUBSTRING('HelloWorld', 6, 5);
SELECT CONCAT('Hello', 'World');
SELECT CONCAT(`uid`, `name`, `hp`) FROM `member` WHERE `uid`='a108';