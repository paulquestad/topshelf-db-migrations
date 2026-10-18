# Purchasing and sales permissions — prepared 2026-10-18

App PR #17 in paulquestad/topshelf-os connects legacy PurchaseOrders/PurchaseOrderLines and Proposals/ProposalLines. 20261018_500_purchasing_sales_permissions.sql contains the same eight scoped GRANT statements as app db/008_purchasing_sales.sql. The read-only companion PURCHASING-SALES-PREFLIGHT.sql inspects current definitions, existing grants and tax distributions.

Not applied. Paul must run the preflight and grant bundle manually in Workbench against TopShelfDeveloper, report success, then deploy the feature/installs-purchasing-sales staging API/Gateway before merging frontend. Do not run both canonical and app bundles as separate setup steps; they represent the same permissions. No ledger entry is synthesized for manual execution.

No schema/data changes, DELETE, production permissions, credentials or contact rows. Receiving/source/actor/email/QuickBooks/inventory fields are read-only in edits; new POs insert false integration flags. Existing document values remain intact. Pricing/financial access remains owner level 5 plus write scope for mutations. No automated email, inventory or QuickBooks side effects.

TaxPercent encoding and ShippingAddressID resolution require explicit business verification. Print preview makes tax interpretation and PDF delivery address explicit rather than rewriting old values. Actual schema compatibility and authenticated acceptance remain separate from isolated CI.
