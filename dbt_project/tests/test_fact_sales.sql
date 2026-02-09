SELECT 
    *
FROM 
    {{ ref('fact_sales') }}
WHERE 
    order_id NOT LIKE 'ORD%'