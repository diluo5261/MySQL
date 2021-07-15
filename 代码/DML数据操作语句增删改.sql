/*
DML（Data Manipulation Language） ：数据操作语句，用于添加、删除、修改、查询数据库记录，检查数据库完整性

insert ： 插入
updata ： 修改
delete ： 删除





*/

# 一、插入语句
/*
语法：
insert into 表名 （列1，列2 ，... ...）
values (值1，值2，... ...)

*/
#方法一:
#1、插入的类型要与列的类型一致
#例1：将（韩梅梅，女，1998-01-03，15431313，null，4），插入到表中
insert into beauty (id,name,sex,borndate,phone,photo,boyfriend_id)
values(23,'韩梅梅','女','1998-01-03','15431313',null,4)

select * from beauty;

#2、null值插入方式
#方式一：直接用null，见上面

#方式二：列名中不体现，自动为null
#将（24，热巴，女，1562-02-30，12356523695，1）插入到表中
insert into beauty (id,name,sex,borndate,phone,boyfriend_id)
values(24,'热巴','女','1998-01-30','12356523695',1)

#3、列的顺序可以更换，但是value要与之相对应
insert into beauty (name,id,phone,borndate,boyfriend_id)
values('大雄',25,'14526','1568-02-15',7);

#4、可以省略列名，默认是所有列，而且列的顺序和表中的顺序是一致的
insert into beauty values(26,'小夫','男','2020-03-23','13135153',null,1);


#插入语句方法二:
/*
语法:
insert into 表名
set 列名 = 值

*/
insert into beauty
set name = '柯南',sex = '女',phone = '16516';

/*
两种方式比较:
方式一:支持多行插入,方式二不支持
方式一支持子查询,方式二不支持
*/

#二、查询语句
/*
语法：
update 表名
set 列名 = 值
where 筛选条件

*/

#1、将柯南的性别改成男
update beauty
set sex = '男'
where name = '柯南'




#三、删除语句
/*
语法：
删除整行
delete from 表名 where 筛选条件

*/

#1.删除张三信息
delete from beauty where name = '张三'

#删除表中所有信息
#方法一：使用delete
delete from beauty ;

#方法二：使用truncate
truncate table beauty;
truncate table boys;
select * from beauty
select * from boys;


/*
truncate 与delete的区别
1、truncate后面不能加where，delete后面能加where条件
2、truncate删除效率高一点
3、假如删除的表中有自增长列，用delete删除后，再插入数据，自增列从断点处开始
truncate删除后，自增列从1开始
4、delete有返回值，truncate没有返回值
5、delete能回滚，truncate不能回滚

*/