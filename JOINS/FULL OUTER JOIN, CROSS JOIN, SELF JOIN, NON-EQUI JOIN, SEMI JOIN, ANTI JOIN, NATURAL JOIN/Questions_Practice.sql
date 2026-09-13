-- DATA TABLES 
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM employees;
SELECT * FROM salary_bands;
SELECT * FROM products;
SELECT * FROM stores;
SELECT * FROM source_customers;
SELECT * FROM target_customers;

-- FULL OUTER JOIN.	

-- Find customers present in source but missing in target.
select 
*
from source_customers s
left join target_customers t 
on  s.customer_id=t.customer_id
where t.customer_id is null;

-- Find customers present in target but missing in source.
select 
* 
from source_customers s
right join target_customers t
on t.customer_id=s.customer_id
where s.customer_id is null;

-- Find customers where city is different between source and target.
select 
* from source_customers s 
join target_customers t 
on s.customer_id=t.customer_id
where  s.city<>t.city;

-- CROSS JOIN.

-- Create all product and store combinations.
select * from products p 
cross join stores s ;

-- Find total number of product-store combinations.
select 
count(*) as total_product_store_combinations
from products p
cross join stores s;

-- SELF JOIN

-- Show employees with their manager names
select 
e.employee_name as employee_name,
m.employee_name as manager_name
from employees e 
left join employees m 
on e.manager_id=m.employee_id;

-- Find employees who do not have a manager
select 
e.employee_name as `EMPLOYEE HAVING NO MANAGER` 
from employees e 
left join employees m 
on e.manager_id=m.employee_id
where e.manager_id is null;

-- Find employees directly reporting to Anurag
select 
e.employee_name
from employees e 
left join employees m 
on e.manager_id=m.employee_id
WHERE m.employee_name='Anurag';

-- Find employees directly reporting to Engineering Stuti.
select 
e.employee_name
from employees e 
left join employees m 
on e.manager_id=m.employee_id
where m.employee_id=2;

-- NON-EQUI JOIN / RANGE JOIN

-- Assign salary band to each employee.
select 
e.employee_name,
s.band_name
from employees e 
join salary_bands s 
on e.salary between s.min_salary and s.max_salary;

-- Find only Senior and Lead employees
select 
e.employee_name,s.band_name
from employees e 
join salary_bands s 
on e.salary between s.min_salary and s.max_salary 
where s.band_name in ('Senior','Lead');

-- SEMI JOIN

-- Find customers who placed at least one order.
select 
*
from customers c 
where exists
(
select * from orders o where  c.customer_id=o.customer_id
);

-- Find employees who are managers of at least one employee.
select 
* from employees m
where exists(
select * from employees e where e.manager_id=m.employee_id
);

-- ANTI JOIN

-- Find customers who never placed any order
select 
*
from customers c 
where not exists(
select * from orders o where o.customer_id=c.customer_id
);

-- Find employees who are not managers.
select 
* from employees m 
where not exists
(
select * from employees e where m.employee_id=e.manager_id
);

-- NATURAL JOIN

-- Write a NATURAL JOIN between customers and orders.
select * from customers natural join orders o; 


--  Level-Wise Practice Questions

-- Level 1: Basic

-- Create all product-store combinations.
select 
*
from products p 
cross join stores s;

-- Show every employee with manager name.
select
e.employee_name AS employee_name,
m.employee_name AS manager_name
from employees e 
left join employees m
on e.manager_id=m.employee_id;

-- Assign salary band to each employee.
select 
e.employee_name,s.band_name
from employees e 
join salary_bands s 
on e.salary between s.min_salary and s.max_salary;

-- Level 2: Intermediate

-- Find source customers missing in target
select * from source_customers s 
left join target_customers t
on s.customer_id=t.customer_id
where t.customer_id is null;

--  Find target customers missing in source.
select * from target_customers t 
left join source_customers s 
on t.customer_id=s.customer_id
where s.customer_id is null;

--  Find employees who are managers.
select 
*
from employees m 
where exists(
select * from employees e where e.manager_id=m.employee_id
);

-- Find employees who are not managers.
select 
*
from employees m 
where  not exists(
select * from employees e where e.manager_id=m.employee_id
);

-- Level 3: Interview Level

-- Create a migration validation report.
SELECT
COALESCE(s.customer_id, t.customer_id) AS customer_id,
s.customer_name AS source_name,
t.customer_name AS target_name,
s.city AS source_city,
t.city AS target_city,
CASE
WHEN t.customer_id IS NULL THEN 'Missing in Target'
WHEN s.customer_id IS NULL THEN 'Extra in Target'
WHEN s.city <> t.city THEN 'City Mismatch'
ELSE 'Matched'
END AS validation_status
FROM source_customers s
LEFT JOIN target_customers t
ON s.customer_id = t.customer_id
UNION
SELECT
COALESCE(s.customer_id, t.customer_id) AS customer_id,
s.customer_name AS source_name,
t.customer_name AS target_name,
s.city AS source_city,
t.city AS target_city,
CASE
WHEN t.customer_id IS NULL THEN 'Missing in Target'
WHEN s.customer_id IS NULL THEN 'Extra in Target'
WHEN s.city <> t.city THEN 'City Mismatch'
ELSE 'Matched'
END AS validation_status
FROM source_customers s
RIGHT JOIN target_customers t
ON s.customer_id = t.customer_id;

-- Find customers who ordered using SEMI JOIN logic
select 
*
from customers c 
where exists(
select * from orders o where o.customer_id=c.customer_id
);

--  Find customers who never ordered using ANTI JOIN logic
select 
* from customers c
where not exists(
select * from orders o where o.customer_id=c.customer_id
);

-- Explain why this query can be risky.
SELECT
c.customer_id,
c.customer_name
FROM customers c
WHERE c.customer_id NOT IN (
SELECT customer_id
FROM orders
);

-- it is risky because it will just provide us the result as the null nothing in the output.