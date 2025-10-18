-- Task: Odd and Even Transactions
-- Write a solution to find the sum of amounts for odd and even transactions for each day. If there are no odd or even transactions for a specific date, display as 0.
-- Source: Leetcode
-- Difficulty: Medium

SELECT  transaction_date,
    SUM(
        CASE
        WHEN amount%2 = 1 THEN amount
        ELSE 0
        END
    ) AS odd_sum,
    SUM(
        CASE
        WHEN amount%2 = 0 THEN amount
        ELSE 0
        END
    ) AS even_sum
FROM transactions
GROUP BY 1
ORDER BY 1