-- Platform: DataLemur
-- Company: Uber
-- Problem: User's Third Transaction
-- URL: https://datalemur.com/questions/sql-third-transaction

WITH RankedTransactions AS (
    SELECT user_id, 
           spend, 
           transaction_date,
           ROW_NUMBER() OVER(
               PARTITION BY user_id 
               ORDER BY transaction_date ASC
           ) AS rnk
    FROM transactions
)
SELECT user_id, 
       spend, 
       transaction_date 
FROM RankedTransactions 
WHERE rnk = 3;

/*
Thinking Process:
1. Identify the third chronological transaction for each unique user.
2. Inside a CTE, use ROW_NUMBER() window function partitioned by user_id to assign sequential rankings.
3. Sort the partition ordering by transaction_date ascending.
4. Filter the output of the CTE where the calculated rank (rnk) is exactly equal to 3.
*/