-- Platform: DataLemur
-- Company: Robinhood
-- Problem: Cities With Completed Trades
-- URL: https://datalemur.com/questions/completed-trades

SELECT u.city, 
       COUNT(t.order_id) AS total_orders 
FROM trades t 
INNER JOIN users u ON t.user_id = u.user_id
WHERE t.status = 'Completed'
GROUP BY u.city 
ORDER BY total_orders DESC
LIMIT 3;

/*
Thinking Process:
1. We need to find the top 3 cities with the highest volume of completed trade orders.
2. Join the trades table with the users table using user_id to map the transactions to physical locations.
3. Filter specifically for trades where status equals 'Completed'.
4. Group by city, count total transactions, and order the results descending to extract the top 3 cities.
*/