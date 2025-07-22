-- Task: Activity Rank
-- Calculate email rank per user by sent emails. Ranks must be unique. Sort by total and username. (task shortened)
-- Source: StrataScratch
-- Difficulty: Medium

SELECT from_user,
        COUNT(to_user),
        ROW_NUMBER() OVER (ORDER BY COUNT(to_user) desc,from_user)
FROM google_gmail_emails
GROUP BY 1