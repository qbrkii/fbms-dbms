-- example_queries.sql
-- 10 example queries (routine and non-routine) extracted from schema.sql

-- Q01: Parcels delivered using vehicles that require maintenance (Routine)
SELECT d.Distribution_ID, d.Distribution_Date, v.Vehicle_ID, v.License_No, v.Maintenance_Status,
       p.Parcel_ID, f.Name AS Family_Name
FROM DISTRIBUTION d
JOIN VEHICLE v ON d.Vehicle_ID = v.Vehicle_ID
JOIN PARCEL p ON d.Parcel_ID = p.Parcel_ID
JOIN FAMILY f ON p.Family_ID = f.Family_ID
WHERE v.Maintenance_Status = 'NEEDS_MAINTENANCE';

-- Q02: Total volunteer hours by department (Routine)
SELECT dep.Department_Name,
       SUM(va.Hours_Worked) AS Total_Volunteer_Hours
FROM VOLUNTEER_ASSIGNMENT va
JOIN DEPARTMENT dep ON va.Department_ID = dep.Department_ID
GROUP BY dep.Department_Name
ORDER BY Total_Volunteer_Hours DESC;

-- Q03: Donors who donated perishable items expiring within 30 days (Routine)
SELECT d.Donor_Name, i.Item_Name, i.Expiry_Date, i.Quantity_Available
FROM INVENTORY i
JOIN DONATION dn ON i.Donation_ID = dn.Donation_ID
JOIN DONOR d ON dn.Donor_ID = d.Donor_ID
WHERE i.Expiry_Date <= DATE_ADD(CURRENT_DATE, INTERVAL 30 DAY)
ORDER BY i.Expiry_Date;

-- Q04: Families receiving more than one parcel in the same month (Routine)
SELECT f.Family_ID, f.Name AS Family_Name,
       DATE_FORMAT(p.Creation_Date, '%Y-%m') AS Month,
       COUNT(*) AS Parcels_Received
FROM PARCEL p
JOIN FAMILY f ON p.Family_ID = f.Family_ID
GROUP BY f.Family_ID, f.Name, DATE_FORMAT(p.Creation_Date, '%Y-%m')
HAVING COUNT(*) > 1
ORDER BY Parcels_Received DESC;

-- Q05: Employees who reviewed distributions containing items later disposed (Non-routine/Quality)
SELECT e.Employee_ID, e.Email AS Reviewer_Email,
       d.Distribution_ID, dl.Disposal_ID, i.Item_Name, dl.Reason
FROM DISPOSAL_LOG dl
JOIN INVENTORY i ON dl.Item_ID = i.Item_ID
JOIN PARCEL_ITEM pi ON pi.Item_ID = i.Item_ID
JOIN PARCEL p ON p.Parcel_ID = pi.Parcel_ID
JOIN DISTRIBUTION d ON d.Parcel_ID = p.Parcel_ID
JOIN EMPLOYEE_CORE e ON d.Reviewed_By = e.Employee_ID
ORDER BY dl.Disposal_Date DESC;

-- Q06: Top 5 donors by total donated quantity (Routine)
SELECT dn.Donor_ID, d.Donor_Name, SUM(dn.Total_Quantity) AS Total_Donated
FROM DONATION dn
JOIN DONOR d ON dn.Donor_ID = d.Donor_ID
GROUP BY dn.Donor_ID, d.Donor_Name
ORDER BY Total_Donated DESC
LIMIT 5;

-- Q07: Inventory items expiring in next 60 days grouped by category (Routine)
SELECT i.Category, i.Item_ID, i.Item_Name, i.Expiry_Date, i.Quantity_Available
FROM INVENTORY i
WHERE i.Expiry_Date BETWEEN CURRENT_DATE AND DATE_ADD(CURRENT_DATE, INTERVAL 60 DAY)
ORDER BY i.Expiry_Date;

-- Q08: Vehicle distribution counts in last 30 days (Non-routine / Operational analytics)
SELECT v.Vehicle_ID, v.License_No, v.Type, v.Maintenance_Status,
       COUNT(d.Distribution_ID) AS Num_Distributions
FROM VEHICLE v
LEFT JOIN DISTRIBUTION d ON v.Vehicle_ID = d.Vehicle_ID
    AND d.Distribution_Date >= DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY)
GROUP BY v.Vehicle_ID, v.License_No, v.Type, v.Maintenance_Status
ORDER BY Num_Distributions DESC;

-- Q09: Eligible families with no parcels in last 90 days (Non-routine / Outreach)
SELECT ef.Family_ID, f.Name, f.Address, f.Registration_Date
FROM ELIGIBLE_FAMILY ef
JOIN FAMILY f ON ef.Family_ID = f.Family_ID
LEFT JOIN PARCEL p ON f.Family_ID = p.Family_ID
    AND p.Creation_Date >= DATE_SUB(CURRENT_DATE, INTERVAL 90 DAY)
WHERE p.Parcel_ID IS NULL
ORDER BY f.Registration_Date;

-- Q10: Volunteers with fewer than 20 hours worked (Routine / Volunteer management)
SELECT vc.Volunteer_ID, pr.Name AS Volunteer_Name, vc.Assigned_Role, va.Hours_Worked, d.Department_Name
FROM VOLUNTEER_CORE vc
JOIN VOLUNTEER_ASSIGNMENT va ON vc.Volunteer_ID = va.Volunteer_ID
JOIN PERSON pr ON vc.Person_ID = pr.Person_ID
LEFT JOIN DEPARTMENT d ON va.Department_ID = d.Department_ID
WHERE va.Hours_Worked < 20
ORDER BY va.Hours_Worked ASC;
