-- Read only. Shows how many schedules exist and the current API grants on the schedule tables.
SELECT DATABASE(), CURRENT_USER();
SELECT COUNT(*) AS schedules, MIN(ScheduleDate) AS first_day, MAX(ScheduleDate) AS last_day, SUM(ScheduleDate >= CURDATE()) AS upcoming FROM TopShelfDeveloper.DailySchedules;
SELECT COUNT(*) AS stops, SUM(JobID IS NULL) AS stops_without_job FROM TopShelfDeveloper.DailyScheduleLines;
SELECT COUNT(*) AS vehicles, SUM(RetiredDate IS NULL) AS active_vehicles FROM TopShelfDeveloper.Assets;
SELECT TABLE_NAME, PRIVILEGE_TYPE FROM INFORMATION_SCHEMA.TABLE_PRIVILEGES WHERE GRANTEE LIKE '%topshelf_staging_api%' AND TABLE_NAME LIKE 'DailySchedule%';
