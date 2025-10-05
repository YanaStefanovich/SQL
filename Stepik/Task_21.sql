-- Task: Time interval
-- For students who completed at least one step in each of the three lessons, find the last correctly solved step in every lesson and show:student name,lesson number (module_id.lesson_position),submission time,time gap (in days) between this and the previous submission (use “–” for the first one, round up to full days).Order results by student name and then by submission time.
-- Source: Stepik SQL Course


WITH a(name, num, s_time) AS
(
SELECT DISTINCT student_name, CONCAT(module_id, '.', lesson_position) AS l, MAX(submission_time)
FROM
    step_student
    JOIN student USING(student_id)
    JOIN step USING(step_id)
    JOIN lesson USING(lesson_id)
WHERE result = 'correct'
GROUP BY student_name, lesson_id
),
b(name) AS
(
    SELECT name
    FROM a
    GROUP BY name
    HAVING count(*)>=3
)
SELECT name AS Студент , num AS Урок, FROM_UNIXTIME(s_time) AS Макс_время_отправки, IFNULL(CEIL((s_time -LAG(s_time) OVER (PARTITION BY name ORDER BY s_time))/86400), '-') AS Интервал
FROM
    a
    JOIN b USING(name)
ORDER BY  1, 3
