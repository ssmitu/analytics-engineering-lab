-- Platform: DataLemur
-- Company: Amazon
-- Problem: Highest-Grossing Items
-- URL: https://datalemur.com/questions/sql-highest-grossing

WITH RankedProductSpend AS (
    SELECT category, 
           product, 
           SUM(spend) AS total_spend,
           ROW_NUMBER() OVER(
               PARTITION BY category
               ORDER BY SUM(spend) DESC
           ) AS rnk
    FROM product_spend
    WHERE EXTRACT(YEAR FROM transaction_date) = 2022
    GROUP BY category, product
)
SELECT category, 
       product, 
       total_spend 
FROM RankedProductSpend
WHERE rnk <= 2
ORDER BY category, rnk;

/*
Thinking Process:
1. Extract the top 2 highest-grossing products within each category for transactions in 2022.
2. Filter the raw transactions where the extracted transaction_date year is 2022.
3. Group by category and product to calculate total spending using SUM(spend).
4. Use a ROW_NUMBER() window function partitioned by category and ordered by total spending descending to assign local rank positions.
5. In the outer query, filter for rank positions <= 2.
*/