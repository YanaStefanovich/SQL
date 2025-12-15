-- Human Traffic of Stadium
-- Write a solution to display the records with three or more rows with consecutive id's, and the number of people is greater than or equal to 100 for each. visit_date ASC
-- Source: Leetcode
-- Difficulty: Hard

WITH s AS (
  SELECT
    id, visit_date, people,
    LAG(id, 1)  OVER(ORDER BY id) AS id_prev1,
    LAG(id, 2)  OVER(ORDER BY id) AS id_prev2,
    LEAD(id, 1) OVER(ORDER BY id) AS id_next1,
    LEAD(id, 2) OVER(ORDER BY id) AS id_next2
  FROM Stadium
  WHERE people >= 100
)
SELECT id, visit_date, people
FROM s
WHERE
    (id -1 = id_prev1 AND id - 2 = id_prev2)
    OR (id - 1 = id_prev1 AND id + 1 = id_next1)
    OR (id+1 = id_next1 AND id+2 = id_next2)
ORDER BY 2