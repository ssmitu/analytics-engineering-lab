-- =========================================================================
-- 04_ADVANCED_ANALYTICS.SQL
-- Advanced Analytics: Gaps & Islands, Self-Joins, & CTE Pipelines
-- =========================================================================

-- 1. GAPS AND ISLANDS (Streak Detection)
-- Tracks continuous loan blocks per member using dual sequence-ordering.
WITH tempo AS (
    SELECT MemberID, LoanDate,
           ROW_NUMBER() OVER(PARTITION BY MemberID ORDER BY LoanDate) AS seq
    FROM Loans
),
groups AS (
    SELECT MemberID, LoanDate,
           LoanDate - CAST(seq AS INT) AS streak 
    FROM tempo
)
SELECT MemberID,
       MIN(LoanDate) AS streak_starts,
       MAX(LoanDate) AS streak_ends,
       COUNT(*) AS days_in_streak
FROM groups
GROUP BY MemberID, streak
ORDER BY MemberID, streak;


-- 2. SELF-JOINS FOR BEHAVIORAL LOGIC
-- Query A: Identify duplicate loans (Same member borrowing the same book more than once)
SELECT L1.MemberID, L1.BookID, L1.LoanDate AS FirstLoan, L2.LoanDate AS SecondLoan
FROM Loans L1
JOIN Loans L2 ON L1.MemberID = L2.MemberID 
             AND L1.BookID = L2.BookID
             AND L1.LoanID < L2.LoanID;

-- Query B: Find members who borrowed a book on the same day they returned another
SELECT L1.MemberID, L1.LoanDate AS BorrowDate, L2.ReturnDate AS ReturnDate
FROM Loans L1
JOIN Loans L2 ON L1.MemberID = L2.MemberID
             AND L1.LoanDate = L2.ReturnDate
             AND L1.LoanID <> L2.LoanID;


-- 3. INTERMEDIATE & ADVANCED WINDOW FUNCTIONS
-- Query A: Dynamic price delta comparison using LAG() vs Self-Join
SELECT b1.Title, b1.Price, b2.Price AS Previous_Book_Price
FROM Books b1
LEFT JOIN Books b2 ON b1.BookID = b2.BookID + 1
ORDER BY b1.BookID;

-- Query B: Dense ranking (Find 2nd most expensive book)
WITH RankedBooks AS (
    SELECT Title, Price,
           DENSE_RANK() OVER(ORDER BY Price DESC) AS Price_Rank
    FROM Books
)
SELECT Title, Price FROM RankedBooks WHERE Price_Rank = 2;

-- Query C: Rolling 3-Book Moving Average
SELECT BookID, Title, Price,
       AVG(Price) OVER(ORDER BY BookID ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg
FROM Books;


-- 4. THE "NOT IN" WITH NULL TRAP (Logical Gotcha)
-- This shows why standard NOT IN fails if the subquery contains a NULL, and how to query around it.
-- This will return 0 rows if a single BookID has a NULL Loan status:
SELECT * FROM Books 
WHERE BookID NOT IN (SELECT BookID FROM Loans);

-- Correct approach using LEFT JOIN or NOT EXISTS:
SELECT b.* FROM Books b
LEFT JOIN Loans l ON b.BookID = l.BookID
WHERE l.BookID IS NULL;


-- 5. COMPLEX CTE PIPELINE (Membership Tier Segmentation)
WITH rec AS (
    SELECT MemberID, BookID, LoanDate, LoanID,
           ROW_NUMBER() OVER(PARTITION BY MemberID ORDER BY LoanDate DESC) AS recn
    FROM Loans
),
total AS (
    SELECT MemberID, COUNT(LoanID) AS tot 
    FROM Loans 
    GROUP BY MemberID
),
titles AS (
    SELECT r.MemberID, m.Name, r.BookID, b.Title 
    FROM rec r
    JOIN Books b ON r.BookID = b.BookID
    JOIN Members m ON r.MemberID = m.MemberID
    WHERE recn = 1
)
SELECT t.Name, t.Title AS Last_Borrowed_Book, 
       CASE 
           WHEN tot.tot >= 3 THEN 'Loyal'
           ELSE 'New' 
       END AS Member_Status
FROM titles t
JOIN total tot ON t.MemberID = tot.MemberID;


-- 6. YEAR-OVER-YEAR VALUE GROWTH (Safe Division with NULLIF)
WITH prev AS (
    SELECT PublishedYear, SUM(Price) AS Total FROM Books
    GROUP BY PublishedYear
),
growth AS (
    SELECT PublishedYear, Total,
           LAG(Total) OVER (ORDER BY PublishedYear) AS pre
    FROM prev
)
SELECT PublishedYear, Total, pre AS Previous_Year_Total,
       100 * (Total - pre) / NULLIF(pre, 0) AS growth_percentage
FROM growth
ORDER BY PublishedYear;