DROP DATABASE IF EXISTS advanced_joins_practice;
CREATE DATABASE advanced_joins_practice;
USE advanced_joins_practice;

-- customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);


-- orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount DECIMAL(10,2),
    order_date DATE,
    order_status VARCHAR(30)
);

-- employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    manager_id INT,
    department VARCHAR(50),
    salary DECIMAL(10,2)
    );


-- salary_bands table
CREATE TABLE salary_bands (
    band_name VARCHAR(20),
    min_salary DECIMAL(10,2),
    max_salary DECIMAL(10,2)
);


-- products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50)
);


-- stores table
CREATE TABLE stores (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(50),
    city VARCHAR(50)
);


-- source_customers table
-- This table represents customer data from the old system.
CREATE TABLE source_customers (
    customer_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);


-- target_customers table
-- This table represents customer data after migration into the new system.
CREATE TABLE target_customers (
    customer_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);



-- Insert customers
INSERT INTO customers
(customer_id, customer_name, city)
VALUES
(1, 'Anurag', 'Bengaluru'),
(2, 'Stuti', 'Pune'),
(3, 'Rahul', 'Delhi'),
(4, 'Priya', 'Mumbai'),
(5, 'Neha', 'Bengaluru');


-- Insert orders
INSERT INTO orders
(order_id, customer_id, order_amount, order_date, order_status)
VALUES
(101, 1, 50000.00, '2026-06-01', 'Delivered'),
(102, 1, 1000.00, '2026-06-02', 'Delivered'),
(103, 2, 2500.00, '2026-06-03', 'Delivered'),
(104, 99, 15000.00, '2026-06-04', 'Delivered'),
(105, NULL, 45000.00, '2026-06-05', 'Pending');

-- Data observation:
-- Customer 1 has two orders.
-- Customer 2 has one order.
-- Customers 3, 4, and 5 have no orders.
-- Order 104 has invalid customer_id 99.
-- Order 105 has NULL customer_id.


-- Insert employees
INSERT INTO employees
(employee_id, employee_name, manager_id, department, salary)
VALUES
(1, 'Anurag', NULL, 'Engineering', 200000.00),
(2, 'Stuti', 1, 'Engineering', 120000.00),
(3, 'Shalini', 1, 'Engineering', 130000.00),
(4, 'Vaishnav', 2, 'Engineering', 90000.00),
(5, 'Shruti', 2, 'Engineering', 85000.00),
(6, 'Ritika', NULL, 'HR', 150000.00),
(7, 'Stuti', 6, 'HR', 70000.00);

-- Data observation:
-- Anurag is the Engineering head.
-- Stuti and Shalini report to Anurag.
-- Vaishnav and Shruti report to Engineering Stuti.
-- Ritika is the HR head.
-- HR Stuti reports to Ritika.

-- Note:
-- There are two employees named Stuti, so in some queries we will also show department to avoid confusion.

-- Insert salary bands
INSERT INTO salary_bands
(band_name, min_salary, max_salary)
VALUES
('Junior', 0.00, 80000.00),
('Mid', 80001.00, 120000.00),
('Senior', 120001.00, 160000.00),
('Lead', 160001.00, 250000.00);


-- Insert products
INSERT INTO products
(product_id, product_name, category)
VALUES
(201, 'Laptop', 'Electronics'),
(202, 'Mouse', 'Accessories'),
(203, 'Keyboard', 'Accessories');


-- Insert stores
INSERT INTO stores
(store_id, store_name, city)
VALUES
(1, 'Bengaluru Store', 'Bengaluru'),
(2, 'Pune Store', 'Pune'),
(3, 'Delhi Store', 'Delhi');


-- Insert source customers
INSERT INTO source_customers
(customer_id, customer_name, city)
VALUES
(1, 'Anurag', 'Bengaluru'),
(2, 'Stuti', 'Pune'),
(3, 'Rahul', 'Delhi'),
(4, 'Priya', 'Mumbai');


-- Insert target customers
INSERT INTO target_customers
(customer_id, customer_name, city)
VALUES
(1, 'Anurag', 'Bengaluru'),
(2, 'Stuti', 'Pune'),
(3, 'Rahul', 'Noida'),
(5, 'Neha', 'Bengaluru');

-- Data observation:
-- Customer 1 matches in both.
-- Customer 2 matches in both.
-- Customer 3 exists in both but city is different.
-- Customer 4 exists only in source.
-- Customer 5 exists only in target.

-- This data is useful for migration validation and FULL OUTER JOIN examples.

-- 5. Check Data
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM employees;
SELECT * FROM salary_bands;
SELECT * FROM products;
SELECT * FROM stores;
SELECT * FROM source_customers;
SELECT * FROM target_customers;