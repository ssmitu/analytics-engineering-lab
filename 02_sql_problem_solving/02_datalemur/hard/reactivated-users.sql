-- Platform: DataLemur
-- Company: Facebook
-- Problem: Reactivated Users
-- URL: https://datalemur.com/questions/reactivated-users

WITH MonthlyDifferences AS (
    SELECT user_id, 
           EXTRACT(MONTH FROM login_date) AS mth,
           EXTRACT(MONTH FROM login_date) - LAG(EXTRACT(MONTH FROM login_date)) OVER(
               PARTITION BY user_id 
               ORDER BY EXTRACT(MONTH FROM login_date)
           ) AS difference 
    FROM user_logins
)
SELECT mth, 
       COUNT(DISTINCT user_id) AS reactivated_users 
FROM MonthlyDifferences
WHERE difference > 1 
   OR difference IS NULL
GROUP BY mth 
ORDER BY mth;

/*
Thinking Process:
1. Track reactivated logins (users logging back in after a period of dormancy of at least 1 month).
2. In the CTE, extract login month values and use the LAG() function to find the month of the user's previous login event.
3. Compute the step differences (current month - previous month).
4. A difference > 1 indicates a user who was inactive for at least one month and then logged back in.
5. Count distinct reactivated users grouped by each target month.
*/