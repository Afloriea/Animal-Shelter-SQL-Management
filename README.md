# Animal Shelter Management Database

[![Build database](https://github.com/Afloriea/Animal-Shelter-SQL-Management/actions/workflows/build.yml/badge.svg)](https://github.com/Afloriea/Animal-Shelter-SQL-Management/actions/workflows/build.yml)

A relational database for running an animal shelter on SQL Server: animal profiles, adopters, adoptions, health records, enrichment toys, staff and veterinary care. Business rules are enforced in the database with triggers, common workflows are wrapped in stored procedures, and every push rebuilds the whole database on SQL Server 2022 in GitHub Actions.

**Skills shown:** relational modelling · T-SQL · stored procedures · triggers · computed columns · CTEs and window functions · CI for database scripts

---

## 🎯 Problem

Shelter data tends to live in spreadsheets: which animals are available, who adopted whom, which vet saw which animal and what was done. Records drift out of sync and simple questions take manual work. This project puts that data in one schema with the rules built in, so an animal can't be adopted twice and adoption status updates itself.

---

## 🗂 Data model

13 tables in five areas:

| Area | Tables |
|---|---|
| **Animals** | `Animal`, `Type`, `Breed` |
| **Adoption** | `Adopter`, `AdoptionEvent`, `AdoptionRecord` |
| **Health** | `AnimalHealthCondition`, `VetVisit`, `MedicalProcedure`, `VisitProcedure` |
| **Staff** | `Staff` |
| **Enrichment** | `Toy`, `AnimalToyAssignment` |

```mermaid
erDiagram
    Type ||--o{ Breed : has
    Type ||--o{ Animal : classifies
    Breed ||--o{ Animal : "breed of"
    Animal ||--o{ AdoptionEvent : ""
    Adopter ||--o{ AdoptionEvent : ""
    Animal ||--o{ AdoptionRecord : ""
    Adopter ||--o{ AdoptionRecord : ""
    Animal ||--o{ AnimalHealthCondition : ""
    Animal ||--o{ VetVisit : ""
    Staff ||--o{ VetVisit : performs
    VetVisit ||--o{ VisitProcedure : includes
    MedicalProcedure ||--o{ VisitProcedure : ""
    Staff ||--o{ VisitProcedure : performs
    Animal ||--o{ AnimalToyAssignment : ""
    Toy ||--o{ AnimalToyAssignment : ""
```

The original ERD from the project is in [`docs/erd.png`](docs/erd.png). It predates `Animal.BreedID`, which was added later (see [Fixes after review](#-fixes-after-review)).

---

## 🛠 Database objects

### Stored procedures
- **`SendAdoptionNotification`** builds the confirmation message for an adoption from the adopter's and animal's records.
- **`GetAvailableAnimals`** lists every animal that is available for adoption, with its type and breed.

### Triggers on `AdoptionEvent`
- **`CheckAdoptedAnimal`** rejects an adoption if the animal isn't a dog or cat, or has already been adopted. It is set-based, so multi-row inserts are checked row by row. It is set to fire first so it sees the status before it changes.
- **`UpdateAdoptionStatus`** marks the animal as `Adopted` once the event is recorded.

### Computed columns on `Animal`
- **`FullName`**, for example "Whiskers the Cat".
- **`IsSenior`**: `Yes` when the animal is 8 or older.

### Analytical queries
- Adoption count and average age by animal type
- Latest health condition for each animal (`ROW_NUMBER`)
- Vet history for adopted animals: visit count, latest visit, latest diagnosis and staff member (CTE + window functions)

---

## 📊 Sample output

These results come from the CI run on SQL Server 2022 against the sample data.

**Available animals** (`EXEC GetAvailableAnimals`)

| AnimalID | Name | Type | Breed | Age | Gender |
|---|---|---|---|---|---|
| 1 | Whiskers | Cat | Siamese | 2 | Female |
| 3 | Mittens | Cat | Persian | 1 | Male |
| 4 | Luna | Dog | Golden Retriever | 2 | Female |
| 6 | Max | Dog | German Shepherd | 1 | Male |
| … | | | | | |

10 rows in total.

**Business rule in action**

```
INSERT INTO AdoptionEvent(AnimalID, AdopterID, EventDate) VALUES (3, 2, '2024-03-20');
Rejected: This animal has already been adopted.
```

**Adoptions by type**

| AnimalType | AdoptionCount | AverageAdoptedAge |
|---|---|---|
| Cat | 8 | 2.3 |
| Dog | 7 | 3.1 |

**Vet history of adopted animals** (top 3)

| Animal | Age | Visits | Latest visit | Diagnosis | Staff |
|---|---|---|---|---|---|
| Rocky (Dog) | 4 | 1 | 2024-10-12 | Dental Surgery | Dr. Harris |
| Milo (Cat) | 2 | 1 | 2024-06-15 | Gastric Ulcer | Nurse Moore |
| Bella (Cat) | 3 | 1 | 2024-03-12 | Skin Allergy | Dr. Taylor |

---

## 🔧 Fixes after review

Running the original script on a clean SQL Server instance in CI surfaced several problems, each fixed in its own pull request:

| Problem | Effect | Fix |
|---|---|---|
| No `GO` between procedures and triggers | Script stopped with Msg 134 and could not run end to end | Batch separators |
| `Animal` had no breed, so the procedure joined `Breed` on `TypeID` | Each available animal was listed 5 times (50 rows for 10 animals) | `Animal.BreedID` foreign key |
| `Type` seeded Cat/Dog five times | Duplicate lookup rows | Two rows plus `UNIQUE` |
| Trigger read one row into a variable, and a second trigger duplicated the first | Multi-row inserts only partly checked; repeat adoptions allowed | Set-based check with `THROW`, duplicate removed |
| Overall average age stored in an `INT` | Both types showed the same, truncated value (2) | Per-type `AVG` as a decimal |
| "Most severe condition" kept one row overall | Returned a single animal | Latest condition per animal with `ROW_NUMBER` |

---

## ▶️ Run it

```bash
sqlcmd -S <server> -Q "CREATE DATABASE AnimalShelter"
for f in sql/*.sql; do sqlcmd -S <server> -d AnimalShelter -b -i "$f"; done
```

The scripts run in numeric order: `01_schema` → `02_seed_data` → `03_procedures` → `04_triggers` → `05_computed_columns` → `06_queries`. The [workflow](.github/workflows/build.yml) does the same in a SQL Server 2022 container.

## 🧭 Limitations

- `AdoptionEvent` and `AdoptionRecord` overlap. In the sample data they don't always agree with each other or with `Animal.AdoptionStatus`. Merging them into one table, with the status derived from it, is the next step.
- `SendAdoptionNotification` only prints the message. A real shelter would queue an email.
- The sample data is small and synthetic: 15 animals, 15 adopters, 15 staff.

## 💻 Tech stack

SQL Server 2022 · T-SQL · GitHub Actions · Mermaid
