# Customer and employee delete permissions — prepared 2026-10-20

App PR in paulquestad/topshelf-os (`feature/customer-employee-delete`) lets owners delete customers, customer contacts and employees. Files 700–716 hold the same 17 one-statement grants as app `db/010_customer_employee_delete.sql`: DELETE on Customers and Employees, plus SELECT on the one linking column per table that the API counts before deleting. The read-only `CUSTOMER-EMPLOYEE-DELETE-PREFLIGHT.sql` shows the current grants and foreign keys, and confirms that the 15 linking columns exist.

Not applied. Run the preflight, then either the app bundle or these files in Workbench against TopShelfDeveloper. Don't run both. No ledger entry is synthesized for manual execution.

The linking tables come from the live TopShelf schema inventory of 2026-10-20, covering both foreign keys and unenforced CustomerID/EmployeeID columns. The API refuses any linked customer or employee, as well as contacts shared between a customer and a vendor; it deletes a customer's own contacts in the same version-checked, audited transaction. Contacts DELETE came from 600–601. No schema or data changes and no production permissions.
