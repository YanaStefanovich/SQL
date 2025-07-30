-- Task: Game Play Analysis IV
-- Write a solution to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. In other words, you need to determine the number of players who logged in on the day immediately following their initial login, and divide it by the number of total players.
-- Source: Leetcode
-- Difficulty: Medium

WITH per_player AS (
  SELECT player_id,IF(DATEDIFF(MAX(event_date), MIN(event_date))=1,1,0) as a
  FROM Activity
  GROUP BY player_id
)
SELECT round(sum(a)/count(player_id),2) as fraction
from per_player