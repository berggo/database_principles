-- Find the capital city 
SELECT c.Name AS CapitalCity
FROM country AS co
JOIN city c ON co.Capital = c.ID
WHERE co.Name = 'Argentina';

-- Which country has the most cities in the database?
SELECT co.Name, COUNT(c.Name) AS CityCount
FROM country co
JOIN city c ON co.Code = c.CountryCode
GROUP BY co.Name
ORDER BY CityCount DESC
LIMIT 1;

-- Find the smallest country (by surface area) that has a population of over 10 million.
SELECT Name, SurfaceArea, Population
FROM country
WHERE Population > 10000000
ORDER BY SurfaceArea ASC
LIMIT 1;

-- List all countries where Spanish is an official language.
SELECT DISTINCT co.Name
FROM country co
JOIN countrylanguage cl ON co.Code = cl.CountryCode
WHERE cl.Language = 'Spanish' && cl.IsOfficial = 'T';

-- Find countries where no official language is recorded in the database.
SELECT c.Name
FROM country c
LEFT JOIN countrylanguage cl ON c.Code = cl.CountryCode AND cl.IsOfficial = 'T'
WHERE cl.Language IS NULL;

-- Which continent has the largest total population?
SELECT Continent, SUM(Population) AS TotalPopulation
FROM country
GROUP BY Continent
ORDER BY TotalPopulation DESC
LIMIT 1;

