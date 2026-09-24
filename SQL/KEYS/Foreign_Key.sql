-- 2) Foreign Key
-- A foreign key is a column or group of columns that creates a relationship
-- between two tables by referring to the primary key of another table.

-- DDL FOR THE TABLE NAME ORDER
create table if not exists orders
(
order_id int primary key,
customer_id int,
order_date date,
total_amount decimal(10,2),

constraint fk_order_customer                     -- this indicate that we have set a rule 
foreign key(customer_id)                         -- taken the foreign key from the customer table customer_id as foreign key for the order table.
references customer(customer_id)                 -- taken refence from the customer table customer_id as foreign key.
);

-- we took the customer table column named customer_id which is primary key as orders table foreign key which connects both the table and maintain 
-- their relationship with each other.

-- now inserting values in the orders table
insert into orders values
(001,101,'2026-01-01',69990.69),
(002,101,'2026-01-01',69990.69);             -- inserted same data

-- going to delete the duplicate data from the orders table
delete from orders 
where order_id=002;

-- checking the data inside the orders table
select * from orders;

-- inserting more data into the orders table
insert into orders values
(002,102,'2026-02-02',67000.69),
(003,103,'2026-03-03',66000.69),
(004,104,'2026-04-04',1000000.69);
-- succesfully

-- checking the inserted data in the order table
select * from orders;

-- now as we know if there is value created in the column of the customer_id then only we can add it in the order table 
-- so we will try to add null and duplicate customer_id from the order table to check the working of the foreign key

insert into orders values
(002,102,'2026-02-02',67000.69);   
-- we already inserted this value in the orders table lets see will this be inserted again in the orders table or not.
-- nope we cant insert it in the orders table as it says:Error Code: 1062. Duplicate entry '2' for key 'orders.PRIMARY'
-- it's not being inserted because we have created order_id as a primary key and primary key should be unique,not null and only 1 in the entire table.

-- now we are inserting another value which isnt present in the customer_id
insert into orders values
(005,105,'2026-02-02',67000.69);  
-- we changed the order_id and customer_id still we cant add this in the orders table 
-- as the 105 isnt created in the column of the customer_id 
-- response:Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`Practice`.`orders`, CONSTRAINT `fk_order_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`))

-- now inserting the same data but with different order_id
insert into orders values
(005,101,'2026-02-02',67000.69);  
-- successfull 
-- because we created a new order_id value but we kept the same value from the customer_id 
-- sql behaves as this value also belongs to the customer_id 101 meaning 101 has 2 value inside it.

-- now testing the null in the customer_id which is foreign key in the orders table
insert into orders values
(006,null,'2026-02-02',67000.69);  
-- succesfull 
-- as we know the primary key cant be null but the foreign key can be null so this worked in this case.

-- checking all the inserted values in the orders table
select * from orders;