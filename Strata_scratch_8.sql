-- Task: Workers by Department Since April
#Count workers per department who joined on or after April 1, 2014.
#Output: department name and worker count.
#Sort by worker count in descending order.-- Source: StrataScratch
-- Difficulty: Easy

SELECT department, count(worker_id)
FROM worker
WHERE joining_date >= '2014-04-01'
GROUP BY 1
ORDER BY 2 DESC