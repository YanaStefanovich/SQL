-- Find Stores with Inventory Imbalance
-- Find stores with at least three products where the most expensive product has less stock than the cheapest one; show both products with their quantities, calculate the imbalance ratio as (cheapest_qty / most_expensive_qty) rounded to two decimals, and order the results by imbalance ratio descending and store name ascending.
-- Source: Leetcode
-- Difficulty: Medium

WITH expensive AS
(
    SELECT store_id, product_name AS exp_product, quantity AS exp_quantity, price AS exp_price
    FROM
    (SELECT *, ROW_NUMBER() OVER (PARTITION BY store_id ORDER BY price DESC) AS rn
    FROM inventory ) Q1
    WHERE rn = 1

),
cheap AS
(
    SELECT store_id, product_name AS ch_product, quantity AS ch_quantity, price AS ch_price
    FROM
    (SELECT *, ROW_NUMBER() OVER (PARTITION BY store_id ORDER BY price ASC) AS rn
    FROM inventory ) Q2
    WHERE rn = 1
),
valid_stores AS (
  SELECT store_id
  FROM inventory
  GROUP BY store_id
  HAVING COUNT(*) >= 3
)
SELECT store_id, store_name, location, exp_product AS most_exp_product , ch_product AS cheapest_product  , ROUND(ch_quantity/exp_quantity, 2) AS imbalance_ratio
FROM
    cheap
    JOIN expensive USING(store_id)
    JOIN stores USING(store_id)
    JOIN valid_stores USING(store_id)
WHERE exp_quantity < ch_quantity
ORDER BY imbalance_ratio DESC, store_name