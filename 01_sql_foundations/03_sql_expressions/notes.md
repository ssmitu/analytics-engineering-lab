## SQL Expressions – Thinking Process Notes

This section focuses on using SQL expressions to transform existing data into more meaningful or readable information.

Instead of only retrieving stored values, these queries perform calculations directly inside the query to create derived results.

---

### 1. Combined movie sales in millions

**Goal:**  
Calculate the total sales for each movie using both domestic and international sales.

**My thinking:**  
The sales information was stored separately inside the box office table, so I first joined the movie and box office tables using their related IDs.

After combining the tables, I added domestic and international sales together to calculate total sales.

Since the original numbers were very large, dividing by 1,000,000 made the output easier to read in terms of millions of dollars.

This query helped me understand how SQL expressions can be used to create cleaner business-oriented metrics from raw numerical data.

---

### 2. Movie ratings converted into percentage

**Goal:**  
Display movie ratings as percentages.

**My thinking:**  
The ratings were stored as decimal values, so multiplying them by 10 converted them into percentage-style values that are easier to interpret.

I used a `LEFT JOIN` so that all movies would still appear even if some rating information was missing.

This query showed how SQL expressions can transform stored data into more user-friendly formats without modifying the original database values.

---

## Key Takeaway

SQL expressions allow raw data to be transformed into more meaningful outputs directly inside queries.

Instead of only selecting existing columns, expressions make it possible to:
- calculate derived values
- improve readability
- create business-focused metrics
- present data in a more interpretable format

The main learning here was understanding how SQL can be used not only to retrieve data, but also to shape and transform it.