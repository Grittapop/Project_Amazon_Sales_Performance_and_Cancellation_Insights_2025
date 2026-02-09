{{ config(
    materialized='incremental',
    unique_key='order_id'
    ) 
}}

SELECT
    *
FROM
    {{ ref('int_sales_keyed') }}

{% if is_incremental() %}
    WHERE date > (
        SELECT MAX(date)
        FROM {{ this }}
    )
{% endif %}
