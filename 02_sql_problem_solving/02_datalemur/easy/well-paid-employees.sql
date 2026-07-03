-- Platform: DataLemur
-- Company: FAANG
-- Problem: Well Paid Employees
-- URL: https://datalemur.com/questions/sql-well-paid-employees

SELECT e.employee_id, 
       e.name 
FROM employee e 
INNER JOIN employee m ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;

/*
Thinking Process:
1. Find employees who earn more than their direct managers.
2. This requires a self-join on the employee table.
3. Map the employee alias (e) to their manager alias (m) using e.manager_id = m.employee_id.
4. Filter for rows where the employee's salary is greater than the manager's salary.
*/