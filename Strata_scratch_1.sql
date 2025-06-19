-- Task: Salaries Differences
-- Source: StrataScratch
-- Difficulty: Easy

select
  marketing.max_salary - engineering.max_salary as salary_difference
from
  (
    select max(salary) as max_salary
    from db_employee e
    join db_dept d on e.department_id = d.id
    where d.department = 'marketing'
  ) as marketing,
  (
    select max(salary) as max_salary
    from db_employee e
    join db_dept d on e.department_id = d.id
    where d.department = 'engineering'
  ) as engineering;