SELECT
	*
FROM sales_data;
-- ---- phase of the time column
SELECT
	Time,
	(CASE
		WHEN `Time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `Time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END) AS time_of_day
FROM sales_data;

-- updating  dayname column
UPDATE sales_data
SET dayname = DAYNAME(date);

-- updating month column
UPDATE sales_data
SET month = MONTHNAME(date);
-- selecting unique city
SELECT 
	DISTINCT city
FROM sales_data;

-- selecting unique city and branch
SELECT 
	DISTINCT city,
    branch
FROM sales_data;
-- selecting products from data
SELECT
	DISTINCT product_line
FROM sales_data;
-- selecting quantity and grouping by products
SELECT
	SUM(quantity) as qty,
    product_line
FROM sales_data
GROUP BY product_line
ORDER BY qty DESC;

-- finding total revenue and grouping by product line
SELECT
	product_line,
	SUM(total) as total_revenue
FROM sales_data
GROUP BY product_line
ORDER BY total_revenue DESC;

-- calculating total by branch, city

SELECT
	Branch,
	City,
	SUM(total) AS total_revenue
FROM sales_data
GROUP BY City, Branch 
ORDER BY total_revenue;
-- finding average tax by product 
SELECT
	product_line,
	AVG(tax) as avg_tax
FROM sales_data
GROUP BY product_line
ORDER BY avg_tax DESC;
-- finding average of quantity
SELECT 
	AVG(quantity) AS avg_qnty
FROM sales_data;
-- creating remark
SELECT
	product_line,
	CASE
		WHEN AVG(quantity) > 6 THEN "Good"
        ELSE "Bad"
    END AS remark
FROM sales_data
GROUP BY product_line;
-- calculating sum of quantity by selecting bramch
SELECT 
	branch, 
    SUM(quantity) AS qnty
FROM sales_data
GROUP BY branch
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM sales_data);

-- counting gender by product line
SELECT
	gender,
    product_line,
    COUNT(gender) AS total_cnt
FROM sales_data
GROUP BY gender, product_line
ORDER BY total_cnt DESC;
-- calculating average rating by product
SELECT
	ROUND(AVG(rating), 2) as avg_rating,
    product_line
FROM sales_data
GROUP BY product_line
ORDER BY avg_rating DESC;
-- selecting different customer type
SELECT
	DISTINCT customer_type
FROM sales_data;
-- selecting different payments method
SELECT
	DISTINCT payment
FROM sales_data;
-- counting customer types
SELECT
	customer_type,
	count(*) as count
FROM sales_data
GROUP BY customer_type
ORDER BY count DESC;
-- counting gender
SELECT
	gender,
	COUNT(*) as gender_cnt
FROM sales_data
GROUP BY gender
ORDER BY gender_cnt DESC;
-- deleted unnecessary column
ALTER TABLE sales_data
DROP COLUMN day_name;
-- selectinggender where branch is c 
SELECT
	gender,
	COUNT(*) as gender_cnt
FROM sales_data
WHERE branch = "C"
GROUP BY gender
ORDER BY gender_cnt DESC;

-- calculating total of revenue
SELECT
	customer_type,
	SUM(total) AS total_revenue
FROM sales_data
GROUP BY customer_type
ORDER BY total_revenue;

-- finding the average of tax by city
SELECT
	city,
    ROUND(AVG(tax), 2) AS avg_tax_pct
FROM sales_data
GROUP BY city 
ORDER BY avg_tax_pct DESC;
-- finding average tax by customer type
SELECT
	customer_type,
	AVG(tax) AS total_tax
FROM sales_data
GROUP BY customer_type
ORDER BY total_tax;
