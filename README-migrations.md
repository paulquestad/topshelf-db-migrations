# TopShelfDeveloper migration runner

Development-only manual ECS runner. Required environment variables: EXPECTED_DATABASE, DB_HOST, DB_PORT, DB_USER, DB_PASSWORD. Set EXPECTED_DATABASE to TopShelfDeveloper. Inject credentials through ECS Secrets Manager; never commit credentials. Add sequential immutable .sql files in migrations/, one SQL statement per file. Applied filenames and checksums are stored in schema_migrations. MySQL DDL is not generally transactional: review and back up before running. No GitHub Actions or automatic deployment included.
