-- Task: Last Person to Fit in the Bus
-- You need to find the last person who can board a bus with a 1000 kg weight limit, without the total weight exceeding this limit. Each person boards one by one in order.
-- Source: Leetcode
-- Difficulty: Medium


SELECT person_name
FROM
(
SELECT person_name,turn, @count := @count+weight, IF( @count>1000, 1, 0) AS flag
FROM
    (SELECT * FROM Queue ORDER BY turn) AS que
    cross join (SELECT @count := 0) AS Q
) AS Q_1
WHERE flag = 0
ORDER BY turn DESC
LIMIT 1