-- Task: List of rejected students
-- List program names and surnames of applicants who applied but can't be admitted due to having exam scores below the required minimum for one or more subjects. Sort by program name, then applicant surname. (shortened version of original task)
-- Source: Stepik SQL Course

SELECT DISTINCCT name_program, name_enrollee
FROM
    subject
    JOIN program_subject USING(subject_id)
    JOIN program USING(program_id)
    JOIN program_enrollee USING(program_id)
    JOIN enrollee e USING(enrollee_id)
    JOIN enrollee_subject es on e.enrollee_id = es.enrollee_id AND es.subject_id = subject.subject_id
WHERE min_result > result
ORDER BY 1,2