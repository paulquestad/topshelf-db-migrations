# Permission settings — prepared 2026-10-20

Matches app `db/016_permission_settings.sql` (paulquestad/topshelf-os, `feature/permissions-screen`):
- **990:** creates the app-owned table `TopShelfOSPermissionLevels` (PermissionKey, Level 1–5, UpdatedBy, UpdatedAt). The owner's Permissions screen stores changed levels there.
- **991:** grants SELECT/INSERT/UPDATE/DELETE on it to the staging API.

No existing tables change. Not applied. Run either the app bundle or these files, not both.
