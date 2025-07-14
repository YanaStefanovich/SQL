-- Task: Bikes Last Used
# Find the last time each bike was in use. Output both the bike number and the date-timestamp of the bike's last use (i.e., the date-time the bike was returned). Order the results by bikes that were most recently used.
-- Source: StrataScratch
-- Difficulty: Easy


SELECT bike_number, MAX(end_time) AS last_used
FROM dc_bikeshare_q1_2012
GROUP BY 1
ORDER BY 2 DESC
