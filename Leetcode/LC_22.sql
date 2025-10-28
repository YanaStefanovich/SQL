-- Task: Monthly Transactions I
-- Write an SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount.
-- Source: Leetcode
-- Difficulty: Medium

SELECT DATE_FORMAT(trans_date, '%Y-%m') AS month,
    country ,
    COUNT(*) AS trans_count,
    IFNULL(COUNT(CASE WHEN state = 'approved' THEN id END), 0) AS approved_count,
    SUM(amount) AS trans_total_amount,
    IFNULL(SUM(CASE WHEN state = 'approved' THEN amount END), 0) AS approved_total_amount
FROM Transactions
GROUP BY 1,2