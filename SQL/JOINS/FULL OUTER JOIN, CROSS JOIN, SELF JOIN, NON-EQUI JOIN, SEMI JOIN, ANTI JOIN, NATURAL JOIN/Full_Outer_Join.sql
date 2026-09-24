-- Database to use
USE advanced_joins_practice;

-- Data Inside it.
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM employees;
SELECT * FROM salary_bands;
SELECT * FROM products;
SELECT * FROM stores;
SELECT * FROM source_customers;
SELECT * FROM target_customers;


-- Full Outer Join.

-- > In simple words, it is the kind of join which will present each and every data from the tables.

-- > It means matching records from both the tables + unmatched records from left table + unmatched records from the right table.

-- > Simple meaning 
-- Full outer join = Complete data from both the tables.

-- KEY POINT TO REMEMBER --> FULL OUTER JOIN ISN'T SUPPORTED IN THE MYSQL. 
-- 							SUPPORTED ON DATABRICKS/SNOWFLAKE/POSTGRE/SQL SERVER.

-- Scenario it can be used on. 
 
-- Scenario 1 --> Source vs target migration validation 

-- Full Outer Join is used in data engineering to compare source and target data during migration. 
-- It helps find missing records, extra records, and records where the data is different.

-- Example 

-- We are transferring data from Source → Target, and after the transfer we want to verify that the Target received everything correctly.

-- These are the table we are working with.
select * from source_customers;
select * from target_customers;

-- QUERY
select * from source_customers s
Full outer join target_customers t
on s.customer_id=t.customer_id;

-- As we know that the full outer join isnt supported in this mysql workebench 
-- SUPPORTED ON DATABRICKS/SNOWFLAKE/POSTGRE/SQL SERVER.

-- so we will use the union in this.

select * from source_customers s
left join target_customers t 
on s.customer_id=t.customer_id

union 

select * from source_customers s 
right join target_customers t 
on s.customer_id=t.customer_id;


-- ANOTHER QUERY FOR THE SAME QUESTION.

select 
s.customer_name as source_name,
t.customer_name as target_name,
s.city as source_city,
t.city as target_city,

case
when t.customer_id is null then 'Missing in target'
when s.customer_id is null then 'Extra in source'
when s.city <> t.city then 'City Mismatched'							-- <> means not equal to. 
else 'Matched'
end as validation_status

from source_customers s 
left join target_customers t
on s.customer_id=t.customer_id

union 

select 
s.customer_name as source_name,
t.customer_name as target_name,
s.city as source_city,
t.city as target_city,

case
when t.customer_id is null then 'Missing in target'
when s.customer_id is null then 'Extra in source'
when s.city <> t.city then 'City Mismatched'							-- <> means not equal to. 
else 'Matched'
end as validation_status

from source_customers s 
right join target_customers t
on s.customer_id=t.customer_id;