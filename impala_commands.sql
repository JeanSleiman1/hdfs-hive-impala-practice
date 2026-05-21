-- Create database
CREATE DATABASE IF NOT EXISTS ecommerce_db;

-- Use database
USE ecommerce_db;

-- Create table
CREATE TABLE IF NOT EXISTS orders (
  order_id INT,
  customer_name STRING,
  city STRING,
  product STRING,
  category STRING,
  quantity INT,
  price DOUBLE,
  payment_status STRING
);

-- Add data
INSERT INTO orders VALUES
(1, 'Jean', 'Beirut', 'Laptop', 'Electronics', 1, 850.0, 'Paid'),
(2, 'Sara', 'Tripoli', 'Headphones', 'Electronics', 2, 45.0, 'Paid'),
(3, 'Omar', 'Saida', 'Office Chair', 'Furniture', 1, 120.0, 'Pending'),
(4, 'Lina', 'Beirut', 'Notebook', 'Stationery', 5, 3.0, 'Paid'),
(5, 'Karim', 'Jounieh', 'Mouse', 'Electronics', 1, 25.0, 'Cancelled'),
(6, 'Nour', 'Zahle', 'Desk', 'Furniture', 1, 200.0, 'Paid'),
(7, 'Maya', 'Beirut', 'Pen', 'Stationery', 10, 1.0, 'Paid'),
(8, 'Hadi', 'Byblos', 'Keyboard', 'Electronics', 1, 60.0, 'Pending');

-- Check table
SHOW TABLES;

-- Show all data
SELECT * FROM orders;

-- Orders by status
SELECT payment_status, COUNT(*) AS total_orders
FROM orders
GROUP BY payment_status;

-- Sales by category
SELECT category, SUM(quantity * price) AS total_sales
FROM orders
GROUP BY category;

-- Sales by city
SELECT city, SUM(quantity * price) AS total_sales
FROM orders
GROUP BY city;
