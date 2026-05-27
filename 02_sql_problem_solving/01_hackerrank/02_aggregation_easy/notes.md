# HackerRank – Aggregations (Easy) Notes

This section focuses on applying SQL aggregate functions through HackerRank problem-solving exercises.

The main learning objective here was understanding how aggregation combines with:
- filtering
- derived calculations
- subqueries
- range conditions

Instead of using aggregate functions in isolation, these problems required combining multiple SQL concepts together to produce meaningful results.

---

## 1. Total population of California cities

### Goal
Find the total population of all cities where the district is California.

### My thinking
This problem combined filtering with aggregation.

I used:

`SUM(population)`

to calculate the total population and added a `WHERE` clause to restrict the rows to only California districts.

This reinforced how aggregate functions usually operate on filtered datasets rather than entire tables.

---

## 2. Difference between maximum and minimum populations

### Goal
Find the difference between the highest and lowest population values.

### My thinking
This problem focused on combining aggregate functions into a calculated result.

I used:

`MAX(population) - MIN(population)`

to directly compute the population range.

The query demonstrated that aggregate functions can also be used inside arithmetic expressions to generate derived metrics.

---

## 3. Maximum employee earnings and employee count

### Goal
Find:
- the maximum total earnings
- how many employees earned that maximum amount

Where:

`salary * months`

represents total earnings.

### My thinking
This problem required combining:
- aggregate functions
- calculated values
- subqueries

First, I calculated total earnings using:

`salary * months`

Then I used a subquery to find the maximum earnings value:

`SELECT MAX(salary * months) FROM employee`

Finally, the outer query filtered employees matching that maximum value and counted them.

This was one of the more analytical aggregation problems because it required reusing a calculated metric inside another condition.

---

## 4. Sum of northern latitudes within a range

### Goal
Find the sum of latitude values within a specific range and round the result to 4 decimal places.

### My thinking
This problem combined:
- range filtering
- aggregation
- numeric formatting

I filtered the latitude values using:

`lat_n > 38.7880 AND lat_n < 137.2345`

and then used:

`ROUND(SUM(lat_n), 4)`

to format the final aggregated result.

---

## 5. Western longitude for the largest latitude below a threshold

### Goal
Find the longitude corresponding to the largest latitude smaller than a given value.

### My thinking
This problem required identifying a maximum value first and then retrieving another column associated with it.

I used a subquery:

`SELECT MAX(lat_n) FROM station WHERE lat_n < 137.2345`

to locate the target latitude.

Then the outer query returned the matching longitude value and rounded it to 4 decimal places.

This query reinforced how aggregate subqueries can be used to locate rows dynamically instead of hardcoding values.

---

## Key Takeaway

The main learning from these aggregation problems was understanding how aggregate functions interact with:
- filtering conditions
- derived calculations
- subqueries
- numeric formatting

These exercises felt closer to real analytical querying because they required combining multiple SQL concepts together rather than using aggregates independently.