# Punch-list staging grants

Companion app PR: https://github.com/paulquestad/topshelf-os/pull/13 (feature/punch-lists).

Immutable migrations 20261018_400–402 are three column-scoped grants equivalent to app db/007_punch_lists.sql. Read-only preflight: db/007_punch_lists_preflight.sql. Reuse existing PunchItems/PunchCategories and Jobs links; no schema/data/password change. JobID update, legacy actor updates, catalog writes, DELETE and DDL are not granted. API additionally enforces read level 3, write level 4, and billing mutation level 5 plus staging scopes.

Manual Workbench execution is pending. Run either this set or the equivalent app bundle, never both. Record actual non-sensitive results and do not synthesize ledger entries for manual execution. Existing audit/job/customer privileges remain prerequisites. Do not replay earlier 004/005/006 bundles or any schema dump.

Activation: preflight/grants → new staging API/Gateway routes → frontend publication → authenticated existing-job, complete/reopen, stale-write and billing-permission checks. No production execution is authorized. This repository's inspected publication workflow is manual image publication only; merging source does not execute SQL. Preserve existing rows and flags on rollback.
