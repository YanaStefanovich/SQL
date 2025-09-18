-- Task: Course progress
-- Calculate course progress for each student,if student passed all the steps - 'Certificate of excellence', if student has >80% - 'Certificate'
-- Source: Stepik SQL Course

WITH correct(stud, res) as
(
    SELECT student_id, COUNT(distinct step_id)
    FROM step_student
    WHERE result = 'correct'
    GROUP BY 1
),
all_steps(c_step) AS
(
    SELECT COUNT(distinct step_id)
    FROM step_student
),
joined(student_id, suc) AS
(
SELECT stud, round(res/c_step*100) as suc
FROM all_steps, correct
)
SELECT student_name AS Студент, suc AS Прогресс,
    CASE
        WHEN suc = 100 THEN 'Сертификат с отличием'
        WHEN suc >= 80 THEN 'Сертификат'
        ELSE ''
    END AS Результат
FROM
    joined
    JOIN student USING(student_id)
ORDER BY 2 DESC, 1
