-- Finding User Purchases
-- Identify returning active users by finding users who made a second purchase within 1 to 7 days after their first purchase. Ignore same-day purchases
-- Source: StrataScratch
-- Difficulty: Medium

WITH t1 AS (
    SELECT
        user_id,
        MIN(created_at) AS min_date
    FROM amazon_transactions
    GROUP BY 1
)

SELECT DISTINCT tr.user_id
FROM
    amazon_transactions AS tr
    JOIN t1 ON tr.user_id = t1.user_id
WHERE created_at BETWEEN min_date+1 AND min_date+7
ORDER BY 1
