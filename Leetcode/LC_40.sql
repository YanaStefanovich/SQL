-- Most Common Course Pairs
-- Identify course mastery pathways among top-performing students by analyzing their course completion sequences. Consider only students who completed at least five courses with an average rating of four or higher. For each such student, sort their completed courses chronologically and extract all consecutive course pairs (Course A → Course B). Count how often each pair occurs across all top performers, and return the results ordered by pair frequency in descending order, then alphabetically by the first and second course names.
-- Source: Leetcode
-- Difficulty: Hard

WITH A AS
(
    SELECT user_id, course_name,completion_date, AVG(course_rating) OVER(PARTITION BY user_id) AS avg_rt, COUNT(*) OVER(PARTITION BY user_id) AS cnt
    FROM course_completions
),
B AS
(
    SELECT user_id, course_name,completion_date
    FROM A
    WHERE avg_rt >=4 AND cnt >=5
),
C AS
(
SELECT course_name AS first_course, LEAD(course_name) OVER (PARTITION BY user_id ORDER BY completion_date) AS second_course
FROM B
)
SELECT first_course,second_course,  COUNT(*) AS transition_count
FROM C
GROUP BY 1, 2
HAVING second_course IS NOT NULL
ORDER BY 3 DESC, 1,2
