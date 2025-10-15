-- Task: Friend Requests II: Who Has the Most Friends
-- Write a solution to find the people who have the most friends and the most friends number. The test cases are generated so that only one person has the most friends.
-- Source: Leetcode
-- Difficulty: Medium

WITH a(id, c) AS
(
SELECT requester_id, COUNT(*)
FROM RequestAccepted
GROUP BY requester_id
UNION ALL
SELECT accepter_id, COUNT(*)
FROM RequestAccepted
GROUP BY accepter_id
)
SELECT id, SUM(c) AS num
FROM a
GROUP BY 1
ORDER BY num DESC
LIMIT 1
