-- Platform: DataLemur
-- Company: NY Times
-- Problem: Laptop vs. Mobile Viewership
-- URL: https://datalemur.com/questions/laptop-mobile-viewership

SELECT COUNT(CASE WHEN device_type = 'laptop' THEN 1 END) AS laptop_views,
       COUNT(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 END) AS mobile_views
FROM viewership;

/*
Thinking Process:
1. Calculate the sum of total views originating from laptops versus mobile devices (tablets and phones).
2. Use conditional aggregation (COUNT with a CASE statement) to categorize each row.
3. Laptop views match 'laptop', while mobile views match 'tablet' or 'phone'.
4. Summing or counting these matches in a single pass avoids running multiple slow subqueries.
*/