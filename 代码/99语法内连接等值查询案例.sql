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