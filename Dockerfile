FROM apache/airflow:3.1.7 

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       gcc \
       python3-distutils \
       libpython3-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER airflow

COPY --chown=airflow . .

RUN pip install dbt-postgres==1.10.0

RUN dbt deps --project-dir /opt/airflow/dbt_project
