-- Find COVID Recovery Patients
-- Find recovered patients: those with a Positive test followed by a later Negative. Compute recovery_time as days between the first Positive and the first subsequent Negative; include only patients with both results and sort by recovery_time ascending, then patient_name ascending.
-- Source: Leetcode
-- Difficulty: Medium

WITH A AS
(
    SELECT patient_id,result, MIN(test_date) AS f
    FROM covid_tests
    WHERE result = 'Positive'
    GROUP BY 1, 2
),
B AS
(
    SELECT ct.patient_id, MIN(test_date) AS s
    FROM
        covid_tests ct
        JOIN A on A.f<ct.test_date AND ct.result = 'Negative' AND ct.patient_id = A.patient_id

    GROUP BY 1
)
SELECT patient_id, patient_name, age, DATEDIFF(s,f) AS recovery_time
FROM
    patients
    JOIN A USING(patient_id)
    JOIN B USING(patient_id)
ORDER BY recovery_time, patient_name

