-- what is left join

-- > left join says all the record from the left table and the matching records from both table.alter

-- LEFT JOIN= INNER JOIN + ROW DATA FROM THE LEFT TABLE.


-- Understanding with examples


use joins_practice;

select * from customers;
select * from orders;
select * from payments;
select * from products;




-- checking the rows from the particular table
select count(*) from customers;
select count(*) from orders;
select count(*) from payments;
select count(*) from products;

-- Question 1- Show all the customers and their orders if available

select 
c.customer_id,c.customer_name,o.order_id
from customers as c
left join orders as o
on c.customer_id=o.customer_id;

-- Question 2- show all the customers and their orders details if they have placed any orders.
-- this shows each and every customer name with their orders and people who havent ordered anything.

select 
c.customer_id,c.customer_name,o.order_id,o.order_amount,o.order_status
from customers as c 
left join orders as o
on c.customer_id=o.customer_id;

-- where o.order_id is not null; it simply removes the person who havent ordered anything even though they exist in the customer table.


-- Question 3- Find the customer who haven't ordered anything.

select c.customer_id,
c.customer_name,c.city
from customers as c 
left join orders as o
on c.customer_id=o.customer_id
where o.order_id is null;

-- this is also called as anti-join.

-- Question 4- Find orders with invalid customers.

select 
o.customer_id,c.customer_name,o.order_status,o.order_amount
from orders as o
left join customers as c
on o.customer_id=c.customer_id
where c.customer_id is null;


-- Question 5- Find the orders with invalid products

select 
o.order_id,o.product_id,o.order_amount,o.order_status
from orders as o
left join products as p
on o.product_id=p.product_id
where p.product_id is  null ;


-- Question 6 - Find payments with invalid products.

-- so payment and product id can't be joined cause payment doesnt have the product id so we include another table into this query.

select 
p.payment_id,p.order_id
from payments as p
left join orders as o
on p.order_id=o.order_id
left join products as pr
on o.product_id=pr.product_id
where pr.product_id is null;


-- Question 7 - Find orders without payments

select 
o.order_id,o.order_amount,o.order_status
from orders as o
left join payments as p
on o.order_id=p.order_id
where p.order_id is null;




-- Coalesce 

-- > A function that replaces a NULL value with a value you choose instead 
-- like a teacher writing "0" instead of leaving a blank spot for an absent student.

-- Question (Left join with coalesce)
-- want all the customers with order status if there is no orders then show "NO ORDERS"

select c.customer_id,
c.customer_name,
coalesce(o.order_amount,"0") as order_amount,
coalesce(o.order_status,"NO ORDERS") as order_status 
from customers as c 
left join orders as o
on c.customer_id=o.customer_id;

-- Left join with aggregation

-- Question - show every customer with total money spent

select 
c.customer_id,c.customer_name,
coalesce(sum(o.order_amount),0) as total_spent
from customers as c
left join orders as o
on c.customer_id=o.customer_id
group by c.customer_id,c.customer_name;

-- comparing where and on clause on the left join 

-- where ( It only shows in our case only succesfully delivered orders)
select
c.customer_name,
o.order_id,
o.order_status
from customers as c
left join orders as o
on c.customer_id=o.customer_id
where o.order_Status='Delivered';

-- on ( It Showed  us all succesfully delivered orders with people who haven't ordered anything also.)

select
c.customer_name,
o.order_id,
o.order_status
from customers as c
left join orders as o
on c.customer_id=o.customer_id
and o.order_status='Delivered';



