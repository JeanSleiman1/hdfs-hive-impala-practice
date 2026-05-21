-- Create database
CREATE DATABASE IF NOT EXISTS ecommerce_db;

-- Use database
USE ecommerce_db;

-- Create external table
CREATE EXTERNAL TABLE orders (
  order_id INT,
  customer_name STRING,
  city STRING,
  product STRING,
  category STRING,
  quantity INT,
  price DOUBLE,
  payment_status STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION 'hdfs://namenode:9000/project/ecommerce/input'
TBLPROPERTIES ("skip.header.line.count"="1");

-- Check table
SHOW TABLES;

-- Show columns
DESCRIBE orders;

-- Show all data
SELECT * FROM orders;

-- Count orders
SELECT COUNT(*) AS total_orders
FROM orders;

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
