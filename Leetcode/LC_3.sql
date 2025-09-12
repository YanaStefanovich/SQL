-- Task: Managers with at Least 5 Direct Reports
-- Write a solution to find managers with at least five direct reports.
-- Source: Leetcode
-- Difficulty: Medium

SELECT e.name
FROM Employee e
WHERE e.id IN (
  SELECT managerId
  FROM Employee
  WHERE managerId IS NOT NULL
  GROUP BY managerId
  HAVING COUNT(*) >= 5
);

