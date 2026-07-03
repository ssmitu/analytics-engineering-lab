-- Platform: DataLemur
-- Company: McKinsey
-- Problem: 3-Topping Pizzas
-- URL: https://datalemur.com/questions/pizzas-topping-cost

SELECT p1.topping_name || ',' || p2.topping_name || ',' || p3.topping_name AS pizza,
       (p1.ingredient_cost + p2.ingredient_cost + p3.ingredient_cost) AS total_cost
FROM pizza_toppings p1
INNER JOIN pizza_toppings p2 ON p1.topping_name < p2.topping_name
INNER JOIN pizza_toppings p3 ON p2.topping_name < p3.topping_name
ORDER BY total_cost DESC, 
         pizza ASC;

/*
Thinking Process:
1. Generate all unique three-topping combinations and sum their ingredient costs.
2. Join the pizza_toppings table with itself three times.
3. To prevent duplicate combinations (e.g., "A,B,C" vs "C,B,A") and self-matching, use an inequality join constraint: p1.topping_name < p2.topping_name AND p2.topping_name < p3.topping_name.
4. Concat the output names into a comma-separated format and sum their costs.
5. Sort primarily by cost descending, and alphabetically as a tie-breaker.
*/