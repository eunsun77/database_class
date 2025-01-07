#날짜 : 2025/01/07
#이름 : 이은선
#내용 : 3장 테이블 제약조건

#실습 3-1 
CREATE TABLE `User2` (
	`uid` VARCHAR(10) PRIMARY KEY, #pk 설정 바로 하기.
    `name` VARCHAR(10),
    `birth` CHAR(10),
    `addr` VARCHAR(50)
    );
    
#실습 3-2 - pk 제약조건이 설정되어있어서 장보고 A102는 추가 안됨.
insert into `User2` values ('A101', '김유신', '1990-02-03', '김해');
insert into `User2` values ('A102', '김춘추', '1991-02-03', '경주');
insert into `User2` values ('A102', '장보고', '1992-02-03', '완도');
select * from `User2`;
    
#실습 3-3 unique
create table `User3` (
	`uid` VARCHAR(10) PRIMARY KEY, #pk 설정 바로 하기.
	`name` VARCHAR(10),
	`birth` CHAR(10),
	`hp` CHAR(13) unique, #중복되면 안되나 pk는 아닌 키.
	`addr` VARCHAR(50)
); 

insert into `User3` values ('A101', '김유신', '1990-01-01', '010-1001-1001', '김해');
insert into `User3` values ('A102', '김춘추', '1991-01-01', '010-1001-1002', '경주');
insert into `User3` values ('A103', '장보고', '1992-01-01', '010-1001-1003', '완도');
insert into `User3` values ('A104', '장보고', '1992-01-01', NULL, '서울');
insert into `User3` values ('A105', '이순신', '1992-01-01', NULL, '부산');
select * from `User3`;

#실습 3-5 외래키
create table `Parent` (
	`pid` VARCHAR(10) primary key,
    `name` VARCHAR(10),
    `birth` CHAR(10),
    `addr` VARCHAR(100)

);

create table `Clid` (
	`cid` VARCHAR(10) primary key,
    `name` VARCHAR(10),
    `hp` CHAR(13) unique,
    `parent` VARCHAR(10) references `parent` (`pid`) #외래키 설정. 부모 pid와 parent 값이 같음
);

#실습 3-6
insert into `Parent` values ('p101', '김유신', '1986-05-09', '경남 김해시');
insert into `Parent` values ('p102', '김춘추', '1972-11-23', '경남 경주시');
insert into `Parent` values ('p103', '장보고', '1978-03-01', '전남 완도시');
insert into `Parent` values ('p104', '강감찬', '1979-08-16', '서울시 관악구');
insert into `Parent` values ('p105', '이순신', '1981-05-23', '부산시 진구');
select * from `Parent`;

insert into `Clid` values ('c101', '김철수', '010-1234-1001', 'p101');
insert into `Clid` values ('c102', '김영희', '010-1234-1002', 'p101');
insert into `Clid` values ('c103', '강철수', '010-1234-1003', 'p103');
insert into `Clid` values ('c104', '이철수', '010-1234-1004', 'p105');
insert into `Clid` values ('c105', '정약용', '010-1234-1005', 'p109');
#외래키는 중복 허용. 다만 정약용처럼 없는 부모키를 참조하면 테이블 추가 안됨. 위 테이블에선 p101~105까지만.
select * from `Clid`;
    
#실습 3-7 default, not null
create table `User4` (
	`uid` VARCHAR(10) PRIMARY KEY,
	`name` VARCHAR(10) not null, #반드시 입력하게 함. 기본은 null
	`gender` CHAR(1),
    `age` INT default 1, #작성 안하면 1이 기본 값.
	`hp` CHAR(13) unique,
	`addr` VARCHAR(20)
); 

#실습 3-8
insert into `User4` values ('A101', '김유신', 'M', 21, '010-1234-1001', '김해');
insert into `User4` values ('A102', '김춘추', 'M', 20, '010-1234-1002', '경주');
insert into `User4` values ('A103', '장보고', 'M', 31, '010-1234-1003', '완도');
insert into `User4` set
						`uid` = 'A104',
                        `gender` = 'F',
                        `hp` = '010-1234-1004',
                        `addr` = '강릉'; #이름 not null인데 이름이 없어서 추가 안됨.
insert into `User4` set
						`uid` = 'A104',
                        `gender` = 'F',
                        `name` = '심사임당',
                        `addr` = '강릉'; 
                        #폰 번호 unique - null 허용키라 없어도 추가됨. 
                        #나이 입력 안해서 디폴트 1.
select * from `User4`;


 #실습 3-9 
 #auto_increment(기본키를 지정할 후보키가 없는 테이블에서 사용)와 check(저장할 수 없는 값의 범위 또는 범주를 정의해서 입력되는 데이터 검사)
create table `User5` (
	`seq`    INT auto_increment primary key, #기본키 쓸게 없어서 임의로 ``이름 넣고 오토 증가 씀.
	`name`	 VARCHAR(10) not null, 
	`gender` CHAR(1) check (`gender` in ('M', 'F')),
    `age`	 INT default 1 check(`age` > 0 AND `age` < 100), 
	`addr` 	 VARCHAR(20)
);  

#실습 3-10
insert into `User5` values('김유신', 'M', 25, '김해'); 
#컬럼 5개인데 4개만 입력해서 일자로 입력하는 건 테이블에 안들어감. set 쓰던가 아래처럼 컬럼 지정.(오토에선 그럼)
insert into `User5` (`name`, `gender`, `age`, `addr`) values ('김유신', 'M', 25, '김해');
insert into `User5` (`name`, `gender`, `age`, `addr`) values ('김춘추', 'M', 24, '경주');
insert into `User5` (`name`, `gender`, `age`, `addr`) values ('장보고', 'M', 35, '완도');
insert into `User5` (`name`, `gender`, `age`, `addr`) values ('허난설', 'F', -1, '광주');
insert into `User5` (`name`, `gender`, `age`, `addr`) values ('심사임', 'A', 05, '강릉');
select * from `User5`;



