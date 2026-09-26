-- database we are using fot the  practice
CREATE DATABASE subqueries_cte_case;
USE subqueries_cte_case;

-- tables being created.
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    city VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    customer_id INT,
    product_id INT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    price_each DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Inserting Data in the customers table
INSERT INTO customers VALUES
(1, 'John', 'Doe', 'Delhi', 'john.doe@example.com'),
(2, 'Jane', 'Smith', 'Mumbai', 'jane.smith@example.com'),
(3, 'Raj', 'Kumar', 'Bangalore', 'raj.kumar@example.com'),
(4, 'Priya', 'Sharma', 'Hyderabad', 'priya.sharma@example.com'),
(5, 'Tom', 'Brown', 'Pune', 'tom.brown@example.com'),
(6, 'Sara', 'Ali', 'Chennai', 'sara.ali@example.com'),
(7, 'Vikram', 'Singh', 'Delhi', 'vikram.singh@example.com'),
(8, 'Neha', 'Patel', 'Mumbai', 'neha.patel@example.com'),
(9, 'David', 'Lee', 'Kolkata', 'david.lee@example.com'),
(10, 'Amit', 'Verma', 'Jaipur', 'amit.verma@example.com'),
(11, 'Emily', 'Clark', 'Delhi', 'emily.clark@example.com'),
(12, 'Ananya', 'Roy', 'Mumbai', 'ananya.roy@example.com'),
(13, 'Sam', 'Wilson', 'Pune', 'sam.wilson@example.com'),
(14, 'Pooja', 'Das', 'Hyderabad', 'pooja.das@example.com'),
(15, 'Arjun', 'Nair', 'Chennai', 'arjun.nair@example.com'),
(16, 'Kavita', 'Gupta', 'Bangalore', 'kavita.gupta@example.com'),
(17, 'Robert', 'King', 'Delhi', 'robert.king@example.com'),
(18, 'Meera', 'Joshi', 'Mumbai', 'meera.joshi@example.com'),
(19, 'Michael', 'Scott', 'Kolkata', 'michael.scott@example.com'),
(20, 'Ravi', 'Menon', 'Pune', 'ravi.menon@example.com'),
(21, 'Tina', 'Fernandez', 'Delhi', 'tina.fernandez@example.com'),
(22, 'Arvind', 'Singh', 'Hyderabad', 'arvind.singh@example.com'),
(23, 'Lucy', 'Adams', 'Chennai', 'lucy.adams@example.com'),
(24, 'Karan', 'Malhotra', 'Mumbai', 'karan.malhotra@example.com'),
(25, 'Sneha', 'Reddy', 'Pune', 'sneha.reddy@example.com'),
(26, 'George', 'Mason', 'Bangalore', 'george.mason@example.com'),
(27, 'Vishal', 'Kapoor', 'Kolkata', 'vishal.kapoor@example.com'),
(28, 'Emma', 'Watson', 'Delhi', 'emma.watson@example.com'),
(29, 'Siddharth', 'Jain', 'Hyderabad', 'siddharth.jain@example.com'),
(30, 'Olivia', 'Brown', 'Chennai', 'olivia.brown@example.com'),
(31, 'Nikhil', 'Arora', 'Mumbai', 'nikhil.arora@example.com'),
(32, 'Ayesha', 'Khan', 'Delhi', 'ayesha.khan@example.com'),
(33, 'Chris', 'Evans', 'Bangalore', 'chris.evans@example.com'),
(34, 'Ishita', 'Bhatt', 'Kolkata', 'ishita.bhatt@example.com'),
(35, 'Shyam', 'Patil', 'Pune', 'shyam.patil@example.com'),
(36, 'Sophia', 'Green', 'Chennai', 'sophia.green@example.com'),
(37, 'Harsh', 'Aggarwal', 'Hyderabad', 'harsh.aggarwal@example.com'),
(38, 'Liam', 'Martin', 'Delhi', 'liam.martin@example.com'),
(39, 'Diya', 'Saxena', 'Mumbai', 'diya.saxena@example.com'),
(40, 'Jason', 'Taylor', 'Kolkata', 'jason.taylor@example.com'),
(41, 'Ritika', 'Mehra', 'Pune', 'ritika.mehra@example.com'),
(42, 'Steve', 'Jobs', 'Bangalore', 'steve.jobs@example.com'),
(43, 'Alisha', 'Paul', 'Hyderabad', 'alisha.paul@example.com'),
(44, 'Dhruv', 'Singhania', 'Chennai', 'dhruv.singhania@example.com'),
(45, 'Rebecca', 'Lewis', 'Delhi', 'rebecca.lewis@example.com'),
(46, 'Naveen', 'Shetty', 'Mumbai', 'naveen.shetty@example.com'),
(47, 'Julia', 'Roberts', 'Pune', 'julia.roberts@example.com'),
(48, 'Parth', 'Desai', 'Hyderabad', 'parth.desai@example.com'),
(49, 'Nina', 'Shah', 'Chennai', 'nina.shah@example.com'),
(50, 'Aria', 'Gill', 'Bangalore', 'aria.gill@example.com');

-- Inserting data in the orders table
INSERT INTO orders VALUES
(1001, 1, '2023-01-10', 54000),
(1002, 2, '2023-01-11', 30000),
(1003, 3, '2023-01-15', 1500),
(1004, 1, '2023-02-01', 3500),
(1005, 4, '2023-02-05', 4000),
(1006, 5, '2023-02-08', 7000),
(1007, 6, '2023-03-01', 50000),
(1008, 7, '2023-03-05', 15000),
(1009, 8, '2023-03-09', 1000),
(1010, 9, '2023-03-10', 2500),
(1011, 10, '2023-03-12', 19000),
(1012, 11, '2023-03-15', 4500),
(1013, 12, '2023-03-18', 24000),
(1014, 13, '2023-03-20', 1800),
(1015, 14, '2023-03-22', 30000),
(1016, 15, '2023-03-25', 28000),
(1017, 16, '2023-03-28', 32000),
(1018, 17, '2023-03-30', 500),
(1019, 18, '2023-04-01', 9500),
(1020, 19, '2023-04-03', 17500),
(1021, 20, '2023-04-05', 21000),
(1022, 21, '2023-04-08', 12000),
(1023, 22, '2023-04-10', 14000),
(1024, 23, '2023-04-12', 8000),
(1025, 24, '2023-04-14', 33000),
(1026, 25, '2023-04-16', 24000),
(1027, 26, '2023-04-18', 18000),
(1028, 27, '2023-04-20', 20000),
(1029, 28, '2023-04-22', 22000),
(1030, 29, '2023-04-24', 19500),
(1031, 30, '2023-04-26', 26000),
(1032, 31, '2023-04-28', 15500),
(1033, 32, '2023-05-01', 27000),
(1034, 33, '2023-05-03', 10000),
(1035, 34, '2023-05-05', 19000),
(1036, 35, '2023-05-07', 21000),
(1037, 36, '2023-05-09', 11000),
(1038, 37, '2023-05-11', 12500),
(1039, 38, '2023-05-13', 18500),
(1040, 39, '2023-05-15', 14000),
(1041, 40, '2023-05-17', 17500),
(1042, 41, '2023-05-19', 9000),
(1043, 42, '2023-05-21', 25000),
(1044, 43, '2023-05-23', 30000),
(1045, 44, '2023-05-25', 21000),
(1046, 45, '2023-05-27', 26000),
(1047, 46, '2023-05-29', 27000),
(1048, 47, '2023-05-31', 28000),
(1049, 48, '2023-06-02', 15000),
(1050, 49, '2023-06-04', 12000),
(1051, 50, '2023-06-06', 8000),

(1052, 1, '2023-06-08', 20000),
(1053, 2, '2023-06-10', 23000),
(1054, 3, '2023-06-12', 14000),
(1055, 4, '2023-06-14', 17500),
(1056, 5, '2023-06-16', 26000),
(1057, 6, '2023-06-18', 21000),
(1058, 7, '2023-06-20', 9000),
(1059, 8, '2023-06-22', 30000),
(1060, 9, '2023-06-24', 12000),
(1061, 10, '2023-06-26', 18500),
(1062, 11, '2023-06-28', 17500),
(1063, 12, '2023-06-30', 16000),
(1064, 13, '2023-07-02', 9500),
(1065, 14, '2023-07-04', 21000),
(1066, 15, '2023-07-06', 25000),
(1067, 16, '2023-07-08', 30000),
(1068, 17, '2023-07-10', 27000),
(1069, 18, '2023-07-12', 15000),
(1070, 19, '2023-07-14', 14000);

-- Inserting data in the order_details table 
INSERT INTO order_details VALUES
(1,1001,1,201,'Laptop','Electronics',1,50000,'2023-01-10'),
(2,1001,1,203,'Headphones','Accessories',2,2000,'2023-01-10'),

(3,1002,2,202,'Smartphone','Electronics',1,30000,'2023-01-11'),

(4,1003,3,205,'Water Bottle','Kitchen',3,500,'2023-01-15'),

(5,1004,1,208,'Bluetooth Speaker','Electronics',1,3500,'2023-02-01'),

(6,1005,4,204,'Desk Chair','Furniture',1,4000,'2023-02-05'),

(7,1006,5,207,'Office Desk','Furniture',1,7000,'2023-02-08'),

(8,1007,6,211,'Tablet','Electronics',2,25000,'2023-03-01'),

(9,1008,7,215,'Gaming Chair','Furniture',1,15000,'2023-03-05'),

(10,1009,8,209,'Notebook','Stationery',5,200,'2023-03-09'),

(11,1010,9,210,'Keyboard','Electronics',2,1250,'2023-03-10'),

(12,1011,10,201,'Laptop','Electronics',1,19000,'2023-03-12'),

(13,1012,11,206,'Backpack','Accessories',2,2250,'2023-03-15'),

(14,1013,12,202,'Smartphone','Electronics',1,24000,'2023-03-18'),

(15,1014,13,205,'Water Bottle','Kitchen',3,600,'2023-03-20'),

(16,1015,14,215,'Gaming Chair','Furniture',2,15000,'2023-03-22'),

(17,1016,15,211,'Tablet','Electronics',1,28000,'2023-03-25'),

(18,1017,16,201,'Laptop','Electronics',1,32000,'2023-03-28'),

(19,1018,17,210,'Keyboard','Electronics',1,500,'2023-03-30'),

(20,1019,18,203,'Headphones','Accessories',2,4750,'2023-04-01'),

(21,1020,19,208,'Bluetooth Speaker','Electronics',5,3500,'2023-04-03'),

(22,1021,20,207,'Office Desk','Furniture',3,7000,'2023-04-05'),

(23,1022,21,206,'Backpack','Accessories',4,3000,'2023-04-08'),

(24,1023,22,204,'Desk Chair','Furniture',2,7000,'2023-04-10'),

(25,1024,23,209,'Notebook','Stationery',10,800,'2023-04-12'),

(26,1025,24,202,'Smartphone','Electronics',1,33000,'2023-04-14'),

(27,1026,25,211,'Tablet','Electronics',1,24000,'2023-04-16'),

(28,1027,26,215,'Gaming Chair','Furniture',1,18000,'2023-04-18'),

(29,1028,27,201,'Laptop','Electronics',1,20000,'2023-04-20'),

(30,1029,28,203,'Headphones','Accessories',4,5500,'2023-04-22'),

(31,1030,29,208,'Bluetooth Speaker','Electronics',2,9750,'2023-04-24'),

(32,1031,30,211,'Tablet','Electronics',1,26000,'2023-04-26'),

(33,1032,31,206,'Backpack','Accessories',5,3100,'2023-04-28'),

(34,1033,32,202,'Smartphone','Electronics',1,27000,'2023-05-01'),

(35,1034,33,210,'Keyboard','Electronics',2,5000,'2023-05-03'),

(36,1035,34,204,'Desk Chair','Furniture',2,9500,'2023-05-05'),

(37,1036,35,207,'Office Desk','Furniture',3,7000,'2023-05-07'),

(38,1037,36,209,'Notebook','Stationery',5,2200,'2023-05-09'),

(39,1038,37,203,'Headphones','Accessories',2,6250,'2023-05-11'),

(40,1039,38,201,'Laptop','Electronics',1,18500,'2023-05-13'),

(41,1040,39,208,'Bluetooth Speaker','Electronics',2,7000,'2023-05-15'),

(42,1041,40,215,'Gaming Chair','Furniture',1,17500,'2023-05-17'),

(43,1042,41,205,'Water Bottle','Kitchen',5,1800,'2023-05-19'),

(44,1043,42,211,'Tablet','Electronics',1,25000,'2023-05-21'),

(45,1044,43,202,'Smartphone','Electronics',1,30000,'2023-05-23'),

(46,1045,44,207,'Office Desk','Furniture',3,7000,'2023-05-25'),

(47,1046,45,201,'Laptop','Electronics',1,26000,'2023-05-27'),

(48,1047,46,202,'Smartphone','Electronics',1,27000,'2023-05-29'),

(49,1048,47,211,'Tablet','Electronics',1,28000,'2023-05-31'),

(50,1049,48,203,'Headphones','Accessories',3,5000,'2023-06-02'),

(51,1050,49,206,'Backpack','Accessories',4,3000,'2023-06-04'),

(52,1051,50,205,'Water Bottle','Kitchen',4,2000,'2023-06-06'),

(53,1052,1,202,'Smartphone','Electronics',1,20000,'2023-06-08'),
(54,1052,1,203,'Headphones','Accessories',2,0,'2023-06-08'),

(55,1053,2,201,'Laptop','Electronics',1,23000,'2023-06-10'),

(56,1054,3,211,'Tablet','Electronics',1,14000,'2023-06-12'),

(57,1055,4,204,'Desk Chair','Furniture',2,8750,'2023-06-14'),

(58,1056,5,207,'Office Desk','Furniture',2,13000,'2023-06-16'),

(59,1057,6,203,'Headphones','Accessories',3,7000,'2023-06-18'),

(60,1058,7,210,'Keyboard','Electronics',2,4500,'2023-06-20'),

(61,1059,8,202,'Smartphone','Electronics',1,30000,'2023-06-22'),

(62,1060,9,208,'Bluetooth Speaker','Electronics',2,6000,'2023-06-24'),

(63,1061,10,201,'Laptop','Electronics',1,18500,'2023-06-26'),

(64,1062,11,206,'Backpack','Accessories',5,3500,'2023-06-28'),

(65,1063,12,211,'Tablet','Electronics',1,16000,'2023-06-30'),

(66,1064,13,205,'Water Bottle','Kitchen',5,1900,'2023-07-02'),

(67,1065,14,215,'Gaming Chair','Furniture',1,21000,'2023-07-04'),

(68,1066,15,202,'Smartphone','Electronics',1,25000,'2023-07-06'),

(69,1067,16,201,'Laptop','Electronics',1,30000,'2023-07-08'),

(70,1068,17,211,'Tablet','Electronics',1,27000,'2023-07-10'),

(71,1069,18,203,'Headphones','Accessories',3,5000,'2023-07-12'),

(72,1070,19,208,'Bluetooth Speaker','Electronics',2,7000,'2023-07-14');