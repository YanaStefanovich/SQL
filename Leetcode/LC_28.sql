-- Find Drivers with Improved Fuel Efficiency
-- Find drivers with trips in both halves of the year whose fuel efficiency (distance / fuel) improved from January–June to July–December; show improvement = (second_half_avg − first_half_avg) rounded to two decimals, ordered by improvement desc and driver name asc.
-- Source: Leetcode
-- Difficulty: Medium

WITH A AS
(
    SELECT trip_id, driver_id, trip_date, distance_km / fuel_consumed AS fuel_eff
    FROM trips
),
B AS
(
    SELECT driver_id, AVG(fuel_eff) AS f_avg
    FROM (
    SELECT trip_id, driver_id, trip_date,  fuel_eff
    FROM A
    WHERE MONTH(trip_date) IN (1,2,3,4,5,6)
    ) Q2
    GROUP BY 1
    HAVING f_avg IS NOT NULL
),
C AS
(
    SELECT driver_id, AVG(fuel_eff) AS s_avg
    FROM (
    SELECT trip_id, driver_id, trip_date,  fuel_eff
    FROM A
    WHERE MONTH(trip_date) IN (7,8,9,10,11,12)
    ) Q1
    GROUP BY 1
    HAVING s_avg IS NOT NULL
)
SELECT driver_id, driver_name, ROUND(f_avg, 2) AS first_half_avg, ROUND(s_avg, 2) AS second_half_avg, ROUND(s_avg-f_avg, 2) AS efficiency_improvement
FROM
    B
    JOIN C USING(driver_id)
    JOIN drivers USING(driver_id)
WHERE ROUND(s_avg-f_avg, 2)>0
ORDER BY 5 DESC, 2 ASC