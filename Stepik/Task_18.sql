-- Task: Course progress
-- For student student_61, list all attempts: step title, result, submission_time; sort by submission_time; add minutes since previous attempt; truncate step title to 20 chars + ...; column headers: Студент, Шаг, Результат, Дата_отправки, Разница.
-- Source: Stepik SQL Course

SELECT student_name AS Студент , CONCAT(LEFT(step_name, 20), '...') AS Шаг, result AS Результат, FROM_UNIXTIME(submission_time) AS Дата_отправки,
    SEC_TO_TIME(IFNULL(submission_time - LAG(submission_time) OVER (ORDER BY submission_time ),0)) AS Разница
FROM
    step
    JOIN step_student USING(step_id)
    JOIN student USING(student_id)
WHERE student_name = 'student_61'
ORDER BY 4

