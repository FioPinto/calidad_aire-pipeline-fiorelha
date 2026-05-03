select
    id_medicion,
    concentracion,
    nivel_alerta
from {{ ref('fct_alertas_viento') }}
where 
    (nivel_alerta = 'ROJO' and concentracion <= 10.0)
    or (nivel_alerta = 'NARANJA' and (concentracion <= 5.0 or concentracion > 10.0))
    or (nivel_alerta = 'AMARILLO' and (concentracion <= 2.0 or concentracion > 5.0))
    or (nivel_alerta = 'VERDE' and concentracion > 2.0)