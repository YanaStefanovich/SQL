-- Task: Number Of Bathrooms And Bedrooms
#Find the average number of bathrooms and bedrooms for each city’s property types. Output the result along with the city name and the property type.
-- Source: StrataScratch
-- Difficulty: Easy

select city, property_type,avg(bathrooms) as n_bathrooms_avg, avg(bedrooms) as n_bedrooms_avg
FROM airbnb_search_details
GROUP BY 1,2