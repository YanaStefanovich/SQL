-- Task: Question Success Rates by Subject
# For each question, calculate:total number of answers (Total), success rate as a percentage of correct answers, rounded to 2 decimals (Success), include subject name and trimmed question text (Question, first 30 chars + "...").Sort by: subject name → success rate (desc) → question text (asc).
-- Source: Stepik SQL Course

SELECT name_subject, CONCAT(LEFT(name_question, 30),'...') as Question, COUNT(answer_id) AS Total , ROUND(SUM(is_correct)/ COUNT(answer_id)*100,2) AS Success
FROM
    subject
    JOIN question USING(subject_id)
    JOIN answer USING(question_id)
    JOIN testing USING(answer_id)
GROUP BY 1,2
ORDER BY 1,4 DESC ,2