-- Platform: DataLemur
-- Company: Tesla
-- Problem: Unfinished Parts
-- URL: https://datalemur.com/questions/tesla-unfinished-parts

SELECT part, assembly_step 
FROM parts_assembly 
WHERE finish_date IS NULL;

/*
Thinking Process:
1. The goal is to isolate parts that are currently in assembly but have not been completed.
2. Completed parts have a physical finish_date timestamp, while unfinished ones remain NULL.
3. Apply a basic WHERE filter to isolate records where finish_date IS NULL.
*/