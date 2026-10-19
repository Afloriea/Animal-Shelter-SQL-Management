-- 03 · Stored procedures

GO
CREATE PROCEDURE SendAdoptionNotification
    @AdopterID INT,
    @AnimalID INT,
    @AdoptionDate DATE
AS
BEGIN
    DECLARE @AdopterName VARCHAR(255);
    DECLARE @AnimalName VARCHAR(255);
    DECLARE @Email VARCHAR(255);
    DECLARE @NotificationMessage NVARCHAR(1000);

    -- Retrieve adopter information
    SELECT @AdopterName = CONCAT(FirstName, ' ', LastName), @Email = Email
    FROM Adopter
    WHERE AdopterID = @AdopterID;

    -- Retrieve animal information
    SELECT @AnimalName = AnimalName
    FROM Animal
    WHERE AnimalID = @AnimalID;

    -- Construct notification message
    SET @NotificationMessage = N'Dear ' + @AdopterName + ',
    Congratulations! You have successfully adopted ' + @AnimalName +
    '. The adoption took place on ' + CONVERT(NVARCHAR, @AdoptionDate, 120) + '. Thank you for choosing us!';

    PRINT @NotificationMessage;
END;
GO

DECLARE @AdopterID INT = 1;
DECLARE @AnimalID INT = 2;
DECLARE @AdoptionDate DATE = '2024-01-15';

EXEC SendAdoptionNotification
    @AdopterID = @AdopterID,
    @AnimalID = @AnimalID,
    @AdoptionDate = @AdoptionDate;


GO
CREATE PROCEDURE GetAvailableAnimals
AS
BEGIN
    SELECT
        A.AnimalID,
        A.AnimalName,
        A.Species,
        T.TypeName,
        B.BreedName,
        A.Age,
        A.Gender
    FROM
        Animal A
    INNER JOIN
        Type T ON A.TypeID = T.TypeID
    INNER JOIN
        Breed B ON A.BreedID = B.BreedID
    WHERE
        A.AdoptionStatus = 'Available';
END;
GO

-- Execute the GetAvailableAnimals procedure
EXEC GetAvailableAnimals;
