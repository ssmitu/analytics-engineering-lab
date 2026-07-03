-- Platform: DataLemur
-- Company: FAANG
-- Problem: Second Highest Salary
-- URL: https://datalemur.com/questions/sql-second-highest-salary

WITH RankedSalaries AS (
    SELECT salary,
           DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk 
    FROM employee
)
SELECT DISTINCT salary AS second_highest_salary 
FROM RankedSalaries 
WHERE rnk = 2;

/*
Thinking Process:
1. Find the second highest salary value from the employee table.
2. Multiple employees can share the highest salary, so DENSE_RANK() is preferred over ROW_NUMBER().
3. Sort salaries descending overall inside the CTE to rank highest salaries as 1, second as 2, etc.
4. Filter where rnk = 2, and use DISTINCT to prevent returning duplicate matching values.
*/