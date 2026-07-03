-- Platform: DataLemur
-- Company: Facebook
-- Problem: Active User Retention
-- URL: https://datalemur.com/questions/user-retention

WITH cur AS (
    SELECT user_id, 
           event_type, 
           event_date, 
           EXTRACT(MONTH FROM event_date) AS month 
    FROM user_actions
    WHERE event_type IN ('sign-in', 'like', 'comment')
),
pre AS (
    SELECT user_id, 
           event_type, 
           event_date, 
           month,
           LAG(month) OVER(PARTITION BY user_id ORDER BY month) AS prev
    FROM cur
),
cal AS (
    SELECT cur.user_id, 
           cur.month, 
           cur.event_date, 
           (cur.month - pre.prev) AS difference
    FROM cur 
    INNER JOIN pre ON cur.user_id = pre.user_id
)
SELECT month, 
       COUNT(DISTINCT user_id) AS monthly_active_users 
FROM cal 
WHERE difference = 1 
  AND month = 7
GROUP BY month
ORDER BY month;

/*
Thinking Process:
1. Identify monthly active users (MAUs) in July (Month 7) who were also active in June (Month 6).
2. CTE 'cur' isolates the target active events (sign-in, like, comment) and extracts the transaction month.
3. CTE 'pre' uses LAG() partitioned by user_id to identify each user's chronologically preceding active month.
4. CTE 'cal' self-joins these sets and calculates the difference (month - prev). A difference of 1 confirms back-to-back month activity.
5. Aggregate and count distinct users active in July who have a sequential month difference of 1.
*/