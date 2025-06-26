-- Task: Unique Users Per Client Per Month
# Count unique users per client for each month (1–12). Output: month, client, and user count.
-- Source: StrataScratch
-- Difficulty: Easy

SELECT client_id, month(time_id),COUNT(DISTINCT user_id)
FROM fact_events
GROUP BY 1,2