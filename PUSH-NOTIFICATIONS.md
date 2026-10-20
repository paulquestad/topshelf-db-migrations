# Push notifications tables — prepared 2026-10-20

Matches app `db/018_push_notifications.sql` (paulquestad/topshelf-os, `feature/push-notifications`):
- **20261021_100:** creates `TopShelfOSPushSubscriptions`, one row per phone or browser with schedule notifications on.
- **20261021_101:** creates `TopShelfOSPushKeys`, the API's signing key pair, made by the API on first use.
- **20261021_102–103:** grants the API SELECT/INSERT/UPDATE/DELETE on the first table and SELECT/INSERT on the second.

The file names start a new date prefix so they sort after `20261020_995`. No existing tables change, and nothing has been applied yet. Run either the app bundle or these files, not both.
