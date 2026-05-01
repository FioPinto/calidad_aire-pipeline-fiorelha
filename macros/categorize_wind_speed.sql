{% macro categorize_wind_speed(column_name) %}

    case 
        when {{ column_name }} > 70 then 'ROJO'
        when {{ column_name }} > 50 then 'NARANJA'
        when {{ column_name }} > 30 then 'AMARILLO'
        else 'SIN ALERTA'
    end

{% endmacro %}