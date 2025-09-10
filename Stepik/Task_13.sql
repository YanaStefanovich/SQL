-- Task: Row numbering
-- Fill the step_keyword table: if there is keyword in the step's name, fill the step_keyword with step id and keyword id
-- Source: Stepik SQL Course

INSERT INTO step_keyword(step_id, keyword_id)
SELECT step_id, keyword_id
FROM keyword, step
WHERE step_name REGEXP CONCAT('\\b', keyword_name, '\\b') = True;