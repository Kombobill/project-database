SELECT p.ProgramID, p.Name AS ProgramName, p.Description, 
       b.Amount AS BudgetAmount, b.Currency, d.Name AS DonorName
FROM Programs p
LEFT JOIN Budgets b ON p.BudgetID = b.BudgetID
LEFT JOIN Donors d ON b.DonorID = d.DonorID;
--list of all programs with budget details

SELECT p.Name AS ProgramName, COUNT(e.EmployeeID) AS EmployeeCount
FROM Programs p
LEFT JOIN Employees e ON p.ProgramID = e.AssignedProgramID
GROUP BY p.Name;
--Count employees per program

SELECT p.Name AS ProgramName, v.AssetType 
FROM Programs p
JOIN VehiclesEquipment v ON p.ProgramID = v.AssignedProgramID;
--programs and assigned equipment

SELECT p.Name AS ProgramName, r.ReportDate, r.SubmittedTo
FROM Programs p
JOIN Reports r ON p.ProgramID = r.ProgramID;
--submitted reports log

SELECT d.Name AS DonorName, SUM(b.Amount) AS TotalBudget
FROM Donors d
JOIN Budgets b ON d.DonorID = b.DonorID
GROUP BY d.Name;
--total budget per donor

