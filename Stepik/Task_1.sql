-- Task: Subqueries in JOIN clauses
# Display book info (title, author, genre, price, amount) for books in the most popular genre — the one with the highest total stock. Sort results alphabetically by book title.
-- Source: Stepik SQL Course

SELECT title, name_author ,name_genre, price, amount
FROM author JOIN book USING(author_id) JOIN genre USING(genre_id)
WHERE genre_id IN (

SELECT q1.genre_id
FROM (SELECT genre_id, SUM(amount) as max_a
FROM book
GROUP BY 1 ) q1
JOIN (select genre_id, SUM(amount) AS sum_amount
FROM  book
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1) q2 on q1.max_a = q2.sum_amount)
ORDER BY 1