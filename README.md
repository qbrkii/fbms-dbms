# food-bank-management-system-sql — Database Design & Implementation

**Course:** Database Management Systems  
**Author:** Amina Kaiyrbek  
**University:** San Francisco Bay University  

## Project overview
This repository contains the database design and implementation for the **food-bank-management-system-sql** project (DBMS course). It includes the relational schema, example queries, and an ER diagram illustrating the data model.

FBMS (Food Bank Management System) is a relational database designed to help food banks track donations, manage inventory, and coordinate food distribution to communities in need.

The system models key entities such as donors, food items, distribution centers, and transactions, enabling efficient tracking of food supply and allocation.

## Key Features

• Designed normalized relational schema (3NF) for managing food donations and distribution
• Implemented SQL queries for tracking inventory and donation flows
• Built relationships between donors, food banks, and distribution records
• Developed complex queries for reporting and operational insights

## Contents
- `schema.sql` — DDL: `CREATE TABLE` statements and constraints.
- `sample_data.sql` — Optional: example `INSERT` statements to populate the database.
- `queries/example_queries.sql` — Example SELECT/UPDATE queries used in testing.
- `ER-diagram.png` — Visual entity-relationship diagram of the schema.
- `docs/design-notes.md` — Notes on design decisions, normalization steps, and assumptions.

## Technologies
- PostgreSQL / MySQL (specify which you used)
- SQL (DDL & DML)
- Optional: tools used to draw ER diagram (draw.io, dbdiagram.io, Lucidchart, etc.)

## Example queries
SELECT donor_name, SUM(quantity) AS total_donations
FROM donations
GROUP BY donor_name
ORDER BY total_donations DESC;

   
## Skills Demonstrated

• Database design and normalization
• SQL query development
• Relational schema modeling
• Data management and analysis
