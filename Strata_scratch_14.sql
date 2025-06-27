-- Task: Lyft Driver Wages
#Find Lyft drivers earning ≤ 30k or ≥ 70k USD. Output: all columns for matching records.
-- Source: StrataScratch
-- Difficulty: Easy

select *
FROM lyft_drivers
WHERE yearly_salary<= 30000 OR yearly_salary >=70000