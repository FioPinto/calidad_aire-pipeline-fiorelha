with source as (
    select * from {{ source('madrid_meteo_raw', 'STG_METEO_HORIZONTAL') }}
),

final as (
    select
        provincia,
        municipio,
        estacion,
        magnitud,
        ano,
        mes,
        dia,
        h01, h02, h03, h04, h05, h06,
        h07, h08, h09, h10, h11, h12,
        h13, h14, h15, h16, h17, h18,
        h19, h20, h21, h22, h23, h24,
        source_file_name,
        loaded_at
    from source
)

select * from final