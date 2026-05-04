# Ingesta de datos

## Problemas

Al haberme basado en los archivos csv de mis datos para conseguir la dimensión de tiempo me dí cuenta de que, debido a que no es incremental, los datos de fechas no se actualizan.

## Soluciones

Al indagar ví que es de mala práctica hacer la dimensión de fechas incremental, que debería haberla generado con un script.