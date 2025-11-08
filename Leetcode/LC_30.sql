-- Product Sales Analysis III
-- Find all sales from the first year each product was sold, showing product_id, first_year, quantity, and price, in any order.
-- Source: Leetcode
-- Difficulty: Medium

WITH a AS
(
    SELECT product_id, MIN(year) AS year
    FROM Sales
    GROUP BY 1
)
SELECT product_id,Sales.year AS first_year, quantity, price
FROM
    Sales
    JOIN a USING(product_id, year)