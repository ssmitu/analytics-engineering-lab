-- =========================================================================
-- 02_SEED_DATA.SQL
-- Mock Data Insertion (Professionalized)
-- =========================================================================

-- Populate Books Table with real literary classics
INSERT INTO Books (BookID, Title, Author, PublishedYear, Price) VALUES
(1, 'Harry Potter and the Philosopher''s Stone', 'J.K. Rowling', 1997, 10.89),
(2, 'A Study in Scarlet', 'Arthur Conan Doyle', 1887, 12.12),
(3, 'The Great Gatsby', 'F. Scott Fitzgerald', 1925, 9.89),
(4, 'The Hobbit', 'J.R.R. Tolkien', 1937, 10.69),
(5, 'Midnight Library', 'Matt Haig', 2020, 11.11);

-- Populate Members Table
INSERT INTO Members (MemberID, Name, JoinDate) VALUES
(1, 'Sarah Smith', CURRENT_DATE - INTERVAL '30 days'),
(2, 'James Carter', CURRENT_DATE - INTERVAL '40 days'),
(3, 'Emily Watson', CURRENT_DATE - INTERVAL '45 days');

-- Populate Loans Table (keeping matching IDs to ensure join tests work)
INSERT INTO Loans (LoanID, BookID, MemberID, LoanDate, ReturnDate) VALUES
(1, 4, 2, '2026-06-11', NULL),
(2, 4, 3, '2026-06-10', '2026-06-15'),
(3, 2, 1, '2026-06-16', '2026-06-23'),
(4, 1, 1, '2026-06-15', '2026-06-17'),
(5, 2, 1, '2026-06-15', NULL);

-- Populate JSONB Practice Metadata
INSERT INTO Metadata (id, info) VALUES 
(1, '{"author": "J.K. Rowling", "tags": ["magic", "fantasy"]}');