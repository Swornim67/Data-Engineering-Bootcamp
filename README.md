# Data-Engineering-Bootcamp

Data-x Bootcamp by Anurag Srivastava — my structured SQL learning journey, practiced hands-on in MySQL Workbench and Databricks.

## Topics Covered

### Core SQL
- **SELECT** — columns, aliasing, literals, math expressions, concatenation, `DISTINCT`
- **WHERE** — comparisons, `AND`/`OR`/`NOT`, `IN`, `BETWEEN`, `LIKE`, `IS NULL`
- **ORDER BY** — sorting (`ASC`/`DESC`), multi-column sort, sort by position/alias
- **LIMIT & OFFSET** — capping rows, top-N queries, finding the Nth rank
- **Aggregate Functions** — `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`
- **GROUP BY & HAVING** — grouping data and filtering aggregated results
- **Date Functions** — `YEAR()`, `MONTH()`, `DAY()`

### SQL Keys
Keys are what let SQL tables identify records uniquely and connect properly to each other — the foundation everything else (especially joins) builds on. Covered:
- **Primary Key** — uniquely identifies each row; can't be NULL, can't repeat
- **Foreign Key** — links one table to another table's primary key; enforces referential integrity and prevents orphan records
- **Candidate Key** — any column that *could* uniquely identify a row on its own
- **Alternate Key** — a candidate key that wasn't chosen as the primary key
- **Unique Key** — enforces no duplicate values, but allows NULL (unlike primary key); tested both single-column and composite unique constraints
- **Super Key** — any column or combination of columns that uniquely identifies a row, even with unnecessary extra columns
- **Composite Key** — a primary key formed from two or more columns combined
- **Natural Key** — a real-world business identifier (e.g. VIN, citizenship number)
- **Surrogate Key** — a system-generated artificial identifier (e.g. `AUTO_INCREMENT`), with no business meaning
- **Secondary Key** — a column indexed to speed up searching/filtering, not used for uniqueness

All key types were tested hands-on in MySQL Workbench — inserting duplicates, NULLs, and invalid foreign key references to see exactly how each constraint behaves and what errors they throw.

### JOINS
- **INNER JOIN** — multi-table joins, row multiplication, aggregate-then-join pattern, multi-condition joins
- **LEFT JOIN** — missing-record detection (anti-join pattern), `COALESCE`, `WHERE` vs `ON` filtering, multi-table data quality reports with `CASE WHEN`

### Other
`UPDATE`, `DELETE`, `CASE WHEN`, and practical differences between MySQL and Databricks/Spark SQL syntax.

## Repo Structure
- `Select/`, `Where/`, `Order_By/`, `Limit/`, `Group_By/`, `Aggregate_functions/` — practice notebooks by topic
- `KEYS/` — all key type examples and tests
- `JOINS/` — inner join and left join practice sets
- `PDF/` — reference notes from the bootcamp
- `Test/` — stress-test rounds combining multiple concepts
