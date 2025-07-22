-- Task: Customer Revenue In March
# For March 2019, calculate total revenue per customer. Include only active customers (at least one transaction).  Output: customer ID and revenue, sorted by revenue descending.
-- Source: StrataScratch
-- Difficulty: Medium

SELECT cust_id, SUM(total_order_cost) AS total_revenue
FROM orders
WHERE MONTH(order_date) = 3 AND YEAR(order_date) = 2019
GROUP BY 1
ORDER BY 2 DESC