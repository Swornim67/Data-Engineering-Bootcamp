-- Right Join

-- > All the records from the right table and the common records matching from the left table.


-- If no matching Records scenario:
-- > If no common records are found between the left and right table using the right join it will just provide us the records of the right table.

-- > It is not used as frequently as inner and left join.


-- Examples

-- I want the orders that right joins the customers.

use DataX_JOINS;
select * from customer;
select * from orders;

-- Right Join
select * from orders o 
right join customer c 
on o.customer_id=c.customer_id;   -- this showed me each and everything of the customer including the people who havent ordered anything.



-- Using the left join to produce the same output 

select * from customer c
left join orders o 
on c.customer_id=o.customer_id;

-- simple analogy

-- left join = gives output of left table + matching results with the right table. it protects the left table.

-- Right join = gives output of Right table + matching results with the Left table. it protects the Right table.


-- EXAMPLES.

-- showing all the customers details 

select * from orders as o 
right join customer c 
on o.customer_id=c.customer_id;

-- showing only those people who have ordered 
select * from customer as c 
right join orders as o
on c.customer_id=o.customer_id;


-- why right join is used rarely used ?

-- > Because 

-- 1) LEFT JOIN IS EASY TO READ BECAUSE DEVELOPERS READ FROM LEFT TO RIGHT NOT FROM RIGHT TO LEFT.
-- 2) QUERY FLOW IS NATURAL.
-- 3) DEVELOPERS USUALLY KEEPS THE MAIN TABLE IN THE LEFT SIDE.
-- 4) ANY LEFT JOIN CAN BE REWRITTED TO RIGHT AND ANY RIGHT JOIN CAN ME REWRITTED TO LEFT.




-- Now using the joins_practice database.

use joins_practice;

select * from customers;
select * from orders;
select * from payments;
select * from products;


-- EXAMPLES 

-- 1) SHOW ALL THE CUSTOMERS AND THEIR ORDERS IF AVAILABLE

-- right join
select * from orders o
right join customers c 
on o.customer_id=c.customer_id;

-- left join
select * from customers c
left join orders o 
on c.customer_id=o.customer_id;

-- 2) SHOW ALL CUSTOMERS EVEN IF THEY HAVENT ORDERED ANYTHING.alter

-- right join 
select * from orders o 
right join customers c
on o.customer_id=c.customer_id;

-- left join
select * from customers as c
left join orders as o
on c.customer_id=o.customer_id;

-- 3) ALL PRODUCTS WITH ORDERS USING THE RIGHT JOIN

-- right join
select * from orders o 
right join products p 
on o.product_id=p.product_id;

-- left join 
select * from products p 
left join orders o 
on p.product_id=o.product_id;

-- 4) ALL THE ORDERS WITH PAYMENT USING THE RIGHT JOIN.

-- right join
select * from payments p 
right join orders o 
on p.order_id=o.order_id;

-- left join 
select * from orders o 
left join payments p 
on o.order_id=p.order_id;

-- 5) FIND THE CUSTOMER WHO HAVE NEVER ORDERED USING THE RIGHT JOIN.

-- right join
select * from  orders o 
right join customers c 
on o.customer_id=c.customer_id
where o.order_id is null;

-- left join 
select * from customers c 
left join orders o 
on c.customer_id=o.customer_id
where o.order_id is null;

-- 6) FIND THE PRODUCTS NEVER ORDERED USING THE RIGHT JOIN.

-- right join 
select * from orders o 
right join products p 
on o.product_id=p.product_id
where o.order_id is null;

-- left join 
select * from products p 
left join orders o 
on p.product_id=o.product_id
where o.order_id is null; 


-- 7) SHOW EVERY CUSTOMER WITH TOTAL ORDER AMOUNT USING THE RIGHT JOIN.

-- right join
select 
c.customer_id,c.customer_name,
coalesce(sum(o.order_amount),0 )as `Total Order Amount`
from orders o 
right join customers c
on o.customer_id=c.customer_id
group by c.customer_id,c.customer_name;

-- left join  

select 
c.customer_id,c.customer_name,coalesce(sum(o.order_amount), 0)as `Total Order Amount` 
from customers c 
left join orders o 
on c.customer_id=o.customer_id
group by c.customer_id,c.customer_name;