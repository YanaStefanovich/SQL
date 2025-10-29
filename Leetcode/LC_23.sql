-- Task: Market Analysis I
-- Write a solution to find for each user, the join date and the number of orders they made as a buyer in 2019.
-- Source: Leetcode
-- Difficulty: Medium

SELECT user_id AS buyer_id , join_date, SUM(CASE WHEN YEAR(order_date)=2019 THEN 1 ELSE 0 END) AS orders_in_2019
FROM
    Users u
    LEFT JOIN Orders o on u.user_id = o.buyer_id
GROUP BY 1, 2
order by 1, 2
