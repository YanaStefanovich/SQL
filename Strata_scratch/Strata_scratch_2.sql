-- Task: Finding Updated Records
# We have a table with employees and their salaries, however, some of the records are old and contain outdated salary information. Find the current salary of each employee assuming that salaries increase each year. Output their id, first name, last name, department ID, and current salary. Order your list by employee ID in ascending order.
-- Source: StrataScratch
-- Difficulty: Easy

select id, first_name, last_name,department_id,  max(salary)
from ms_employee_salary
Group by 1,2,3,4
ORDER BY 1


