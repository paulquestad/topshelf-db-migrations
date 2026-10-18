# Jobs workspace staging grants

These one-statement migration files (20261018_100 through 20261018_120) grant scoped access for the Top Shelf OS Jobs workspace. They add no tables, alter no data, change no passwords and target only TopShelfDeveloper / topshelf_staging_api.

The app repository contains db/004_jobs_preflight.sql (read-only schema checks) and db/004_jobs_workspace.sql (the same grants combined for manual Workbench execution). Run preflight successfully first. Required existing table: TopShelfOSAudit from the people-workspace setup.

Execution is pending. Manual Workbench is the selected workflow. Record the actual executed statements, date and results; do not claim or synthesize runner ledger entries for manual execution. If these grants are later reconciled into runner history, inspect actual privileges and ledger checksums first. MySQL grants are additive and rerunnable, but must still be reviewed against the actual schema.

Read levels: jobs/materials level 3+; create/edit level 4+ with read/write scopes; private/billing note and bath standard price fields owner-only. No DELETE, DDL, catalog editing, legacy QB flag update or cross-schema privilege is introduced. Existing broader privileges are not revoked by these files.
