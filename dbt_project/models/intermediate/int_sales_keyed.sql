{{ config(
    materialized='ephemeral',
    )
}}

SELECT
    isr.order_id,
    isr.date,
    dpr.product_key,
    isr.quantity,
    isr.total_sales,
    dc.customer_key,
    dl.location_key,
    dpa.payment_key,
    ds.status_key
    

FROM {{ ref('int_sales_renamed') }} isr

LEFT JOIN {{ ref('dim_product') }} dpr
    ON isr.product = dpr.product

LEFT JOIN {{ ref('dim_customer') }} dc
    ON isr.customer_name = dc.customer

LEFT JOIN {{ ref('dim_location') }} dl
    ON isr.location = dl.location

LEFT JOIN {{ ref('dim_payment') }} dpa
    ON isr.payment_method = dpa.payment

LEFT JOIN {{ ref('dim_status') }} ds
    ON isr.status = ds.status
