-- =====================================================
-- RETAIL SALES DATA ANALYSIS PROJECT
-- Author: Krunal Patil
-- Description:
-- This project analyzes retail sales data using SQL.
-- It includes database creation, data import, and
-- business insights like sales, profit, and trends.
-- =====================================================


-- =====================================
-- STEP 1: CREATE DATABASE
-- =====================================
-- Create a new database if it does not exist
CREATE DATABASE IF NOT EXISTS RetailSalesDB;

-- Select the database to use
USE RetailSalesDB;


-- =====================================
-- STEP 2: ENABLE CSV IMPORT
-- =====================================
-- Enable local file import for CSV
SET GLOBAL local_infile = 1;


-- =====================================
-- STEP 3: CREATE TABLE
-- =====================================
-- Create table to store retail sales data
CREATE TABLE retail_sales (
    order_id INT,                    -- Unique order ID
    order_date DATE,                 -- Date of order
    customer_name VARCHAR(100),      -- Customer name
    region VARCHAR(50),              -- Region (North, South, etc.)
    country VARCHAR(50),             -- Country name
    city VARCHAR(50),                -- City name
    category VARCHAR(50),            -- Product category
    product VARCHAR(100),            -- Product name
    quantity INT,                    -- Quantity sold
    price FLOAT,                     -- Price per unit
    total_amount FLOAT,              -- Total sale amount
    payment_method VARCHAR(50),      -- Payment type
    year INT,                        -- Year of order
    month VARCHAR(20),               -- Month of order
    profit FLOAT                     -- Profit earned
);


-- =====================================
-- STEP 4: IMPORT CSV DATA
-- =====================================
-- Load data from CSV file into table

-- =====================================
-- STEP 5: BASIC DATA CHECK
-- =====================================
-- Check total number of rows imported
SELECT COUNT(*) AS Total_Rows FROM retail_sales;


-- =====================================
-- STEP 6: KEY BUSINESS ANALYSIS
-- =====================================

-- 1. Total Orders
-- Count total number of orders
SELECT COUNT(*) AS Total_Orders
FROM retail_sales;


-- 2. Total Revenue
-- Calculate total sales amount
SELECT SUM(total_amount) AS Total_Revenue
FROM retail_sales;


-- 3. Total Profit
-- Calculate total profit
SELECT SUM(profit) AS Total_Profit
FROM retail_sales;


-- 4. Average Order Value
-- Calculate average value per order
SELECT AVG(total_amount) AS Average_Order_Value
FROM retail_sales;


-- 5. Sales by Region
-- Analyze which region generates highest sales
SELECT region, SUM(total_amount) AS Total_Sales
FROM retail_sales
GROUP BY region
ORDER BY Total_Sales DESC;


-- 6. Profit by Region
-- Analyze profit distribution by region
SELECT region, SUM(profit) AS Total_Profit
FROM retail_sales
GROUP BY region
ORDER BY Total_Profit DESC;


-- 7. Sales by Category
-- Compare sales across product categories
SELECT category, SUM(total_amount) AS Total_Sales
FROM retail_sales
GROUP BY category
ORDER BY Total_Sales DESC;


-- 8. Profit by Category
-- Compare profit across product categories
SELECT category, SUM(profit) AS Total_Profit
FROM retail_sales
GROUP BY category
ORDER BY Total_Profit DESC;


-- 9. Top 10 Cities by Sales
-- Identify top performing cities
SELECT city, SUM(total_amount) AS Total_Sales
FROM retail_sales
GROUP BY city
ORDER BY Total_Sales DESC
LIMIT 10;


-- 10. Top 10 Best Selling Products
-- Identify most sold products
SELECT product, SUM(total_amount) AS Total_Sales
FROM retail_sales
GROUP BY product
ORDER BY Total_Sales DESC
LIMIT 10;


-- 11. Monthly Sales Trend
-- Analyze sales trend over months
SELECT month, SUM(total_amount) AS Total_Sales
FROM retail_sales
GROUP BY month
ORDER BY Total_Sales DESC;


-- =====================================
-- END OF PROJECT
-- =====================================