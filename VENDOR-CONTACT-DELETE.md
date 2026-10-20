# Vendor and contact delete permissions — prepared 2026-10-20

App PR in paulquestad/topshelf-os (`feature/vendor-contact-delete`) lets owners (level 5) delete vendors and vendor contacts. `20261020_600_vendors_delete.sql` and `20261020_601_contacts_delete.sql` hold the same two GRANT statements as app `db/009_vendor_contact_delete.sql`. The read-only companion `VENDOR-CONTACT-DELETE-PREFLIGHT.sql` shows current definitions and grants, every foreign key that points at Vendors or Contacts, and how many contacts are shared between a customer and a vendor.

Not applied. Paul runs the preflight and then either the app bundle or these two files in Workbench against TopShelfDeveloper. Do not run both: they grant the same permissions. No ledger entry is synthesized for manual execution.

The schema inventory of 2026-10-20 showed only two references: Contacts.VendorID (ON DELETE CASCADE) and PurchaseOrders.VendorID (ON DELETE RESTRICT). Nothing references Contacts. The API refuses a vendor that is used on purchase orders or has a contact shared with a customer, refuses a contact shared with a customer, checks the row version, deletes vendor contacts explicitly in the same transaction and audits every delete. DELETE is granted on Vendors and Contacts only. No schema or data changes and no production permissions.
