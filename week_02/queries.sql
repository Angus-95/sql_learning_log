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
