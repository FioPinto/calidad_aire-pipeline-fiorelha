with staging_data as (
    select * from {{ ref('stg_madrid_meteo') }}
),

unpivoted as (
    select
        estacion,
        magnitud,
        ano,
        mes,
        dia,
        to_date(ano || '-' || mes || '-' || dia, 'YYYY-MM-DD') as fecha,
        replace(hora_col, 'H', '')::int as hora,
        valor_medicion as valor,
        loaded_at
    from staging_data
    unpivot (
        valor_medicion for hora_col in (
            h01, h02, h03, h04, h05, h06, h07, h08, h09, h10, 
            h11, h12, h13, h14, h15, h16, h17, h18, h19, h20, 
            h21, h22, h23, h24
        )
    )
)

select * from unpivoted