# Job services permissions — prepared 2026-10-20

Matches app `db/013_job_services.sql` (paulquestad/topshelf-os, `feature/job-services`). The staging API gets SELECT on Services, and SELECT/INSERT/UPDATE/DELETE on JobServices, which is now the master record for each service's order/install/completed/billed dates. No schema or data changes. Not applied. Run either the app bundle or these files, not both.
