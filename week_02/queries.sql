-- Week 2: Combining tables
-- Topics: JOINs, IS/IS NOT NULL,
-- Datasets: SQLBolt Tutorials, DataLemur Practice Questions

-- Query 1: combine a table of office buildings with an employee repository to find which employee roles are prevalent in which building,
-- and which are empty.

SELECT DISTINCT Building_name, role 
FROM buildings                                    -- This is our "left" table.
LEFT JOIN employees                               -- And this is our "right" one.
ON buildings.building_name = employees.building;  -- like all JOINs, rows are linked by a unique key.

-- Query 2: view only the empty buildings

SELECT DISTINCT building_name, role
FROM buildings
LEFT JOIN employees
ON buildings.building_name = employees.building
WHERE role IS NULL;

--Query 3: retrieve the top three cities that have the highest number of completed trade orders listed in descending order.
-- I wanted more join practice before I moved on, so I have been working with DataLemur questions.
--This is a direct response to the question found here: https://datalemur.com/questions/completed-trades

SELECT city, COUNT(order_id) AS completed_trades 
FROM trades
JOIN users
ON trades.user_id = users.user_id
WHERE trades.status = 'Completed'                -- Adding this WHERE clause filtered out any potential cancelled trades.
GROUP BY city
ORDER BY completed_trades DESC
LIMIT 3;

-- Query 4: Given two tables contaiining data about Facebook pages and their respective likes,
-- find a list of pages without any likes, listed in ascending order by page ID.
-- A response to the DataLemur question at https://datalemur.com/questions/sql-page-with-no-likes

SELECT pages.page_id
FROM pages
FULL JOIN page_likes                   -- A full join here ensures all data from both tables will be joined.
ON pages.page_id = page_likes.page_id  -- Any page IDs with no likes will still be displayed as null values.
WHERE liked_date ISNULL                -- Filtering to include only null values in the liked_date column then only includes those entries with no likes.
ORDER BY page_id ASC;
