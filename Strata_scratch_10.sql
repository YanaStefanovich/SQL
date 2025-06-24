-- Task: Most Profitable Financial Company
# Find the most profitable company from the financial sector. Output the result along with the continent.
-- Source: StrataScratch
-- Difficulty: Easy

select company, continent
FROM forbes_global_2010_2014
WHERE profits = (SELECT MAX(profits) FROM forbes_global_2010_2014 )