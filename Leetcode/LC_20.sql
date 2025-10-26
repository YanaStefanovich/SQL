-- Task: Find Loyal Customers
-- Find loyal customers who made at least 3 purchases, have been active for 30+ days, and have a refund rate (refunds ÷ total transactions) below 20%.
-- Source: Leetcode
-- Difficulty: Medium

WITH a AS
(
    SELECT customer_id, COUNT(transaction_type) AS total
    FROM customer_transactions
    WHERE transaction_type = 'purchase'
    GROUP BY 1
    HAVING total >=3
),
b AS
(
    SELECT customer_id, DATEDIFF(MAX(transaction_date), MIN(transaction_date)) AS dif
    FROM customer_transactions
    GROUP BY 1
    HAVING dif >=30
),
c AS
(
    SELECT customer_id,
        SUM(
            CASE
            WHEN transaction_type = 'refund' THEN 1 ELSE 0 END)/COUNT(*) AS perc
    FROM customer_transactions
    GROUP BY 1
    HAVING perc < 0.2
)
SELECT customer_id
FROM
    a
    JOIN b USING(customer_id)
    JOIN c USING(customer_id)