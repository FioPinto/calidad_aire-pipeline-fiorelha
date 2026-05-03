# Resumen final

## Objetivo del proyecto

El objetivo de este proyecto fue conseguir información sobre una magnitud específica, la concentración de benceno, de unos archivos csv los cuales se habián subido a un bucket s3, por lo cual se hizo el proceso automático de limpieza de datos.
En este proyecto se ha concentrando en el desarrollo de una pipeline desde un bucket s3 de AWS que pase por snowflake de archivos csv a una tabla con los datos en formato string para ser procesados luego en dbt, donde se modelará tablas incrementales, y que produzcan un dashboard.

## Decisiones principales

Al decidir que base de datos usaría encontré varios datos de calidad del aire de diferentes años. Para conseguir el objetivo de 500.000 líneas de datos en principio busqué 3 archivos de diferentes años para juntarlos, pero los archivos no eran lo suficientemente grandes. No me dí cuenta de esto hasta después de haber analizado sus columnas del archivo y pensado en que tablas crear.

Al final encontré un zip de archivos de un año que me serviría ya que al normalizar las columnas de horas que eran individuales conseguiría más filas. Sin embargo no me dí cuenta de que ya no traían la magnitud de velocidad de viento, la cual pensaba usar en un principio, aún así como usan la misma convención de magnitudes pude escoger otra que me interesó.

## Aprendizaje

Con esta práctica aprendí que en snowflake una pipeline depende de usar funciones de mensajería de AWS que no me había dado cuenta de que no tenía activadas, por lo cual usé un task a la que le asginé un horario.