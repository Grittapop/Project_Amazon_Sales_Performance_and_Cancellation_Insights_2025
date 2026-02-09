{% snapshot stg_amazon_sales_scd %}
{{
    config(
        target_schema='dbt_stg',
        unique_key='"Order ID"',
        strategy='check',
        check_cols='all',
        invalidate_hard_deletes=True
    )
}}

SELECT 
    * 
FROM 
    {{ source('postgres', 'amazon_sales_data') }}
{% endsnapshot %}