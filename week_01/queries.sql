-- Week 1: Recapping the basics.
-- Topics: SELECT, WHERE
-- Datasets: SQLBolt tutorials

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
