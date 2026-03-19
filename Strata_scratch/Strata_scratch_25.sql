-- Meta/Facebook Accounts
-- Of all accounts with status records on January 10th, 2020, calculate the ratio of those with 'closed' status.
-- Source: StrataScratch
-- Difficulty: Medium

WITH q1 AS
(
    SELECT COUNT(*) AS total_close
    FROM fb_account_status
    WHERE status = 'closed' AND status_date = '2020-01-10'
)
SELECT total_close/COUNT(*) AS  closed_ratio
FROM fb_account_status CROSS JOIN q1
WHERE status_date = '2020-01-10'