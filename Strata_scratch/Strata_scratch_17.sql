-- Task: New Products
# For each company, calculate the net change in products launched: Net = Products in 2020 - Products in 2019 Output: company name and net difference.
-- Source: StrataScratch
-- Difficulty: Medium

SELECT distinct company_name, COUNT(CASE WHEN year = 2020 THEN product_name END) - COUNT(CASE WHEN year = 2019 THEN product_name END) AS total_launch
FROM car_launches
GROUP BY company_name