CREATE DATABASE sales_analysis; USE sales_analysis;
CREATE TABLE customers ( customer_id INT PRIMARY KEY, customer_name VARCHAR(100), region VARCHAR(50));
CREATE TABLE sales ( 
sales_id INT PRIMARY KEY,
customer_id INT,
product VARCHAR(100),
sale_date DATE,
quantity INT, 
revenue DECIMAL (10,2),
FOREIGN KEY (customer_id) REFERENCES 
customers(customer_id)
);
INSERT INTO customers VALUES 
(1, 'John Doe', 'Lagos'),
(2, 'Mary Adel', 'Abuja'),
(3, 'Samuel Obi', 'Port Harcourt'),
(4, 'Aisha Bello', 'Kano');
INSERT INTO sales VALUES 
(101, 1, 'Laptop', '2025-01-10', 2, 400000),
(102, 2, 'Phone', '2025-01-15', 1, 250000),
(103, 3, 'Tablet', '2025-02-05', 3, 300000),
(104, 1, 'Phone', '2025-02-20', 1, 250000),
(105, 4, 'Laptop', '2025-03-01', 1, 200000);


INSERT INTO customers VALUES 
(5, 'Blessing Okafor', 'Lagos'),
(6, 'Daniel Musa', 'Abuja'),
(7, 'Ifeanyi Uche', 'Onitsha'),
(8, 'Zainab Lawal', 'Ibadan'),
(9, 'Tunde Ajayi', 'Akure'),
(10, 'Fatima Sule', 'Minna');


INSERT INTO sales VALUES 
(106, 5, 'Laptop', '2025-03-05', 1, 220000),
(107, 6, 'Phone', '2025-03-08', 2, 500000),
(108,7, 'Tablet', '2025-03-10', 1, 120000),
(109, 8, 'Laptop', '2025-03-12', 2, 420000),
(110, 9, 'Phone', '2025-03-15', 1, 250000),
(111, 10, 'Tablet', '2025-03-18', 3, 360000);


SELECT * FROM customers;
SELECT * FROM sales;

SELECT 
	c.region,
     SUM(s.revenue) AS total_revenue
FROM sales s
JOIN customers c
ON s.customer_id = c.customer_id
GROUP BY c.region;


SELECT * FROM sales 
WHERE customer_id IS NULL
OR product IS NULL
OR  sale_date IS NULL
OR revenue IS NULL;
DELETE FROM sales 
WHERE sale_id IS NULL;

SELECT * 
FROM sales 
WHERE sale_id IS NULL;

SELECT 
s.sales_id,
c.customer_name,
c.region,
s.product,
s.sale_date,
s.quantity,
s.revenue
FROM sales s 
JOIN customers c 
ON s.customer_id = c.customer_id;