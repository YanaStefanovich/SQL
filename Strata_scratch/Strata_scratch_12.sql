-- Task: Number of violations
# Count violations at 'Roxanne Cafe' per year, based on inspection date. Output: year and number of violations, sorted by year ascending.
-- Source: StrataScratch
-- Difficulty: Easy

SELECT year(inspection_date), count(violation_id) as n_violations
FROM sf_restaurant_health_violations
WHERE business_name =  'Roxanne Cafe'
GROUP BY 1