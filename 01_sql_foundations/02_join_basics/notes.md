## JOIN Basics – Thinking Process Notes

This section focuses on understanding how relationships between tables work using SQL JOIN operations.

Instead of only combining tables syntactically, I tried to understand why different JOIN types are useful and how related information is distributed across tables.

---

### 1. Movies that performed better internationally

**Goal:**  
Find movies where international sales exceeded domestic sales.

**My thinking:**  
Movie titles were stored in one table while sales data existed in another table, so an `INNER JOIN` was necessary to combine related records.

After joining both tables through the movie ID relationship, I compared international and domestic sales values directly inside the `WHERE` clause.

This query helped me understand how JOINs allow comparisons across related datasets.

---

### 2. Movies ordered by ratings

**Goal:**  
List movies from highest rated to lowest rated.

**My thinking:**  
Ratings were stored in the box office table, while movie titles were stored separately.  
After joining the tables, I sorted the ratings in descending order because the requirement was highest-to-lowest ranking.

This was a straightforward example of combining relational data and then applying sorting logic.

---

### 3. Buildings that currently have employees

**Goal:**  
Find buildings that are associated with employees.

**My thinking:**  
The employee table already contains building references, but I still used a JOIN to connect employee records with actual building information.

Since multiple employees can belong to the same building, `DISTINCT` was needed to avoid duplicate building names.

This query reinforced the idea that relationships can create repeated rows after joining.

---

### 4. Buildings and employee roles (including empty buildings)

**Goal:**  
List all buildings and employee roles, including buildings without employees.

**My thinking:**  
This problem specifically mentioned including empty buildings, so a `LEFT JOIN` was the correct choice.

Starting from the buildings table ensures all buildings remain in the result, even if no matching employee exists.

This query helped me understand the practical difference between `INNER JOIN` and `LEFT JOIN`.

---

### 5. Employees without assigned buildings

**Goal:**  
Find employees who are not assigned to any building.

**My thinking:**  
A `LEFT JOIN` was useful here because unmatched rows from employees would still remain in the result.

If the building field is `NULL`, it means the employee does not currently have a building assignment.

This query helped me understand how NULL values can reveal missing relationships inside a database.

---

## Key Takeaway

The most important learning from JOINs is understanding relationships between tables.

Instead of storing everything in one table, databases separate related information across multiple tables, and JOIN operations reconnect those relationships when querying data.