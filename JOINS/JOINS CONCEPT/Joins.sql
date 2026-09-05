-- Joins

-- > the joins is used to combine 2 or more then 2 tables together based on a common column.


-- why not keep all the data in a single table?
-- > because data will be repeated again and again.

-- creating a new table from scratch to test and understand the join in the sql.

-- creating a new database.
create database DataX_JOINS;
use DataX_JOINS;

-- creating table customer in the database.
create table if not exists customer
(
customer_id int primary key,
customer_name varchar(50),
city varchar(50)

);

-- creating a orders table
create table if not exists orders
(
order_id int primary key,
customer_id int,
order_amount decimal(10,2),
order_date date
);

-- Insert the data to Cusotmers table.

Insert Into customer(Customer_id,Customer_name, City)
VALUES 
(1,'Swornim','Thimi'),
(2,'Sushant','Thimi'),
(3,'Ram','Kathmandu'),
(4,'Hari','Biratnagar'),
(5,'Shyam','Butwal');	

select * from customer;


-- Inserting to Orders table 
Insert Into orders(Order_id,Customer_id,Order_amount, Order_date)
VALUES 
(101,1,50000,'2026-02-11'),
(102,2,87000,'2026-05-20'),
(103,1,70000,'2026-05-25'),
(105,3,508900,'2026-06-26'),
(106,3,578000,'2026-07-23'),
(107,3,66000,'2026-03-23');

select * from orders;


-- now seeing the table of the orders we can clearly see 1 as swornim has 2 orders, 2 as sushant got only 1 order
-- 3 as ram has 3 orders and 4 as hari and 5 as shyam got no orders.


-- 1st query print all the data present in the both tables.
select * from orders as o 
join customer as c
on c.customer_id=o.customer_id; 
-- This is an INNER JOIN.
-- It returns only the orders that have a matching customer.

-- 2nd query 
select c.customer_id,o.order_id,c.customer_name,o.order_amount,o.order_date 
from orders as o
inner join customer as c
on o.customer_id=c.customer_id;

-- where joins can be used
-- 1) reporting the data 
-- like 	show me the customer records including its name,city,order amount and date

select c.customer_name,c.city,o.order_amount,o.order_date from customer as c 
join orders as o
on c.customer_id=o.customer_id;

-- 2) Data enrichment

-- > In data engineering converting raw data into more valuable data by adding extra information for analysis and decision-making.

-- 3) Data validatation
-- > It simply means checking the data is correct,complete and follows the required rules or not.



-- Mistaked done by me 

-- 1)forgetting the on condition
-- 2) joining with wrong column.




-- Different types of join to be discussed.

-- inner join(THE MOST USED ONE)
-- left join(VERY FAMOUS)
-- right join                                          -- the most used joins are inner,left and right join.

-- full outer join 
-- cross join
-- self join
-- NON-EQUI join	
-- natural join
-- anti join
-- semi join




