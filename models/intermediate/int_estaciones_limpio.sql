with staging_data as (
    select distinct 
        estacion as id_estacion,
        municipio,
        provincia
    from {{ ref('stg_madrid_meteo') }}
),

final as (
    select
        id_estacion,
        municipio,
        provincia,
        case 
            when id_estacion = '102' then 'Casa de Campo'
            when id_estacion = '107' then 'Retiro'
            when id_estacion = '108' then 'Ciudad Universitaria'
            when id_estacion = '109' then 'Cuatro Vientos'
            else 'Estación ' || id_estacion
        end as nombre_estacion
    from staging_data
)

select * from final