WITH distinct_status as (

    SELECT DISTINCT
        status   
    FROM 
        {{ ref('int_sales_renamed') }}
)

SELECT
    row_number() over (order by status) as status_key,
    status
FROM 
    distinct_status