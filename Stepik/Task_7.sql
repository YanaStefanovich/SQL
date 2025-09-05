-- Task: Deleting
-- Delete record from applicant table if enrolle didnt get minimum result for each subject
-- Source: Stepik SQL Course

SELECT pe.enrollee_id
FROM
    program_enrollee pe
    JOIN program_subject ps USING(program_id)
    JOIN enrollee_subject es on pe.enrollee_id = es.enrollee_id AND ps.subject_id = es.subject_id
WHERE result<min_result

