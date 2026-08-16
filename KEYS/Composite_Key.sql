-- 7) composite key 

-- A Composite Key is a key formed by combining two or more columns together to identify a single row in a table

-- ddl for the table customer_composite.

CREATE TABLE IF NOT EXISTS customer_composite (
    customer_id INT ,
    customer_name VARCHAR(50),
    email VARCHAR(50),
    phone VARCHAR(50),
    city VARCHAR(50),
    primary key(phone,city)                    -- primary key is phone+city.

);	

-- in this table we have primary key as phone and city. it means it is a combination of phone and city not single phone and single city.

-- test 1 
-- PASSES: First row inserted successfully
INSERT INTO customer_composite (customer_id, customer_name, email, phone, city)
VALUES (1, 'Swornim', 'Swornim@email.com', '9800000000', 'Kathmandu');

-- test 2
-- PASSES: Phone '9800000000' repeats, but city is 'Pokhara'
-- Combined Pair: ('9800000000', 'Pokhara') is unique!
INSERT INTO customer_composite (customer_id, customer_name, email, phone, city)
VALUES (2, 'Sushant', 'Sushant@email.com', '9800000000', 'Pokhara');


-- test 3
-- PASSES: City 'Kathmandu' repeats, but phone is '9811111111'
-- Combined Pair: ('9811111111', 'Kathmandu') is unique!
INSERT INTO customer_composite (customer_id, customer_name, email, phone, city)
VALUES (3, 'Himesh', 'charlie@email.com', '9811111111', 'Kathmandu');


-- test 4
-- FAILS: Error Code 1062 (Duplicate entry '9800000000-Kathmandu' for key 'PRIMARY')
-- Reason: The pair ('9800000000', 'Kathmandu') already exists in Step 1!
INSERT INTO customer_composite (customer_id, customer_name, email, phone, city)
VALUES (4, 'Ram', 'ram@email.com', '9800000000', 'Kathmandu');


-- test 5 
-- FAILS: Error Code 1048 (Column 'phone' cannot be null)
-- Reason: Columns that form a Primary Key automatically reject NULL values.
INSERT INTO customer_composite (customer_id, customer_name, email, phone, city)
VALUES (5, 'hari', 'hari@email.com', NULL, 'Lalitpur');




