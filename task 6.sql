-- Create Table
CREATE TABLE online_sales (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    product_id INT NOT NULL
);

-- Insert Records
INSERT INTO online_sales (order_id, order_date, amount, product_id)
VALUES
(1, '2024-01-05', 120.00, 101),
(2, '2024-01-12', 75.50, 102),
(3, '2024-01-25', 200.00, 103),
(4, '2024-02-03', 95.99, 101),
(5, '2024-02-14', 150.00, 104),
(6, '2024-02-28', 185.25, 102),
(7, '2024-03-07', 300.00, 105),
(8, '2024-03-20', 250.75, 101),
(9, '2024-04-01', 99.99, 103),
(10, '2024-04-18', 125.00, 104),
(11, '2024-05-05', 180.40, 102),
(12, '2024-05-23', 220.00, 105);

-- a. Use strftime() to get year & month and show revenue + order volume
SELECT 'Full Revenue and Volume by Month' AS section;
SELECT 
    strftime('%Y', order_date) AS year,
    strftime('%m', order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM 
    online_sales
GROUP BY 
    year, month
ORDER BY 
    year, month;

-- b. GROUP BY year/month
SELECT 'Group by Year and Month Only' AS section;
SELECT 
    strftime('%Y', order_date) AS year,
    strftime('%m', order_date) AS month
FROM 
    online_sales
GROUP BY 
    year, month;

-- c. Use SUM() for revenue
SELECT 'Monthly Revenue Only (SUM)' AS section;
SELECT 
    strftime('%Y', order_date) AS year,
    strftime('%m', order_date) AS month,
    SUM(amount) AS total_revenue
FROM 
    online_sales
GROUP BY 
    year, month;

-- d. COUNT(DISTINCT order_id) for volume
SELECT 'Monthly Order Volume Only (COUNT DISTINCT)' AS section;
SELECT 
    strftime('%Y', order_date) AS year,
    strftime('%m', order_date) AS month,
    COUNT(DISTINCT order_id) AS order_volume
FROM 
    online_sales
GROUP BY 
    year, month;

-- e. Combine SUM + COUNT and ORDER BY
SELECT 'Revenue + Volume Ordered by Month' AS section;
SELECT 
    strftime('%Y', order_date) AS year,
    strftime('%m', order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM 
    online_sales
GROUP BY 
    year, month
ORDER BY 
    year, month;
