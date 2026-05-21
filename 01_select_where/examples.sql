-- 1. Toy Story movies (pattern matching)
SELECT *
FROM movies
WHERE title LIKE 'Toy%';


-- 2. Last 4 Pixar movies (most recent first)
SELECT *
FROM movies
ORDER BY year DESC
LIMIT 4;


-- 3. Cities in United States from north to south
SELECT city, latitude
FROM north_american_cities
WHERE country = 'United States'
ORDER BY latitude DESC;


-- 4. Cities west of Chicago (west → east)
SELECT *
FROM north_american_cities
WHERE longitude < -87.629798
ORDER BY longitude ASC;


-- 5. Two largest cities in Mexico
SELECT *
FROM north_american_cities
WHERE country = 'Mexico'
ORDER BY population DESC
LIMIT 2;


-- 6. 3rd and 4th largest cities in United States
SELECT *
FROM north_american_cities
WHERE country = 'United States'
ORDER BY population DESC
LIMIT 2 OFFSET 2;