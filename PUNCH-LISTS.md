# Punch-list staging grants

Companion app PR: https://github.com/paulquestad/topshelf-os/pull/13 (feature/punch-lists).

Immutable migrations 20261018_400–402 are three column-scoped grants equivalent to app db/007_punch_lists.sql. Read-only preflight: db/007_punch_lists_preflight.sql. Reuse existing PunchItems/PunchCategories and Jobs links; no schema/data/password change. JobID update, legacy actor updates, catalog writes, DELETE and DDL are not granted. API additionally enforces read level 3, write level 4, and billing mutation level 5 plus staging scopes. A follow-up retires category UI while retaining existing fields/API contracts and grants for legacy compatibility.

Paul confirmed both 007 Workbench preflight and permission scripts succeeded on 2026-10-18 at 13:11 Pacific, then reported successful staging API deployment at 13:22. App PR #13 merged as 5d6bb37. These are user-confirmed reports; the migration ledger has not been directly queried. Run either this set or the equivalent app bundle, never both. Record actual non-sensitive results and do not synthesize ledger entries for manual execution. Existing audit/job/customer privileges remain prerequisites. Do not replay earlier 004/005/006 bundles or any schema dump.

Activation: preflight/grants → new staging API/Gateway routes → frontend publication → authenticated existing-job, complete/reopen, stale-write and billing-permission checks. No production execution is authorized. This repository's inspected publication workflow is manual image publication only; merging source does not execute SQL. Preserve existing rows and flags on rollback.
