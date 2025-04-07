-- Make sure you're in the correct database
USE ProgramDatabase;
GO

-- Drop the trigger if it exists to avoid duplication errors
IF OBJECT_ID('trg_AuditReports', 'TR') IS NOT NULL
    DROP TRIGGER trg_AuditReports;
GO

-- Create a trigger that prints a message after a report is inserted
CREATE TRIGGER trg_AuditReports
ON Reports
AFTER INSERT
AS
BEGIN
    PRINT '✅ New report has been added.';
END;
GO

-- Optional: Insert test data to trigger the message
-- (Only use this during testing. You can comment it out in production.)

-- INSERT INTO Reports (ProgramID, ReportDate, SubmittedTo)
-- VALUES (1, GETDATE(), 'Trigger Test - Donor');
-- GO
