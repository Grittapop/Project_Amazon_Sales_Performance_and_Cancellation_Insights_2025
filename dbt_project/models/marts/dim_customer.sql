WITH distinct_customer as (
    SELECT DISTINCT
        customer_name as customer
    FROM 
    {{ ref('int_sales_renamed') }}
)

SELECT
    row_number() over (order by customer) as customer_key,
    customer
FROM 
    distinct_customer