{{ config(materialized='view') }}

with magnitudes_static as (
    select 1 as id_magnitud, 'Dioxido de Nitrogeno' as descripcion, 'ug/m3' as unidad_medida union all
    select 6, 'Monoxido de Carbono', 'mg/m3' union all
    select 7, 'Monoxido de Nitrogeno', 'ug/m3' union all
    select 8, 'Dioxido de Azufre', 'ug/m3' union all
    select 9, 'Particulas PM2.5', 'ug/m3' union all
    select 10, 'Particulas PM10', 'ug/m3' union all
    select 12, 'Oxido de Nitrogeno', 'ug/m3' union all
    select 14, 'Ozono', 'ug/m3' union all
    select 20, 'Tolueno', 'ug/m3' union all
    select 30, 'Benceno', 'ug/m3' union all
    select 35, 'Etilbenceno', 'ug/m3' union all
    select 81, 'Velocidad del viento', 'm/s' union all
    select 82, 'Dirección del viento', 'Grados' union all
    select 83, 'Temperatura', 'ºC' union all
    select 86, 'Humedad relativa', '%' union all
    select 87, 'Presión barométrica', 'mb' union all
    select 88, 'Radiación solar', 'W/m2' union all
    select 89, 'Precipitación', 'l/m2'
)

select * from magnitudes_static