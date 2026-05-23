-- 1. Combined movie sales in millions
SELECT Title,
       (b.Domestic_sales + b.International_sales) / 1000000 AS sales
FROM movies AS m
INNER JOIN Boxoffice AS b
ON m.Id = b.Movie_id;


-- 2. Movie ratings converted into percentage
SELECT Title,
       b.Rating * 10 AS rate_in_percentage
FROM movies AS m
LEFT JOIN Boxoffice AS b
ON m.Id = b.Movie_id;