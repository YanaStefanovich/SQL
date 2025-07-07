-- Task: Highest Cost Orders
#Between 2019-02-01 and 2019-05-01, find customers with the highest daily total order cost.
#If a customer made multiple orders on the same day, sum their costs.
#Output: first name, total cost, and date.
-- Source: StrataScratch
-- Difficulty: Medium

SELECT first_name, order_date, SUM(total_order_cost) AS total_cost
    FROM orders o JOIN customers c on c.id = o.cust_id
    WHERE order_date BETWEEN '2019-02-01' AND '2019-05-01'
    GROUP BY 1,2
    HAVING total_cost = (SELECT max(total_cost)
    FROM
    (select first_name, order_date, SUM(total_order_cost) AS total_cost
    FROM orders o JOIN customers c on c.id = o.cust_id
    GROUP BY 1,2) a)

