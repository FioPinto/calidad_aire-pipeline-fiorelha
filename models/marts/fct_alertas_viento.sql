{{ config(
    materialized='incremental',
    unique_key='id_medicion',
    incremental_strategy='merge',
    tags=['incremental']
) }}

select
    id_medicion,
    id_estacion,
    id_fecha,
    hora,
    valor as concentracion,
    {{ get_alert_level('valor') }} as nivel_alerta,
    loaded_at
from {{ ref('fct_meteo_horario') }}
where id_magnitud = 30
  and valor >=0

{% if is_incremental() %}
  and loaded_at > (select max(loaded_at) from {{ this }})
{% endif %}