-- Rank counties by execution count
SELECT county, COUNT(*) AS executions,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS rank
FROM death_row_inmates
GROUP BY county;

-- Calculate running total of executions by year
SELECT EXTRACT(YEAR FROM execution_date) AS year,
       COUNT(*) AS executions,
       SUM(COUNT(*)) OVER (ORDER BY EXTRACT(YEAR FROM execution_date)) AS cumulative_executions
FROM death_row_inmates
GROUP BY year
ORDER BY year;

-- Time gap between consecutive executions (self join)
SELECT a.name AS inmate, a.execution_date,
       a.execution_date - b.execution_date AS days_since_last_execution
FROM death_row_inmates a
JOIN death_row_inmates b
  ON a.execution_date > b.execution_date
WHERE NOT EXISTS (
    SELECT 1 FROM death_row_inmates c
    WHERE c.execution_date > b.execution_date
      AND c.execution_date < a.execution_date
)
ORDER BY a.execution_date;
