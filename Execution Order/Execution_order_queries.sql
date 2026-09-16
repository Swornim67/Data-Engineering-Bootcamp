-- DATABASE AND TABLE TO USE IN THIS 
USE sql_execution_order;

select * from customers;
select * from orders;

-- BUSINESS SCENARIO 
-- Find cities where delivered order revenue is more than 50,000.
-- Show the city and total revenue.
-- Sort highest revenue first.

select 
c.city,
sum(o.order_amount) as total_revenue
from customers c 
join orders o 
on c.customer_id=o.customer_id
where o.order_status='Delivered'
group by c.city
having total_revenue > 50000
-- sum(o.order_amount) > 50000
order by total_revenue;
