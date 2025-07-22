-- Task: April Admin Employees
# Find the number of employees working in the Admin department that joined in April or later.
-- Source: StrataScratch
-- Difficulty: Easy

SELECT COUNT(*) AS n_admins
FROM worker
WHERE LOWER(department) LIKE 'admin' AND MONTH(joining_date) >= 4