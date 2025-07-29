-- Task: Department Highest Salary
-- Write a solution to find employees who have the highest salary in each of the departments.Return the result table in any order.The result format is in the following example.
-- Source: Leetcode
-- Difficulty: Medium

SELECT  Q1.Department , Employee.name as Employee, Salary
FROM Employee,(
select d.id department_id,d.name as Department,max(e.salary) as max
    from department d left join employee e
    on  d.id=e.departmentId
    group by d.id
) Q1
WHERE Employee.Salary = Q1.max AND department_id = departmentId
