-- Read only. Shows EmployeeHours' columns (names, types, defaults), any triggers on it, and counts, so the grants and
-- the app match the live table. Expect the columns used by db/017 to exist, and NeedsReview/Reviewed/EnergyTesting to accept 0.
SELECT DATABASE(), CURRENT_USER();
SELECT COLUMN_NAME, COLUMN_TYPE, IS_NULLABLE, COLUMN_DEFAULT, EXTRA FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = 'TopShelfDeveloper' AND TABLE_NAME = 'EmployeeHours' ORDER BY ORDINAL_POSITION;
SELECT TRIGGER_NAME, EVENT_MANIPULATION, ACTION_TIMING FROM INFORMATION_SCHEMA.TRIGGERS
  WHERE EVENT_OBJECT_SCHEMA = 'TopShelfDeveloper' AND EVENT_OBJECT_TABLE = 'EmployeeHours';
SELECT COUNT(*) AS entries, MIN(DateWorked) AS first_day, MAX(DateWorked) AS last_day,
       SUM(DateWorked >= CURDATE() - INTERVAL 14 DAY) AS last_two_weeks FROM TopShelfDeveloper.EmployeeHours;
