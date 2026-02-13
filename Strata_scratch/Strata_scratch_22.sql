-- Users By Average Session Time
-- Find each user’s average session time as the difference between page_load and page_exit, using the latest page_load and earliest page_exit per day, and only keeping days where load happens before exit. Output user_id and average session time.
-- Source: StrataScratch
-- Difficulty: Medium

WITH maximum AS
(
SELECT user_id, DATE(timestamp) AS dmy, MAX(timestamp) AS maxi
FROM facebook_web_log
WHERE action = 'page_load'
GROUP BY 1, 2
),
minimum AS
(
SELECT user_id, DATE(timestamp) AS dmy, MIN(timestamp) AS mini
FROM facebook_web_log
WHERE action = 'page_exit'
GROUP BY 1, 2
)
SELECT user_id,AVG(TIMESTAMPDIFF(SECOND, maxi, mini)) AS avg_session_seconds
FROM
    minimum JOIN maximum USING(user_id, dmy)
WHERE mini > maxi
GROUP BY user_id