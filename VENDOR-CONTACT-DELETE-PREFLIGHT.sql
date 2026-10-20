-- Read only: confirm the vendor/contact links the delete checks rely on before granting DELETE.
SELECT DATABASE(),CURRENT_USER();
SHOW CREATE TABLE TopShelfDeveloper.Vendors;
SHOW CREATE TABLE TopShelfDeveloper.Contacts;
SHOW CREATE TABLE TopShelfDeveloper.PurchaseOrders;
SHOW GRANTS FOR 'topshelf_staging_api'@'%';
-- Every foreign key that points at Vendors or Contacts (expected: Contacts.VendorID CASCADE, PurchaseOrders.VendorID RESTRICT).
SELECT k.TABLE_NAME,k.COLUMN_NAME,k.REFERENCED_TABLE_NAME,r.DELETE_RULE
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE k
JOIN INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS r ON r.CONSTRAINT_SCHEMA=k.CONSTRAINT_SCHEMA AND r.CONSTRAINT_NAME=k.CONSTRAINT_NAME
WHERE k.TABLE_SCHEMA='TopShelfDeveloper' AND k.REFERENCED_TABLE_NAME IN ('Vendors','Contacts');
-- Contacts shared by a customer and a vendor; the app will not delete these.
SELECT COUNT(*) AS SharedContacts FROM TopShelfDeveloper.Contacts WHERE CustomerID IS NOT NULL AND VendorID IS NOT NULL;
