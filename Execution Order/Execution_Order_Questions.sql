-- DATABASE USING 
use sql_execution_order;

-- TABLES USING 
select * from customers;
select * from orders;

-- Question 1

-- Find the total revenue by customer.
select 
c.customer_name,sum(o.order_amount) as `TOTAL REVENUE`
from customers c
join orders o 
on c.customer_id=o.customer_id
group by c.customer_name;

-- Question 2
-- Find the total delivered revenue by customer.
select 
c.customer_name,sum(o.order_amount) as `TOTAL DELIVERED REVENUE`
from customers c 
join orders o 
on c.customer_id=o.customer_id
where o.order_status='Delivered'
group by c.customer_name;

-- Question 3
-- Find customers whose delivered revenue is more than 50,000.
select 
c.customer_name,sum(o.order_amount) as `TOTAL REVENUE`
from customers c 
join orders o 
on c.customer_id=o.customer_id
group by c.customer_name
having sum(o.order_amount)>50000;

-- Question 4
-- Find city-wise delivered revenue.
select 
c.city,sum(o.order_amount) as `TOTAL REVENUE`
from customers c 
join orders o 
on c.customer_id=o.customer_id
group by c.city;

-- Question 5
-- Find cities where delivered revenue is more than 50,000.
select 
c.city,sum(o.order_amount) as `TOTAL REVENUE`
from customers c 
join orders o
on c.customer_id=o.customer_id
group by c.city 
having sum(o.order_amount) > 50000;


