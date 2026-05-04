# Proyecto Inicial

## Descripción

Este proyecto es una práctica para afianzar conocimientos sobre Snowflake y Dbt. Consiste en una base de datos creada a partir de unos archivos csv sobre la calidad del aire que proveinen del catalogo de datos datos.gob.es, los culaes se modelaran en fases hasta conseguir datos enriquecidos para usar en análisis.

## Instrucciones

Se creará un bucket s3 en AWS en el cual se subirán los archivos csv encontrados sobre la calidad del aire.

Ahora, en Snowflake se creará una base de datos, esquemas y un stage externo el cual se configurará a ese bucket s3. Se pasará del stage externo a una tabla raw configurada con un formato de archivo y con la cual se crearán nuestras tablas.

Al usar la herramienta `dbt_core` junto con la extensión de dbt para Visual Studio Code se crean las carpetas necesarias para un proyecto dbt a partir del comando `dbtf init`.

Una vez ejecutado ese comando pedirá que se configure la conexión a la base de datos de Snowflake, se introducirán los credenciales además de especificar que base de datos, esquema y warehouse debe usar.

## Lista de modelos

1. Capa de Staging (staging)

Modelos que limpian y dan formato básico a los datos crudos (raw).

    stg_madrid_meteo: Magnitudes y su valor que se recopilaron por cada hora en diferentes estaciones.

    stg_magnitudes: Información sobre las magnitudes.

2. Capa Intermedia (intermediate)

Modelos que limpian las tablas de staging.

    int_estaciones_limpio: Limpieza de la tabla de estaciones.
    
    int_meteo_unpivoted: Se convierten las 24 coumnas de horas en filas.

3. Capa de Marts (marts)

Tablas finales optimizadas para el análisis y consumo en herramientas de BI (como Power BI).

    dim_estaciones: Dimensión de estaciones

    dim_magnitudes: Dimensión de magnitudes

    dim_tiempo: Dimensión de tiempo

    fct_alertas_viento: Tabla de hechos que asigna niveles de alerta por concentración.

    fct_meteo_horario: Tabla de hechos que contiene todas las mediciones normalizadas

## Decisiones de diseño personales

1. Normalización mediante técnica de Unpivot

Los datos originales del Ayuntamiento de Madrid presentan las horas en columnas horizontales (H01...H24). Se decidió transformar esta estructura a un formato largo (long format).
Aunque la tabla resultante tiene más filas, facilita mucho la creación de una dimensión temporal única y permite que las herramientas de análisis como Power BI realicen promedios y máximos horarios con una sola medida, sin necesidad de fórmulas complejas por cada columna.

2. Implementación de Lógica de Alertas vía Macros

En lugar de escribir los umbrales de alerta directamente en el SQL del modelo, se ha encapsulado la lógica en una macro reutilizable `get_alert_level`.

Esto permite que, si en el futuro la normativa de salud ambiental cambia los límites del Benceno, solo sea necesario actualizar la macro en un único punto para que el cambio se replique en todos los modelos y tests que la utilicen.