-- Task: Product Price at a Given Date
-- Initially, all products have price 10. Write a solution to find the prices of all products on the date 2019-08-16
-- Source: Leetcode
-- Difficulty: Medium

WITH A AS
(
SELECT product_id,  MAX(change_date ) AS last_date
FROM Products
WHERE change_date  <= '2019-08-16'
GROUP BY 1
)
SELECT DISTINCT P.product_id, IFNULL(pr.new_price,10) AS price
FROM (SELECT DISTINCT product_id FROM Products) p
LEFT JOIN A lc
    ON p.product_id = lc.product_id
LEFT JOIN Products pr
    ON pr.product_id = lc.product_id AND pr.change_date = lc.last_date;