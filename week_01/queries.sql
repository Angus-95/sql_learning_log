-- Week 1: Recapping the basics.
-- Topics: SELECT, WHERE, ORDER BY, INNER JOINS
-- Datasets: SQLBolt tutorials

-- Movie Dataset
-- Query 1: View only the title and year of each movie.

SELECT Title, Year
FROM movies;

-- Query 2: View all movies released between 2000 and 2010

SELECT * 
FROM movies
WHERE Year BETWEEN 2000 AND 2010;

-- Query 3: View all Toy Story Movies.

SELECT *
FROM movies
WHERE Title LIKE "%Toy Story%";

-- Query 4: Order movies alphabetically, view only numbers 6 to 10.
-- Useful if for example I want to separate a dataset into pages - pagination. Possibly not ideal for very large datasets.

SELECT *
FROM movies
ORDER BY Title ASC
LIMIT 5
OFFSET 5;

-- North American Cities Dataset
-- Query 5: Show all cities west of Chicago, ordered from west to east
-- I can nest clauses in SQL similar to python.

SELECT *
FROM north_american_cities
WHERE Longitude < (SELECT Longitude               -- This could be done by searching for Chicago first and inputting the exact correct Longitude, but this code is easier to reuse.
        FROM north_american_cities
        WHERE City = "Chicago")
ORDER BY Longitude ASC;

-- Movies Dataset - Accessing two tables
-- Query 6: Show all movies, where international box office sales exceed domestic ones.
-- This would be very useful when considering which IPs are popular abroad.

SELECT Title, Domestic_sales, International_sales 
FROM movies
INNER JOIN boxoffice
ON movies.id = boxoffice.movie_id
WHERE international_sales > domestic_sales;
