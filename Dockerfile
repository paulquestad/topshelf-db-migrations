FROM python:3.12-slim
WORKDIR /app
RUN pip install --no-cache-dir pymysql==1.1.1
COPY runner.py /app/runner.py
COPY migrations /app/migrations
RUN useradd --uid 10001 --create-home migrator
USER migrator
CMD ["python", "/app/runner.py"]
