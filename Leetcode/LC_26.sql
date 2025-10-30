-- Investments in 2016
-- Sum tiv_2016 for policyholders whose tiv_2015 value is shared by at least one other policyholder and whose (lat, lon) location is unique, then round the result to two decimals.
-- Source: Leetcode
-- Difficulty: Medium

WITH a AS
(
    SELECT tiv_2015, COUNT(tiv_2015)
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(tiv_2015)>1
),
b AS
(
    SELECT lat, lon, COUNT(lat), COUNT(lon)
    FROM Insurance
    GROUP BY 1,2
    HAVING (COUNT(lat), COUNT(lon)) =(1,1)
)
SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM
    Insurance i
    RIGHT JOIN a USING(tiv_2015)
    RIGHT JOIN b on i.lat = b.lat AND i.lon = b.lon
