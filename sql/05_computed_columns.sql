-- 05 · Computed columns on Animal

-- Add Computed Column for Full Name
ALTER TABLE Animal
ADD FullName AS (CONCAT(AnimalName, ' the ', Species));

-- Retrieve data with the new computed column
SELECT AnimalID, AnimalName, Species, FullName
FROM Animal;


-- Add Computed Column for Senior Flag
ALTER TABLE Animal
ADD IsSenior AS (CASE WHEN Age >= 8 THEN 'Yes' ELSE 'No' END);

-- Retrieve data with the new computed column
SELECT AnimalID, AnimalName, Age, IsSenior
FROM Animal;
