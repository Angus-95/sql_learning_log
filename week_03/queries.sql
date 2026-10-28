-- Week 3: Aggregate functions
-- Topics: AVG, SUM, GROUP BY
-- Datasets: SQLBolt Tutorials

-- Question 1: given a dataset containing employee data in two buildings, return the total number of years worked in each building across all employees.

SELECT building, SUM(years_employed)
FROM employees
GROUP BY building;

