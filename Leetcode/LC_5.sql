-- Task: Consecutive Numbers
-- Find all numbers that appear at least three times consecutively. Return the result table in any order. The result format is in the following example.
-- Source: Leetcode
-- Difficulty: Medium

SELECT DISTINCT num AS ConsecutiveNums
FROM (
SELECT num, IF(num = @number,@count := @count+1, @count := 1) AS nu,  IF(num = @number, null,@number := num)
FROM
    Logs
    CROSS JOIN
    (SELECT  @number := (SELECT num from Logs limit 1), @count := 0 ) Q_1
)  Q_2
WHERE nu = 3
