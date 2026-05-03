select
    id_magnitud,
    descripcion,
    unidad_medida
from {{ ref('stg_magnitudes') }}