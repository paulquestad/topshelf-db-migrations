FROM python:3.12-slim
WORKDIR /app
RUN pip install --no-cache-dir pymysql==1.1.1 'cryptography>=43,<47'
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates curl \
    && mkdir -p /app/certs \
    && curl --fail --show-error --silent --location https://truststore.pki.rds.amazonaws.com/global/global-bundle.pem -o /app/certs/global-bundle.pem \
    && test -s /app/certs/global-bundle.pem \
    && apt-get purge -y --auto-remove curl \
    && rm -rf /var/lib/apt/lists/*
COPY runner.py /app/runner.py
COPY migrations /app/migrations
RUN useradd --uid 10001 --create-home migrator
USER migrator
CMD ["python", "/app/runner.py"]
