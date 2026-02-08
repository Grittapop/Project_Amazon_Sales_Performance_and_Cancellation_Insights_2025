WITH distinct_payment as (

    SELECT DISTINCT
        payment_method as payment    
    FROM 
        {{ ref('int_sales_renamed') }}
)

SELECT
    row_number() over (order by payment) as payment_key,
    payment
FROM 
    distinct_payment