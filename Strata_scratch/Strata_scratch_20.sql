-- Task: Election Results
-- Find the candidate(s) with the highest total votes, where each voter splits 1 vote equally among all selected candidates, and votes are rounded to 3 decimals. Include all winners in case of a tie. (shortened version of original task)
-- Source: StrataScratch
-- Difficulty: Medium

SELECT candidate
FROM (
SELECT candidate, DENSE_RANK() OVER (ORDER BY SUM(rate) desc) AS rrank
FROM (
    SELECT candidate, ROUND(1.0/count(candidate) OVER (PARTITION BY voter), 3) as  rate
FROM voting_results
WHERE candidate <> ''
) q1
GROUP BY candidate) Q2
WHERE rrank =1

