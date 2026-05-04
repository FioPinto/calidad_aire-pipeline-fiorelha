{{ config(
    materialized='incremental',
    unique_key='id_estacion',
    incremental_strategy='merge',
    tags=['incremental']
) }}

select
    id_estacion,
    nombre_estacion,
    municipio,
    provincia,
    current_timestamp() as updated_at
from {{ ref('int_estaciones_limpio') }}

{% if is_incremental() %}
    where updated_at > (select max(updated_at) from {{ this }})
{% endif %}