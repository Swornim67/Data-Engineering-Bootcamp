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
where o.order_status='Delivered'
group by c.customer_name
having sum(o.order_amount)>50000;

-- Question 4
-- Find city-wise delivered revenue.
select 
c.city,sum(o.order_amount) as `TOTAL REVENUE`
from customers c 
join orders o 
on c.customer_id=o.customer_id
where o.order_status='Delivered'
group by c.city;


-- Question 5
-- Find cities where delivered revenue is more than 50,000.
select 
c.city,sum(o.order_amount) as `TOTAL REVENUE`
from customers c 
join orders o
on c.customer_id=o.customer_id
where o.order_status='Delivered'
group by c.city 
having sum(o.order_amount) > 50000;

-- Question 6
-- Sort cities by delivered revenue from highest to lowest.
select 
c.city,sum(o.order_amount) as `TOTAL REVENUE`
from customers c 
join orders o 
on c.customer_id=o.customer_id
where o.order_status='Delivered'
group by c.city
order by `TOTAL REVENUE` DESC;	

-- Question 7
-- Find delivered revenue by product category.

select product_category,sum(order_amount) as `TOTAL REVENUE`
from orders  
where order_status='Delivered'
group by product_category;

-- Question 8
-- Find product categories where delivered revenue is more than 50,000.
select 
product_category,sum(order_amount) as `TOTAL REVENUE`
from orders
where order_status='Delivered'
group by product_category
having sum(order_amount) > 50000;

-- Question 9
-- Find the top 2 customers by delivered revenue.
select c.customer_name,sum(o.order_amount) as `TOTAL ORDERED AMOUNT`
from customers c 
join orders o 
on c.customer_id=o.customer_id
where o.order_status='Delivered'
group by c.customer_name
order by sum(o.order_amount) desc limit 2 ;

-- Question 10
-- Show all customers and their delivered orders if available.
select 
c.customer_id,c.customer_name,o.order_id,o.order_status
from customers c 
left join orders o 
on c.customer_id=o.customer_id
and o.order_status='Delivered';

