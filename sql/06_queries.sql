-- 06 · Analytical queries

DECLARE @AvgAge INT;

-- Calculate Average Age
SELECT @AvgAge = AVG(Age)
FROM Animal
WHERE AdoptionStatus = 'Adopted';

-- Query Adoption Statistics
SELECT
    Type.TypeName AS AnimalType,
    COUNT(AdoptionRecord.AdoptionID) AS AdoptionCount,
    @AvgAge AS AverageAdoptedAge
FROM AdoptionRecord
JOIN Animal ON AdoptionRecord.AnimalID = Animal.AnimalID
JOIN Type ON Animal.TypeID = Type.TypeID
GROUP BY Type.TypeName
ORDER BY AdoptionCount DESC;

-- Subquery to Get Most Severe Health Condition
WITH MostSevereCondition AS (
    SELECT
        AnimalID,
        Diagnosis,
        COUNT(*) AS ConditionCount
    FROM AnimalHealthCondition
    GROUP BY AnimalID, Diagnosis
    ORDER BY ConditionCount DESC
    OFFSET 0 ROWS FETCH NEXT 1 ROW ONLY
)

-- Main Query
SELECT
    Animal.AnimalName,
    AnimalHealthCondition.Diagnosis AS MostSevereCondition,
    MostSevereCondition.ConditionCount
FROM Animal
JOIN AnimalHealthCondition ON Animal.AnimalID = AnimalHealthCondition.AnimalID
JOIN MostSevereCondition ON AnimalHealthCondition.AnimalID = MostSevereCondition.AnimalID;


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
