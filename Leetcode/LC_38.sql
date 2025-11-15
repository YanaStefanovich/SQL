-- Find Category Recommendation Pairs
-- Find category pairs (category1 < category2) where at least 3 distinct customers bought from both categories; for each pair return the number of such customers, ordered by customer_count DESC, then category1 ASC, then category2 ASC.
-- Source: Leetcode
-- Difficulty: Medium

WITH A AS
(
    SELECT DISTINCT user_id, product_id, category
    FROM
        ProductPurchases
        JOIN ProductInfo USING(product_id )
),
B AS
(
    SELECT a1.user_id, a1.category AS ct1, a2.category AS ct2
    FROM
        A  a1 JOIN A a2 on a1.user_id = a2.user_id AND a1.category < a2.category
)
SELECT ct1 AS category1, ct2 AS category2, COUNT(DISTINCT user_id) AS customer_count
FROM B
GROUP BY 1, 2
HAVING COUNT(DISTINCT user_id)>=3
ORDER BY 3 DESC, 1, 2