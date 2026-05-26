-- 1. Cities with even ID numbers
SELECT DISTINCT CITY
FROM STATION
WHERE ID % 2 = 0;


-- 2. Cities with the shortest and longest names
-- Shortest city
SELECT city, LENGTH(city) AS name_length
FROM (
    SELECT city
    FROM station
    ORDER BY LENGTH(city) ASC, city ASC
    LIMIT 1
) shortest

UNION

-- Longest city
SELECT city, LENGTH(city) AS name_length
FROM (
    SELECT city
    FROM station
    ORDER BY LENGTH(city) DESC, city ASC
    LIMIT 1
) longest;


-- 3. Cities that either do not start with vowels
-- or do not end with vowels
SELECT DISTINCT city
FROM station
WHERE
(city NOT LIKE 'a%'
 AND city NOT LIKE 'e%'
 AND city NOT LIKE 'i%'
 AND city NOT LIKE 'o%'
 AND city NOT LIKE 'u%')

OR

(city NOT LIKE '%a'
 AND city NOT LIKE '%e'
 AND city NOT LIKE '%i'
 AND city NOT LIKE '%o'
 AND city NOT LIKE '%u');


-- 4. Students scoring higher than 75
-- ordered by the last 3 characters of their names
SELECT name
FROM students
WHERE Marks > 75
ORDER BY RIGHT(name, 3), ID ASC;