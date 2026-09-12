-- NON EQUI / RANGE JOIN

-- > MOST JOINS USE EQUALITY LIKE 
-- a.id=b.id

-- BUT ON THE NON EQUI/RANGE JOIN USES CONDITIONS LIKE:
-- >
-- <
-- >=
-- <=
-- BETWEEN


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


-- Find each employee's name, salary, and salary band.
select 
e.employee_name,e.salary,s.band_name
from employees e 
join salary_bands s 
on e.salary between s.min_salary and s.max_salary;


-- Find only the employees whose salary falls into the Senior salary band.
select 
e.employee_name
from employees e 
join salary_bands s 
on e.salary between s.min_salary and s.max_salary 
where s.band_name in ('Senior');

-- Suppose salary_bands has another column: bonus_percentage is 10 for all employees so bonus_amount = salary × 10% / 100

SELECT
    e.employee_name,
    e.salary,
    s.band_name AS band,
    e.salary * 10 / 100 AS bonus_amount,
    e.salary+(e.salary*10/100) as total_salary
FROM employees e
JOIN salary_bands s
    ON e.salary BETWEEN s.min_salary AND s.max_salary;



-- Find the number of employees in each salary band.
select 
s.band_name,
count(s.band_name)as `NUMBER OF EMPLOYEES IN THAT BAND`
from employees e 
join salary_bands s
on e.salary between s.min_salary and s.max_salary 
group by s.band_name;

-- Find the highest-paid employee in each salary band.
select 
s.band_name,max(e.salary) as `High salary in each band`
from employees e 
join salary_bands s 
on e.salary between s.min_salary and s.max_salary 
group by s.band_name;


