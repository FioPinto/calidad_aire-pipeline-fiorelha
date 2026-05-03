with dates as (
    select distinct fecha from {{ ref('int_meteo_unpivoted') }}
)

select
    fecha as id_fecha,
    year(fecha) as ano,
    month(fecha) as mes,
    day(fecha) as dia,
    dayname(fecha) as dia_semana,
    quarter(fecha) as trimestre,
    case when dayname(fecha) in ('Sat', 'Sun') then true else false end as es_fin_de_semana
from dates