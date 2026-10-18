# Cloud job attachments — staging only

Companion application PR: https://github.com/paulquestad/topshelf-os/pull/11 (feature/job-attachments).

300 creates TopShelfDeveloper.TopShelfOSAttachments; 301 grants read-only access to existing legacy office-path metadata; 302 grants scoped cloud metadata reads/inserts/completion updates. Each file is one statement for the immutable runner. No legacy Attachments definitions/paths/data are changed. No production execution is authorized.

Run app db/006_job_attachments_preflight.sql before execution. Stop and reconcile if the cloud table already exists. The chosen manual Workbench alternative is app db/006_job_attachments.sql, which contains these same three statements. Execute one path only. Do not fabricate migration-ledger entries for manual execution. DDL can partially apply; inspect actual table/grants before retrying. Manual application is pending as of 2026-10-18.

Retain cloud metadata and files on rollback; do not drop them. Activation order: reviewed SQL → staging API/private S3 stack → frontend develop publication → signed-in photo/PDF/permission checks. Office-drive bulk copy and production rollout require separate copy/hash/count validation, backup/recovery and explicit production approval. See app docs/job-attachments.md and deploy/ATTACHMENTS-UPDATE.md.
