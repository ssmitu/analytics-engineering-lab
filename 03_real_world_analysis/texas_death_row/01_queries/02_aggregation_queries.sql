-- Count executions by county
SELECT county, COUNT(*) AS executions
FROM death_row_inmates
GROUP BY county
ORDER BY executions DESC;

-- Average age at execution
SELECT AVG(age_at_execution) AS avg_age
FROM death_row_inmates;

-- Executions by gender
SELECT gender, COUNT(*) AS executions
FROM death_row_inmates
GROUP BY gender;

-- Executions by race
SELECT race, COUNT(*) AS executions
FROM death_row_inmates
GROUP BY race;
