-- Task: Table Applicant
-- Create table applicant, add here program id, enrollee id and total score for all subjects(itog). Order by program_id, itog
-- Source: Stepik SQL Course

CREATE TABLE applicant AS
SELECT program_id, pe.enrollee_id,sum(result) AS itog
FROM
    program_enrollee pe
    JOIN program_subject ps USING(program_id)
    JOIN enrollee_subject es on pe.enrollee_id = es.enrollee_id AND ps.subject_id = es.subject_id
GROUP BY 1,2
ORDER BY 1,3 desc;
select  * from applicant
