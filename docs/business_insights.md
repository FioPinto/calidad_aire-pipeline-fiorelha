# Insights cuantitativos

### Pico de Contaminación Extremo
    
Se ha identificado una concentración máxima de 9.9 ug/m3, lo que supone casi 20 veces el umbral de alerta roja (0.5 ug/m3) definido en el modelo. Este valor representa un evento crítico de calidad del aire.

### Rango Operativo Completo

La amplitud de los datos registrados varía desde los 0 ug/m3 hasta los 9.9 ug/m3, demostrando una alta volatilidad en las mediciones anuales.

### Concentraciones cero

El valor mínimo de 0 ug/m3 sugiere periodos de aire limpio o, más probablemente, periodos de inactividad de los sensores, especialmente si coinciden con los patrones detectados en la hora H13".

# Propuestas de mejora

### Protocolo de Emergencia para Picos

Dado que existen registros cercanos a 10 ug/m3, se debe crear una 'Alerta Violeta' o de Emergencia, ya que el actual sistema solo escala hasta el nivel Rojo (0.5), quedando corto para categorizar la gravedad de un 9.9.

### Auditoría de Valores Cero

Investigar si los valores 0 son reales. Si se confirma que son fallos de lectura, se propone implementar una lógica de 'Null handling' en dbt para no sesgar los promedios anuales hacia abajo.

### Plan de Acción por Superación de Límites: 

Establecer un sistema de notificaciones automáticas (webhooks) cuando la columna concentracion supere el valor de 5.0 por más de dos horas consecutivas.

# Anomalia encontrada

### El Salto Térmico del Benceno

Resulta altamente inesperado encontrar valores de 9.9 ug/m3 en un dataset donde la gran mayoría de los registros son inferiores a 1.0. Este patrón sugiere un evento puntual extremo (como un incendio cercano a la estación, una fuga industrial o un atasco masivo excepcional) o bien un error de calibración del sensor que genera 'outliers' (valores atípicos) que deben ser aislados para no distorsionar las estadísticas generales.