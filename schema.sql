\
-- ===============================================================
-- ProjectModule3: Full BCNF schema + 15 rows per table + 10 queries
-- ===============================================================

/* Drop and recreate database */
DROP DATABASE IF EXISTS ProjectModule3;
CREATE DATABASE ProjectModule3;
USE ProjectModule3;

-- =================================================================
-- 1) PERSON
-- =================================================================
CREATE TABLE PERSON (
  Person_ID INT PRIMARY KEY,
  Name VARCHAR(120),
  Contact VARCHAR(100),
  Email VARCHAR(120)
);

INSERT INTO PERSON VALUES (1,'Ava Lopez','408-555-1001','ava.lopez@example.com');
INSERT INTO PERSON VALUES (2,'Ben Nguyen','415-555-1002','ben.nguyen@example.com');
INSERT INTO PERSON VALUES (3,'Chinedu Okafor','510-555-1003','chinedu.okafor@example.com');
INSERT INTO PERSON VALUES (4,'Dina Patel','650-555-1004','dina.patel@example.com');
INSERT INTO PERSON VALUES (5,'Ethan Park','415-555-1005','ethan.park@example.com');
INSERT INTO PERSON VALUES (6,'Fatima Yusuf','628-555-1006','fatima.yusuf@example.com');
INSERT INTO PERSON VALUES (7,'George Smith','408-555-1007','george.smith@example.com');
INSERT INTO PERSON VALUES (8,'Hannah Kim','415-555-1008','hannah.kim@example.com');
INSERT INTO PERSON VALUES (9,'Imani Adeyemi','510-555-1009','imani.adeyemi@example.com');
INSERT INTO PERSON VALUES (10,'Jonas Rivera','650-555-1010','jonas.rivera@example.com');
INSERT INTO PERSON VALUES (11,'Kofi Mensah','628-555-1011','kofi.mensah@example.com');
INSERT INTO PERSON VALUES (12,'Lina Gomez','408-555-1012','lina.gomez@example.com');
INSERT INTO PERSON VALUES (13,'Maya Thompson','415-555-1013','maya.thompson@example.com');
INSERT INTO PERSON VALUES (14,'Noah Brooks','510-555-1014','noah.brooks@example.com');
INSERT INTO PERSON VALUES (15,'Olivia Chen','650-555-1015','olivia.chen@example.com');

-- =================================================================
-- 2) DIRECTOR
-- =================================================================
CREATE TABLE DIRECTOR (
  Director_ID INT PRIMARY KEY,
  Name VARCHAR(120),
  Email VARCHAR(120),
  Contact VARCHAR(120)
);

INSERT INTO DIRECTOR VALUES (1,'Dr. Helen Carter','helen.carter@foodbank.org','408-555-3001');
INSERT INTO DIRECTOR VALUES (2,'Marcus Li','marcus.li@foodbank.org','415-555-3002');
INSERT INTO DIRECTOR VALUES (3,'Sofia Martinez','sofia.martinez@foodbank.org','510-555-3003');
INSERT INTO DIRECTOR VALUES (4,'Olu Eze','olu.eze@foodbank.org','650-555-3004');
INSERT INTO DIRECTOR VALUES (5,'Priya Narayan','priya.narayan@foodbank.org','628-555-3005');
INSERT INTO DIRECTOR VALUES (6,'Robert King','robert.king@foodbank.org','408-555-3006');
INSERT INTO DIRECTOR VALUES (7,'Angela Wu','angela.wu@foodbank.org','415-555-3007');
INSERT INTO DIRECTOR VALUES (8,'Thomas Green','thomas.green@foodbank.org','510-555-3008');
INSERT INTO DIRECTOR VALUES (9,'Yara Ali','yara.ali@foodbank.org','650-555-3009');
INSERT INTO DIRECTOR VALUES (10,'Samuel Ortiz','sam.ortiz@foodbank.org','628-555-3010');
INSERT INTO DIRECTOR VALUES (11,'Grace Okoye','grace.okoye@foodbank.org','408-555-3011');
INSERT INTO DIRECTOR VALUES (12,'Liam O''Connor','liam.oconnor@foodbank.org','415-555-3012');
INSERT INTO DIRECTOR VALUES (13,'Noelle DuPont','noelle.dupont@foodbank.org','510-555-3013');
INSERT INTO DIRECTOR VALUES (14,'Victor Huang','victor.huang@foodbank.org','650-555-3014');
INSERT INTO DIRECTOR VALUES (15,'Zoe Bennett','zoe.bennett@foodbank.org','628-555-3015');

-- =================================================================
-- 3) DEPARTMENT
-- =================================================================
CREATE TABLE DEPARTMENT (
  Department_ID INT PRIMARY KEY,
  Department_Name VARCHAR(100),
  Description VARCHAR(200),
  Location VARCHAR(150),
  Director_ID INT,
  CONSTRAINT fk_dept_director FOREIGN KEY (Director_ID) REFERENCES DIRECTOR(Director_ID)
);

INSERT INTO DEPARTMENT VALUES (1,'Operations','Warehouse operations & scheduling','101 Logistics Ave',1);
INSERT INTO DEPARTMENT VALUES (2,'Donations Intake','Donation coordination & sorting','22 Donation Way',2);
INSERT INTO DEPARTMENT VALUES (3,'Family Services','Family registration & eligibility','33 Community Rd',3);
INSERT INTO DEPARTMENT VALUES (4,'Transport','Vehicle management & routes','44 Transit St',4);
INSERT INTO DEPARTMENT VALUES (5,'Volunteer Coordination','Volunteer training & shifts','55 Care Blvd',5);
INSERT INTO DEPARTMENT VALUES (6,'Quality Control','Food safety & inspection','66 Health Ln',6);
INSERT INTO DEPARTMENT VALUES (7,'Outreach','Community outreach & events','77 Outreach Dr',7);
INSERT INTO DEPARTMENT VALUES (8,'IT','Database & systems support','88 Tech Park',8);
INSERT INTO DEPARTMENT VALUES (9,'Finance','Budget & grants','99 Finance Pl',9);
INSERT INTO DEPARTMENT VALUES (10,'HR','Hiring & staff welfare','10 People Ct',10);
INSERT INTO DEPARTMENT VALUES (11,'Nutrition','Meal planning & education','11 Nutri Way',11);
INSERT INTO DEPARTMENT VALUES (12,'Procurement','Purchase & supplier relations','12 Supply Rd',12);
INSERT INTO DEPARTMENT VALUES (13,'Admin','General administration','13 Admin Loop',13);
INSERT INTO DEPARTMENT VALUES (14,'Warehouse B','Overflow warehouse','14 Storage Ave',14);
INSERT INTO DEPARTMENT VALUES (15,'Logistics Support','Route planning support','15 Route St',15);

-- =================================================================
-- 4) DONOR & subtypes
-- =================================================================
CREATE TABLE DONOR (
  Donor_ID INT PRIMARY KEY,
  Donor_Name VARCHAR(150),
  Contact VARCHAR(120),
  Type VARCHAR(50)
);

CREATE TABLE INDIVIDUAL_DONOR (
  Donor_ID INT PRIMARY KEY,
  CONSTRAINT fk_indiv_donor FOREIGN KEY (Donor_ID) REFERENCES DONOR(Donor_ID)
);

CREATE TABLE ORGANIZATION_DONOR (
  Donor_ID INT PRIMARY KEY,
  CONSTRAINT fk_org_donor FOREIGN KEY (Donor_ID) REFERENCES DONOR(Donor_ID)
);

CREATE TABLE GOVERNMENT_DONOR (
  Donor_ID INT PRIMARY KEY,
  CONSTRAINT fk_gov_donor FOREIGN KEY (Donor_ID) REFERENCES DONOR(Donor_ID)
);

INSERT INTO DONOR VALUES (1,'Neighborhood Donors Collective','408-555-2001','INDIVIDUALS');
INSERT INTO DONOR VALUES (2,'Maria Santos','415-555-2004','INDIVIDUALS');
INSERT INTO DONOR VALUES (3,'Chen Family Trust','650-555-2005','INDIVIDUALS');
INSERT INTO DONOR VALUES (4,'Alicia Perez','408-555-2012','INDIVIDUALS');
INSERT INTO DONOR VALUES (5,'Volunteer Neighbors','510-555-2015','INDIVIDUALS');
INSERT INTO DONOR VALUES (6,'Samuel Reed','415-555-2016','INDIVIDUALS');
INSERT INTO DONOR VALUES (7,'Nora Jacobs','510-555-2017','INDIVIDUALS');
INSERT INTO DONOR VALUES (8,'Omar Al-Farsi','628-555-2018','INDIVIDUALS');
INSERT INTO DONOR VALUES (9,'Priya Menon','408-555-2019','INDIVIDUALS');
INSERT INTO DONOR VALUES (10,'Quinn Baxter','650-555-2020','INDIVIDUALS');
INSERT INTO DONOR VALUES (11,'Rita Coleman','415-555-2021','INDIVIDUALS');
INSERT INTO DONOR VALUES (12,'Sergio Alvarez','510-555-2022','INDIVIDUALS');
INSERT INTO DONOR VALUES (13,'Tina Park','408-555-2023','INDIVIDUALS');
INSERT INTO DONOR VALUES (14,'Uma Rao','650-555-2024','INDIVIDUALS');
INSERT INTO DONOR VALUES (15,'Victor Mensah','628-555-2025','INDIVIDUALS');

INSERT INTO DONOR VALUES (16,'Hope Food Drive','415-555-2002','ORGANIZATION');
INSERT INTO DONOR VALUES (17,'Bay Area Grocers Inc.','408-555-2006','ORGANIZATION');
INSERT INTO DONOR VALUES (18,'St. Mark Church','510-555-2007','ORGANIZATION');
INSERT INTO DONOR VALUES (19,'Lifeline Foundation','415-555-2009','ORGANIZATION');
INSERT INTO DONOR VALUES (20,'Green Farms Co-op','650-555-2010','ORGANIZATION');
INSERT INTO DONOR VALUES (21,'Rotary Club Downtown','415-555-2013','ORGANIZATION');
INSERT INTO DONOR VALUES (22,'Community Bakers Union','408-555-2014','ORGANIZATION');
INSERT INTO DONOR VALUES (23,'Local Market Alliance','510-555-2015','ORGANIZATION');
INSERT INTO DONOR VALUES (24,'Harvest Partners','650-555-2016','ORGANIZATION');
INSERT INTO DONOR VALUES (25,'City Volunteers Group','628-555-2017','ORGANIZATION');
INSERT INTO DONOR VALUES (26,'Neighborhood Kitchens','408-555-2018','ORGANIZATION');
INSERT INTO DONOR VALUES (27,'School Food Drive Team','415-555-2019','ORGANIZATION');
INSERT INTO DONOR VALUES (28,'Farm Share Program','510-555-2020','ORGANIZATION');
INSERT INTO DONOR VALUES (29,'Green Canning Co.','650-555-2021','ORGANIZATION');
INSERT INTO DONOR VALUES (30,'Urban Growers Collective','628-555-2022','ORGANIZATION');

INSERT INTO DONOR VALUES (31,'City Relief Fund','510-555-2003','GOVERNMENT');
INSERT INTO DONOR VALUES (32,'County Emergency Services','628-555-2008','GOVERNMENT');
INSERT INTO DONOR VALUES (33,'State Hunger Program','916-555-2011','GOVERNMENT');
INSERT INTO DONOR VALUES (34,'Federal Community Support','202-555-2014','GOVERNMENT');
INSERT INTO DONOR VALUES (35,'Regional Aid Office','916-555-2016','GOVERNMENT');
INSERT INTO DONOR VALUES (36,'Municipal Food Assistance','415-555-2023','GOVERNMENT');
INSERT INTO DONOR VALUES (37,'County Health Aid','408-555-2024','GOVERNMENT');
INSERT INTO DONOR VALUES (38,'State Food Reserve','650-555-2025','GOVERNMENT');
INSERT INTO DONOR VALUES (39,'National Relief Agency','202-555-2026','GOVERNMENT');
INSERT INTO DONOR VALUES (40,'Emergency Response Dept.','510-555-2027','GOVERNMENT');
INSERT INTO DONOR VALUES (41,'Public Nutrition Fund','628-555-2028','GOVERNMENT');
INSERT INTO DONOR VALUES (42,'City Grants Office','415-555-2029','GOVERNMENT');
INSERT INTO DONOR VALUES (43,'Federal Food Program','202-555-2030','GOVERNMENT');
INSERT INTO DONOR VALUES (44,'County Support Services','916-555-2031','GOVERNMENT');
INSERT INTO DONOR VALUES (45,'Regional Volunteers Office','408-555-2032','GOVERNMENT');

INSERT INTO INDIVIDUAL_DONOR VALUES (1);
INSERT INTO INDIVIDUAL_DONOR VALUES (2);
INSERT INTO INDIVIDUAL_DONOR VALUES (3);
INSERT INTO INDIVIDUAL_DONOR VALUES (4);
INSERT INTO INDIVIDUAL_DONOR VALUES (5);
INSERT INTO INDIVIDUAL_DONOR VALUES (6);
INSERT INTO INDIVIDUAL_DONOR VALUES (7);
INSERT INTO INDIVIDUAL_DONOR VALUES (8);
INSERT INTO INDIVIDUAL_DONOR VALUES (9);
INSERT INTO INDIVIDUAL_DONOR VALUES (10);
INSERT INTO INDIVIDUAL_DONOR VALUES (11);
INSERT INTO INDIVIDUAL_DONOR VALUES (12);
INSERT INTO INDIVIDUAL_DONOR VALUES (13);
INSERT INTO INDIVIDUAL_DONOR VALUES (14);
INSERT INTO INDIVIDUAL_DONOR VALUES (15);

INSERT INTO ORGANIZATION_DONOR VALUES (16);
INSERT INTO ORGANIZATION_DONOR VALUES (17);
INSERT INTO ORGANIZATION_DONOR VALUES (18);
INSERT INTO ORGANIZATION_DONOR VALUES (19);
INSERT INTO ORGANIZATION_DONOR VALUES (20);
INSERT INTO ORGANIZATION_DONOR VALUES (21);
INSERT INTO ORGANIZATION_DONOR VALUES (22);
INSERT INTO ORGANIZATION_DONOR VALUES (23);
INSERT INTO ORGANIZATION_DONOR VALUES (24);
INSERT INTO ORGANIZATION_DONOR VALUES (25);
INSERT INTO ORGANIZATION_DONOR VALUES (26);
INSERT INTO ORGANIZATION_DONOR VALUES (27);
INSERT INTO ORGANIZATION_DONOR VALUES (28);
INSERT INTO ORGANIZATION_DONOR VALUES (29);
INSERT INTO ORGANIZATION_DONOR VALUES (30);

INSERT INTO GOVERNMENT_DONOR VALUES (31);
INSERT INTO GOVERNMENT_DONOR VALUES (32);
INSERT INTO GOVERNMENT_DONOR VALUES (33);
INSERT INTO GOVERNMENT_DONOR VALUES (34);
INSERT INTO GOVERNMENT_DONOR VALUES (35);
INSERT INTO GOVERNMENT_DONOR VALUES (36);
INSERT INTO GOVERNMENT_DONOR VALUES (37);
INSERT INTO GOVERNMENT_DONOR VALUES (38);
INSERT INTO GOVERNMENT_DONOR VALUES (39);
INSERT INTO GOVERNMENT_DONOR VALUES (40);
INSERT INTO GOVERNMENT_DONOR VALUES (41);
INSERT INTO GOVERNMENT_DONOR VALUES (42);
INSERT INTO GOVERNMENT_DONOR VALUES (43);
INSERT INTO GOVERNMENT_DONOR VALUES (44);
INSERT INTO GOVERNMENT_DONOR VALUES (45);

-- =================================================================
-- 5) MEMBERSHIP_PLAN & MEMBER
-- =================================================================
CREATE TABLE MEMBERSHIP_PLAN (
  Plan_ID INT PRIMARY KEY,
  Plan_Name VARCHAR(80),
  DurationMonths INT,
  Fee DECIMAL(8,2),
  Benefits VARCHAR(255)
);

CREATE TABLE MEMBER (
  Member_ID INT PRIMARY KEY,
  Person_ID INT,
  Email VARCHAR(120) UNIQUE,
  MembershipPlan_ID INT,
  Start_Date DATE,
  End_Date DATE,
  Active BOOLEAN,
  CONSTRAINT fk_member_person FOREIGN KEY (Person_ID) REFERENCES PERSON(Person_ID),
  CONSTRAINT fk_member_plan FOREIGN KEY (MembershipPlan_ID) REFERENCES MEMBERSHIP_PLAN(Plan_ID)
);

INSERT INTO MEMBERSHIP_PLAN VALUES (1,'Basic',1,0.00,'Access to monthly parcels');
INSERT INTO MEMBERSHIP_PLAN VALUES (2,'Standard',6,10.00,'Priority pickup slots');
INSERT INTO MEMBERSHIP_PLAN VALUES (3,'Premium',12,25.00,'Home delivery priority');
INSERT INTO MEMBERSHIP_PLAN VALUES (4,'Emergency',3,0.00,'Immediate assistance');
INSERT INTO MEMBERSHIP_PLAN VALUES (5,'Community',12,5.00,'Volunteer credits');
INSERT INTO MEMBERSHIP_PLAN VALUES (6,'MonthlyDonor',1,0.00,'Donor support plan');
INSERT INTO MEMBERSHIP_PLAN VALUES (7,'FamilyPlan',12,15.00,'Covers family parcels');
INSERT INTO MEMBERSHIP_PLAN VALUES (8,'SeniorPlan',12,0.00,'Seniors support');
INSERT INTO MEMBERSHIP_PLAN VALUES (9,'YouthPlan',12,0.00,'Youth support');
INSERT INTO MEMBERSHIP_PLAN VALUES (10,'Trial',1,0.00,'Trial plan');
INSERT INTO MEMBERSHIP_PLAN VALUES (11,'Healthcare',12,0.00,'Health priority');
INSERT INTO MEMBERSHIP_PLAN VALUES (12,'Disaster',3,0.00,'Disaster aid');
INSERT INTO MEMBERSHIP_PLAN VALUES (13,'VolunteerReward',12,0.00,'Rewards for hours');
INSERT INTO MEMBERSHIP_PLAN VALUES (14,'CommunityPartner',12,0.00,'Community partner access');
INSERT INTO MEMBERSHIP_PLAN VALUES (15,'ScholarAid',12,0.00,'Student support');

INSERT INTO MEMBER VALUES (1,1,'ava.lopez@example.com',2,'2025-01-01','2025-07-01',TRUE);
INSERT INTO MEMBER VALUES (2,2,'ben.nguyen@example.com',3,'2025-02-01','2026-02-01',TRUE);
INSERT INTO MEMBER VALUES (3,3,'chinedu.okafor@example.com',1,'2025-03-01','2025-04-01',TRUE);
INSERT INTO MEMBER VALUES (4,4,'dina.patel@example.com',4,'2025-04-15','2025-07-15',TRUE);
INSERT INTO MEMBER VALUES (5,5,'ethan.park@example.com',5,'2025-05-01','2026-05-01',TRUE);
INSERT INTO MEMBER VALUES (6,6,'fatima.yusuf@example.com',6,'2025-06-01','2025-07-01',TRUE);
... (truncated for brevity in analysis) 
