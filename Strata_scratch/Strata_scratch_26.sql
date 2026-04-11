-- Ranking Most Active Guests
-- Rank guests by total messages , no gaps, descending.
-- Source: StrataScratch
-- Difficulty: Medium

SELECT id_guest, dense_rank() OVER (ORDER BY mess_count DESC) AS ranking, mess_count AS sum_n_messages
FROM (
SELECT id_guest, SUM(n_messages) AS mess_count
FROM airbnb_contacts
GROUP BY id_guest
ORDER BY 2 DESC
) AS Q1
ORDER BY 2, 3 DESC