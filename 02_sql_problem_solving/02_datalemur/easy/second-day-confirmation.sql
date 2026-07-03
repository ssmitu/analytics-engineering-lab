-- Platform: DataLemur
-- Company: TikTok
-- Problem: Second Day Confirmation
-- URL: https://datalemur.com/questions/second-day-confirmation

SELECT e.user_id
FROM emails e
INNER JOIN texts t ON e.email_id = t.email_id
WHERE t.signup_action = 'Confirmed'
  AND t.action_date = e.signup_date + INTERVAL '1 day';

/*
Thinking Process:
1. Find users who confirmed their signups exactly one day after receiving their initial registration email.
2. Join the emails table with the texts table using email_id.
3. Filter for text confirmation states: signup_action = 'Confirmed'.
4. Apply date arithmetic to verify that the confirmation action_date occurs exactly 1 day after the user's signup_date.
*/