WITH distinct_products as (

    SELECT DISTINCT
        product,    
        category,
        price
    FROM 
        {{ ref('int_sales_renamed') }}
)

SELECT
    row_number() over (order by product) as product_key,
    product,
    category,
    price
FROM 
    distinct_products