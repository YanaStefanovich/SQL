-- Task: Average Time
-- Attempt time = submission_time − attempt_start, drop attempts > 4h; for each student and lesson sum valid attempt times across steps; for each lesson average these per-student totals convert to hours round to 2 decimals; sort by average time ascending add row numbers show module number and lesson_position; columns: Номер, Урок, Среднее_время
-- Source: Stepik SQL Course

WITH st( student_id, step_id, tim) AS
(
    SELECT student_id, step_id, SUM(submission_time - attempt_time)/3600
    FROM step_student
    WHERE submission_time - attempt_time < 4 *3600
    GROUP BY 1,2
    order by 1
),
avg_lesson(student_id, lesson_id, timee ) AS
(
SELECT st.student_id,lesson_id, SUM(tim) AS timee
FROM
    st
    JOIN step USING(step_id)
    JOIN lesson USING(lesson_id)
GROUP BY 1,2
),
ASCEND( Урок, Среднее_время) AS
(
SELECT CONCAT(module_id,'.', lesson_position,' ', lesson_name), ROUND(AVG(timee), 2)
FROM
    avg_lesson
    JOIN lesson USING(lesson_id)
    JOIN module USING(module_id)
GROUP BY 1
ORDER BY 2
)
SELECT ROW_NUMBER() OVER (order by Среднее_время) AS Номер ,  Урок, Среднее_время
FROM ASCEND