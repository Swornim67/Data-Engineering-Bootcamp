-- Complete SQL Setup
-- Use this setup from scratch.

DROP DATABASE IF EXISTS joins_practice;
CREATE DATABASE joins_practice;
USE joins_practice;


-- Create Tables
-- customers table
CREATE TABLE customers (
customer_id INT PRIMARY KEY,
customer_name VARCHAR(50) NOT NULL,
city VARCHAR(50),
signup_date DATE
);

-- orders table
CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_id INT,
product_id INT,
order_amount DECIMAL(10,2),
order_date DATE,
order_status VARCHAR(30)
);


-- products table
CREATE TABLE products (
product_id INT PRIMARY KEY,
product_name VARCHAR(100) NOT NULL,
category VARCHAR(50)
);

-- payments table
CREATE TABLE payments (
payment_id INT PRIMARY KEY,
order_id INT,
payment_mode VARCHAR(30),
payment_status VARCHAR(30),
paid_amount DECIMAL(10,2),
payment_date DATE
);

-- Note:
-- Foreign key constraints are not added intentionally.
-- This helps us insert some invalid records and understand unmatched data clearly.

-- Insert Sample Data

-- Insert customers

INSERT INTO customers
(customer_id, customer_name, city, signup_date)
VALUES
(1, 'Anurag', 'Bengaluru', '2026-01-10'),
(2, 'Stuti', 'Pune', '2026-02-15'),
(3, 'Rahul', 'Delhi', '2026-03-12'),
(4, 'Priya', 'Mumbai', '2026-04-05'),
(5, 'Neha', 'Bengaluru', '2026-05-20'),
(6, 'Aman', 'Hyderabad', '2026-06-10');


-- Insert products
INSERT INTO products
(product_id, product_name, category)
VALUES
(201, 'Laptop', 'Electronics'),
(202, 'Mouse', 'Accessories'),
(203, 'Keyboard', 'Accessories'),
(204, 'Monitor', 'Electronics'),
(205, 'Webcam', 'Accessories');


-- Insert orders

INSERT INTO orders
(order_id, customer_id, product_id, order_amount, order_date, order_status)
VALUES
(101, 1, 201, 50000.00, '2026-06-01', 'Delivered'),
(102, 1, 202, 1000.00, '2026-06-02', 'Delivered'),
(103, 2, 203, 2500.00, '2026-06-03', 'Delivered'),
(104, 99, 204, 15000.00, '2026-06-04', 'Delivered'),
(105, 3, 999, 3500.00, '2026-06-05', 'Delivered'),
(106, NULL, 201, 45000.00, '2026-06-06', 'Pending'),
(107, 5, 202, 1200.00, '2026-06-07', 'Cancelled'),
(108, 2, 201, 48000.00, '2026-06-08', 'Delivered');

-- Important observations:
-- Anurag has 2 orders.
-- Stuti has 2 orders.
-- Rahul has 1 order with invalid product ID.
-- Priya has no order.
-- Aman has no order.
-- Order 104 has invalid customer ID 99.
-- Order 105 has invalid product ID 999.
-- Order 106 has customer_id = NULL.
-- Order 107 has no payment.


-- Insert payments

INSERT INTO payments
(payment_id, order_id, payment_mode, payment_status, paid_amount, payment_date)
VALUES
(1001, 101, 'UPI', 'Success', 50000.00, '2026-06-01'),
(1002, 102, 'Card', 'Success', 1000.00, '2026-06-02'),
(1003, 103, 'UPI', 'Failed', 0.00, '2026-06-03'),
(1004, 105, 'Wallet', 'Success', 3500.00, '2026-06-05'),
(1005, 999, 'UPI', 'Success', 3000.00, '2026-06-08'),
(1006, 108, 'Card', 'Success', 48000.00, '2026-06-08');


-- Important observations:
-- Payment 1001 belongs to order 101.
-- Payment 1002 belongs to order 102.
-- Payment 1003 belongs to order 103, but payment failed.
-- Payment 1004 belongs to order 105.
-- Payment 1005 belongs to invalid order ID 999.
-- Payment 1006 belongs to order 108.
-- Order 107 has no payment.


-- Check the Data
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM payments;


-- Check row counts:
SELECT COUNT(*) AS customer_count FROM customers;
SELECT COUNT(*) AS product_count FROM products;
SELECT COUNT(*) AS order_count FROM orders;
SELECT COUNT(*) AS payment_count FROM payments;
