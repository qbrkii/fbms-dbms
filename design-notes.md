# Design Notes

**Project:** FBMS — Food Bank Management System (DBMS course)

## Goals & Scope
- Model donors (individuals, organizations, government), donations, inventory, members/families, parcel preparation, distribution, and staff/volunteers.
- Provide reporting queries for routine operations and non-routine analytics.
- Demonstrate normalization (BCNF where applicable) and referential integrity via foreign keys.

## Key design decisions
- Surrogate integer primary keys are used throughout (INT). In production, consider AUTO_INCREMENT / SERIAL for convenience.
- Subtype tables (INDIVIDUAL_DONOR, ORGANIZATION_DONOR, GOVERNMENT_DONOR) ensure donor-type classification while preserving donor-level attributes in DONOR.
- MEMBER links PERSON to membership plans to track subscriptions and eligibility windows.
- PARCEL and PARCEL_ITEM model prepared packages and their item assignments, enabling inventory adjustments via triggers.
- INVENTORY references DONATION to track source and expiry dates for quality control.

## Triggers & Automation
- `trg_decrease_inventory` (AFTER INSERT on PARCEL_ITEM) deducts assigned quantities from INVENTORY.Quantity_Available.
- `trg_block_low_inventory` (BEFORE INSERT on PARCEL_ITEM) prevents assignment when insufficient stock exists (raises an error).
- `trg_auto_dispose_expired` (AFTER UPDATE on INVENTORY) inserts into DISPOSAL_LOG when an item's expiry passes (demo automation).

## Assumptions & Notes
- Date values in inserts are sample/demo dates; adjust to real timelines as needed.
- Triggers and SIGNAL usage are MySQL-specific; syntax may need adjusting for other DBMS (PostgreSQL uses different exception handling).
- Some IDs in sample data are dense and manually assigned for classroom clarity; migrating to AUTO_INCREMENT improves usability.
- For demo purposes, disposal triggers use fixed employee IDs for 'disposed by' and 'approved by' — replace with appropriate logic in production.

## Next steps / Improvements
- Add constraints for NOT NULL where business rules require mandatory fields (e.g., Donation_Date, Item_Name).
- Add indexes on commonly queried columns (e.g., INVENTORY.Expiry_Date, PARCEL.Creation_Date).
- Implement stored procedures for common workflows (create_parcel, allocate_items).
- Add test scripts and a small web UI to demo parcel creation and distribution flows.
