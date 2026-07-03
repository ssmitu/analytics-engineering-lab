-- Platform: DataLemur
-- Company: Microsoft
-- Problem: Teams Power Users
-- URL: https://datalemur.com/questions/teams-power-users

SELECT sender_id,
       COUNT(*) AS message_count
FROM messages
WHERE sent_date >= '2022-08-01'
  AND sent_date < '2022-09-01'
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2;

/*
Thinking Process:
1. Find the top 2 users who sent the highest number of messages in August 2022.
2. Filter the dataset to restrict sent_date between '2022-08-01' and '2022-08-31' (using '< 2022-09-01' captures all timestamps on the final day).
3. Group by sender_id and calculate the message volume using COUNT(*).
4. Sort descending by message volume and limit the output to the top 2 rows.
*/