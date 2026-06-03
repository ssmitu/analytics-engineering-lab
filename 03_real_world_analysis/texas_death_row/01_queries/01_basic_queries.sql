-- Retrieve all inmates with execution dates
SELECT inmate_id, name, execution_date
FROM death_row_inmates
ORDER BY execution_date DESC;

-- Count total inmates
SELECT COUNT(*) AS total_inmates
FROM death_row_inmates;
