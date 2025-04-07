-- 1. Join: Programs with their Budgets
SELECT p.Name AS ProgramName, b.Amount, b.Currency
FROM Programs p
INNER JOIN Budgets b ON p.BudgetID = b.BudgetID;

-- 2. Subquery: Employees in programs with a budget over 300,000
SELECT e.Name
FROM Employees e
WHERE AssignedProgramID IN (
    SELECT ProgramID FROM Budgets WHERE Amount > 300000
);

-- 3. GROUP BY and HAVING: Count programs per currency
SELECT b.Currency, COUNT(*) AS NumPrograms
FROM Budgets b
GROUP BY b.Currency
HAVING COUNT(*) > 0;

-- 4. CASE WHEN: Categorize program budgets
SELECT b.Amount,
       CASE
           WHEN b.Amount < 100000 THEN 'Low'
           WHEN b.Amount BETWEEN 100000 AND 500000 THEN 'Medium'
           ELSE 'High'
       END AS BudgetCategory
FROM Budgets b;

-- 5. Join: Reports submitted per program
SELECT p.Name, COUNT(r.ReportID) AS TotalReports
FROM Programs p
LEFT JOIN Reports r ON p.ProgramID = r.ProgramID
GROUP BY p.Name;
