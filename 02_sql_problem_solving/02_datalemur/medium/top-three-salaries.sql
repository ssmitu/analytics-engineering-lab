-- Platform: DataLemur
-- Company: FAANG
-- Problem: Top Three Salaries
-- URL: https://datalemur.com/questions/sql-top-three-salaries

WITH DepartmentSalaries AS (
    SELECT name, 
           employee_id, 
           department_id, 
           salary,
           DENSE_RANK() OVER(
               PARTITION BY department_id
               ORDER BY salary DESC
           ) AS sal_rank 
    FROM employee
)
SELECT d.department_name,
       s.name,
       s.salary
FROM DepartmentSalaries s
INNER JOIN department d ON s.department_id = d.department_id
WHERE s.sal_rank <= 3
ORDER BY d.department_name ASC, 
         s.salary DESC, 
         s.name ASC;

/*
Thinking Process:
1. Identify the top three unique earners within each department.
2. DENSE_RANK() is required to handle identical salary ties fairly inside the department groupings.
3. Partition the rankings by department_id, sorting descending by salary.
4. Join the ranked query set with the department directory lookup table to resolve physical names.
5. Filter where the ranking rank is <= 3, and apply sorting requirements.
*/