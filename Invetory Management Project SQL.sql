﻿CREATE DATABASE InventoryDB;


USE InventoryDB;

-------------- Create SUPPLIER Table-----------

CREATE TABLE SUPPLIER (
    SID CHAR(5) NOT NULL PRIMARY KEY, -- Supplier ID
    SNAME VARCHAR(50) NOT NULL,       -- Supplier Name
    SADD VARCHAR(100) NOT NULL,       -- Supplier Address
    SCITY VARCHAR(50) DEFAULT 'DELHI',-- Supplier City with default value DELHI
    SPHONE VARCHAR(15) UNIQUE,        -- Supplier Phone Number (unique)
    EMAIL VARCHAR(50)                 -- Supplier Email
);

-------------- Create PRODUCT Table-------------

CREATE TABLE PRODUCT (
    PID CHAR(5) NOT NULL PRIMARY KEY,                                 -- Product ID
    PDESC VARCHAR(100),                                               -- Product Description
    PRICE DECIMAL(10, 2) CHECK (PRICE > 0),                           -- Product Price, must be > 0
    CATEGORY VARCHAR(50) CHECK (CATEGORY IN ('IT','HA','HC')),        -- Product Category with allowed values
    SID CHAR(5) NOT NULL,                                             -- Supplier ID (Foreign Key)
    CONSTRAINT FK_Supplier FOREIGN KEY (SID) REFERENCES SUPPLIER(SID) -- Foreign Key to SUPPLIER table
);

---------------- Create STOCK Table----------------

CREATE TABLE STOCK (
    PID CHAR(5) NOT NULL PRIMARY KEY,                                    -- Product ID (Foreign Key)
    SQTY INT CHECK (SQTY >= 0),                                          -- Stock Quantity, must be >= 0
    ROL INT CHECK (ROL > 0),                                             -- Reorder Level, must be > 0
    MOQ INT CHECK (MOQ >= 5),                                            -- Minimum Order Quantity, must be >= 5
    CONSTRAINT FK_ProductStock FOREIGN KEY (PID) REFERENCES PRODUCT(PID) -- Foreign Key to PRODUCT table
);

------------------- Create CUST (Customer) Table-------------------

CREATE TABLE CUST (
    CID CHAR(5) NOT NULL PRIMARY KEY,    -- Customer ID
    CNAME VARCHAR(50) NOT NULL,          -- Customer Name
    ADDRESS VARCHAR(100) NOT NULL,       -- Customer Address
    CITY VARCHAR(50) NOT NULL,           -- Customer City
    PHONE VARCHAR(15) NOT NULL,          -- Customer Phone
    EMAIL VARCHAR(50) NOT NULL,          -- Customer Email
    DOB DATE CHECK (DOB < '01-JAN-2000') -- Customer Date of Birth, must be before Jan 1, 2000
);

------------------- Create ORDERS Table---------------------

CREATE TABLE ORDERS (
    OID CHAR(5) NOT NULL PRIMARY KEY,                                     -- Order ID
    ODATE DATE,                                                           -- Order Date
    PID CHAR(5) NOT NULL,                                                 -- Product ID (Foreign Key)
    CID CHAR(5) NOT NULL,                                                 -- Customer ID (Foreign Key)
    OQTY INT CHECK (OQTY >= 1),                                           -- Order Quantity, must be >= 1
    CONSTRAINT FK_ProductOrder FOREIGN KEY (PID) REFERENCES PRODUCT(PID), -- Foreign Key to PRODUCT table
    CONSTRAINT FK_CustomerOrder FOREIGN KEY (CID) REFERENCES CUST(CID)    -- Foreign Key to CUST table
);

INSERT INTO SUPPLIER (SID, SNAME, SADD, SCITY, SPHONE, EMAIL) 
VALUES
	('S0001', 'TechPro IT Solutions', '12, Chandni Chowk', 'Delhi', '9123056781', 'techpro.itsolutions@gmail.com'),
	('S0002', 'MobileTech Electronics', '14, Andheri East', 'Mumbai', '9123451082', 'mobiletech.electronics@yahoo.com'),
	('S0003', 'CompuWorld Supplies', '45, Banjara Hills', 'Hyderabad', '9403456783', 'compuworld.supplies@outlook.com'),
	('S0004', 'PrintMasters Inc.', '23, Park Street', 'Kolkata', '9123450784', 'printmasters.inc@gmail.com'),
	('S0005', 'NetLink Connectivity', '78, Koramangala', 'Bangalore', '9129656785', 'netlink.connectivity@hotmail.com'),
	('S0006', 'MedTech Health Supplies', '33, Ellis Bridge', 'Ahmedabad', '9453456786', 'medtech.healthsupplies@yahoo.com'),
	('S0007', 'LifeCare Medical Equipment', '52, Velachery', 'Chennai', '9157456787', 'lifecare.medicalequipment@gmail.com'),
	('S0008', 'MedEquip Solutions', '67, Sector 18', 'Noida', '9123403788', 'medequip.solutions@rediffmail.com'),
	('S0009', 'HealthPro Medical Supplies', '56, MG Road', 'Pune', '9123456789', 'healthpro.medicalsupplies@gmail.com'),
	('S0010', 'CareFirst Medical Goods', '42, Connaught Place', 'Delhi', '9121456790', 'carefirst.medicalgoods@gmail.com'),
	('S0011', 'FirstMed Health Supplies', '11, Brigade Road', 'Bangalore', '9198456791', 'firstmed.healthsupplies@gmail.com'),
	('S0012', 'HomeTech Appliances', '90, SG Highway', 'Ahmedabad', '9423456792', 'hometech.appliances@yahoo.com'),
	('S0013', 'SmartHome Appliances', '27, T Nagar', 'Chennai', '9123476793', 'smarthome.appliances@outlook.com'),
	('S0014', 'CoolTech Refrigeration', '17, New Market', 'Bhopal', '910456794', 'cooltech.refrigeration@gmail.com'),
	('S0015', 'HomeEssentials Appliances', '43, Salt Lake', 'Kolkata', '9123433795', 'homeessentials.appliances@hotmail.com'),
	('S0016', 'CleanHome Devices', '19, Lal Darwaza', 'Ahmedabad', '99023456796', 'cleanhome.devices@gmail.com'),
	('S0017', 'HomeCare Appliances', '23, Main Road', 'Nagpur', '9163456797', 'homecare.appliances@yahoo.com'),
	('S0018', 'FreshAir Home Products', '51, Vashi', 'Mumbai', '9123456708', 'freshair.homeproducts@gmail.com'),
	('S0019', 'EcoHome Solutions', '12, FC Road', 'Pune', '9503456799', 'ecohome.solutions@outlook.com'),
	('S0020', 'GizmoTech IT Solutions', '34, New Palasia', 'Indore', '9121156800', 'gizomtech.itsolutions@gmail.com'),
	('S0021', 'TechTrend Electronics', '45, Maninagar', 'Ahmedabad', '9123458821', 'techtrend.electronics@gmail.com'),
	('S0022', 'GadgetWorks', '10, Rajajinagar', 'Bangalore', '9120056822', 'gadgetworks@yahoo.com'),
	('S0023', 'SmartHome Gadgets', '24, Civil Lines', 'Delhi', '912556823', 'smarthome.gadgets@gmail.com'),
	('S0024', 'EcoTech Devices', '16, Koti', 'Hyderabad', '9142456824', 'ecotech.devices@hotmail.com'),
	('S0025', 'ApplianceWorld', '9, Sector 15', 'Noida', '9123444825', 'applianceworld@rediffmail.com'),
	('S0026', 'SmartLiving Appliances', '8, MG Road', 'Indore', '9123506826', 'smartliving.appliances@gmail.com'),
	('S0027', 'HomeComfort Solutions', '7, Lajpat Nagar', 'Delhi', '9178456827', 'homecomfort.solutions@gmail.com'),
	('S0028', 'TechGadgets Inc.', '6, Baner Road', 'Pune', '9123440828', 'techgadgets.inc@hotmail.com'),
	('S0029', 'SmartTech Electronics', '3, Adyar', 'Chennai', '9123481829', 'smarttech.electronics@gmail.com'),
	('S0030', 'PowerUp Electronics', '1, Model Town', 'Ludhiana', '9123356830', 'powerup.electronics@outlook.com'),
	('S0031', 'CableTech Supplies', '22, Dadar West', 'Mumbai', '9177456821', 'cabletech.supplies@gmail.com'),
	('S0032', 'PrintMaster Solutions', '47, Navrangpura', 'Ahmedabad', '9123006822', 'printmaster.solutions@yahoo.com'),
	('S0033', 'TechSpark Gadgets', '101, Sector 22', 'Chandigarh', '9123457823', 'techspark.gadgets@gmail.com'),
	('S0034', 'PowerLife Electronics', '56, Banjara Hills', 'Hyderabad', '91233856824', 'powerlife.electronics@outlook.com'),
	('S0035', 'GearUp Electronics', '78, CP Ramaswamy Road', 'Chennai', '9187456825', 'gearup.electronics@gmail.com'),
	('S0036', 'SmartHome Gadgets', '12, Camp', 'Pune', '9123456826', 'smarthome.gadgets@hotmail.com'),
	('S0037', 'TechNova Electronics', '19, Aminabad', 'Lucknow', '9127256827', 'technova.electronics@yahoo.com'),
	('S0038', 'AirTech Solutions', '35, MG Road', 'Kochi', '9123956828', 'airtech.solutions@gmail.com'),
	('S0039', 'BrightFuture Electronics', '65, HSR Layout', 'Bangalore', '9123456829', 'brightfuture.electronics@rediffmail.com'),
	('S0040', 'SafeHome Health Supplies', '23, Model Town', 'Ludhiana', '9123456830', 'safehome.healthsupplies@gmail.com'),
	('S0041', 'HealthEquip Ltd.', '17, Raj Nagar', 'Ghaziabad', '91823456831', 'healtequip.ltd@gmail.com'),
	('S0042', 'MedSupply Pro', '56 Industrial Area', 'Hyderabad', '8063452871', 'medsupply.pro@traders.com'),
	('S0043', 'HealthTech Supplies', '10 Central Park Ave', 'Pune', '9823401112', 'healthtech.supplies@supply.com'),
	('S0044', 'LifeSupport Medical', '45 MG Road', 'Bhopal', '9945618300', 'lifesupport.medical@distributors.com'),
	('S0045', 'HomeMed Supplies', '21 Queen’s Street', 'Nagpur', '9756471223', 'homemed.supplies@supply.com'),
	('S0046', 'FreshCare Medical Supplies', '22 Coastal Road', 'Vishakhapatnam', '9856231470', 'freshcare.medicalsupplies@ventures.com'),
	('S0047', 'HealingTouch Health Solutions', '7 Lake View Dr', 'Jaipur', '9923456789', 'healingtouch.healthsolutions@products.com'),
	('S0048', 'HealthPlus Products', '8 Green Park', 'Indore', '9845678901', 'healthplus.products@supply.com'),
	('S0049', 'ClearHealth Solutions', '5 Silicon Road', 'Kochi', '9912345072', 'clearhealth.solutions@supply.com'),
	('S0050', 'CareEquip Supplies', '15 Mall Road', 'Chennai', '9898765732', 'careequip.supplies@enterprises.com');


SELECT * FROM SUPPLIER;

drop table ORDERS;
drop table STOCK;
drop table PRODUCT;
drop table SUPPLIER;
drop table CUST;


INSERT INTO PRODUCT (PID, PDESC, PRICE, CATEGORY, SID) 
VALUES
    ('P0001', 'Laptop Charger', 1200.65, 'IT', 'S0001'),         -- IT Category
    ('P0002', 'Smartphone Battery', 500.34, 'IT', 'S0002'),      -- IT Category
    ('P0003', 'Wireless Mouse', 400.68, 'IT', 'S0003'),         -- IT Category
    ('P0004', 'Printer', 5000.00, 'IT', 'S0004'),                -- IT Category
    ('P0005', 'Router', 2500.60, 'IT', 'S0005'),                 -- IT Category
    ('P0006', 'Stethoscope', 18000.42, 'HC', 'S0006'),            -- HC Category
    ('P0007', 'Thermometer', 10000.08, 'HC', 'S0007'),             -- HC Category
    ('P0008', 'First Aid Kit', 1000.00, 'HC', 'S0008'),           -- HC Category
    ('P0009', 'Medical Mask', 100.56, 'HC', 'S0009'),            -- HC Category
    ('P0010', 'Blood Pressure Monitor', 20000.87, 'HC', 'S0010'),  -- HC Category
    ('P0011', 'Hand Sanitizer', 100.93, 'HC', 'S0011'),          -- HC Category
    ('P0012', 'Washing Machine', 8000.23, 'HA', 'S0012'),         -- HA Category
    ('P0013', 'Microwave Oven', 6000.03, 'HA', 'S0013'),          -- HA Category
    ('P0014', 'Air Conditioner', 10000.82, 'HA', 'S0014'),         -- HA Category
    ('P0015', 'Refrigerator', 12000.00, 'HA', 'S0015'),           -- HA Category
    ('P0016', 'Dishwasher', 8000, 'HA', 'S0016'),                -- HA Category
    ('P0017', 'Electric Kettle', 3500.92, 'HA', 'S0017'),        -- HA Category
    ('P0018', 'Blender', 850.24, 'HA', 'S0018'),                 -- HA Category
    ('P0019', 'Toaster', 1500.61, 'HA', 'S0019'),                 -- HA Category
    ('P0020', 'Smartphone', 30000.17, 'IT', 'S0020'),              -- IT Category
    ('P0021', 'Laptop', 50000.53, 'IT', 'S0021'),                 -- IT Category
    ('P0022', 'Tablet', 45000.68, 'IT', 'S0022'),                 -- IT Category
    ('P0023', 'Smartwatch', 2500.21, 'IT', 'S0023'),             -- IT Category
    ('P0024', 'Smart Speaker', 400.21, 'IT', 'S0024'),           -- IT Category
    ('P0025', 'Smart TV', 18000.41, 'HA', 'S0025'),               -- HA Category
    ('P0026', 'Vacuum Cleaner', 3500.89, 'HA', 'S0026'),         -- HA Category
    ('P0027', 'Fan', 2800.90, 'HA', 'S0027'),                    -- HA Category
    ('P0028', 'Heater', 5000.16, 'HA', 'S0028'),                 -- HA Category
    ('P0029', 'Air Purifier', 3200.00, 'HA', 'S0029'),           -- HA Category
    ('P0030', 'Surge Protector', 1500.10, 'IT', 'S0030'),        -- IT Category
    ('P0031', 'USB Cable', 200.16, 'IT', 'S0031'),              -- IT Category
    ('P0032', 'Printer Cartridge', 650.58, 'IT', 'S0032'),       -- IT Category
    ('P0033', 'Power Bank', 500.00, 'IT', 'S0033'),             -- IT Category
    ('P0034', 'Headphones', 550.50, 'IT', 'S0034'),              -- IT Category
    ('P0035', 'Keyboard', 800.59, 'IT', 'S0035'),               -- IT Category
    ('P0036', 'Wireless Speaker', 2500.28, 'IT', 'S0036'),       -- IT Category
    ('P0037', 'Monitor', 30000.38, 'IT', 'S0037'),                -- IT Category
    ('P0038', 'Laptop Stand', 3500.59, 'IT', 'S0038'),           -- IT Category
    ('P0039', 'Cable Organizer', 2000.67, 'IT', 'S0039'),        -- IT Category
    ('P0040', 'Smartphone Case', 4000.60, 'IT', 'S0040'),        -- IT Category
    ('P0041', 'Medical Gloves', 3000.00, 'HC', 'S0042'),           -- HC Category
    ('P0042', 'Hand Sanitizer', 150.0, 'HC', 'S0043'),            -- HC Category
    ('P0043', 'Disinfectant Wipes', 250.00, 'HC', 'S0044'),        -- HC Category
    ('P0044', 'Health Supplement', 2500, 'HC', 'S0045'),         -- HC Category
    ('P0045', 'Medical Bandage', 200.00, 'HC', 'S0046'),          -- HC Category
    ('P0046', 'Vitamins', 1200.00, 'HC', 'S0047'),                 -- HC Category
    ('P0047', 'Surgical Mask', 250.0, 'HC', 'S0048'),             -- HC Category
    ('P0048', 'Oxygen Cylinder', 35000.0, 'HC', 'S0049'),           -- HC Category
    ('P0049', 'CPR Mask', 18590.00, 'HC', 'S0050'),                 -- HC Category
    ('P0050', 'Blood Glucose Monitor', 15690.00, 'HC', 'S0049');    -- HC Category

SELECT * FROM PRODUCT;	

INSERT INTO CUST (CID, CNAME, ADDRESS, CITY, PHONE, EMAIL, DOB) 
VALUES
		('C0001', 'Ravi Patel', '5, Green Park', 'Delhi', '9823456701', 'ravi.patel@example.com', '1995-07-15'),
		('C0002', 'Anjali Singh', '12, Ghatkopar', 'Mumbai', '9823456702', 'anjali.singh@example.com', '1992-06-20'),
		('C0003', 'Sameer Khan', '23, Jubilee Hills', 'Hyderabad', '9823456703', 'sameer.khan@example.com', '1998-01-13'),
		('C0004', 'Sita Sharma', '34, Ballygunge', 'Kolkata', '9823456704', 'sita.sharma@example.com', '1994-11-22'),
		('C0005', 'Akash Mehta', '45, Banjara Hills', 'Hyderabad', '9823456705', 'akash.mehta@example.com', '1991-04-07'),
		('C0006', 'Nisha Reddy', '6, Whitefield', 'Bangalore', '9823456706', 'nisha.reddy@example.com', '1989-02-27'),
		('C0007', 'Manoj Gupta', '7, Sector 10', 'Noida', '9823456707', 'manoj.gupta@example.com', '1990-12-05'),
		('C0008', 'Radhika Kapoor', '8, Andheri West', 'Mumbai', '9823456708', 'radhika.kapoor@example.com', '1996-08-19'),
		('C0009', 'Alok Verma', '10, Rajaji Nagar', 'Bangalore', '9823456709', 'alok.verma@example.com', '1997-03-30'),
		('C0010', 'Divya Jain', '11, Civil Lines', 'Nagpur', '9823456710', 'divya.jain@example.com', '1993-09-10'),
		('C0011', 'Prashant Desai', '12, Camp', 'Pune', '9823456711', 'prashant.desai@example.com', '1992-12-21'),
		('C0012', 'Pooja Pandey', '13, Kothrud', 'Pune', '9823456712', 'pooja.pandey@example.com', '1995-10-17'),
		('C0013', 'Rahul Nair', '14, Aluva', 'Kochi', '9823456713', 'rahul.nair@example.com', '1994-06-02'),
		('C0014', 'Ishita Bose', '15, Salt Lake', 'Kolkata', '9823456714', 'ishita.bose@example.com', '1990-08-24'),
		('C0015', 'Vikram Malhotra', '16, Chanakyapuri', 'Delhi', '9823456715', 'vikram.malhotra@example.com', '1991-07-13'),
		('C0016', 'Kiran Rao', '50, Vashi', 'Mumbai', '9823456716', 'kiran.rao@example.com', '1992-05-08'),
		('C0017', 'Sunil Dixit', '90, Jubilee Hills', 'Hyderabad', '9823456717', 'sunil.dixit@example.com', '1991-10-25'),
		('C0018', 'Amitabh Thakur', '12, Indiranagar', 'Bangalore', '9823456718', 'amitabh.thakur@example.com', '1988-11-30'),
		('C0019', 'Jyoti Deshmukh', '33, Civil Lines', 'Nagpur', '9823456719', 'jyoti.deshmukh@example.com', '1993-01-15'),
		('C0020', 'Parul Mehta', '55, Juhu', 'Mumbai', '9823456720', 'parul.mehta@example.com', '1992-09-27'),
		('C0021', 'Nikhil Mishra', '109 Park Road', 'Surat', '9876543211', 'nikhil@gmail.com', '1994-02-17'),
		('C0022', 'Pooja Verma', '55 Green St', 'Ranchi', '9876765432', 'pooja@verma.com', '1993-08-09'),
		('C0023', 'Shivani Patil', '22 Rose Ave', 'Ludhiana', '9765432134', 'shivani.patil@yahoo.com', '1995-05-11'),
		('C0024', 'Amit Gupta', '77 Orchid Blvd', 'Rajkot', '9867534212', 'amit.gupta@outlook.com', '1992-03-19'),
		('C0025', 'Riya Sen', '12 Hilltop Dr', 'Dhanbad', '9876532145', 'riya.sen@gmail.com', '1996-01-27'),
		('C0026', 'Vikram Arora', '9 Lakeside', 'Srinagar', '9756423132', 'vikram@arora.com', '1991-07-22'),
		('C0027', 'Neha Saxena', '45 Sunshine Dr', 'Gwalior', '9845623121', 'neha.saxena@ymail.com', '1994-11-10'),
		('C0028', 'Tarun Singh', '87 Heritage Lane', 'Nashik', '9845321010', 'tarun.singh@gmail.com', '1993-05-04'),
		('C0029', 'Manju Mehta', '15 Royal Gardens', 'Thane', '9823456523', 'manju.mehta@yahoo.com', '1990-09-21'),
		('C0030', 'Prakash Nair', '42 River Bank', 'Vellore', '9734521234', 'prakash.nair@outlook.com', '1992-02-13'),
		('C0031', 'Anita Sinha', '88 Temple St', 'Warangal', '9764123123', 'anita.sinha@gmail.com', '1995-06-02'),
		('C0032', 'Mohit Sharma', '74 Market Rd', 'Belgaum', '9756478923', 'mohit.sharma@live.com', '1991-09-30'),
		('C0033', 'Ravi Kumar', '32 Victory Blvd', 'Meerut', '9823764546', 'ravi.kumar@gmail.com', '1994-12-25'),
		('C0034', 'Sonia Das', '19 Beach Rd', 'Nagpur', '9823434554', 'sonia.das@yahoo.com', '1993-07-11'),
		('C0035', 'Kartik Joshi', '11 Fleet St', 'Patiala', '9734221155', 'kartik.joshi@gmail.com', '1992-04-01'),
		('C0036', 'Deepa Rao', '73 Fountain Rd', 'Ajmer', '9756561233', 'deepa.rao@outlook.com', '1994-12-14'),
		('C0037', 'Rajesh Goyal', '5 Queensway', 'Aligarh', '9764542344', 'rajesh.goyal@gmail.com', '1991-06-15'),
		('C0038', 'Kajal Kapoor', '66 Sunset Blvd', 'Hubli', '9845634765', 'kajal.kapoor@live.com', '1990-04-29'),
		('C0039', 'Manish Tiwari', '8 Lighthouse Ave', 'Siliguri', '9823786544', 'manish.tiwari@gmail.com', '1993-10-22'),
		('C0040', 'Sakshi Kulkarni', '44 Fort Rd', 'Dewas', '9865432987', 'sakshi.kulkarni@ymail.com', '1994-01-17'),
		('C0041', 'Arjun Batra', '19 Old Town St', 'Bareilly', '9876543133', 'arjun.batra@gmail.com', '1991-08-03'),
		('C0042', 'Priya Joshi', '60 Sunrise Ave', 'Moradabad', '9786534210', 'priya.joshi@gmail.com', '1993-11-09'),
		('C0043', 'Yash Patel', '34 Willow St', 'Amravati', '9823451234', 'yash.patel@yahoo.com', '1992-02-08'),
		('C0044', 'Meena Singh', '23 Highland Ave', 'Panipat', '9845643212', 'meena.singh@gmail.com', '1995-05-16'),
		('C0045', 'Nitin Chawla', '47 Pine Dr', 'Bhagalpur', '9734532141', 'nitin.chawla@outlook.com', '1994-09-01'),
		('C0046', 'Ravindra Chauhan', '23 Park Rd', 'Jammu', '9887654321', 'ravindra.chauhan@gmail.com', '1992-04-12'),
		('C0047', 'Shruti Gupta', '32 Maple Ave', 'Muzaffarpur', '9876543210', 'shruti.gupta@ymail.com', '1995-11-05'),
		('C0048', 'Pankaj Yadav', '45 Orchid Park', 'Jabalpur', '9756123456', 'pankaj.yadav@outlook.com', '1991-02-14'),
		('C0049', 'Neelam Sharma', '55 Golden Rd', 'Indore', '9734532123', 'neelam.sharma@live.com', '1993-09-25'),
		('C0050', 'Vishal Singh', '66 Rose Garden', 'Raipur', '9865432109', 'vishal.singh@gmail.com', '1994-12-09'),
		('C0051', 'Sneha Iyer', '33 Maple St', 'Alappuzha', '9876532212', 'sneha.iyer@gmail.com','1998-08-04'),
		('C0052', 'Vimal Raj', '77 Starlight Rd', 'Noida', '9865421342', 'vimal.raj@yahoo.com','1989-01-23'),
		('C0053', 'Tanvi Aggarwal', '88 Blossom St', 'Ghaziabad', '9876532121', 'tanvi.aggarwal@gmail.com','1987-11-15'),
		('C0054', 'Rajiv Menon', '66 Crescent Ave', 'Amritsar', '9756432123', 'rajiv.menon@gmail.com','1991-08-23'),
		('C0055', 'Komal Pandey', '56 River Rd', 'Aurangabad', '9823421345', 'komal.pandey@ymail.com','1989-06-07');

SELECT * FROM CUST;

INSERT INTO STOCK (PID, SQTY, ROL, MOQ) 
VALUES
    ('P0001', 50, 10, 5),
    ('P0002', 30, 8, 5),
    ('P0003', 20, 5, 5),
    ('P0004', 40, 15, 5),
    ('P0005', 25, 10, 5),
    ('P0006', 60, 20, 10),
    ('P0007', 70, 25, 10),
    ('P0008', 100, 30, 10),
    ('P0009', 80, 20, 10),
    ('P0010', 45, 10, 5),
    ('P0011', 55, 15, 5),
    ('P0012', 90, 35, 10),
    ('P0013', 65, 20, 5),
    ('P0014', 85, 25, 5),
    ('P0015', 50, 15, 5),
    ('P0016', 30, 8, 5),
    ('P0017', 25, 10, 5),
    ('P0018', 40, 12, 5),
    ('P0019', 20, 7, 5),
    ('P0020', 75, 30, 10),
    ('P0021', 80, 25, 10),
    ('P0022', 55, 15, 5),
    ('P0023', 45, 10, 5),
    ('P0024', 60, 20, 5),
    ('P0025', 35, 12, 5),
    ('P0026', 70, 25, 10),
    ('P0027', 95, 40, 10),
    ('P0028', 55, 18, 5),
    ('P0029', 80, 30, 10),
    ('P0030', 100, 35, 10),
    ('P0031', 40, 6, 15),
    ('P0032', 20, 10, 5),
    ('P0033', 80, 40, 15),
    ('P0034', 15, 34, 5),
    ('P0035', 30, 30, 10),
    ('P0036', 70, 12, 10),
    ('P0037', 60, 5, 10),
    ('P0038', 25, 8, 5),
    ('P0039', 50, 20, 10),
    ('P0040', 45, 40, 5),
    ('P0041', 40, 6, 15),
    ('P0042', 20, 10, 5),
    ('P0043', 80, 40, 15),
    ('P0044', 15, 34, 5),
    ('P0045', 30, 30, 10),
    ('P0046', 70, 12, 10),
    ('P0047', 60, 5, 10),
    ('P0048', 25, 8, 5),
    ('P0049', 50, 20, 10),
    ('P0050', 45, 40, 5);


SELECT * FROM STOCK;

INSERT INTO ORDERS (OID, ODATE, PID, CID, OQTY)
VALUES
	('O0001', '2024-10-10', 'P0001', 'C0001', 5),
	('O0002', '2024-10-12', 'P0002', 'C0002', 3),
	('O0003', '2024-10-15', 'P0003', 'C0003', 4),
	('O0004', '2024-10-18', 'P0004', 'C0004', 2),
	('O0005', '2024-10-20', 'P0005', 'C0005', 6),
	('O0006', '2024-10-22', 'P0006', 'C0006', 1),
	('O0007', '2024-10-25', 'P0007', 'C0007', 2),
	('O0008', '2024-10-26', 'P0008', 'C0008', 3),
	('O0009', '2024-10-27', 'P0009', 'C0009', 5),
	('O0010', '2024-10-28', 'P0010', 'C0010', 4),
	('O0011', '2024-10-29', 'P0021', 'C0006', 3),
	('O0012', '2024-10-30', 'P0022', 'C0007', 4),
	('O0013', '2024-10-31', 'P0011', 'C0011', 6),
	('O0014', '2024-11-01', 'P0023', 'C0008', 5),
	('O0015', '2024-11-02', 'P0015', 'C0015', 4),
	('O0016', '2024-11-03', 'P0024', 'C0009', 2),
	('O0017', '2024-11-04', 'P0025', 'C0010', 6),
	('O0018', '2024-11-06', 'P0026', 'C0011', 1),
	('O0019', '2024-11-07', 'P0020', 'C0020', 6),
	('O0020', '2024-11-07', 'P0027', 'C0012', 3),
	('O0021', '2024-11-08', 'P0021', 'C0006', 3),
	('O0022', '2024-11-08', 'P0028', 'C0013', 2),
	('O0023', '2024-11-09', 'P0022', 'C0007', 4),
	('O0024', '2024-11-09', 'P0029', 'C0014', 4),
	('O0025', '2024-11-10', 'P0023', 'C0008', 5),
	('O0026', '2024-11-10', 'P0030', 'C0015', 5),
	('O0027', '2024-11-11', 'P0024', 'C0009', 2),
	('O0028', '2024-11-12', 'P0025', 'C0010', 6),
	('O0029', '2024-11-13', 'P0031', 'C0016', 4),
	('O0030', '2024-11-14', 'P0032', 'C0017', 3),
	('O0031', '2024-11-15', 'P0033', 'C0018', 2),
	('O0032', '2024-11-16', 'P0034', 'C0019', 1),
	('O0033', '2024-11-17', 'P0035', 'C0020', 6),
	('O0034', '2024-11-18', 'P0036', 'C0021', 4),
	('O0035', '2024-11-19', 'P0037', 'C0022', 3),
	('O0036', '2024-11-20', 'P0038', 'C0035', 4),
    ('O0037', '2024-11-21', 'P0039', 'C0036', 3),
    ('O0038', '2024-11-22', 'P0040', 'C0037', 2),
    ('O0039', '2024-11-23', 'P0041', 'C0038', 5),
    ('O0040', '2024-11-24', 'P0042', 'C0039', 1);
   
SELECT *FROM ORDERS;

-----------------------------CREATING A BILL VIEW -----------------------

CREATE VIEW Bill AS
SELECT ORDERS.OID, ORDERS.ODATE, CUST.CNAME, CUST.ADDRESS, CUST.PHONE, PRODUCT.PDESC, PRODUCT.PRICE, ORDERS.OQTY, (ORDERS.OQTY * PRODUCT.PRICE) AS AMOUNT
FROM ORDERS          ------------ORDERS table has both CID and PID -------------
INNER JOIN CUST
	ON ORDERS.CID = CUST.CID
INNER JOIN PRODUCT
	ON ORDERS.PID = PRODUCT.PID;

DROP VIEW BILL;------------RUN BECAUSE OF CHANGES IN INSERT QUERY ---------

SELECT * FROM Bill;

-----------------------------PROCEDURE FOR TABLES-------------------------

------------FOR SUPPLIER-------------

CREATE PROCEDURE AddSupplier (
    @SID CHAR(5),
    @SNAME VARCHAR(50),
    @SADD VARCHAR(100),
    @SCITY VARCHAR(50) = 'DELHI', -- Default value for SCITY
    @SPHONE VARCHAR(15),
    @EMAIL VARCHAR(50)
)
AS
BEGIN
    SET NOCOUNT ON;
    IF @SCITY IS NULL OR @SCITY = ''
		 BEGIN
			SET @SCITY = 'DELHI';
		END

    INSERT INTO SUPPLIER 
    VALUES (@SID, @SNAME, @SADD, @SCITY, @SPHONE, @EMAIL);

    SELECT * FROM SUPPLIER WHERE SID = @SID;
END;


ADDSupplier 'S0051','SytGuru Pharma','07,Nari Road','','9890067895','sytgurupharma@gmail.com';

EXEC AddSupplier 'S0052', 'Ace Technology', '17, Maple Road',NULL, '9889836495', 'sytgurupharma@gmail.com';

SELECT *FROM supplier


-------------------FOR PRODUCT--------------

CREATE PROCEDURE AddProduct(
 @PID CHAR(5),
 @PDESC VARCHAR(100),
 @PRICE DECIMAL(10, 2),
 @CATEGORY VARCHAR(50),
 @SID CHAR(5)
)
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO PRODUCT 
	VALUES
		(@PID,@PDESC, @PRICE, @CATEGORY, @SID)

	SELECT  *FROM PRODUCT WHERE PID= @PID;
END

SELECT * FROM PRODUCT;

AddProduct 'P0051','Thermometer','1000.98','HC','S0051';

-------------------FOR CUSTOMER ---------------

CREATE PROCEDURE AddCust (
    @cid CHAR(5),
    @cname VARCHAR(50),
    @address VARCHAR(100),
    @city VARCHAR(50),
    @phone VARCHAR(15),
    @email VARCHAR(50),
    @dob DATE
)
AS
BEGIN
	SET NOCOUNT ON;
	-- Validate that DOB is before January 1, 2000
    IF @dob >= '2000-01-01'
    BEGIN
        RAISERROR ('Date of Birth must be before January 1, 2000.', 16, 1);
        RETURN;
    END
    INSERT INTO CUST 
    VALUES (@cid, @cname, @address, @city, @phone, @email, @dob);
    SELECT * FROM CUST WHERE CID = @cid;
END;

SELECT * FROM CUST;

AddCust 'C0056','Mansi Wasnik','57, Nari Road','Nagpur','9890056784','mansiwasnik0@gmail.com','2003-08-23';

-------------------FOR ORDERS ---------------

SELECT CAST (GETDATE() AS DATE); ------------------ TO GET TODAYS DATE 

CREATE PROCEDURE AddOrder (
    @oid CHAR(5),
	@odate DATE,
    @pid CHAR(5),
    @cid CHAR(5),
    @oqty INT
)
AS
BEGIN
	SET NOCOUNT ON;
	 IF @odate IS NULL OR @odate= ''
    BEGIN
        SET @odate = CAST(GETDATE()AS Date );
    END
    INSERT INTO ORDERS
    VALUES (@oid, @odate, @pid, @cid, @oqty);
    SELECT * FROM ORDERS WHERE OID = @oid;
END;

SELECT *FROM ORDERS;

DROP PROCEDURE AddOrder; ------------------  DROP ONCE TO DO CHANGES IN PROCEDURE FOR NULL AND EMPTY ODATE

AddOrder 'O0041',NULL,'P0051','C0054','15';

EXEC AddOrder 'O0042','','P0049','C0027','20';

DELETE FROM  ORDERS  
WHERE OID='O0041';

-------------FUNCTION FOR AUTOGENERATION OF FIVE CHARACHTER ALPHA NUMERIC ID-----------------

------------create sequence--------------

CREATE SEQUENCE MYSEQ
AS INT
START WITH 1
INCREMENT BY 1
CACHE 5
CYCLE;

----------------Creating Function to call in Procedure--------------------

create function GENID(@C CHAR(1), @I INT)  -------------- @C IS CHARACTER SUPPOSE 'S' , 'O' ETC FROM TABLE FOR ID AND @I IS INTEGER FOR NUMBER 1,19,20 ETC
RETURNS CHAR(5) ----------RETURN OUTPUT C0001 OR O0001 ETC IN FIVE DIGIT 
AS
BEGIN
	DECLARE @R CHAR(5);   ------- Used to store the character prefix (@C) along with leading zeros (e.g., S000).
	DECLARE @ID CHAR(5); ----------Stores the final alphanumeric ID that will be returned.

	SELECT @R= CASE	
					WHEN @I<10 THEN CONCAT(@C,'000')
					WHEN @I<100 THEN CONCAT(@C,'00')
					WHEN @I<1000 THEN CONCAT(@C,'0')
					WHEN @I<10000 THEN @C        ------------------------- @C = 'S' and @I = 7 → @R = 'S000'.
					ELSE 'NULL'
				END;

			SET @ID=RTRIM(@R) + LTRIM(CONVERT(CHAR(4),@I));    
			RETURN @ID;                   ---------------------------The function returns the alphanumeric ID.
END;

-------------------RECREATE PROCEDURE FOR AUTOMATIC ID CREATION USING FUNCTION AND SEQUENCE----------------

----------FOR SUPPLIER TABLE---------

DROP PROCEDURE AddSupplier; ------------DROP PREVIOUS PROCEDURE FOR AUTOMATIC ID GENERATION

CREATE PROCEDURE AddSupplier (
    @SNAME VARCHAR(50),
    @SADD VARCHAR(100),
    @SCITY VARCHAR(50) = 'DELHI', -- Default value for SCITY
    @SPHONE VARCHAR(15),
    @EMAIL VARCHAR(50)
)
AS
BEGIN
    SET NOCOUNT ON;
    IF @SCITY IS NULL OR @SCITY = '' ---------- Ensure SCITY defaults to 'DELHI' if NULL or empty
    BEGIN
        SET @SCITY = 'DELHI';
    END;

    DECLARE @MaxID INT; -- Get the max SID number and generate a new ID
    SELECT @MaxID = COALESCE(MAX(CAST(SUBSTRING(SID, 2, 4) AS INT)), 0) FROM SUPPLIER; -- To Get the current maximum ID in the SID column

	----COALESCE function is used in the query to handle the case where there might not be any existing records in the table so that id will not be null but 'S0001'.
	----SUBSTRING(SID, 2, 4) is used to Extracts a substring from the SID column starting at the 2nd character and taking the next 4 characters, ex- SID = 'S0005', SUBSTRING(SID, 2, 4) gives 0005
	----CAST(... AS INT):Converts the extracted substring (e.g., '0005') into an integer (e.g., 5).
	----MAX(...):Finds the maximum numeric value in the extracted SID values.

 
    DECLARE @NewSID CHAR(5) = DBO.GENID('S', @MaxID + 1); ----- Generate a new SID using GENID function

    INSERT INTO SUPPLIER
    VALUES (@NewSID, @SNAME, @SADD, @SCITY, @SPHONE, @EMAIL);

    SELECT * FROM SUPPLIER;
END;

ADDSupplier 'Sicrama Infotech','07,Nari Road','Nagpur','8923467844','sicramainfotech@gmail.com';

-------------------FOR PRODUCT--------------

DROP PROCEDURE AddProduct;

CREATE PROCEDURE AddProduct(
 @PDESC VARCHAR(100),
 @PRICE DECIMAL(10, 2),
 @CATEGORY VARCHAR(50),
 @SID CHAR(5)
)
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @MaxID INT;
	SELECT @MaxID= COALESCE(MAX(CAST(SUBSTRING(PID,2,4) AS INT)),0) FROM PRODUCT; 
	DECLARE @NewPID CHAR(5) = DBO.GENID('P', @MaxID +1);

	INSERT INTO PRODUCT 
	VALUES
		(@NewPID,@PDESC, @PRICE, @CATEGORY, @SID)

	SELECT  *FROM PRODUCT;
END

SELECT * FROM PRODUCT;

AddProduct 'Heater ','3549.00','HA','S0037';

AddProduct 'Motherboard ','8000.00','IT','S0006';

-------------------FOR CUSTOMER ---------------

DROP PROCEDURE AddCust;

CREATE PROCEDURE AddCust (
    @cname VARCHAR(50),
    @address VARCHAR(100),
    @city VARCHAR(50),
    @phone VARCHAR(15),
    @email VARCHAR(50),
    @dob DATE
)
AS
BEGIN
	SET NOCOUNT ON;
	-- Validate that DOB is before January 1, 2000
    IF @dob >= '2000-01-01'
    BEGIN
        RAISERROR ('Date of Birth must be before January 1, 2000.', 16, 1);
        RETURN;
    END

	DECLARE @MaxID INT;
	SELECT @MaxID= COALESCE(MAX(CAST(SUBSTRING(CID,2,4) AS INT)),0) FROM CUST; 
	DECLARE @NewCID CHAR(5) = DBO.GENID('C', @MaxID +1);

    INSERT INTO CUST 
    VALUES (@NewCID, @cname, @address, @city, @phone, @email, @dob);
    SELECT * FROM CUST;
END;

SELECT * FROM CUST;

AddCust 'Mansi Wasnik','57, Nari Road','Nagpur','9890056784','mansiwasnik0@gmail.com','1999-08-23';

-------------------FOR ORDERS ---------------

DROP PROCEDURE AddOrder;

SELECT CAST (GETDATE() AS DATE); ------------------ TO GET TODAYS DATE 

CREATE PROCEDURE AddOrder (
    @pid CHAR(5),
    @cid CHAR(5),
    @oqty INT
)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @MaxID INT;
	SELECT @MaxID= COALESCE(MAX(CAST(SUBSTRING(OID,2,4) AS INT)),0) FROM ORDERS; 
	DECLARE @NewOID CHAR(5) = DBO.GENID('O', @MaxID +1);
    
	DECLARE @ODate DATE = GETDATE();

	INSERT INTO ORDERS
    VALUES (@NewOID, @ODate, @pid, @cid, @oqty);
    SELECT * FROM ORDERS;
END;

SELECT *FROM ORDERS;

AddOrder 'P0027','C0008','15';


-------------------------------------------METHOD 2 FOR AUTOGENERATED ID ---------------

CREATE SEQUENCE PRODUCTSEQ
AS INT
START WITH 56  
--PREVIOUSLY I USE MYSEQ FOR ALL PROCEDURE WITH START 1 THEREFORE THERE WERE ISSUE WHEN GENERATING ID AS IT START WITH 1 SO, NOW START WITH 56 TO CONTIBUE DATA ENTRY IN PRODUCT TABLE
INCREMENT BY 1;

DROP PROCEDURE AddProduct;

CREATE PROCEDURE ADDPRODUCT(
 @PDESC VARCHAR(100),
 @PRICE DECIMAL(10, 2),
 @CATEGORY VARCHAR(50),
 @SID CHAR(5)
 )
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @I CHAR(5);
	SET @I=DBO.GENID('P', NEXT VALUE FOR PRODUCTSEQ);
	
	INSERT INTO PRODUCT 
	VALUES (@I,@PDESC,@PRICE,@CATEGORY,@SID);

	SELECT * FROM PRODUCT WHERE PID=@I;
END;

AddProduct 'Antibiotics','5670.60','HC','S0035';

AddProduct 'Tableware','2000.13','HA','S0051';

SELECT * FROM PRODUCT
WHERE PID='P0052';

SELECT * FROM PRODUCT
WHERE PID='P0053';

SELECT * FROM PRODUCT
WHERE PID='P0054';


----------------OTHER PROCEDURE CAN ALSO BE CREATED IN SAME WAY, ONLY HAVE TO CREATE SEQUENCE FOR EACH TABLE WITH (START WITH X ) OF ENTRY BY LOOKING AT DATA ENTER IN THAT TABLE 

----------------CREATING TRIGGERS FOR AUTOMATIC VALUE UPDATION IN DATA BASED ON ORDERS-----------

-------------Trigger to Update the Stock When a Product is Sold------------

CREATE TRIGGER tr_update_stock
ON ORDERS
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    
    UPDATE STOCK
    SET SQTY = SQTY - i.OQTY
    FROM STOCK
    INNER JOIN INSERTED i
    ON STOCK.PID = i.PID;
    
    PRINT 'Stock updated after product sold.';
END;

SELECT *FROM ORDERS;
SELECT *FROM STOCK;

AddOrder 'P0001','C0018','3'; ------Place this order and it deducted 3 product from sqty from 50 to 47-------

-------------Trigger to Delete the Order if the Product is Deleted from Inventory-------

CREATE TRIGGER trg_delete_order_on_product_delete
ON PRODUCT
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    
    DELETE FROM ORDERS
    WHERE PID IN (SELECT PID FROM DELETED);
    
    PRINT 'Orders deleted because the product was removed from inventory.';
END;

select *from product;

DELETE FROM PRODUCT WHERE PID = 'P0058';

----------------Trigger to Update the Stock When the Order Quantity is Updated-----------

CREATE TRIGGER trg_Update_stock_on_order_update
ON ORDERS
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    
    UPDATE STOCK
    SET SQTY = SQTY + (d.OQTY - i.OQTY) -- Adjust stock quantity
    FROM STOCK
    INNER JOIN DELETED d ON STOCK.PID = d.PID
    INNER JOIN INSERTED i ON STOCK.PID = i.PID;
    
    PRINT 'Stock updated after order quantity modification.';
END;

UPDATE ORDERS 
SET OQTY = 10 
WHERE OID = 'O0044';

SELECT * FROM ORDERS;

SELECT * FROM STOCK WHERE PID = 'P0001'; -----FIRST WE PLACE ORDER FOR 3 QTY THEN UPDATE IT TO 10 THEREFORE IT UPDATD IN STOCK FROM 50->47->40


