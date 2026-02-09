SELECT
    *
FROM
    {{ source('postgres', 'amazon_sales_data') }}
WHERE         
    "Order ID" IS NOT NULL   
