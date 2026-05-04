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
            when id_estacion = '4' then 'Pza. de España'
            when id_estacion = '8' then 'Escuelas Aguirre'
            when id_estacion = '11' then 'Avda. Ramón y Cajal'
            when id_estacion = '16' then 'Arturo Soria'
            when id_estacion = '17' then 'Villaverde'
            when id_estacion = '18' then 'Farolillo'
            when id_estacion = '24' then 'Casa de Campo'
            when id_estacion = '27' then 'Barajas Pueblo'
            when id_estacion = '35' then 'Pza. del Carmen'
            when id_estacion = '36' then 'Moratalaz'
            when id_estacion = '38' then 'Cuatro Caminos'
            when id_estacion = '39' then 'Barrio del Pilar'
            when id_estacion = '40' then 'Vallecas'
            when id_estacion = '47' then 'Mendez Alvaro'
            when id_estacion = '48' then 'Castellana'
            when id_estacion = '49' then 'Parque del Retiro'
            when id_estacion = '50' then 'Plaza Castilla'
            when id_estacion = '54' then 'Ensanche de Vallecas'
            when id_estacion = '55' then 'Urb. Embajada'
            when id_estacion = '56' then 'Pza. Elíptica'
            when id_estacion = '57' then 'Sanchinarro'
            when id_estacion = '58' then 'El Pardo'
            when id_estacion = '59' then 'Juan Carlos I'
            when id_estacion = '60' then 'Tres Olivos'
            else 'Estación ' || id_estacion
        end as nombre_estacion
    from staging_data
)

select * from final