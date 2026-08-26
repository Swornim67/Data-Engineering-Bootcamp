# Data-Engineering-Bootcamp

Data-x Bootcamp by Anurag Srivastava — my SQL learning journey, practiced hands-on in MySQL Workbench and Databricks.

## Topics Covered

### Core SQL
- **SELECT** — picking columns, renaming them, doing math, joining text together, removing duplicates
- **WHERE** — filtering rows using conditions like `AND`, `OR`, `IN`, `BETWEEN`, `LIKE`
- **ORDER BY** — sorting results, ascending or descending
- **LIMIT & OFFSET** — showing only a certain number of rows, or skipping ahead to find a specific rank
- **Aggregate Functions** — getting totals, averages, counts, min/max values
- **GROUP BY & HAVING** — grouping data by category and filtering those grouped results
- **Date Functions** — pulling out the year, month, or day from a date

### SQL Keys
Keys are how tables uniquely identify their rows and connect to each other — this is what makes joins actually work. I covered:
- **Primary Key** — uniquely identifies each row; can't be empty, can't repeat
- **Foreign Key** — links one table to another table, and blocks invalid or missing connections
- **Candidate Key** — any column that could work as a unique identifier
- **Alternate Key** — a candidate key that wasn't picked as the primary key
- **Unique Key** — stops duplicate values, but unlike primary key, allows NULL
- **Super Key** — any column or combination that can uniquely identify a row, even with extra unneeded columns
- **Composite Key** — a primary key made from two or more columns together
- **Natural Key** — a real-world ID like a VIN or citizenship number
- **Surrogate Key** — a fake ID number the system generates automatically
- **Secondary Key** — a column indexed to make searching faster

I tested every key type myself in MySQL — trying to insert duplicates, NULLs, and broken references — to actually see how each rule works and what error shows up when it's broken.

### JOINS
- **INNER JOIN** — combining tables, but only keeping rows that match in both. Learned about row multiplication and how to avoid it.
- **LEFT JOIN** — keeping everything from one table even without a match, using `COALESCE` to clean up NULLs, and building simple data quality reports with `CASE WHEN`.

### Other
`UPDATE`, `DELETE`, `CASE WHEN`, and the small but important differences between MySQL and Databricks/Spark SQL.

## Repo Structure
- `Select/`, `Where/`, `Order_By/`, `Limit/`, `Group_By/`, `Aggregate_functions/` — practice files by topic
- `KEYS/` — all key examples and tests
- `JOINS/` — inner join and left join practice
- `PDF/` — reference notes
- `Test/` — practice rounds combining everything
