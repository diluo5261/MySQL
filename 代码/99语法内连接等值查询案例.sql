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
