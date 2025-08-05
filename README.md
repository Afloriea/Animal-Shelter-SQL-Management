# 🐾 Animal Shelter Management System (SQL Database Project)

## 📌 Repository Name Suggestion
`animal-shelter-sql-management`  
_(Clear, descriptive, and professional for GitHub)_

---

## 📖 Overview
The **Animal Shelter Management System** is a SQL-based database project developed to streamline animal care, adoption tracking, staff management, and veterinary operations. This project was designed to enhance the efficiency, accuracy, and transparency of shelter operations while providing a scalable foundation for future analytics and reporting.

---

## 🎯 Objectives
- Build a **centralized relational database** for animal shelter operations.  
- Automate adoption tracking and improve record management.  
- Store and retrieve veterinary visit details for animals.  
- Enable efficient staff and resource management.  
- Enforce **business rules and relationships** for data integrity.  

---

## 🗂 Database Entities
| Entity                    | Description                                                           |
|---------------------------|-----------------------------------------------------------------------|
| **Animal**                | Stores details about each animal, including breed, age, and status.   |
| **Adopter**               | Records adopter details for responsible tracking.                     |
| **Adoption Record**       | Tracks completed adoptions and related data.                          |
| **Adoption Event**        | Logs adoption events for operational visibility.                      |
| **Animal Breed**          | Stores breed information associated with animals.                     |
| **Animal Health Condition** | Manages medical conditions and diagnoses.                           |
| **Vet Visit**             | Logs veterinary visits and associated staff.                          |
| **Procedure Treatment**   | Records procedures and treatments.                                    |
| **Animal Toy & Assignment** | Tracks animal enrichment through toy assignments.                  |
| **Staff**                 | Records staff details, roles, and contact info.                       |

---

## 🔑 Relationships
- **Adopter → Adoption Record**: One-to-Many  
- **Animal → Adoption Record**: One-to-Many  
- **Animal → Vet Visit**: One-to-Many  
- **Staff → Vet Visit**: One-to-Many  
- **Vet Visit → Procedure Treatment**: One-to-Many  

---

## 🖼 Entity-Relationship Diagram (ERD)
<img width="1449" height="842" alt="截圖 2025-08-05 上午4 46 41" src="https://github.com/user-attachments/assets/53a3aa6d-f7b0-483c-bbb1-d59eda75633a" />

---

## 🛠 Features
### Stored Procedures
- `SendAdoptionNotification`: Automatically generates adoption confirmation notifications.
- `GetAvailableAnimals`: Retrieves a list of animals available for adoption.

### Triggers
- `CheckAdoptedAnimal`: Ensures only eligible animals (e.g., dogs or cats) can be adopted.
- `UpdateAdoptionStatus`: Automatically updates animal adoption status after an event.

### Computed Columns
- `FullName`: Concatenates animal name and species.
- `IsSenior`: Flags animals as "Senior" based on age.

### Complex Queries
- Adoption statistics by species with average age of adopted animals.
- CTE for analyzing veterinary visits and staff assignments.

---

## 💻 Tech Stack
- **Database**: SQL Server  
- **Language**: T-SQL  
- **Tools**:  
  - ERD modeling  
  - Stored procedures  
  - Triggers  
  - CTE queries  

---
