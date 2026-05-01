{{ config(
    materialized='incremental',
    unique_key='id_medicion',
    incremental_strategy='merge'
) }}

select
    id_medicion,
    id_estacion,
    id_fecha,
    hora,
    valor as velocidad_viento,
    {{ categorize_wind_speed('valor') }} as nivel_alerta,
    loaded_at
from {{ ref('fct_meteo_horario') }}
where id_magnitud = 81 and valor > 30

{% if is_incremental() %}
  where loaded_at > (select max(loaded_at) from {{ this }})
{% endif %}