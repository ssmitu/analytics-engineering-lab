-- 1. Total population of California cities
SELECT SUM(population)
FROM city
WHERE district = 'California';


-- 2. Difference between maximum and minimum city populations
SELECT MAX(population) - MIN(population) AS difference
FROM city;


-- 3. Maximum employee earnings and employee count
SELECT MAX(salary * months) AS max_earnings,
       COUNT(*) AS num_employees
FROM employee
WHERE salary * months = (
    SELECT MAX(salary * months)
    FROM employee
);


-- 4. Sum of northern latitudes within a range
SELECT ROUND(SUM(lat_n), 4)
FROM station
WHERE lat_n > 38.7880
  AND lat_n < 137.2345;


-- 5. Western longitude for the largest latitude below a threshold
SELECT ROUND(long_w, 4)
FROM station
WHERE lat_n = (
    SELECT MAX(lat_n)
    FROM station
    WHERE lat_n < 137.2345
);