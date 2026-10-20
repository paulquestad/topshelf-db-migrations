-- Read only. Expect the nine services, JobServices keyed by (JobID, ServiceID), and no triggers on JobServices here.
SELECT DATABASE(), CURRENT_USER();
SELECT ID, ServiceName FROM TopShelfDeveloper.Services ORDER BY ID;
SELECT INDEX_NAME, GROUP_CONCAT(COLUMN_NAME ORDER BY SEQ_IN_INDEX) AS columns FROM INFORMATION_SCHEMA.STATISTICS
WHERE TABLE_SCHEMA = 'TopShelfDeveloper' AND TABLE_NAME = 'JobServices' AND INDEX_NAME = 'PRIMARY' GROUP BY INDEX_NAME;
SELECT TRIGGER_NAME FROM INFORMATION_SCHEMA.TRIGGERS WHERE TRIGGER_SCHEMA = 'TopShelfDeveloper' AND EVENT_OBJECT_TABLE IN ('JobServices','Jobs');
SELECT COUNT(*) AS job_service_rows, SUM(CompletedDate IS NULL AND InstallDate >= CURDATE()) AS upcoming_installs FROM TopShelfDeveloper.JobServices;
