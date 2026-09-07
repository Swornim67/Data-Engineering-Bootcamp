
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


-- Question 11
-- Show every customer with total order amount using RIGHT JOIN.
-- If customer has no order, show 0.

select 
c.customer_id,c.customer_name,
coalesce(sum(o.order_amount),0)as `Total Order Amount`
from orders o
right join customers c
on o.customer_id=c.customer_id
group by c.customer_id,c.customer_name;

-- Question 12
-- Show every customer with total number of orders using RIGHT JOIN.

select 
c.customer_id,c.customer_name,
count(o.order_id) as `TOTAL NUMBER OF ORDERS`
from orders o 
right join customers c 
on o.customer_id=c.customer_id
group by c.customer_id,c.customer_name;

-- Question 13
-- Show all products with total sales amount using RIGHT JOIN.
-- If product has no sales, show 0.

select 
p.product_id,p.product_name,
coalesce(sum(o.order_amount),0) as `TOTAL SALES AMOUNT`
from orders o 
right join products p 
on o.product_id=p.product_id
group by p.product_id,p.product_name;

-- Question 14
-- Show all orders with payment status. If payment is missing, show No Payment.

select 
o.order_id,p.payment_id,
p.paid_amount,
coalesce(p.payment_status,"No Payment")as `Payment Status`
from payments p 
right join orders o 
on p.order_id=o.order_id;


-- Question 15
-- What is wrong with this query?
-- SELECT c.customer_name, COUNT(*) AS total_orders
-- FROM orders o
-- RIGHT JOIN customers c
-- ON o.customer_id = c.customer_id
-- GROUP BY c.customer_name;

-- Because of the count(*) it will count the null values also as 1. 

-- Right Query.
SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM orders o
RIGHT JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.customer_name;


-- Question 16
-- Show all customers and only delivered orders if available.
-- Wrong Query:
-- SELECT c.customer_name, o.order_id, o.order_status
-- FROM orders o
-- RIGHT JOIN customers c
-- ON o.customer_id = c.customer_id
-- WHERE o.order_status = 'Delivered';

-- In the Upper Query the use of where only extract only the matching condition so we use the on condition inside we use and. 

SELECT c.customer_name, o.order_id, o.order_status
FROM orders o
RIGHT JOIN customers c
ON o.customer_id = c.customer_id
and o.order_status = 'Delivered';


-- Question 17
-- Why does table order matter in RIGHT JOIN?

-- > it matters because it will show us different data while using random tables in the right join.
-- Example 1:

SELECT c.customer_name, o.order_id
FROM orders o
RIGHT JOIN customers c
ON o.customer_id = c.customer_id;

-- In this query we see All People Names with their order id but we see people who havent ordered anything with order id mentioned as null.

-- Example 2:

SELECT c.customer_name, o.order_id
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

-- In this query we see order id and People names but in this we dont see the people names we see only order id in that place.


-- Question 18
-- Can RIGHT JOIN increase rows?

-- > Yes, Right Join can increases rows because a person can order 2 times and further things.

-- Example

select 
c.customer_name,
c.customer_id
from orders o 
right join customers c
on o.customer_id=c.customer_id
where c.customer_name='Anurag';

-- Question 19
-- Show all customers with order and payment details wherever available using RIGHT JOIN.

select 
c.customer_id,c.customer_name,o.order_amount,o.order_status,p.paid_amount
from payments p
right join orders o 
on p.order_id=o.order_id
right join customers c
on o.customer_id=c.customer_id;


-- Question 20
-- Show all customers with order, product, and payment details using the preferred LEFT JOIN version.

select 
c.customer_id,
c.customer_name,
c.city,
o.order_id,
p.product_name,
o.order_amount,
pay.payment_status
from customers c
left join orders o
on c.customer_id=o.customer_id
LEFT JOIN products p
ON o.product_id = p.product_id
LEFT JOIN payments pay
ON o.order_id = pay.order_id