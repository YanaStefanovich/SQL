-- Task: Seasonal Sales Analysis
-- Find, for each season (Winter: Dec–Feb; Spring: Mar–May; Summer: Jun–Aug; Fall: Sep–Nov), the product category with the highest total quantity sold; if multiple categories tie on quantity, pick the one with the highest total revenue (quantity × price). Return the results ordered by season ascending.
-- Source: Leetcode
-- Difficulty: Medium

WITH a AS
(
SELECT product_id, sale_date, quantity, price,
    CASE
        WHEN MONTH(sale_date) = 12 OR MONTH(sale_date) = 1 OR MONTH(sale_date) = 2 THEN 'Winter'
        WHEN MONTH(sale_date) = 3 OR MONTH(sale_date) = 4 OR MONTH(sale_date) = 5 THEN 'Spring'
        WHEN MONTH(sale_date) = 6 OR MONTH(sale_date) = 7 OR MONTH(sale_date) = 8 THEN 'Summer'
        ELSE 'Fall' END AS season
FROM sales
),
b AS
(
SELECT season, category, sum(quantity) AS suma, sum(price*quantity) as qnt
FROM a JOIN products USING(product_id)
GROUP BY 1,2
),
ranked AS
(
SELECT *, ROW_NUMBER() OVER (PARTITION BY season ORDER BY suma DESC, qnt DESC) AS rk
FROM b
)
SELECT  season, category, suma AS total_quantity , qnt AS total_revenue
FROM ranked
WHERE rk = 1