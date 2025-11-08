-- Find Overbooked Employees
-- Find employees who had >20 meeting hours in a Monday–Sunday week (40h standard) for at least 2 weeks; count those weeks per employee and return results ordered by count desc, then name asc.
-- Source: Leetcode
-- Difficulty: Medium

WITH a AS
(
    SELECT employee_id , employee_name,YEARWEEK(meeting_date, 1) , SUM(duration_hours)
    FROM
        meetings
        JOIN employees USING(employee_id)
    GROUP BY 1,2, 3
    HAVING SUM(duration_hours)>20
)
SELECT employee_id, employee_name, department, COUNT(*) AS meeting_heavy_weeks
FROM
    a
    JOIN employees  USING(employee_id, employee_name)
GROUP BY 1,2
HAVING meeting_heavy_weeks >=2
ORDER BY meeting_heavy_weeks  DESC, employee_name