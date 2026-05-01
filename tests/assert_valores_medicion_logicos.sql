select
    id_medicion,
    valor
from {{ ref('fct_meteo_horario') }}
where (id_magnitud in (88, 89) and valor < 0)
   or (id_magnitud = 83 and (valor > 60 or valor < -40))