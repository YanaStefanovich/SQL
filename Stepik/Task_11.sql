-- Task: Row numbering
-- Create a table student, which includes applicants who can be recommended for admission in accordance with the enrolment plan. Sort the information first alphabetically by programme name and then by descending final grade.
-- Source: Stepik SQL Course

CREATE TABLE student AS
SELECT name_program, name_enrollee, itog
FROM
    program
    JOIN applicant_order USING(program_id)
    JOIN enrollee USING(enrollee_id)
WHERE str_id<=plan
ORDER BY 1, itog DESC