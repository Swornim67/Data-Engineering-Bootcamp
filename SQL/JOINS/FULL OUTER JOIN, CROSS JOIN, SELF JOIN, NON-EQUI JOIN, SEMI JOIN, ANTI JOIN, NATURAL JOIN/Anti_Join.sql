-- ANTI JOIN.

-- > ANTI JOINS RETURNS THE ROW FROM THE FIRST TABLE WHERE THE NO MATCH EXISTS IN THE SECOND TABLE.

-- TABLES TO USE 
select * from customers;
select * from orders;

-- EXAMPLES 

-- FIND THE CUSTOMER WHO HAVE NEVER PLACED AN ORDERD.
select 
*
from customers c 
where not exists(
select 1 from orders o where c.customer_id=o.customer_id
);

-- Find customers who have never placed an order greater than ₹10,000.
select 
*
from customers c 
where not exists(
select * from orders o where c.customer_id=o.customer_id
and o.order_amount > 10000
);

-- Find customers who have never placed a Pending order.
select 
*
from customers c 
where not exists(
select * from orders o where c.customer_id=o.customer_id
and o.order_status ='Pending'
);

-- Find customers who have never placed an order greater than ₹20,000 with status Delivered.
select 
*
from customers c 
where not exists
(
select * from orders o 
where c.customer_id=o.customer_id
and o.order_amount > 20000 
and o.order_status='Delivered'
);

-- Find customers who have no orders below ₹5,000.
select 
*
from customers c
where  not exists(
select * from orders o where c.customer_id=o.customer_id
and o.order_amount < 5000
);