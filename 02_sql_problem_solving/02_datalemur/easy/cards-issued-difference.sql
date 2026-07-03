-- Platform: DataLemur
-- Company: JPMorgan
-- Problem: Cards Issued Difference
-- URL: https://datalemur.com/questions/cards-issued-difference

SELECT card_name, 
       MAX(issued_amount) - MIN(issued_amount) AS difference 
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY difference DESC;

/*
Thinking Process:
1. Find the difference between the highest and lowest card issuance volumes for each credit card.
2. Group the card dataset by card_name.
3. Subtract MIN(issued_amount) from MAX(issued_amount) to find the delta.
4. Sort descending to list cards with the highest variance first.
*/