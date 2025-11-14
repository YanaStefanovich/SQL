-- Restaurant Growth
-- Compute the 7-day moving average of daily customer payments (current day + 6 previous days), rounded to two decimals, and return results ordered by visited_on ascending.
-- Source: Leetcode
-- Difficulty: Medium

WITH daily AS
(
    SELECT visited_on, SUM(amount) AS amount
    FROM Customer
    GROUP BY 1
),
A as
(
    SELECT visited_on, amount as amount_avg, SUM(amount) OVER(ORDER BY visited_on RANGE BETWEEN INTERVAL 6 DAY preceding AND CURRENT ROW) AS amount, COUNT(*) OVER(ORDER BY visited_on RANGE BETWEEN INTERVAL 6 DAY  preceding AND CURRENT ROW) AS ct
    FROM daily
)
SELECT visited_on,amount, ROUND(amount/7, 2) AS average_amount
FROM A
WHERE ct = 7
ORDER BY 1
