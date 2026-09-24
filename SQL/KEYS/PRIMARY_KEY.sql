-- Sql Keys

-- > These are the column or group of Columns which are used to link other tables.

-- It is used in 
-- Data Modeling
-- Table Design
-- Joins
-- Duplicate Detection 

-- 1) Primary Key

-- > It is a column or group of column which uniquely identifies each row in a table.
-- 3 most important properties

-- 1) can't be null.
-- 2) It has to be unique.
-- 3) A table can only have 1 primary key in it.

-- DDL for the table name Customer

create table if not exists customer
(
customer_id int primary key,
customer_name varchar(50),
email varchar(50),
phone varchar(50),
city varchar(50)
);
-- Successfully created a table named customer now will enter the data in this.


INSERT INTO customer VALUES
(100,'Swornim Regmi','regmiswornim2061@gmail.com','9746421456','Thimi'),
(101,'Sushant Regmi','regmisushant2010@gmail.com','9801755300','Thimi'),
(102,'Sunita Regmi','regmisunita2037@gmail.com','9842065366','Thimi'),
(103,'Prabodh Raj Regmi','regmiprabodh@gmail.com','9852056400','Thimi');

-- Checking the inserted value in the table customer

select * from customer;

-- now as we inserted the value will try to insert null or duplicate data in this to check the primary key working 

insert into customer values
(100,'Himesh Regmi','regmiswornim2061@gmail.com',9746421456,'Thimi');


-- so i got this reponse while entering the same primary key but with different name:Error Code: 1062. Duplicate entry '100' for key 'customer.PRIMARY'


-- now will try to insert the different primary key but with same details 

insert into customer values
(105,'Swornim Regmi','regmiswornim2061@gmail.com',9746421456,'Thimi');

-- succesfull as we know that primary key must be unique sql doesnt care with the data inside the primary key.


-- now trying to insert the null in the primary key and will check its reponse 

insert into customer values
(null,'Swornim Regmi','regmiswornim2061@gmail.com',9746421456,'Thimi')


-- this is the response we got in this: Error Code: 1048. Column 'customer_id' cannot be null




