{{ config(
    materialized='ephemeral',
    )
}}

SELECT
    "Order ID"           as order_id,
    "Date"               as date,
    "Product"            as product,
    "Category"           as category,
    "Price"              as price,
    "Quantity"           as quantity,
    "Total Sales"        as total_sales,
    "Customer Name"      as customer_name,
    "Customer Location"  as location,
    "Payment Method"     as payment_method,
    "Status"             as status
FROM
    {{ref('stg_amazon_sales')}}