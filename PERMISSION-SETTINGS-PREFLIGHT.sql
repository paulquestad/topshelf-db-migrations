-- Read only. Expect: no TopShelfOSPermissionLevels table yet.
SELECT DATABASE(), CURRENT_USER();
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'TopShelfDeveloper' AND TABLE_NAME = 'TopShelfOSPermissionLevels';
