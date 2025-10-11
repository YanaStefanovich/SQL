-- Task: Count Salary Categories
-- Calculate the number of bank accounts for each salary category. "Low Salary": salary < $20000, "Average Salary": salary in the inclusive range [$20000, $50000], "High Salary": salary > $50000.
-- Source: Leetcode
-- Difficulty: Medium

WITH t(name) AS
(
    SELECT 'Low Salary' UNION ALL
    SELECT 'Average Salary' UNION ALL
    SELECT 'High Salary'
),
t2 AS (
SELECT name, COUNT(*) as c
FROM
(SELECT income,
                CASE
                WHEN income < 20000 THEN 'Low Salary'
                WHEN income > 50000 THEN 'High Salary'
                ELSE 'Average Salary'
                END AS name
FROM Accounts) Q
GROUP BY 1
)
SELECT t.name AS category , IFNULL(c,0) AS accounts_count
FROM t
    LEFT JOIN t2 USING(name)
ORDER BY 1 DESC