-- Task: Confirmation Rate
-- Calculate each user's confirmation rate as the number of 'confirmed' messages divided by the total number of confirmation requests. If a user has no requests, the rate is 0. Round the result to two decimal places.
-- Source: Leetcode
-- Difficulty: Medium

SELECT s.user_id,
       ROUND(IFNULL(COUNT(CASE WHEN c1.action = 'confirmed' THEN 1 END)/ COUNT(c2.action), 0), 2) AS confirmation_rate
FROM
    Signups s
    LEFT JOIN Confirmations c1 USING(user_id)
    LEFT JOIN Confirmations c2 USING(user_id)
GROUP BY 1