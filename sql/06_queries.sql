-- 06 · Analytical queries

-- Adoption statistics by animal type
SELECT
    Type.TypeName AS AnimalType,
    COUNT(AdoptionRecord.AdoptionID) AS AdoptionCount,
    CAST(AVG(CAST(Animal.Age AS DECIMAL(4, 1))) AS DECIMAL(4, 1)) AS AverageAdoptedAge
FROM AdoptionRecord
JOIN Animal ON AdoptionRecord.AnimalID = Animal.AnimalID
JOIN Type ON Animal.TypeID = Type.TypeID
GROUP BY Type.TypeName
ORDER BY AdoptionCount DESC;

-- Latest health condition on record for each animal
WITH RankedConditions AS (
    SELECT
        AnimalID,
        ConditionDescription,
        Diagnosis,
        VisitDate,
        ROW_NUMBER() OVER (PARTITION BY AnimalID ORDER BY VisitDate DESC) AS rn
    FROM AnimalHealthCondition
)
SELECT
    Animal.AnimalName,
    Animal.Species,
    RankedConditions.ConditionDescription,
    RankedConditions.Diagnosis,
    RankedConditions.VisitDate
FROM RankedConditions
JOIN Animal ON Animal.AnimalID = RankedConditions.AnimalID
WHERE RankedConditions.rn = 1
ORDER BY RankedConditions.VisitDate DESC;

-- Complex query with joins
SELECT
    A.AnimalID,
    A.AnimalName,
    A.Species,
    COUNT(VV.VetVisitID) AS TotalVisits,
    AVG(A.Age) AS AverageAgeDuringVisits,
    MAX(VV.VisitDate) AS MostRecentVisitDate,
    S.StaffName AS MostRecentVisitStaff
FROM
    Animal A
JOIN
    VetVisit VV ON A.AnimalID = VV.AnimalID
JOIN
    Staff S ON VV.StaffID = S.StaffID
WHERE
    A.AdoptionStatus = 'Adopted'
GROUP BY
    A.AnimalID, A.AnimalName, A.Species, S.StaffName
ORDER BY
    MostRecentVisitDate DESC;

-- Common Table Expression (CTE) for Veterinary Visits
WITH VetVisitInfo AS (
    SELECT
        A.AnimalID,
        A.AnimalName,
        A.Species,
        COUNT(VV.VetVisitID) AS TotalVisits,
        AVG(A.Age) AS AverageAgeDuringVisits,
        MAX(VV.VisitDate) AS MostRecentVisitDate,
        S.StaffName AS MostRecentVisitStaff
    FROM
        Animal A
    JOIN
        VetVisit VV ON A.AnimalID = VV.AnimalID
    JOIN
        Staff S ON VV.StaffID = S.StaffID
    WHERE
        A.AdoptionStatus = 'Adopted'
    GROUP BY
        A.AnimalID, A.AnimalName, A.Species, S.StaffName
)

-- Query using the CTE
SELECT *
FROM VetVisitInfo
ORDER BY MostRecentVisitDate DESC;
