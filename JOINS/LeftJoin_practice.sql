-- LEFT JOIN PRACTICE.

select * from customers;
select * from orders;
select * from payments;
select * from  products;





-- Question 1: Show all customers and their orders if available.
select 
c.customer_id,c.customer_name,o.order_id,o.order_amount
from customers as c
left join orders as o
on c.customer_id=o.customer_id;

-- Question 2: Show all customers with only customer name and order ID.
select 
c.customer_name,o.order_id
from customers as c
left join orders as o
on c.customer_id=o.customer_id;

-- Question 3: Show all products and their orders if available
select 
p.product_id, p.product_name, o.order_id, o.order_amount
from products as p 
left join orders as o
on p.product_id=o.product_id;

-- Question 4: Show all orders and customer names if available.
select 
o.order_id,c.customer_name
from orders as o
left join customers as c 
on o.customer_id=c.customer_id;

-- Question 5: Show all payments and order details if available.
select 
p.payment_id,o.order_id,p.payment_mode
from payments as p
left join orders as o
on p.order_id=o.order_id;

-- Question 6: Find customers who never placed any order.
select 
c.customer_name
from customers as c
left join orders as o 
on c.customer_id=o.customer_id
where o.order_id is null;

-- Question 7: Find orders with invalid customer IDs.
select 
o.order_id,o.customer_id
from orders as o
left join customers as c
on o.customer_id=c.customer_id
where c.customer_id is null;

-- Question 8: Find orders with invalid product IDs.
select 
o.order_id,o.product_id
from orders as o
left join products as p
on o.product_id=p.product_id
where p.product_id is null;

-- Question 9: Find payments with invalid order IDs.
select 
p.payment_id,p.order_id
from payments as p
left join orders as o
on p.order_id=o.order_id
where o.order_id is null;

-- Question 10: Find orders where payment is not available.
select 
o.order_id,o.order_amount,o.order_status
from orders as o 
left join payments as p
on o.order_id=p.order_id
where p.payment_id is null
