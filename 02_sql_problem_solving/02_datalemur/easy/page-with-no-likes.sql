-- Platform: DataLemur
-- Company: Facebook
-- Problem: Page With No Likes
-- URL: https://datalemur.com/questions/sql-page-with-no-likes

SELECT p.page_id 
FROM pages p
LEFT JOIN page_likes pl ON p.page_id = pl.page_id
WHERE pl.page_id IS NULL
ORDER BY p.page_id ASC;

/*
Thinking Process:
1. We need to identify Facebook pages that have received zero likes.
2. An INNER JOIN would exclude pages without likes, so we use a LEFT JOIN from Pages (left) to Page Likes (right).
3. If a page has no likes, the joined columns from page_likes will result in NULL values.
4. Filter for records where the joined page_id is NULL, and sort the output by page_id.
*/