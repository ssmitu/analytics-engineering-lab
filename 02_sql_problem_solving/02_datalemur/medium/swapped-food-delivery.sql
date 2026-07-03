-- Platform: DataLemur
-- Company: Zomato
-- Problem: Swapped Food Delivery
-- URL: https://datalemur.com/questions/sql-swapped-food-delivery

WITH OrderedItems AS (
    SELECT order_id, 
           item,
           ROW_NUMBER() OVER(ORDER BY order_id) AS rnk
    FROM orders
)
SELECT order_id AS corrected_order_id, 
       CASE 
           WHEN rnk % 2 = 1 THEN COALESCE(LEAD(item) OVER(ORDER BY rnk), item)
           WHEN rnk % 2 = 0 THEN COALESCE(LAG(item) OVER(ORDER BY rnk), item)
       END AS corrected_item
FROM OrderedItems
ORDER BY order_id;

/*
Thinking Process:
1. Swap adjacent order items (swap order 1 with 2, 3 with 4, etc.).
2. Use ROW_NUMBER() to generate sequential row ranks.
3. Odd-ranked rows need the item value from the subsequent row (LEAD).
4. Even-ranked rows need the item value from the preceding row (LAG).
5. Use COALESCE to handle boundary conditions (e.g., if there is an odd number of total orders, the final odd row retains its own item).
*/