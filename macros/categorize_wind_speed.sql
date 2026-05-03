{% macro categorize_wind_speed(valor_col) %}
    case
        when {{ valor_col }} > 0.5 then 'ROJO'
        when {{ valor_col }} > 0.2 then 'NARANJA'
        else 'VERDE'
    end
{% endmacro %}