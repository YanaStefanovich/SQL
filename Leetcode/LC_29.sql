-- Find Students Who Improved
-- Find students who took the same subject at least twice and whose latest score is higher than their first, ordered by student_id and subject ascending.
-- Source: Leetcode
-- Difficulty: Medium

WITH maxi AS
(
    SELECT student_id, subject, MAX(exam_date) AS maxim
    FROM Scores
    GROUP BY 1,2
),
mini AS
(
    SELECT student_id, subject, MIN(exam_date) AS minim
    FROM Scores
    GROUP BY 1,2
),
a AS
(
    SELECT student_id, subject,  minim, score
    FROM mini
    JOIN Scores USING(student_id, subject)
    WHERE minim = exam_date  AND mini.student_id = Scores.student_id
),
b AS
(
    SELECT  student_id, subject, maxim, score
    FROM maxi
    JOIN Scores USING(student_id, subject)
    WHERE maxim = exam_date  AND maxi.student_id = Scores.student_id
)

SELECT DISTINCT student_id, subject, a.score AS first_score , b.score AS latest_score
FROM a join b USING(student_id, subject)
JOIN Scores USING(student_id, subject)
where maxim <> minim AND b.score>a.score
ORDER BY student_id, subject