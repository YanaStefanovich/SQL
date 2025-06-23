-- Task: Customer Details
#Retrieve all customers, including those with no orders. Output: first name, last name, city, and order details.
#Sort by first name and order details in ascending order.
-- Source: StrataScratch
-- Difficulty: Easy

SELECT first_name, last_name, city, order_details
FROM customers c LEFT JOIN orders o on o.cust_id = c.id
ORDER BY 1,4 ASC