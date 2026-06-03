-- Inmates executed after 2000
SELECT name, execution_date
FROM death_row_inmates
WHERE execution_date >= '2000-01-01';

-- Inmates with last statements mentioning God, forgiveness, or prayer
SELECT name, last_statement
FROM death_row_inmates
WHERE last_statement LIKE '%God%'
   OR last_statement LIKE '%forgive%'
   OR last_statement LIKE '%pray%'
   OR last_statement LIKE '%prayer%';

-- Inmates claiming innocence
SELECT name, last_statement
FROM death_row_inmates
WHERE last_statement LIKE '%innocent%'
   OR last_statement LIKE '%not guilty%'
   OR last_statement LIKE '%did not%'
   OR last_statement LIKE '%wrongly%';
