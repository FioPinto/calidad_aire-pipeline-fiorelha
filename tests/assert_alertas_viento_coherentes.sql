select
    id_medicion,
    velocidad_viento,
    nivel_alerta
from {{ ref('fct_alertas_viento') }}
where (nivel_alerta = 'ROJO' and velocidad_viento <= 70)
   or (nivel_alerta = 'NARANJA' and velocidad_viento <= 50)