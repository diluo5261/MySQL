# DDL
/*
Data Definition Language
数据定义语言,用户库和表的创建\修改\删除操作
一、库的管理
创建、修改、删除

二、表的管理
创建、修改、删除

创建：creat
修改：alter
删除：delete

*/

#一、库的管理
#1、库的创建
/*
语法：
create database 【if not exists】库名

*/
#案例创建库cards
create database if not exists cards;

#2.库的修改（用的很少，一般修改文件夹的名字）

alter database cards character set gbk;


# 3.库的删除
drop database if exists cards;
show databases;

#二、表的管理
#1、表的创建
#案例：常见card表
create table card(
	name VARCHAR(10),
	id INT,
	phone VARCHAR(11)

);

DESC card;


#2、表的修改
/*
语法：
alter table 表名 add | drop |modify |change column 列名【列类型，约束】

*/

#1、修改列名
alter table card change column  name names VARCHAR(10);
alter table card change column names name VARCHAR(10);

#2、修改类型或约束
alter table card modify column id double;

alter table card modify column id int;


#3.添加新列
alter table card add column balance double;
#4.删除一列
alter table card drop column balance;

#5、修改表名
alter table card rename card1;
alter table card1 rename card;

show tables;

# 删除表
drop table card;


#4、表的复制
create table card (
			name  varchar(10),
			age int,
			id int,
			balance double
);

insert into card values('hh',1,55.6,2);
DESC card;

# 1.删除一列
alter table card drop column age;

#2.添加一列
alter table card add column age INT;

#3.修改列的名称
alter table card change column age sex VARCHAR(1);

#4.修改类型约束
alter table card modify column sex int;

#只复制表的结构
create table copy like card;

#复制表的数据+结构
create table copy2
select * from card;

