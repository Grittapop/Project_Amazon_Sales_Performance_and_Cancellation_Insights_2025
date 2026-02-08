SELECT
    "Product",
    "Category",
    "Price"
FROM
    {{ref('stg_amazon_sales')}}