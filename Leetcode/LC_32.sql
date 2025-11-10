-- Movie Rating
-- Return the user with the most ratings (tie → lexicographically smallest name) and the movie with the highest average rating in Feb 2020 (tie → lexicographically smallest title).
-- Source: Leetcode
-- Difficulty: Medium

WITH A AS
(
    SELECT name, COUNT(*) AS co
    FROM MovieRating
    JOIN Users USING(user_id)
    GROUP BY 1
    ORDER BY COUNT(*) DESC, name
    LIMIT 1
),
B AS
(
    SELECT title, AVG(rating) AS av
    FROM MovieRating
    JOIN Movies  USING(movie_id    )
    WHERE YEAR(created_at)=2020 AND MONTH(created_at)=2
    GROUP BY 1
    ORDER BY av DESC, title
    LIMIT 1
)
SELECT name AS results  FROM A
UNION ALL
SELECT title AS results FROM B