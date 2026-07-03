-- =========================================================================
-- 01_SCHEMA.SQL
-- Database Schema for Library Management System
-- =========================================================================

DROP VIEW IF EXISTS Active_Library_Status CASCADE;
DROP MATERIALIZED VIEW IF EXISTS library_status_mv CASCADE;
DROP TABLE IF EXISTS Loans CASCADE;
DROP TABLE IF EXISTS Members CASCADE;
DROP TABLE IF EXISTS Books CASCADE;
DROP TABLE IF EXISTS Metadata CASCADE;

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    PublishedYear INT,
    Price DECIMAL(10, 2),
    CONSTRAINT Price_check CHECK (Price > 0)
);

CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    JoinDate DATE DEFAULT CURRENT_DATE
);

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    BookID INT REFERENCES Books(BookID) ON DELETE CASCADE,
    MemberID INT REFERENCES Members(MemberID) ON DELETE CASCADE,
    LoanDate DATE NOT NULL,
    ReturnDate DATE,
    CONSTRAINT Check_Return_Date CHECK (ReturnDate >= LoanDate)
);

CREATE TABLE Metadata (
    id INT PRIMARY KEY,
    info JSONB
);

-- Indexes for performance testing
CREATE INDEX idx_member_loans ON Loans(MemberID);
CREATE INDEX idx_loans_composite ON Loans(MemberID, LoanDate);

-- View: Active Library Status
CREATE OR REPLACE VIEW Active_Library_Status AS
SELECT b.Title, m.Name, 
       COALESCE(l.ReturnDate, CURRENT_DATE) - l.LoanDate AS Days_Held
FROM Members m
JOIN Loans l ON m.MemberID = l.MemberID
JOIN Books b ON l.BookID = b.BookID;

-- Materialized View
CREATE MATERIALIZED VIEW library_status_mv AS
SELECT b.BookID, b.Title, m.MemberID, m.Name, l.LoanDate, l.ReturnDate
FROM Books b
JOIN Loans l ON b.BookID = l.BookID
JOIN Members m ON l.MemberID = m.MemberID;