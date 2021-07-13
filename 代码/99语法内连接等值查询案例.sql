#内连接
/*
语法:
select 查询列表
from 表1 别名1
inner join 表2 别名2
on 连接条件
where 判断条件

*/

#等值连接

#案例1:查询员工名,部门名
SELECT last_name,department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;

#案例2:查询名字中包含e的员工名和工种名
SELECT last_name,job_title
FROM employees e
INNER JOIN jobs j
ON e.job_id = j.job_id
WHERE e.last_name LIKE'%e%'
AND j.job_title LIKE'%e%';

#案例3:查询部门个数 > 3的城市和部门个数(添加分组+筛选)
SELECT city,COUNT(*) 部门个数
FROM departments d
INNER JOIN locations l
ON d.location_id = l.location_id
GROUP BY city
HAVING 部门个数 > 3;

#案例4:查询哪个部门的员工个数 > 3 的部门和员工个数,并按个数降序
SELECT department_name,COUNT(*) 员工个数
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
GROUP BY department_name
HAVING 员工个数 > 3  
ORDER BY 员工个数 DESC;

#三表连接
#案例5:查询员工名,部门名,工种部门名排序
SELECT last_name,department_name,job_title
FROM employees e
JOIN departments d  ON e.department_id = d.department_id
JOIN jobs j ON e.job_id = j.job_id
ORDER BY department_name;

#非等值连接
#案例1：查询员工工资级别
SELECT salary,grade_level
FROM employees e
JOIN job_grades j
ON e.salary BETWEEN j.lowest_sal AND j.highest_sal;

#案例2：查询工资级别的个数大于>20的个数，并按工资级别降序
SELECT COUNT(*) 级别员工个数,grade_level
FROM employees e
JOIN job_grades j
ON e.salary BETWEEN j.lowest_sal AND j.highest_sal
GROUP BY j.grade_level
HAVING 级别员工个数 > 20
ORDER BY grade_level DESC;


#自连接
#查询员工的名字，上级的名字
SELECT 员工.last_name,经理.last_name
FROM employees 员工
JOIN employees 经理
ON 员工.manager_id = 经理.employee_id;


# 二、外连接
/*
应用场景：用于查询一个表中有，另一个表中没有的场景

特点：
1.外连接的查询结果为主表中的所有记录
如果从表中有和他匹配的，则显示匹配的值
如果从表中没有和它匹配的，则显示null

2.左外连接，left join 左边是主表
  右外连接，right join 右边是主表
	
3.左外和右外交换两个表的顺序，可以实现相同的效果
4.全外连接 = 内连接的结果 + 表1中有表2中没有的 + 表2中有表1中没有的



*/
#左外连接
#案例1：查询男朋友不在男生表的女生表

SELECT b.* , bo.*
FROM beauty b
LEFT OUTER JOIN boys bo
ON b.boyfriend_id = bo.id
WHERE bo.id IS NULL;