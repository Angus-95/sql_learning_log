-- Week 2: Combining tables
-- Topics: JOINs, IS/IS NOT NULL,
-- Datasets: SQLBolt Tutorials

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
