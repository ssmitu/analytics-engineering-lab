-- Platform: DataLemur
-- Company: LinkedIn
-- Problem: Data Science Skills
-- URL: https://datalemur.com/questions/matching-skills

SELECT candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(skill) = 3
ORDER BY candidate_id ASC;

/*
Thinking Process:
1. We need to identify candidates who possess all three specific skills: Python, Tableau, and PostgreSQL.
2. Filter rows using IN ('Python', 'Tableau', 'PostgreSQL') to look only at those target skills.
3. Group the candidates by candidate_id.
4. Use HAVING COUNT(skill) = 3 to filter for candidates who possess all three distinct target entries.
*/