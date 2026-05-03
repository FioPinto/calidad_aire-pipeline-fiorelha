{% macro get_alert_level(valor_col) %}
    case
        when {{ valor_col }} > 10.0 then 'ROJO'
        when {{ valor_col }} > 5.0  then 'NARANJA'
        when {{ valor_col }} > 2.0  then 'AMARILLO'
        else 'VERDE'
    end
{% endmacro %}