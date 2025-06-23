-- Task: Average Salaries
# Compare each employee's salary with the average salary of the corresponding department.
# Output the department, first name, and salary of employees along with the average salary of that department.
-- Source: StrataScratch
-- Difficulty: Easy

SELECT department, first_name, salary,G.avg_salary
FROM employee JOIN (SELECT department,avg(salary) AS avg_salary FROM employee GROUP BY department) G USING(department)
ORDER BY 1