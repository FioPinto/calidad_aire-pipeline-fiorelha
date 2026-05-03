select
    id_medicion,
    id_fecha
from {{ ref('fct_meteo_horario') }}
where id_fecha > current_date()