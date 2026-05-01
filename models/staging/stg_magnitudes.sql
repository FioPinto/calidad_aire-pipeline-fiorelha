with magnitudes_static as (
    select 81 as id_magnitud, 'Velocidad del viento' as descripcion, 'm/s' as unidad_medida union all
    select 82, 'Dirección del viento', 'Grados' union all
    select 83, 'Temperatura', 'ºC' union all
    select 86, 'Humedad relativa', '%' union all
    select 87, 'Presión barométrica', 'mb' union all
    select 88, 'Radiación solar', 'W/m2' union all
    select 89, 'Precipitación', 'l/m2'
)

select * from magnitudes_static