CREATE DATABASE ProgramDatabase;
USE ProgramDatabase;

-- Programs Table
CREATE TABLE Programs (
    ProgramID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    StartDate DATE,
    EndDate DATE,
    BudgetID INT,
    FOREIGN KEY (BudgetID) REFERENCES Budgets(BudgetID) ON DELETE SET NULL
);

-- Donors Table
CREATE TABLE Donors (
    DonorID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    ContactInfo TEXT
);

-- Implementation Agencies Table
CREATE TABLE ImplementationAgencies (
    AgencyID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    ContactInfo TEXT
);

-- Budgets Table
CREATE TABLE Budgets (
    BudgetID INT PRIMARY KEY AUTO_INCREMENT,
    ProgramID INT,
    Amount DECIMAL(12,2),
    Currency VARCHAR(10),
    DisbursementDate DATE,
    DonorID INT,
    FOREIGN KEY (ProgramID) REFERENCES Programs(ProgramID) ON DELETE CASCADE,
    FOREIGN KEY (DonorID) REFERENCES Donors(DonorID) ON DELETE SET NULL
);

-- Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Role VARCHAR(100),
    AssignedProgramID INT,
    FOREIGN KEY (AssignedProgramID) REFERENCES Programs(ProgramID) ON DELETE SET NULL
);

-- Vehicles & Equipment Table
CREATE TABLE VehiclesEquipment (
    AssetID INT PRIMARY KEY AUTO_INCREMENT,
    AssetType VARCHAR(100),
    AssignedProgramID INT,
    FOREIGN KEY (AssignedProgramID) REFERENCES Programs(ProgramID) ON DELETE CASCADE
);

-- Reports Table
CREATE TABLE Reports (
    ReportID INT PRIMARY KEY AUTO_INCREMENT,
    ProgramID INT,
    ReportDate DATE,
    SubmittedTo TEXT,
    FOREIGN KEY (ProgramID) REFERENCES Programs(ProgramID) ON DELETE CASCADE
);
