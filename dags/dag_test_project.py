from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime,timedelta

default_args = {
    "owner": "airflow",
    "retries": 1,
    "retry_delay": timedelta(minutes=2),
}

with DAG(
    dag_id="dbt_pipeline",
    default_args=default_args,
    description="Run dbt models and tests",
    schedule="@daily",  
    start_date=datetime(2026, 2, 7),
    catchup=False,
    tags=["dbt"],
) as dag:

    dbt_deps = BashOperator(
        task_id="dbt_deps",
        bash_command="""
        dbt deps --project-dir /opt/airflow/dbt_project
        """,
    )

    dbt_run = BashOperator(
        task_id="dbt_run",
        bash_command="""
        dbt run --project-dir /opt/airflow/dbt_project
        """,
    )

    dbt_deps >> dbt_run 