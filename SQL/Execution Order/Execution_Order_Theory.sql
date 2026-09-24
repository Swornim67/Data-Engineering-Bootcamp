-- SQL EXECUTION ORDER

-- THIS IS THE WRITING SEQUENCE IN THE SQL QUERIES.

select DISTINCT
from
join
where
group by
having
order by
limit


-- Writing it one more time without seeing it

select DISTINCT
from
join
where
group by
having
order by
limit


-- FEW THINGS TO KEEP IN MIND BEFORE STARTING THE EXECUTION ORDER.


-- 1. SELECT ALIAS AND WHERE

select sum(o.amount) as total_amount
from orders o
where total_amount > 30000

-- here we can't use the alias "total_amount" in the where clause
-- because the alias was created in the SELECT clause.
--
-- SELECT comes AFTER WHERE in the execution order.
--
-- so when WHERE is executed, "total_amount" has not been created yet.


-- 2. WHY DO WE USE WHERE BEFORE GROUP BY?

select c.customer_name, sum(o.amount)
from orders o
join customers c
on o.customer_id = c.customer_id
where o.status = 'Delivered'
group by c.customer_name

-- WHERE is used before GROUP BY because WHERE filters
-- the individual rows first.
--
-- here:
--
-- where o.status = 'Delivered'
--
-- will filter the orders based on their status.
--
-- after that, the remaining rows are grouped by:
--
-- c.customer_name


-- 3. WHY CAN'T WE USE SUM() IN WHERE?

where sum(o.amount) > 30000

-- we can't normally use SUM() in WHERE.
--
-- because SUM() is an aggregate function and works
-- after the rows have been grouped.
--
-- WHERE comes before GROUP BY.
--
-- so if we want to filter based on SUM(o.amount),
-- we use HAVING.


-- 4. HAVING

select c.customer_name, sum(o.amount) as total_amount
from orders o
join customers c
on o.customer_id = c.customer_id
where o.status = 'Delivered'
group by c.customer_name
having sum(o.amount) > 30000

-- WHERE filters individual rows
-- HAVING filters groups
--
-- WHERE:
--     o.status = 'Delivered'
--
-- HAVING:
--     sum(o.amount) > 30000


-- 5. WHY DO WE USE JOIN BEFORE WHERE?

select c.customer_name, o.amount
from orders o
join customers c
on o.customer_id = c.customer_id
where o.status = 'Delivered'

-- JOIN connects the customers table with the orders table.
--
-- we use:
--
-- o.customer_id = c.customer_id
--
-- after the tables are joined, WHERE can filter the
-- resulting rows.
--
-- so:
--
-- JOIN → combines related rows
-- WHERE → filters those rows


-- ONCE AGAIN WRITING THE SEQUENCE OF THE ORDER IN SQL

select DISTINCT
from
join
where
group by
having
order by
limit


-- NOW THE EXECUTION ORDER IN SQL.

from
join / on
where
group by
having
select
distinct
order by
limit


-- ONCE AGAIN WRITING THE EXECUTION ORDER

from 
join 
where 
group by 
having 
select 
distinct 
order by 
limit

-- writing both now 

-- Writing Sequence 
select 
from 
join
where 
group by 
having 
order by 
limit 

-- execution sequence 
from 
join
where 
group by 
having 
select 
distinct 
order by 
limit


