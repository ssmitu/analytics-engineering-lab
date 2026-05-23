## SQL Aggregations – Thinking Process Notes

This section focuses on using aggregate functions to summarize and analyze data.

Unlike basic queries that return individual rows, aggregation queries combine multiple rows into meaningful grouped results. 

---

### 1. Average years employed for each role

**Goal:**  
Find the average number of years employees have worked in each role.

**My thinking:**  
Since multiple employees can share the same role, I grouped rows by role first and then applied the `AVG()` function to calculate the average years employed within each group.

This query helped me understand how aggregate functions operate on grouped records instead of individual rows.

---

### 2. Total employee years worked in each building

**Goal:**  
Calculate the total years worked by employees in each building.

**My thinking:**  
Instead of averaging values, this problem required combining all employment years together for each building. Using `SUM()` after grouping by building produced a cumulative total for every location.

This query demonstrated how aggregation can be used to measure total contribution or workload across groups.

---

### 3. Number of employees in each role

**Goal:**  
Count how many employees belong to each role.

**My thinking:**  
Grouping by role creates separate role categories, and `COUNT()` measures how many employee records exist inside each group.

This query helped reinforce the idea that aggregation is useful not only for numerical calculations, but also for summarizing record distribution.

---

### 4. Total years worked by all Engineers

**Goal:**  
Find the total years worked by employees with the Engineer role.

**My thinking:**  
This query required filtering grouped data rather than filtering rows before grouping.

I first grouped employees by role, then used `HAVING` to keep only the Engineer group. Finally, `SUM()` calculated the total years employed within that filtered group.

This helped me understand the difference between:
- `WHERE` → filters rows before grouping
- `HAVING` → filters grouped results after aggregation

---

## Key Takeaway

Aggregation queries shift SQL thinking from individual rows to summarized insights.

Using functions like:
- `AVG()`
- `SUM()`
- `COUNT()`

alongside `GROUP BY` makes it possible to:
- analyze patterns
- measure totals and averages
- summarize grouped data
- generate reporting-style outputs

The most important learning here was understanding how SQL can transform raw records into meaningful analytical summaries.