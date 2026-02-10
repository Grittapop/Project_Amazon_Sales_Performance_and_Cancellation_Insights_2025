{% macro reconstruct_date_weird(col_name) %}
    make_date(
        2000 + extract(day from {{ col_name }})::int,
        extract(month from {{ col_name }})::int,
        extract(year from {{ col_name }})::int
    )
{% endmacro %}