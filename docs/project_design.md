# Documento de diseño

## Descripción del dominio

Esta base de datos cuenta con información sobre la calidad del aire por cada hora del año 2022 de la Comunidad de Madrid. Su dominio es de Salud Pública y Medio Ambiente Urbano.

El Benceno es un hidrocarburo aromático volátil, clasificado como cancerígeno, cuya presencia en el aire urbano proviene principalmente de las emisiones del tráfico y la combustión de combustibles fósiles. El problema reside en la dificultad de monitorizar picos de contaminación en tiempo real para tomar decisiones preventivas. Este proyecto busca centralizar y procesar las mediciones horarias de las estaciones de control de Madrid para identificar situaciones de riesgo.

## Preguntas analíticas que responde

Responde a preguntas como "¿Cuál es la frecuencia y severidad de las alertas de calidad del aire?", "¿Existe un patrón donde la concentración de Benceno supere los límites legales?" y "¿Qué estaciones de medición obtienen una mayor recurrencia de niveles de alerta `Naranja` o `Rojo` a lo largo del año?".

## Esquema dimensional

![modelo esquema](/images/modelo_esquema.png)

## Decisión de elección de fuente de datos

Elegí esta fuente de datos debido a que me interesa saber que calidad tiene el aire y como cambia a través del año, en este proyecto se centra en la concentración de benceno en el aire. Escogí especificamente los datos del año 2022 porque eran los que tenían mayor cantidad de datos y los más recientres.

## Estrategia de carga incremental

Solo se procesan los registros cuya fecha de carga, `loaded_at`, sea posterior a la fecha máxima ya existente en el modelo.

Se usa la materialización incremental con estrategia merge. Esto evita la duplicidad de datos y permite actualizar registros existentes si hubiera correcciones en el origen, manteniendo la integridad mediante la unique_key `id_medicion`.

Esta estrategia reduce el tiempo de ejecución y el consumo de créditos, ya que no re-procesa el histórico completo en cada ejecución.