-- Task: Managers with at Least 5 Direct Reports
-- Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped. Return the result table ordered by id in ascending order.
-- Source: Leetcode
-- Difficulty: Medium

SELECT
    CASE
        WHEN id % 2 = 1 and id+1 in (select id from Seat) THEN id+1
        WHEN id % 2 = 0 THEN id-1
        else id
        END as id, student
FROM Seat
ORDER BY id