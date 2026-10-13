-- Week 1: Recapping the basics.
-- Topics: SELECT, WHERE
-- Datasets: SQLBolt tutorials

-- Query 1: View only the title and year of each movie.
-- Question: What year were these movies produced?

SELECT Title, Year
FROM movies;

-- Query 2: View all movies released between 2000 and 2010
-- Question: Which movies were released in this timeframe?

SELECT * 
FROM movies
WHERE Year BETWEEN 2000 AND 2010;
