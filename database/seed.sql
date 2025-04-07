USE ProgramDatabase;
GO

-- Insert Donors
INSERT INTO Donors (Name, ContactInfo)
VALUES 
    ('UNICEF', 'contact@unicef.org'),
    ('World Bank', 'info@worldbank.org');

-- Insert a Budget
INSERT INTO Budgets (ProgramID, Amount, Currency, DisbursementDate, DonorID)
VALUES (NULL, 500000, 'USD', '2024-02-15', 1);

-- Insert Program
INSERT INTO Programs (Name, Description, StartDate, EndDate, BudgetID)
VALUES ('Education Support', 'School funding for children', '2024-01-01', '2024-12-31', 1);

-- Insert Employees
INSERT INTO Employees (Name, Role, AssignedProgramID)
VALUES ('John Doe', 'Supervisor', 1);

-- Insert Reports
INSERT INTO Reports (ProgramID, ReportDate, SubmittedTo)
VALUES (1, '2024-03-01', 'Donor, Head Office');

--  Insert Programs
INSERT INTO Programs (Name, Description, StartDate, EndDate, BudgetID)
VALUES ('Health Access', 'Provide mobile clinics', '2024-01-01', '2024-12-31', NULL);



-- View Inserted Data
SELECT * FROM Donors;
SELECT * FROM Budgets;
SELECT * FROM Programs;
SELECT * FROM Employees;
SELECT * FROM Reports;
