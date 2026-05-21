## SELECT & WHERE – Thinking Process Notes

This section contains my practice from SQL fundamentals (SELECT & WHERE).  
Instead of just writing queries, I focused on understanding *why* each solution works.

---

### 1. Finding Toy Story movies

**Goal:**  
Find all movies that belong to the Toy Story series.

**My thinking:**
I could have used different approaches like filtering by director or year, but the title pattern was the most direct and efficient way. Using `LIKE` with a wildcard (`%`) allows flexible string matching.

---

### 2. Last four Pixar movies (most recent first)

**Goal:**  
Get the most recent 4 movies.

**My thinking:**
Since the requirement was "most recent to least recent", ordering by year in descending order makes sense. After sorting, I only needed the top 4 rows. `LIMIT` naturally handles that, so no need for `OFFSET` because results already start from the highest year.

---

### 3. Cities from north to south (United States)

**Goal:**  
Order cities by latitude from north to south.

**My thinking:**
From the note in the dataset: positive latitude means north, and values decrease as we move south. So sorting in descending order gives north-to-south order directly. A simple filter for United States was enough since all North American cities already follow expected coordinate signs.

---

### 4. Cities west of Chicago (west → east)

**Goal:**  
List cities west of Chicago.

**My thinking:**
To determine "west of Chicago", I first needed Chicago’s longitude as a reference point. Since west corresponds to smaller (more negative) longitude values, filtering for values less than Chicago’s longitude gives the correct set.  
Finally, sorting in ascending order shows west-to-east progression.

---

### 5. Largest cities in Mexico

**Goal:**  
Get top 2 cities by population.

**My thinking:**
This is a standard "top N" problem. Sorting by population in descending order ensures largest cities come first, and `LIMIT 2` extracts only the required results.

---

### 6. 3rd and 4th largest cities in the US

**Goal:**  
Skip top 2 and get the next 2 largest cities.

**My thinking:**
After sorting by population in descending order, I used `OFFSET` to skip the top 2 cities and then `LIMIT` to get the next two. This is useful for pagination-style queries.

---

## Key Takeaway

Most problems here are variations of three core ideas:
- Pattern matching (LIKE)
- Sorting + limiting results
- Understanding numeric ordering (latitude/longitude, population)

The main learning here is understanding how sorting and filtering actually represent real-world thinking, not just writing SQL syntax.