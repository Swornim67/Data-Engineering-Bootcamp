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
where p.payment_id is null;

-- Question 11: Show every customer with total order amount. If customer has no order, show total as 0.
select
c.customer_id,c.customer_name,
coalesce(sum(o.order_amount),0) as total_amount
from customers as c 
left join orders as o 
on c.customer_id=o.customer_id
group by c.customer_id,c.customer_name;

-- Question 12: Show every customer with total number of orders.
select 
c.customer_id,c.customer_name,
count(o.order_id) as Total_orders
from customers as c 
left join orders as o
on c.customer_id=o.customer_id
group by c.customer_id,c.customer_name;

-- Question 13: Show every customer with successful paid amount. If no successful payment exists, show 0.
select 
c.customer_id,c.customer_name,
coalesce(sum(paid_amount),0) as Successful_Payment
from customers as c
left join orders as o 
on c.customer_id=o.customer_id
left join payments as p
on o.order_id=p.order_id
and p.payment_status="Success"
group by c.customer_id,c.customer_name;

-- Question 14: Show all products with total sales amount. If product has no order, show 0.

select 
p.product_id,p.product_name,
coalesce(sum(o.order_amount),0) as `Total Sales`
from products as p
left join orders as o
on p.product_id=o.product_id
group by p.product_id,p.product_name;

-- Question 15: Show all orders with payment status. If payment is missing, show No Payment.
select 
o.order_id,o.order_amount,o.order_status,
coalesce((p.payment_status),"No Payment") as `Payment History`
from orders as o 
left join payments as p
on o.order_id=p.order_id;

-- Question 16 What is wrong with this query?
SELECT
c.customer_name,
COUNT(*) AS total_orders
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- the wrong in this query is on the left join we cant use count(*) as it shows those people who doesnt have any orders also as 1 in all the row.

-- correct query 
select c.customer_name, 
Count(o.order_id) as total_orders
from customers c
left join orders o
on c.customer_id=o.customer_id
group by c.customer_name;

-- Question 17 Show all customers and only delivered orders if available.
-- Wrong Query
SELECT
c.customer_name,
o.order_id,
o.order_status
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_status = 'Delivered';

-- in this query this and removes the non delievered orders so we should use and operator 

-- right query
SELECT
c.customer_name,
o.order_id,
o.order_status
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
and o.order_status = 'Delivered';


-- Question 18: Show all customers and successful payment details if available.
select 
c.customer_id,c.customer_name,p.payment_mode,p.payment_status
from customers as c
left join orders as o
on c.customer_id=o.customer_id
left join payments as p
on o.order_id=p.order_id
and payment_status="Success";


-- Question 19 Why does table order matter in LEFT JOIN?
-- Example 1
SELECT
c.customer_name,
o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

-- it matters because on the left join it primarly focuses on the left table which we are taking. it is considered as main table.

-- Example 2
SELECT
c.customer_name,
o.order_id
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id;

-- in this example the left table is orders so its the main table and the customers is the secondary table.

-- Question 20 Can LEFT JOIN increase rows?

-- Example Query
SELECT
c.customer_name,
o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE c.customer_name = 'Anurag';

-- A LEFT JOIN can increase rows when one row in the left table matches multiple rows in the right table. 
-- In this example, Anurag has 2 orders, so his 1 customer row becomes 2 result rows. The WHERE clause only filters the result to Anurag.

-- Question 21 Show all customers with order, product, and payment details wherever available.
select 
c.customer_id,c.customer_name,o.order_id,pro.product_name,o.order_amount,	pay.payment_status
from customers as c
left join orders as o
on c.customer_id=o.customer_id
left join products as pro
on o.product_id=pro.product_id
LEFT JOIN payments as pay
ON o.order_id = pay.order_id;

-- Question 22: Show all orders with customer, product, and payment details wherever available.
select
o.order_id,o.customer_id,c.customer_name,p.product_name,o.order_amount,pay.payment_status
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id
LEFT JOIN products p
ON o.product_id = p.product_id
LEFT JOIN payments pay
ON o.order_id = pay.order_id;

-- Question 23 Create an order quality report showing whether customer, product, and payment mapping exists.

-- Solution

select 
c.customer_name,
o.order_id,
o.customer_id,
o.product_id,
o.order_amount,

CASE
WHEN c.customer_id IS NULL THEN 'Invalid Customer'
ELSE 'Valid Customer'
END AS customer_check,

CASE
WHEN p.product_id IS NULL THEN 'Invalid Product'
ELSE 'Valid Product'
END AS product_check,

CASE
WHEN pay.payment_id IS NULL THEN 'No Payment'
ELSE 'Payment Available'
END AS payment_check

from orders as o 
left join customers as c
on o.customer_id=c.customer_id
left join products as p
on o.product_id=p.product_id
left join payments as pay
on o.order_id=pay.order_id;

-- Question 24 Find only problematic orders where customer, product, or payment is missing.

SELECT
o.order_id,o.customer_id,oo.order_amount,p.product_name,pay.payment_id

FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id

LEFT JOIN products p
ON o.product_id = p.product_id

LEFT JOIN payments pay
ON o.order_id = pay.order_id

WHERE c.customer_id IS NULL
OR p.product_id IS NULL
OR pay.payment_id IS NULL;