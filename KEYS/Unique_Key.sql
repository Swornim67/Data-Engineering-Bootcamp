-- 5) UNIQUE Key 

-- > Ensures all values in a column (or combination of columns) are distinct.
-- > Key Rules: Allows NULL values, can have MULTIPLE per table, and can be Composite.

CREATE TABLE IF NOT EXISTS customer_unique (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(50),
    phone VARCHAR(50),
    city VARCHAR(50),

    -- Table-level Composite Unique Constraint
    CONSTRAINT unique_customer_contact UNIQUE(email, phone)
);

-- 1) Insert valid data
INSERT INTO customer_unique VALUES
(100, 'Swornim Regmi', 'regmiswornim2061@gmail.com', '9746421456', 'Thimi'),
(101, 'Sushant Regmi', 'regmisushant2010@gmail.com', '9801755300', 'Thimi');

-- 2) Insert NULLs (Allowed in UNIQUE columns)
INSERT INTO customer_unique VALUES
(102, 'Sunita Regmi', NULL, '9842065366', 'Thimi'),
(103, 'Prabodh Regmi', NULL, '9852056400', 'Thimi');

-- 3) Insert Duplicate Combination (BLOCKED)
INSERT INTO customer_unique VALUES
(104, 'Himesh Regmi', 'regmiswornim2061@gmail.com', '9746421456', 'Thimi');
-- Error Code: 1062. Duplicate entry 'regmiswornim2061@gmail.com-9746421456'

-- 4) Partial Duplicate (ALLOWED because the composite pair is unique)
INSERT INTO customer_unique VALUES
(105, 'Swornim Alt', 'regmiswornim2061@gmail.com', '9800000000', 'Thimi');

-- 5) Drop Constraint Syntax
-- ALTER TABLE customer_unique DROP CONSTRAINT unique_customer_contact;
