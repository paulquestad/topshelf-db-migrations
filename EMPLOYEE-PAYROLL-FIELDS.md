# Employee payroll and banking field permissions — prepared 2026-10-20

The app PR in paulquestad/topshelf-os (`feature/employee-payroll-fields`) adds owner-only payroll and banking fields to employee records. File 800 holds the same single grant as app `db/011_employee_payroll_fields.sql`: column-level SELECT/INSERT/UPDATE on Employees SSN, PayRate, BankAccountNumber, RoutingNumber and AccountType. Password, password_digest and DOB stay ungranted. The read-only `EMPLOYEE-PAYROLL-FIELDS-PREFLIGHT.sql` reports counts and formats only, never values.

Not applied. **Close the RDS firewall (0.0.0.0/0 on 3306) first.** Then run the preflight, followed by either the app bundle or this file in Workbench against TopShelfDeveloper. Don't run both. No ledger entry is synthesized for manual execution. No schema or data changes and no production permissions.
