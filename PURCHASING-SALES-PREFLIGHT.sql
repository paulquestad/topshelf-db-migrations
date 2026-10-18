-- Read only: verify current staging definitions before applying grants.
SELECT DATABASE(),CURRENT_USER();
SHOW CREATE TABLE TopShelfDeveloper.PurchaseOrders;
SHOW CREATE TABLE TopShelfDeveloper.PurchaseOrderLines;
SHOW CREATE TABLE TopShelfDeveloper.Proposals;
SHOW CREATE TABLE TopShelfDeveloper.ProposalLines;
SHOW CREATE TABLE TopShelfDeveloper.InventoryCategories;
SHOW CREATE TABLE TopShelfDeveloper.Estimates;
SHOW CREATE TABLE TopShelfDeveloper.Contacts;
SHOW GRANTS FOR 'topshelf_staging_api'@'%';
SELECT TaxPercent,COUNT(*) AS Records FROM TopShelfDeveloper.PurchaseOrders GROUP BY TaxPercent;
SELECT TaxPercent,COUNT(*) AS Records FROM TopShelfDeveloper.Proposals GROUP BY TaxPercent;
