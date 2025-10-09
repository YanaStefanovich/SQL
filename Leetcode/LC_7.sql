-- Task: Customers Who Bought All Products
-- Write a solution to report the customer ids from the Customer table that bought all the products in the Product table.
-- Source: Leetcode
-- Difficulty: Medium


SELECT customer_id
FROM Customer
GROUP BY 1
HAVING COUNT( distinct product_key) = (SELECT COUNT(DISTINCT product_key) FROM Product)
