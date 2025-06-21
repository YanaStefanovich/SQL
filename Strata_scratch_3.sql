-- Task: Workers With The Highest Salaries
# Find the job titles of the employees with the highest salary. If multiple employees have the same highest salary, include the job titles for all such employees.
-- Source: StrataScratch
-- Difficulty: Easy

SELECT t.worker_title
FROM worker w
JOIN title t ON w.worker_id = t.worker_ref_id
WHERE w.salary = (
    SELECT max(salary)
    FROM worker
);