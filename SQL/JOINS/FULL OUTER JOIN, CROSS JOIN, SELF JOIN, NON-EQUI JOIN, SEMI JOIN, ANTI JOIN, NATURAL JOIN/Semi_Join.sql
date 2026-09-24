-- Semi Join

-- > It returns the row from the first table where the match exists in the second table.


-- table using in this join.
select * from customers;
select * from orders;

-- EXAMPLE 

-- Find the customer who have place atleast a single order. 

select 
c.customer_id,
c.customer_name,
c.city
from customers c
where exists(
select 1 from orders o where c.customer_id=o.customer_id);

-- Find all customers who have NOT placed even a single order.
select 
c.customer_name
from customers c 
where not exists(
select * from orders o 
where o.customer_id=c.customer_id );

-- Find the customers who have placed at least one order with an amount greater than ₹10,000.

select 
c.customer_name
from customers c 
where exists(
select * from orders o 
where o.customer_id=c.customer_id
and o.order_amount > 10000
);

-- Using the customers and orders tables, find all customers who have placed at least one order, but ALL of their orders are below ₹10,000.
select 
c.customer_name
from customers c 
where exists(
select 1 from orders o 
where c.customer_id=o.customer_id
)
and not exists(
select 1 from orders o 
where c.customer_id=o.customer_id
and o.order_amount >= 10000
);
