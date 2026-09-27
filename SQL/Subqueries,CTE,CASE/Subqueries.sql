-- using the database.
use subqueries_cte_case;

-- Tables being used in the Subqueries

select * from customers;

select * from orders;

select * from order_details;



-- ============================================================
-- 🟢 LEVEL 1: BASIC SUBQUERIES (Questions 1 - 8)
-- ============================================================

-- 1. Above-average orders
-- Find all orders where total_amount is greater than the average order amount.
-- Return: order_id, customer_id, total_amount
select * from orders where total_amount >
(select avg(total_amount) from orders);

-- 2. Highest order
-- Find the order(s) with the highest total_amount.
select * from orders where total_amount=
(select max(total_amount) from orders);

-- 3. Lowest order
-- Find the order(s) with the lowest total_amount.
select * from orders where total_amount=
(select min(total_amount) from orders);

-- 4. Orders greater than 25,000
-- Find customers who have placed at least one order greater than 25000.
-- Return: customer_id, first_name, last_name
select customer_id,first_name,last_name from customers 
where customer_id in
(select customer_id from orders where total_amount > 25000);

-- 5. Customers from Delhi who ordered
-- Find customers who live in Delhi and have placed at least one order.
select * from customers 
where city='Delhi' and customer_id in 
(select customer_id from orders);

-- 6. Products above average price
-- Find products whose price_each is greater than the average price_each.
-- Return: product_name, price_each
select  product_name,price_each from order_details where price_each >
(select avg(price_each) from order_details);

-- 7. Orders above average
-- Find all orders whose total_amount is greater than the average order amount.
-- Return: order_id, order_date, total_amount
select order_id,order_date,total_amount from orders 
where total_amount >
(select avg(total_amount) from orders);

-- 8. Customer who placed order 1001
-- Find the first name and last name of the customer who placed order 1001.
select first_name,last_name from customers 
where customer_id in 
(select customer_id from orders where order_id=1001);


-- ============================================================
-- 🟡 LEVEL 2: IN / NOT IN (Questions 9 - 15)
-- ============================================================

-- 9. Customers with orders
-- Find all customers who have placed at least one order. Use IN.
select first_name,last_name,city
from customers 
where customer_id in 
(select customer_id from orders);

-- 10. Customers with no orders
-- Find customers who have never placed an order. Use NOT IN.
select first_name,last_name,city
from customers 
where customer_id not in 
(select customer_id from orders);

-- 11. Customers who bought Electronics
-- Find customers who purchased at least one product from the Electronics category.
select first_name,last_name
from customers 
where customer_id in
(select customer_id from order_details
where category='Electronics');


-- 12. Customers who never bought Furniture
-- Find customers who have never purchased a product from the Furniture category.
select first_name,last_name 
from customers 
where customer_id  not in
(select customer_id from order_details where category ='Furniture');

-- 13. Products purchased by Delhi customers
-- Find the products purchased by customers who live in Delhi.
-- Return: product_name
select distinct product_name from order_details 
where customer_id in
(select customer_id from customers where city='Delhi');

-- 14. Products purchased by Mumbai customers
-- Find all products purchased by customers from Mumbai.
-- Return: product_name, category
select distinct product_name,category from order_details 
where customer_id in 
(select customer_id from customers where city='Mumbai');

-- 15. Customers who bought a Laptop
-- Find customers who purchased a Laptop.
-- Return: customer_id, first_name, last_name
select customer_id,first_name,last_name from customers 
where customer_id in
(select customer_id from order_details where product_name='Laptop');


-- ============================================================
-- 🟠 LEVEL 3: AGGREGATE SUBQUERIES (Questions 16 - 22)
-- ============================================================

-- 16. Customers spending above average
-- Calculate each customer's total spending.
-- Then find customers whose total spending is greater than the average customer spending. ( we do the sum of the number first then the avg)
-- Return: customer_id, total_spent
select customer_id,sum(total_amount) as total_spent
from orders 
group by customer_id
having sum(total_amount) >
(
select avg(sum_amount) from 
(
select customer_id,sum(total_amount) as sum_amount from orders 
group by customer_id
) as total_amount
);

-- 17. Highest-spending customer
-- Find the customer who has spent the most money.
-- Return: customer_id, first_name, last_name, total_spent
select 
c.customer_id,c.first_name,c.last_name,sum(o.total_amount) as total_spent
from customers c 
join orders o 
on c.customer_id=o.customer_id
group by c.customer_id,c.first_name,c.last_name
having sum(o.total_amount) = 
(
select max(total_spent) from 
(
select customer_id,sum(total_amount) as total_spent
from orders 
group by customer_id) as customer_total
);

-- 18. Lowest-spending customer
-- Find the customer who has spent the least money across all their orders.
-- Return: customer_id, first_name, last_name, total_spent
select c.customer_id,c.first_name,c.last_name,sum(total_amount) as total_spent
from customers c 
join orders o 
on c.customer_id=o.customer_id
group by c.customer_id,c.first_name,c.last_name
having sum(total_amount)=
(
select min(lowest_amount) from 
(
select customer_id,sum(total_amount) as lowest_amount from orders 
group by customer_id ) as lowest_spent
);

-- 19. Second-highest order
-- Find the order with the second-highest total_amount.
-- Do not use LIMIT.
SELECT order_id, customer_id, total_amount
FROM orders
where total_amount = 
(
select max(total_amount) as max_amt from orders where total_amount < 
(select max(total_amount) as max_amt from orders) 
);

-- 20. Second-lowest order
-- Find the order with the second-lowest total_amount.
-- Do not use LIMIT.
select customer_id,total_amount 
from orders 
where total_amount =
(
select min(total_amount) as min_amt from orders where total_amount >
(select min(total_amount) as min_amt from orders)
);


-- 21. Most expensive product
-- Find the product(s) with the highest price_each.
-- Return: product_name, price_each
select product_name,price_each 
from order_details 
where price_each= 
(
select max(price_each) as high_price from order_details);


-- 22. Cheapest product
-- Find the product(s) with the lowest price_each.
select 
product_name,price_each 
from order_details 
where price_each=
(
select min(price_each) from order_details);




-- ============================================================
-- 🔴 LEVEL 4: CORRELATED SUBQUERIES & EXISTS (Questions 23 - 30)
-- ============================================================

-- 23. Orders above customer average
-- Find orders where the total_amount is greater than the average order amount 
-- for that specific customer.
-- Return: order_id, customer_id, total_amount


-- 24. Customers with more than 2 orders
-- Find customers who have placed more than 2 orders using EXISTS or a correlated subquery.
-- Return: customer_id, first_name, last_name


-- 25. Latest order per customer
-- Find the most recent order for each customer (highest order_date per customer).
-- Return: customer_id, order_id, order_date, total_amount


-- 26. Customers who spent more than their city average
-- Find customers whose total spending is greater than the average spending of customers in their city.

















