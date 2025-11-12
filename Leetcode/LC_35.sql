-- Nth Highest Salary
-- Write a solution to find the nth highest distinct salary from the Employee table. If there are less than n distinct salaries, return null.
-- Source: Leetcode
-- Difficulty: Medium

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
    SELECT DISTINCT salary
    FROM
      (SELECT id, salary, DENSE_RANK() OVER (ORDER BY salary desc) AS rk
      FROM Employee) q1
    WHERE n = rk

  );
END