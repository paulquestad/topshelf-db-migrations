-- Read only. Expect: no TopShelfOSAccess table yet, and Employees.ID is an INT primary key (needed for the link).
SELECT DATABASE(), CURRENT_USER();
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'TopShelfDeveloper' AND TABLE_NAME = 'TopShelfOSAccess';
SELECT COLUMN_NAME, COLUMN_TYPE, COLUMN_KEY FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'TopShelfDeveloper' AND TABLE_NAME = 'Employees' AND COLUMN_NAME = 'ID';
SELECT COUNT(*) AS employees, SUM(COALESCE(Inactive,0) = 0) AS active_employees, SUM(email IS NOT NULL AND email <> '') AS with_email FROM TopShelfDeveloper.Employees;
