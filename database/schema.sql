-- Use master to disconnect from target DB first
USE master;
GO

-- Drop and recreate the database
IF DB_ID('ProgramDatabase') IS NOT NULL
BEGIN
    ALTER DATABASE ProgramDatabase SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE ProgramDatabase;
END
GO

CREATE DATABASE ProgramDatabase;
GO

USE ProgramDatabase;
GO

-- Drop tables if they already exist (in reverse dependency order)
DROP TABLE IF EXISTS Reports;
DROP TABLE IF EXISTS VehiclesEquipment;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS ImplementationAgencies;
DROP TABLE IF EXISTS Programs;
DROP TABLE IF EXISTS Budgets;
DROP TABLE IF EXISTS Donors;
GO

-- Donors Table
CREATE TABLE Donors (
    DonorID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(255) NOT NULL,
    ContactInfo TEXT
);

-- Budgets Table (depends on Donors)
CREATE TABLE Budgets (
    BudgetID INT PRIMARY KEY IDENTITY(1,1),
    ProgramID INT NULL,
    Amount DECIMAL(12,2),
    Currency VARCHAR(10),
    DisbursementDate DATE,
    DonorID INT,
    FOREIGN KEY (DonorID) REFERENCES Donors(DonorID) ON DELETE SET NULL
);

-- Programs Table (depends on Budgets)
CREATE TABLE Programs (
    ProgramID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    StartDate DATE,
    EndDate DATE,
    BudgetID INT,
    FOREIGN KEY (BudgetID) REFERENCES Budgets(BudgetID) ON DELETE SET NULL
);

-- Employees Table (depends on Programs)
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(255) NOT NULL,
    Role VARCHAR(100),
    AssignedProgramID INT,
    FOREIGN KEY (AssignedProgramID) REFERENCES Programs(ProgramID) ON DELETE SET NULL
);

-- Implementation Agencies Table
CREATE TABLE ImplementationAgencies (
    AgencyID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(255) NOT NULL,
    ContactInfo TEXT
);

-- Vehicles & Equipment Table (depends on Programs)
CREATE TABLE VehiclesEquipment (
    AssetID INT PRIMARY KEY IDENTITY(1,1),
    AssetType VARCHAR(100),
    AssignedProgramID INT,
    FOREIGN KEY (AssignedProgramID) REFERENCES Programs(ProgramID) ON DELETE CASCADE
);

-- Reports Table (depends on Programs)
CREATE TABLE Reports (
    ReportID INT PRIMARY KEY IDENTITY(1,1),
    ProgramID INT,
    ReportDate DATE,
    SubmittedTo TEXT,
    FOREIGN KEY (ProgramID) REFERENCES Programs(ProgramID) ON DELETE CASCADE
);

-- phase 2 



-- Add a CHECK constraint to Budgets
ALTER TABLE Budgets
ADD CONSTRAINT CHK_Amount_Positive CHECK (Amount > 0);

-- Add DEFAULT to Employees.Role
ALTER TABLE Employees
ADD CONSTRAINT DF_Employees_Role DEFAULT 'Staff' FOR Role;

-- Add an INDEX on Program StartDate for performance
CREATE INDEX IX_Programs_StartDate ON Programs(StartDate);
