-- Task: Row numbering
-- Compute how many students fall into each group based on the number of solved steps. A step counts as solved if the student has at least one correct attempt; step_student stores all attempts, so count distinct steps per student. Define groups: I (0–10), II (11–15), III (16–27), IV (>27). Return columns Group, Interval, Count, showing the interval boundaries.
-- Source: Stepik SQL Course

SELECT
    CASE
        WHEN rate <= 10 THEN "I"
        WHEN rate <= 15 THEN "II"
        WHEN rate <= 27 THEN "III"
        ELSE "IV"
    END AS Группа,
    CASE
        WHEN rate <= 10 THEN "от 0 до 10"
        WHEN rate <= 15 THEN "от 11 до 15"
        WHEN rate <= 27 THEN "от 16 до 27"
        ELSE "больше 27"
    END AS Интервал,
    COUNT(*) as Количество
FROM
(
SELECT student_name, count(*) as rate
FROM
    (
     SELECT student_name, step_id
     FROM
         student
         INNER JOIN step_student USING(student_id)
     WHERE result = "correct"
     GROUP BY student_name, step_id
    ) query_in
GROUP BY student_name
ORDER BY 2
) query_in_2
GROUP BY 1,2
