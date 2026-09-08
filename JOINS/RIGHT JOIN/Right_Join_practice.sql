
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
ON o.order_id = pay.order_id;


-- Question 1 (Interview)
-- What is RIGHT JOIN?

-- Question 1 (Interview)
-- What is RIGHT JOIN?
-- > RIGHT JOIN returns all records from the right table and matching records from the left table. 
-- >If no match is found in the left table, left table columns come as NULL.

-- Question 2 (Interview)
-- What is the difference between LEFT JOIN and RIGHT JOIN?
-- > LEFT JOIN preserves the left table. RIGHT JOIN preserves the right table.
-- > customers LEFT JOIN orders = all customers
-- > orders RIGHT JOIN customers = all customers

-- Question 3 (Interview)
-- Is RIGHT JOIN commonly used in production?
-- > RIGHT JOIN is valid SQL, but it is not commonly preferred. 
-- > Most teams prefer LEFT JOIN because it keeps the base table first and makes the query easier to read.

-- Question 4 (Interview)
-- Can RIGHT JOIN be converted into LEFT JOIN?
-- > Yes. Most RIGHT JOIN queries can be rewritten as LEFT JOIN by changing the table order.

-- EXAMPLE
-- > FROM orders o RIGHT JOIN customers c ON o.customer_id = c.customer_id;
-- > can be rewritten as:
-- > FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- Question 5 (Interview)
-- Does table order matter in RIGHT JOIN?
-- > Yes. RIGHT JOIN preserves the table written on the right side, so table order is very important.

-- Question 6 (Interview)
-- Can RIGHT JOIN return more rows than the right table?
-- > Yes. If the left table has multiple matching rows for one right table row, output can be more than the right table count.
-- > Example: one customer has multiple orders, so that customer appears multiple times.

-- Question 7 (Interview)
-- Can RIGHT JOIN return fewer rows than the right table?
-- > Normally, RIGHT JOIN keeps all rows from the right table. But if a WHERE condition filters the final output, rows can become fewer.
-- > Example: WHERE o.order_status = 'Delivered' can remove customers who have no orders.

-- Question 8 (Interview)
-- Why does RIGHT JOIN sometimes behave like INNER JOIN?
-- > This happens when a filter is applied on the left table in the WHERE clause. Rows with NULL from the left table are removed, so unmatched right table records disappear.

-- Question 9 (Interview)
-- What is the difference between filter in ON and WHERE for RIGHT JOIN?
-- > Filter in ON controls which left table records should match. Filter in WHERE filters the final result.
-- > In RIGHT JOIN, left table filters in WHERE can remove unmatched right table rows.

-- Question 10 (Interview)
-- Why is LEFT JOIN preferred over RIGHT JOIN?
-- > LEFT JOIN is preferred because it is easier to read, the base table comes first, it is more common in coding standards, it reduces confusion, and RIGHT JOIN can usually be rewritten as LEFT JOIN.

-- Question 11 (Interview)
-- Business asks: "Show all customers even if they have not ordered." How can you write it using RIGHT JOIN?
	select c.customer_id,c.customer_name from orders o 
	right join customers c 
	on o.customer_id=c.customer_id;

-- Question 12 (Interview)
-- Business asks: "Find products that were never ordered." How can you write it using RIGHT JOIN?
	select p.product_name 
	from orders o 
	right join products p
	on o.product_id=p.product_id
	where o.order_id is null;

-- Question 13 (Interview)
-- Business asks: "Find orders without payments." How can you write it using RIGHT JOIN?
	select o.order_id,o.order_amount from payments p
	right join orders o 
	on p.order_id=o.order_id
	where p.payment_id is null;

-- Question 14 (Interview)
-- What is the biggest mistake in RIGHT JOIN?
-- > The biggest mistake is applying a filter on the left table inside the WHERE clause. This can remove unmatched right table rows and make RIGHT JOIN behave like INNER JOIN.

-- Question 15 (Interview)
-- Should we use RIGHT JOIN in production?
-- > RIGHT JOIN is not wrong, but in most cases it is better to rewrite it as LEFT JOIN for readability.