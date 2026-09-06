
-- Check the Data
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM payments;


-- Question 1
-- Show all customers and their orders using RIGHT JOIN.

select * from orders o 
right join customers c
on o.customer_id=c.customer_id;


-- Question 2
-- Show customer name and order ID using RIGHT JOIN.


select c.customer_name,o.order_id
from orders o 
right join customers c 
on o.customer_id=c.customer_id;


-- Question 3
-- Show all products and their orders using RIGHT JOIN.

select * from orders o 
right join products p 
on o.product_id=p.product_id;


-- Question 4
-- Show all orders and payment details using RIGHT JOIN.

select * from payments p 
right join orders o 
on p.order_id=o.order_id;

-- Question 5
-- Find customers who never placed any order using RIGHT JOIN.

select c.customer_id,c.customer_name
from orders o 
right join customers c
on o.customer_id=c.customer_id
where o.order_id is null;

-- Question 6
-- Find products that were never ordered using RIGHT JOIN.

select 
p.product_name
from orders o 
right join products p 
on o.product_id=p.product_id
where o.order_id is null;

-- Question 7
-- Find orders where payment is not available using RIGHT JOIN.

select 
o.order_id,o.order_amount,p.paid_amount
from payments p 
right join orders o 
on p.order_id=o.order_id
where p.payment_id is null;


-- Question 8
-- Rewrite this RIGHT JOIN query as LEFT JOIN.
-- RIGHT JOIN Query:
-- SELECT c.customer_name, o.order_id
-- FROM orders o
-- RIGHT JOIN customers c
-- ON o.customer_id = c.customer_id;

select 
c.customer_name,o.order_id
from customers c 
left join orders o 
on c.customer_id=o.customer_id;


-- Question 9
-- Rewrite this RIGHT JOIN query as LEFT JOIN.
-- RIGHT JOIN Query:
-- SELECT p.product_name, o.order_id
-- FROM orders o
-- RIGHT JOIN products p
-- ON o.product_id = p.product_id;

select 
p.product_name,o.order_id
from products p 
left join orders o
on p.product_id=o.product_id;

-- Question 10
-- Rewrite this RIGHT JOIN query as LEFT JOIN.
-- RIGHT JOIN Query:
-- SELECT o.order_id, pay.payment_status
-- FROM payments pay
-- RIGHT JOIN orders o
-- ON pay.order_id = o.order_id;

SELECT o.order_id, pay.payment_status
FROM orders o
left JOIN payments pay
ON o.order_id = pay.order_id;