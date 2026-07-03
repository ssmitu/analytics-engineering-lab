-- Platform: DataLemur
-- Company: Twitter
-- Problem: Tweets' Rolling Averages
-- URL: https://datalemur.com/questions/rolling-average-tweets

WITH RollingCalculations AS (
    SELECT user_id, 
           tweet_date,
           AVG(tweet_count) OVER(
               PARTITION BY user_id
               ORDER BY tweet_date
               ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
           ) AS rolling_avg_3d
    FROM tweets
) 
SELECT user_id, 
       tweet_date, 
       ROUND(rolling_avg_3d, 2) AS rolling_avg_3d
FROM RollingCalculations;

/*
Thinking Process:
1. Compute the 3-day rolling average of tweets per user.
2. Partition calculations by user_id and sort chronologically by tweet_date.
3. Apply a sliding window range constraint: ROWS BETWEEN 2 PRECEDING AND CURRENT ROW (which evaluates up to a 3-row subset).
4. Run the average aggregation on the tweet_count within this window, then round the final outputs to 2 decimal places.
*/