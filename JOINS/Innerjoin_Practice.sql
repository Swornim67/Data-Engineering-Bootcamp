-- checking the data in the table.

SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM payments;




-- Question 1
-- Show all valid orders with customer name and city.
select 
o.order_id,
c.customer_name,
c.city,
o.order_amount,
o.order_date,
o.order_status
from customers as c
inner join orders as o
on c.customer_id=o.customer_id;

-- Question 2
-- Show customer name, product name, category and order amount.

select 
c.customer_name,
pro.product_name,
o.order_amount
from customers as c
inner join orders as o
on c.customer_id=o.customer_id
inner join products as pro
on o.product_id=pro.product_id;


-- Question 3
-- Show customer name, order ID, payment mode and payment status.

select
o.order_id,
c.customer_name,
pay.payment_mode,
pay.payment_status
from customers as c
inner join orders as o
on c.customer_id=o.customer_id
inner join payments as pay
on o.order_id=pay.order_id;

-- Question 4
-- Show only successful payments with customer details

select 
c.customer_id,
c.city,
o.order_id,
o.order_amount,
c.customer_name,
pay.paid_amount,
pay.payment_status
from customers as c 
inner join orders as o
on c.customer_id=o.customer_id
inner join payments as pay
on o.order_id=pay.order_id
where pay.payment_status='Success';


-- Question 5
-- Find total amount spent by each customer.

select 
c.customer_id,
c.customer_name,
sum(o.order_amount) as `Total Amount spent by each customer`
from customers as c
inner join orders as o 
on c.customer_id=o.customer_id
group by c.customer_id,c.customer_name;

-- Question 6
-- Find the number of valid orders placed by each customer.

select
c.customer_id,
c.customer_name,
count(o.order_id) as `Number of Valid Order`
from customers as c 
inner join orders as o
on c.customer_id=o.customer_id
group by c.customer_id,c.customer_name;


-- Question 7
-- Find total revenue generated from each city.

select
c.city,
sum(o.order_amount) as `Total Revenue`
from customers as c
inner join orders as o
on c.customer_id=o.customer_id
group by c.city;

-- Question 8
-- Show all Bengaluru customers who placed orders.

select 
c.customer_name,c.city,o.order_amount
from customers as c
inner join orders as o 
on c.customer_id=o.customer_id
where c.city='Bengaluru';	


-- Question 9
-- Find customers who used UPI payment mode.

select distinct
c.customer_name,pay.payment_mode
from customers as c
inner join orders as o 
on c.customer_id=o.customer_id
inner join payments as pay
on o.order_id=pay.order_id
where pay.payment_mode='UPI';

-- Question 10
-- Create a final report with customer, product, order and payment details.

select 
c.customer_name,
c.city,
pro.product_name,
pro.category,
o.order_id,
o.order_amount,
o.order_status,
pay.payment_mode,
pay.payment_status,
pay.paid_amount
from customers as c
inner join orders as o
on c.customer_id=o.customer_id
inner join products as pro
on o.product_id=pro.product_id
inner join payments as pay
on o.order_id=pay.order_id;

-- Question 11
-- Find total sales for each product category.

select 
p.category,
sum(o.order_amount) as `Total Sales`
from orders as o
inner join products as p
on o.product_id=p.product_id
group by p.category;


-- Question 12
-- Find total successful paid amount by payment mode.

select 
p.payment_mode, sum(p.paid_amount) as `Total Successful Amount`
from orders as o
inner join payments as p
on o.order_id=p.order_id
where p.payment_status='Success'
GROUP BY p.payment_mode;


-- Question 13
-- Find customer-wise successful payment amount.

select 
c.customer_name,
sum(p.paid_amount) as `Successful Payment`
from customers as c
inner join orders as o
on c.customer_id=o.customer_id
inner join payments as p
on o.order_id=p.order_id
where p.payment_status='Success'
group by c.customer_name;


-- Question 14
-- Find highest order amount placed by each customer

select
c.customer_id,
c.customer_name,
max(o.order_amount) as `Higesht Order`
from customers as c
inner join orders as o
on c.customer_id=o.customer_id
group by c.customer_id,c.customer_name;


-- Question 15
-- Find delivered orders with customer and product details.

select
c.customer_name,
p.product_name,
o.order_id,
o.order_amount,
o.order_status
from customers as c
inner join orders as o
on c.customer_id=o.customer_id
inner join products as p
on o.product_id=p.product_id
where o.order_status='Delivered';


-- Question 16
-- Orders table has 7 records. After joining orders with customers, how many records will come
-- only 5 comes because we do the innner join and it matches only the column with records 
select count(*) as join_count
from orders o
inner join customers c
on o.customer_id=c.customer_id;

-- Question 17
-- After joining orders, customers, products and payments, how many records will come?
-- it will show only 3 as it will join all tables and match only the records in all the tables.

select count(*) as join_count 
from orders o
inner join customers c 
on o.customer_id=c.customer_id
inner join products as p
on o.product_id=p.product_id
inner join payments pay
on o.order_id=pay.order_id;


-- Question 18
-- Why is order ID 105 visible when joining orders with customers, but not visible when joining orders with customers and products?

-- > because order id 105 is visible with customers as it got records in customer not matching records with product so it wont show.


-- Question 19
-- Why is order ID 107 visible when joining orders with customers, but not visible when joining orders with payments?

-- > because order id 107 is visible when joining orders with customer as it got nothing in the payments so it wont show.alter


-- Question 20
-- Does INNER JOIN match NULL values?

-- > no it wont show any null values in the output.


-- showing the customer_office table

select * from  customer_offers;


-- Question 21
-- Join customers, orders and customer offers. Show customer name, order ID and offer name.

select 
c.customer_name,
o.order_id,
co.offer_name
from customers as c 
inner join orders as o
on c.customer_id=o.customer_id
inner join customer_offers as co
on c.customer_id=co.customer_id;


-- Question 22
-- Why are more rows coming after joining customer offers?

-- > it is because one customer has multiple orders.


-- Question 23
-- Find one row per customer with total order amount

select 
c.customer_id,
c.customer_name,
sum(o.order_amount) as total_amount
from customers as c 
inner join orders as o 
on c.customer_id=o.customer_id
group by c.customer_id,c.customer_name;


-- showing the city_targets table
select * from city_targets


-- Question 24
-- Compare actual city-wise sales with city-wise monthly target amount.

select 
c.city,sum(o.order_amount) as `Actual Sales`,ct.target_amount
from customers as c
inner join orders as o
on c.customer_id=o.customer_id
inner join city_targets as ct
on c.city=ct.city
and ct.target_month='2026-06-01'
group by c.city,ct.target_amount;

-- Question 25
-- What is INNER JOIN?

-- > it is a type of join in which it matches the record from all the table which we have used and shows us the result of it.it like permuation in the set.


-- Question 26
-- Can INNER JOIN reduce records?

-- > yes it does reduces the records as it always matches the record from the table which we have joined.


-- Question 27
-- Can INNER JOIN increase records?

-- > yes it does increases the record also as it does the row multiplication in the inner join.


-- Question 28
-- Why are repeated rows coming after INNER JOIN?

-- > it can come in the repeated rows after using the inner joins as it does have multiple relationships with table like 1 to 1 or 1 to m. 


-- Question 29
-- Should we use DISTINCT whenever repeated rows come after JOIN?

-- > no we dont have to use it as it requires like business requirement to use it .


-- Question 30
-- When should we not use INNER JOIN?

-- > we shouldn't use inner join if we want unmatched records also.




