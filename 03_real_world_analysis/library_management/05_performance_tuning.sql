-- =========================================================================
-- 05_PERFORMANCE_TUNING.SQL
-- Database Performance Tuning, Indexes, & Transactions
-- =========================================================================

-- 1. TRANSACTION SAFETY CONTROL (ACID compliance simulation)
BEGIN;

UPDATE Books
SET Price = 0.00;

-- Preview dynamic changes within active buffer state
SELECT * FROM Books;

-- Revert changes to prevent corruption
ROLLBACK;


-- 2. QUERY OPTIMIZATION ANALYSIS (Subquery vs CTE Window Function)
-- Run these locally and compare query execution plans using EXPLAIN ANALYZE

-- Plan A: Scalar Subquery filtering
EXPLAIN ANALYZE 
SELECT BookID, Title, Price FROM Books
WHERE Price > (SELECT AVG(Price) FROM Books);

-- Plan B: CTE Window Function implementation
EXPLAIN ANALYZE 
WITH av AS (
    SELECT BookID, Title, Price, 
           AVG(Price) OVER() AS avr
    FROM Books
)
SELECT BookID, Title, Price 
FROM av 
WHERE Price > avr;


-- 3. INDEX BENCHMARKING
-- Analyze performance before and after index implementation
EXPLAIN ANALYZE SELECT * FROM Loans WHERE MemberID = 1 AND LoanDate > '2023-01-01';

-- Create compound index targeting specific filter combinations
CREATE INDEX idx_composite_member_date ON Loans(MemberID, LoanDate);

-- Review updated query path choices (Bitmap Index Scan vs. Seq Scan)
EXPLAIN ANALYZE SELECT * FROM Loans WHERE MemberID = 1 AND LoanDate > '2023-01-01';


-- 4. STATISTICAL TABLE SAMPLING (For processing large datasets)
-- Sample approximately 20% of the table rows using Bernoulli row-level selection
SELECT * FROM Books TABLESAMPLE BERNOULLI (20);


-- 5. SEMI-STRUCTURED JSONB EXTRACTION
-- Query fields inside unstructured nested JSON payloads
SELECT info->>'author' AS Author,
       info->'tags'->>0 AS Primary_Tag
FROM Metadata;