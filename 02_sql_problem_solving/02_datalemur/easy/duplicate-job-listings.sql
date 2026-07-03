-- Platform: DataLemur
-- Company: LinkedIn
-- Problem: Duplicate Job Listings
-- URL: https://datalemur.com/questions/duplicate-job-listings

WITH DuplicateJobs AS (
    SELECT company_id, title, description, 
           COUNT(*) AS cnt
    FROM job_listings
    GROUP BY company_id, title, description
    HAVING COUNT(*) > 1
)
SELECT COUNT(*) AS duplicate_companies
FROM DuplicateJobs;

/*
Thinking Process:
1. Find the number of duplicate job postings (same company, title, and description).
2. In the CTE, group records by company_id, title, and description.
3. Use HAVING COUNT(*) > 1 to isolate groups that have been posted more than once.
4. In the final outer query, count the total rows in the CTE to get the count of duplicate job listings.
*/