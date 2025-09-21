-- Task: Student Rating
-- Per module, find the max steps passed by any student; for each student compute rating = (passed_steps / module_max) * 100, round to 1 decimal. Output module no., student name, steps passed, relative rating. Sort: module ↑, rating ↓, student ↑. Columns: Модуль, Студент, Пройдено_шагов, Относительный_рейтинг.
-- Source: Stepik SQL Course

WITH c(student_id, module_id, counts) AS
(
    SELECT student_id,module_id,  COUNT(DISTINCT step_id)
    FROM
    step_student
    JOIN step USING(step_id)
    JOIN lesson USING(lesson_id)
    WHERE result = 'correct'
    GROUP BY 1, 2
)
SELECT module_id AS Модуль, student_name AS Студент, counts AS Пройдено_шагов , ROUND(counts/MAX(counts) OVER (PARTITION BY module_id)*100, 1) AS Относительный_рейтинг
FROM
    c
    JOIN student USING(student_id)
ORDER BY 1, 3 DESC, 2
