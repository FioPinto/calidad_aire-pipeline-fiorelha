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

2. Capa Intermedia (intermediate)

3. Capa de Marts (marts)


## Decisiones de diseño personales

