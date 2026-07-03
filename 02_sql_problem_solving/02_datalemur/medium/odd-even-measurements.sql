-- Platform: DataLemur
-- Company: Google
-- Problem: Odd and Even Measurements
-- URL: https://datalemur.com/questions/odd-even-measurements

WITH RankedMeasurements AS (
    SELECT measurement_time, 
           measurement_value,
           ROW_NUMBER() OVER(
               PARTITION BY CAST(measurement_time AS DATE)
               ORDER BY measurement_time
           ) AS rnk 
    FROM measurements
)
SELECT CAST(measurement_time AS DATE) AS measurement_day,
       SUM(CASE WHEN rnk % 2 = 1 THEN measurement_value ELSE 0 END) AS odd_sum,
       SUM(CASE WHEN rnk % 2 = 0 THEN measurement_value ELSE 0 END) AS even_sum
FROM RankedMeasurements
GROUP BY CAST(measurement_time AS DATE)
ORDER BY measurement_day;

/*
Thinking Process:
1. Sum values of measurements taken during the day, separated by their chronological order (odd vs. even rank).
2. Cast timestamp values to DATE to partition the records on a per-day basis.
3. Use ROW_NUMBER() ordered by time to flag the 1st, 2nd, 3rd, etc., measurements of each day.
4. Apply modulo arithmetic (rnk % 2) inside conditional aggregations (SUM with CASE WHEN) to aggregate odd and even records.
*/