# Inventory_Management_System
SQL script to create an Inventory Database with tables for Suppliers, Products, Customers, Orders, and Stock. Includes data insertion and table deletion.

**Tables:**

1.  **SUPPLIER:** Stores information about suppliers.
    *   Columns: `SID`, `SNAME`, `SADD`, `SCITY`, `SPHONE`, `EMAIL`
    *   Primary Key: `SID`
    *   Unique Constraint: `SPHONE`
    *   Default Value: `SCITY` defaults to 'DELHI'

2.  **PRODUCT:** Stores information about products.
    *   Columns: `PID`, `PDESC`, `PRICE`, `CATEGORY`, `SID`
    *   Primary Key: `PID`
    *   Foreign Key: `SID` (references `SUPPLIER.SID`)
    *   Check Constraints:
        *   `PRICE` must be greater than 0.
        *   `CATEGORY` must be one of 'IT', 'HA', or 'HC'.

3.  **STOCK:** Stores stock levels for products.
    *   Columns: `PID`, `SQTY`, `ROL`, `MOQ`
    *   Primary Key: `PID` (also a foreign key)
    *   Foreign Key: `PID` (references `PRODUCT.PID`)
    *   Check Constraints:
        *   `SQTY` must be greater than or equal to 0.
        *   `ROL` must be greater than 0.
        *   `MOQ` must be greater than or equal to 5.

4.  **CUST (Customer):** Stores customer information.
    *   Columns: `CID`, `CNAME`, `ADDRESS`, `CITY`, `PHONE`, `EMAIL`, `DOB`
    *   Primary Key: `CID`
    *   Check Constraint: `DOB` must be before '01-JAN-2000'.

5.  **ORDERS:** Stores order information.
    *   Columns: `OID`, `ODATE`, `PID`, `CID`, `OQTY`
    *   Primary Key: `OID`
    *   Foreign Keys:
        *   `PID` (references `PRODUCT.PID`)
        *   `CID` (references `CUST.CID`)
    *   Check Constraint: `OQTY` must be greater than or equal to 1.

*   The script also includes `INSERT` statements to populate the tables with sample data and `DROP TABLE` statements at the end to remove the tables.
