-- SQL Query Execution Order


-- THIS IS THE WRITING SEQUENCE IN THE SQL. 

-- SELECT
-- FROM 
-- JOIN 
-- WHERE 
-- GROUP BY 
-- HAVING 
-- ORDER BY 
-- LIMIT

-- THIS IS THE EXECUTION ORDER IN THE SQL.

-- FROM
-- JOIN/ON 
-- WHERE
-- GROUP BY 
-- HAVING
-- SELECT
-- DISTINCT 
-- ORDER BY 
-- LIMIT 

-- ============================================================
-- SQL EXECUTION ORDER - PRACTICE SETUP
-- ============================================================

-- ============================================================
-- 1. CREATE DATABASE
-- ============================================================

-- Delete the database if it already exists
-- This ensures we start with a clean database
DROP DATABASE IF EXISTS sql_execution_order;

-- Create a new database
CREATE DATABASE sql_execution_order;

-- Select the database to work with
USE sql_execution_order;


-- ============================================================
-- 2. CREATE CUSTOMERS TABLE
-- ============================================================

-- Create the customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);


-- ============================================================
-- 3. CREATE ORDERS TABLE
-- ============================================================

-- Create the orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_category VARCHAR(50),
    order_amount DECIMAL(10,2),
    order_status VARCHAR(30),
    order_date DATE
);


-- ============================================================
-- 4. INSERT DATA INTO CUSTOMERS TABLE
-- ============================================================

-- Insert customer records into the customers table
INSERT INTO customers
    (customer_id, customer_name, city)
VALUES
    (1, 'Anurag', 'Bengaluru'),
    (2, 'Stuti', 'Pune'),
    (3, 'Rahul', 'Delhi'),
    (4, 'Priya', 'Mumbai'),
    (5, 'Neha', 'Bengaluru');


-- ============================================================
-- 5. INSERT DATA INTO ORDERS TABLE
-- ============================================================

-- Insert order records into the orders table
INSERT INTO orders
    (order_id, customer_id, product_category, order_amount, order_status, order_date)
VALUES
    (101, 1, 'Electronics', 50000.00, 'Delivered', '2026-06-01'),
    (102, 1, 'Accessories', 1000.00, 'Delivered', '2026-06-02'),
    (103, 2, 'Accessories', 2500.00, 'Delivered', '2026-06-03'),
    (104, 2, 'Electronics', 48000.00, 'Delivered', '2026-06-04'),
    (105, 3, 'Accessories', 3500.00, 'Cancelled', '2026-06-05'),
    (106, 4, 'Electronics', 15000.00, 'Pending', '2026-06-06'),
    (107, 5, 'Accessories', 1200.00, 'Delivered', '2026-06-07'),
    (108, 5, 'Electronics', 22000.00, 'Delivered', '2026-06-08');


-- ============================================================
-- 6. CHECK THE DATA
-- ============================================================

-- Display all records from the customers table
SELECT *
FROM customers;

-- Display all records from the orders table
SELECT *
FROM orders;