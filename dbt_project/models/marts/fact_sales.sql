{{ config(
    materialized='incremental',
    unique_key='order_id'
    ) 
}}

SELECT
    order_id,
    {{ reconstruct_date_weird('date') }} as date,
    product_key,
    quantity,
    total_sales,
    customer_key,
    location_key,
    payment_key,
    status_key
FROM
    {{ ref('int_sales_keyed') }}

{% if is_incremental() %}
    WHERE date > (
        SELECT MAX(date)
        FROM {{ this }}
    )
{% endif %}
