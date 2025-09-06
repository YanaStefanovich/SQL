-- Task: Update
-- Delete Make table applicant_order on the base of the table applicant, order records by program_id, itog descending
-- Source: Stepik SQL Course

CREATE TABLE applicant_order AS
SELECT *
FROM applicant
ORDER BY program_id, itog DESC;
DROP TABLE applicant;

