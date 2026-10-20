-- Read only. Expect: no IsActive/SortOrder columns on Services yet, and the row counts of each list.
SELECT DATABASE(), CURRENT_USER();
SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'TopShelfDeveloper' AND TABLE_NAME = 'Services' AND COLUMN_NAME IN ('IsActive','SortOrder');
SELECT (SELECT COUNT(*) FROM TopShelfDeveloper.Services) AS services, (SELECT COUNT(*) FROM TopShelfDeveloper.Subdivisions) AS subdivisions,
       (SELECT COUNT(*) FROM TopShelfDeveloper.Cities) AS cities, (SELECT COUNT(*) FROM TopShelfDeveloper.BathAccPartNumbers) AS bath_parts,
       (SELECT COUNT(*) FROM TopShelfDeveloper.ShowerDoorPartNumbers) AS shower_door_parts;
-- Which list IDs number themselves (auto_increment) — the app numbers the others itself.
SELECT TABLE_NAME, EXTRA FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'TopShelfDeveloper' AND COLUMN_NAME = 'ID'
  AND TABLE_NAME IN ('Services','Subdivisions','Cities','BathAccPartNumbers','ShowerDoorPartNumbers');
