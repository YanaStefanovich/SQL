-- Risky Projects
-- Find projects where total prorated salaries exceed the budget. Output: project name, budget, total expenses.
-- Source: StrataScratch
-- Difficulty: Medium

WITH prorate AS
(
    SELECT first_name, last_name, title,salary*(DATEDIFF(end_date, start_date)/365) AS salary_project
    FROM linkedin_employees le
    JOIN linkedin_emp_projects lep ON le.id = lep.emp_id
    JOIN linkedin_projects lp ON lep.project_id = lp.id

)
SELECT  title, budget, CEILING(SUM(salary_project)) AS prorated_employee_expense
FROM
    linkedin_projects
    JOIN prorate USING(title)
GROUP BY 1
HAVING SUM(salary_project) > budget