-- Read only: confirm the links the customer/employee delete checks rely on before granting DELETE.
SELECT DATABASE(),CURRENT_USER();
SHOW GRANTS FOR 'topshelf_staging_api'@'%';
-- Every foreign key that points at Customers or Employees.
SELECT k.TABLE_NAME,k.COLUMN_NAME,k.REFERENCED_TABLE_NAME,r.DELETE_RULE
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE k
JOIN INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS r ON r.CONSTRAINT_SCHEMA=k.CONSTRAINT_SCHEMA AND r.CONSTRAINT_NAME=k.CONSTRAINT_NAME
WHERE k.TABLE_SCHEMA='TopShelfDeveloper' AND k.REFERENCED_TABLE_NAME IN ('Customers','Employees');
-- Each linking column the grant script names must exist (expect 15 rows).
SELECT TABLE_NAME,COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='TopShelfDeveloper' AND (TABLE_NAME,COLUMN_NAME) IN (('Jobs','CustomerID'),('Estimates','CustomerID'),('Proposals','CustomerID'),('Communications','CustomerID'),('HomeOwners','CustomerID'),('FloorPlans','CustomerID'),('Attachments','CustomerID'),('EmployeeHours','EmployeeID'),('DailyScheduleEmployees','EmployeeID'),('DailySchedulePerformanceRecords','EmployeeID'),('EmployeePaySchedules','EmployeeID'),('EmployeeFamily','EmployeeID'),('AspNetUsers','EmployeeID'),('AssetPMRecords','EmployeeID'),('UserPreferences','UserID'));
