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

-- Vet history for adopted animals: visit count, latest visit and who handled it.
-- The staff member comes from the latest visit itself (ROW_NUMBER), not from grouping by
-- staff, which would split an animal across rows once it sees more than one vet.
WITH VisitHistory AS (
    SELECT
        VV.AnimalID,
        VV.VisitDate,
        VV.Diagnosis,
        S.StaffName,
        COUNT(*) OVER (PARTITION BY VV.AnimalID) AS TotalVisits,
        ROW_NUMBER() OVER (PARTITION BY VV.AnimalID ORDER BY VV.VisitDate DESC) AS rn
    FROM VetVisit VV
    JOIN Staff S ON VV.StaffID = S.StaffID
)
SELECT
    A.AnimalID,
    A.AnimalName,
    A.Species,
    A.Age,
    VH.TotalVisits,
    VH.VisitDate AS MostRecentVisitDate,
    VH.Diagnosis AS MostRecentDiagnosis,
    VH.StaffName AS MostRecentVisitStaff
FROM Animal A
JOIN VisitHistory VH ON VH.AnimalID = A.AnimalID AND VH.rn = 1
WHERE A.AdoptionStatus = 'Adopted'
ORDER BY MostRecentVisitDate DESC;
