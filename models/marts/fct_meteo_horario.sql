{{ config(
    materialized='incremental',
    unique_key='id_medicion',
    incremental_strategy='merge',
    tags=['incremental']
) }}

with base as (
    select * from {{ ref('int_meteo_unpivoted') }}
)

select
    {{ dbt_utils.generate_surrogate_key(['estacion', 'magnitud', 'fecha', 'hora']) }} as id_medicion,
    estacion as id_estacion,
    magnitud as id_magnitud,
    fecha as id_fecha,
    hora,
    CAST(valor AS FLOAT) AS valor,
    loaded_at
from base

{% if is_incremental() %}
  where loaded_at > {{ get_max_loaded_at(this) }}
{% endif %}