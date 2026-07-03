-- Platform: DataLemur
-- Company: Amazon
-- Problem: Average Review Ratings
-- URL: https://datalemur.com/questions/sql-avg-review-ratings

SELECT EXTRACT(MONTH FROM submit_date) AS mth,
       product_id AS product,
       ROUND(AVG(stars), 2) AS avg_stars
FROM reviews
GROUP BY EXTRACT(MONTH FROM submit_date), product_id
ORDER BY mth, product;

/*
Thinking Process:
1. The requirement is to calculate average review stars grouped by month and product.
2. Use EXTRACT(MONTH FROM submit_date) to isolate the numeric month from the timestamp.
3. Group the dataset by both the extracted month and the product_id.
4. Calculate the average of the stars column and round the result to 2 decimal places.
*/