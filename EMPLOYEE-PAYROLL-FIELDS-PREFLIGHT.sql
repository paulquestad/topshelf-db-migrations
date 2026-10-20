-- Read only. Reports formats and counts, never values, so existing data can be checked against the new validation.
SELECT DATABASE(),CURRENT_USER();
SELECT COUNT(*) AS employees,
       SUM(SSN IS NOT NULL AND SSN <> '') AS with_ssn,
       SUM(SSN REGEXP '^[0-9]{3}-[0-9]{2}-[0-9]{4}$') AS ssn_dashed,
       SUM(SSN REGEXP '^[0-9]{9}$') AS ssn_digits_only,
       SUM(BankAccountNumber IS NOT NULL AND BankAccountNumber <> '') AS with_account,
       SUM(BankAccountNumber REGEXP '^[0-9]{4,17}$') AS account_digits_only,
       SUM(RoutingNumber IS NOT NULL AND RoutingNumber <> '') AS with_routing,
       SUM(RoutingNumber REGEXP '^[0-9]{9}$') AS routing_9_digits,
       SUM(PayRate IS NOT NULL) AS with_pay_rate
FROM TopShelfDeveloper.Employees;
-- Account type values in use (these are categories such as Checking/Savings, not account numbers).
SELECT AccountType, COUNT(*) AS employees FROM TopShelfDeveloper.Employees GROUP BY AccountType;
