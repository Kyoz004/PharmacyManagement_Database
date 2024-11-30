# Pharmacy Management System

## Overview

The **Pharmacy Management System** is a relational database designed to streamline and manage the business and inventory operations of a pharmacy. It ensures efficient handling of products, suppliers, customers, employees, and sales while maintaining accurate records.

---

## Features

### 1. Product Management
- Store and manage information about medications and medicinal ingredients.
- Maintain detailed data on usage, dosage, side effects, and preparation from medicinal ingredients.

### 2. Inventory Management
- Track batches of products with production details such as batch ID, manufacturing date, and expiry date.
- Record stock entries with supplier and employee details.

### 3. Sales Management
- Generate sales invoices for customer purchases.
- Record product details, quantities, total value, and payment methods.

### 4. Supplier Management
- Maintain supplier details including names, addresses, and contact information.

### 5. Customer Management
- Store customer details including personal information, registration date, and purchase history.

### 6. Employee Management
- Record employee details such as start date, position, contact information, and work history.

---

## Database Schema

The system is built on a relational database using TSQL in **SQL Server Management Studio**. Key tables include:
1. **Products**: For managing medications and medicinal ingredients.
2. **Batches**: For tracking product batches.
3. **Suppliers**: For storing supplier details.
4. **Employees**: For managing staff information.
5. **Customers**: For recording customer data and purchase history.
6. **Sales Invoices**: For storing sales transactions.
7. **Stock Entries**: For logging inventory additions.

---

## Installation

1. Install **SQL Server Management Studio (SSMS)**.
2. Clone or download the project repository.
3. Open the `.sql` file in SSMS and execute the script to create the database and tables.

---

## Usage

1. Use the provided SQL scripts to insert sample data into the tables.
2. Run queries to:
   - Manage inventory.
   - Generate invoices.
   - Retrieve customer purchase history.
   - Analyze sales and supplier performance.

---

## Example Queries

### Query 1: List Medications for a Specific Disease
```sql
SELECT 
    m.MedicationName, 
    d.DiseaseName 
FROM 
    Medications m
JOIN 
    MedicationDisease md ON m.MedicationID = md.MedicationID
JOIN 
    Diseases d ON md.DiseaseID = d.DiseaseID
WHERE 
    d.DiseaseName = 'Hypertension';
```

## Contributing
We welcome contributions to enhance the Pharmacy Management System! To contribute:

- Fork the repository.
- Create a new branch for your feature or bug fix.
- Submit a pull request with a detailed description.
