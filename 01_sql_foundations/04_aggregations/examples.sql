-- 1. Average years employed for each role
SELECT Role,
       AVG(Years_employed) AS avg_years_worked
FROM Employees
GROUP BY Role;


-- 2. Total employee years worked in each building
SELECT Building,
       SUM(Years_employed) AS total_years_worked
FROM Employees
GROUP BY Building;


-- 3. Number of employees in each role
SELECT Role,
       COUNT(*) AS employee_count
FROM Employees
GROUP BY Role;


-- 4. Total years worked by all Engineers
SELECT SUM(Years_employed) AS total_years_worked
FROM Employees
GROUP BY Role
HAVING Role = 'Engineer';