-- Department Top Three Salaries
-- Find employees whose salary is among the top three distinct salaries in their department (high earners)
-- Source: Leetcode
-- Difficulty: Hard

WITH top AS
(
    SELECT departmentId,name, salary, DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS rk
    FROM Employee

)
SELECT d.name AS Department , t.name AS Employee , salary AS Salary
FROM
    top t
    JOIN Department d on t.departmentId = d.id
WHERE rk <=3