-- =========================================================
-- 1. DATABASE SETUP
-- =========================================================

-- Delete the database if it already exists
DROP DATABASE IF EXISTS joins_practice;

-- Create a fresh database
CREATE DATABASE joins_practice;

-- Select the database
USE joins_practice;


-- =========================================================
-- 2. CREATE TABLES
-- =========================================================

-- ---------------------------------------------------------
-- CUSTOMERS TABLE
-- Stores information about customers
-- ---------------------------------------------------------
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    city VARCHAR(50),
    signup_date DATE
);


-- ---------------------------------------------------------
-- PRODUCTS TABLE
-- Stores information about products
-- ---------------------------------------------------------
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50)
);


-- ---------------------------------------------------------
-- ORDERS TABLE
-- Stores customer orders
-- customer_id connects orders to customers
-- product_id connects orders to products
-- ---------------------------------------------------------
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_amount DECIMAL(10,2),
    order_date DATE,
    order_status VARCHAR(30)
);


-- ---------------------------------------------------------
-- PAYMENTS TABLE
-- Stores payment information for orders
-- order_id connects payments to orders
-- ---------------------------------------------------------
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_mode VARCHAR(30),
    payment_status VARCHAR(30),
    paid_amount DECIMAL(10,2),
    payment_date DATE
);


-- =========================================================
-- 3. INSERT SAMPLE DATA
-- =========================================================

-- ---------------------------------------------------------
-- INSERT DATA INTO CUSTOMERS
-- ---------------------------------------------------------
INSERT INTO customers
(customer_id, customer_name, city, signup_date)
VALUES
(1, 'Anurag', 'Bengaluru', '2026-01-10'),
(2, 'Stuti', 'Pune', '2026-02-15'),
(3, 'Rahul', 'Delhi', '2026-03-12'),
(4, 'Priya', 'Mumbai', '2026-04-05'),
(5, 'Neha', 'Bengaluru', '2026-05-20');


-- ---------------------------------------------------------
-- INSERT DATA INTO PRODUCTS
-- ---------------------------------------------------------
INSERT INTO products
(product_id, product_name, category)
VALUES
(201, 'Laptop', 'Electronics'),
(202, 'Mouse', 'Accessories'),
(203, 'Keyboard', 'Accessories'),
(204, 'Monitor', 'Electronics');


-- ---------------------------------------------------------
-- INSERT DATA INTO ORDERS
-- ---------------------------------------------------------
INSERT INTO orders
(order_id, customer_id, product_id, order_amount, order_date, order_status)
VALUES
(101, 1, 201, 50000.00, '2026-06-01', 'Delivered'),
(102, 1, 202, 1000.00, '2026-06-02', 'Delivered'),
(103, 2, 203, 2500.00, '2026-06-03', 'Delivered'),

-- customer_id 99 does not exist in customers
-- Useful for practicing JOINs
(104, 99, 204, 15000.00, '2026-06-04', 'Delivered'),

-- product_id 999 does not exist in products
-- Useful for practicing JOINs
(105, 3, 999, 3500.00, '2026-06-05', 'Delivered'),

-- customer_id is NULL
-- Useful for practicing JOINs with NULL values
(106, NULL, 201, 45000.00, '2026-06-06', 'Pending'),

(107, 5, 202, 1200.00, '2026-06-07', 'Cancelled');


-- ---------------------------------------------------------
-- INSERT DATA INTO PAYMENTS
-- ---------------------------------------------------------
INSERT INTO payments
(payment_id, order_id, payment_mode, payment_status, paid_amount, payment_date)
VALUES
(1001, 101, 'UPI', 'Success', 50000.00, '2026-06-01'),
(1002, 102, 'Card', 'Success', 1000.00, '2026-06-02'),
(1003, 103, 'UPI', 'Failed', 0.00, '2026-06-03'),
(1004, 105, 'Wallet', 'Success', 3500.00, '2026-06-05'),

-- order_id 999 does not exist in orders
-- Useful for practicing JOINs
(1005, 999, 'UPI', 'Success', 3000.00, '2026-06-08');


-- =========================================================
-- 4. CHECK THE DATA
-- =========================================================

-- Display all customers
SELECT * FROM customers;

-- Display all products
SELECT * FROM products;

-- Display all orders
SELECT * FROM orders;

-- Display all payments
SELECT * FROM payments;


-- =========================================================
-- 5. CHECK TABLE COUNTS
-- =========================================================

-- Count total customers
SELECT COUNT(*) AS customer_count
FROM customers;

-- Count total products
SELECT COUNT(*) AS product_count
FROM products;

-- Count total orders
SELECT COUNT(*) AS order_count
FROM orders;

-- Count total payments
SELECT COUNT(*) AS payment_count
FROM payments;


-- =========================================================
-- EXPECTED COUNTS
-- =========================================================
-- customers = 5
-- products  = 4
-- orders    = 7
-- payments  = 5
-- =========================================================
-- =========================================================

-- Extra DDL: customer_offers table
CREATE TABLE customer_offers (
offer_id INT PRIMARY KEY,
customer_id INT,
offer_name VARCHAR(100)
);
-- =========================================================
-- =========================================================
-- Extra DML: Insert offers
INSERT INTO customer_offers
(offer_id, customer_id, offer_name)
VALUES
(1, 1, 'Festive Discount'),
(2, 1, 'Premium Customer Offer'),
(3, 2, 'UPI Cashback');
-- =========================================================
-- =========================================================
-- Extra DDL: city_targets table
CREATE TABLE city_targets (
city VARCHAR(50),
target_month DATE,
target_amount DECIMAL(10,2)
);
-- =========================================================
-- =========================================================
-- Extra DML: Insert city targets
INSERT INTO city_targets
(city, target_month, target_amount)
VALUES
('Bengaluru', '2026-06-01', 60000.00),
('Pune', '2026-06-01', 10000.00),
('Delhi', '2026-06-01', 8000.00),
('Mumbai', '2026-06-01', 7000.00);
-- =========================================================
-- =========================================================


