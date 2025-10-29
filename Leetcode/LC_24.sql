-- Find Consistently Improving Employees
-- Find employees with at least three reviews whose last three ratings are strictly increasing, then return their improvement score (latest minus earliest rating) sorted by score descending and name ascending.
-- Source: Leetcode
-- Difficulty: Medium

WITH ranked AS
(
SELECT employee_id, name, review_date,rating, ROW_NUMBER() OVER (PARTITION BY employee_id ORDER BY review_date DESC) AS rk
FROM
    performance_reviews JOIN employees USING(employee_id )
),
last AS
(
SELECT employee_id,
    name,
    MAX(CASE WHEN rk = 1 THEN rating END) AS last,
    MAX(CASE WHEN rk = 2 THEN rating END) AS mi,
    MAX(CASE WHEN rk = 3 THEN rating END) AS f
FROM ranked
WHERE rk <=3
GROUP BY 1, 2
)
SELECT employee_id,
    name,
    last-f AS improvement_score
FROM last
WHERE last>mi AND mi>f
ORDER BY 3 DESC, 2

