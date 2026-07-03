-- Platform: DataLemur
-- Company: JPMorgan
-- Problem: Card Launch Success
-- URL: https://datalemur.com/questions/card-launch-success

WITH ChronologicalLaunches AS (
    SELECT card_name, 
           issued_amount,
           ROW_NUMBER() OVER(
               PARTITION BY card_name
               ORDER BY issue_year, issue_month
           ) AS rnk
    FROM monthly_cards_issued
)
SELECT card_name, 
       issued_amount 
FROM ChronologicalLaunches
WHERE rnk = 1
ORDER BY issued_amount DESC;

/*
Thinking Process:
1. Find the monthly issuance amount during each credit card's initial launch month.
2. Create partitions by card_name inside the CTE.
3. Sort rows chronologically using issue_year and issue_month to find when each card was first issued.
4. Filter the CTE rows where rnk = 1 (the earliest record) and sort descending by issued_amount.
*/