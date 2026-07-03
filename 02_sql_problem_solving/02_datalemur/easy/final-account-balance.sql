-- Platform: DataLemur
-- Company: PayPal
-- Problem: Final Account Balance
-- URL: https://datalemur.com/questions/final-account-balance

SELECT account_id, 
       SUM(CASE WHEN transaction_type = 'Deposit' THEN amount ELSE -amount END) AS final_balance
FROM transactions
GROUP BY account_id;

/*
Thinking Process:
1. Calculate the final balance for each bank account.
2. Instead of running separate additions and subtractions, use a conditional CASE statement inside the SUM function.
3. Treat 'Deposit' as a positive amount, and any other transaction type (such as 'Withdrawal') as a negative amount.
4. Group by account_id to get the net balance per account.
*/