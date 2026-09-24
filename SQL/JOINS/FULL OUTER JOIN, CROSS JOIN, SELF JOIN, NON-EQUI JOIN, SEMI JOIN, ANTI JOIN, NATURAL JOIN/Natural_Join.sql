-- Natural Join (RISKY JOIN)

-- > A NATURAL JOIN automatically joins two tables using columns that have the same name in both tables.

-- TABLES TO USE
select * from customers;
select * from orders;

-- EXAMPLES
-- Write a NATURAL JOIN query that shows customers along with their orders.
select * from customers natural join orders;


-- Show only the customer_name, order_id, and order_amount for customers who have placed orders.
select customer_name,order_id,order_amount from customers natural join orders;

-- Using NATURAL JOIN, find the total amount ordered by each customer.
select customer_name,sum(order_amount) as `TOTAL AMOUNT BY EACH CUSTOMER` from customers natural join orders group by customer_name ;