-- Game Play Analysis IV
-- Find the fraction of players who logged in again the day after their first login, rounded to two decimals — number of such players divided by total players.
-- Source: Leetcode
-- Difficulty: Medium

WITH A AS
(
    SELECT player_id, event_date, ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY event_date) AS rk
    FROM Activity
),
B AS
(
    SELECT COUNT(player_id) AS n
FROM (
    SELECT player_id, MIN(event_date), MAX(event_date)
    FROM A
    WHERE rk = 1 OR rk = 2
    GROUP BY 1
    HAVING DATEDIFF(MAX(event_date), MIN(event_date)) = 1) Q1
)
SELECT ROUND(n/COUNT(DISTINCT player_id), 2) AS fraction
FROM Activity
    CROSS JOIN B

