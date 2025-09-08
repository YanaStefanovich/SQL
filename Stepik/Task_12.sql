-- Task: Row numbering
-- Filter steps whose step title mentions subqueries. Output: Module: <module_no> <module_name> (≤19 chars; if longer → first 16 + ...). Lesson: <module_no>.<lesson_pos> <lesson_name> (same limit). Step: <module_no>.<lesson_pos>.<step_pos> <step_name>.
-- Source: Stepik SQL Course

SELECT
    IF(LENGTH(CONCAT(module_id, ' ', module_name))>=16, CONCAT(LEFT(CONCAT(module_id, ' ', module_name), 16), '...'), CONCAT(module_id, ' ', module_name)) AS Модуль,
    IF(LENGTH(CONCAT(module_id, '.', lesson_position,' ', lesson_name))>=16, CONCAT(LEFT(CONCAT(module_id, '.', lesson_position,' ', lesson_name), 16),'...'),CONCAT(module_id, '.', lesson_position,' ', lesson_name)) AS Урок,
    CONCAT(module_id, '.', lesson_position,'.', step_position, ' ', step_name) AS Шаг

FROM
    step
    LEFT JOIN lesson USING(lesson_id)
    JOIN module USING(module_id)
WHERE step_name LIKE '%вложен%_запрос_%'
ORDER BY module_id, lesson_position, step_position

