# Additional job material grants

Twelve immutable one-statement staging migrations, 20261018_200 through 20261018_211, support MiscServices, ShowerDoors and tblHG subforms and their lookup tables/keys. They match app db/005_more_job_materials.sql (statement comparison verified 2026-10-18). Read-only preflight: db/005_more_job_materials_preflight.sql.

Paul confirmed both Workbench scripts succeeded on 2026-10-18 at 09:35 Pacific. He subsequently reported the staging API deployment succeeded; app PR #10 merged as 2a60fcc and he reports the six-tab job form looks good. This is user-confirmed manual execution, not a directly queried/synthesized topshelf_schema_migrations ledger. Do not replay grants solely because a runner record is absent.

No table definitions, data or passwords changed. No new write access to heavy-glass Price/Multiplier, dimension/OOPL arrays, NotHG classification or catalog tables. Sizing/pricing calculations remain future work. No production execution was authorized or performed. Merging these source files does not run SQL; the inspected workflow is manual image publication only.
