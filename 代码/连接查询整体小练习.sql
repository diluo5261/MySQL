/*
已知表:stuinfo
id 学号
name 姓名
email 邮箱   john@126.com
gradeId 年级编号
sex 性别   男 女
age  年龄

已知表grade
id 年级编号
gradeName 年级编号

*/
#一、查询所有学员的邮箱的用户名（注：邮箱中@前面的字符）
SELECT substring(email,0,instr('@')-1) 用户名
from stuinfo；

#二、查询男生和女生的个数
select count(*),sex
FROM stuinfo
group by sex;

#三、查询年龄>18随的所有学生的姓名和年级名称
select name,gradeName
from stuinfo s
join grade g
on s.gradeId = g.id
where age > 20;

#四、查询哪个年级的学生最小年龄>20岁
#1、每个年级的最小年龄

select gradeName,min(age)
from stuinfo s
join grade g
on s.gradeId = g.id
group by gradeName
having min(age) > 20


#五、试说出查询语句中涉及到的所有关键字，以及执行先后顺序
select 查询列表
from 表
连接类型 join  表2
on  连接条件
where 筛选条件
group by 分组列表
having 分组后查询
order by 排序列表
limit 偏移，条目数

执行顺序

from --> join --> on --> where --> group by --> having  --> select --> order by --> limit