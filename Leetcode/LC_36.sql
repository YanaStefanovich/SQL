-- Find Golden Hour Customers
-- Find “golden hour” customers: ≥3 orders, ≥60% placed in peak hours (11:00–14:00 or 18:00–21:00), average rating (rated orders only) ≥4.00 with at least 50% of orders rated; return results ordered by average_rating desc, then customer_id desc.
-- Source: Leetcode
-- Difficulty: Medium

WITH A AS
(
    SELECT customer_id,COUNT(*) AS total, ROUND(AVG(order_rating), 2 ) AS rt
    FROM restaurant_orders
    GROUP BY 1
    HAVING COUNT(*)>=3 AND rt >=4
),
B AS
(
    SELECT customer_id, ROUND(COUNT(HOUR(order_timestamp))/total*100) AS Q
    FROM
    restaurant_orders
    JOIN A USING(customer_id)
    WHERE HOUR(order_timestamp)  BETWEEN 11 AND 13 OR HOUR(order_timestamp) BETWEEN 18 AND 20
    GROUP BY 1
    HAVING Q >=60
),
C AS
(
    SELECT customer_id, ROUND(COUNT(*)/total*100) AS rated
    FROM
    restaurant_orders
    JOIN A USING(customer_id)
    WHERE order_rating IS NOT NULL
    GROUP BY 1
    HAVING rated >=50
)
SELECT customer_id, total AS total_orders, Q AS peak_hour_percentage, rt AS average_rating
FROM
    A
    JOIN B USING(customer_id)
    JOIN C USING(customer_id)
ORDER BY average_rating DESC, customer_id DESC