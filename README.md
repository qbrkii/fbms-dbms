# FBMS — Database Design & Implementation

**Course:** Database Management Systems  
**Author:** Amina Kaiyrbek  
**University:** San Francisco Bay University  
**Completion:** COURSE_TERM_OR_DATE

## Project overview
This repository contains the database design and implementation for the **FBMS** project (DBMS course). It includes the relational schema, example queries, and an ER diagram illustrating the data model.

> Replace this description with one sentence about what FBMS stands for and the real-world domain it models (e.g., "Food & Beverage Management System", "Film Booking Management System", etc.).

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

## How to use
1. Create a new database (PostgreSQL example):
   ```bash
   createdb fbms_db
   psql -d fbms_db -f schema.sql
   psql -d fbms_db -f sample_data.sql   # optional
