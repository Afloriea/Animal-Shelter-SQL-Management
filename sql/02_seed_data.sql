-- 02 · Sample data

-- Type
INSERT INTO Type(TypeName) VALUES ('Cat');
INSERT INTO Type(TypeName) VALUES ('Dog');
INSERT INTO Type(TypeName) VALUES ('Cat');
INSERT INTO Type(TypeName) VALUES ('Dog');
INSERT INTO Type(TypeName) VALUES ('Cat');

-- Breed
INSERT INTO Breed(BreedName, TypeID) VALUES ('Siamese', 1);
INSERT INTO Breed(BreedName, TypeID) VALUES ('Labrador', 2);
INSERT INTO Breed(BreedName, TypeID) VALUES ('Persian', 1);
INSERT INTO Breed(BreedName, TypeID) VALUES ('Golden Retriever', 2);
INSERT INTO Breed(BreedName, TypeID) VALUES ('Maine Coon', 1);
INSERT INTO Breed(BreedName, TypeID) VALUES ('Bengal', 1);
INSERT INTO Breed(BreedName, TypeID) VALUES ('German Shepherd', 2);
INSERT INTO Breed(BreedName, TypeID) VALUES ('Ragdoll', 1);
INSERT INTO Breed(BreedName, TypeID) VALUES ('Beagle', 2);
INSERT INTO Breed(BreedName, TypeID) VALUES ('Siberian Husky', 2);

-- Animal
INSERT INTO Animal(AnimalName, Species, TypeID, Age, Gender, AdoptionStatus) VALUES ('Whiskers', 'Cat', 1, 2, 'Female', 'Available');
INSERT INTO Animal(AnimalName, Species, TypeID, Age, Gender, AdoptionStatus) VALUES ('Buddy', 'Dog', 2, 3, 'Male', 'Adopted');
INSERT INTO Animal(AnimalName, Species, TypeID, Age, Gender, AdoptionStatus) VALUES ('Mittens', 'Cat', 1, 1, 'Male', 'Available');
INSERT INTO Animal(AnimalName, Species, TypeID, Age, Gender, AdoptionStatus) VALUES ('Luna', 'Dog', 2, 2, 'Female', 'Available');
INSERT INTO Animal(AnimalName, Species, TypeID, Age, Gender, AdoptionStatus) VALUES ('Oscar', 'Cat', 1, 4, 'Male', 'Adopted');
INSERT INTO Animal(AnimalName, Species, TypeID, Age, Gender, AdoptionStatus) VALUES ('Max', 'Dog', 2, 1, 'Male', 'Available');
INSERT INTO Animal(AnimalName, Species, TypeID, Age, Gender, AdoptionStatus) VALUES ('Bella', 'Cat', 1, 3, 'Female', 'Adopted');
INSERT INTO Animal(AnimalName, Species, TypeID, Age, Gender, AdoptionStatus) VALUES ('Charlie', 'Dog', 2, 5, 'Male', 'Available');
INSERT INTO Animal(AnimalName, Species, TypeID, Age, Gender, AdoptionStatus) VALUES ('Sophie', 'Cat', 1, 2, 'Female', 'Available');
INSERT INTO Animal(AnimalName, Species, TypeID, Age, Gender, AdoptionStatus) VALUES ('Rocky', 'Dog', 2, 4, 'Male', 'Adopted');
INSERT INTO Animal(AnimalName, Species, TypeID, Age, Gender, AdoptionStatus) VALUES ('Cleo', 'Cat', 1, 1, 'Female', 'Available');
INSERT INTO Animal(AnimalName, Species, TypeID, Age, Gender, AdoptionStatus) VALUES ('Teddy', 'Dog', 2, 3, 'Male', 'Available');
INSERT INTO Animal(AnimalName, Species, TypeID, Age, Gender, AdoptionStatus) VALUES ('Milo', 'Cat', 1, 2, 'Male', 'Adopted');
INSERT INTO Animal(AnimalName, Species, TypeID, Age, Gender, AdoptionStatus) VALUES ('Lucy', 'Dog', 2, 4, 'Female', 'Available');
INSERT INTO Animal(AnimalName, Species, TypeID, Age, Gender, AdoptionStatus) VALUES ('Simba', 'Cat', 1, 3, 'Male', 'Available');

-- Adopter
INSERT INTO Adopter(FirstName,LastName,Address,Email,PhoneNumber) VALUES ('John','Doe','123 Main St','john.doe@example.com','555-1234');
INSERT INTO Adopter(FirstName,LastName,Address,Email,PhoneNumber) VALUES ('Jane','Smith','456 Oak St','jane.smith@example.com','555-5678');
INSERT INTO Adopter(FirstName,LastName,Address,Email,PhoneNumber) VALUES ('Robert','Johnson','789 Maple St','robert.johnson@example.com','555-9876');
INSERT INTO Adopter(FirstName,LastName,Address,Email,PhoneNumber) VALUES ('Emily','Williams','321 Pine St','emily.williams@example.com','555-4321');
INSERT INTO Adopter(FirstName,LastName,Address,Email,PhoneNumber) VALUES ('David','Anderson','654 Birch St','david.anderson@example.com','555-8765');
INSERT INTO Adopter(FirstName,LastName,Address,Email,PhoneNumber) VALUES ('Sophia','Miller','876 Cedar St','sophia.miller@example.com','555-1111');
INSERT INTO Adopter(FirstName,LastName,Address,Email,PhoneNumber) VALUES ('Michael','Brown','987 Elm St','michael.brown@example.com','555-2222');
INSERT INTO Adopter(FirstName,LastName,Address,Email,PhoneNumber) VALUES ('Olivia','Jones','234 Walnut St','olivia.jones@example.com','555-3333');
INSERT INTO Adopter(FirstName,LastName,Address,Email,PhoneNumber) VALUES ('William','White','567 Sycamore St','william.white@example.com','555-4444');
INSERT INTO Adopter(FirstName,LastName,Address,Email,PhoneNumber) VALUES ('Ava','Davis','890 Pineapple St','ava.davis@example.com','555-5555');
INSERT INTO Adopter(FirstName,LastName,Address,Email,PhoneNumber) VALUES ('Liam','Martin','432 Banana St','liam.martin@example.com','555-6666');
INSERT INTO Adopter(FirstName,LastName,Address,Email,PhoneNumber) VALUES ('Emma','Taylor','765 Orange St','emma.taylor@example.com','555-7777');
INSERT INTO Adopter(FirstName,LastName,Address,Email,PhoneNumber) VALUES ('Noah','Moore','123 Grape St','noah.moore@example.com','555-8888');
INSERT INTO Adopter(FirstName,LastName,Address,Email,PhoneNumber) VALUES ('Isabella','Allen','456 Cherry St','isabella.allen@example.com','555-9999');
INSERT INTO Adopter(FirstName,LastName,Address,Email,PhoneNumber) VALUES ('James','Hall','789 Blueberry St','james.hall@example.com','555-0000');

-- AdoptionEvent
INSERT INTO AdoptionEvent(AnimalID, AdopterID, EventDate) VALUES (2, 1, '2024-01-15');
INSERT INTO AdoptionEvent(AnimalID, AdopterID, EventDate) VALUES (4, 2, '2024-02-01');
INSERT INTO AdoptionEvent(AnimalID, AdopterID, EventDate) VALUES (1, 3, '2024-02-10');
INSERT INTO AdoptionEvent(AnimalID, AdopterID, EventDate) VALUES (5, 4, '2024-01-20');
INSERT INTO AdoptionEvent(AnimalID, AdopterID, EventDate) VALUES (3, 5, '2024-02-05');
INSERT INTO AdoptionEvent(AnimalID, AdopterID, EventDate) VALUES (7, 6, '2024-03-12');
INSERT INTO AdoptionEvent(AnimalID, AdopterID, EventDate) VALUES (9, 7, '2024-04-03');
INSERT INTO AdoptionEvent(AnimalID, AdopterID, EventDate) VALUES (8, 8, '2024-04-20');
INSERT INTO AdoptionEvent(AnimalID, AdopterID, EventDate) VALUES (11, 9, '2024-05-05');
INSERT INTO AdoptionEvent(AnimalID, AdopterID, EventDate) VALUES (13, 10, '2024-06-15');
INSERT INTO AdoptionEvent(AnimalID, AdopterID, EventDate) VALUES (10, 11, '2024-07-02');
INSERT INTO AdoptionEvent(AnimalID, AdopterID, EventDate) VALUES (12, 12, '2024-08-10');
INSERT INTO AdoptionEvent(AnimalID, AdopterID, EventDate) VALUES (15, 13, '2024-09-01');
INSERT INTO AdoptionEvent(AnimalID, AdopterID, EventDate) VALUES (14, 14, '2024-10-12');
INSERT INTO AdoptionEvent(AnimalID, AdopterID, EventDate) VALUES (6, 15, '2024-11-25');

-- AdoptionRecord
INSERT INTO AdoptionRecord(AdopterID, AnimalID, AdoptionDate) VALUES (3, 2, '2024-01-15');
INSERT INTO AdoptionRecord(AdopterID, AnimalID, AdoptionDate) VALUES (1, 4, '2024-02-01');
INSERT INTO AdoptionRecord(AdopterID, AnimalID, AdoptionDate) VALUES (5, 1, '2024-02-10');
INSERT INTO AdoptionRecord(AdopterID, AnimalID, AdoptionDate) VALUES (4, 5, '2024-01-20');
INSERT INTO AdoptionRecord(AdopterID, AnimalID, AdoptionDate) VALUES (2, 3, '2024-02-05');
INSERT INTO AdoptionRecord(AdopterID, AnimalID, AdoptionDate) VALUES (7, 6, '2024-03-12');
INSERT INTO AdoptionRecord(AdopterID, AnimalID, AdoptionDate) VALUES (9, 8, '2024-04-03');
INSERT INTO AdoptionRecord(AdopterID, AnimalID, AdoptionDate) VALUES (11, 7, '2024-05-05');
INSERT INTO AdoptionRecord(AdopterID, AnimalID, AdoptionDate) VALUES (13, 15, '2024-06-15');
INSERT INTO AdoptionRecord(AdopterID, AnimalID, AdoptionDate) VALUES (15, 9, '2024-07-02');
INSERT INTO AdoptionRecord(AdopterID, AnimalID, AdoptionDate) VALUES (14, 10, '2024-08-10');
INSERT INTO AdoptionRecord(AdopterID, AnimalID, AdoptionDate) VALUES (12, 11, '2024-09-01');
INSERT INTO AdoptionRecord(AdopterID, AnimalID, AdoptionDate) VALUES (10, 12, '2024-10-12');
INSERT INTO AdoptionRecord(AdopterID, AnimalID, AdoptionDate) VALUES (8, 13, '2024-11-25');
INSERT INTO AdoptionRecord(AdopterID, AnimalID, AdoptionDate) VALUES (6, 14, '2024-12-31');

-- AnimalHealthCondition
INSERT INTO AnimalHealthCondition(AnimalID, ConditionDescription, VisitDate, Diagnosis) VALUES (2, 'Minor injury', '2024-01-15', 'Bruise');
INSERT INTO AnimalHealthCondition(AnimalID, ConditionDescription, VisitDate, Diagnosis) VALUES (4, 'Upset stomach', '2024-02-01', 'Gastroenteritis');
INSERT INTO AnimalHealthCondition(AnimalID, ConditionDescription, VisitDate, Diagnosis) VALUES (1, 'Respiratory issues', '2024-02-10', 'Cough');
INSERT INTO AnimalHealthCondition(AnimalID, ConditionDescription, VisitDate, Diagnosis) VALUES (5, 'Skin infection', '2024-01-20', 'Dermatitis');
INSERT INTO AnimalHealthCondition(AnimalID, ConditionDescription, VisitDate, Diagnosis) VALUES (3, 'Dental problem', '2024-02-05', 'Tooth decay');
INSERT INTO AnimalHealthCondition(AnimalID, ConditionDescription, VisitDate, Diagnosis) VALUES (7, 'Eye infection', '2024-03-12', 'Conjunctivitis');
INSERT INTO AnimalHealthCondition(AnimalID, ConditionDescription, VisitDate, Diagnosis) VALUES (9, 'Joint pain', '2024-04-03', 'Arthritis');
INSERT INTO AnimalHealthCondition(AnimalID, ConditionDescription, VisitDate, Diagnosis) VALUES (11, 'Allergies', '2024-05-05', 'Itchy skin');
INSERT INTO AnimalHealthCondition(AnimalID, ConditionDescription, VisitDate, Diagnosis) VALUES (13, 'Urinary tract infection', '2024-06-15', 'UTI');
INSERT INTO AnimalHealthCondition(AnimalID, ConditionDescription, VisitDate, Diagnosis) VALUES (15, 'Obesity', '2024-07-02', 'Weight management');

-- Toy
INSERT INTO Toy(ToyName) VALUES ('Ball');
INSERT INTO Toy(ToyName) VALUES ('Chew Toy');
INSERT INTO Toy(ToyName) VALUES ('Feather Wand');
INSERT INTO Toy(ToyName) VALUES ('Squeaky Toy');
INSERT INTO Toy(ToyName) VALUES ('Scratching Post');
INSERT INTO Toy(ToyName) VALUES ('Mouse Toy');
INSERT INTO Toy(ToyName) VALUES ('Tug-of-War Rope');
INSERT INTO Toy(ToyName) VALUES ('Catnip Pillow');
INSERT INTO Toy(ToyName) VALUES ('Interactive Puzzle');
INSERT INTO Toy(ToyName) VALUES ('Rubber Bone');
INSERT INTO Toy(ToyName) VALUES ('Frisbee');
INSERT INTO Toy(ToyName) VALUES ('Kong');
INSERT INTO Toy(ToyName) VALUES ('Plush Mouse');
INSERT INTO Toy(ToyName) VALUES ('Tennis Ball');
INSERT INTO Toy(ToyName) VALUES ('Rope Ball');

-- AnimalToyAssignment
INSERT INTO AnimalToyAssignment(AnimalID, ToyID) VALUES (2, 1);
INSERT INTO AnimalToyAssignment(AnimalID, ToyID) VALUES (4, 5);
INSERT INTO AnimalToyAssignment(AnimalID, ToyID) VALUES (1, 2);
INSERT INTO AnimalToyAssignment(AnimalID, ToyID) VALUES (5, 3);
INSERT INTO AnimalToyAssignment(AnimalID, ToyID) VALUES (3, 4);
INSERT INTO AnimalToyAssignment(AnimalID, ToyID) VALUES (7, 6);
INSERT INTO AnimalToyAssignment(AnimalID, ToyID) VALUES (9, 7);
INSERT INTO AnimalToyAssignment(AnimalID, ToyID) VALUES (11, 8);
INSERT INTO AnimalToyAssignment(AnimalID, ToyID) VALUES (13, 9);
INSERT INTO AnimalToyAssignment(AnimalID, ToyID) VALUES (15, 10);
INSERT INTO AnimalToyAssignment(AnimalID, ToyID) VALUES (6, 11);
INSERT INTO AnimalToyAssignment(AnimalID, ToyID) VALUES (8, 12);
INSERT INTO AnimalToyAssignment(AnimalID, ToyID) VALUES (10, 13);
INSERT INTO AnimalToyAssignment(AnimalID, ToyID) VALUES (12, 15);
INSERT INTO AnimalToyAssignment(AnimalID, ToyID) VALUES (14, 14);

-- Staff
INSERT INTO Staff(StaffName, Role, ContactNumber) VALUES ('Dr. Smith', 'Veterinarian', '555-1234');
INSERT INTO Staff(StaffName, Role, ContactNumber) VALUES ('Nurse Johnson', 'Veterinary Nurse', '555-5678');
INSERT INTO Staff(StaffName, Role, ContactNumber) VALUES ('Dr. Williams', 'Veterinarian', '555-9876');
INSERT INTO Staff(StaffName, Role, ContactNumber) VALUES ('Dr. Anderson', 'Veterinarian', '555-4321');
INSERT INTO Staff(StaffName, Role, ContactNumber) VALUES ('Nurse Davis', 'Veterinary Nurse', '555-8765');
INSERT INTO Staff(StaffName, Role, ContactNumber) VALUES ('Dr. Taylor', 'Veterinarian', '555-1111');
INSERT INTO Staff(StaffName, Role, ContactNumber) VALUES ('Nurse Martin', 'Veterinary Nurse', '555-2222');
INSERT INTO Staff(StaffName, Role, ContactNumber) VALUES ('Dr. Brown', 'Veterinarian', '555-3333');
INSERT INTO Staff(StaffName, Role, ContactNumber) VALUES ('Dr. Miller', 'Veterinarian', '555-4444');
INSERT INTO Staff(StaffName, Role, ContactNumber) VALUES ('Nurse White', 'Veterinary Nurse', '555-5555');
INSERT INTO Staff(StaffName, Role, ContactNumber) VALUES ('Dr. Harris', 'Veterinarian', '555-6666');
INSERT INTO Staff(StaffName, Role, ContactNumber) VALUES ('Nurse Moore', 'Veterinary Nurse', '555-7777');
INSERT INTO Staff(StaffName, Role, ContactNumber) VALUES ('Dr. Allen', 'Veterinarian', '555-8888');
INSERT INTO Staff(StaffName, Role, ContactNumber) VALUES ('Nurse Hall', 'Veterinary Nurse', '555-9999');
INSERT INTO Staff(StaffName, Role, ContactNumber) VALUES ('Dr. Thomas', 'Veterinarian', '555-0000');

-- VetVisit
INSERT INTO VetVisit(AnimalID, StaffID, VisitDate, Diagnosis) VALUES (2, 5, '2024-01-15', 'Routine Checkup');
INSERT INTO VetVisit(AnimalID, StaffID, VisitDate, Diagnosis) VALUES (4, 4, '2024-02-01', 'Digestive Issues');
INSERT INTO VetVisit(AnimalID, StaffID, VisitDate, Diagnosis) VALUES (1, 3, '2024-02-10', 'Respiratory Infection');
INSERT INTO VetVisit(AnimalID, StaffID, VisitDate, Diagnosis) VALUES (5, 2, '2024-01-20', 'Orthopedic Concerns');
INSERT INTO VetVisit(AnimalID, StaffID, VisitDate, Diagnosis) VALUES (3, 1, '2024-02-05', 'Dental Issues');
INSERT INTO VetVisit(AnimalID, StaffID, VisitDate, Diagnosis) VALUES (7, 6, '2024-03-12', 'Skin Allergy');
INSERT INTO VetVisit(AnimalID, StaffID, VisitDate, Diagnosis) VALUES (9, 8, '2024-04-03', 'Ear Infection');
INSERT INTO VetVisit(AnimalID, StaffID, VisitDate, Diagnosis) VALUES (11, 10, '2024-05-05', 'Eye Inflammation');
INSERT INTO VetVisit(AnimalID, StaffID, VisitDate, Diagnosis) VALUES (13, 12, '2024-06-15', 'Gastric Ulcer');
INSERT INTO VetVisit(AnimalID, StaffID, VisitDate, Diagnosis) VALUES (15, 14, '2024-07-02', 'Allergic Dermatitis');
INSERT INTO VetVisit(AnimalID, StaffID, VisitDate, Diagnosis) VALUES (6, 7, '2024-08-10', 'Broken Limb');
INSERT INTO VetVisit(AnimalID, StaffID, VisitDate, Diagnosis) VALUES (8, 9, '2024-09-01', 'Urinary Tract Infection');
INSERT INTO VetVisit(AnimalID, StaffID, VisitDate, Diagnosis) VALUES (10, 11, '2024-10-12', 'Dental Surgery');
INSERT INTO VetVisit(AnimalID, StaffID, VisitDate, Diagnosis) VALUES (12, 13, '2024-11-25', 'Arthritis');
INSERT INTO VetVisit(AnimalID, StaffID, VisitDate, Diagnosis) VALUES (14, 15, '2024-12-31', 'Heartworm Disease');

-- MedicalProcedure
INSERT INTO MedicalProcedure(ProcedureDescription, ProcedureName) VALUES ('Routine checkup', 'Checkup');
INSERT INTO MedicalProcedure(ProcedureDescription, ProcedureName) VALUES ('Dental cleaning', 'Dental Cleaning');
INSERT INTO MedicalProcedure(ProcedureDescription, ProcedureName) VALUES ('X-ray examination', 'X-ray');
INSERT INTO MedicalProcedure(ProcedureDescription, ProcedureName) VALUES ('Spaying/Neutering', 'Spay/Neuter');
INSERT INTO MedicalProcedure(ProcedureDescription, ProcedureName) VALUES ('Wound dressing', 'Dressing');
INSERT INTO MedicalProcedure(ProcedureDescription, ProcedureName) VALUES ('Blood test', 'Blood Test');
INSERT INTO MedicalProcedure(ProcedureDescription, ProcedureName) VALUES ('Joint aspiration', 'Joint Aspiration');
INSERT INTO MedicalProcedure(ProcedureDescription, ProcedureName) VALUES ('Eye examination', 'Eye Exam');
INSERT INTO MedicalProcedure(ProcedureDescription, ProcedureName) VALUES ('Ultrasound', 'Ultrasound');
INSERT INTO MedicalProcedure(ProcedureDescription, ProcedureName) VALUES ('Dietary consultation', 'Diet Consultation');
INSERT INTO MedicalProcedure(ProcedureDescription, ProcedureName) VALUES ('Deworming', 'Deworming');
INSERT INTO MedicalProcedure(ProcedureDescription, ProcedureName) VALUES ('Tooth extraction', 'Tooth Extraction');
INSERT INTO MedicalProcedure(ProcedureDescription, ProcedureName) VALUES ('MRI scan', 'MRI Scan');
INSERT INTO MedicalProcedure(ProcedureDescription, ProcedureName) VALUES ('Neuter surgery', 'Neuter Surgery');
INSERT INTO MedicalProcedure(ProcedureDescription, ProcedureName) VALUES ('Heartworm treatment', 'Heartworm Treatment');

-- VisitProcedure
INSERT INTO VisitProcedure(VetVisitID, ProcedureID, StaffID, ProcedureDate, TreatmentDescription) VALUES (1, 1, 5, '2024-01-15', 'Administered Vaccination');
INSERT INTO VisitProcedure(VetVisitID, ProcedureID, StaffID, ProcedureDate, TreatmentDescription) VALUES (2, 2, 4, '2024-02-01', 'Dental Cleaning');
INSERT INTO VisitProcedure(VetVisitID, ProcedureID, StaffID, ProcedureDate, TreatmentDescription) VALUES (3, 3, 3, '2024-02-10', 'X-ray Examination');
INSERT INTO VisitProcedure(VetVisitID, ProcedureID, StaffID, ProcedureDate, TreatmentDescription) VALUES (4, 4, 2, '2024-01-20', 'Spaying/Neutering');
INSERT INTO VisitProcedure(VetVisitID, ProcedureID, StaffID, ProcedureDate, TreatmentDescription) VALUES (5, 5, 1, '2024-02-05', 'Wound Dressing');
INSERT INTO VisitProcedure(VetVisitID, ProcedureID, StaffID, ProcedureDate, TreatmentDescription) VALUES (7, 6, 6, '2024-03-12', 'Blood Test');
INSERT INTO VisitProcedure(VetVisitID, ProcedureID, StaffID, ProcedureDate, TreatmentDescription) VALUES (9, 8, 7, '2024-04-03', 'Joint Aspiration');
INSERT INTO VisitProcedure(VetVisitID, ProcedureID, StaffID, ProcedureDate, TreatmentDescription) VALUES (11, 10, 8, '2024-05-05', 'Eye Examination');
INSERT INTO VisitProcedure(VetVisitID, ProcedureID, StaffID, ProcedureDate, TreatmentDescription) VALUES (13, 12, 15, '2024-05-07', 'Grooming');
INSERT INTO VisitProcedure(VetVisitID, ProcedureID, StaffID, ProcedureDate, TreatmentDescription) VALUES (15, 14, 13, '2024-06-08', 'Dietary Consultation');
INSERT INTO VisitProcedure(VetVisitID, ProcedureID, StaffID, ProcedureDate, TreatmentDescription) VALUES (6, 11, 14, '2024-08-10', 'Administered Deworming');
INSERT INTO VisitProcedure(VetVisitID, ProcedureID, StaffID, ProcedureDate, TreatmentDescription) VALUES (8, 13, 12, '2024-09-01', 'Tooth Extraction');
INSERT INTO VisitProcedure(VetVisitID, ProcedureID, StaffID, ProcedureDate, TreatmentDescription) VALUES (10, 15, 11, '2024-10-12', 'MRI Scan');
INSERT INTO VisitProcedure(VetVisitID, ProcedureID, StaffID, ProcedureDate, TreatmentDescription) VALUES (12, 9, 10, '2024-11-25', 'Neuter Surgery');
INSERT INTO VisitProcedure(VetVisitID, ProcedureID, StaffID, ProcedureDate, TreatmentDescription) VALUES (14, 7, 9, '2024-12-31', 'Heartworm Treatment');
