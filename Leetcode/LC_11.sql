-- Task: Analyze Subscription Conversion
-- Find users who upgraded from free trial to paid, and show their average daily activity during the trial and paid periods (rounded to 2 decimals). Order by user_id.
-- Source: Leetcode
-- Difficulty: Medium

WITH user_paid AS
(
    SELECT DISTINCT user_id
    FROM UserActivity
    WHERE activity_type = 'paid'
),
free AS
(
SELECT user_id, SUM(activity_duration )/COUNT(activity_duration ) AS act
FROM UserActivity
WHERE activity_type = 'free_trial'
GROUP BY 1
),
paid AS
(
SELECT user_id, SUM(activity_duration )/COUNT(activity_duration ) AS act
FROM UserActivity
WHERE activity_type = 'paid'
GROUP BY 1
)
SELECT free.user_id, ROUND(free.act,2) AS trial_avg_duration , ROUND(paid.act, 2) AS paid_avg_duration
FROM
    user_paid
    JOIN paid USING(user_id)
    JOIN free USING(user_id)
ORDER BY 1
