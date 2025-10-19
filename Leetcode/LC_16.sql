-- Task: Find Product Recommendation Pairs
-- Find distinct product pairs that were bought together by the same customers. For each pair, count how many distinct customers purchased both; keep pairs with customer_count ≥ 3. Return results ordered by customer_count DESC, then product1_id ASC, then product2_id ASC.
-- Source: Leetcode
-- Difficulty: Medium

SELECT a_prod AS product1_id,
    b_prod AS product2_id,
    pa.category AS product1_category ,
    pb.category AS product2_category,
    COUNT(*) AS customer_count
FROM
(
SELECT user_id, a.product_id AS a_prod, a.quantity AS a_quan, b.product_id AS b_prod, b.quantity AS b_quan
FROM ProductPurchases as a JOIN ProductPurchases as b USING(user_id)
WHERE a.product_id < b.product_id
) AS Q
JOIN ProductInfo pa ON pa.product_id = q.a_prod
JOIN ProductInfo pb ON pb.product_id = q.b_prod
GROUP BY 1,2,3,4
HAVING COUNT(*)>=3
ORDER BY 5 DESC, 1, 2