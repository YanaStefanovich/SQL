-- Immediate Food Delivery II
-- Find the percentage of customers whose first order (earliest per customer) was immediate—i.e., order date equals preferred delivery date—rounded to two decimals.
-- Source: Leetcode
-- Difficulty: Medium

WITH first AS
(
SELECT customer_id, MIN(order_date) AS minimum
FROM Delivery
GROUP BY 1
)
SELECT ROUND( SUM(CASE WHEN d.order_date = customer_pref_delivery_date THEN 1 ELSE 0 END )/COUNT(*)*100, 2) AS immediate_percentage
FROM
    Delivery d
    JOIN first f on d.customer_id = f.customer_id AND f.minimum = d.order_date

