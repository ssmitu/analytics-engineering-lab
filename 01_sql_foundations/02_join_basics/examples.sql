-- 1. Movies with higher international sales than domestic sales
SELECT Title, Domestic_sales, International_sales
FROM movies
INNER JOIN Boxoffice
ON Movies.Id = Boxoffice.Movie_id
WHERE International_sales > Domestic_sales;


-- 2. Movies ordered by rating (highest to lowest)
SELECT Title, Rating
FROM movies
INNER JOIN Boxoffice
ON Movies.Id = Boxoffice.Movie_id
ORDER BY Rating DESC;


-- 3. Buildings that currently have employees
SELECT DISTINCT Building_name
FROM Employees
LEFT JOIN Buildings
ON Employees.Building = Buildings.Building_name;


-- 4. All buildings and employee roles (including empty buildings)
SELECT DISTINCT Role, Building_name
FROM Buildings
LEFT JOIN Employees
ON Buildings.Building_name = Employees.Building;


-- 5. Employees without assigned buildings
SELECT Name, Role
FROM Employees
LEFT JOIN Buildings
ON Employees.Building = Buildings.Building_name
WHERE Building IS NULL;