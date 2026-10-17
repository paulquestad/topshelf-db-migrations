import hashlib
import os
from pathlib import Path
import pymysql

EXPECTED_DB = "TopShelfDeveloper"
EXPECTED_USER = "topshelf_migrator"
MIGRATIONS = Path(__file__).parent / "migrations"

def main():
    if os.environ.get("EXPECTED_DATABASE") != EXPECTED_DB:
        raise SystemExit("Refusing non-development database")
    config = dict(host=os.environ["DB_HOST"], port=int(os.environ.get("DB_PORT", "3306")),
                  user=EXPECTED_USER, password=os.environ["DB_PASSWORD"],
                  database=EXPECTED_DB, charset="utf8mb4", autocommit=True)
    with pymysql.connect(**config) as conn:
        with conn.cursor() as cur:
            cur.execute("SELECT DATABASE(), CURRENT_USER()")
            database, user = cur.fetchone()
            if database != EXPECTED_DB or user.split("@")[0] != EXPECTED_USER:
                raise SystemExit("Database or authenticated user mismatch")
            cur.execute("CREATE TABLE IF NOT EXISTS schema_migrations (filename VARCHAR(255) PRIMARY KEY, sha256 CHAR(64) NOT NULL, applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP) ENGINE=InnoDB")
            cur.execute("SELECT filename, sha256 FROM schema_migrations")
            applied = dict(cur.fetchall())
            for path in sorted(MIGRATIONS.glob("*.sql")):
                sql = path.read_text(encoding="utf-8")
                checksum = hashlib.sha256(sql.encode("utf-8")).hexdigest()
                if path.name in applied:
                    if applied[path.name] != checksum:
                        raise SystemExit("Modified applied migration: " + path.name)
                    print("Already applied:", path.name)
                    continue
                statement = sql.strip().rstrip(";").strip()
                if not statement or ";" in statement:
                    raise SystemExit("One SQL statement required: " + path.name)
                print("Applying:", path.name, "to", EXPECTED_DB)
                cur.execute(statement)
                cur.execute("INSERT INTO schema_migrations(filename, sha256) VALUES (%s, %s)", (path.name, checksum))
    print("Migration run complete")

if __name__ == "__main__":
    main()
