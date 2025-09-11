-- Task:
-- Implement keyword search and list only those steps that are linked to both keywords MAX and AVG. Output a single column named Step formatted as <module_id>.<lesson_position>.<step_position(two digits)> <step_title> (zero-pad the step position, e.g., 03), and sort the results alphabetically by this Step column in ascending order.
-- Source: Stepik SQL Course

SELECT Шаг
FROM (
SELECT CONCAT(module_id,'.' ,  lesson_position, '.', IF(LENGTH(step_position)<10, CONCAT('0', step_position), step_position), ' ',step_name) AS Шаг
FROM
    module
    JOIN lesson USING(module_id)
    JOIN step USING(lesson_id)
    JOIN step_keyword USING(step_id)
    JOIN keyword USING(keyword_id)
WHERE keyword_name in ('AVG', 'MAX')
) a
GROUP BY Шаг
HAVING COUNT(Шаг)=2
ORDER BY 1
