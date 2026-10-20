# Lists & Pricing — prepared 2026-10-20

Matches app `db/015_lists_pricing.sql` (paulquestad/topshelf-os, `feature/lists-pricing`), files 970–985:
- 970–972: Services gets `IsActive` (default 1) and `SortOrder`. Testing (7) and Rough In Test (9) are retired, and the others get SortOrder = ID × 10. These are additive columns with defaults. Access and the live sync triggers don't use them.
- 973–977: SELECT/INSERT/UPDATE (no DELETE) on Services, Subdivisions, Cities, BathAccPartNumbers and ShowerDoorPartNumbers.
- 978–985: SELECT on the dropdown tables those lists use.

Not applied. Run either the app bundle or these files, not both. 970 is DDL; if it fails partway, check the columns before retrying.
