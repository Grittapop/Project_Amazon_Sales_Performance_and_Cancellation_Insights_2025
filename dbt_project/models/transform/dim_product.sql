with distinct_products as (

    select distinct
        "Product" as product,    
        "Category"  as category
    from {{ ref("raw_product") }}

)

select
    row_number() over (order by product) as product_key,
    product,
    category
from distinct_products