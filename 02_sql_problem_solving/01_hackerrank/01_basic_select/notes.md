# HackerRank – Basic Select Notes

This section focuses on applying foundational SQL concepts through problem-solving exercises from HackerRank.

Unlike earlier guided SQL lessons, these problems required more careful interpretation of conditions, ordering rules, and filtering logic.

The main focus here was understanding how query requirements translate into actual SQL operations.

---

## 1. Cities with even ID numbers

### Goal
Return distinct city names where the station ID is an even number.

### My thinking
The `%` (modulus) operator made it possible to check whether an ID was divisible by 2. 

Using `ID % 2 = 0` filters only even-numbered IDs. I also used `DISTINCT` because the question explicitly required removing duplicate city names.

---

## 2. Cities with the shortest and longest names

### Goal
Find:
* The city with the shortest name
* The city with the longest name

If multiple cities had the same length, the alphabetically first one needed to be selected.

### My thinking
This problem required more than simple sorting because:
* City length had to be evaluated first
* Alphabetical ordering acted as a tie-breaker

For the shortest city, I ordered by `LENGTH(city) ASC` and then `city ASC`. For the longest city, I ordered by `LENGTH(city) DESC` and then `city ASC`. 

I used separate subqueries with `LIMIT 1` to isolate both results individually and combined them using `UNION`. This problem reinforced how SQL ordering rules can be layered together to satisfy multiple conditions.

---

## 3. Cities that either do not start or do not end with vowels

### Goal
Return cities that:
* Do not start with vowels OR Do not end with vowels

### My thinking
This problem required careful logical grouping. I used multiple `NOT LIKE` conditions for prefix matching (`a%`) and suffix matching (`%a`). 

The important part was understanding the `OR` relationship between the two condition groups. I also used `DISTINCT` because duplicate city names were not allowed in the result.

---

## 4. Students scoring above 75

### Goal
Return student names with marks above 75, ordered by the last three characters of the name. If multiple students shared the same last three characters, they needed secondary sorting by ID.

### My thinking
This problem focused more on custom sorting logic than filtering.

I used `RIGHT(name, 3)` to extract the final three characters of each name for ordering. Then, `ID ASC` was added as the secondary sorting condition to handle ties correctly. 

This query demonstrated how sorting can be based on transformed string values instead of entire columns.

---

## Key Takeaway
The biggest learning from these problems was not syntax itself, but learning how to:
* Interpret conditions carefully
* Translate problem statements into SQL logic
* Combine filtering and ordering rules correctly
* Handle edge cases such as duplicates and tie-breaking