-- 04 · Triggers (business rules on AdoptionEvent)

-- Create a trigger to check if the adopted animal is either a dog or a cat
CREATE TRIGGER CheckAdoptedAnimal
ON AdoptionEvent
AFTER INSERT
AS
BEGIN
    DECLARE @AnimalTypeID INT;

    -- Get the TypeID of the adopted animal
    SELECT @AnimalTypeID = a.TypeID
    FROM Animal a
    INNER JOIN inserted i ON a.AnimalID = i.AnimalID;

    -- Check if the adopted animal is neither a dog nor a cat
    IF @AnimalTypeID NOT IN (SELECT TypeID FROM Type WHERE TypeName IN ('Dog', 'Cat'))
    BEGIN
        -- Rollback the transaction to prevent the adoption
        ROLLBACK;
        
        -- Print an error message
        PRINT 'Error: Only dogs and cats are available for adoption in this shelter.';
    END
END;

-- Create Trigger to Update Animal Adoption Status
CREATE TRIGGER AfterInsertAdoptionEvent
ON AdoptionEvent
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Update Animal Adoption Status
    UPDATE Animal
    SET AdoptionStatus = 'Adopted'
    FROM Animal
    INNER JOIN inserted ON Animal.AnimalID = inserted.AnimalID;
END;


-- Create a trigger that updates the AdoptionStatus when a new adoption event is recorded
CREATE TRIGGER UpdateAdoptionStatus
ON AdoptionEvent
AFTER INSERT
AS
BEGIN
    -- Update the AdoptionStatus of animals involved in the new adoption events
    UPDATE Animal
    SET AdoptionStatus = 'Adopted'
    FROM Animal
    INNER JOIN inserted ON Animal.AnimalID = inserted.AnimalID;
END;

-- Insert a new adoption event to trigger the UpdateAdoptionStatus trigger
INSERT INTO AdoptionEvent(AnimalID, AdopterID, EventDate)
VALUES (3, 1, '2024-03-15');

-- Check the updated AdoptionStatus of the animal
SELECT AnimalID, AdoptionStatus
FROM Animal
WHERE AnimalID = 3;
