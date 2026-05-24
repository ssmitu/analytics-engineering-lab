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

-- 5. total sales that can be attributed to each director
SELECT Director,
       COUNT(Title) AS movie_count,
       SUM(Domestic_sales + International_sales) AS total_sales
FROM Movies
INNER JOIN Boxoffice
ON Movies.Id = Boxoffice.Movie_id
GROUP BY Director;