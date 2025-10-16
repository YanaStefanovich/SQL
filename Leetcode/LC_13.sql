-- Task: Find Churn Risk Customers
-- ind churn-risk users who:still have an active subscription,have at least one downgrade,whose current plan revenue < 50% of their max historical revenue,and have been subscribed for ≥ 60 days.Return results ordered by days_as_subscriber DESC, then user_id ASC.
-- Source: Leetcode
-- Difficulty: Medium

WITH a AS (
SELECT event_id, user_id, plan_name, monthly_amount
FROM subscription_events
WHERE user_id NOT IN (
    SELECT user_id
    FROM subscription_events
    WHERE event_type = 'cancel'
) AND user_id IN (
    SELECT user_id
    FROM subscription_events
    WHERE event_type = 'downgrade'
) AND event_id IN (
    SELECT MAX(event_id)
    FROM subscription_events
    GROUP BY user_id
)
), b(user_id, maximum) AS
(
    SELECT user_id, MAX(monthly_amount)
    FROM subscription_events
    GROUP BY 1
),c(user_id, dif) AS
(
    SELECT user_id ,DATEDIFF(MAX(event_date), MIN(event_date))
    FROM subscription_events
    GROUP BY 1

)
SELECT user_id, a.plan_name AS current_plan, a.monthly_amount AS current_monthly_amount ,maximum AS max_historical_amount , dif AS days_as_subscriber
FROM
    a JOIN b USING(user_id)
    JOIN c USING(user_id)
WHERE a.monthly_amount < maximum/2 AND dif >= 60
ORDER BY days_as_subscriber DESC, user_id


