-- =========================================================================
-- 03_CORE_QUERIES.SQL
-- Core Operations: Filters, Joins, and Aggregations
-- =========================================================================

-- 1. Pattern Matching & String Operations
SELECT * FROM Books WHERE Author LIKE 'J%';
SELECT * FROM Books WHERE Title LIKE '%The%';
SELECT * FROM Books WHERE Author LIKE '%o';
SELECT UPPER(Name) AS Member_Name, EXTRACT(YEAR FROM JoinDate) AS Join_Year FROM Members;
SELECT LEFT(Name, 3) || CAST(MemberID AS VARCHAR) AS MemberBadge FROM Members;

-- 2. Range & Null Value Filters
SELECT * FROM Books WHERE Price BETWEEN 10.00 AND 12.00;
SELECT * FROM Loans WHERE ReturnDate IS NULL;

-- 3. Core Join Architectures
-- Inner Join: Active borrowers
SELECT m.Name 
FROM Members m
INNER JOIN Loans l ON m.MemberID = l.MemberID
WHERE l.ReturnDate IS NULL;

-- Left Join: Identify inactive members (members who have never borrowed a book)
SELECT m.Name 
FROM Members m 
LEFT JOIN Loans l ON m.MemberID = l.MemberID
WHERE l.LoanID IS NULL;

-- Three-way Inner Join
SELECT m.Name AS MemberName, b.Title AS BookTitle, l.LoanDate
FROM Members m
INNER JOIN Loans l ON m.MemberID = l.MemberID
INNER JOIN Books b ON l.BookID = b.BookID;

-- 4. Basic Aggregations & Grouping
SELECT m.Name, COUNT(*) AS TotalBorrowed
FROM Members m
INNER JOIN Loans l ON m.MemberID = l.MemberID
GROUP BY m.Name;

SELECT m.Name 
FROM Members m
INNER JOIN Loans l ON m.MemberID = l.MemberID
GROUP BY m.Name
HAVING COUNT(l.LoanID) > 2;

-- Summing prices of books currently out on loan
SELECT SUM(b.Price) AS Total_Value_Out
FROM Books b
INNER JOIN Loans l ON b.BookID = l.BookID
WHERE l.ReturnDate IS NULL;