-- 01 · Schema: 13 tables for animals, adopters, adoptions, health, enrichment, staff and vet care

CREATE TABLE Type(
   TypeID   INTEGER  NOT NULL PRIMARY KEY IDENTITY(1,1)
  ,TypeName VARCHAR(3) NOT NULL
);

CREATE TABLE Breed(
   BreedID   INTEGER  NOT NULL PRIMARY KEY IDENTITY(1,1)
  ,BreedName VARCHAR(16) NOT NULL
  ,TypeID    INTEGER  NOT NULL FOREIGN KEY REFERENCES Type(TypeID)
);

CREATE TABLE Animal(
   AnimalID       INTEGER  NOT NULL PRIMARY KEY IDENTITY(1,1)
  ,AnimalName     VARCHAR(8) NOT NULL
  ,Species        VARCHAR(3) NOT NULL
  ,TypeID         INTEGER  NOT NULL FOREIGN KEY REFERENCES Type(TypeID)
  ,Age            INTEGER  NOT NULL
  ,Gender         VARCHAR(6) NOT NULL
  ,AdoptionStatus VARCHAR(9) NOT NULL
);

CREATE TABLE Adopter(
   AdopterID    INTEGER  NOT NULL PRIMARY KEY IDENTITY(1,1)
  ,FirstName    VARCHAR(255) NOT NULL
  ,LastName     VARCHAR(255) NOT NULL
  ,Address      VARCHAR(255) NOT NULL
  ,Email        VARCHAR(255) NOT NULL
  ,PhoneNumber  VARCHAR(20) NOT NULL
);

CREATE TABLE AdoptionEvent(
   EventID      INTEGER  NOT NULL PRIMARY KEY IDENTITY(1,1)
  ,AnimalID     INTEGER  NOT NULL FOREIGN KEY REFERENCES Animal(AnimalID)
  ,AdopterID    INTEGER  NOT NULL FOREIGN KEY REFERENCES Adopter(AdopterID)
  ,EventDate    DATE  NOT NULL
);

CREATE TABLE AdoptionRecord(
   AdoptionID   INTEGER  NOT NULL PRIMARY KEY IDENTITY(1,1)
  ,AdopterID    INTEGER  NOT NULL FOREIGN KEY REFERENCES Adopter(AdopterID)
  ,AnimalID     INTEGER  NOT NULL FOREIGN KEY REFERENCES Animal(AnimalID)
  ,AdoptionDate DATE  NOT NULL
);

CREATE TABLE AnimalHealthCondition (
   HealthConditionID   INTEGER  NOT NULL PRIMARY KEY IDENTITY(1,1)
  ,AnimalID            INTEGER  NOT NULL FOREIGN KEY REFERENCES Animal(AnimalID)
  ,ConditionDescription VARCHAR(255) NOT NULL
  ,VisitDate           DATE  NOT NULL
  ,Diagnosis           VARCHAR(255) NOT NULL
);

CREATE TABLE Toy (
   ToyID   INTEGER  NOT NULL PRIMARY KEY IDENTITY(1,1)
  ,ToyName VARCHAR(255) NOT NULL
);

CREATE TABLE AnimalToyAssignment (
   AssignmentID   INTEGER  NOT NULL PRIMARY KEY IDENTITY(1,1)
  ,AnimalID       INTEGER  NOT NULL FOREIGN KEY REFERENCES Animal(AnimalID)
  ,ToyID          INTEGER  NOT NULL FOREIGN KEY REFERENCES Toy(ToyID)
);

CREATE TABLE Staff (
   StaffID        INTEGER  NOT NULL PRIMARY KEY IDENTITY(1,1)
  ,StaffName      VARCHAR(255) NOT NULL
  ,Role           VARCHAR(255) NOT NULL
  ,ContactNumber VARCHAR(20) NOT NULL
);

CREATE TABLE VetVisit (
   VetVisitID   INTEGER  NOT NULL PRIMARY KEY IDENTITY(1,1)
  ,AnimalID     INTEGER  NOT NULL FOREIGN KEY REFERENCES Animal(AnimalID)
  ,StaffID      INTEGER  NOT NULL FOREIGN KEY REFERENCES Staff(StaffID)
  ,VisitDate    DATE  NOT NULL
  ,Diagnosis    VARCHAR(255) NOT NULL
);

CREATE TABLE MedicalProcedure (
   MedicalProcedureID          INTEGER  NOT NULL PRIMARY KEY IDENTITY(1,1)
  ,ProcedureDescription VARCHAR(255) NOT NULL
  ,ProcedureName        VARCHAR(255) NOT NULL
);

CREATE TABLE VisitProcedure (
   VisitProcedureID   INTEGER  NOT NULL PRIMARY KEY IDENTITY(1,1)
  ,VetVisitID         INTEGER  NOT NULL FOREIGN KEY REFERENCES VetVisit(VetVisitID)
  ,ProcedureID        INTEGER  NOT NULL FOREIGN KEY REFERENCES MedicalProcedure(MedicalProcedureID)
  ,StaffID            INTEGER  NOT NULL FOREIGN KEY REFERENCES Staff(StaffID)
  ,ProcedureDate      DATE  NOT NULL
  ,TreatmentDescription VARCHAR(255) NOT NULL
);
