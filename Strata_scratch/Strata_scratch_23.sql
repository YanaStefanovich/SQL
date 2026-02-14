-- Host Popularity Rental Prices
-- Group listings by host popularity (based on number_of_reviews) and return each group’s minimum, average, and maximum rental price. Sort results by minimum price.
-- Source: StrataScratch
-- Difficulty: Medium

SELECT popularity AS host_popularity, MIN(price) AS min_price, AVG(price) AS avg_price, MAX(price) AS max_price
FROM
(
SELECT id, number_of_reviews, price,
CASE
    WHEN number_of_reviews = 0 THEN 'New'
    WHEN number_of_reviews BETWEEN 1 AND 5 THEN 'Rising'
    WHEN number_of_reviews BETWEEN 6 AND 15 THEN 'Trending Up'
    WHEN number_of_reviews BETWEEN 16 AND 40 THEN 'Popular'
    WHEN number_of_reviews > 40 THEN 'Hot'
END AS popularity
FROM airbnb_host_searches
) AS q_1
GROUP BY 1
ORDER BY 2