{% macro get_max_loaded_at(target_table) %}

    {% set query %}
        select max(loaded_at) from {{ target_table }}
    {% endset %}

    {% set max_loaded = run_query(query).columns[0][0] %}

    {% if max_loaded %}
        '{{ max_loaded }}'
    {% else %}
        '1900-01-01'
    {% endif %}

{% endmacro %}