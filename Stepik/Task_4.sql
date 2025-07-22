-- Task: Exam results
-- For each applicant and program they applied to, calculate the total exam score (itog). Output: program name, applicant's last and first name, and itog. Sort by program name, then by itog descending. (shortened version of original task)
-- Source: Stepik SQL Course

SELECT name_program, name_enrollee, SUM(result) as Results
FROM
    subject
    JOIN program_subject USING(subject_id)
    JOIN program USING(program_id)
    JOIN program_enrollee USING(program_id)
    JOIN enrollee e USING(enrollee_id)
    JOIN enrollee_subject es on e.enrollee_id = es.enrollee_id AND es.subject_id = subject.subject_id
GROUP BY 1,2
ORDER BY 1,3 DESC
