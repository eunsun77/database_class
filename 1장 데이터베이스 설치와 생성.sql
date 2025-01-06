# 날짜 : 2025/01/06
# 이름 : 이은선
# 내용 : 1장 데이터베이스 설치와 생성

# 실습 1-1
CREATE DATABASE `StubyDB`;
DROP DATABASE `StudyDB`;

#실습 1-2
CREATE USER 'euns'@'%' identified BY '1234';
GRANT ALL privileges on StudyDB.* to 'euns'@'%' 
flush privileges;

# 실습 1-3
alter user 'euns'@'%'