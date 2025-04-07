-- Create login and user
CREATE LOGIN program_user WITH PASSWORD = 'StrongPass123!';
CREATE USER program_user FOR LOGIN program_user;

-- Grant limited permissions
GRANT SELECT, INSERT ON Programs TO program_user;
GRANT SELECT ON Budgets TO program_user;

-- (Optional) Revoke permissions
-- REVOKE DELETE ON Programs FROM program_user;
