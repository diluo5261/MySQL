#分页查询
/*

语法： 
select 查询列表
from 表
【join type join 表2
on 连接条件
where 筛选条件
group by 分组字段
having 分组后筛选
order by 排序的字段】
limit offect，size

offect 要显示条目的起使索引（起使索引从0开始）
size 要显示的条目个数

特点：
limit语句放在查询语句的最后，
公式：
要显示的页数 page ，煤业的条目数 size
select 查询列表
from 表
limit (page -1) *size,size;


size = 10;
page
1				0
2				10
3				20

*/

#案例1：查询前5条员工信息
SELECT * FROM employees LIMIT 0,5;
SELECT * FROM employees LIMIT 5;#(如果是从0开始的，默认可以省略)

#案例2：查询第11条 - 第25 条

SELECT * FROM employees LIMIT 10,15;

#案例3：有奖金的员工信息，并且工资较高的前10名
SELECT * 
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY salary DESC
LIMIT 10;