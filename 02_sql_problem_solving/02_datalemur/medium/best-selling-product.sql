-- Platform: DataLemur
-- Company: Amazon
-- Problem: Best-Selling Product
-- URL: https://datalemur.com/questions/best-selling-products

WITH RankedCategorySales AS (
    SELECT p.product_id,
           p.product_name,
           p.category_name,
           ROW_NUMBER() OVER(
               PARTITION BY p.category_name
               ORDER BY ps.sales_quantity DESC, ps.rating DESC
           ) AS rnk
    FROM products p
    INNER JOIN product_sales ps ON p.product_id = ps.product_id
)
SELECT category_name, 
       product_name
FROM RankedCategorySales
WHERE rnk = 1
ORDER BY category_name ASC, 
         product_name ASC;

/*
Thinking Process:
1. Identify the top-selling product inside each unique product category.
2. Join products with product_sales on product_id.
3. Rank products within each category using ROW_NUMBER().
4. Order the partitions primarily by sales_quantity descending, and use product rating descending as the tie-breaker.
5. Filter where rnk = 1 to select only the top-seller for each category.
*/