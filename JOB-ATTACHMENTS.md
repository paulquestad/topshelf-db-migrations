# Cloud job attachments — staging only

Companion app PR #11 merged to develop as 6ccc81e. Immutable migrations 300–302 match app db/006_job_attachments.sql (statement comparison verified 2026-10-18).

300 creates TopShelfDeveloper.TopShelfOSAttachments; 301 grants read-only legacy Attachments metadata access; 302 grants scoped cloud metadata reads/inserts/completion updates. Existing Attachments definitions, paths and data remain unchanged.

Paul confirmed 006 preflight and setup succeeded in Workbench at 10:18 Pacific on 2026-10-18, then supplied successful staging API/storage deployment output at 10:40 Pacific. These are user-confirmed reports. Runner ledger entries have not been queried or synthesized. Do not execute these files again after the equivalent app bundle; especially do not replay CREATE TABLE. Reconcile actual state if interrupted DDL/grants are suspected.

Authenticated small photo/PDF upload, preview, download and refresh acceptance is still pending; anonymous HTTP 401 confirms the authentication boundary only. Retain metadata and object versions on rollback. Office-drive import, production rollout and retention require a separate copy/hash/count validation and explicit production approval. No production execution authorized. Merging source does not execute SQL: the inspected workflow only publishes an image when manually dispatched.
