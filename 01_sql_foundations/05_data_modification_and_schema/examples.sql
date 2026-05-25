-- 1. Insert a new movie record
INSERT INTO movies
VALUES (4, 'Toy Story 4', 'SSMitu', 2026, 78);


-- 2. Update incorrect director information
UPDATE movies
SET director = 'John Lasseter'
WHERE Title = 'A Bug''s Life';


-- 3. Update multiple columns in a single row
UPDATE Movies
SET Title = 'Toy Story 3',
    Director = 'Lee Unkrich'
WHERE Title = 'Toy Story 8';


-- 4. Delete movies released before 2005
DELETE FROM movies
WHERE year < 2005;


-- 5. Create a new table
CREATE TABLE IF NOT EXISTS Database (
    Name TEXT,
    Version FLOAT,
    Download_count INT
);


-- 6. Add a new column with default value
ALTER TABLE movies
ADD Language TEXT DEFAULT 'English';


-- 7. Drop the movies table
DROP TABLE IF EXISTS Movies;