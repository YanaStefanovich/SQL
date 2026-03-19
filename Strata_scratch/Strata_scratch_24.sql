-- Finding Purchases
-- Identify returning active users by finding users who made a repeat purchase within 7 days or less of their previous transaction, excluding same-day purchases. Output a list of these user_id.
-- Source: StrataScratch
-- Difficulty: Medium

SELECT DISTINCT user_id
FROM
(
    SELECT user_id, DATEDIFF(created_at,LAG(created_at) OVER (PARTITION BY user_id ORDER BY created_at)) AS days
    FROM amazon_transactions
) AS Q
WHERE days BETWEEN 1 AND 7