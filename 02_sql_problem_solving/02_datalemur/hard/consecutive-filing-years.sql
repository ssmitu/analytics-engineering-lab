-- Platform: DataLemur
-- Company: Intuit
-- Problem: Consecutive Filing Years
-- URL: https://datalemur.com/questions/consecutive-filing-years

WITH turbo AS (
    SELECT user_id, 
           product,
           EXTRACT(YEAR FROM filing_date) AS year_filing,
           ROW_NUMBER() OVER(
               PARTITION BY user_id
               ORDER BY EXTRACT(YEAR FROM filing_date)
           ) AS seq 
    FROM filed_taxes
    WHERE product LIKE 'TurboTax%'
),
consecutive AS (
    SELECT user_id, 
           product,
           year_filing, 
           (year_filing - CAST(seq AS INT)) AS streak 
    FROM turbo
)
SELECT DISTINCT user_id 
FROM consecutive
GROUP BY user_id, streak 
HAVING COUNT(*) >= 3
ORDER BY user_id;

/*
Thinking Process:
1. Find users who filed taxes using TurboTax products for 3 or more consecutive years.
2. Filter the tax filing events for TurboTax product categories.
3. In CTE 'turbo', assign sequential row numbers (seq) to each user's filings ordered by calendar year.
4. In CTE 'consecutive', subtract this sequence ID from the actual filing year. If filings are consecutive, this subtraction yields a constant value (the "streak ID").
5. Group by user_id and this streak ID, then use HAVING COUNT(*) >= 3 to find users with consecutive streaks of 3 years or longer.
*/