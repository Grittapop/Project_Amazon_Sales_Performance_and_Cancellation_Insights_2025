WITH distinct_location as (
    SELECT DISTINCT
        location    
    FROM 
        {{ ref('int_sales_renamed') }}
)

SELECT
    row_number() over (order by location) as location_key,
    location
FROM 
    distinct_location 