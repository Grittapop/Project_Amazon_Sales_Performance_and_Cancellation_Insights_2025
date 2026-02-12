from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime,timedelta

default_args = {
    "owner": "airflow",
    "retries": 1,
    "retry_delay": timedelta(minutes=2),
}

with DAG(
    dag_id="amazon_sales_dbt_build",
    default_args=default_args,
    description="Run Amazon Sales dbt build",
    schedule='@daily',  
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

    dbt_build = BashOperator(
        task_id="dbt_build",
        bash_command="""
        dbt build --project-dir /opt/airflow/dbt_project
        """,
    )

    dbt_deps >> dbt_build 