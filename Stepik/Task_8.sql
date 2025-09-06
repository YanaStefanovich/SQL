-- Task: Update
-- Delete Increase the final scores of applicants in the applicant table by the values of additional points
-- Source: Stepik SQL Course

UPDATE applicant a
    JOIN (SELECT enrollee_id, IF(SUM(bonus) IS NULL, 0,SUM(bonus))  AS Бонус
    FROM
    enrollee
    LEFT JOIN enrollee_achievement USING(enrollee_id)
    LEFT JOIN achievement USING(achievement_id)
    GROUP BY 1
    ORDER BY 1
) b on a.enrollee_id = b.enrollee_id
SET itog = itog+Бонус