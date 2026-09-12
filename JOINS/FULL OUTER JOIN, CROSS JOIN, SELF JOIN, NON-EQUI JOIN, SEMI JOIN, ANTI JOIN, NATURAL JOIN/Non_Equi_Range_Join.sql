-- NON EQUI / RANGE JOIN

-- > MOST JOINS USE EQUALITY LIKE 
-- a.id=b.id

-- BUT ON THE NON EQUI/RANGE JOIN USES CONDITIONS LIKE:
>
<
>=
<=
BETWEEN


-- using this table.
select * from salary_bands;
select * from employees;

-- Example 

-- Show me the employees list and their band as per their salary they get.
 
select 
e.employee_id,
e.employee_name,
e.department,
e.salary,
s.band_name
from employees e 
inner join salary_bands  s 
on e.salary between s.min_salary and s.max_salary;

-- Find only the lead and senior employees.

select 
e.employee_id,
e.employee_name,
e.department,
e.salary,
s.band_name
from employees e 
inner join salary_bands s
on e.salary between s.min_salary and s.max_salary
where s.band_name in('Lead','Senior');

