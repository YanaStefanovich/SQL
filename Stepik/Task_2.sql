-- Task: LEFT JOIN
# For each book, count how many orders it appears in. Output: author's last name with initials, book title, and number of orders . Sort by author's last name, then by book title.
-- Source: Stepik SQL Course

SELECT name_author, title, IF(COUNT(buy_book.amount) IS NULL, 0, COUNT(buy_book.amount))
FROM
    author
    JOIN book USING(author_id)
    LEFT JOIN buy_book USING(book_id)
GROUP BY 1,2
ORDER BY 1,2

