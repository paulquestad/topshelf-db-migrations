# Crew sign-ins — prepared 2026-10-20

The app PR in paulquestad/topshelf-os (`feature/crew-sign-ins`) adds Users & Access. Files 900–902 match app `db/012_crew_sign_ins.sql`:
- a new app-owned table, `TopShelfOSAccess`, linking each Cognito sign-in to one employee;
- SELECT/INSERT/UPDATE on that table;
- SELECT on Employees ID/FirstName/LastName/email/Inactive.

No changes to existing tables. The read-only `CREW-SIGN-INS-PREFLIGHT.sql` confirms the table doesn't exist yet. Not applied. Run either the app bundle or these files, not both.
