-- 04 · Triggers (business rules on AdoptionEvent)

GO
-- Business rule: only dogs and cats can be adopted, and an animal can only be adopted once.
-- Set-based so a multi-row INSERT is checked row by row; THROW rolls the insert back.
CREATE TRIGGER CheckAdoptedAnimal
ON AdoptionEvent
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN Animal a ON a.AnimalID = i.AnimalID
        JOIN Type t ON t.TypeID = a.TypeID
        WHERE t.TypeName NOT IN ('Dog', 'Cat')
    )
        THROW 50001, 'Only dogs and cats are available for adoption in this shelter.', 1;

    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN Animal a ON a.AnimalID = i.AnimalID
        WHERE a.AdoptionStatus = 'Adopted'
    )
        THROW 50002, 'This animal has already been adopted.', 1;
END;
GO

-- Mark animals as adopted once their adoption event is recorded
CREATE TRIGGER UpdateAdoptionStatus
ON AdoptionEvent
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Animal
    SET AdoptionStatus = 'Adopted'
    FROM Animal
    INNER JOIN inserted ON Animal.AnimalID = inserted.AnimalID;
END;
GO

-- The eligibility check has to see the status before it is updated
EXEC sp_settriggerorder @triggername = 'CheckAdoptedAnimal', @order = 'First', @stmttype = 'INSERT';
GO

-- Insert a new adoption event to trigger the UpdateAdoptionStatus trigger
INSERT INTO AdoptionEvent(AnimalID, AdopterID, EventDate)
VALUES (3, 1, '2024-03-15');

-- Check the updated AdoptionStatus of the animal
SELECT AnimalID, AdoptionStatus
FROM Animal
WHERE AnimalID = 3;

-- Adopting the same animal again is rejected
BEGIN TRY
    INSERT INTO AdoptionEvent(AnimalID, AdopterID, EventDate)
    VALUES (3, 2, '2024-03-20');
END TRY
BEGIN CATCH
    PRINT CONCAT('Rejected: ', ERROR_MESSAGE());
END CATCH;
